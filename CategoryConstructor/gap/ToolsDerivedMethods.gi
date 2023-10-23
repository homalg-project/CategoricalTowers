# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# Implementations
#

####################################
#
# categorical methods derivations:
#
####################################

##
AddDerivationToCAP( MorphismBetweenCoproductsWithGivenCoproducts,
        "MorphismBetweenCoproductsWithGivenCoproducts using universal morphisms of coproducts  (with support for empty coproducts)",
        [ [ InjectionOfCofactorOfCoproductWithGivenCoproduct, 2 ],
          [ PreCompose, 2 ],
          [ UniversalMorphismFromCoproductWithGivenCoproduct, 1 ] ],
        
  function( cat, source, diagram_source, F, diagram_range, range )
    local s, map, mor, inj, cmp;
    
    ## the code below is the morphism-part of the doctrine-specific ur-algorithm for strict cocartesian (monoidal) categories
    
    s := Length( diagram_source );
    
    map := F[1];
    mor := F[2];
    
    inj := List( [ 0 .. s - 1 ], i ->
                 InjectionOfCofactorOfCoproductWithGivenCoproduct( cat,
                         diagram_range,
                         1 + map[1 + i],
                         range ) );
    
    cmp := List( [ 0 .. s - 1 ], i ->
                 PreCompose( cat,
                         mor[1 + i],
                         inj[1 + i] ) );
    
    return UniversalMorphismFromCoproductWithGivenCoproduct( cat,
                   diagram_source,
                   range,
                   cmp,
                   source );
    
end : CategoryFilter := cat -> IsBound( cat!.supports_empty_limits ) and cat!.supports_empty_limits = true );

##
AddDerivationToCAP( MorphismBetweenCoproductsWithGivenCoproducts,
        "MorphismBetweenCoproductsWithGivenCoproducts using universal morphisms of coproducts (without support for empty coproducts)",
        [ [ UniversalMorphismFromInitialObjectWithGivenInitialObject, 1 ],
          [ InjectionOfCofactorOfCoproductWithGivenCoproduct, 2 ],
          [ PreCompose, 2 ],
          [ UniversalMorphismFromCoproductWithGivenCoproduct, 1 ] ],
        
  function( cat, source, diagram_source, F, diagram_range, range )
    local s, map, mor, inj, cmp;
    
    ## the code below is the morphism-part of the doctrine-specific ur-algorithm for strict cocartesian (monoidal) categories
    
    s := Length( diagram_source );
    
    ## the empty case
    if s = 0 then
        
        return UniversalMorphismFromInitialObjectWithGivenInitialObject( cat, range, source );
        
    fi;
    
    map := F[1];
    mor := F[2];
    
    inj := List( [ 0 .. s - 1 ], i ->
                 InjectionOfCofactorOfCoproductWithGivenCoproduct( cat,
                         diagram_range,
                         1 + map[1 + i],
                         range ) );
    
    cmp := List( [ 0 .. s - 1 ], i ->
                 PreCompose( cat,
                         mor[1 + i],
                         inj[1 + i] ) );
    
    return UniversalMorphismFromCoproductWithGivenCoproduct( cat,
                   diagram_source,
                   range,
                   cmp,
                   source );
    
end : CategoryFilter := cat -> not ( IsBound( cat!.supports_empty_limits ) and cat!.supports_empty_limits = true ) );

##
AddDerivationToCAP( MorphismBetweenDirectProductsWithGivenDirectProducts,
        "MorphismBetweenDirectProductsWithGivenDirectProducts using universal morphisms of direct products  (with support for empty direct products)",
        [ [ ProjectionInFactorOfDirectProductWithGivenDirectProduct, 2 ],
          [ PreCompose, 2 ],
          [ UniversalMorphismIntoDirectProductWithGivenDirectProduct, 1 ] ],
        
  function( cat, source, diagram_source, F, diagram_range, range )
    local t, map, mor, prj, cmp;
    
    ## the code below is the morphism-part of the doctrine-specific ur-algorithm for strict cartesian (monoidal) categories
    
    t := Length( diagram_range );
    
    map := F[1];
    mor := F[2];
    
    prj := List( [ 0 .. t - 1 ], j ->
                 ProjectionInFactorOfDirectProductWithGivenDirectProduct( cat,
                         diagram_source,
                         1 + map[1 + j],
                         source ) );
    
    cmp := List( [ 0 .. t - 1 ], j ->
                 PreCompose( cat,
                         prj[1 + j],
                         mor[1 + j] ) );
    
    return UniversalMorphismIntoDirectProductWithGivenDirectProduct( cat,
                   diagram_range,
                   source,
                   cmp,
                   range );
    
end : CategoryFilter := cat -> IsBound( cat!.supports_empty_limits ) and cat!.supports_empty_limits = true );

