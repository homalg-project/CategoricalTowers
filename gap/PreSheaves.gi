# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallOtherMethodForCompilerForCAP( CreatePreSheafByValues,
        "for a presheaf category and two lists",
        [ IsPreSheafCategory, IsList ],
        
  function ( PSh, values_of_presheaf )
    
    return CreateCapCategoryObjectWithAttributes( PSh,
                   Source, Source( PSh ),
                   Range, Range( PSh ),
                   ValuesOfPreSheaf, values_of_presheaf );
    
end );

##
InstallMethodForCompilerForCAP( CreatePreSheafByValues,
        "for a presheaf category and two lists",
        [ IsPreSheafCategory, IsList, IsList ],
        
  function ( PSh, values_of_all_objects, values_of_all_generating_morphisms )
    
    return CreatePreSheafByValues( PSh, Pair( values_of_all_objects, values_of_all_generating_morphisms ) );
    
end );

##
InstallMethodForCompilerForCAP( CreatePreSheafByFunctions,
        "for a presheaf category and two functions",
        [ IsPreSheafCategory, IsFunction, IsFunction ],
        
  function ( PSh, presheaf_on_objects, presheaf_on_generating_morphisms )
    local defining_pair, nr_objs, mors, nr_mors, values_of_all_objects, values_of_all_generating_morphisms;
    
    defining_pair := DefiningPairOfUnderlyingQuiver( PSh );
    
    nr_objs := defining_pair[1];
    mors := defining_pair[2];
    nr_mors := Length( mors );
    
    values_of_all_objects := LazyHList( [ 1 .. nr_objs ], o -> presheaf_on_objects( o ) );
    values_of_all_generating_morphisms := LazyHList( [ 1 .. nr_mors ], m -> presheaf_on_generating_morphisms(
                                                  presheaf_on_objects( mors[m][1] ),
                                                  m,
                                                  presheaf_on_objects( mors[m][2] ) ) );
    
    return CreatePreSheafByValues( PSh, values_of_all_objects, values_of_all_generating_morphisms );
    
end );

##
InstallOtherMethod( CreatePreSheaf,
        "for a presheaf category and a CAP functor",
        [ IsPreSheafCategory, IsCapFunctor ],
        
  function ( PSh, F )
    local B_op, objsB_op, morsB_op, functor_on_objects, functor_on_generating_morphism;
    
    B_op := SourceOfFunctor( F );
    
    objsB_op := SetOfObjects( B_op );
    morsB_op := SetOfGeneratingMorphisms( B_op );
    
    functor_on_objects := obj_index -> FunctorObjectOperation( F )( objsB_op[obj_index] );
    functor_on_generating_morphism := { source, mor_index, range } -> FunctorMorphismOperation( F )( source, morsB_op[mor_index], range );
    
    return CreatePreSheafByFunctions( PSh, functor_on_objects, functor_on_generating_morphism );
    
end );

##
InstallMethod( CreatePreSheaf,
        "for a CAP functor",
        [ IsCapFunctor ],
        
  function ( F )
    local B_op, B, PSh;
    
    B_op := SourceOfFunctor( F );
    
    if IsFpCategory( B_op ) then
        B := OppositeFpCategory( B_op );
    elif IsAlgebroid( B_op ) then
        B := OppositeAlgebroid( B_op );
    else
        B := Opposite( B_op );
    fi;
    
    PSh := PreSheaves( B, RangeOfFunctor( F ) );
    
    return CreatePreSheaf( PSh, F );
    
end );

##
InstallMethod( CreatePreSheaf,
        "for a CAP category, a record (of images of objects) and a record (of images of morphisms)",
        [ IsCapCategory, IsRecord, IsRecord ],
        
  function ( B, rec_images_of_objects, rec_images_of_morphisms )
    
    return CreatePreSheaf( CapFunctor( B, rec_images_of_objects, rec_images_of_morphisms ) );
    
end );

