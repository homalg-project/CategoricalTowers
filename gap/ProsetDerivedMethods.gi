# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

## FIXME: CategoryFilter := C -> HasIsThinCategory( C ) and IsThinCategory( C ) and CanCompute( C, "UniqueMorphism" )
AddDerivationToCAP( IsWellDefinedForMorphisms,
        [ [ IsHomSetInhabited, 1 ] ],
        
  function( cat, u )
    
    return IsHomSetInhabited( cat, Source( u ), Range( u ) );
        
end : Description := "IsWellDefinedForMorphisms checking the inhabitedness of the homset",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsCongruentForMorphisms,
        
  function( cat, u1, u2 )
    
    return true;
        
end : Description := "two parallel morphisms are always congruent",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( AreIsomorphicForObjectsIfIsHomSetInhabited,
        [ [ IsHomSetInhabited, 1 ] ],
        
  function( cat, A, B )
    
    return IsHomSetInhabited( cat, B, A );
    
end : Description := "AreIsomorphicForObjectsIfIsHomSetInhabited using IsHomSetInhabited",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IdentityMorphism,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, A )
    
    return UniqueMorphism( cat, A, A );
    
end : Description := "IdentityMorphism is the unique endomorphism",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( PreCompose,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, u1, u2 )
    
    return UniqueMorphism( cat, Source( u1 ), Range( u2 ) );
    
end : Description := "PreCompose is the unique from the source of the pre-morphism to the target of the post-morphism",
      CategoryFilter := IsThinCategory );