##
AddDerivationToCAP( MorphismBetweenDirectProductsWithGivenDirectProducts,
        "MorphismBetweenDirectProductsWithGivenDirectProducts using universal morphisms of direct products (without support for empty direct products)",
        [ [ UniversalMorphismIntoTerminalObjectWithGivenTerminalObject, 1 ],
          [ ProjectionInFactorOfDirectProductWithGivenDirectProduct, 2 ],
          [ PreCompose, 2 ],
          [ UniversalMorphismIntoDirectProductWithGivenDirectProduct, 1 ] ],
        
  function( cat, source, diagram_source, F, diagram_range, range )
    local t, map, mor, prj, cmp;
    
    ## the code below is the morphism-part of the doctrine-specific ur-algorithm for strict cartesian (monoidal) categories
    
    t := Length( diagram_range );
    
    ## the empty case
    if t = 0 then
        
        return UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( cat, source, range );
        
    fi;
    
    map := F[1];
    mor := F[2];
    
    prj := List( [ 0 .. t - 1 ], j ->
                 ProjectionInFactorOfDirectProductWithGivenDirectProduct( cat,
                         diagram_source,
                         1 + map[1 + j],
                         source ) );
    
    cmp := List( [ 0 .. t - 1 ], j ->
                 PreCompose( cat,
                         prj[1 + j],
                         mor[1 + j] ) );
    
    return UniversalMorphismIntoDirectProductWithGivenDirectProduct( cat,
                   diagram_range,
                   source,
                   cmp,
                   range );
    
end : CategoryFilter := cat -> not ( IsBound( cat!.supports_empty_limits ) and cat!.supports_empty_limits = true ) );

##
AddDerivationToCAP( CoproductComplement,
        "CoproductComplement as the source of InjectionOfCoproductComplement",
        [ [ InjectionOfCoproductComplement, 1 ] ],
        
  function( cat, mor )
    
    return Source( InjectionOfCoproductComplement( cat, mor ) );
    
end );

##
AddDerivationToCAP( DirectProductComplement,
        "DirectProductComplement as the target of ProjectionInDirectProductComplement",
        [ [ ProjectionInDirectProductComplement, 1 ] ],
        
  function( cat, mor )
    
    return Target( ProjectionInDirectProductComplement( cat, mor ) );
    
end );

##
AddDerivationToCAP( IsMonomorphism,
        "IsMonomorphism using the Yoneda embedding",
        [ [ HomomorphismStructureOnObjects, 2 ],
          [ IdentityMorphism, 3 ],
          [ HomomorphismStructureOnMorphismsWithGivenObjects, 4 ],
          [ IsMonomorphism, 2, RangeCategoryOfHomomorphismStructure ] ],
        
  function ( cat, morphism )
    local range_cat, Y, source_on_objs, target_on_objs, Ymorphism;
    
    ## The *definition* of IsMonomorphism yields the following algorithm:
    
    ## A morphism is a monomorphism if, *by definition*,
    ## its image under the continuous Yoneda embedding is a monomorphism;
    ## checking the latter happens componentwise in the base of the enrichment,
    ## and there IsMonomorphism usually means injectivity.
    
    range_cat := RangeCategoryOfHomomorphismStructure( cat );
    
    Y := YonedaEmbeddingData( cat );
    
    source_on_objs := Y[1]( Source( morphism ) )[1];
    target_on_objs := Y[1]( Target( morphism ) )[1];
    
    Ymorphism := Y[2]( source_on_objs, morphism, target_on_objs );
    
    return ForAll( Ymorphism, mor -> IsMonomorphism( range_cat, mor ) );
    
  end :
  CategoryGetters := rec( range_cat := RangeCategoryOfHomomorphismStructure ),
  CategoryFilter := cat -> HasDefiningTripleOfUnderlyingQuiver( cat ) and HasRangeCategoryOfHomomorphismStructure( cat )
);

