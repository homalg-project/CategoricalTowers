# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

##
AddDerivationToCAP( AreIsomorphicForObjectsIfIsHomSetInhabited,
        [ [ IsEqualForObjectsIfIsHomSetInhabited, 1 ] ],
        
  function( cat, A, B )
    
    return IsEqualForObjectsIfIsHomSetInhabited( cat, A, B );
    
end : Description := "AreIsomorphicForObjectsIfIsHomSetInhabited using IsEqualForObjectsIfIsHomSetInhabited",
      CategoryFilter := IsPosetCategory );

##
AddDerivationToCAP( IsEqualForObjectsIfIsHomSetInhabited,
        [ [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ] ],
        
  function( cat, A, B )
    
    return AreIsomorphicForObjectsIfIsHomSetInhabited( cat, A, B );
    
end : Description := "IsEqualForObjectsIfIsHomSetInhabited using AreIsomorphicForObjectsIfIsHomSetInhabited",
      CategoryFilter := IsPosetCategory );

##
AddDerivationToCAP( IsEqualForObjects,
        [ [ IsHomSetInhabited, 1 ],
          [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ] ],
        
  function( cat, A, B )
    
    return IsHomSetInhabited( cat, A, B ) and
           AreIsomorphicForObjectsIfIsHomSetInhabited( cat, A, B );
    
end : Description := "",
      CategoryFilter := IsPosetCategory );