##
AddDerivationToCAP( IsTerminal,
        [ [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ],
          [ TerminalObject, 1 ] ],
        
  function( cat, A )
    
    return AreIsomorphicForObjectsIfIsHomSetInhabited( cat, A, TerminalObject( cat ) );
    
end : Description := "IsTerminal using AreIsomorphicForObjectsIfIsHomSetInhabited and TerminalObject",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( UniversalMorphismIntoTerminalObject,
        [ [ TerminalObject, 1 ],
          [ UniqueMorphism, 1 ] ],
        
  function( cat, A )
        
    return UniqueMorphism( cat, A, TerminalObject( cat ) );
    
end : Description := "UniversalMorphismIntoTerminalObject using the unique morphism into the terminal object",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsInitial,
        [ [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ],
          [ InitialObject, 1 ] ],
        
  function( cat, A )
    
    return AreIsomorphicForObjectsIfIsHomSetInhabited( cat, InitialObject( cat ), A );
    
end : Description := "IsInitial using AreIsomorphicForObjectsIfIsHomSetInhabited and InitialObject",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( UniversalMorphismFromInitialObject,
        [ [ InitialObject, 1 ],
          [ UniqueMorphism, 1 ] ],
        
  function( cat, A )
    
    return UniqueMorphism( cat, InitialObject( cat ), A );
    
end : Description := "UniversalMorphismFromInitialObject using the unique morphism from the initial object",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsDominating,
        [ [ IsHomSetInhabited, 1 ] ],
        
  function( cat, u1, u2 )
    
    return IsHomSetInhabited( cat, Source( u1 ), Source( u2 ) );
    
end : Description := "IsDominating using IsHomSetInhabited applied to the sources",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsCodominating,
        [ [ IsHomSetInhabited, 1 ] ],
        
  function( cat, u1, u2 )
    
    return IsHomSetInhabited( cat, Range( u2 ), Range( u1 ) );
    
end : Description := "IsCodominating using IsHomSetInhabited applied to the ranges",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( Equalizer,
        [ ],
        
  function( cat, A, D )
    
    return A;
    
end : Description := "Equalizer using Source",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( EmbeddingOfEqualizer,
        [ [ Equalizer, 1 ],
          [ UniqueMorphism, 1 ] ],
        
  function( cat, A, D )
    
    return UniqueMorphism( cat, Equalizer( cat, A, D ), A );
    
end : Description := "EmbeddingOfEqualizer using the unique morphism into source of the diagram",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( UniversalMorphismIntoEqualizer,
        [ [ Equalizer, 1 ],
          [ UniqueMorphism, 1 ] ],
        
  function( cat, A, D, test_object, tau )
    
    return UniqueMorphism( cat, test_object, Equalizer( cat, A, D ) );
    
end : Description := "UniversalMorphismIntoEqualizer using the unique morphism from the test object",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( Coequalizer,
        [ ],
        
  function( cat, A, D )
    
    return A;
    
end : Description := "Coequalizer using Range",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( ProjectionOntoCoequalizer,
        [ [ Coequalizer, 1 ],
          [ UniqueMorphism, 1 ] ],
        
  function( cat, A, D )
    
    return UniqueMorphism( cat, A, Coequalizer( cat, A, D ) );
    
end : Description := "ProjectionOntoCoequalizer using the unique morphism from range of the diagram",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( UniversalMorphismFromCoequalizer,
        [ [ Coequalizer, 1 ],
          [ UniqueMorphism, 1 ] ],
        
  function( cat, A, D, test_object, tau )
    
    return UniqueMorphism( cat, Coequalizer( cat, A, D ), test_object );
    
end : Description := "UniversalMorphismIntoEqualizer using the unique morphism into the test object",
      CategoryFilter := IsThinCategory );
    
##
AddDerivationToCAP( IsMonomorphism,
        [ ],
        
  function( cat, alpha )
    
    return true;
    
end : Description := "IsMonomorphism is always true in a thin category",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsEpimorphism,
        [ ],
        
  function( cat, alpha )
    
    return true;
    
end : Description := "IsEpimorphism is always true in a thin category",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsLiftableAlongMonomorphism,
        [ [ IsHomSetInhabited, 1 ] ],
        
  function( cat, u1, u2 )
    
    return IsHomSetInhabited( cat, Source( u1 ), Source( u2 ) );
    
end : Description := "IsLiftableAlongMonomorphism using IsHomSetInhabited",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( LiftAlongMonomorphism,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, u1, u2 )
    
    ## the behavior of LiftAlongMonomorphism is unspecified on input violating the specification
    return UniqueMorphism( cat, Source( u1 ), Source( u2 ) );
    
end : Description := "LiftAlongMonomorphism using the unique morphism from the source of the first argument to the source of the second",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsColiftableAlongEpimorphism,
        [ [ IsHomSetInhabited, 1 ] ],
        
  function( cat, u1, u2 )
    
    return IsHomSetInhabited( cat, Range( u1 ), Range( u2 ) );
    
end : Description := "IsColiftableAlongEpimorphism using IsHomSetInhabited",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( ColiftAlongEpimorphism,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, u1, u2 )
    
    ## the behavior of ColiftAlongEpimorphism is unspecified on input violating the specification
    return UniqueMorphism( cat, Range( u1 ), Range( u2 ) );
    
end : Description := "ColiftAlongEpimorphism using the unique morphism from the range of the second argument to the range of the first",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsLiftable,
        [ [ IsLiftableAlongMonomorphism, 1 ] ],
        
  function( cat, alpha, beta )
    
    ## Caution with the order of the arguments!
    return IsLiftableAlongMonomorphism( cat, beta, alpha );
    
end : Description := "IsLiftable using IsLiftableAlongMonomorphism",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( Lift,
        [ [ LiftAlongMonomorphism, 1 ] ],
        
  function( cat, alpha, beta )
    
    ## Caution with the order of the arguments!
    return LiftAlongMonomorphism( cat, beta, alpha );
    
end : Description := "Lift using LiftAlongMonomorphism",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsColiftable,
        [ [ IsColiftableAlongEpimorphism, 1 ] ],
        
  function( cat, alpha, beta )
    
    return IsColiftableAlongEpimorphism( cat, alpha, beta );
    
end : Description := "IsColiftable using IsColiftableAlongEpimorphism",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( Colift,
        [ [ ColiftAlongEpimorphism, 1 ] ],
        
  function( cat, alpha, beta )
    
    return ColiftAlongEpimorphism( cat, alpha, beta );
    
end : Description := "Colift using ColiftAlongEpimorphism",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsIsomorphism,
        [ [ IsHomSetInhabited, 1 ] ],
        
  function( cat, u )
    
    return IsHomSetInhabited( cat, Range( u ), Source( u ) );
    
end : Description := "IsIsomorphism using IsHomSetInhabited",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( InverseForMorphisms,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, u )
    
    return UniqueMorphism( cat, Range( u ), Source( u ) );
    
end : Description := "InverseForMorphisms using the unique morphism from the range to the source",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsOne,
        [ [ IsAutomorphism, 1 ] ],
        
  function( cat, mor )
    
    return IsAutomorphism( cat, mor );
    
end : Description := "IsOne using IsAutomorphism",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( InternalHomOnMorphisms,
        [ [ InternalHomOnObjects, 2 ],
          [ UniqueMorphism, 1 ] ],
        
  function( cat, alpha, beta )
        
    return UniqueMorphism( cat, InternalHomOnObjects( cat, Range( alpha ), Source( beta ) ), InternalHomOnObjects( cat, Source( alpha ), Range( beta ) ) );
    
end : Description := "InternalHomOnMorphisms as the unique morphism",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( InternalCoHomOnMorphisms,
        [ [ InternalCoHomOnObjects, 2 ],
          [ UniqueMorphism, 1 ] ],
        
  function( cat, alpha, beta )
        
    return UniqueMorphism( cat, InternalCoHomOnObjects( cat, Source( alpha ), Range( beta ) ), InternalCoHomOnObjects( cat, Range( alpha ), Source( beta ) ) );
    
end : Description := "InternalCoHomOnMorphisms as the unique morphism",
      CategoryFilter := IsThinCategory );
