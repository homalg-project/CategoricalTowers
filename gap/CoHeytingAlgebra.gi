# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

InstallTrueMethod( IsCoHeytingAlgebra, IsLattice and IsCocartesianCoclosedCategory );
InstallTrueMethod( IsDistributiveLattice, IsCoHeytingAlgebra );
InstallTrueMethod( IsCocartesianCoclosedCategory, IsCoHeytingAlgebra );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_COHEYTING_ALGEBRAS,
  function( coheyting_algebra )
    
    SetIsCocartesianCoclosedCategory( coheyting_algebra, true );
    
    ADD_COMMON_METHODS_FOR_LATTICES( coheyting_algebra );
    
    ## The cocartesian monoidal structure
    
    ## The coclosedness of the cocartesian monoidal structure
    
    ##
    AddCoexponentialOnMorphismsWithGivenCoexponentials( coheyting_algebra,
      function( cat, S, alpha, beta, R )
        
        return UniqueMorphism( cat, S, R );
        
    end );
    
    ##
    AddCocartesianEvaluationMorphismWithGivenRange( coheyting_algebra,
      function( cat, A, B, Coex_A_BuB )
        
        return UniqueMorphism( cat, A, Coex_A_BuB );
        
    end );
    
    ##
    AddCocartesianCoevaluationMorphismWithGivenSource( coheyting_algebra,
      function( cat, A, B, Coex_AuB_A)
        
        return UniqueMorphism( cat, Coex_AuB_A, B );
        
    end );
    
    ##
    if CanCompute( coheyting_algebra, "CoexponentialOnObjects" ) then
        
        AddCoproductToCoexponentialAdjunctionMap( coheyting_algebra,
          function( cat, C, B, g )
            local A;
            
            A := Source( g );
            
            return UniqueMorphism( cat, CoexponentialOnObjects( cat, A, B ), C );
            
        end );
        
    fi;
    
    ##
    AddCoexponentialToCoproductAdjunctionMap( coheyting_algebra,
      function( cat, A, B, f )
        local C, CB;
        
        C := Range( f );
        
        CB := Coproduct( cat, [ C, B ] );
        
        return UniqueMorphism( cat, A, CB );
        
    end );
    
    ##
    AddCocartesianPreCoComposeMorphismWithGivenObjects( coheyting_algebra,
      function( cat, Coex_A_C, A, B, C, Coex_A_BuCoex_B_C )
        
        return UniqueMorphism( cat, Coex_A_C, Coex_A_BuCoex_B_C );
        
    end );
    
    ##
    AddCocartesianPostCoComposeMorphismWithGivenObjects( coheyting_algebra,
      function( cat, Coex_A_C, A, B, C, Coex_A_BuCoex_B_C )
        
        return UniqueMorphism( cat, Coex_A_C, Coex_A_BuCoex_B_C );
        
    end );
    
    ##
    AddCoexponentialCoproductCompatibilityMorphismWithGivenObjects( coheyting_algebra,
      function( cat, source, L, range )
        
        return UniqueMorphism( cat, source, range );
        
    end );
    
    ## The co-negation
    
    ##
    AddMorphismFromDoubleConegationWithGivenDoubleConegation( coheyting_algebra,
      function( cat, A, B )
        
        return UniqueMorphism( cat, A, B );
        
    end );
    
end );

##
InstallMethod( StableInternalCoHom,
        "for two objects in a thin category",
        [ IsObjectInThinCategory, IsObjectInThinCategory ],

  function( V, W )
    local V_W;
    
    V_W := V;
    
    repeat
        V := V_W;
        V_W := InternalCoHomOnObjects( V_W, W );
    until AreIsomorphicForObjectsIfIsHomSetInhabited( V_W, V );
    
    return V_W;
    
end );