##
InstallOtherMethod( CreatePreSheaf,
        "for a CAP category, a list (of images of objects) and a list (of images of morphisms)",
        [ IsCapCategory, IsList, IsList ],
        
  function ( B, images_of_objects, images_of_morphisms )
    
    if IsPreSheafCategory( B ) then
        TryNextMethod( );
    elif IsFunctorCategory( B ) then
        TryNextMethod( );
    elif IsEmpty( images_of_objects ) then
        Error( "the list of images is empty\n" );
    fi;
    
    return CreatePreSheaf( CapFunctor( B, images_of_objects, images_of_morphisms, CapCategory( images_of_objects[1] ) ) );
    
end );

##
InstallOtherMethod( CreatePreSheaf,
        "for an algebroid and two lists",
        [ IsAlgebroid, IsList, IsList ], 10001,
        
  function ( kq, dims, matrices )
    local k, kmat, objects, morphisms, mat;
    
    if dims = [ ] then
        Error( "the list of dimensions is empty\n" );
    fi;
    
    if not IsInt( dims[1] ) then
        TryNextMethod();
    fi;
    
    k := CommutativeRingOfLinearCategory( kq );
    
    if not (HasIsFieldForHomalg( k ) and IsFieldForHomalg( k )) then
        TryNextMethod();
    fi;
    
    kmat := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "MatrixCategory", MatrixCategory( k ) );
    
    objects := List( dims, dim -> dim / kmat );
    
    morphisms := SetOfGeneratingMorphisms( kq );
    
    mat :=
      function ( m )
        local source, target;
        
        source := VertexIndex( UnderlyingVertex( Source( morphisms[m] ) ) );
        target := VertexIndex( UnderlyingVertex( Range( morphisms[m] ) ) );
        
        if IsHomalgMatrix( matrices[m] ) then
            m := matrices[m];
        else
            m := HomalgMatrix( One( k ) * matrices[m], dims[source], dims[target], k );
        fi;
        
        return m / kmat;
        
    end;
    
    morphisms := List( [ 1 .. Length( morphisms ) ], mat );
    
    return CreatePreSheafByValues( PreSheaves( kq, kmat ), objects, morphisms );
    
end );

##
InstallOtherMethodForCompilerForCAP( CreatePreSheafMorphismByValues,
        "for a presheaf category, two objects in the presheaf category, and a list",
        [ IsPreSheafCategory, IsObjectInPreSheafCategory, IsList, IsObjectInPreSheafCategory ],
        
  function ( PSh, source, values_on_all_objects, range )
    
    return CreateCapCategoryMorphismWithAttributes( PSh,
                   source,
                   range,
                   ValuesOnAllObjects, values_on_all_objects );
    
end );

##
InstallOtherMethodForCompilerForCAP( CreatePreSheafMorphismByFunction,
        "for a presheaf category, two objects in the presheaf category, and a function",
        [ IsPreSheafCategory, IsObjectInPreSheafCategory, IsFunction, IsObjectInPreSheafCategory ],
        
  function ( PSh, source, natural_transformation_on_objects, range )
    local nr_objs, source_values, range_values, values_on_all_objects;
    
    nr_objs := DefiningPairOfUnderlyingQuiver( PSh )[1];
    
    source_values := ValuesOfPreSheaf( source )[1];
    range_values := ValuesOfPreSheaf( range )[1];
    
    values_on_all_objects := LazyHList( [ 1 .. nr_objs ],
                                     o -> natural_transformation_on_objects( source_values[o], o, range_values[o] ) );
    
    return CreatePreSheafMorphismByValues( PSh, source, values_on_all_objects, range );
    
end );

##
InstallOtherMethodForCompilerForCAP( CreatePreSheafMorphism,
        "for a presheaf category and a CAP natural transformation",
        [ IsPreSheafCategory, IsCapNaturalTransformation ],
        
  function ( PSh, eta )
    local B_op, objsB;
    
    B_op := SourceOfFunctor( Source( eta ) );
    
    objsB := SetOfObjects( B_op );
    
    return CreatePreSheafMorphismByFunction( PSh,
                   CreatePreSheaf( Source( eta ) ),
                   { source, obj_index, range } -> NaturalTransformationOperation( eta )( source, objsB[obj_index], range ),
                   CreatePreSheaf( Range( eta ) ) );
    
end );

