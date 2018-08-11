#
# Locales: Partially ordered sets (posets)
#
# Implementations
#

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_POSETS,
  function( poset )
    
    ADD_COMMON_METHODS_FOR_PREORDERED_SETS( poset );
    
    ##
    AddIsIsomorphism( poset,
      function( u )
        
        return Source( u ) = Range( u );
        
    end );
    
end );
