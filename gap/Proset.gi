# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

SetInfoLevel( InfoLocales, 1 );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_PREORDERED_SETS,
  function( preordered_set )
    
    SetIsThinCategory( preordered_set, true );
    
    ##
    AddUniqueMorphism( preordered_set,
      function( cat, A, B )
        
        if not IsIdenticalObj( cat, CapCategory( A ) ) then
            Error( "the first object belong to different category\n" );
        elif not IsIdenticalObj( cat, CapCategory( B ) ) then
            Error( "the second object belong to different category\n" );
        fi;
        
        return CreateCapCategoryMorphismWithAttributes( cat, A, B );
        
    end );
    
    ##
    AddIdentityMorphism( preordered_set,
      function( cat, A )
        
        return UniqueMorphism( cat, A, A );
        
    end );
    
    ##
    AddPreCompose( preordered_set,
      function( cat, u1, u2 )
        
        return UniqueMorphism( cat, Source( u1 ), Range( u2 ) );
        
    end );
    
    ## the behavior of LiftAlongMonomorphism is unspecified on input violating the specification
    AddLiftAlongMonomorphism( preordered_set,
      function( cat, u1, u2 )
        
        return UniqueMorphism( cat, Source( u1 ), Source( u2 ) );
        
    end );
    
    ## the behavior of ColiftAlongEpimorphism is unspecified on input violating the specification
    AddColiftAlongEpimorphism( preordered_set,
      function( cat, u1, u2 )
        
        return UniqueMorphism( cat, Range( u1 ), Range( u2 ) );
        
    end );
    
    ##
    AddInverseForMorphisms( preordered_set,
      function( cat, u )
        
        return UniqueMorphism( cat, Range( u ), Source( u ) );
        
    end );
    
    ##
    AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( preordered_set,
      function( cat, A, T )
        
        return UniqueMorphism( cat, A, T );
        
    end );
    
    ##
    AddUniversalMorphismFromInitialObjectWithGivenInitialObject( preordered_set,
      function( cat, A, I )
        
        return UniqueMorphism( cat, I, A );
        
    end );
    
    ##
    AddUniversalMorphismIntoEqualizerWithGivenEqualizer( preordered_set,
      function( cat, D, test_object, tau, E )
        
        return UniqueMorphism( cat, Source( tau ), E );
        
    end );
    
    ##
    AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( preordered_set,
      function( cat, D, test_object, tau, C )
        
        return UniqueMorphism( cat, C, Range( tau ) );
        
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
