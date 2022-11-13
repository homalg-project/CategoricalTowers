# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

####################################
#
# methods for operations:
#
####################################

##
InstallMethodForCompilerForCAP( ApplyObjectInCoPreSheafCategoryToObject,
        "for an object in a copresheaf category and a CAP object",
        [ IsCoPreSheafCategory, IsObjectInCoPreSheafCategory, IsCapCategoryObject ],
        
  function ( coPSh, F, objB )
    local pos;
    
    pos := SafePosition( SetOfObjects( Source( coPSh ) ), objB );
    
    return ValuesOfCoPreSheaf( F )[1][pos];
    
end );

##
InstallOtherMethod( UnderlyingCapTwoCategoryCell,
        "for an object in a copresheaf category",
        [ IsCoPreSheafCategory, IsObjectInCoPreSheafCategory ],
        
  function ( coPSh, F )
    local values;
    
    values := ValuesOfCoPreSheaf( F );
    
    return CapFunctor( Source( coPSh ), values[1], values[2], Range( coPSh ) );
    
end );

##
InstallMethod( UnderlyingCapTwoCategoryCell,
        "for an object in a copresheaf category",
        [ IsObjectInCoPreSheafCategory ],
        
  function ( F )
    
    return UnderlyingCapTwoCategoryCell( CapCategory( F ), F );
    
end );

##
InstallMethodForCompilerForCAP( ApplyObjectInCoPreSheafCategoryToMorphism,
        "for an object in a copresheaf category and a CAP morphism",
        [ IsCoPreSheafCategory, IsObjectInCoPreSheafCategory, IsCapCategoryMorphism ],
        
  function ( coPSh, F, morB )
    local pos;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    pos := Position( SetOfGeneratingMorphisms( Source( coPSh ) ), morB );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if IsInt( pos ) then
        return ValuesOfCoPreSheaf( F )[2][pos];
    fi;
    
    return FunctorMorphismOperation( UnderlyingCapTwoCategoryCell( coPSh, F ) )(
                   ApplyObjectInCoPreSheafCategoryToObject( coPSh, F, Source( morB ) ),
                   morB,
                   ApplyObjectInCoPreSheafCategoryToObject( coPSh, F, Range( morB ) ) );
    
end );

##
InstallMethodForCompilerForCAP( ApplyMorphismInCoPreSheafCategoryToObject,
        "for a morphism in a copresheaf category and a CAP object",
        [ IsCoPreSheafCategory, IsMorphismInCoPreSheafCategory, IsCapCategoryObject ],
        
  function ( coPSh, eta, objB )
    local pos;
    
    pos := SafePosition( SetOfObjects( Source( coPSh ) ), objB );
    
    return ValuesOnAllObjects( eta )[pos];
    
end );

##
InstallMethod( CallFuncList,
        "for an object in a copresheaf category and a list",
        [ IsObjectInCoPreSheafCategory, IsList ],
        
  function ( F, L )
    local coPSh;
    
    coPSh := CapCategory( F );
    
    if IsCapCategoryObject( L[1] ) then
        return ApplyObjectInCoPreSheafCategoryToObject( coPSh, F, L[1] );
    elif IsCapCategoryMorphism( L[1] ) then
        return ApplyObjectInCoPreSheafCategoryToMorphism( coPSh, F, L[1] );
    fi;
    
    Error( "the argument ", L[1], " is neither an object nor a morphism in ", Source( F ), "\n" );
    
end );

##
InstallMethod( CallFuncList,
        "for a morphism in a copresheaf category and a list",
        [ IsMorphismInCoPreSheafCategory, IsList ],
        
  function ( eta, L )
    
    if IsCapCategoryObject( L[1] ) then
        return ApplyMorphismInCoPreSheafCategoryToObject( CapCategory( eta ), eta, L[1] );
    fi;
    
    Error( "the argument ", L[1], " is not an object in ", Source( Source( eta ) ), "\n" );
    
end );

##
InstallMethod( \.,
        "for an object in a copresheaf category and positive integer",
        [ IsObjectInCoPreSheafCategory, IsPosInt ],
        
  function ( F, string_as_int )
    
    return F( Source( F ).(NameRNam( string_as_int )) );
    
end );

##
InstallMethod( \.,
        "for a morphism in a copresheaf category and positive integer",
        [ IsMorphismInCoPreSheafCategory, IsPosInt ],
        
  function ( eta, string_as_int )
    
    return eta( Source( Source( eta ) ).(NameRNam( string_as_int )) );
    
end );

