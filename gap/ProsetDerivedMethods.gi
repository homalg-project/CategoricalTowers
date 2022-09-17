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
AddDerivationToCAP( IsEqualForMorphisms,
        [ [ IsEqualForObjects, 2 ] ],
        
  function( cat, u1, u2 )
    
    return IsEqualForObjects( cat, Source( u1 ), Source( u2 ) ) and
           IsEqualForObjects( cat, Range( u1 ), Range( u2 ) );
        
end : Description := "IsEqualForMorphisms using IsEqualForObjects applied to sources and ranges",
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
        
  function( cat, D )
    
    return Source( D[1] );
    
end : Description := "Equalizer using Source",
      CategoryFilter := cat -> HasIsThinCategory( cat ) and IsThinCategory( cat ) and not ( IsBound( cat!.supports_empty_limits ) and cat!.supports_empty_limits = true ) );

##
AddDerivationToCAP( EmbeddingOfEqualizer,
        [ [ Equalizer, 1 ],
          [ UniqueMorphism, 1 ] ],
        
  function( cat, D )
    
    ## FIXME: We need an elaborate version of EmbeddingOfEqualizer which gets the source of the diagram as seperate input
    return UniqueMorphism( cat, Equalizer( cat, D ), Source( D[1] ) );
    
end : Description := "EmbeddingOfEqualizer using the unique morphism into source of the diagram",
      CategoryFilter := cat -> HasIsThinCategory( cat ) and IsThinCategory( cat ) and not ( IsBound( cat!.supports_empty_limits ) and cat!.supports_empty_limits = true ) );

##
AddDerivationToCAP( UniversalMorphismIntoEqualizer,
        [ [ Equalizer, 1 ],
          [ UniqueMorphism, 1 ] ],
        
  function( cat, D, test_object, tau )
    
    return UniqueMorphism( cat, test_object, Equalizer( cat, D ) );
    
end : Description := "UniversalMorphismIntoEqualizer using the unique morphism from the test object",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( Coequalizer,
        [ ],
        
  function( cat, D )
    
    return Range( D[1] );
    
end : Description := "Coequalizer using Range",
      CategoryFilter := cat -> HasIsThinCategory( cat ) and IsThinCategory( cat ) and not ( IsBound( cat!.supports_empty_limits ) and cat!.supports_empty_limits = true ) );

##
AddDerivationToCAP( ProjectionOntoCoequalizer,
        [ [ Coequalizer, 1 ],
          [ UniqueMorphism, 1 ] ],
        
  function( cat, D )
    
    ## FIXME: We need an elaborate version of ProjectionOntoCoequalizer which gets the range of the diagram as seperate input
    return UniqueMorphism( cat, Range( D[1] ), Coequalizer( cat, D ) );
    
end : Description := "ProjectionOntoCoequalizer using the unique morphism from range of the diagram",
      CategoryFilter := cat -> HasIsThinCategory( cat ) and IsThinCategory( cat ) and not ( IsBound( cat!.supports_empty_limits ) and cat!.supports_empty_limits = true ) );

##
AddDerivationToCAP( UniversalMorphismFromCoequalizer,
        [ [ Coequalizer, 1 ],
          [ UniqueMorphism, 1 ] ],
        
  function( cat, D, test_object, tau )
    
    return UniqueMorphism( cat, Coequalizer( cat, D ), test_object );
    
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