##
AddDerivationToCAP( IsEpimorphism,
        "IsEpimorphism using the co-Yoneda embedding",
        [ [ HomomorphismStructureOnObjects, 2 ],
          [ IdentityMorphism, 3 ],
          [ HomomorphismStructureOnMorphismsWithGivenObjects, 4 ],
          [ IsMonomorphism, 2, RangeCategoryOfHomomorphismStructure ] ],
        
  function ( cat, morphism )
    local range_cat, Y, source_on_objs, target_on_objs, Ymorphism;
    
    range_cat := RangeCategoryOfHomomorphismStructure( cat );
    
    Y := CoYonedaEmbeddingData( cat );
    
    source_on_objs := Y[1]( Source( morphism ) )[1];
    target_on_objs := Y[1]( Target( morphism ) )[1];
    
    Ymorphism := Y[2]( source_on_objs, morphism, target_on_objs );
    
    ## The *definition* of IsEpimorphism yields the following algorithm:
    
    ## A morphism is a epimorphism if, almost by definition,
    ## its image under the co-continuous co-Yoneda embedding is a epimorphism;
    ## checking the latter happens componentwise in the base of the enrichment.
    
    ## in the category of co-presheaves the IsMonomorphism in the code below is an IsEpimorphism (as mentioned above),
    ## since CoPreSheaves( C ) = OppositeCategory( PreSheaves( OppositeCategory( C ) ),
    ## so we end up checking IsMonomorphism componentwise in the base of the enrichment,
    ## and there IsMonomorphism usually means injectivity.
    
    return ForAll( Ymorphism, mor -> IsMonomorphism( range_cat, mor ) );
    
  end :
  CategoryGetters := rec( range_cat := RangeCategoryOfHomomorphismStructure ),
  CategoryFilter := cat -> HasDefiningTripleOfUnderlyingQuiver( cat ) and HasRangeCategoryOfHomomorphismStructure( cat )
);

##
AddDerivationToCAP( BiasedRelativeWeakFiberProduct,
                    "BiasedRelativeWeakFiberProduct as the source of ProjectionOfBiasedRelativeWeakFiberProduct",
                    [ [ ProjectionOfBiasedRelativeWeakFiberProduct, 1 ] ],
                    
  function( cat, alpha, beta, gamma )
    
    return Source( ProjectionOfBiasedRelativeWeakFiberProduct( alpha, beta, gamma ) );
    
end );

##
AddDerivationToCAP( UniversalMorphismIntoBiasedRelativeWeakFiberProduct,
                    "UniversalMorphismIntoBiasedRelativeWeakFiberProduct using RelativeLift",
                    [ [ RelativeLift, 1 ],
                      [ ProjectionOfBiasedRelativeWeakFiberProduct, 1 ] ],
                    
  function( cat, alpha, beta, gamma, test_mor )
    
    return RelativeLift( test_mor,
                 ProjectionOfBiasedRelativeWeakFiberProduct( alpha, beta, gamma ), gamma );
    
end );

##
AddDerivationToCAP( MorphismOntoSumOfImagesOfAllMorphisms,
                    "MorphismOntoSumOfImagesOfAllMorphisms using BasisOfExternalHom and UniversalMorphismFromDirectSum",
                    [ [ BasisOfExternalHom, 1 ],
                      [ UniversalMorphismFromZeroObject, 1 ],
                      [ UniversalMorphismFromDirectSum, 1 ] ],
                    
  function( cat, a, b )
    local hom;
    
    hom := BasisOfExternalHom( cat, a, b );
    
    if hom = [ ] then
        return UniversalMorphismFromZeroObject( cat, b );
    fi;
    
    return UniversalMorphismFromDirectSum( cat, hom );
    
end : CategoryFilter := IsAbelianCategory );

