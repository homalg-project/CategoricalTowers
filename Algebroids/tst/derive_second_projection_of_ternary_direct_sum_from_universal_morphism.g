LoadPackage( "CompilerForCAP", ">= 2025.11-01", false );
LoadPackage( "Algebroids", false );

orig_CAP_JIT_LOGIC_TEMPLATES := ShallowCopy( CAP_JIT_LOGIC_TEMPLATES );

#
quiver := RightQuiver( "Q(a,b,c)[]" );

a := quiver.a;
b := quiver.b;
c := quiver.c;

#
F := FreeCategory( quiver );

SetRingFilter( UnderlyingQuiverAlgebra( F ), IsQuiverAlgebra );
SetRingElementFilter( UnderlyingQuiverAlgebra( F ), IsQuiverAlgebraElement );

a_F := SetOfObjects( F )[1];
b_F := SetOfObjects( F )[2];
c_F := SetOfObjects( F )[3];

#
ZZZ := HomalgRingOfIntegers( );
L := LinearClosure( ZZZ, F, ReturnTrue );
# This should automatically be set by `LinearClosure` if the underlying category has finite external homs,
# but there is no property for this yet.
SetIsLinearCategoryOverCommutativeRingWithFinitelyGeneratedFreeExternalHoms( L, true );

a_L := LinearClosureObject( L, a_F );
b_L := LinearClosureObject( L, b_F );
c_L := LinearClosureObject( L, c_F );

#
add := AdditiveClosure( L );

a_add := a_L / add;
b_add := b_L / add;
c_add := c_L / add;

# the second projection (up to a scalar multiple)
pi := BasisOfExternalHom( DirectSum( [ a_add, b_add, c_add ] ), b_add )[1];

dummy := DummyCategory( rec(
    list_of_operations_to_install := [
        "IsCongruentForMorphisms",
        "ZeroMorphism",
        "IdentityMorphism",
        "MultiplyWithElementOfCommutativeRingForMorphisms",
        "SumOfMorphisms",
        "DirectSum",
        "UniversalMorphismIntoDirectSumWithGivenDirectSum",
        "UniversalMorphismFromDirectSumWithGivenDirectSum",
    ],
    properties := [ "IsLinearCategoryOverCommutativeRing", "IsAbCategory" ],
    commutative_ring_of_linear_category := ZZZ,
) );

StopCompilationAtPrimitivelyInstalledOperationsOfCategory( dummy );

# map the quiver vertices a, b, and c to three dummy objects
DeclareGlobalFunction( "FunctorOnThreeVertices" );

CapJitAddTypeSignature( "FunctorOnThreeVertices", [ IsQuiverVertex, IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject ], function ( input_types )
    
    Assert( 0, input_types[2] = input_types[3] );
    Assert( 0, input_types[3] = input_types[4] );
    
    return input_types[2];
    
end );

InstallGlobalFunction( FunctorOnThreeVertices, function ( vertex, a_dummy, b_dummy, c_dummy )
    
    if IsIdenticalObj( vertex, a ) then
        
        return a_dummy;
        
    elif IsIdenticalObj( vertex, b ) then
        
        return b_dummy;
        
    elif IsIdenticalObj( vertex, c ) then
        
        return c_dummy;
        
    else
        
        Error( "this should never happen" );
        
    fi;
    
end );

