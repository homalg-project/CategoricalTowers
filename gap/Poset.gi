#
# Locales: Partially ordered sets (posets)
#
# Implementations
#

InstallValue( POSET_METHOD_NAME_RECORD,
        rec(
            IsEqualForObjectsIfIsHomSetInhabited := rec(
                                     installation_name := "IsEqualForObjectsIfIsHomSetInhabited",
                                     filter_list := [ "object", "object" ],
                                     return_type := "bool",
                                     is_merely_set_theoretic := true
                                    ),
            )
        );

CAP_INTERNAL_ENHANCE_NAME_RECORD( POSET_METHOD_NAME_RECORD );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( POSET_METHOD_NAME_RECORD );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_POSETS,
  function( poset )
    
    SetIsSkeletalCategory( poset, true );
    
    ADD_COMMON_METHODS_FOR_PREORDERED_SETS( poset );
    
    ##
    AddIsEqualForObjectsIfIsHomSetInhabited( poset,
      AreIsomorphicForObjectsIfIsHomSetInhabited );
    
    ##
    AddIsEqualForObjects( poset,
      function( A, B )
        
        return IsHomSetInhabited( A, B ) and
               AreIsomorphicForObjectsIfIsHomSetInhabited( A, B );
        
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
    
    return IsHomSetInhabited( A, B ) and not AreIsomorphicForObjectsIfIsHomSetInhabited( A, B );
    
end );