##
InstallMethod( CreatePreSheafMorphism,
        "for a CAP natural transformation",
        [ IsCapNaturalTransformation ],
        
  function ( eta )
    local F, B_op, B, PSh;
    
    F := Source( eta );
    
    B_op := SourceOfFunctor( F );
    
    if IsFpCategory( B_op ) then
        B := OppositeFpCategory( B_op );
    elif IsAlgebroid( B_op ) then
        B := OppositeAlgebroid( B_op );
    else
        B := Opposite( B_op );
    fi;
    
    PSh := PreSheaves( B, RangeOfFunctor( F ) );
    
    return CreatePreSheafMorphism( PSh, eta );
    
end );

##
InstallMethod( CreatePreSheafMorphism,
        "for a record and two objects in a presheaf category",
        [ IsObjectInPreSheafCategory, IsRecord, IsObjectInPreSheafCategory ],
        
  function ( U, e, V )
    local eta;

    eta := NaturalTransformation(
                   e,
                   UnderlyingCapTwoCategoryCell( U ),
                   UnderlyingCapTwoCategoryCell( V ) );
    
    return CreatePreSheafMorphism( eta );
    
end );

##
InstallMethod( CreatePreSheafMorphism,
        "for two objects in a presheaf category and a list",
        [ IsObjectInPreSheafCategory, IsList, IsObjectInPreSheafCategory ],
        
  function ( U, e, V )
    local kmat;
    
    if not IsEmpty( e ) and IsHomalgMatrix( e[1] ) then
        
        kmat := Range( U );
        
        e := List( e, mat -> mat / kmat );
        
    fi;
    
    return CreatePreSheafMorphismByValues( CapCategory( U ), U, e, V );
    
end );

##
InstallMethodWithCache( PreSheaves,
        "for a CAP category",
        [ IsCapCategory, IsCapCategory ],
        
  function( B, C )
    local object_constructor, object_datum,
          morphism_constructor, morphism_datum,
          O, functor_category,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          PSh;
    
    if HasRangeCategoryOfHomomorphismStructure( B ) then
        ## this is necessary for the Yoneda embedding to make sense
        Assert( 0, IsIdenticalObj( C, RangeCategoryOfHomomorphismStructure( B ) ) );
    fi;
    
    ##
    object_constructor := CreatePreSheafByValues;
    
    ##
    object_datum := { PSh, o } -> ValuesOfPreSheaf( o );
    
    ##
    morphism_constructor := CreatePreSheafMorphismByValues;
    
    ##
    morphism_datum := { PSh, m } -> ValuesOnAllObjects( m );
    
    ## building the categorical tower
    if IsFpCategory( B ) then
        O := OppositeFpCategory( B );
    else
        O := OppositeAlgebroid( B );
    fi;
    
    functor_category := FunctorCategory( O, C : FinalizeCategory := true );
    
    ## from the raw object data to the object in the highest stage of the tower
    modeling_tower_object_constructor :=
      function( PSh, pair )
        local functor_category;
        
        functor_category := ModelingCategory( PSh );
        
        return ObjectConstructor( functor_category, pair );
        
    end;
    
    ## from the object in the highest stage of the tower to the raw object data
    modeling_tower_object_datum :=
      function( PSh, obj )
        
        return ObjectDatum( functor_category, obj );
        
    end;
    
    ## from the raw morphism data to the morphism in the highest stage of the tower
    modeling_tower_morphism_constructor :=
      function( PSh, source, images, range )
        local functor_category;
        
        functor_category := ModelingCategory( PSh );
        
        return MorphismConstructor( functor_category, source, images, range );
        
    end;
    
    ## from the morphism in the highest stage of the tower to the raw morphism data
    modeling_tower_morphism_datum :=
      function( PSh, mor )
        
        return MorphismDatum( functor_category, mor );
        
    end;

    ##
    PSh :=
      WrapperCategory( functor_category,
              rec( name := Concatenation( "PreSheaves( ", Name( B ), ", ", Name( C ), " )" ),
                   category_filter := IsPreSheafCategory,
                   category_object_filter := IsObjectInPreSheafCategory,
                   category_morphism_filter := IsMorphismInPreSheafCategory,
                   object_constructor := object_constructor,
                   object_datum := object_datum,
                   morphism_datum := morphism_datum,
                   morphism_constructor := morphism_constructor,
                   modeling_tower_object_constructor := modeling_tower_object_constructor,
                   modeling_tower_object_datum := modeling_tower_object_datum,
                   modeling_tower_morphism_constructor := modeling_tower_morphism_constructor,
                   modeling_tower_morphism_datum := modeling_tower_morphism_datum,
                   only_primitive_operations := true ) : FinalizeCategory := false );
    
    SetSource( PSh, B );
    SetRange( PSh, C );
    
    SetSetOfObjects( PSh, SetOfObjects( B ) );
    SetSetOfGeneratingMorphisms( PSh, SetOfGeneratingMorphisms( B ) );
    SetDefiningPairOfUnderlyingQuiver( PSh, DefiningPairOfAQuiver( UnderlyingQuiver( B ) ) );
    
    PSh!.compiler_hints.category_attribute_names :=
      [ "ModelingCategory",
        "Source",
        "Range",
        "SetOfObjects",
        "SetOfGeneratingMorphisms",
        "DefiningPairOfUnderlyingQuiver",
        ];
    
    Finalize( PSh );
    
    return PSh;
    
end );

