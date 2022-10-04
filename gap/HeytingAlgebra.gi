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
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_HEYTING_ALGEBRAS,
  function( heyting_algebra )
    
    SetIsCartesianClosedCategory( heyting_algebra, true );
    
    ADD_COMMON_METHODS_FOR_LATTICES( heyting_algebra );
    
end );

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
