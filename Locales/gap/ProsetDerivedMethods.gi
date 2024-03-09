# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

## FIXME: CategoryFilter := C -> HasIsThinCategory( C ) and IsThinCategory( C ) and CanCompute( C, "UniqueMorphism" )
AddDerivationToCAP( IsWellDefinedForMorphisms,
        "IsWellDefinedForMorphisms checking the inhabitedness of the homset",
        [ [ IsHomSetInhabited, 1 ] ],
        
  function( cat, u )
    
    return IsHomSetInhabited( cat, Source( u ), Target( u ) );
        
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsCongruentForMorphisms,
        "two parallel morphisms are always congruent",
        [  ],
        
  function( cat, u1, u2 )
    
    return true;
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( AreIsomorphicForObjectsIfIsHomSetInhabited,
        "AreIsomorphicForObjectsIfIsHomSetInhabited using IsHomSetInhabited",
        [ [ IsHomSetInhabited, 1 ] ],
        
  function( cat, A, B )
    
    return IsHomSetInhabited( cat, B, A );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( AreIsomorphicForObjectsIfIsHomSetInhabited,
        "AreIsomorphicForObjectsIfIsHomSetInhabited for IsDiscreteCategory",
        [ ],
        
  function( cat, A, B )
    
    return true;
    
end : CategoryFilter := IsDiscreteCategory );

##
AddDerivationToCAP( IdentityMorphism,
        "IdentityMorphism is the unique endomorphism",
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, A )
    
    return UniqueMorphism( cat, A, A );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( PreCompose,
        "PreCompose is the unique morphism from the source of the pre-morphism to the target of the post-morphism",
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, u1, u2 )
    
    return UniqueMorphism( cat, Source( u1 ), Target( u2 ) );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( PostCompose,
        "PostCompose is the unique morphism from the source of the pre-morphism to the target of the post-morphism",
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, u1, u2 )
    
    return UniqueMorphism( cat, Source( u2 ), Target( u1 ) );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsTerminal,
        "IsTerminal using AreIsomorphicForObjectsIfIsHomSetInhabited and TerminalObject",
        [ [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ],
          [ TerminalObject, 1 ] ],
        
  function( cat, A )
    
    return AreIsomorphicForObjectsIfIsHomSetInhabited( cat, A, TerminalObject( cat ) );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( UniversalMorphismIntoTerminalObject,
        "UniversalMorphismIntoTerminalObject using the unique morphism into the terminal object",
        [ [ TerminalObject, 1 ],
          [ UniqueMorphism, 1 ] ],
        
  function( cat, A )
    
    return UniqueMorphism( cat, A, TerminalObject( cat ) );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsInitial,
        "IsInitial using AreIsomorphicForObjectsIfIsHomSetInhabited and InitialObject",
        [ [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ],
          [ InitialObject, 1 ] ],
        
  function( cat, A )
    
    return AreIsomorphicForObjectsIfIsHomSetInhabited( cat, InitialObject( cat ), A );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( UniversalMorphismFromInitialObject,
        "UniversalMorphismFromInitialObject using the unique morphism from the initial object",
        [ [ InitialObject, 1 ],
          [ UniqueMorphism, 1 ] ],
                    
  function( cat, A )
    
    return UniqueMorphism( cat, InitialObject( cat ), A );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsDominating,
        "IsDominating using IsHomSetInhabited applied to the sources",
        [ [ IsHomSetInhabited, 1 ] ],
                    
  function( cat, u1, u2 )
    
    return IsHomSetInhabited( cat, Source( u1 ), Source( u2 ) );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsCodominating,
        "IsCodominating using IsHomSetInhabited applied to the ranges",
        [ [ IsHomSetInhabited, 1 ] ],
        
  function( cat, u1, u2 )
    
    return IsHomSetInhabited( cat, Target( u2 ), Target( u1 ) );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( Equalizer,
        "Equalizer using Source",
        [  ],
        
  function( cat, A, D )
    
    return A;
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( EmbeddingOfEqualizerWithGivenEqualizer,
        "EmbeddingOfEqualizerWithGivenEqualizer using the unique morphism",
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, source_of_diagram, diagram, equalizer )
    
    return UniqueMorphism( cat, equalizer, source_of_diagram );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( UniversalMorphismIntoEqualizerWithGivenEqualizer,
        "UniversalMorphismIntoEqualizerWithGivenEqualizer using the unique morphism",
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, source_of_diagram, diagram, source, tau, equalizer )
    
    return UniqueMorphism( cat, source, equalizer );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( Coequalizer,
        "Coequalizer using Range",
        [  ],
        
  function( cat, A, D )
    
    return A;
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( ProjectionOntoCoequalizerWithGivenCoequalizer,
        "ProjectionOntoCoequalizerWithGivenCoequalizer using the unique morphism",
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, target_of_diagram, diagram, coequalizer )
    
    return UniqueMorphism( cat, target_of_diagram, coequalizer );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( UniversalMorphismFromCoequalizerWithGivenCoequalizer,
        "UniversalMorphismFromCoequalizerWithGivenCoequalizer using the unique morphism",
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, target_of_diagram, diagram, target, tau, coequalizer )
    
    return UniqueMorphism( cat, coequalizer, target );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsMonomorphism,
        "IsMonomorphism is always true in a thin category",
        [ ],
        
  function( cat, alpha )
    
    return true;
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsEpimorphism,
        "IsEpimorphism is always true in a thin category",
        [  ],
        
  function( cat, alpha )
    
    return true;
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsLiftableAlongMonomorphism,
        "IsLiftableAlongMonomorphism using IsHomSetInhabited",
        [ [ IsHomSetInhabited, 1 ] ],
        
  function( cat, mono, tau )
    
    return IsHomSetInhabited( cat, Source( tau ), Source( mono ) );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( LiftAlongMonomorphism,
        "LiftAlongMonomorphism using the unique morphism from the source of the first argument to the source of the second",
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, mono, tau )
    
    ## the behavior of LiftAlongMonomorphism is unspecified on input violating the specification
    return UniqueMorphism( cat, Source( tau ), Source( mono ) );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsColiftableAlongEpimorphism,
        "IsColiftableAlongEpimorphism using IsHomSetInhabited",
        [ [ IsHomSetInhabited, 1 ] ],
        
  function( cat, epi, tau )
    
    return IsHomSetInhabited( cat, Target( epi ), Target( tau ) );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( ColiftAlongEpimorphism,
        "ColiftAlongEpimorphism using the unique morphism from the range of the second argument to the range of the first",
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, epi, tau )
    
    ## the behavior of ColiftAlongEpimorphism is unspecified on input violating the specification
    return UniqueMorphism( cat, Target( epi ), Target( tau ) );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsLiftable,
        "IsLiftable using IsLiftableAlongMonomorphism",
        [ [ IsLiftableAlongMonomorphism, 1 ] ],
        
  function( cat, alpha, beta )
    
    ## Caution with the order of the arguments!
    return IsLiftableAlongMonomorphism( cat, beta, alpha );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( Lift,
        "Lift using LiftAlongMonomorphism",
        [ [ LiftAlongMonomorphism, 1 ] ],
        
  function( cat, alpha, beta )
    
    ## Caution with the order of the arguments!
    return LiftAlongMonomorphism( cat, beta, alpha );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsColiftable,
        "IsColiftable using IsColiftableAlongEpimorphism",
        [ [ IsColiftableAlongEpimorphism, 1 ] ],
        
  function( cat, alpha, beta )
    
    return IsColiftableAlongEpimorphism( cat, alpha, beta );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( Colift,
        "Colift using ColiftAlongEpimorphism",
        [ [ ColiftAlongEpimorphism, 1 ] ],
        
  function( cat, alpha, beta )
    
    return ColiftAlongEpimorphism( cat, alpha, beta );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsIsomorphism,
        "IsIsomorphism using IsHomSetInhabited",
        [ [ IsHomSetInhabited, 1 ] ],
        
  function( cat, u )
    
    return IsHomSetInhabited( cat, Target( u ), Source( u ) );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( InverseForMorphisms,
        "InverseForMorphisms using the unique morphism from the range to the source",
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, u )
    
    return UniqueMorphism( cat, Target( u ), Source( u ) );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsOne,
        "IsOne using IsAutomorphism",
        [ [ IsAutomorphism, 1 ] ],
        
  function( cat, mor )
    
    return IsAutomorphism( cat, mor );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( InternalHomOnMorphisms,
        "InternalHomOnMorphisms as the unique morphism",
        [ [ InternalHomOnObjects, 2 ],
          [ UniqueMorphism, 1 ] ],
        
  function( cat, alpha, beta )
        
    return UniqueMorphism( cat, InternalHomOnObjects( cat, Target( alpha ), Source( beta ) ), InternalHomOnObjects( cat, Source( alpha ), Target( beta ) ) );
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( InternalCoHomOnMorphisms,
        "InternalCoHomOnMorphisms as the unique morphism",
        [ [ InternalCoHomOnObjects, 2 ],
          [ UniqueMorphism, 1 ] ],
        
  function( cat, alpha, beta )
        
    return UniqueMorphism( cat, InternalCoHomOnObjects( cat, Source( alpha ), Target( beta ) ), InternalCoHomOnObjects( cat, Target( alpha ), Source( beta ) ) );
    
end : CategoryFilter := IsThinCategory );

#####################################
# Monoidal prosets
#####################################

##
AddDerivationToCAP( TensorProductOnMorphismsWithGivenTensorProducts,
        "TensorProductOnMorphismsWithGivenTensorProducts as the unique morphism",
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, s, alpha, beta, r )
        
    return UniqueMorphism( cat, s, r );
    
end : CategoryFilter := IsMonoidalProset );

##
AddDerivationToCAP( ClosedMonoidalLeftEvaluationMorphismWithGivenSource,
        "ClosedMonoidalLeftEvaluationMorphismWithGivenSource as the unique morphism",
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, a, b, s )
    
    return UniqueMorphism( cat, s, b );
    
end : CategoryFilter := IsClosedMonoidalProset );

##
AddDerivationToCAP( ClosedMonoidalLeftCoevaluationMorphismWithGivenRange,
        "ClosedMonoidalLeftCoevaluationMorphismWithGivenRange as the unique morphism",
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, a, b, r )
    
    return UniqueMorphism( cat, b, r );
    
end : CategoryFilter := IsClosedMonoidalProset );

##
AddDerivationToCAP( CoclosedMonoidalLeftEvaluationMorphismWithGivenRange,
        "CoclosedMonoidalLeftEvaluationMorphismWithGivenRange as the unique morphism",
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, a, b, r )
    
    return UniqueMorphism( cat, b, r );
    
end : CategoryFilter := IsCoclosedMonoidalProset );

##
AddDerivationToCAP( CoclosedMonoidalLeftCoevaluationMorphismWithGivenSource,
        "CoclosedMonoidalLeftCoevaluationMorphismWithGivenSource as the unique morphism",
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, a, b, s )
    
    return UniqueMorphism( cat, s, b );
    
end : CategoryFilter := IsCoclosedMonoidalProset );

##
AddDerivationToCAP( AssociatorRightToLeftWithGivenTensorProducts,
        "AssociatorRightToLeftWithGivenTensorProducts as the unique morphism",
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, s, a, b, c, r )
    
    return UniqueMorphism( cat, s, r );
    
end : CategoryFilter := IsMonoidalProset );

##
AddDerivationToCAP( AssociatorLeftToRightWithGivenTensorProducts,
        "AssociatorLeftToRightWithGivenTensorProducts as the unique morphism",
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, s, a, b, c, r )
    
    return UniqueMorphism( cat, s, r );
    
end : CategoryFilter := IsMonoidalProset );

##
AddDerivationToCAP( LeftUnitorWithGivenTensorProduct,
        "LeftUnitorWithGivenTensorProduct as the unique morphism",
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, M, TM )
    
    return UniqueMorphism( cat, TM, M );
    
end : CategoryFilter := IsMonoidalProset );

##
AddDerivationToCAP( LeftUnitorInverseWithGivenTensorProduct,
        "LeftUnitorInverseWithGivenTensorProduct as the unique morphism",
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, M, TM )
    
    return UniqueMorphism( cat, M, TM );
    
end : CategoryFilter := IsMonoidalProset );