##
InstallMethod( PreSheaves,
        "for a CAP category",
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function( B )
    
    return PreSheaves( B, RangeCategoryOfHomomorphismStructure( B ) );
    
end );

##
InstallMethodForCompilerForCAP( YonedaEmbeddingDataInPreSheafCategory,
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local A, PSh, objs, mors, name, Yoneda_on_objs, Yoneda_on_mors;
    
    A := UnderlyingQuiverAlgebra( B );
    
    if not IsFiniteDimensional( A ) then
        
        Error( "The underlying quiver algebra should be finite dimensional!\n" );
        
    fi;
    
    PSh := PreSheaves( B );
    
    objs := SetOfObjects( B );
    
    mors := SetOfGeneratingMorphisms( B );
    
    Yoneda_on_objs :=
      function ( obj )
        local Yobj;
        
        Yobj := CreatePreSheafByValues( PSh,
                        List( objs, o -> HomomorphismStructureOnObjects( B, o, obj ) ),
                        List( mors, m -> HomomorphismStructureOnMorphisms( B, m, IdentityMorphism( B, obj ) ) ) );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        SetIsProjective( Yobj, true );
        
        return Yobj;
        
    end;
    
    Yoneda_on_mors :=
      function ( s, mor, r )
        
        return CreatePreSheafMorphismByValues( PSh,
                       s,
                       List( objs, o -> HomomorphismStructureOnMorphisms( B, IdentityMorphism( B, o ), mor ) ),
                       r );
        
    end;
    
    return Pair( Yoneda_on_objs, Yoneda_on_mors );
    
end );

##
InstallMethod( YonedaEmbeddingInPreSheafCategory,
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local A, PSh, Yoneda, Yoneda_data;
    
    A := UnderlyingQuiverAlgebra( B );
    
    if not IsFiniteDimensional( A ) then
        
        Error( "The underlying quiver algebra should be finite dimensional!\n" );
        
    fi;
    
    PSh := PreSheaves( B );
    
    Yoneda := CapFunctor( "Yoneda embedding functor", B, PSh );
    
    Yoneda_data := YonedaEmbeddingDataInPreSheafCategory( B );
    
    AddObjectFunction( Yoneda, Yoneda_data[1] );
    
    AddMorphismFunction( Yoneda,  Yoneda_data[2] );
    
    return Yoneda;
    
end );

##
InstallMethod( YonedaEmbeddingOfSourceCategory,
        "for a presheaf category",
        [ IsPreSheafCategory ],
        
  function ( PSh )
    
    return YonedaEmbeddingInPreSheafCategory( Source( PSh ) );
    
end );

