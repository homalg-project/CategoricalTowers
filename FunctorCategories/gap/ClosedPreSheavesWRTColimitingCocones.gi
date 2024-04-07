# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallMethod( ClosedPreSheavesWRTCoproductCocones,
        "for a category and a list of coproduct cocones",
        [ IsCapCategory, IsList ],
        
  function ( C, coproduct_cocones )
    local H,
          object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          PSh, eta, Kleisli,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          PSh_J;
    
    if not ( ForAll( coproduct_cocones, IsList ) and
             ForAll( coproduct_cocones, pair -> IsCapCategoryObject( pair[1] ) and IsIdenticalObj( C, CapCategory( pair[1] ) ) ) and
             ForAll( coproduct_cocones, pair -> ForAll( pair[2], mor -> IsCapCategoryMorphism( mor ) and IsIdenticalObj( C, CapCategory( mor ) ) ) ) ) then
        
        Error( "the second argument `coproduct_cocones` must be a list of pairs, ",
               "where the first entry of the pair is an object in the category `C` and ",
               "the second entry a list of morphisms in `C`" );
        
    fi;
    
    H := RangeCategoryOfHomomorphismStructure( C );
    
    ##
    object_datum_type :=
      CapJitDataTypeOfNTupleOf( 2,
              CapJitDataTypeOfListOf( CapJitDataTypeOfObjectOfCategory( H ) ),
              CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( H ) ) );
    
    ##
    object_constructor :=
      function( PSh_J, pair )
        
        return CreateCapCategoryObjectWithAttributes( PSh_J,
                       Source, Source( PSh_J ),
                       Target, Target( PSh_J ),
                       AsPrimitiveValue, pair );
        
    end;
    
    ##
    object_datum := { PSh_J, o } -> AsPrimitiveValue( o );
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( H ) );
    
    ##
    morphism_constructor :=
      function( PSh_J, source, components, target )
        
        return CreateCapCategoryMorphismWithAttributes( PSh_J,
                       source,
                       target,
                       AsPrimitiveValue, components );
        
    end;
    
    ##
    morphism_datum := { PSh_J, m } -> AsPrimitiveValue( m );
    
    ## building the categorical tower:
    
    PSh := PreSheaves( C : FinalizeCategory := true );
    
    eta := ClosureOfPreSheavesWRTCoproductCocones( PSh, coproduct_cocones );
    
    Kleisli := KleisliReflectiveSubcategoryOfIdempotentMonad( eta :
                       properties := [ "IsFiniteBicompleteCategory" ],
                       additional_operations_to_install := CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCartesianCategory,
                       supports_empty_limits := true,
                       FinalizeCategory := false );
    
    AddCoproduct( Kleisli,
      function( Kleisli, list_of_cofactors )
        local PSh, coproduct, closure;
        
        PSh := AmbientCategory( Kleisli );
        
        coproduct := Coproduct( PSh,
                             List( list_of_cofactors, cofactor ->
                                   ObjectDatum( Kleisli, cofactor ) ) );
        
        closure := Target( EmbeddingIntoClosureOfPreSheafWRTCoproductCocones( PSh, coproduct, coproduct_cocones ) );
        
        return ObjectConstructor( Kleisli,
                       closure );
        
    end );
    
    ## TODO:
    ## AddInjectionOfCofactorOfCoproductWithGivenCoproduct
    ## AddUniversalMorphismFromCoproductWithGivenCoproduct
    
    Finalize( Kleisli : FinalizeCategory := true );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function( PSh_J, pair )
        local Kleisli, PSh;
        
        Kleisli := ModelingCategory( PSh_J );
        
        PSh := AmbientCategory( Kleisli );
        
        return ObjectConstructor( Kleisli,
                       ObjectConstructor( PSh,
                               pair ) );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function( PSh_J, obj )
        local Kleisli, PSh;
        
        Kleisli := ModelingCategory( PSh_J );
        
        PSh := AmbientCategory( Kleisli );
        
        return ObjectDatum( PSh,
                       ObjectDatum( Kleisli,
                               obj ) );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( PSh_J, source, images, target )
        local Kleisli, PSh;
        
        Kleisli := ModelingCategory( PSh_J );
        
        PSh := AmbientCategory( Kleisli );
        
        return MorphismConstructor( Kleisli,
                       source,
                       MorphismConstructor( PSh,
                               ObjectDatum( Kleisli, source ),
                               images,
                               ObjectDatum( Kleisli, target ) ),
                       target );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( PSh_J, mor )
        local Kleisli, PSh;
        
        Kleisli := ModelingCategory( PSh_J );
        
        PSh := AmbientCategory( Kleisli );
        
        return MorphismDatum( PSh,
                       MorphismDatum( Kleisli,
                               mor ) );
        
    end;
    
    ##
    PSh_J :=
      ReinterpretationOfCategory( Kleisli,
              rec( name := Concatenation( "ClosedPreSheavesWRTCoproductCocones( ", Name( C ), ", coproduct_cocones )" ),
                   category_filter := IsClosedPreSheavesWRTColimitingCocones,
                   category_object_filter := IsObjectInClosedPreSheavesWRTColimitingCocones,
                   category_morphism_filter := IsMorphismInClosedPreSheavesWRTColimitingCocones,
                   object_datum_type := object_datum_type,
                   morphism_datum_type := morphism_datum_type,
                   object_constructor := object_constructor,
                   object_datum := object_datum,
                   morphism_constructor := morphism_constructor,
                   morphism_datum := morphism_datum,
                   modeling_tower_object_constructor := modeling_tower_object_constructor,
                   modeling_tower_object_datum := modeling_tower_object_datum,
                   modeling_tower_morphism_constructor := modeling_tower_morphism_constructor,
                   modeling_tower_morphism_datum := modeling_tower_morphism_datum,
                   only_primitive_operations := true )
              : FinalizeCategory := false );
    
    SetSource( PSh_J, C );
    SetTarget( PSh_J, Target( PSh ) );
    SetUnderlyingColimitingCocones( PSh_J, coproduct_cocones );
    
    #if CanCompute( Kleisli, "SetOfObjectsOfCategory" ) then
    #    
    #    ## add a potentially slower method, but that does not need to generate all objects in PSh
    #    AddSetOfObjectsOfCategory( PSh_J,
    #      function( PSh_J )
    #        local C, Yoneda, representables, joins;
    #        
    #        C := Source( PSh_J );
    #        
    #        ## the Yoneda embedding: C ↪ PSh_J( C )
    #        Yoneda := YonedaEmbeddingDataOfSourceCategory( PSh_J );
    #        
    #        representables := List( SetOfObjects( C ), Yoneda[1] );
    #        
    #        representables := Filtered( representables, representable -> not IsInitial( PSh_J, representable ) );
    #        
    #        joins := AllCoproducts( PSh_J, representables );
    #        
    #        return List( Concatenation( joins ), entry -> entry[2] );
    #        
    #    end );
    #    
    #fi;
    
    Append( PSh_J!.compiler_hints.category_attribute_names,
            [ "Source",
              "Target",
              "UnderlyingColimitingCocones" ] );
    
    Finalize( PSh_J );
    
    return PSh_J;
    
