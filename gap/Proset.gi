# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

SetInfoLevel( InfoLocales, 1 );

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
    
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec( ), C,
                   A,
                   B );
    
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
InstallMethod( Display,
        "for an object in a proset",
        [ IsMorphismInThinCategory ],

  function( u )
    
    Display( Range( u ) );
    Print( " ^\n |\n |\n" );
    Display( Source( u ) );
    
end );
