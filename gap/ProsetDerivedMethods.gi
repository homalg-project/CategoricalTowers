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
        
  function( cat, D )
    
    return Source( D[1] );
    
end : Description := "Equalizer using Source",
      CategoryFilter := cat -> HasIsThinCategory( cat ) and IsThinCategory( cat ) and not ( IsBound( cat!.supports_empty_limits ) and cat!.supports_empty_limits = true ) );

##
AddDerivationToCAP( EmbeddingOfEqualizerWithGivenEqualizer,
        [ [ IdentityMorphism, 1 ] ],
        
  function( cat, D, E )
    
    return IdentityMorphism( cat, E );
    
end : Description := "EmbeddingOfEqualizerWithGivenEqualizer using IdentityMorphism",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( Coequalizer,
        
  function( cat, D )
    
    return Range( D[1] );
    
end : Description := "Coequalizer using Range",
      CategoryFilter := cat -> HasIsThinCategory( cat ) and IsThinCategory( cat ) and not ( IsBound( cat!.supports_empty_limits ) and cat!.supports_empty_limits = true ) );

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
  function( cat, alpha, beta )
    
    return LiftAlongMonomorphism( cat, beta, alpha );

end : Description := "Lift using LiftAlongMonomorphism",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( Colift,
        [ [ ColiftAlongEpimorphism, 1 ] ],
        
  function( cat, alpha, beta )

    return ColiftAlongEpimorphism( cat, alpha, beta );

end : Description := "Colift using ColiftAlongEpimorphism",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsMonomorphism,
        
  function( cat, alpha )
    
    return true;
    
end : Description := "IsMonomorphism is always true",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsEpimorphism,
        
  function( cat, alpha )
    
    return true;
    
end : Description := "IsEpimorphism is always true",
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
        
  function( cat, mor )
    
    return IsAutomorphism( cat, mor );
    
end : Description := "IsOne using IsAutomorphism",
      CategoryFilter := IsThinCategory );
