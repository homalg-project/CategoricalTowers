#
# Locales: Heyting algebras
#
# Implementations
#

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_HEYTING_ALGEBRAS,
  function( heyting )
    
    ADD_COMMON_METHODS_FOR_LATTICES( heyting );
    
    ## The cartesian monoidal structure
    
    ## Warning:
    ## Do not add it to ADD_COMMON_METHODS_FOR_LATTICES
    ## as it will violate the symmetry between products and coproducts
    
    ##
    AddAssociatorRightToLeftOfDirectProductsWithGivenDirectProducts( heyting,
      function( s, a, b, c, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
    ##
    AddAssociatorLeftToRightOfDirectProductsWithGivenDirectProducts( heyting,
      function( s, a, b, c, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
    ##
    AddTensorProductOnObjects( heyting,
      DirectProduct );

    ##
    AddTensorProductOnMorphismsWithGivenTensorProducts( heyting,
      function( s, alpha, beta, r )
        
        return DirectProductFunctorialWithGivenDirectProducts( s, [ alpha, beta ], r );
        
    end );
    
    ##
    AddAssociatorLeftToRightWithGivenTensorProducts( heyting,
      AssociatorLeftToRightOfDirectProductsWithGivenDirectProducts );
    
    ##
    AddAssociatorRightToLeftWithGivenTensorProducts( heyting,
      AssociatorRightToLeftOfDirectProductsWithGivenDirectProducts );
    
    ##
    AddTensorUnit( heyting,
      TerminalObject );
    
    ## The closedness of the cartesian monoidal structure
    
    ## Note:
    ## The dual of a closed cartesian category is
    ## NOT a closed cocartesian category (such is equivalent to a terminal category)
    ## but a co-closed cocartesian category!
    
    ##
    AddInternalHomOnMorphismsWithGivenInternalHoms( heyting,
      function( S, alpha, beta, T )
        
        return UniqueMorphism( S, T );
        
    end );
    
    ##
    AddEvaluationMorphismWithGivenSource( heyting,
      function( M, N, HM_NxM )
        
        return UniqueMorphism( HM_NxM, N );
        
    end );
    
    ##
    AddCoevaluationMorphismWithGivenRange( heyting,
      function( M, N, HN_MxN )
        
        return UniqueMorphism( M, HN_MxN );
        
    end );
    
    ##
    AddTensorProductToInternalHomAdjunctionMap( heyting,
      function( M, N, f )
        local L;
        
        L := Range( f );
        
        return UniqueMorphism( M, InternalHomOnObjects( N, L ) );
        
    end );
    
    ##
    AddInternalHomToTensorProductAdjunctionMap( heyting,
      function( N, L, g )
        local M, MN;
        
        M := Source( g );
        
        MN := TensorProduct( M, N );
        
        return UniqueMorphism( MN, L );
        
    end );
    
    ##
    AddMonoidalPreComposeMorphismWithGivenObjects( heyting,
      function( HM_NxH_N_L, M, N, L, HM_L );
        
        return UniqueMorphism( HM_NxH_N_L, HM_L );
        
    end );
    
    ##
    AddMonoidalPostComposeMorphismWithGivenObjects( heyting,
      function( HM_NxH_N_L, M, N, L, HM_L );
        
        return UniqueMorphism( HM_NxH_N_L, HM_L );
        
    end );
    
    ##
    AddTensorProductInternalHomCompatibilityMorphismWithGivenObjects( heyting,
      function( S1, T1, S2, T2, L )
        
        return UniqueMorphism( L[1], L[2] );
        
    end );
    
end );
