# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

##
AddDerivationToCAP( IsEqualForObjectsIfIsHomSetInhabited,
        [ [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ] ],
        
  { cat, A, B } -> AreIsomorphicForObjectsIfIsHomSetInhabited( cat, A, B ) :
      Description := "AreIsomorphicForObjectsIfIsHomSetInhabited using AreIsomorphicForObjectsIfIsHomSetInhabited",
      CategoryFilter := IsThinCategory and IsSkeletalCategory );

##
AddDerivationToCAP( IsEqualForObjects,
        [ [ IsHomSetInhabited, 1 ],
          [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ] ],
        
  function( cat, A, B )
    
    return IsHomSetInhabited( cat, A, B ) and
           AreIsomorphicForObjectsIfIsHomSetInhabited( cat, A, B );
    
end : Description := "",
      CategoryFilter := IsThinCategory and IsSkeletalCategory );
