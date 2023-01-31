# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

## thin

InstallTrueMethod( IsCoHeytingAlgebroid, IsBicartesianProset and IsCocartesianCoclosedCategory );
InstallTrueMethod( IsBicartesianProset, IsCoHeytingAlgebroid );
InstallTrueMethod( IsCocartesianCoclosedCategory, IsCoHeytingAlgebroid );

## thin & skeletal

InstallTrueMethod( IsCoHeytingAlgebra, IsCoHeytingAlgebroid and IsSkeletalCategory );
InstallTrueMethod( IsCoHeytingAlgebroid, IsCoHeytingAlgebra );
InstallTrueMethod( IsSkeletalCategory, IsCoHeytingAlgebra );

##
InstallMethod( StableInternalCoHom,
        "for two objects in a thin category",
        [ IsObjectInThinCategory, IsObjectInThinCategory ],

  function( V, W )
    local V_W;
    
    V_W := V;
    
    repeat
        V := V_W;
        V_W := InternalCoHomOnObjects( V_W, W );
    until AreIsomorphicForObjectsIfIsHomSetInhabited( V_W, V );
    
    return V_W;
    
end );
