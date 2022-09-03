# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

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
AddDerivationToCAP( IsTerminal,
        [ [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ],
          [ TerminalObject, 1 ] ],
        
  function( cat, A )
    
    return AreIsomorphicForObjectsIfIsHomSetInhabited( cat, A, TerminalObject( cat ) );
    
end : Description := "IsTerminal using AreIsomorphicForObjectsIfIsHomSetInhabited and TerminalObject",
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
        [ [ IsHomSetInhabited, 1 ] ], ## FIXME: this should be obsolete, there is a bug in CAP
        
  function( cat, D )
    
    Info( DerivationInfo, 1000, "Currently derivations without preconditions are not supported, so we have to simulate a function call here: IsHomSetInhabited( cat, obj1, obj2 )." );
    
    return Source( D[1] );
    
end : Description := "Equalizer using Source",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( EmbeddingOfEqualizerWithGivenEqualizer,
        [ [ IdentityMorphism, 1 ] ],
        
  function( cat, D, E )
    
    return IdentityMorphism( cat, E );
    
end : Description := "EmbeddingOfEqualizerWithGivenEqualizer using IdentityMorphism",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( Coequalizer,
        [ [ IsHomSetInhabited, 1 ] ], ## FIXME: this should be obsolete, there is a bug in CAP
        
  function( cat, D )
    
    Info( DerivationInfo, 1000, "Currently derivations without preconditions are not supported, so we have to simulate a function call here: IsHomSetInhabited( cat, obj1, obj2 )." );
    
    return Range( D[1] );
    
end : Description := "Coequalizer using Range",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( ProjectionOntoCoequalizerWithGivenCoequalizer,
        [ [ IdentityMorphism, 1 ] ],
        
  function( cat, D, C )
    
    return IdentityMorphism( cat, C );
    
end : Description := "ProjectionOntoCoequalizerWithGivenCoequalizer using IdentityMorphism",
      CategoryFilter := IsThinCategory );
    
##
AddDerivationToCAP( Lift,
        [ [ LiftAlongMonomorphism, 1 ] ],
        
  ## Caution with the order of the arguments!
  { cat, alpha, beta } -> LiftAlongMonomorphism( cat, beta, alpha ) :
      Description := "Lift using LiftAlongMonomorphism",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( Colift,
        [ [ ColiftAlongEpimorphism, 1 ] ],
        
  { cat, alpha, beta } -> ColiftAlongEpimorphism( cat, alpha, beta ) :
      Description := "Colift using ColiftAlongEpimorphism",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsMonomorphism,
        
  { cat, alpha } -> true : Description := "IsMonomorphism is always true",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsEpimorphism,
        
  { cat, alpha } -> true : Description := "IsEpimorphism is always true",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsIsomorphism,
        [ [ IsHomSetInhabited, 1 ] ],
        
  function( cat, u )
    
    return IsHomSetInhabited( cat, Range( u ), Source( u ) );
    
end : Description := "IsIsomorphism using IsHomSetInhabited",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsOne,
        [ [ IsAutomorphism, 1 ] ],
        
  { cat, mor } -> IsAutomorphism( cat, mor ) : Description := "IsOne using IsAutomorphism",
      CategoryFilter := IsThinCategory );
