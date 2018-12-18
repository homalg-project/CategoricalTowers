#
# Locales: Heyting algebras
#
# Implementations
#

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_HEYTING_ALGEBRAS,
  function( heyting_algebra )
    
    SetIsCartesianClosedCategory( heyting_algebra, true );
    
    SetIsStrictMonoidalCategory( heyting_algebra, true );
    
    ADD_COMMON_METHODS_FOR_LATTICES( heyting_algebra );
    
    ## The cartesian monoidal structure
    
    ## The closedness of the cartesian monoidal structure
    
    ##
    AddExponentialOnMorphismsWithGivenExponentials( heyting_algebra,
      function( S, alpha, beta, T )
        
        return UniqueMorphism( S, T );
        
    end );
    
    ##
    AddEvaluationMorphismWithGivenSource( heyting_algebra,
      function( M, N, HM_NxM )
        
        return UniqueMorphism( HM_NxM, N );
        
    end );
    
    ##
    AddCoevaluationMorphismWithGivenRange( heyting_algebra,
      function( M, N, HN_MxN )
        
        return UniqueMorphism( M, HN_MxN );
        
    end );
    
    ##
    AddDirectProductToExponentialAdjunctionMap( heyting_algebra,
      function( M, N, f )
        local L;
        
        L := Range( f );
        
        return UniqueMorphism( M, ExponentialOnObjects( N, L ) );
        
    end );
    
    ##
    AddExponentialToDirectProductAdjunctionMap( heyting_algebra,
      function( N, L, g )
        local M, MN;
        
        M := Source( g );
        
        MN := DirectProduct( M, N );
        
        return UniqueMorphism( MN, L );
        
    end );
    
    ##
    AddCartesianPreComposeMorphismWithGivenObjects( heyting_algebra,
      function( HM_NxH_N_L, M, N, L, HM_L );
        
        return UniqueMorphism( HM_NxH_N_L, HM_L );
        
    end );
    
    ##
    AddCartesianPostComposeMorphismWithGivenObjects( heyting_algebra,
      function( HM_NxH_N_L, M, N, L, HM_L );
        
        return UniqueMorphism( HM_NxH_N_L, HM_L );
        
    end );
    
    ##
    AddDirectProductExponentialCompatibilityMorphismWithGivenObjects( heyting_algebra,
      function( S1, T1, S2, T2, L )
        
        return UniqueMorphism( L[1], L[2] );
        
    end );
    
    ## The duals
    
    ##
    AddCartesianDualOnObjects( heyting_algebra,
      function( A )
        
        return ExponentialOnObjects( A, InitialObject( heyting_algebra ) );
        
    end );
    
    ##
    AddCartesianDualOnMorphismsWithGivenCartesianDuals( heyting_algebra,
      function( B_, u, A_ )
        
        return ExponentialOnMorphismsWithGivenExponentials( B_, u, IdentityMorphism( InitialObject( heyting_algebra ) ), A_ );
        
    end );
    
    ##
    AddMorphismToCartesianBidualWithGivenCartesianBidual( heyting_algebra,
      function( A, B )
        
        return UniqueMorphism( A, B );
        
    end );
    
end );
