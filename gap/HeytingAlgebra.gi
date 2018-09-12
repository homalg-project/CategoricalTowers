#
# Locales: Heyting algebras
#
# Implementations
#

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_HEYTING_ALGEBRAS,
  function( heyting_algebra )
    
    SetIsStrictMonoidalCategory( heyting_algebra, true );
    
    SetIsSymmetricClosedMonoidalCategory( heyting_algebra, true );
    
    ADD_COMMON_METHODS_FOR_LATTICES( heyting_algebra );
    
    ## The cartesian monoidal structure
    
    ## Warning:
    ## Do not add it to ADD_COMMON_METHODS_FOR_LATTICES
    ## as it will violate the symmetry between products and coproducts
    
    ##
    AddAssociatorRightToLeftOfDirectProductsWithGivenDirectProducts( heyting_algebra,
      function( s, a, b, c, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
    ##
    AddAssociatorLeftToRightOfDirectProductsWithGivenDirectProducts( heyting_algebra,
      function( s, a, b, c, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
    ##
    AddTensorProductOnObjects( heyting_algebra,
      DirectProduct );
    
    ##
    AddTensorProductOnMorphismsWithGivenTensorProducts( heyting_algebra,
      function( s, alpha, beta, r )
        
        return DirectProductFunctorialWithGivenDirectProducts( s, [ alpha, beta ], r );
        
    end );
    
    ##
    AddAssociatorLeftToRightWithGivenTensorProducts( heyting_algebra,
      AssociatorLeftToRightOfDirectProductsWithGivenDirectProducts );
    
    ##
    AddAssociatorRightToLeftWithGivenTensorProducts( heyting_algebra,
      AssociatorRightToLeftOfDirectProductsWithGivenDirectProducts );
    
    ##
    AddTensorUnit( heyting_algebra,
      TerminalObject );
    
    ## The closedness of the cartesian monoidal structure
    
    ## Note:
    ## The dual of a closed cartesian category is
    ## NOT a closed cocartesian category (such is equivalent to a terminal category)
    ## but a co-closed cocartesian category!
    
    ##
    AddInternalHomOnMorphismsWithGivenInternalHoms( heyting_algebra,
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
    AddTensorProductToInternalHomAdjunctionMap( heyting_algebra,
      function( M, N, f )
        local L;
        
        L := Range( f );
        
        return UniqueMorphism( M, InternalHomOnObjects( N, L ) );
        
    end );
    
    ##
    AddInternalHomToTensorProductAdjunctionMap( heyting_algebra,
      function( N, L, g )
        local M, MN;
        
        M := Source( g );
        
        MN := TensorProduct( M, N );
        
        return UniqueMorphism( MN, L );
        
    end );
    
    ##
    AddMonoidalPreComposeMorphismWithGivenObjects( heyting_algebra,
      function( HM_NxH_N_L, M, N, L, HM_L );
        
        return UniqueMorphism( HM_NxH_N_L, HM_L );
        
    end );
    
    ##
    AddMonoidalPostComposeMorphismWithGivenObjects( heyting_algebra,
      function( HM_NxH_N_L, M, N, L, HM_L );
        
        return UniqueMorphism( HM_NxH_N_L, HM_L );
        
    end );
    
    ##
    AddTensorProductInternalHomCompatibilityMorphismWithGivenObjects( heyting_algebra,
      function( S1, T1, S2, T2, L )
        
        return UniqueMorphism( L[1], L[2] );
        
    end );
    
    ## The duals
    
    ##
    AddDualOnObjects( heyting_algebra,
      function( A )
        
        return InternalHomOnObjects( A, InitialObject( heyting_algebra ) );
        
    end );
    
    ##
    AddDualOnMorphismsWithGivenDuals( heyting_algebra,
      function( B_, u, A_ )
        
        return InternalHomOnMorphismsWithGivenInternalHoms( B_, u, IdentityMorphism( InitialObject( heyting_algebra ) ), A_ );
        
    end );
    
    ##
    AddMorphismToBidualWithGivenBidual( heyting_algebra,
      function( A, B )
        
        return UniqueMorphism( A, B );
        
    end );
    
end );