##
AddDerivationToCAP( RightUnitorWithGivenTensorProduct,
        "RightUnitorWithGivenTensorProduct as the unique morphism",
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, M, MT )
    
    return UniqueMorphism( cat, MT, M );
    
end : CategoryFilter := IsMonoidalProset );

##
AddDerivationToCAP( RightUnitorInverseWithGivenTensorProduct,
        "RightUnitorInverseWithGivenTensorProduct as the unique morphism",
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, M, MT )
    
    return UniqueMorphism( cat, M, MT );
    
end : CategoryFilter := IsMonoidalProset );

##
AddDerivationToCAP( BraidingWithGivenTensorProducts,
        "BraidingWithGivenTensorProducts as the unique morphism",
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, MN, M, N, NM )
    
    return UniqueMorphism( cat, MN, NM );
    
end : CategoryFilter := IsMonoidalProset );

##
AddDerivationToCAP( BraidingInverseWithGivenTensorProducts,
        "BraidingInverseWithGivenTensorProducts as the unique morphism",
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, NM, M, N, MN )
    
    return UniqueMorphism( cat, NM, MN );
    
end : CategoryFilter := IsMonoidalProset );

##
AddDerivationToCAP( UniqueMorphism,
        "UniqueMorphism using MorphismsOfExternalHom",
        [ [ MorphismsOfExternalHom, 1 ] ],
        
  function( cat, M, N )
    
    return MorphismsOfExternalHom( cat, M, N )[1];
    
end : CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsIsomorphicForObjects,
        "IsIsomorphicForObjects using the unique morphism",
        [ [ IsHomSetInhabited, 1 ],
          [ UniqueMorphism, 1 ],
          [ IsSplitMonomorphism, 1 ] ],
        
  function( cat, M, N )
    
    return IsHomSetInhabited( cat, M, N ) and
           IsSplitMonomorphism( cat, UniqueMorphism( cat, M, N ) );
    
end : CategoryFilter := IsThinCategory );

##
AddFinalDerivation( UniqueMorphism,
        "UniqueMorphism using CreateCapCategoryMorphismWithAttributes",
        [ ],
        [ UniqueMorphism,
          MorphismsOfExternalHom ],
        
  function( cat, A, B )
    
    return CreateCapCategoryMorphismWithAttributes( cat, A, B );
    
end : CategoryFilter := IsThinCategory );
