# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

##
AddDerivationToCAP( IsHomSetInhabited,
        [ [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ],
          [ DirectProduct, 1 ] ],
        
  function( cat, S, T )
    
    return AreIsomorphicForObjectsIfIsHomSetInhabited( cat, DirectProduct( cat, S, T ), S );
    
end : Description := "IsHomSetInhabited using AreIsomorphicForObjectsIfIsHomSetInhabited and DirectProduct",
      CategoryFilter := IsThinCategory and IsCartesianCategory );

##
AddDerivationToCAP( IsHomSetInhabited,
        [ [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ],
          [ Coproduct, 1 ], ],
        
  function( cat, S, T )
    
    return AreIsomorphicForObjectsIfIsHomSetInhabited( cat, T, Coproduct( cat, S, T ) );
    
end : Description := "IsHomSetInhabited using AreIsomorphicForObjectsIfIsHomSetInhabited and Coproduct",
      CategoryFilter := IsThinCategory and IsCocartesianCategory );

##
AddDerivationToCAP( LeftCartesianDistributivityExpandingWithGivenObjects,
        [ [ IdentityMorphism, 1 ] ],
        
  function( cat, s, a, L, r )
    
    return IdentityMorphism( cat, s );
    
end : Description := "LeftCartesianDistributivityExpandingWithGivenObjects as the unique morphism",
      CategoryFilter := IsDistributiveLattice );

##
AddDerivationToCAP( RightCartesianDistributivityExpandingWithGivenObjects,
        [ [ IdentityMorphism, 1 ] ],
        
  function( cat, s, L, a, r )
    
    return IdentityMorphism( cat, s );
    
end : Description := "RightCartesianDistributivityExpandingWithGivenObjects as the unique morphism",
      CategoryFilter := IsDistributiveLattice );

##
AddDerivationToCAP( LeftCocartesianCodistributivityFactoringWithGivenObjects,
        [ [ IdentityMorphism, 1 ] ],
        
  function( cat, s, a, L, r )
    
    return IdentityMorphism( cat, s );
    
end : Description := "LeftCocartesianCodistributivityFactoringWithGivenObjects as the unique morphism",
      CategoryFilter := IsDistributiveLattice );

##
AddDerivationToCAP( RightCocartesianCodistributivityFactoringWithGivenObjects,
        [ [ IdentityMorphism, 1 ] ],
        
  function( cat, s, L, a, r )
    
    return IdentityMorphism( cat, s );
    
end : Description := "RightCocartesianCodistributivityFactoringWithGivenObjects as the unique morphism",
      CategoryFilter := IsDistributiveLattice );
