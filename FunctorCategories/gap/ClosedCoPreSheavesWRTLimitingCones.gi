# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallMethod( ClosedCoPreSheavesWRTProductCones,
        "for a category and a list of product cones",
        [ IsCapCategory, IsList ],
        
  function ( C, product_cones )
    local H,
          object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          C_op, coproduct_cocones, PSh_C_op_J, op_PSh_C_op_J,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          coPSh_J;
    
    if not ( ForAll( product_cones, IsList ) and
             ForAll( product_cones, pair -> IsCapCategoryObject( pair[1] ) and IsIdenticalObj( C, CapCategory( pair[1] ) ) ) and
             ForAll( product_cones, pair -> ForAll( pair[2], mor -> IsCapCategoryMorphism( mor ) and IsIdenticalObj( C, CapCategory( mor ) ) ) ) ) then
        
        Error( "the second argument `product_cones` must be a list of pairs, ",
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
      function( coPSh_J, pair )
        
        return CreateCapCategoryObjectWithAttributes( coPSh_J,
                       Source, Source( coPSh_J ),
                       Target, Target( coPSh_J ),
                       AsPrimitiveValue, pair );
        
    end;
    
    ##
    object_datum := { coPSh_J, o } -> AsPrimitiveValue( o );
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( H ) );
    
    ##
    morphism_constructor :=
      function( coPSh_J, source, components, target )
        
        return CreateCapCategoryMorphismWithAttributes( coPSh_J,
                       source,
                       target,
                       AsPrimitiveValue, components );
        
    end;
    
    ##
    morphism_datum := { coPSh_J, m } -> AsPrimitiveValue( m );
    
    ## building the categorical tower:
    
    C_op := Opposite( C : FinalizeCategory := true, only_primitive_operations := true );
    
    coproduct_cocones := List( product_cones, pair ->
                               Pair( ObjectConstructor( C_op, pair[1] ),
                                     List( pair[2], mor ->
                                           MorphismConstructor( C_op,
                                                   ObjectConstructor( C_op, Target( mor ) ),
                                                   mor,
                                                   ObjectConstructor( C_op, Source( mor ) ) ) ) ) );
    
    PSh_C_op_J := ClosedPreSheavesWRTCoproductCocones( C_op, coproduct_cocones : FinalizeCategory := true );
    
    op_PSh_C_op_J := Opposite( PSh_C_op_J : FinalizeCategory := true, only_primitive_operations := true );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function( coPSh_J, pair )
        local op_PSh_C_op_J, PSh_C_op_J;
        
        op_PSh_C_op_J := ModelingCategory( coPSh_J );
        
        PSh_C_op_J := OppositeCategory( op_PSh_C_op_J );
        
        return ObjectConstructor( op_PSh_C_op_J,
                       ObjectConstructor( PSh_C_op_J,
                               pair ) );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function( coPSh_J, obj )
        local op_PSh_C_op_J, PSh_C_op_J;
        
        op_PSh_C_op_J := ModelingCategory( coPSh_J );
        
        PSh_C_op_J := OppositeCategory( op_PSh_C_op_J );
        
        return ObjectDatum( PSh_C_op_J,
                       ObjectDatum( op_PSh_C_op_J,
                               obj ) );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( coPSh_J, source, images, target )
        local op_PSh_C_op_J, PSh_C_op_J;
        
        op_PSh_C_op_J := ModelingCategory( coPSh_J );
        
        PSh_C_op_J := OppositeCategory( op_PSh_C_op_J );
        
        return MorphismConstructor( op_PSh_C_op_J,
                       source,
                       MorphismConstructor( PSh_C_op_J,
                               ObjectDatum( op_PSh_C_op_J, target ),
                               images,
                               ObjectDatum( op_PSh_C_op_J, source ) ),
                       target );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( coPSh_J, mor )
        local op_PSh_C_op_J, PSh_C_op_J;
        
        op_PSh_C_op_J := ModelingCategory( coPSh_J );
        
        PSh_C_op_J := OppositeCategory( op_PSh_C_op_J );
        
        return MorphismDatum( PSh_C_op_J,
                       MorphismDatum( op_PSh_C_op_J,
                               mor ) );
        
    end;
    
    ##
    coPSh_J :=
      ReinterpretationOfCategory( op_PSh_C_op_J,
              rec( name := Concatenation( "ClosedCoPreSheavesWRTProductCones( ", Name( C ), ", product_cones )" ),
                   category_filter := IsClosedCoPreSheavesWRTLimitingCones,
                   category_object_filter := IsObjectInClosedCoPreSheavesWRTLimitingCones,
                   category_morphism_filter := IsMorphismInClosedCoPreSheavesWRTLimitingCones,
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
    
    SetSource( coPSh_J, C );
    SetTarget( coPSh_J, Target( PSh_C_op_J ) );
    SetUnderlyingLimitingCones( coPSh_J, product_cones );
    
    Append( coPSh_J!.compiler_hints.category_attribute_names,
            [ "Source",
              "Target",
              "UnderlyingLimitingCones" ] );
    
    Finalize( coPSh_J );
    
    return coPSh_J;
    
end );

##
InstallMethod( ClosedCoPreSheavesWRTProducts,
        "for a category and a list of product cones",
        [ IsCapCategory, IsList ],
        
  function ( C, lists_of_product_factors )
    
    return ClosedCoPreSheavesWRTProductCones( C, ConesOfProducts( C, lists_of_product_factors ) );
    
end );

##
InstallMethod( ClosedCoPreSheavesWRTProductsByIndices,
        "for a category and a list of product cones",
        [ IsCapCategory, IsList ],
        
  function ( C, lists_of_product_factors_by_indices )
    
    return ClosedCoPreSheavesWRTProductCones( C, ConesOfProductsByIndices( C, lists_of_product_factors_by_indices ) );
    
end );

##
InstallMethod( \.,
        "for the category of closed copresheaves with respect to colimiting cocones and a positive integer",
        [ IsClosedCoPreSheavesWRTLimitingCones, IsPosInt ],
        
  function( coPSh_J, string_as_int )
    local name, op_PSh_C_op_J, c;
    
    name := NameRNam( string_as_int );
    
    op_PSh_C_op_J := ModelingCategory( coPSh_J );
    
    c := op_PSh_C_op_J.(name);
    
    if IsCapCategoryObject( c ) and IsIdenticalObj( CapCategory( c ), op_PSh_C_op_J ) then
        
        return ReinterpretationOfObject( coPSh_J, c );
        
    elif IsCapCategoryMorphism( c ) and IsIdenticalObj( CapCategory( c ), op_PSh_C_op_J ) then
        
        return ReinterpretationOfMorphism( coPSh_J,
                       ReinterpretationOfObject( coPSh_J, Source( c ) ),
                       c,
                       ReinterpretationOfObject( coPSh_J, Target( c ) ) );
        
    else
        
        Error( "`c` is neither an object nor a morphism in the modeling category `op_PSh_C_op_J := ModelingCategory( coPSh_J )`\n" );
        
    fi;
    
end );

##
InstallMethodForCompilerForCAP( SetOfObjects,
        "for the category of closed copresheaves with respect to limiting cones",
        [ IsClosedCoPreSheavesWRTLimitingCones ],
        
  function( cat )
    
    return SetOfObjectsOfCategory( cat );
    
end );

##
InstallMethodForCompilerForCAP( SetOfGeneratingMorphisms,
        "for the category of closed copresheaves with respect to limiting cones",
        [ IsClosedCoPreSheavesWRTLimitingCones ],
        
  function( cat )
    
    return SetOfGeneratingMorphismsOfCategory( cat );
    
end );

##
InstallMethodForCompilerForCAP( CoYonedaEmbeddingDataOfSourceCategory,
        "for a category of closed copresheaves w.r.t. limiting cones",
        [ IsClosedCoPreSheavesWRTLimitingCones ],
        
  function ( coPSh_J )
    local C, coyoneda_data, coYoneda_on_objs, coYoneda_on_mors;
    
    C := Source( coPSh_J );
    
    coyoneda_data := CoYonedaEmbeddingData( C );
    
    coYoneda_on_objs :=
      function ( obj )
        
        return ObjectConstructor( coPSh_J,
                       coyoneda_data[1]( obj ) );
        
    end;
    
    coYoneda_on_mors :=
      function ( source, mor, target )
        local source_on_objs, target_on_objs;
        
        Error( "not implemented yet" );
        
        source_on_objs := ObjectDatum( coPSh_J, source )[1];
        target_on_objs := ObjectDatum( coPSh_J, target )[1];
        
        return MorphismConstructor( coPSh_J,
                       source,
                       coyoneda_data[2]( source_on_objs, mor, target_on_objs ),
                       target );
        
    end;
    
    return Pair( coYoneda_on_objs, coYoneda_on_mors );
    
end );

##
InstallMethod( CoYonedaEmbeddingOfSourceCategory,
        "for a category of closed copresheaves w.r.t. limiting cones",
        [ IsClosedCoPreSheavesWRTLimitingCones ],
        
  function ( coPSh_J )
    local C, coYoneda, coYoneda_data;
    
    C := Source( coPSh_J );
    
    coYoneda := CapFunctor( "co-Yoneda embedding functor", C, coPSh_J );
    
    coYoneda_data := CoYonedaEmbeddingDataOfSourceCategory( coPSh_J );
    
    AddObjectFunction( coYoneda, coYoneda_data[1] );
    
    AddMorphismFunction( coYoneda,  coYoneda_data[2] );
    
    return coYoneda;
    
end );

##################################
##
## View & Display
##
##################################

##
InstallMethod( ViewObj,
        [ IsObjectInClosedCoPreSheavesWRTLimitingCones ],
        
  function( a )
    
    Print( "An object in category of closed copresheaves given by: " );
    
    ViewObj( ObjectDatum( CapCategory( a ), a ) );
    
end );

##
InstallMethod( ViewObj,
        [ IsMorphismInClosedCoPreSheavesWRTLimitingCones ],
        
  function( phi )
    
    Print( "A morphism in category of closed copresheaves given by: " );
    
    ViewObj( MorphismDatum( CapCategory( phi ), phi ) );
    
end );

##
InstallMethod( Display,
        [ IsObjectInClosedCoPreSheavesWRTLimitingCones ],
        
  function( a )
    
    Display( ObjectDatum( CapCategory( a ), a ) );
    
    Display( "\nAn object in category of closed copresheaves given by the above data" );
    
end );

##
InstallMethod( Display,
        [ IsMorphismInClosedCoPreSheavesWRTLimitingCones ],
        
  function( phi )
    
    Display( MorphismDatum( CapCategory( phi ), phi ) );
    
    Display( "A morphism in category of closed copresheaves given by the above data" );
    
end );