end );

##
InstallMethod( ClosedPreSheavesWRTCoproducts,
        "for a category and a list of coproduct cocones",
        [ IsCapCategory, IsList ],
        
  function ( C, lists_of_coproduct_cofactors )
    
    return ClosedPreSheavesWRTCoproductCocones( C, CoconesOfCoproducts( C, lists_of_coproduct_cofactors ) );
    
end );

##
InstallMethod( ClosedPreSheavesWRTCoproductsByIndices,
        "for a category and a list of coproduct cocones",
        [ IsCapCategory, IsList ],
        
  function ( C, lists_of_coproduct_cofactors_by_indices )
    
    return ClosedPreSheavesWRTCoproductCocones( C, CoconesOfCoproductsByIndices( C, lists_of_coproduct_cofactors_by_indices ) );
    
end );

##
InstallMethod( \.,
        "for the category of closed presheaves with respect to colimiting cocones and a positive integer",
        [ IsClosedPreSheavesWRTColimitingCocones, IsPosInt ],
        
  function( PSh_J, string_as_int )
    local name, Kleisli, c;
    
    name := NameRNam( string_as_int );
    
    Kleisli := ModelingCategory( PSh_J );
    
    c := Kleisli.(name);
    
    if IsCapCategoryObject( c ) and IsIdenticalObj( CapCategory( c ), Kleisli ) then
        
        return ReinterpretationOfObject( PSh_J, c );
        
    elif IsCapCategoryMorphism( c ) and IsIdenticalObj( CapCategory( c ), Kleisli ) then
        
        return ReinterpretationOfMorphism( PSh_J,
                       ReinterpretationOfObject( PSh_J, Source( c ) ),
                       c,
                       ReinterpretationOfObject( PSh_J, Target( c ) ) );
        
    else
        
        Error( "`c` is neither an object nor a morphism in the Kleisli category `Kleisli`\n" );
        
    fi;
    
end );

