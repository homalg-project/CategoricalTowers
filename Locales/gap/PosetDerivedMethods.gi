# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

##
AddDerivationToCAP( AreIsomorphicForObjectsIfIsHomSetInhabited,
        "AreIsomorphicForObjectsIfIsHomSetInhabited using IsEqualForObjectsIfIsHomSetInhabited",
        [ [ IsEqualForObjectsIfIsHomSetInhabited, 1 ] ],
        
  function( cat, A, B )
    
    return IsEqualForObjectsIfIsHomSetInhabited( cat, A, B );
    
end : CategoryFilter := IsPosetCategory );

##
AddDerivationToCAP( IsEqualForObjectsIfIsHomSetInhabited,
        "IsEqualForObjectsIfIsHomSetInhabited using AreIsomorphicForObjectsIfIsHomSetInhabited",
        [ [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ] ],
        
  function( cat, A, B )
    
    return AreIsomorphicForObjectsIfIsHomSetInhabited( cat, A, B );
    
end : CategoryFilter := IsPosetCategory );

##
AddDerivationToCAP( IsEqualForObjects,
        "",
        [ [ IsHomSetInhabited, 1 ],
          [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ] ],
        
  function( cat, A, B )
    
    return IsHomSetInhabited( cat, A, B ) and
           AreIsomorphicForObjectsIfIsHomSetInhabited( cat, A, B );
    
end : CategoryFilter := IsPosetCategory );

##
AddDerivationToCAP( DirectProduct,
        "",
        [ [ IsHomSetInhabited, 2 ] ],
        
  function( cat, L )
    
    return First( SortedList( L, { A, B } -> IsHomSetInhabited( cat, A, B ) ) );
    
end : CategoryFilter := cat -> HasIsTotalOrderCategory( cat ) and IsTotalOrderCategory( cat ) and not ( IsBound( cat!.supports_empty_limits ) and cat!.supports_empty_limits = true ) );

##
AddDerivationToCAP( Coproduct,
        "",
        [ [ IsHomSetInhabited, 2 ] ],
        
  function( cat, L )
    
    return Last( SortedList( L, { A, B } -> IsHomSetInhabited( cat, A, B ) ) );
    
end : CategoryFilter := cat -> HasIsTotalOrderCategory( cat ) and IsTotalOrderCategory( cat ) and not ( IsBound( cat!.supports_empty_limits ) and cat!.supports_empty_limits = true ) );
