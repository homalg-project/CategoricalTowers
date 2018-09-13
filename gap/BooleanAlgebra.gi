#
# Locales: Boolean algebras
#
# Implementations
#

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_BOOLEAN_ALGEBRAS,
  function( boolean_algebra )
    
    SetIsCartesianClosedCategoryWithIsomorphicBiduals( boolean_algebra, true );
    
    ADD_COMMON_METHODS_FOR_HEYTING_ALGEBRAS( boolean_algebra );
    
    ##
    AddMorphismFromBidualWithGivenBidual( boolean_algebra,
      function( A, B )
        
        return UniqueMorphism( B, A );
        
    end );
    
end );
