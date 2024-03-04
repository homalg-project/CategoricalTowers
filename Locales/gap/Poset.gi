# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

InstallTrueMethod( IsPosetCategory, IsThinCategory and IsSkeletalCategory );
InstallTrueMethod( IsThinCategory, IsPosetCategory );
InstallTrueMethod( IsSkeletalCategory, IsPosetCategory );

InstallTrueMethod( IsPosetCategory, IsTotalOrderCategory );

InstallTrueMethod( IsMonoidalPoset, IsPosetCategory and IsStrictMonoidalCategory );
InstallTrueMethod( IsPosetCategory, IsMonoidalPoset );
InstallTrueMethod( IsStrictMonoidalCategory, IsMonoidalPoset );

InstallTrueMethod( IsClosedMonoidalPoset, IsMonoidalPoset and IsClosedMonoidalCategory );
InstallTrueMethod( IsMonoidalPoset, IsClosedMonoidalPoset );
InstallTrueMethod( IsClosedMonoidalCategory, IsClosedMonoidalPoset );

InstallTrueMethod( IsCoclosedMonoidalPoset, IsMonoidalPoset and IsCoclosedMonoidalCategory );
InstallTrueMethod( IsMonoidalPoset, IsCoclosedMonoidalPoset );
InstallTrueMethod( IsCoclosedMonoidalCategory, IsCoclosedMonoidalPoset );

InstallTrueMethod( IsSymmetricMonoidalPoset, IsPosetCategory and IsStrictMonoidalCategory and IsSymmetricMonoidalCategory );
InstallTrueMethod( IsPosetCategory, IsSymmetricMonoidalPoset );
InstallTrueMethod( IsStrictMonoidalCategory, IsSymmetricMonoidalPoset );
InstallTrueMethod( IsSymmetricMonoidalCategory, IsSymmetricMonoidalPoset );

InstallTrueMethod( IsSymmetricClosedMonoidalPoset, IsSymmetricMonoidalPoset and IsSymmetricClosedMonoidalCategory );
InstallTrueMethod( IsSymmetricMonoidalPoset, IsSymmetricClosedMonoidalPoset );
InstallTrueMethod( IsSymmetricClosedMonoidalCategory, IsSymmetricClosedMonoidalPoset );

InstallTrueMethod( IsSymmetricCoclosedMonoidalPoset, IsSymmetricMonoidalPoset and IsSymmetricCoclosedMonoidalCategory );
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