##
InstallMethod( \.,
        "for a presheaf category and a positive integer",
        [ IsPreSheafCategory, IsPosInt ],
        
  function( PSh, string_as_int )
    local name, F, Y, Yc;
    
    name := NameRNam( string_as_int );
    
    F := Source( PSh );
    
    Y := YonedaEmbeddingOfSourceCategory( PSh );
    
    Yc := Y( F.(name) );
    
    if IsObjectInPreSheafCategory( Yc ) then
        
        SetIsProjective( Yc, true );
        
    elif IsMorphismInPreSheafCategory( Yc ) then
        
        if CanCompute( PSh, "IsMonomorphism" ) then
            IsMonomorphism( Yc );
        fi;
        
        if CanCompute( PSh, "IsSplitMonomorphism" ) then
            IsSplitMonomorphism( Yc );
        fi;
        
        if CanCompute( PSh, "IsEpimorphism" ) then
            IsEpimorphism( Yc );
        fi;
        
        if CanCompute( PSh, "IsSplitEpimorphism" ) then
            IsSplitEpimorphism( Yc );
        fi;
        
        ## IsIsomorphism = IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        if CanCompute( PSh, "IsIsomorphism" ) then
            IsIsomorphism( Yc );
        fi;
        
    fi;
    
    return Yc;
    
end );

##
InstallMethod( \.,
        "for a presheaf and a positive integer",
        [ IsObjectInPreSheafCategory, IsPosInt ],
        
  function( presheaf, string_as_int )
    
    return ModelingObject( CapCategory( presheaf ), presheaf ).(NameRNam( string_as_int ));
    
end );

##
InstallMethod( \.,
        "for a presheaf morphism and a positive integer",
        [ IsMorphismInPreSheafCategory, IsPosInt ],
        
  function( morphism, string_as_int )
    
    return ModelingMorphism( CapCategory( morphism ), morphism ).(NameRNam( string_as_int ));
    
end );

##
InstallMethodForCompilerForCAP( ApplyObjectInPreSheafCategoryToObject,
        "for an object in a presheaf category and a CAP object",
        [ IsPreSheafCategory, IsObjectInPreSheafCategory, IsCapCategoryObject ],
        
  function ( PSh, F, objB )
    local pos;
    
    pos := SafePosition( SetOfObjects( Source( PSh ) ), objB );
    
    return ValuesOfPreSheaf( F )[1][pos];
    
end );

##
InstallOtherMethod( UnderlyingCapTwoCategoryCell,
        "for an object in a functor category",
        [ IsPreSheafCategory, IsObjectInPreSheafCategory ],
        
  function ( PSh, F )
    local values;
    
    values := ValuesOfPreSheaf( F );
    
    return CapFunctor( Source( PSh ), values[1], values[2], Range( PSh ) );
    
end );

##
InstallMethod( UnderlyingCapTwoCategoryCell,
        "for an object in a functor category",
        [ IsObjectInPreSheafCategory ],
        
  function ( F )
    
    return UnderlyingCapTwoCategoryCell( CapCategory( F ), F );
    
end );

##
InstallMethodForCompilerForCAP( ApplyObjectInPreSheafCategoryToMorphism,
        "for an object in a presheaf category and a CAP morphism",
        [ IsPreSheafCategory, IsObjectInPreSheafCategory, IsCapCategoryMorphism ],
        
  function ( PSh, F, morB )
    local pos;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    pos := Position( SetOfGeneratingMorphisms( Source( PSh ) ), morB );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if IsInt( pos ) then
        return ValuesOfPreSheaf( F )[2][pos];
    fi;
    
    return FunctorMorphismOperation( UnderlyingCapTwoCategoryCell( PSh, F ) )(
                   ApplyObjectInPreSheafCategoryToObject( PSh, F, Source( morB ) ),
                   morB,
                   ApplyObjectInPreSheafCategoryToObject( PSh, F, Range( morB ) ) );
    
end );

##
InstallMethodForCompilerForCAP( ApplyMorphismInPreSheafCategoryToObject,
        "for a morphism in a presheaf category and a CAP object",
        [ IsPreSheafCategory, IsMorphismInPreSheafCategory, IsCapCategoryObject ],
        
  function ( PSh, eta, objB )
    local pos;
    
    pos := SafePosition( SetOfObjects( Source( PSh ) ), objB );
    
    return ValuesOnAllObjects( eta )[pos];
    
end );