####################################
#
# methods for constructors:
#
####################################

##
InstallOtherMethodForCompilerForCAP( CreateCoPreSheafByValues,
        "for a copresheaf category and two lists",
        [ IsCoPreSheafCategory, IsList ],
        
  function ( coPSh, values_of_copresheaf )
    
    return CreateCapCategoryObjectWithAttributes( coPSh,
                   Source, Source( coPSh ),
                   Range, Range( coPSh ),
                   ValuesOfCoPreSheaf, values_of_copresheaf );
    
end );

##
InstallMethodForCompilerForCAP( CreateCoPreSheafByValues,
        "for a copresheaf category and two lists",
        [ IsCoPreSheafCategory, IsList, IsList ],
        
  function ( coPSh, values_of_all_objects, values_of_all_generating_morphisms )
    
    return CreateCoPreSheafByValues( coPSh,
                   Pair( values_of_all_objects, values_of_all_generating_morphisms ) );
    
end );

##
InstallMethodForCompilerForCAP( CreateCoPreSheafByFunctions,
        "for a copresheaf category and two functions",
        [ IsCoPreSheafCategory, IsFunction, IsFunction ],
        
  function ( coPSh, copresheaf_on_objects, copresheaf_on_generating_morphisms )
    local defining_pair, nr_objs, mors, nr_mors, values_of_all_objects, values_of_all_generating_morphisms;
    
    defining_pair := DefiningPairOfUnderlyingQuiver( coPSh );
    
    nr_objs := defining_pair[1];
    mors := defining_pair[2];
    nr_mors := Length( mors );
    
    values_of_all_objects := LazyHList( [ 1 .. nr_objs ], o -> copresheaf_on_objects( o ) );
    values_of_all_generating_morphisms := LazyHList( [ 1 .. nr_mors ], m -> copresheaf_on_generating_morphisms(
                                                  copresheaf_on_objects( 1 + mors[m][1] ),
                                                  m,
                                                  copresheaf_on_objects( 1 + mors[m][2] ) ) );
    
    return CreateCoPreSheafByValues( coPSh, values_of_all_objects, values_of_all_generating_morphisms );
    
end );

##
InstallOtherMethod( CreateCoPreSheaf,
        "for a copresheaf category and a CAP functor",
        [ IsCoPreSheafCategory, IsCapFunctor ],
        
  function ( coPSh, F )
    local B, objs, mors, copresheaf_on_objects, copresheaf_on_generating_morphism;
    
    B := Source( coPSh );
    
    objs := SetOfObjects( B );
    mors := SetOfGeneratingMorphisms( B );
    
    copresheaf_on_objects := objB_index -> FunctorObjectOperation( F )( objs[objB_index] );
    copresheaf_on_generating_morphism := { source, morB_index, range } -> FunctorMorphismOperation( F )( source, mors[morB_index], range );
    
    return CreateCoPreSheafByFunctions( coPSh, copresheaf_on_objects, copresheaf_on_generating_morphism );
    
end );

##
InstallMethod( CreateCoPreSheaf,
        "for a CAP functor",
        [ IsCapFunctor ],
        
  function ( F )
    local coPSh;
    
    coPSh := CoPreSheaves( SourceOfFunctor( F ), RangeOfFunctor( F ) );
    
    return CreateCoPreSheaf( coPSh, F );
    
end );

##
InstallMethod( CreateCoPreSheaf,
        "for a CAP category, a record (of images of objects) and a record (of images of morphisms)",
        [ IsCapCategory, IsRecord, IsRecord ],
        
  function ( B, rec_images_of_objects, rec_images_of_morphisms )
    
    return CreateCoPreSheaf( CapFunctor( B, rec_images_of_objects, rec_images_of_morphisms ) );
    
end );

##
InstallMethod( CreateCoPreSheaf,
        "for a CAP category, a list (of images of objects) and a list (of images of morphisms)",
        [ IsCapCategory, IsList, IsList ],
        
  function ( B, images_of_objects, images_of_morphisms )
    
    if IsEmpty( images_of_objects ) then
        Error( "the list of images is empty\n" );
    fi;
    
    return CreateCoPreSheaf( CapFunctor( B, images_of_objects, images_of_morphisms, CapCategory( images_of_objects[1] ) ) );
    
end );

