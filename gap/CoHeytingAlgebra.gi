#
# Locales: Co-Heyting algebras
#
# Implementations
#

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_COHEYTING_ALGEBRAS,
  function( coheyting_algebra )
    
    SetIsCocartesianCoclosedCategory( coheyting_algebra, true );
    
    SetIsStrictMonoidalCategory( coheyting_algebra, true );
    
    ADD_COMMON_METHODS_FOR_LATTICES( coheyting_algebra );
    
    ## The cocartesian monoidal structure
    
    ## The coclosedness of the cocartesian monoidal structure
    
    ##
    AddCoexponentialOnMorphismsWithGivenCoexponentials( coheyting_algebra,
      function( S, alpha, beta, T )
        
        return UniqueMorphism( S, T );
        
    end );
    
    ## The co-negation
    
    ##
    AddDualOnObjects( coheyting_algebra,
      function( A )
        
        return InternalHomOnObjects( A, TerminalObject( coheyting_algebra ) );
        
    end );
    
    ##
    AddDualOnMorphismsWithGivenDuals( coheyting_algebra,
      function( B_, u, A_ )
        
        return InternalHomOnMorphismsWithGivenInternalHoms( B_, u, IdentityMorphism( TerminalObject( coheyting_algebra ) ), A_ );
        
    end );
    
    ##
    AddMorphismToBidualWithGivenBidual( coheyting_algebra,
      function( A, B )
        
        return UniqueMorphism( A, B );
        
    end );
    
end );