##
InstallMethod( CallFuncList,
        "for an object in a functor category and a list",
        [ IsObjectInPreSheafCategory, IsList ],
        
  function ( F, L )
    local PSh;
    
    PSh := CapCategory( F );
    
    if IsCapCategoryObject( L[1] ) then
        return ApplyObjectInPreSheafCategoryToObject( PSh, F, L[1] );
    elif IsCapCategoryMorphism( L[1] ) then
        return ApplyObjectInPreSheafCategoryToMorphism( PSh, F, L[1] );
    fi;
    
    Error( "the argument ", L[1], " is neither an object nor a morphism in ", Source( F ), "\n" );
    
end );

##
InstallMethod( CallFuncList,
        "for a morphism in a functor category and a list",
        [ IsMorphismInPreSheafCategory, IsList ],
        
  function ( eta, L )
    
    if IsCapCategoryObject( L[1] ) then
        return ApplyMorphismInPreSheafCategoryToObject( CapCategory( eta ), eta, L[1] );
    fi;
    
    Error( "the argument ", L[1], " is not an object in ", Source( Source( eta ) ), "\n" );
    
end );

##
InstallMethod( NerveTruncatedInDegree2,
        [ IsFpCategory ],
        
  function ( B )
    local nerve;
    
    nerve := NerveTruncatedInDegree2AsFunctor( B );
    
    return CreatePreSheaf( nerve );
    
end );

####################################
#
# View, Print, Display and LaTeX methods:
#
####################################

##
InstallMethod( ViewObj,
          [ IsObjectInPreSheafCategory ],
  function ( F )
    local algebroid, vertices, arrows, v_dim, v_string, a_dim, a_string, string;
    
    if not IsMatrixCategory( Range( F ) ) then
      
      TryNextMethod();
      
    fi;
    
    algebroid := Source( CapCategory( F ) );
    
    vertices := List( SetOfObjects( algebroid ), UnderlyingVertex );
    
    v_dim := List( ValuesOfPreSheaf( F )[1], Dimension );
    
    v_string := ListN( vertices, v_dim, { vertex, dim } -> Concatenation( "(", String( vertex ), ")->", String( dim ) ) );
    
    v_string := JoinStringsWithSeparator( v_string, ", " );
    
    arrows := List( SetOfGeneratingMorphisms( algebroid ), UnderlyingQuiverAlgebraElement );
    
    if not IsPathAlgebra( UnderlyingQuiverAlgebra( algebroid ) ) then
      
      arrows := List( arrows, a -> Paths( Representative( a ) )[ 1 ] );
      
    else
      
      arrows := List( arrows, a -> Paths( a )[ 1 ] );
      
    fi;
    
    a_dim := List( ValuesOfPreSheaf( F )[2], m -> [ Dimension( Source( m ) ), Dimension( Range( m ) ) ] );
    
    a_string := ListN( arrows, a_dim,
                  { arrow, dim } -> Concatenation(
                      "(", String( arrow ), ")->", String( dim[ 1 ] ), "x", String( dim[ 2 ] ) )
                    );
    
    a_string := JoinStringsWithSeparator( a_string, ", " );
    
    string := Concatenation( v_string, "; ", a_string );
    
    Print( "<", string, ">" );
    
end );

##
InstallMethod( Display,
          [ IsObjectInPreSheafCategory ],
  function ( F )
    local objects, images_of_objects, morphisms, images_of_morphisms, i;
    
    objects := SetOfObjects( Source( F ) );
    
    images_of_objects := ValuesOfPreSheaf( F )[1];

    for i in [ 1 .. Length( objects ) ] do
      
      Print( "Image of " ); ViewObj( objects[i] ); Print( ":\n" );
      
      Display( images_of_objects[i] );
      
      Print( "\n" );
      
    od;
    
    morphisms := SetOfGeneratingMorphisms( Source( F ) );
    
    images_of_morphisms := ValuesOfPreSheaf( F )[2];
    
    for i in [ 1 .. Length( morphisms ) ] do
       
      Print( "Image of " ); ViewObj( morphisms[i] ); Print( ":\n" );
      
      Display( images_of_morphisms[i] );
      
      Print( "\n" );
      
    od;
    
    Print( "An object in ", Name( CapCategory( F ) ), " given by the above data\n" );
    
end );