func := function ( dummy, a_dummy, b_dummy, c_dummy, abc_dummy )
  local object_function_F, morphism_function_F, object_function_L, morphism_function_L, object_function_add, morphism_function_add, a_F, b_F, c_F, id_b_F, a_L, b_L, c_L, pi;
    
    # lift FunctorOnThreeVertices to F -> dummy
    object_function_F := function ( obj )
        
        return FunctorOnThreeVertices( UnderlyingVertex( obj ), a_dummy, b_dummy, c_dummy );
        
    end;
    
    morphism_function_F := function ( source, mor, range )
        
        # FIXME:
        # A native implementation of `FreeCategory` not relying on QPA would have lists of morphisms as morphism data.
        # We would then compose the images of those morphisms under FunctorOnThreeVertices. Since `FreeCategory` currently relies on QPA,
        # we cannot do this. Since in the example all morphisms of the free category are identity morphisms,
        # it is safe to simply return an identity morphism for this example.
        return IdentityMorphism( dummy, source );
        
    end;
    
    # lift FunctorOnThreeVertices further to L -> dummy
    object_function_L := function ( obj )
        
        return object_function_F( UnderlyingOriginalObject( obj ) );
        
    end;
    
    morphism_function_L := function ( source, mor, range )
      local coeffs, support, support_range;
        
        coeffs := CoefficientsList( mor );
        support := SupportMorphisms( mor );
        support_range := List( support, s -> morphism_function_F( object_function_F( Source( s ) ), s, object_function_F( Target( s ) ) ) );
        
        return LinearCombinationOfMorphisms( dummy, source, coeffs, support_range, range );
        
    end;
    
    # lift FunctorOnThreeVertices further to add -> dummy
    object_function_add := function ( A )
        local objs;
        
        objs := ObjectList( A );
        
        objs := List( objs, obj -> object_function_L( obj ) );
        
        return DirectSum( add, objs );
        
    end;
    
    morphism_function_add := function ( source, alpha, range )
        local source_diagram, range_diagram, listlist;
        
        source_diagram := List( ObjectList( Source( alpha ) ), obj -> object_function_L( obj ) );
        range_diagram := List( ObjectList( Target( alpha ) ), obj -> object_function_L( obj ) );
        
        listlist := List( [ 1 .. NrRows( alpha ) ], i -> List( [ 1 .. NrCols( alpha ) ], j -> morphism_function_L( source_diagram[i], alpha[i,j], range_diagram[j] ) ) );
        
        return MorphismBetweenDirectSumsWithGivenDirectSums( dummy, source, source_diagram, listlist, range_diagram, range );
        
    end;
    
    # construct pi using only primitive data (quiver vertices, lists, tuples, integers) using the constructors
    # this could be automated once the "FIXME" comment below is addressed
    a_F := ObjectConstructor( F, CapJitTypedExpression( a, { } -> rec( filter := IsQuiverVertex ) ) );
    b_F := ObjectConstructor( F, CapJitTypedExpression( b, { } -> rec( filter := IsQuiverVertex ) ) );
    c_F := ObjectConstructor( F, CapJitTypedExpression( c, { } -> rec( filter := IsQuiverVertex ) ) );
    
    # FIXME:
    # A native implementation of `FreeCategory` not relying on QPA would have lists of morphisms as morphism data and
    # the identity morphism would simply be given by an empty list. Since `FreeCategory` currently relies on QPA,
    # the morphism datum of the identity is more complicated, so we have to actually compute `IdentityMorphism`.
    id_b_F := IdentityMorphism( F, b_F );
    
    a_L := ObjectConstructor( L, a_F );
    b_L := ObjectConstructor( L, b_F );
    c_L := ObjectConstructor( L, c_F );
    
    pi := MorphismConstructor( add,
        ObjectConstructor( add, [ a_L, b_L, c_L ] ),
        [
            [ LinearClosureMorphismNC( L, a_L, CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsInt ) ), CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( F ) ) ), b_L ) ],
            [ LinearClosureMorphismNC( L, b_L, [ 1 ], [ id_b_F ], b_L ) ],
            [ LinearClosureMorphismNC( L, c_L, CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsInt ) ), CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( F ) ) ), b_L ) ]
        ],
        ObjectConstructor( add, [ b_L ] )
    );
    
    return morphism_function_add( abc_dummy, pi, b_dummy );
    
end;

# test with terminal category
T := TerminalCategoryWithMultipleObjects( );
a_T := "a" / T;
b_T := "b" / T;
c_T := "c" / T;
abc_T := DirectSum( T, [ a_T, b_T, c_T ] );

result1 := func( T, a_T, b_T, c_T, abc_T );

# logic templates for AdditiveClosure
# those can be removed once empty lists are typed
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat", "source", "range", "matrix" ],
        src_template := "NumberRows( CreateCapCategoryMorphismWithAttributes( cat, source, range, MorphismMatrix, matrix ) )",
        dst_template := "Length( ObjectList( source ) )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat", "source", "range", "matrix" ],
        src_template := "NumberColumns( CreateCapCategoryMorphismWithAttributes( cat, source, range, MorphismMatrix, matrix ) )",
        dst_template := "Length( ObjectList( range ) )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat", "source", "range", "matrix", "i", "j" ],
        src_template := "CreateCapCategoryMorphismWithAttributes( cat, source, range, MorphismMatrix, matrix )[i, j]",
        dst_template := "matrix[i][j]",
    )
);

