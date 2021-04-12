# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

SetInfoLevel( InfoLocales, 1 );

InstallValue( PREORDERED_SET_METHOD_NAME_RECORD,
        rec(
            AreIsomorphicForObjectsIfIsHomSetInhabited := rec(
                                     installation_name := "AreIsomorphicForObjectsIfIsHomSetInhabited",
                                     filter_list := [ "object", "object" ],
                                     return_type := "bool",
                                     is_merely_set_theoretic := true
                                    ),
            )
        );

CAP_INTERNAL_ENHANCE_NAME_RECORD( PREORDERED_SET_METHOD_NAME_RECORD );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( PREORDERED_SET_METHOD_NAME_RECORD );

##
InstallMethod( UniqueMorphism,
        "for two objects in a thin category",
        [ IsObjectInThinCategory, IsObjectInThinCategory ],

  function( A, B )
    local C, u;
    
    C := CapCategory( A );
    
    if not IsIdenticalObj( C, CapCategory( B ) ) then
        Error( "the two objects belong to different categories\n" );
    fi;
    
    u := rec( );
    
    ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( u, C,
            A,
            B,
            IsMonomorphism, true,
            IsEpimorphism, true
            );
    
    return u;
    
end );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_PREORDERED_SETS,
  function( preordered_set )
    
    SetIsThinCategory( preordered_set, true );
    
    ##
    AddIsWellDefinedForMorphisms( preordered_set,
      function( u )
        
        return IsHomSetInhabited( Source( u ), Range( u ) );
        
    end );
    
    ##
    AddIsEqualForCacheForObjects( preordered_set,
      IsIdenticalObj );
    
    ##
    AddIsEqualForCacheForMorphisms( preordered_set,
      function( u1, u2 )
        
        return IsEqualForCacheForObjects( Source( u1 ), Source( u2 ) ) and
               IsEqualForCacheForObjects( Range( u1 ), Range( u2 ) );
        
    end );
    
    ##
    AddIdentityMorphism( preordered_set,
      function( A )
        
        return UniqueMorphism( A, A );
        
    end );
    
    ##
    AddPreCompose( preordered_set,
      function( u1, u2 )
        
        return UniqueMorphism( Source( u1 ), Range( u2 ) );
        
    end );
    
    ##
    AddIsMonomorphism( preordered_set,
      ReturnTrue );
    
    ##
    AddIsEpimorphism( preordered_set,
      ReturnTrue );
    
    ##
    AddIsOne( preordered_set,
      IsAutomorphism );
    
    ##
    AddLiftAlongMonomorphism( preordered_set,
      function( u1, u2 )
        
        if not IsDominating( u1, u2 ) then
            return fail;
        fi;
        
        return UniqueMorphism( Source( u1 ), Source( u2 ) );
        
    end );
    
    ##
    AddColiftAlongEpimorphism( preordered_set,
      function( u1, u2 )
        
        if not IsCodominating( u2, u1 ) then
            return fail;
        fi;
        
        return UniqueMorphism( Range( u1 ), Range( u2 ) );
        
    end );
    
    ##
    AddInverse( preordered_set,
      function( u )
        
        return UniqueMorphism( Range( u ), Source( u ) );
        
    end );
    
    ##
    AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( preordered_set,
      function( A, T )
        
        return UniqueMorphism( A, T );
        
    end );
    
    ##
    AddUniversalMorphismFromInitialObjectWithGivenInitialObject( preordered_set,
      function( A, I )
        
        return UniqueMorphism( I, A );
        
    end );
    
    ##
    AddUniversalMorphismIntoEqualizerWithGivenEqualizer( preordered_set,
      function( D, tau, E )
        
        return UniqueMorphism( Source( tau ), E );
        
    end );
    
    ##
    AddEqualizerFunctorialWithGivenEqualizers( preordered_set,
      function( s, L1, m, L3, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
    ##
    AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( preordered_set,
      function( D, tau, C )
        
        return UniqueMorphism( C, Range( tau ) );
        
    end );
    
    ##
    AddCoequalizerFunctorialWithGivenCoequalizers( preordered_set,
      function( s, L1, m, L3, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
end );

##
AddDerivationToCAP( IsEqualForMorphisms,
        [ [ IsEqualForObjects, 2 ] ],
        
  function( cat, u1, u2 )
    
    return IsEqualForObjects( Source( u1 ), Source( u2 ) ) and
           IsEqualForObjects( Range( u1 ), Range( u2 ) );
        
end : Description := "IsEqualForMorphisms using IsEqualForObjects applied to sources and ranges",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( AreIsomorphicForObjectsIfIsHomSetInhabited,
        [ [ IsHomSetInhabited, 1 ] ],
        
  function( A, B )
    
    return IsHomSetInhabited( B, A );
    
end : Description := "AreIsomorphicForObjectsIfIsHomSetInhabited using IsHomSetInhabited",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsTerminal,
        [ [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ],
          [ TerminalObject, 1 ] ],
        
  function( cat, A )
    
    return AreIsomorphicForObjectsIfIsHomSetInhabited( A, TerminalObject( A ) );
    
end : Description := "IsTerminal using AreIsomorphicForObjectsIfIsHomSetInhabited and TerminalObject",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsInitial,
        [ [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ],
          [ InitialObject, 1 ] ],
        
  function( cat, A )
    
    return AreIsomorphicForObjectsIfIsHomSetInhabited( InitialObject( A ), A );
    
end : Description := "IsInitial using AreIsomorphicForObjectsIfIsHomSetInhabited and InitialObject",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsDominating,
        [ [ IsHomSetInhabited, 1 ] ],
        
  function( cat, u1, u2 )
    
    return IsHomSetInhabited( Source( u1 ), Source( u2 ) );
    
end : Description := "IsDominating using IsHomSetInhabited applied to the sources",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsCodominating,
        [ [ IsHomSetInhabited, 1 ] ],
        
  function( cat, u1, u2 )
    
    return IsHomSetInhabited( Range( u2 ), Range( u1 ) );
    
end : Description := "IsCodominating using IsHomSetInhabited applied to the ranges",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( Equalizer,
        [ [ IsHomSetInhabited, 1 ] ], ## FIXME: this should be obsolete, there is a bug in CAP
        
  function( cat, D )
    
    return Source( D[1] );
    
end : Description := "Equalizer using Source",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( EmbeddingOfEqualizerWithGivenEqualizer,
        [ [ IdentityMorphism, 1 ] ],
        
  function( cat, D, E )
    
    return IdentityMorphism( E );
    
end : Description := "EmbeddingOfEqualizerWithGivenEqualizer using IdentityMorphism",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( Coequalizer,
        [ [ IsHomSetInhabited, 1 ] ], ## FIXME: this should be obsolete, there is a bug in CAP
        
  function( cat, D )
    
    return Range( D[1] );
    
end : Description := "Coequalizer using Range",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( ProjectionOntoCoequalizerWithGivenCoequalizer,
        [ [ IdentityMorphism, 1 ] ],
        
  function( cat, D, C )
    
    return IdentityMorphism( C );
    
end : Description := "ProjectionOntoCoequalizerWithGivenCoequalizer using IdentityMorphism",
      CategoryFilter := IsThinCategory );
    
##
AddDerivationToCAP( Lift,
        [ [ LiftAlongMonomorphism, 1 ] ],
        
  LiftAlongMonomorphism :
      Description := "Lift using LiftAlongMonomorphism",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( Colift,
        [ [ LiftAlongMonomorphism, 1 ] ],
        
  ColiftAlongEpimorphism :
      Description := "Colift using ColiftAlongEpimorphism",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsMonomorphism,
        
  ReturnTrue : Description := "IsMonomorphism is always true",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsEpimorphism,
        
  ReturnTrue : Description := "IsEpimorphism is always true",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsIsomorphism,
        [ [ IsHomSetInhabited, 1 ] ],
        
  function( cat, u )
    
    return IsHomSetInhabited( Range( u ), Source( u ) );
    
end : Description := "IsIsomorphism using IsHomSetInhabited",
      CategoryFilter := IsThinCategory );

##
AddDerivationToCAP( IsOne,
        [ [ IsAutomorphism, 1 ] ],
        
  { cat, mor } -> IsAutomorphism( cat, mor ) : Description := "IsOne using IsAutomorphism",
      CategoryFilter := IsThinCategory );

##
InstallMethod( Display,
        "for an object in a proset",
        [ IsMorphismInThinCategory ],

  function( u )
    
    Display( Range( u ) );
    Print( " ^\n |\n |\n" );
    Display( Source( u ) );
    
end );
