# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

## thin

InstallTrueMethod( IsHeytingAlgebroid, IsBicartesianProset and IsCartesianClosedCategory );
InstallTrueMethod( IsBicartesianProset, IsHeytingAlgebroid );
InstallTrueMethod( IsCartesianClosedCategory, IsHeytingAlgebroid );

## thin & skeletal

InstallTrueMethod( IsHeytingAlgebra, IsHeytingAlgebroid and IsSkeletalCategory );
InstallTrueMethod( IsHeytingAlgebroid, IsHeytingAlgebra );
InstallTrueMethod( IsSkeletalCategory, IsHeytingAlgebra );

##
InstallMethod( StableInternalHom,
        "for two objects in a thin category",
        [ IsObjectInThinCategory, IsObjectInThinCategory ],
    { J, I } -> StableInternalHom( CapCategory( J ), J, I )
   );

##
InstallOtherMethodForCompilerForCAP( StableInternalHom,
        [ IsCapCategory, IsObjectInThinCategory, IsObjectInThinCategory ],
  function( cat, J, I )
    
    return CapFixpoint(
        { x, y } -> AreIsomorphicForObjectsIfIsHomSetInhabited( cat, x, y ),
        x -> InternalHomOnObjects( cat, J, x ),
        I
    );
    
end );