##
InstallMethod( CreateCoPreSheaf,
        "for a copresheaf category and two lists",
        [ IsCoPreSheafCategory and HasRangeCategoryOfHomomorphismStructure, IsList, IsList ],
        
  function ( coPSh, dims, matrices )
    local kmat, objects, morphisms, k, mat;
    
    if dims = [ ] then
        Error( "the list of dimensions is empty\n" );
    elif not IsInt( dims[1] ) then
        Error( "expecting a list of integers as the second argument but received ", dims, "\n" );
    fi;
    
    kmat := RangeCategoryOfHomomorphismStructure( coPSh );
        
    if not ( IsMatrixCategory( kmat ) or IsCategoryOfRows( kmat ) ) then
        TryNextMethod( );
    fi;
    
    objects := List( dims, dim -> dim / kmat );
    
    morphisms := SetOfGeneratingMorphisms( Source( coPSh ) );
    
    k := CommutativeRingOfLinearCategory( kmat );
    
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
    
    return CreateCoPreSheafByValues( coPSh, objects, morphisms );
    
end );

##
InstallOtherMethodForCompilerForCAP( CreateCoPreSheafMorphismByValues,
        "for a copresheaf category, two objects in the copresheaf category, and a list",
        [ IsCoPreSheafCategory, IsObjectInCoPreSheafCategory, IsList, IsObjectInCoPreSheafCategory ],
        
  function ( coPSh, source, values_on_all_objects, range )
    
    return CreateCapCategoryMorphismWithAttributes( coPSh,
                   source,
                   range,
                   ValuesOnAllObjects, values_on_all_objects );
    
end );

##
InstallOtherMethodForCompilerForCAP( CreateCoPreSheafMorphism,
        "for a copresheaf category, two objects in the copresheaf category, and a function",
        [ IsCoPreSheafCategory, IsObjectInCoPreSheafCategory, IsFunction, IsObjectInCoPreSheafCategory ],
        
  function ( coPSh, source, natural_transformation_on_objects, range )
    local nr_objs, source_values, range_values, values_on_all_objects;
    
    nr_objs := DefiningPairOfUnderlyingQuiver( coPSh )[1];
    
    source_values := ValuesOfCoPreSheaf( source )[1];
    range_values := ValuesOfCoPreSheaf( range )[1];
    
    values_on_all_objects := LazyHList( [ 1 .. nr_objs ],
                                     o -> natural_transformation_on_objects( source_values[o], o, range_values[o] ) );
    
    return CreateCoPreSheafMorphismByValues( coPSh, source, values_on_all_objects, range );
    
end );

##
InstallOtherMethodForCompilerForCAP( CreateCoPreSheafMorphism,
        "for a copresheaf category and a CAP natural transformation",
        [ IsCoPreSheafCategory, IsCapNaturalTransformation ],
        
  function ( coPSh, eta )
    local B, objs;
    
    B := Source( coPSh );
    
    objs := SetOfObjects( B );
    
    return CreateCoPreSheafMorphism( coPSh,
                   CreateCoPreSheaf( Source( eta ) ),
                   { source, objB_index, range } -> NaturalTransformationOperation( eta )( source, objs[objB_index], range ),
                   CreateCoPreSheaf( Range( eta ) ) );
    
end );

##
InstallMethod( CreateCoPreSheafMorphism,
        "for a CAP natural transformation",
        [ IsCapNaturalTransformation ],
        
  function ( eta )
    local F, coPSh;
    
    F := Source( eta );
    
    coPSh := CoPreSheaves( SourceOfFunctor( F ), RangeOfFunctor( F ) );
    
    return CreateCoPreSheafMorphism( coPSh, eta );
    
end );

##
InstallMethod( CreateCoPreSheafMorphism,
        "for a record and two objects in a copresheaf category",
        [ IsObjectInCoPreSheafCategory, IsRecord, IsObjectInCoPreSheafCategory ],
        
  function ( U, e, V )
    local eta;

    eta := NaturalTransformation(
                   e,
                   UnderlyingCapTwoCategoryCell( U ),
                   UnderlyingCapTwoCategoryCell( V ) );
    
    return CreateCoPreSheafMorphism( eta );
    
end );