##
AddDerivationToCAP( EmbeddingOfSumOfImagesOfAllMorphisms,
                    "EmbeddingOfSumOfImagesOfAllMorphisms using MorphismOntoSumOfImagesOfAllMorphisms and ImageEmbedding",
                    [ [ MorphismOntoSumOfImagesOfAllMorphisms, 1 ],
                      [ ImageEmbedding, 1 ] ],
                    
  function( cat, a, b )
    
    return ImageEmbedding( cat, MorphismOntoSumOfImagesOfAllMorphisms( cat, a, b ) );
    
end : CategoryFilter := IsAbelianCategory );

##
AddDerivationToCAP( SumOfImagesOfAllMorphisms,
                    "SumOfImagesOfAllMorphisms as Source of EmbeddingOfSumOfImagesOfAllMorphisms",
                    [ [ EmbeddingOfSumOfImagesOfAllMorphisms, 1 ] ],
                    
  function( cat, a, b )
    
    return Source( EmbeddingOfSumOfImagesOfAllMorphisms( cat, a, b ) );
    
end : CategoryFilter := IsAbelianCategory );

##
AddDerivationToCAP( BasisOfSolutionsOfHomogeneousLinearSystemInLinearCategory,
                    "BasisOfSolutionsOfHomogeneousLinearSystemInLinearCategory using the homomorphism structure",
                    [ [ HomomorphismStructureOnMorphisms, 4 ],
                      [ DistinguishedObjectOfHomomorphismStructure, 1 ],
                      [ HomomorphismStructureOnObjects, 4 ],
                      [ InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism, 4 ],
                      [ MorphismBetweenDirectSums, 1, RangeCategoryOfHomomorphismStructure ],
                      [ PreCompose, 6, RangeCategoryOfHomomorphismStructure ],
                      [ KernelEmbedding, 1, RangeCategoryOfHomomorphismStructure ],
                      [ BasisOfExternalHom, 1, RangeCategoryOfHomomorphismStructure ],
                      [ ProjectionInFactorOfDirectSum, 4, RangeCategoryOfHomomorphismStructure ] ],
                    
  function ( cat, left_coefficients, right_coefficients )
    local range_cat, m, n, distinguished_object, H_B_C, H_A_D, list, iota, basis;
    
    range_cat := RangeCategoryOfHomomorphismStructure( cat );
    
    m := Length( left_coefficients );
    
    n := Length( left_coefficients[1] );
    
    distinguished_object := DistinguishedObjectOfHomomorphismStructure( cat );
    
    H_B_C := List( [ 1 .. n ], j -> HomomorphismStructureOnObjects( cat, Target( left_coefficients[1][j] ), Source( right_coefficients[1][j] ) ) );
    
    H_A_D := List( [ 1 .. m ], i -> HomomorphismStructureOnObjects( cat, Source( left_coefficients[i][1] ), Target( right_coefficients[i][1] ) ) );
    
    list :=
      List( [ 1 .. n ],
      j -> List( [ 1 .. m ], i -> HomomorphismStructureOnMorphisms( cat, left_coefficients[i][j], right_coefficients[i][j] ) )
    );
    
    iota := KernelEmbedding( range_cat, MorphismBetweenDirectSums( range_cat, H_B_C, list, H_A_D ) );
    
    basis := BasisOfExternalHom( range_cat, distinguished_object, Source( iota ) );
    
    basis := List( basis, m -> PreCompose( range_cat, m, iota ) );
    
    return
      List( basis, m ->
        List( [ 1 .. n ], j ->
          InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
            Target( left_coefficients[1][j] ),
            Source( right_coefficients[1][j] ),
            PreCompose( range_cat, m, ProjectionInFactorOfDirectSum( range_cat, H_B_C, j ) ) ) ) );
    
  end :
  CategoryGetters := rec( range_cat := RangeCategoryOfHomomorphismStructure ),
  CategoryFilter := cat -> HasIsLinearCategoryOverCommutativeRing( cat ) and IsLinearCategoryOverCommutativeRing( cat ) and HasRangeCategoryOfHomomorphismStructure( cat )
);

