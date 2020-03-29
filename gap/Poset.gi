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

##
InstallMethod( \<,
        "for two objects in a thin category",
        [ IsObjectInThinCategory, IsObjectInThinCategory ],
        
  function( A, B )
    local C;
    
    C := CapCategory( A );
    
    if not ( HasIsSkeletalCategory( C ) and IsSkeletalCategory( C ) ) then
        TryNextMethod( );
    elif not IsIdenticalObj( C, CapCategory( B ) ) then
        TryNextMethod( );
    fi;
    
    return IsHomSetInhabited( A, B ) and not IsEqualForObjectsIfIsHomSetInhabited( A, B );
    
end );