##
InstallMethodForCompilerForCAP( SetOfObjects,
        "for the category of closed presheaves with respect to colimiting cocones",
        [ IsClosedPreSheavesWRTColimitingCocones ],
        
  function( cat )
    
    return SetOfObjectsOfCategory( cat );
    
end );

##
InstallMethodForCompilerForCAP( SetOfGeneratingMorphisms,
        "for the category of closed presheaves with respect to colimiting cocones",
        [ IsClosedPreSheavesWRTColimitingCocones ],
        
  function( cat )
    
    return SetOfGeneratingMorphismsOfCategory( cat );
    
end );

##
InstallMethodForCompilerForCAP( YonedaEmbeddingDataOfSourceCategory,
        "for a category of closed presheaves w.r.t. colimiting cocones",
        [ IsClosedPreSheavesWRTColimitingCocones ],
        
  function ( PSh_J )
    local C, yoneda_data, Yoneda_on_objs, Yoneda_on_mors;
    
    C := Source( PSh_J );
    
    yoneda_data := YonedaEmbeddingData( C );
    
    Yoneda_on_objs :=
      function ( obj )
        
        return ObjectConstructor( PSh_J,
                       yoneda_data[1]( obj ) );
        
    end;
    
    Yoneda_on_mors :=
      function ( source, mor, target )
        local source_on_objs, target_on_objs;
        
        Error( "not implemented yet" );
        
        source_on_objs := ObjectDatum( PSh_J, source )[1];
        target_on_objs := ObjectDatum( PSh_J, target )[1];
        
        return MorphismConstructor( PSh_J,
                       source,
                       yoneda_data[2]( source_on_objs, mor, target_on_objs ),
                       target );
        
    end;
    
    return Pair( Yoneda_on_objs, Yoneda_on_mors );
    
end );

##
InstallMethod( YonedaEmbeddingOfSourceCategory,
        "for a category of closed presheaves w.r.t. colimiting cocones",
        [ IsClosedPreSheavesWRTColimitingCocones ],
        
  function ( PSh_J )
    local C, Yoneda, Yoneda_data;
    
    C := Source( PSh_J );
    
    Yoneda := CapFunctor( "Yoneda embedding functor", C, PSh_J );
    
    Yoneda_data := YonedaEmbeddingDataOfSourceCategory( PSh_J );
    
    AddObjectFunction( Yoneda, Yoneda_data[1] );
    
    AddMorphismFunction( Yoneda,  Yoneda_data[2] );
    
    return Yoneda;
    
end );

####################################
#
# Methods for operations
#
####################################