##
AddDerivationToCAP( BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory,
                    "BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory using the homomorphism structure",
                    [ [ HomomorphismStructureOnObjects, 4 ],
                      [ HomomorphismStructureOnMorphisms, 8 ],
                      [ InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism, 4 ],
                      [ DistinguishedObjectOfHomomorphismStructure, 1 ],
                      [ MorphismBetweenDirectSums, 2, RangeCategoryOfHomomorphismStructure ],
                      [ PreCompose, 6, RangeCategoryOfHomomorphismStructure ],
                      [ SubtractionForMorphisms, 1, RangeCategoryOfHomomorphismStructure ],
                      [ KernelEmbedding, 1, RangeCategoryOfHomomorphismStructure ],
                      [ BasisOfExternalHom, 1, RangeCategoryOfHomomorphismStructure ],
                      [ ProjectionInFactorOfDirectSum, 4, RangeCategoryOfHomomorphismStructure ] ],
                    
  function ( cat, alpha, beta, gamma, delta )
    local range_cat, m, n, distinguished_object, H_B_C, H_A_D, list_1, H_1, list_2, H_2, iota, B;
    
    range_cat := RangeCategoryOfHomomorphismStructure( cat );
    
    m := Length( alpha );
    
    n := Length( alpha[1] );
    
    distinguished_object := DistinguishedObjectOfHomomorphismStructure( cat );
    
    H_B_C := List( [ 1 .. n ], j -> HomomorphismStructureOnObjects( cat, Target( alpha[1][j] ), Source( beta[1][j] ) ) );
    
    H_A_D := List( [ 1 .. m ], i -> HomomorphismStructureOnObjects( cat, Source( alpha[i][1] ), Target( beta[i][1] ) ) );
    
    list_1 :=
      List( [ 1 .. n ],
      j -> List( [ 1 .. m ], i -> HomomorphismStructureOnMorphisms( cat, alpha[i][j], beta[i][j] ) )
    );
    
    H_1 := MorphismBetweenDirectSums( range_cat, H_B_C, list_1, H_A_D );

    list_2 :=
      List( [ 1 .. n ],
      j -> List( [ 1 .. m ], i -> HomomorphismStructureOnMorphisms( cat, gamma[i][j], delta[i][j] ) )
    );
    
    H_2 := MorphismBetweenDirectSums( range_cat, H_B_C, list_2, H_A_D );
    
    iota := KernelEmbedding( range_cat, SubtractionForMorphisms( range_cat, H_1, H_2 ) );
    
    B := BasisOfExternalHom( range_cat, distinguished_object, Source( iota ) );
    
    B := List( B, m -> PreCompose( range_cat, m, iota ) );
    
    return
      List( B, m ->
        List( [ 1 .. n ], j ->
          InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
            Target( alpha[1][j] ),
            Source( beta[1][j] ),
            PreCompose( range_cat, m, ProjectionInFactorOfDirectSum( range_cat, H_B_C, j ) )
          )
        )
      );
    
  end :
  CategoryGetters := rec( range_cat := RangeCategoryOfHomomorphismStructure ),
  CategoryFilter := cat -> HasIsLinearCategoryOverCommutativeRing( cat ) and IsLinearCategoryOverCommutativeRing( cat ) and HasRangeCategoryOfHomomorphismStructure( cat )
);