# values of FunctorOnThreeVertices
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "a_dummy", "b_dummy", "c_dummy" ],
        src_template := "FunctorOnThreeVertices( a, a_dummy, b_dummy, c_dummy )",
        dst_template := "a_dummy",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "a_dummy", "b_dummy", "c_dummy" ],
        src_template := "FunctorOnThreeVertices( b, a_dummy, b_dummy, c_dummy )",
        dst_template := "b_dummy",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "a_dummy", "b_dummy", "c_dummy" ],
        src_template := "FunctorOnThreeVertices( c, a_dummy, b_dummy, c_dummy )",
        dst_template := "c_dummy",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list1", "list2" ],
        src_template := "ListN( list1, list2, { x, y } -> y[1] )",
        dst_template := "List( list2, l -> l[1] )",
        new_funcs := [ [ "l" ] ],
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "func" ],
        variable_filters := [ rec(
            filter := IsFunction,
            signature := Pair(
                [ rec( filter := IsInt ), CapJitDataTypeOfMorphismOfCategory( dummy ) ],
                CapJitDataTypeOfMorphismOfCategory( dummy )
            ),
        ) ],
        src_template := "ListN( CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsInt ) ), CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( dummy ) ) ), func )",
        dst_template := "CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( dummy ) ) )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry_1", "entry_2", "func" ],
        src_template := "ListN( [ entry_1 ], [ entry_2 ], func )",
        dst_template := "[ func( entry_1, entry_2 ) ]",
    )
);

# WARNING: the following logic templates only hold up to congruence
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat", "obj", "source", "tau" ],
        src_template := "UniversalMorphismIntoDirectSumWithGivenDirectSum( cat, [ obj ], source, tau, obj )",
        dst_template := "tau[1]",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat", "source", "range" ],
        variable_filters := [ CapJitDataTypeOfCategory( dummy ), CapJitDataTypeOfObjectOfCategory( dummy ), CapJitDataTypeOfObjectOfCategory( dummy ) ],
        src_template := "SumOfMorphisms( cat, source, CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( dummy ) ) ), range )",
        dst_template := "ZeroMorphism( cat, source, range )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat", "source", "range", "mor" ],
        src_template := "SumOfMorphisms( cat, source, [ mor ], range )",
        dst_template := "mor",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat", "mor" ],
        src_template := "MultiplyWithElementOfCommutativeRingForMorphisms( cat, 1, mor )",
        dst_template := "mor",
    )
);

compiled_func := CapJitCompiledFunction( func, dummy, [ "category", "object", "object", "object", "object" ], "morphism" );

# test with terminal category
result2 := compiled_func( T, a_T, b_T, c_T, abc_T );

# In general, result1 and result2 can be different due to the logic templates above which only hold up to congruence.
# By chance, this does not cause problems here.
Assert( 0, result1 = result2 );

Display( compiled_func );
#! function ( dummy_1, a_dummy_1, b_dummy_1, c_dummy_1, abc_dummy_1 )
#!     return UniversalMorphismFromDirectSumWithGivenDirectSum( dummy_1, 
#!        [ a_dummy_1, b_dummy_1, c_dummy_1 ], b_dummy_1, 
#!        [ ZeroMorphism( dummy_1, a_dummy_1, b_dummy_1 ), 
#!           IdentityMorphism( dummy_1, b_dummy_1 ), 
#!           ZeroMorphism( dummy_1, c_dummy_1, b_dummy_1 ) ], abc_dummy_1 );
#! end

MakeReadWriteGlobal( "CAP_JIT_LOGIC_TEMPLATES" );
CAP_JIT_LOGIC_TEMPLATES := orig_CAP_JIT_LOGIC_TEMPLATES;
MakeReadOnlyGlobal( "CAP_JIT_LOGIC_TEMPLATES" );
