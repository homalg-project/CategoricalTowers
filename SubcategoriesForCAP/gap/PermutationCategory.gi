# SPDX-License-Identifier: GPL-2.0-or-later
# SubcategoriesForCAP: Subcategory and other related constructors for CAP categories
#
# Implementations
#

ReadPackage( "SubcategoriesForCAP", "gap/precompiled_categories/PermutationCategory_precompiled.gi" );

##
InstallMethod( PermutationCategory,
               [ ],
               
  FunctionWithNamedArguments(
  [
    [ "no_precompiled_code", false ],
    [ "FinalizeCategory", true ],
  ],
  function( CAP_NAMED_ARGUMENTS )
    local name, category_filter, category_object_filter, category_morphism_filter, object_datum_type, object_constructor, object_datum, morphism_datum_type, morphism_constructor, morphism_datum, sfinsets, sfinsets1, additional_operations_to_install, subcat, modeling_tower_object_constructor, modeling_tower_object_datum, modeling_tower_morphism_constructor, modeling_tower_morphism_datum, cat_of_perms;
    
    ##
    name := "PermutationCategory";
    
    ##
    category_filter := IsPermutationCategory;
    category_object_filter := IsObjectInPermutationCategory;
    category_morphism_filter := IsMorphismInPermutationCategory;
    
    ##
    object_datum_type := IsBigInt;
    
    ##
    object_constructor :=
      function( cat_of_perms, cardinality )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, 0 <= cardinality );
        
        return CreateCapCategoryObjectWithAttributes( cat_of_perms,
                       Cardinality, cardinality );
      
    end;
    
    ##
    object_datum := { cat_of_perms, object } -> Cardinality( object );
    
    ##
    morphism_datum_type := IsPerm;
    
    ##
    morphism_constructor :=
      function( cat_of_perms, S, permutation, T )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Cardinality( S ) = Cardinality( T ) );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, ForAll( ListPerm( permutation ), i ->
            1 <= i and i <= Cardinality( S ) ) );
        
        return CreateCapCategoryMorphismWithAttributes( cat_of_perms,
                    S,
                    T,
                    UnderlyingPermutation, permutation );
        
    end;
    
    ##
    morphism_datum := { cat_of_perms, phi } -> UnderlyingPermutation( phi );
    
    ####################################
    # Modeling
    ####################################
    
    ## building the categorical tower:
    
    sfinsets := SkeletalCategoryOfFiniteSets( : FinalizeCategory := true );
    sfinsets1 := SkeletalCategoryOfFiniteSetsWithCountingStartingAt1(
                        sfinsets
                        : cartesian_monoidal_structure := false,
                          FinalizeCategory := true );
    
    additional_operations_to_install := [
        "IsWellDefinedForObjects",
        "Coproduct",
        "CoproductFunctorial",
        "CoproductFunctorialWithGivenCoproducts",
    ];
    
    # We require only_primitively_installed_operations_of_ambient_category := false
    # to automatically install the Coproduct methods from sfinsets1.
    subcat := Subcategory( sfinsets1,
                           "PermutationCategoryAsSubcategoryOfSkeletalFinSets"
                           : additional_operations_to_install := additional_operations_to_install,
                             only_primitively_installed_operations_of_ambient_category := false,
                             FinalizeCategory := false );
    
    ##
    AddIsWellDefinedForMorphisms( subcat,
      function( subcat, morphism )
        local sfinsets1;
        
        sfinsets1 := AmbientCategory( subcat );
        
        if not IsEqualForObjects( subcat, Source( morphism ), Target( morphism ) ) then
            
            return false;
            
        fi;
        
        return IsWellDefinedForMorphisms( sfinsets1, MorphismDatum( subcat, morphism ) );
        
    end );
    
    Finalize( subcat );
    
    ## From the raw object data to the object in the modeling category.
    modeling_tower_object_constructor :=
      function( cat_of_perms, cardinality )
        local subcat, sfinsets1;
        
        subcat := ModelingCategory( cat_of_perms );
        sfinsets1 := AmbientCategory( subcat );
        
        return ObjectConstructor( subcat, ObjectConstructor( sfinsets1, cardinality ) );
        
    end;
    
    ## From the object in the modeling category to the raw object data.
    modeling_tower_object_datum :=
      function( cat_of_perms, object )
        local subcat, sfinsets1;
        
        subcat := ModelingCategory( cat_of_perms );
        sfinsets1 := AmbientCategory( subcat );
        
        return Cardinality( ObjectDatum( subcat, object ) );
        
    end;
    
    ## From the raw morphism data to the morphism in the modeling category.
    modeling_tower_morphism_constructor :=
      function( cat_of_perms, source, permutation, target )
        local subcat, sfinsets1, n, listperm;
        
        subcat := ModelingCategory( cat_of_perms );
        sfinsets1 := AmbientCategory( subcat );
        
        n := Cardinality( ObjectDatum( subcat, source ) );
        
        listperm := ListPerm( permutation, n );
        
        return MorphismConstructor( subcat,
                    source,
                    MorphismConstructor( sfinsets1,
                        ObjectDatum( subcat, source ),
                        listperm,
                        ObjectDatum( subcat, target ) ),
                    target );
        
    end;
    
    ## From the morphism in the modeling category to the raw morphism data.
    modeling_tower_morphism_datum :=
      function( cat_of_perms, morphism )
        local subcat, sfinsets1, listperm, permutation;
        
        subcat := ModelingCategory( cat_of_perms );
        sfinsets1 := AmbientCategory( subcat );
        
        listperm := MorphismDatum( sfinsets1, MorphismDatum( subcat, morphism ) );
        
        return PermList( listperm );
        
    end;
    
    cat_of_perms := ReinterpretationOfCategory( subcat,
                    rec( name := name,
                         category_filter := category_filter,
                         category_object_filter := category_object_filter,
                         category_morphism_filter := category_morphism_filter,
                         object_constructor := object_constructor,
                         object_datum := object_datum,
                         object_datum_type := object_datum_type,
                         morphism_constructor := morphism_constructor,
                         morphism_datum := morphism_datum,
                         morphism_datum_type := morphism_datum_type,
                         modeling_tower_object_constructor := modeling_tower_object_constructor,
                         modeling_tower_object_datum := modeling_tower_object_datum,
                         modeling_tower_morphism_constructor := modeling_tower_morphism_constructor,
                         modeling_tower_morphism_datum := modeling_tower_morphism_datum,
                         only_primitive_operations := true, )
                    : FinalizeCategory := false );
    
    # DeactivateCachingOfCategory( cat_of_perms );
    
    # CapCategorySwitchLogicOff( cat_of_perms );
    
    ##
    AddPreCompose( cat_of_perms,
      function( cat_of_perms, alpha, beta )
        local alpha_perm, beta_perm;
        
        alpha_perm := UnderlyingPermutation( alpha );
        beta_perm := UnderlyingPermutation( beta );
        
        return MorphismConstructor( cat_of_perms,
                                    Source( alpha ),
                                    alpha_perm * beta_perm,
                                    Target( beta ) );
        
    end );
    
    ##
    AddInverseForMorphisms( cat_of_perms,
      function( cat_of_perms, alpha )
        local object, inverse_permutation;
        
        object := Source( alpha );
        
        inverse_permutation := InverseImmutable( UnderlyingPermutation( alpha ) );
        
        return MorphismConstructor( cat_of_perms, object, inverse_permutation, object );
        
    end );
    
    ## Coproduct is automatically installed from sfinsets1
    ##
    # AddCoproduct( cat_of_perms,
    #   function( cat_of_perms, objects )
    #     local sum;
    #
    #     sum := Sum( List( objects, object -> Cardinality( object ) ) );
    #
    #     return ObjectConstructor( cat_of_perms, sum );
    #
    # end );
    
    ## CoproductFunctorialWithGivenCoproducts is automatically installed from sfinsets1
    ##
    # AddCoproductFunctorialWithGivenCoproducts( cat_of_perms,
    #   function( cat_of_perms, source, source_diagram, morphisms, target_diagram, target )
    #     local nr_morphisms, perm_lists, cardinalities, offsets, product_perm_list, product_perm;
    #
    #     nr_morphisms := Length( morphisms );
    #
    #     perm_lists := List( [ 1 .. nr_morphisms ], i ->
    #         ListPerm( UnderlyingPermutation( morphisms[i] ), Cardinality( source_diagram[i] ) ) );
    #
    #     cardinalities := List( [ 1 .. nr_morphisms ], i -> Cardinality( source_diagram[i] ) );
    #
    #     offsets := List( [ 1 .. nr_morphisms ], i -> Sum( cardinalities{[ 1 .. i-1 ]} ) );
    #
    #     product_perm_list := Concatenation( List( [ 1 .. nr_morphisms ], i ->
    #          List( perm_lists[i], j -> j + offsets[i] ) ) );
    #
    #     product_perm := PermList( product_perm_list );
    #
    #     return MorphismConstructor( cat_of_perms, source, product_perm, target );
    #
    # end );
    
    ##
    AddTensorUnit( cat_of_perms,
      function( cat_of_perms )
        
        return ObjectConstructor( cat_of_perms, 1 );
        
    end );
    
    ##
    AddTensorProductOnObjects( cat_of_perms,
      function( cat_of_perms, object_1, object_2 )
        
        return ObjectConstructor( cat_of_perms, Cardinality( object_1 ) * Cardinality( object_2 ) );
        
    end );
    
    AddTensorProductOnMorphismsWithGivenTensorProducts( cat_of_perms,
      function( cat_of_perms, source, morphism_1, morphism_2, target )
        local source_1, source_2, m, n, mn, perm1, perm2, kronecker_list, pairs, pairs_applied, kronecker_perm;
        
        source_1 := Source( morphism_1 );
        source_2 := Source( morphism_2 );
        
        m := Cardinality( source_1 );
        n := Cardinality( source_2 );
        mn := Cardinality( source );
        
        perm1 := UnderlyingPermutation( morphism_1 );
        perm2 := UnderlyingPermutation( morphism_2 );
        
        kronecker_list := List([ 1 .. mn ], k ->
            ( OnPoints( QuoInt( k - 1, n ) + 1, perm1 ) - 1 ) * n +
              OnPoints( RemInt( k - 1, n ) + 1, perm2 ) );
        
        kronecker_perm := PermList( kronecker_list );
        
        return MorphismConstructor( cat_of_perms, source, kronecker_perm, target );
        
    end );
    
    AddTensorProductOnMorphismAndObjectWithGivenTensorProducts( cat_of_perms,
      function( cat_of_perms, source, morphism, object, target )
        local permutation, source_morphism, cardinality, kronecker_permutation;
        
        source_morphism := Source( morphism );
        
        permutation := ListPerm( UnderlyingPermutation( morphism ), Cardinality( source_morphism ) );
        cardinality := Cardinality( object );
        
        kronecker_permutation :=
            Concatenation( List( permutation, p ->
                List( [ 1 .. cardinality ], i -> (p - 1) * cardinality + i ) ) );
        
        return MorphismConstructor( cat_of_perms,
                    source,
                    PermList( kronecker_permutation ),
                    source );
        
    end );
    
    
    AddTensorProductOnObjectAndMorphismWithGivenTensorProducts( cat_of_perms,
      function( cat_of_perms, source, object, morphism, target )
        local source_morphism, cardinality_morphism, cardinality_object, permutation, kronecker_permutation;
        
        source_morphism := Source( morphism );
        
        cardinality_morphism := Cardinality( source_morphism );
        cardinality_object := Cardinality( object );
        
        permutation := ListPerm( UnderlyingPermutation( morphism ), cardinality_morphism );
        
        kronecker_permutation := Concatenation( List( [ 0 .. cardinality_object - 1 ], i ->
            List( permutation, p -> p + i * cardinality_morphism ) ) );
        
        return MorphismConstructor( cat_of_perms,
                    source,
                    PermList( kronecker_permutation ),
                    source );
        
    end );
    
    if CAP_NAMED_ARGUMENTS.no_precompiled_code <> true then
        
        ADD_FUNCTIONS_FOR_PermutationCategory_precompiled( cat_of_perms );
        
    fi;
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        
        Finalize( cat_of_perms );
        
    fi;
    
    return cat_of_perms;
    
