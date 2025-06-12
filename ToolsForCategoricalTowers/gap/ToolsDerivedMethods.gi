# SPDX-License-Identifier: GPL-2.0-or-later
# ToolsForCategoricalTowers: Tools for CategoricalTowers
#
# Implementations
#

####################################
#
# categorical methods derivations:
#
####################################

##
AddDerivationToCAP( SetOfObjectsOfCategory,
        "SetOfObjectsOfCategory for the initial category",
        [  ],
        
  function( initial_category )
    
    return [ ];
    
end : CategoryFilter := cat -> HasIsInitialCategory( cat ) and IsInitialCategory( cat ) );

##
AddDerivationToCAP( SetOfMorphismsOfFiniteCategory,
        "SetOfMorphismsOfFiniteCategory for the initial category",
        [  ],
        
  function( initial_category )
    
    return [ ];
    
end : CategoryFilter := cat -> HasIsInitialCategory( cat ) and IsInitialCategory( cat ) );

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
        [ [ Coproduct, 2 ],
          [ Coequalizer, 1 ],
          [ InjectionOfCofactorOfCoproductWithGivenCoproduct, 2 ], ## called in List
          [ UniversalMorphismFromCoproductWithGivenCoproduct, 2 ],
          [ PreCompose, 3 ], ## called in List
          [ ProjectionOntoCoequalizerWithGivenCoequalizer, 1 ],
          [ InjectionOfCofactorOfCoproduct, 1 ],
          [ UniversalMorphismFromCoproduct, 1 ],
          [ ColiftAlongEpimorphism, 1 ],
          ],
        [ Colimit,
          InjectionOfCofactorOfColimit,
          InjectionOfCofactorOfColimitWithGivenColimit,
          UniversalMorphismFromColimit,
          UniversalMorphismFromColimitWithGivenColimit,
          ],
[
  Colimit,
  [ [ Coequalizer, 1 ],
    [ Coproduct, 2 ],
    [ InjectionOfCofactorOfCoproductWithGivenCoproduct, 2 ],
    [ UniversalMorphismFromCoproductWithGivenCoproduct, 2 ],
    [ PreCompose, 2 ] ],
  function( cat, objects, decorated_morphisms )
    local pair;
    
    pair := ColimitPair( cat,
                    objects,
                    decorated_morphisms );
    
    return Coequalizer( cat, pair[1], pair[2] );
    
  end
],
[
  InjectionOfCofactorOfColimitWithGivenColimit,
  [ [ PreCompose, 3 ],
    [ ProjectionOntoCoequalizerWithGivenCoequalizer, 1 ],
    [ InjectionOfCofactorOfCoproduct, 1 ],
    [ Coproduct, 2 ],
    [ InjectionOfCofactorOfCoproductWithGivenCoproduct, 2 ],
    [ UniversalMorphismFromCoproductWithGivenCoproduct, 2 ] ],
  function( cat, objects, decorated_morphisms, k, colimit )
    local pair;
    
    pair := ColimitPair( cat,
                    objects,
                    decorated_morphisms );
    
    return PreCompose( cat,
                   InjectionOfCofactorOfCoproduct( cat,
                           objects,
                           1 + k ),
                   ProjectionOntoCoequalizerWithGivenCoequalizer( cat,
                           pair[1],
                           pair[2],
                           colimit ) );
    
  end
],
[
  UniversalMorphismFromColimitWithGivenColimit,
  [ [ ColiftAlongEpimorphism, 1 ],
    [ ProjectionOntoCoequalizerWithGivenCoequalizer, 1 ],
    [ UniversalMorphismFromCoproduct, 1 ],
    [ Coproduct, 2 ],
    [ InjectionOfCofactorOfCoproductWithGivenCoproduct, 2 ],
    [ UniversalMorphismFromCoproductWithGivenCoproduct, 2 ],
    [ PreCompose, 2 ] ],
  function( cat, objects, decorated_morphisms, T, tau, colimit )
    local pair;
    
    pair := ColimitPair( cat,
                    objects,
                    decorated_morphisms );
    
    return ColiftAlongEpimorphism( cat,
                   ProjectionOntoCoequalizerWithGivenCoequalizer( cat,
                           pair[1],
                           pair[2],
                           colimit ),
                   UniversalMorphismFromCoproduct( cat,
                           objects,
                           T,
                           tau ) );
    
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
