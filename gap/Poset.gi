#
# Locales: Partially ordered sets (posets)
#
# Implementations
#

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_POSETS,
  function( poset )
    
    ADD_COMMON_METHODS_FOR_PREORDERED_SETS( poset );
    
    ## use the one for prosets
    #AddIsIsomorphism( poset,
    #  function( u )
    #    
    #    return Source( u ) = Range( u );
    #    
    #end );
    
    ##
    AddIsEqualForObjects( poset,
      function( A, B )
        
        return IsHomSetInhabited( A, B ) and IsHomSetInhabited( B, A );
        
    end );
    
    SetIsSkeletalCategory( poset, true );
    
end );
