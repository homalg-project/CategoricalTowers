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
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        if not IsIdenticalObj( cat, CapCategory( A ) ) then
            Error( "the first object belong to different category\n" );
        elif not IsIdenticalObj( cat, CapCategory( B ) ) then
            Error( "the second object belong to different category\n" );
        fi;
        
        return CreateCapCategoryMorphismWithAttributes( cat, A, B );
        
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