##
InstallMethod( ViewObj,
          [ IsMorphismInPreSheafCategory ],
  function ( eta )
    local vertices, s_dim, r_dim, string;
    
    if not IsMatrixCategory( Range( CapCategory( eta ) ) ) then
      
      TryNextMethod();
      
    fi;
    
    vertices := List( SetOfObjects( Source( Source( eta ) ) ), UnderlyingVertex );
     
    s_dim := List( ValuesOfPreSheaf( Source( eta ) )[1], Dimension );
    
    r_dim := List( ValuesOfPreSheaf( Range( eta ) )[1], Dimension );
   
    string := ListN( vertices, s_dim, r_dim,
                { vertex, s, r } ->
                    Concatenation( "(", String( vertex ), ")->", String( s ), "x", String( r ) ) );
    
    string := JoinStringsWithSeparator( string, ", " );
    
    Print( "<", string, ">" );
    
end );

##
InstallMethod( Display,
          [ IsMorphismInPreSheafCategory ],
  function ( eta )
    local objects, images_of_objects, i;
    
    objects := SetOfObjects( Source( Source( eta ) ) );
    
    images_of_objects := ValuesOnAllObjects( eta );
    
    for i in [ 1 .. Length( objects ) ] do
      
      Print( "Image of " ); ViewObj( objects[i] ); Print( ":\n" );
      
      Display( images_of_objects[i] );

      Print( "\n" );
      
    od;
    
    Print( "A morphism in ", Name( CapCategory( eta ) ), " given by the above data\n" );
    
end );

##
InstallMethod( LaTeXOutput,
          [ IsObjectInPreSheafCategory ],
          
  function( F )
    local objs, v_objs, mors, v_mors, s, i;
    
    objs := SetOfObjects( Source( F ) );
    v_objs := ValuesOfPreSheaf( F )[1];
    
    mors := SetOfGeneratingMorphisms( Source( F ) );
    v_mors := ValuesOfPreSheaf( F )[2];
    
    s := "\\begin{array}{ccc}\n ";
    
    for i in [ 1 .. Length( objs ) ] do
      
      s := Concatenation(
              s,
              LaTeXOutput( objs[ i ] ),
              " & \\mapsto & ",
              LaTeXOutput( v_objs[ i ] ),
              " \\\\ "
            );
      
    od;
    
    s := Concatenation( s, "\\hline & & \\\\" );
    
    for i in [ 1 .. Length( mors ) ] do
      
      s := Concatenation(
              s,
              LaTeXOutput( mors[ i ] : OnlyDatum := true ),
              " & \\mapsto & ",
              LaTeXOutput( v_mors[ i ] : OnlyDatum := false ),
              " \\\\ & & \\\\"
            );
    od;
    
    s := Concatenation( s, "\\end{array}" );
    
    return s;
    
end );

##
InstallMethod( LaTeXOutput,
          [ IsMorphismInPreSheafCategory ],
          
  function( eta )
    local only_datum, objs, v_objs, i, datum;
    
    only_datum := ValueOption( "OnlyDatum" );
    
    objs := SetOfObjects( Source( Source( eta ) ) );
    
    v_objs := ValuesOnAllObjects( eta );
    
    datum := "\\begin{array}{ccc}\n";
    
    for i in [ 1 .. Length( objs ) ] do
      
      datum := Concatenation(
                  datum,
                  LaTeXOutput( objs[ i ] ),
                  " & \\mapsto & ",
                  LaTeXOutput( v_objs[ i ] : OnlyDatum := false ),
                  " \\\\ & & \\\\" );
    
    od;
    
    datum := Concatenation( datum, "\\end{array}" );
    
    if only_datum = true then
      
      return datum;
      
    else
      
      return Concatenation(
                LaTeXOutput( Source( eta ) ),
                "\\xrightarrow{",
                datum,
                "}",
                LaTeXOutput( Range( eta ) )
              );
    
    fi;
    
end );