##
AddDerivationToCAP( MereExistenceOfUniqueSolutionOfLinearSystemInAbCategory,
                    "MereExistenceOfUniqueSolutionOfLinearSystemInAbCategory using the homomorphism structure",
                    [ [ DistinguishedObjectOfHomomorphismStructure, 1 ],
                      [ InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure, 2 ],
                      [ HomomorphismStructureOnObjects, 4 ],
                      [ HomomorphismStructureOnMorphismsWithGivenObjects, 4 ],
                      [ UniversalMorphismIntoDirectSum, 1, RangeCategoryOfHomomorphismStructure ],
                      [ MorphismBetweenDirectSums, 1, RangeCategoryOfHomomorphismStructure ],
                      [ IsLiftable, 1, RangeCategoryOfHomomorphismStructure ],
                      [ IsMonomorphism, 1, RangeCategoryOfHomomorphismStructure ] ],
                    
  function ( cat, left_coefficients, right_coefficients, right_side )
    local range_cat, m, n, distinguished_object, interpretations, nu, H_B_C, H_A_D, list, H;
    
    range_cat := RangeCategoryOfHomomorphismStructure( cat );
    
    m := Length( left_coefficients );
    
    n := Length( left_coefficients[1] );
    
    ## create lift diagram
    
    distinguished_object := DistinguishedObjectOfHomomorphismStructure( cat );
    interpretations := List( [ 1 .. m ], i -> InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( cat, right_side[i] ) );
    
    nu := UniversalMorphismIntoDirectSum( range_cat,
        List( interpretations, mor -> Target( mor ) ),
        distinguished_object,
        interpretations
    );
    
    # left_coefficients[i][j] : A_i -> B_j
    # right_coefficients[i][j] : C_j -> D_i
    
    H_B_C := List( [ 1 .. n ], j -> HomomorphismStructureOnObjects( cat, Target( left_coefficients[1][j] ), Source( right_coefficients[1][j] ) ) );
    
    H_A_D := List( [ 1 .. m ], i -> HomomorphismStructureOnObjects( cat, Source( left_coefficients[i][1] ), Target( right_coefficients[i][1] ) ) );
    
    list :=
      List( [ 1 .. n ],
      j -> List( [ 1 .. m ], i -> HomomorphismStructureOnMorphismsWithGivenObjects( cat, H_B_C[j], left_coefficients[i][j], right_coefficients[i][j], H_A_D[i] ) )
    );
    
    H := MorphismBetweenDirectSums( range_cat, H_B_C, list, H_A_D );
    
    ## the actual computation of the solution
    return IsMonomorphism( range_cat, H ) and IsLiftable( range_cat, nu, H );
    
  end :
  CategoryGetters := rec( range_cat := RangeCategoryOfHomomorphismStructure ),
  CategoryFilter := cat -> HasIsAbCategory( cat ) and IsAbCategory( cat ) and HasRangeCategoryOfHomomorphismStructure( cat )
                            and HasIsAbelianCategory( RangeCategoryOfHomomorphismStructure( cat ) ) and IsAbelianCategory( RangeCategoryOfHomomorphismStructure( cat ) )
);

##
AddDerivationToCAP( MereExistenceOfUniqueSolutionOfHomogeneousLinearSystemInAbCategory,
                    "MereExistenceOfUniqueSolutionOfHomogeneousLinearSystemInAbCategory using the homomorphism structure",
                    [ [ DistinguishedObjectOfHomomorphismStructure, 1 ],
                      [ HomomorphismStructureOnObjects, 4 ],
                      [ HomomorphismStructureOnMorphisms, 4 ],
                      [ MorphismBetweenDirectSums, 1, RangeCategoryOfHomomorphismStructure ],
                      [ IsMonomorphism, 1, RangeCategoryOfHomomorphismStructure ] ],
                    
  function ( cat, left_coefficients, right_coefficients )
    local range_cat, m, n, distinguished_object, H_B_C, H_A_D, list, H;
    
    range_cat := RangeCategoryOfHomomorphismStructure( cat );
    
    m := Length( left_coefficients );
    
    n := Length( left_coefficients[1] );
    
    distinguished_object := DistinguishedObjectOfHomomorphismStructure( cat );
    
    H_B_C := List( [ 1 .. n ], j -> HomomorphismStructureOnObjects( cat, Target( left_coefficients[1][j] ), Source( right_coefficients[1][j] ) ) );
    
    H_A_D := List( [ 1 .. m ], i -> HomomorphismStructureOnObjects( cat, Source( left_coefficients[i][1] ), Target( right_coefficients[i][1] ) ) );
    
    list :=
      List( [ 1 .. n ],
      j -> List( [ 1 .. m ], i -> HomomorphismStructureOnMorphisms( cat, left_coefficients[i][j], right_coefficients[i][j] ) )
    );
    
    H := MorphismBetweenDirectSums( range_cat, H_B_C, list, H_A_D );
    
    return IsMonomorphism( range_cat, H );
    
  end :
  CategoryGetters := rec( range_cat := RangeCategoryOfHomomorphismStructure ),
  CategoryFilter := cat -> HasIsAbCategory( cat ) and IsAbCategory( cat ) and HasRangeCategoryOfHomomorphismStructure( cat ) and
                            HasIsAbelianCategory( RangeCategoryOfHomomorphismStructure( cat ) ) and IsAbelianCategory( RangeCategoryOfHomomorphismStructure( cat ) )
);