##
InstallMethod( CreateCoPreSheafMorphism,
        "for two objects in a copresheaf category and a list",
        [ IsObjectInCoPreSheafCategory, IsList, IsObjectInCoPreSheafCategory ],
        
  function ( U, e, V )
    local kmat;
    
    if not IsEmpty( e ) and IsHomalgMatrix( e[1] ) then
        
        kmat := Range( U );
        
        e := List( e, mat -> mat / kmat );
        
    fi;
    
    return CreateCoPreSheafMorphismByValues( CapCategory( U ), U, e, V );
    
end );

##
InstallMethodWithCache( CoPreSheaves,
        "for a CAP category",
        [ IsCapCategory, IsCapCategory ],
        
  function( B, C )
    local object_constructor, object_datum,
          morphism_constructor, morphism_datum,
          defining_pair, Hom, O,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          coPSh, properties, name;
    
    ##
    object_constructor := CreateCoPreSheafByValues;
    
    ##
    object_datum := { coPSh, o } -> ValuesOfCoPreSheaf( o );
    
    ##
    morphism_constructor := CreateCoPreSheafMorphismByValues;
    
    ##
    morphism_datum := { coPSh, m } -> ValuesOnAllObjects( m );
    
    ## building the categorical tower
    
    Hom := FunctorCategory( B, C : FinalizeCategory := true );
    
    O := Opposite( Hom : FinalizeCategory := true );
    
    ## from the raw object data to the object in the highest stage of the tower
    modeling_tower_object_constructor :=
      function( coPSh, pair )
        local O, Hom;
        
        O := ModelingCategory( coPSh );
        
        Hom := OppositeCategory( O );
        
        return ObjectConstructor( O,
                       ObjectConstructor( Hom,
                               pair ) );
        
    end;
    
    ## from the object in the highest stage of the tower to the raw object data
    modeling_tower_object_datum :=
      function( coPSh, obj )
        local O, Hom;
        
        O := ModelingCategory( coPSh );
        
        Hom := OppositeCategory( O );
        
        return ObjectDatum( Hom,
                       ObjectDatum( O,
                               obj ) );
        
    end;
    
    ## from the raw morphism data to the morphism in the highest stage of the tower
    modeling_tower_morphism_constructor :=
      function( coPSh, source, images, range )
        local O, Hom;
        
        O := ModelingCategory( coPSh );
        
        Hom := OppositeCategory( O );
        
        return MorphismConstructor( O,
                       source,
                       MorphismConstructor( Hom,
                               ObjectDatum( O, range ),
                               images,
                               ObjectDatum( O, source ) ),
                       range );
        
    end;
    
    ## from the morphism in the highest stage of the tower to the raw morphism data
    modeling_tower_morphism_datum :=
      function( coPSh, mor )
        local O, Hom;
        
        O := ModelingCategory( coPSh );
        
        Hom := OppositeCategory( O );
        
        return MorphismDatum( Hom,
                       MorphismDatum( O,
                               mor ) );
        
    end;
    
    ##
    coPSh :=
      WrapperCategory( O,
              rec( name := Concatenation( "CoPreSheaves( ", Name( B ), ", ", Name( C ), " )" ),
                   category_filter := IsCoPreSheafCategory,
                   category_object_filter := IsObjectInCoPreSheafCategory,
                   category_morphism_filter := IsMorphismInCoPreSheafCategory,
                   object_constructor := object_constructor,
                   object_datum := object_datum,
                   morphism_datum := morphism_datum,
                   morphism_constructor := morphism_constructor,
                   modeling_tower_object_constructor := modeling_tower_object_constructor,
                   modeling_tower_object_datum := modeling_tower_object_datum,
                   modeling_tower_morphism_constructor := modeling_tower_morphism_constructor,
                   modeling_tower_morphism_datum := modeling_tower_morphism_datum,
                   only_primitive_operations := true ) : FinalizeCategory := false );
    
    SetSource( coPSh, B );
    SetRange( coPSh, C );
    
    SetSetOfObjects( coPSh, SetOfObjects( B ) );
    SetSetOfGeneratingMorphisms( coPSh, SetOfGeneratingMorphisms( B ) );
    
    SetDefiningPairOfUnderlyingQuiver( coPSh, DefiningPairOfUnderlyingQuiver( Hom ) );
    
    coPSh!.compiler_hints.category_attribute_names :=
      [ "ModelingCategory",
        "Source",
        "Range",
        "SetOfObjects",
        "SetOfGeneratingMorphisms",
        "DefiningPairOfUnderlyingQuiver",
        ];
    
    Finalize( coPSh );
    
    return coPSh;
    
end );

