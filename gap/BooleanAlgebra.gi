#
# Locales: Boolean algebras
#
# Implementations
#

InstallValue( BOOLEAN_ALGEBRA_METHOD_NAME_RECORD,
        rec(
MorphismFromDoubleNegationWithGivenDoubleNegation := rec(
  installation_name := "MorphismFromDoubleNegationWithGivenDoubleNegation",
  filter_list := [ "object", "object" ],
  io_type := [ [ "a", "s" ], [ "s", "a" ] ],
  cache_name := "MorphismFromDoubleNegationWithGivenDoubleNegation",
  return_type := "morphism" )
            
            ) );

CAP_INTERNAL_ENHANCE_NAME_RECORD( BOOLEAN_ALGEBRA_METHOD_NAME_RECORD );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( BOOLEAN_ALGEBRA_METHOD_NAME_RECORD );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_BOOLEAN_ALGEBRAS,
  function( boolean_algebra )
    
    SetIsCartesianClosedCategoryWithIsomorphicDoubleNegations( boolean_algebra, true );
    
    ADD_COMMON_METHODS_FOR_HEYTING_ALGEBRAS( boolean_algebra );
    
    ##
    AddMorphismFromDoubleNegationWithGivenDoubleNegation( boolean_algebra,
      function( A, B )
        
        return UniqueMorphism( B, A );
        
    end );
    
end );