##
AddFinalDerivationBundle( "Limit using DirectProduct and Equalizer",
        [ [ DirectProduct, 2 ],
          [ Equalizer, 1 ],
          [ ProjectionInFactorOfDirectProductWithGivenDirectProduct, 2 ], ## called in List
          [ UniversalMorphismIntoDirectProductWithGivenDirectProduct, 2 ],
          [ PreCompose, 3 ], ## called in List
          [ EmbeddingOfEqualizerWithGivenEqualizer, 1 ],
          [ ProjectionInFactorOfDirectProduct, 1 ],
          [ UniversalMorphismIntoDirectProduct, 1 ],
          [ LiftAlongMonomorphism, 1 ],
          ],
        [ Limit,
          ProjectionInFactorOfLimit,
          ProjectionInFactorOfLimitWithGivenLimit,
          UniversalMorphismIntoLimit,
          UniversalMorphismIntoLimitWithGivenLimit,
          ],
[
  Limit,
  [ [ Equalizer, 1 ],
    [ DirectProduct, 2 ],
    [ ProjectionInFactorOfDirectProductWithGivenDirectProduct, 2 ],
    [ UniversalMorphismIntoDirectProductWithGivenDirectProduct, 2 ],
    [ PreCompose, 2 ] ],
  function( cat, objects, decorated_morphisms )
      local pair;
      
      pair := LimitPair( cat,
                        objects,
                        decorated_morphisms );
      
      return Equalizer( cat, pair[1], pair[2] );
      
  end
],
[
  ProjectionInFactorOfLimitWithGivenLimit,
  [ [ PreCompose, 3 ],
    [ EmbeddingOfEqualizerWithGivenEqualizer, 1 ],
    [ ProjectionInFactorOfDirectProduct, 1 ],
    [ DirectProduct, 2 ],
    [ ProjectionInFactorOfDirectProductWithGivenDirectProduct, 2 ],
    [ UniversalMorphismIntoDirectProductWithGivenDirectProduct, 2 ] ],
  function( cat, objects, decorated_morphisms, k, limit )
      local pair;
      
      pair := LimitPair( cat,
                        objects,
                        decorated_morphisms );
      
      return PreCompose( cat,
                     EmbeddingOfEqualizerWithGivenEqualizer( cat,
                             pair[1],
                             pair[2],
                             limit ),
                     ProjectionInFactorOfDirectProduct( cat,
                             objects,
                             1 + k ) );
      
  end
],
[
  UniversalMorphismIntoLimitWithGivenLimit,
  [ [ LiftAlongMonomorphism, 1 ],
    [ EmbeddingOfEqualizerWithGivenEqualizer, 1 ],
    [ UniversalMorphismIntoDirectProduct, 1 ],
    [ DirectProduct, 2 ],
    [ ProjectionInFactorOfDirectProductWithGivenDirectProduct, 2 ],
    [ UniversalMorphismIntoDirectProductWithGivenDirectProduct, 2 ],
    [ PreCompose, 2 ] ],
  function( cat, objects, decorated_morphisms, T, tau, limit )
      local pair;
      
      pair := LimitPair( cat,
                        objects,
                        decorated_morphisms );
      
      return LiftAlongMonomorphism( cat,
                     EmbeddingOfEqualizerWithGivenEqualizer( cat,
                             pair[1],
                             pair[2],
                             limit ),
                     UniversalMorphismIntoDirectProduct( cat,
                             objects,
                             T,
                             tau ) );
      
  end
]
 );