end ) );

####################################
##
## Functors
##
####################################

##
InstallMethod( EmbeddingOfPermutationCategoryIntoCategoryOfRows,
               [ IsCapCategory, IsCapCategory ],
               
  function( cat_of_perms, rows )
    local homalg_ring, functor;
    
    Assert( 0, IsCategoryOfRows( rows) );
    
    homalg_ring := UnderlyingRing( rows );
    
    functor := CapFunctor( Concatenation( "Embedding from ", Name( cat_of_perms ), " to ", Name( rows ) ), cat_of_perms, rows );
    
    AddObjectFunction( functor,
      function( object )
        
        return ObjectConstructor( rows, Cardinality( object ) );
        
    end );
    
    AddMorphismFunction( functor,
      function( source, morphism, target )
        local nr, permutation, matrix;
        
        nr := RankOfObject( source );
        
        permutation :=  UnderlyingPermutation( morphism );
        
        matrix := HomalgMatrix( PermutationMat( permutation, nr ), homalg_ring );
        
        return AsCategoryOfRowsMorphism( rows, matrix );
        
    end );
    
    return functor;
    
end );

####################################
##
## View & Display
##
####################################

InstallMethod( DisplayString,
               [ IsObjectInPermutationCategory ],
               
  object -> Cardinality( object )
  
);

InstallMethod( DisplayString,
               [ IsMorphismInPermutationCategory ],
               
  function( morphism )
    local object, permutation;
    
    object := Cardinality( Source( morphism ) );
    
    permutation := UnderlyingPermutation( morphism );
    
    return Concatenation( String( object ),
                          " ⱶ",
                          String( permutation ),
                          "→ ",
                          String( object ) );
    
end );

