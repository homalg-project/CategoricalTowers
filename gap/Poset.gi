#
# Locales: Partially ordered sets (posets)
#
# Implementations
#

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_POSETS,
  function( poset )
    
    SetIsSkeletalCategory( poset, true );
    
    ADD_COMMON_METHODS_FOR_PREORDERED_SETS( poset );
    
    ##
    AddIsEqualForObjects( poset,
      function( A, B )
        
        return IsHomSetInhabited( A, B ) and IsHomSetInhabited( B, A );
        
    end );
    
    ##
    AddIsEqualForObjectsIfIsHomSetInhabited( poset,
      function( A, B )
        
        return IsHomSetInhabited( B, A );
        
    end );
    
end );
