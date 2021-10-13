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
                                     filter_list := [ "category", "object", "object" ],
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
      function( cat, u )
        
        return IsHomSetInhabited( cat, Source( u ), Range( u ) );
        
    end );
    
    ##
    AddIsEqualForCacheForObjects( preordered_set,
      { cat, obj1, obj2 } -> IsIdenticalObj( obj1, obj2 ) );
    
    ##
    AddIsEqualForCacheForMorphisms( preordered_set,
      function( cat, u1, u2 )
        
        return IsEqualForCacheForObjects( cat, Source( u1 ), Source( u2 ) ) and
               IsEqualForCacheForObjects( cat, Range( u1 ), Range( u2 ) );
        
    end );
    
    ##
    AddIdentityMorphism( preordered_set,
      function( cat, A )
        
        return UniqueMorphism( A, A );
        
    end );
    
    ##
    AddPreCompose( preordered_set,
      function( cat, u1, u2 )
        
        return UniqueMorphism( Source( u1 ), Range( u2 ) );
        
    end );
    
    ##
    AddIsMonomorphism( preordered_set,
      { cat, alpha } -> true );
    
    ##
    AddIsEpimorphism( preordered_set,
      { cat, alpha } -> true );
    
    ##
    AddIsOne( preordered_set,
      { cat, alpha } -> IsAutomorphism( cat, alpha ) );
    
    ##
    AddLiftAlongMonomorphism( preordered_set,
      function( cat, u1, u2 )
        

        ## WARNING: when installing primitive methods use primitively installed methhods
        if not IsDominating( cat, u1, u2 ) then
            return fail;
        fi;
        
        return UniqueMorphism( Source( u1 ), Source( u2 ) );
        
    end );
    
    ##
    AddColiftAlongEpimorphism( preordered_set,
      function( cat, u1, u2 )
        
        ## WARNING: when installing primitive methods use primitively installed methhods
        if not IsCodominating( cat, u2, u1 ) then
            return fail;
        fi;
        
        return UniqueMorphism( Range( u1 ), Range( u2 ) );
        
    end );
    
    ##
    AddInverseForMorphisms( preordered_set,
      function( cat, u )
        
        return UniqueMorphism( Range( u ), Source( u ) );
        
    end );
    
    ##
    AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( preordered_set,
      function( cat, A, T )
        
        return UniqueMorphism( A, T );
        
    end );
    
    ##
    AddUniversalMorphismFromInitialObjectWithGivenInitialObject( preordered_set,
      function( cat, A, I )
        
        return UniqueMorphism( I, A );
        
    end );
    
    ##
    AddUniversalMorphismIntoEqualizerWithGivenEqualizer( preordered_set,
      function( cat, D, test_object, tau, E )
        
        return UniqueMorphism( Source( tau ), E );
        
    end );
    
    ##
    AddEqualizerFunctorialWithGivenEqualizers( preordered_set,
      function( cat, s, L1, m, L3, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
    ##
    AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( preordered_set,
      function( cat, D, test_object, tau, C )
        
        return UniqueMorphism( C, Range( tau ) );
        
    end );
    
    ##
    AddCoequalizerFunctorialWithGivenCoequalizers( preordered_set,
      function( cat, s, L1, m, L3, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
end );

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
    
    return AreIsomorphicForObjectsIfIsHomSetInhabited( cat, A, TerminalObject( cat, cat ) );
    
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
        [ [ LiftAlongMonomorphism, 1 ] ],
        
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

##
InstallMethod( Display,
        "for an object in a proset",
        [ IsMorphismInThinCategory ],

  function( u )
    
    Display( Range( u ) );
    Print( " ^\n |\n |\n" );
    Display( Source( u ) );
    
end );
