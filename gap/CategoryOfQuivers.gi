# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
BindGlobal( "QuiverOfCategoryOfQuivers",
        RightQuiver( "q(V,A)[s:V->A,t:V->A]" ) );

##
InstallOtherMethodForCompilerForCAP( CreateQuiver,
        "for a category of quivers and a triple",
        [ IsCategoryOfQuivers, IsList ],
        
  function ( category_of_quivers, triple )
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, Length( triple ) = 3 and IsList( triple[3] ) and ForAll( triple[3], IsList ) );
    
    return CreateCapCategoryObjectWithAttributes( category_of_quivers,
                   DefiningTripleOfQuiver, triple );
    
end );

##
InstallMethod( CreateQuiver,
        "for a category of quivers, an integers, and a list of pairs of integers",
        [ IsCategoryOfQuivers, IsInt, IsList ],
        
  function ( category_of_quivers, n, arrows )
    local arr, A, s, t;
    
    if ForAll( arrows, IsInt ) then
        Assert( 0, IsEvenInt( Length( arrows ) ) );
        arr := List( [ 1 .. Length( arrows ) / 2 ], i -> Pair( arrows[2 * i - 1], arrows[2 * i] ) );
    else
        arr := arrows;
    fi;
    
    return CreateQuiver( category_of_quivers,
                   Triple( n, Length( arr ), arr ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( CreateQuiverMorphism,
        "for a category of quivers, two objects in a category of quivers, and a pair",
        [ IsCategoryOfQuivers, IsObjectInCategoryOfQuivers, IsList, IsObjectInCategoryOfQuivers ],
        
  function ( category_of_quivers, source, images, range )
    
    return CreateCapCategoryMorphismWithAttributes( category_of_quivers,
                   source,
                   range,
                   DefiningPairOfQuiverMorphism, images );
    
end );

##
InstallMethod( CreateQuiverMorphism,
        "for two objects in a category of quivers and two lists",
        [ IsObjectInCategoryOfQuivers, IsList, IsList, IsObjectInCategoryOfQuivers ],
        
  function ( source, images_of_vertices, images_of_arrows, range )
    
    return CreateQuiverMorphism( CapCategory( source ), source, Pair( images_of_vertices, images_of_arrows ), range );
    
end );

##
InstallMethodWithCache( CategoryOfQuiversEnrichedOver,
        "for a category of sekelal finite sets",
        [ IsCategoryOfSkeletalFinSets ],
        
  function ( category_of_skeletal_finsets )
    local object_constructor, object_datum,
          morphism_constructor, morphism_datum,
          F, F_hat,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          Quivers, F_op;
    
    ##
    object_constructor := CreateQuiver;
    
    ##
    object_datum := { Quivers, o } -> DefiningTripleOfQuiver( o );
    
    ##
    morphism_constructor := CreateQuiverMorphism;
    
    ##
    morphism_datum := { Quivers, m } -> DefiningPairOfQuiverMorphism( m );
    
    ## building the categorical tower:
    F := FreeCategory( QuiverOfCategoryOfQuivers : range_of_HomStructure := category_of_skeletal_finsets, FinalizeCategory := true );
    
    F_hat := FiniteCocompletion( F, category_of_skeletal_finsets : FinalizeCategory := true );
    
    ModelingCategory( F_hat )!.compiler_hints.category_attribute_resolving_functions := rec(
        DefiningPairOfUnderlyingQuiver := { } ->
            # Display( ENHANCED_SYNTAX_TREE( x -> Pair( 2, [ Pair( 0, 1 ), Pair( 0, 1 ) ] ) ).bindings.BINDING_RETURN_VALUE )
            rec(
                args := rec(
                            1 := rec(
                                    type := "EXPR_INT",
                                    value := 2 ),
                            2 := rec(
                                    list := rec(
                                            1 := rec(
                                                    args := rec(
                                                            1 := rec(
                                                                    type := "EXPR_INT",
                                                                    value := 0 ),
                                                            2 := rec(
                                                                    type := "EXPR_INT",
                                                                    value := 1 ),
                                                            length := 2,
                                                            type := "SYNTAX_TREE_LIST" ),
                                                    funcref := rec(
                                                            gvar := "Pair",
                                                            type := "EXPR_REF_GVAR" ),
                                                    type := "EXPR_FUNCCALL" ),
                                            2 := rec(
                                                    args := rec(
                                                            1 := rec(
                                                                    type := "EXPR_INT",
                                                                    value := 0 ),
                                                            2 := rec(
                                                                    type := "EXPR_INT",
                                                                    value := 1 ),
                                                            length := 2,
                                                            type := "SYNTAX_TREE_LIST" ),
                                                    funcref := rec(
                                                            gvar := "Pair",
                                                            type := "EXPR_REF_GVAR" ),
                                                    type := "EXPR_FUNCCALL" ),
                                            length := 2,
                                            type := "SYNTAX_TREE_LIST" ),
                                    type := "EXPR_LIST" ),
                            length := 2,
                            type := "SYNTAX_TREE_LIST" ),
                        funcref := rec(
                                gvar := "Pair",
                                type := "EXPR_REF_GVAR" ),
                        type := "EXPR_FUNCCALL" ),
    );
    
    ## from the raw object data to the object in the highest stage of the tower
    modeling_tower_object_constructor :=
      function( Quivers, triple )
        local F_hat, PSh, sFinSets, V, A, arrows, s, t;
        
        F_hat := ModelingCategory( Quivers );
        
        PSh := ModelingCategory( F_hat );
        
        sFinSets := Range( PSh );
        
        V := ObjectConstructor( sFinSets, triple[1] );
        
        A := ObjectConstructor( sFinSets, triple[2] );
        
        arrows := triple[3];
        
        s := MorphismConstructor( sFinSets, A, List( arrows, a -> a[1] ), V );
        
        t := MorphismConstructor( sFinSets, A, List( arrows, a -> a[2] ), V );
        
        return ObjectConstructor( F_hat,
                       ObjectConstructor( PSh, Pair( [ V, A ], [ s, t ] ) ) );
        
    end;
    
    ## from the object in the highest stage of the tower to the raw object data
    modeling_tower_object_datum :=
      function( Quivers, obj )
        local F_hat, PSh, F, values_of_functor;
        
        F_hat := ModelingCategory( Quivers );
        
        PSh := ModelingCategory( F_hat );
        
        F := ObjectDatum( F_hat, obj );
        
        values_of_functor := ObjectDatum( PSh, F );
        
        return Triple( Length( values_of_functor[1][1] ),
                       Length( values_of_functor[1][2] ),
                       ListN( AsList( values_of_functor[2][1] ), AsList( values_of_functor[2][2] ), { s, t } -> Pair( s, t ) ) );
        
    end;
    
    ## from the raw morphism data to the morphism in the highest stage of the tower
    modeling_tower_morphism_constructor :=
      function( Quivers, source, images, range )
        local F_hat, PSh, sFinSets, S, T, Sobj, Tobj;
        
        F_hat := ModelingCategory( Quivers );
        
        PSh := ModelingCategory( F_hat );
        
        sFinSets := Range( PSh );
        
        S := ObjectDatum( F_hat, source );
        T := ObjectDatum( F_hat, range );
        
        Sobj := ObjectDatum( PSh, S )[1];
        Tobj := ObjectDatum( PSh, T )[1];
        
        return MorphismConstructor( F_hat,
                       source,
                       MorphismConstructor( PSh,
                               S,
                               [ MorphismConstructor( sFinSets, Sobj[1], images[1], Tobj[1] ),
                                 MorphismConstructor( sFinSets, Sobj[2], images[2], Tobj[2] ) ],
                               T ),
                       range );
        
    end;
    
    ## from the morphism in the highest stage of the tower to the raw morphism data
    modeling_tower_morphism_datum :=
      function( Quivers, mor )
        local F_hat, PSh, eta, values_on_all_objects;
        
        F_hat := ModelingCategory( Quivers );
        
        PSh := ModelingCategory( F_hat );
        
        eta := MorphismDatum( F_hat, mor );
        
        values_on_all_objects := MorphismDatum( PSh, eta );
        
        return Pair( AsList( values_on_all_objects[1] ), AsList( values_on_all_objects[2] ) );
        
    end;
    
    ## the wrapper category interacts with the user through the raw data but uses
    ## the tower to derive the algorithms turing the category into a constructive topos;
    ## after compilation the tower is gone and the only reminiscent which hints to the tower
    ## is the attribute ModelingCategory:
    Quivers := WrapperCategory( F_hat,
                       rec( name := Concatenation( "CategoryOfQuiversEnrichedOver( ", Name( category_of_skeletal_finsets ), " )" ),
                            category_filter := IsCategoryOfQuivers,
                            category_object_filter := IsObjectInCategoryOfQuivers,
                            category_morphism_filter := IsMorphismInCategoryOfQuivers,
                            object_constructor := object_constructor,
                            object_datum := object_datum,
                            morphism_datum := morphism_datum,
                            morphism_constructor := morphism_constructor,
                            modeling_tower_object_constructor := modeling_tower_object_constructor,
                            modeling_tower_object_datum := modeling_tower_object_datum,
                            modeling_tower_morphism_constructor := modeling_tower_morphism_constructor,
                            modeling_tower_morphism_datum := modeling_tower_morphism_datum,
                            only_primitive_operations := true )
                       : FinalizeCategory := false );
    
    SetUnderlyingCategory( Quivers, F );
    
    F_op := OppositeFpCategory( F );
    
    SetSetOfObjects( Quivers, SetOfObjects( F_op ) );
    SetSetOfGeneratingMorphisms( Quivers, SetOfGeneratingMorphisms( F_op ) );
    SetDefiningPairOfUnderlyingQuiver( Quivers, DefiningPairOfAQuiver( UnderlyingQuiver( F_op ) ) );
    
    Quivers!.compiler_hints.category_attribute_names :=
           [ "ModelingCategory",
             "SetOfObjects",
             "SetOfGeneratingMorphisms",
            ];
    
    if ValueOption( "no_precompiled_code" ) <> true then
        ADD_FUNCTIONS_FOR_FinQuiversPrecompiled( Quivers );
        ADD_FUNCTIONS_FOR_FinQuiversAsCCCPrecompiled( Quivers );
    fi;
    
    Finalize( Quivers );
    
    return Quivers;
    
end );

##
BindGlobal( "FinQuivers",
         CategoryOfQuiversEnrichedOver( SkeletalFinSets ) );

##
InstallMethod( CreateQuiver,
        "for an integers, and a list of pairs of integers",
        [ IsInt, IsList ],
        
  function ( n, arrows )
    
    return CreateQuiver( FinQuivers, n, arrows );
    
end );

##
InstallMethod( Arrows,
        "for an object in a category of quivers",
        [ IsObjectInCategoryOfQuivers ],
        
  function ( quiver )
    
    return ObjectDatum( quiver )[3];
    
end );

##
InstallMethod( Subobject,
        "for an object in a category of quivers and two lists",
        [ IsObjectInCategoryOfQuivers, IsList, IsList ],
        
  function ( quiver, images_of_vertices, images_of_arrows )
    local arrows, arrows_as_pairs, vertices, source, subquiver;
    
    arrows := DuplicateFreeList( images_of_arrows );
    
    arrows_as_pairs := Arrows( quiver ){1 + arrows};
    
    vertices := AsList( quiver.V ){1 + Set( Concatenation( images_of_vertices, Concatenation( arrows_as_pairs ) ) )};
    
    source := CreateQuiver( CapCategory( quiver ),
                      Length( vertices ),
                      List( arrows_as_pairs, a -> -1 + [ SafePosition( vertices, a[1] ), SafePosition( vertices, a[2] ) ] ) );
    
    subquiver := CreateQuiverMorphism( source, vertices, arrows, quiver );
    
    Assert( 2, IsMonomorphism( subquiver ) );
    SetIsMonomorphism( subquiver, true );
    
    return subquiver;
    
end );

##
InstallMethod( Subobject,
        "for an object in a category of quivers and a list",
        [ IsObjectInCategoryOfQuivers, IsList ],
        
  function ( quiver, images_of_arrows )
    
    return Subobject( quiver, [ ], images_of_arrows );
    
end );

##
InstallMethod( YonedaEmbeddingOfUnderlyingCategory,
        "for a category of quivers",
        [ IsCategoryOfQuivers ],
        
  function ( category_of_quivers )
    local Y, U;
    
    Y := YonedaEmbedding( UnderlyingCategory( category_of_quivers ) );
    
    U := CapFunctor( "UnwrappingFunctor", RangeOfFunctor( Y ), category_of_quivers );
    
    AddObjectFunction( U,
            F -> CreateQuiver( category_of_quivers, Triple( Length( F.V ), Length( F.A ), ListN( AsList( F.s ), AsList( F.t ), { s, t } -> Pair( s, t ) ) ) ) );
    
    AddMorphismFunction( U,
            { source, eta, range } -> CreateQuiverMorphism( category_of_quivers, source, Pair( AsList( eta.V ), AsList( eta.A ) ), range ) );
    
    return PreCompose( Y, U );
    
end );

##
InstallMethod( \.,
        "for a category of quivers and a positive integer",
        [ IsCategoryOfQuivers, IsPosInt ],
        
  function ( category_of_quivers, string_as_int )
    local name, F, Y, Yc;
    
    name := NameRNam( string_as_int );
    
    F := UnderlyingCategory( category_of_quivers );
    
    Y := YonedaEmbeddingOfUnderlyingCategory( category_of_quivers );
    
    Yc := Y( F.(name) );
    
    if IsObjectInCategoryOfQuivers( Yc ) then
        
        SetIsProjective( Yc, true );
        
    elif IsMorphismInCategoryOfQuivers( Yc ) then
        
        if CanCompute( category_of_quivers, "IsMonomorphism" ) then
            IsMonomorphism( Yc );
        fi;
        
        if CanCompute( category_of_quivers, "IsSplitMonomorphism" ) then
            IsSplitMonomorphism( Yc );
        fi;
        
        if CanCompute( category_of_quivers, "IsEpimorphism" ) then
            IsEpimorphism( Yc );
        fi;
        
        if CanCompute( category_of_quivers, "IsSplitEpimorphism" ) then
            IsSplitEpimorphism( Yc );
        fi;
        
        ## IsIsomorphism = IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        if CanCompute( category_of_quivers, "IsIsomorphism" ) then
            IsIsomorphism( Yc );
        fi;
        
    fi;
    
    return Yc;
    
end );

##
InstallMethod( \.,
        "for an object in a category of quivers and a positive integer",
        [ IsObjectInCategoryOfQuivers, IsPosInt ],
        
  function ( quiver, string_as_int )
    local datum, n, m, arrows, name;
    
    datum := ObjectDatum( quiver );
    
    name := NameRNam( string_as_int );
    
    n := datum[1];
    
    m := datum[2];
    
    arrows := datum[3];
    
    if name = "V" then
        return FinSet( n );
    elif name = "A" then
        return FinSet( Length( arrows ) );
    elif name = "s" then
        return MapOfFinSets( FinSet( m ), List( arrows, a -> a[1] ), FinSet( n ) );
    elif name = "t" then
        return MapOfFinSets( FinSet( m ), List( arrows, a -> a[2] ), FinSet( n ) );
    fi;
    
    Error( "the quiver has no component with the name \"", name, "\"\n" );
    
end );

##
InstallMethod( \.,
        "for a morphism in a category of quivers and a positive integer",
        [ IsMorphismInCategoryOfQuivers, IsPosInt ],
        
  function ( mor, string_as_int )
    local datum, name;
    
    datum := MorphismDatum( mor );
    
    name := NameRNam( string_as_int );
    
    if name = "V" then
        return MapOfFinSets( Source( mor ).V, datum[1], Range( mor ).V );
    elif name = "A" then
        return MapOfFinSets( Source( mor ).A, datum[2], Range( mor ).A );
    fi;
    
    Error( "the quiver morphism has no component with the name \"", name, "\"\n" );
    
end );

##
MakeShowable( [ "image/svg+xml" ], IsObjectInCategoryOfQuivers );
MakeShowable( [ "image/svg+xml" ], IsMorphismInCategoryOfQuivers and IsMonomorphism );

##
InstallOtherMethod( DotVertexLabelledDigraph,
        "for an object in a category of quivers",
        [ IsObjectInCategoryOfQuivers ],
        
  function ( quiver )
    local str, arrows, i;
    
    # Copied from DotVertexLabeledDigraph() at Digraphs/gap/display.gi
    str := "//dot\n";
    
    Append( str, "digraph quiver{\n" );
    Append( str, "rankdir=\"LR\"\n" );
    Append( str, "minlen=0\n" );
    Append( str, "node [shape=circle width=0 height=0]\n" );
    
    for i in AsList( quiver.V ) do
        Append( str, String( i ) );
        Append( str, " [label=\"" );
        Append( str, String( i ) );
        Append( str, "\" fontsize=12 margin=0.01 fontname=\"DejaVu Serif,serif\"]\n" );
    od;
    
    arrows := Arrows( quiver );
    
    for i in AsList( quiver.A ) do
        ## https://graphviz.org/docs/attrs/fontsize/
        Append( str,
                Concatenation(
                        String( arrows[1 + i][1] ),
                        " -> ",
                        String( arrows[1 + i][2] ),
                        " [label=\"",
                        String( i ),
                        "\" arrowsize=0.5 fontsize=10 fontname=\"DejaVu Serif,serif\"]\n" ) );
    od;
    
    Append( str, "}\n" );
    
    return str;
    
end );

##
InstallOtherMethod( DotVertexLabelledDigraph,
        "for a morphism in a category of quivers",
        [ IsMorphismInCategoryOfQuivers and IsMonomorphism ],
        
  function ( monomorphism )
    local quiver, vertices, arrows, str, arrows_as_pairs, i;
    
    quiver := Range( monomorphism );
    
    vertices := AsList( monomorphism.V );
    arrows := AsList( monomorphism.A );
    
    # Copied from DotVertexLabeledDigraph() at Digraphs/gap/display.gi
    str := "//dot\n";
    
    Append( str, "digraph subquiver{\n" );
    Append( str, "rankdir=\"LR\"\n" );
    Append( str, "minlen=0\n" );
    Append( str, "node [shape=circle width=0 height=0]\n" );
    
    for i in AsList( quiver.V ) do
        Append( str, String( i ) );
        Append( str, " [label=\"" );
        Append( str, String( i ) );
        Append( str, "\"" );
        if not i in vertices then
            ## https://graphviz.org/doc/info/colors/
            Append( str, " fontcolor=\"azure3\"" );
            Append( str, " color=\"azure3\"" );
        fi;
        Append( str, " fontsize=12 margin=0.01 fontname=\"DejaVu Serif,serif\"]\n" );
    od;
    
    arrows_as_pairs := Arrows( quiver );
    
    for i in AsList( quiver.A ) do
        ## https://graphviz.org/docs/attrs/fontsize/
        Append( str,
                Concatenation(
                        String( arrows_as_pairs[1 + i][1] ),
                        " -> ",
                        String( arrows_as_pairs[1 + i][2] ),
                        " [label=\"",
                        String( i ),
                        "\" arrowsize=0.5 fontsize=10" ) );
        if not i in arrows then
            Append( str, " fontcolor=\"azure3\"" );
            Append( str, " color=\"azure3\"" );
        fi;
        Append( str, " fontname=\"DejaVu Serif,serif\"]\n" );
    od;
    
    Append( str, "}\n" );
    
    return str;
    
end );

##
InstallMethod( SvgString,
        "for a cell in a category of quivers",
        [ IsCellInCategoryOfQuivers ],
        
  function ( cell )
    
    return DotToSVG( DotVertexLabelledDigraph( cell ) );
    
end );

##
InstallMethod( Display,
        "for an object in a category of quivers",
        [ IsObjectInCategoryOfQuivers ],
        
  function ( quiver )
    local datum, arrows;
    
    datum := ObjectDatum( quiver );
    
    arrows := datum[3];
    
    Print( "( ", StringPrint( FinSet( datum[1] ) ), ", {",
           JoinStringsWithSeparator( List( [ 1 .. datum[2] ], i -> Concatenation( " ", String( -1 + i ), " := ", String( arrows[i] ) ) ) ), " } )\n" );
    
end );

##
InstallMethod( Display,
        "for a morphism in a category of quivers",
        [ IsMorphismInCategoryOfQuivers ],
        
  function ( mor )
    local objs;
    
    objs := SetOfObjects( CapCategory( mor ) );
    
    Print( "Image of ", StringView( objs[1] ), ":\n" );
    Display( mor.V );
    
    Print( "\nImage of ", StringView( objs[2] ), ":\n" );
    Display( mor.A );
    
    Print( "\nA morphism in ", Name( CapCategory( mor ) ), " given by the above data\n" );
    
end );