##
AddFinalDerivationBundle( "Colimit using limit in the opposite category",
        ## FIXME: remove the following list and add it to CategoryFilter;
        ## problem: Input category must be finalized to create opposite category
        [ [ Limit, 1 ],
          [ ProjectionInFactorOfLimitWithGivenLimit, 1 ],
          [ UniversalMorphismIntoLimitWithGivenLimit,1 ] ],
        [ Colimit,
          InjectionOfCofactorOfColimit,
          InjectionOfCofactorOfColimitWithGivenColimit,
          UniversalMorphismFromColimit,
          UniversalMorphismFromColimitWithGivenColimit,
          ],
[
  Colimit,
  [ [ Limit, 1 ] ],
  function( cat, objects, decorated_morphisms )
      
      return Opposite( Limit( Opposite( cat ),
                     List( objects, Opposite ),
                     List( decorated_morphisms, m -> [ m[3], Opposite( m[2] ), m[1] ] ) ) );
      
  end
],
[
  InjectionOfCofactorOfColimitWithGivenColimit,
  [ [ ProjectionInFactorOfLimitWithGivenLimit, 1 ] ],
  function( cat, objects, decorated_morphisms, k, colimit )
      
      return Opposite( ProjectionInFactorOfLimitWithGivenLimit( Opposite( cat ),
                     List( objects, Opposite ),
                     List( decorated_morphisms, m -> [ m[3], Opposite( m[2] ), m[1] ] ),
                     k,
                     Opposite( colimit ) ) );
      
  end
],
[
  UniversalMorphismFromColimitWithGivenColimit,
  [ [ UniversalMorphismIntoLimitWithGivenLimit, 1 ] ],
  function( cat, objects, decorated_morphisms, T, tau, colimit )
      
      return Opposite( UniversalMorphismIntoLimitWithGivenLimit( Opposite( cat ),
                     List( objects, Opposite ),
                     List( decorated_morphisms, m -> [ m[3], Opposite( m[2] ), m[1] ] ),
                     Opposite( T ),
                     List( tau, Opposite ),
                     Opposite( colimit ) ) );
      
  end
]
 );

##
AddFinalDerivationBundle( "SomeProjectiveObject from ProjectiveCoverObject",
        [ [ ProjectiveCoverObject, 1 ],
          [ EpimorphismFromProjectiveCoverObjectWithGivenProjectiveCoverObject, 1 ],
          ],
        [ SomeProjectiveObject,
          EpimorphismFromSomeProjectiveObject,
          EpimorphismFromSomeProjectiveObjectWithGivenSomeProjectiveObject,
          ],
[
  SomeProjectiveObject,
  [ [ ProjectiveCoverObject, 1 ] ],
  function( cat, F )
    
    return ProjectiveCoverObject( cat, F );
    
end
],
[
  EpimorphismFromSomeProjectiveObjectWithGivenSomeProjectiveObject,
  [ [ EpimorphismFromProjectiveCoverObjectWithGivenProjectiveCoverObject, 1 ] ],
  function( cat, F, P )
    
    return EpimorphismFromProjectiveCoverObjectWithGivenProjectiveCoverObject( cat, F, P );
    
end
]
 );

##
AddFinalDerivationBundle( "SomeInjectiveObject from InjectiveEnvelopeObject",
        [ [ InjectiveEnvelopeObject, 1 ],
          [ MonomorphismIntoInjectiveEnvelopeObjectWithGivenInjectiveEnvelopeObject, 1 ],
          ],
        [ SomeInjectiveObject,
          MonomorphismIntoSomeInjectiveObject,
          MonomorphismIntoSomeInjectiveObjectWithGivenSomeInjectiveObject,
          ],
[
  SomeInjectiveObject,
  [ [ InjectiveEnvelopeObject, 1 ] ],
  function( cat, F )
    
    return InjectiveEnvelopeObject( cat, F );
    
end
],
[
  MonomorphismIntoSomeInjectiveObjectWithGivenSomeInjectiveObject,
  [ [ MonomorphismIntoInjectiveEnvelopeObjectWithGivenInjectiveEnvelopeObject, 1 ] ],
  function( cat, F, P )
    
    return MonomorphismIntoInjectiveEnvelopeObjectWithGivenInjectiveEnvelopeObject( cat, F, P );
    
end
]
 );
