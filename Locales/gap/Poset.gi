# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

#= comment for Julia
InstallTrueMethod( IsPosetCategory, IsThinCategory and IsSkeletalCategory );
# =#
InstallTrueMethod( IsThinCategory, IsPosetCategory );
InstallTrueMethod( IsSkeletalCategory, IsPosetCategory );

InstallTrueMethod( IsPosetCategory, IsTotalOrderCategory );

#= comment for Julia
InstallTrueMethod( IsMonoidalPoset, IsPosetCategory and IsStrictMonoidalCategory );
# =#
InstallTrueMethod( IsPosetCategory, IsMonoidalPoset );
InstallTrueMethod( IsStrictMonoidalCategory, IsMonoidalPoset );

#= comment for Julia
InstallTrueMethod( IsClosedMonoidalPoset, IsMonoidalPoset and IsClosedMonoidalCategory );
# =#
InstallTrueMethod( IsMonoidalPoset, IsClosedMonoidalPoset );
InstallTrueMethod( IsClosedMonoidalCategory, IsClosedMonoidalPoset );

#= comment for Julia
InstallTrueMethod( IsCoclosedMonoidalPoset, IsMonoidalPoset and IsCoclosedMonoidalCategory );
# =#
InstallTrueMethod( IsMonoidalPoset, IsCoclosedMonoidalPoset );
InstallTrueMethod( IsCoclosedMonoidalCategory, IsCoclosedMonoidalPoset );

#= comment for Julia
InstallTrueMethod( IsSymmetricMonoidalPoset, IsPosetCategory and IsStrictMonoidalCategory and IsSymmetricMonoidalCategory );
# =#
InstallTrueMethod( IsPosetCategory, IsSymmetricMonoidalPoset );
InstallTrueMethod( IsStrictMonoidalCategory, IsSymmetricMonoidalPoset );
InstallTrueMethod( IsSymmetricMonoidalCategory, IsSymmetricMonoidalPoset );

#= comment for Julia
InstallTrueMethod( IsSymmetricClosedMonoidalPoset, IsSymmetricMonoidalPoset and IsSymmetricClosedMonoidalCategory );
# =#
InstallTrueMethod( IsSymmetricMonoidalPoset, IsSymmetricClosedMonoidalPoset );
InstallTrueMethod( IsSymmetricClosedMonoidalCategory, IsSymmetricClosedMonoidalPoset );

#= comment for Julia
InstallTrueMethod( IsSymmetricCoclosedMonoidalPoset, IsSymmetricMonoidalPoset and IsSymmetricCoclosedMonoidalCategory );
# =#
InstallTrueMethod( IsSymmetricMonoidalPoset, IsSymmetricCoclosedMonoidalPoset );
InstallTrueMethod( IsSymmetricCoclosedMonoidalCategory, IsSymmetricCoclosedMonoidalPoset );

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
