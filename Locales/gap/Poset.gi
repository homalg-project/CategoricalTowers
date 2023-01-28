# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

InstallTrueMethod( IsPosetCategory, IsThinCategory and IsSkeletalCategory );
InstallTrueMethod( IsThinCategory, IsPosetCategory );
InstallTrueMethod( IsSkeletalCategory, IsPosetCategory );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_POSETS,
  function( poset )
    
    SetIsSkeletalCategory( poset, true );
    
    ADD_COMMON_METHODS_FOR_PREORDERED_SETS( poset );
    
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