##
InstallMethodWithCache( CoPreSheaves,
        "for a CAP category and a homalg field",
        [ IsAlgebroid, IsHomalgRing and IsFieldForHomalg ],
        
  function ( B, k )
    local kmat, coPSh;
    
    if HasRangeCategoryOfHomomorphismStructure( B ) then
        
        kmat := RangeCategoryOfHomomorphismStructure( B );
        
    else
        
        kmat := CategoryOfRows( k );
        
    fi;
    
    Assert( 0, IsMatrixCategory( kmat ) or IsCategoryOfRows( kmat ) );
    
    CapCategorySwitchLogicOn( kmat );
    
    coPSh := CoPreSheaves( B, kmat );
    
    CapCategorySwitchLogicOn( coPSh );
    
    return coPSh;
    
end );

##
InstallMethod( CoPreSheaves,
        "for a CAP category",
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function( B )
    
    return CoPreSheaves( B, RangeCategoryOfHomomorphismStructure( B ) );
    
end );

####################################
#
# Methods for attributes
#
####################################

##
InstallMethodForCompilerForCAP( CoYonedaEmbeddingData,
        [ IsCoPreSheafCategory ],
        
  function ( coPSh )
    local B, objs, mors, coYoneda_on_objs, coYoneda_on_mors;
    
    B := Source( coPSh );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if not HasRangeCategoryOfHomomorphismStructure( B ) then
        TryNextMethod( );
    fi;
    
    objs := SetOfObjects( B );
    
    mors := SetOfGeneratingMorphisms( B );
    
    coYoneda_on_objs :=
      function ( obj )
        local Yobj;
        
        Yobj := CreateCoPreSheafByValues( coPSh,
                        Pair( List( objs, o -> HomomorphismStructureOnObjects( B, obj, o ) ),
                              List( mors, m -> HomomorphismStructureOnMorphisms( B, IdentityMorphism( B, obj ), m ) ) ) );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        SetIsInjective( Yobj, true );
        
        return Yobj;
        
    end;
    
    coYoneda_on_mors :=
      function ( s, mor, r )
        
        return CreateCoPreSheafMorphismByValues( coPSh,
                       s,
                       List( objs, o -> HomomorphismStructureOnMorphisms( B, mor, IdentityMorphism( B, o ) ) ),
                       r );
        
    end;
    
    return Pair( coYoneda_on_objs, coYoneda_on_mors );
    
end );

##
InstallMethod( CoYonedaEmbeddingOfSourceCategory,
        "for a copresheaf category",
        [ IsCoPreSheafCategory ],
        
  function ( coPSh )
    local B, coYoneda, coYoneda_data;
    
    B := Source( coPSh );
    
    coYoneda := CapFunctor( "co-Yoneda embedding functor", B, coPSh );
    
    coYoneda_data := CoYonedaEmbeddingData( coPSh );
    
    AddObjectFunction( coYoneda, coYoneda_data[1] );
    
    AddMorphismFunction( coYoneda,  coYoneda_data[2] );
    
    return coYoneda;
    
end );

##
InstallMethod( CoYonedaEmbedding,
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    
    return CoYonedaEmbeddingOfSourceCategory( CoPreSheaves( B ) );
    
end );

##
InstallMethod( \.,
        "for a copresheaf category and a positive integer",
        [ IsCoPreSheafCategory, IsPosInt ],
        
  function( coPSh, string_as_int )
    local name, coY, F, coYc;
    
    name := NameRNam( string_as_int );
    
    coY := CoYonedaEmbeddingOfSourceCategory( coPSh );
    
    F := SourceOfFunctor( coY );
    
    coYc := coY( F.(name) );
    
    if IsObjectInPreSheafCategory( coYc ) then
        
        SetIsProjective( coYc, true );
        
    elif IsMorphismInPreSheafCategory( coYc ) then
        
        if CanCompute( coPSh, "IsMonomorphism" ) then
            IsMonomorphism( coYc );
        fi;
        
        if CanCompute( coPSh, "IsSplitMonomorphism" ) then
            IsSplitMonomorphism( coYc );
        fi;
        
        if CanCompute( coPSh, "IsEpimorphism" ) then
            IsEpimorphism( coYc );
        fi;
        
        if CanCompute( coPSh, "IsSplitEpimorphism" ) then
            IsSplitEpimorphism( coYc );
        fi;
        
        ## IsIsomorphism = IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        if CanCompute( coPSh, "IsIsomorphism" ) then
            IsIsomorphism( coYc );
        fi;
        
    fi;
    
    return coYc;
    
end );