##
InstallOtherMethodForCompilerForCAP( IsClosedPreSheafWRTCoproductCocones,
        [ IsPreSheafCategory, IsObjectInPreSheafCategory, IsList ],
        
  function( PSh, presheaf, list_of_coproduct_cones )
    local H, coproducts, cocones;
    
    H := Target( PSh );
    
    coproducts := List( list_of_coproduct_cones, cocone -> cocone[1] );
    cocones := List( list_of_coproduct_cones, cocone -> cocone[2] );
    
    return ForAll( [ 1 .. Length( coproducts ) ], i ->
                   IsIsomorphism( H,
                           UniversalMorphismIntoDirectProduct( H,
                                   List( cocones[i], morphism ->
                                         ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, presheaf, Source( morphism ) ) ),
                                   ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, presheaf, coproducts[i] ),
                                   List( cocones[i], morphism ->
                                         ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToMorphism( PSh, presheaf, morphism ) ) ) ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( IsClosedPreSheafWRTCoproducts,
        [ IsPreSheafCategory and IsThinCategory, IsObjectInPreSheafCategory, IsList ],
        
  function( PSh, presheaf, lists_of_coproduct_cofactors )
    local list_of_coproduct_cones;
    
    list_of_coproduct_cones := CoconesOfCoproducts( Source( PSh ), lists_of_coproduct_cofactors );
    
    return IsClosedPreSheafWRTCoproductCocones( PSh, presheaf, list_of_coproduct_cones );
    
end );

##
InstallOtherMethodForCompilerForCAP( IsClosedPreSheafWRTCoproductsByIndices,
        [ IsPreSheafCategory and IsThinCategory, IsObjectInPreSheafCategory, IsList ],
        
  function( PSh, presheaf, lists_of_coproduct_cofactors_by_indices )
    local lists_of_coproduct_cofactors;
    
    lists_of_coproduct_cofactors := CoconesOfCoproductsByIndices( Source( PSh ), lists_of_coproduct_cofactors_by_indices );
    
    return IsClosedPreSheafWRTCoproducts( PSh, presheaf, lists_of_coproduct_cofactors );
    
end );

##
InstallOtherMethodForCompilerForCAP( EmbeddingIntoClosureOfPreSheafWRTCoproductCocone,
        [ IsPreSheafCategory, IsObjectInPreSheafCategory, IsList ],
        
  function( PSh, presheaf, coproduct_cocone )
    local C, H, C_hat, ColimitQuiversC, objects, id_objects,
          colim_quiver_of_presheaf, vertices_arrows, vertices, arrows, v, vertices_indices,
          coproduct, id_coproduct, c, coproduct_index, coproduct_indices_in_vertices,
          cocone, l, diagram, diagram_indices, diagram_indices_in_vertices,
          direct_product_diagram, direct_product, universal_morphism, universal_map, projection_morphisms, projection_maps,
          d, additional_vertices, additional_arrows_in, additional_arrows_out, closure_of_colim_quiver_of_presheaf, embedding;
    
    ## categories
    C := Source( PSh );
    H := Target( PSh );
    
    C_hat := FiniteColimitCompletionWithStrictCoproductsOfSourceCategory( PSh );
    
    ColimitQuiversC := CategoryOfColimitQuiversOfSourceCategory( PSh );
    
    objects := SetOfObjects( C );
    
    id_objects := List( objects, o -> IdentityMorphism( C, o ) );
    
    ## presheaf
    colim_quiver_of_presheaf := AssociatedColimitQuiver( C_hat, CoYonedaLemmaOnObjects( presheaf ) );
    
    vertices_arrows := ObjectDatum( ColimitQuiversC, colim_quiver_of_presheaf );
    
    vertices := vertices_arrows[1];
    arrows := vertices_arrows[2];
    
    v := Length( vertices );
    
    vertices_indices := List( vertices, vertex -> -1 + SafeUniquePositionProperty( objects, o -> IsEqualForObjects( C, vertex, o ) ) );
    
    ## coproduct
    coproduct := coproduct_cocone[1];
    
    id_coproduct := IdentityMorphism( C, coproduct );
    
    c := presheaf( coproduct );
    
    coproduct_index := -1 + SafeUniquePositionProperty( objects, o -> IsEqualForObjects( C, coproduct_cocone[1], o ) );
    
    coproduct_indices_in_vertices := Positions( vertices_indices, coproduct_index );
    
    ## cocone
    cocone := coproduct_cocone[2];
    
    l := Length( cocone );
    
    ## diagram
    diagram := List( cocone, Source );
    
    diagram_indices := List( diagram, obj ->
                             -1 + SafeUniquePositionProperty( objects, o -> IsEqualForObjects( C, obj, o ) ) );
    
    diagram_indices_in_vertices := List( diagram_indices, i -> Positions( vertices_indices, i ) );
    
    ## direct product
    direct_product_diagram := List( diagram, presheaf );
    
    direct_product := DirectProduct( H, direct_product_diagram );
    
    universal_morphism := UniversalMorphismIntoDirectProductWithGivenDirectProduct( H,
                                  direct_product_diagram,
                                  c,
                                  List( cocone, presheaf ),
                                  direct_product );
    
    universal_map := MorphismDatum( H, universal_morphism );
    
    projection_morphisms := List( [ 1 .. l ], p ->
                                  ProjectionInFactorOfDirectProductWithGivenDirectProduct( H,
                                          direct_product_diagram,
                                          p,
                                          direct_product ) );
    
    projection_maps := List( [ 1 .. l ], p -> AsList( projection_morphisms[p] ) );
    
    d := Length( direct_product );
    
    ## closure of colimit quiver of presheaf
    additional_vertices := ListWithIdenticalEntries( d, coproduct );
    
    additional_arrows_in := List( [ 0 .. Length( c ) - 1 ], i ->
                                  Triple( v + universal_map[1 + i], id_coproduct, -1 + coproduct_indices_in_vertices[1 + i] ) );
    
    additional_arrows_out := List( [ 1 .. l ], p ->
                                   List( [ 0 .. d - 1 ], i ->
                                         Triple( -1 + diagram_indices_in_vertices[p][1 + projection_maps[p][1 + i]], cocone[p], v + i ) ) );
    
    closure_of_colim_quiver_of_presheaf := CreateColimitQuiver( ColimitQuiversC,
                                                   Pair( Concatenation( vertices, additional_vertices ),
                                                         Concatenation( arrows, additional_arrows_in, Concatenation( additional_arrows_out ) ) ) );
    
    embedding := CreateMorphismOfColimitQuivers( ColimitQuiversC,
                         colim_quiver_of_presheaf,
                         Pair( Pair( [ 0 .. v - 1 ], id_objects{1 + vertices_indices} ),
                               [ 0 .. Length( arrows ) - 1 ] ),
                         closure_of_colim_quiver_of_presheaf );
    
    return AssociatedCellInPreSheaves( ColimitQuiversC, embedding );
    
end );

##
InstallMethod( EmbeddingIntoClosureOfPreSheafWRTCoproductCocone,
        [ IsObjectInPreSheafCategory, IsList ],
        
  function( presheaf, coproduct_cocone )
    
    return EmbeddingIntoClosureOfPreSheafWRTCoproductCocone( CapCategory( presheaf ), presheaf, coproduct_cocone );
    
end );

##
InstallOtherMethodForCompilerForCAP( EmbeddingIntoClosureOfPreSheafWRTCoproductCocones,
        [ IsPreSheafCategory, IsObjectInPreSheafCategory, IsList ],
        
  function( PSh, presheaf, coproduct_cocones )
    local func, emb;
    
    func :=
      function( embedding, cocone )
        return PreCompose( PSh,
                       embedding,
                       EmbeddingIntoClosureOfPreSheafWRTCoproductCocone( PSh,
                               Target( embedding ),
                               cocone ) );
    end;
    
    emb := Iterated( coproduct_cocones,
                   func,
                   IdentityMorphism( PSh, presheaf ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsClosedPreSheafWRTCoproductCocones( PSh, Target( emb ), coproduct_cocones ) );
    
    return emb;
    
end );

##
InstallMethod( EmbeddingIntoClosureOfPreSheafWRTCoproductCocones,
        [ IsObjectInPreSheafCategory, IsList ],
        
  function( presheaf, coproduct_cocones )
    
    return EmbeddingIntoClosureOfPreSheafWRTCoproductCocones( CapCategory( presheaf ), presheaf, coproduct_cocones );
    
end );

##
InstallOtherMethodForCompilerForCAP( EmbeddingIntoClosureOfPreSheafWRTCoproducts,
        [ IsPreSheafCategory and IsThinCategory, IsObjectInPreSheafCategory, IsList ],
        
  function( PSh, presheaf, lists_of_coproduct_cofactors )
    local list_of_coproduct_cones;
    
    list_of_coproduct_cones := CoconesOfCoproducts( Source( PSh ), lists_of_coproduct_cofactors );
    
    return EmbeddingIntoClosureOfPreSheafWRTCoproductCocones( PSh, presheaf, list_of_coproduct_cones );
    
end );

##
InstallMethod( EmbeddingIntoClosureOfPreSheafWRTCoproducts,
        [ IsObjectInPreSheafCategory, IsList ],
        
  function( presheaf, lists_of_coproduct_cofactors )
    
    return EmbeddingIntoClosureOfPreSheafWRTCoproducts( CapCategory( presheaf ), presheaf, lists_of_coproduct_cofactors );
    
end );

##
InstallMethod( ClosureOfPreSheavesWRTCoproductCocones,
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsList ],
        
  function( PSh, coproducts_cocones )
    local Id_PSh, ClosureMonad, UnitOfClosureMonad;
    
    Id_PSh := IdentityFunctor( PSh );
    
    ClosureMonad := CapFunctor( "Closure idempotent monad with respect to coproduct cocones", PSh, PSh );
    
    AddObjectFunction( ClosureMonad,
      function( object )
        
        return Target( EmbeddingIntoClosureOfPreSheafWRTCoproductCocones( PSh, object, coproducts_cocones ) );
        
    end );
    
    AddMorphismFunction( ClosureMonad,
      function( source, morphism, target )
        
        Error( "not implemented yet\n" );
        
    end );
    
    ClosureMonad!.ObjectMembershipFunction := presheaf -> IsClosedPreSheafWRTCoproductCocones( PSh, presheaf, coproducts_cocones );
    
    UnitOfClosureMonad := NaturalTransformation( Id_PSh, ClosureMonad );
    
    AddNaturalTransformationFunction( UnitOfClosureMonad,
      function( source, object, target )
        
        return EmbeddingIntoClosureOfPreSheafWRTCoproductCocones( PSh, object, coproducts_cocones );
        
    end );
    
    return UnitOfClosureMonad;
    
end );

##
InstallMethod( ClosureOfPreSheavesWRTCoproducts,
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsList ],
        
  function( PSh, lists_of_coproduct_cofactors )
    
    return ClosureOfPreSheavesWRTCoproductCocones( PSh, CoconesOfCoproducts( Source( PSh ), lists_of_coproduct_cofactors ) );
    
end );

##################################
##
## View & Display
##
##################################

##
InstallMethod( ViewObj,
        [ IsObjectInClosedPreSheavesWRTColimitingCocones ],
        
  function( a )
    
    Print( "An object in category of closed presheaves given by: " );
    
    ViewObj( ObjectDatum( CapCategory( a ), a ) );
    
end );

##
InstallMethod( ViewObj,
        [ IsMorphismInClosedPreSheavesWRTColimitingCocones ],
        
  function( phi )
    
    Print( "A morphism in category of closed presheaves given by: " );
    
    ViewObj( MorphismDatum( CapCategory( phi ), phi ) );
    
end );

##
InstallMethod( Display,
        [ IsObjectInClosedPreSheavesWRTColimitingCocones ],
        
  function( a )
    
    Display( ObjectDatum( CapCategory( a ), a ) );
    
    Display( "\nAn object in category of closed presheaves given by the above data" );
    
end );

##
InstallMethod( Display,
        [ IsMorphismInClosedPreSheavesWRTColimitingCocones ],
        
  function( phi )
    
    Display( MorphismDatum( CapCategory( phi ), phi ) );
    
    Display( "A morphism in category of closed presheaves given by the above data" );
    
end );