####################################
#
# View, Print, Display and LaTeX methods:
#
####################################

##
InstallMethod( ViewObj,
          [ IsObjectInCoPreSheafCategory ],
  function ( F )
    local algebroid, vertices, arrows, v_dim, v_string, a_dim, a_string, string;
    
    if not (IsMatrixCategory( Range( CapCategory( F ) ) ) or IsCategoryOfRows( Range( CapCategory( F ) ) )) then
      
      TryNextMethod();
      
    fi;
    
    algebroid := Source( CapCategory( F ) );
    
    vertices := List( SetOfObjects( algebroid ), UnderlyingVertex );
    
    v_dim := List( ValuesOfCoPreSheaf( F )[1], ObjectDatum );
    
    v_string := ListN( vertices, v_dim, { vertex, dim } -> Concatenation( "(", String( vertex ), ")->", String( dim ) ) );
    
    v_string := JoinStringsWithSeparator( v_string, ", " );
    
    arrows := List( SetOfGeneratingMorphisms( algebroid ), UnderlyingQuiverAlgebraElement );
    
    if not IsPathAlgebra( UnderlyingQuiverAlgebra( algebroid ) ) then
      
      arrows := List( arrows, a -> Paths( Representative( a ) )[ 1 ] );
      
    else
      
      arrows := List( arrows, a -> Paths( a )[ 1 ] );
      
    fi;
    
    a_dim := List( ValuesOfCoPreSheaf( F )[2], m -> [ ObjectDatum( Source( m ) ), ObjectDatum( Range( m ) ) ] );
    
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
          [ IsObjectInCoPreSheafCategory ],
  function ( F )
    local objects, images_of_objects, morphisms, images_of_morphisms, i;
    
    objects := SetOfObjects( Source( F ) );
    
    images_of_objects := ValuesOfCoPreSheaf( F )[1];

    for i in [ 1 .. Length( objects ) ] do
      
      Print( "Image of " ); ViewObj( objects[i] ); Print( ":\n" );
      
      Display( images_of_objects[i] );
      
      Print( "\n" );
      
    od;
    
    morphisms := SetOfGeneratingMorphisms( Source( F ) );
    
    images_of_morphisms := ValuesOfCoPreSheaf( F )[2];
    
    for i in [ 1 .. Length( morphisms ) ] do
       
      Print( "Image of " ); ViewObj( morphisms[i] ); Print( ":\n" );
      
      Display( images_of_morphisms[i] );
      
      Print( "\n" );
      
    od;
    
    Print( "An object in ", Name( CapCategory( F ) ), " given by the above data\n" );
    
end );


##
InstallMethod( ViewObj,
          [ IsMorphismInCoPreSheafCategory ],
  function ( eta )
    local vertices, s_dim, r_dim, string;
    
    if not (IsMatrixCategory( Range( CapCategory( eta ) ) ) or IsCategoryOfRows( Range( CapCategory( eta ) ) )) then
      
      TryNextMethod();
      
    fi;
    
    vertices := List( SetOfObjects( Source( Source( eta ) ) ), UnderlyingVertex );
     
    s_dim := List( ValuesOfCoPreSheaf( Source( eta ) )[1], ObjectDatum );
    
    r_dim := List( ValuesOfCoPreSheaf( Range( eta ) )[1], ObjectDatum );
   
    string := ListN( vertices, s_dim, r_dim,
                { vertex, s, r } ->
                    Concatenation( "(", String( vertex ), ")->", String( s ), "x", String( r ) ) );
    
    string := JoinStringsWithSeparator( string, ", " );
    
    Print( "<", string, ">" );
    
end );

##
InstallMethod( Display,
          [ IsMorphismInCoPreSheafCategory ],
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
          [ IsObjectInCoPreSheafCategory ],
          
  function( F )
    local objs, v_objs, mors, v_mors, s, i;
    
    objs := SetOfObjects( Source( F ) );
    v_objs := ValuesOfCoPreSheaf( F )[1];
    
    mors := SetOfGeneratingMorphisms( Source( F ) );
    v_mors := ValuesOfCoPreSheaf( F )[2];
    
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
          [ IsMorphismInCoPreSheafCategory ],
          
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
