# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

#####################################
# Cartesian prosets
#####################################

##
AddDerivationToCAP( IsHomSetInhabited,
        [ [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ],
          [ DirectProduct, 1 ] ],
        
  function( cat, S, T )
    
    return AreIsomorphicForObjectsIfIsHomSetInhabited( cat, DirectProduct( cat, S, T ), S );
    
end : Description := "IsHomSetInhabited using AreIsomorphicForObjectsIfIsHomSetInhabited and DirectProduct",
      CategoryFilter := IsCartesianProset );

##
AddDerivationToCAP( ProjectionInFactorOfDirectProductWithGivenDirectProduct,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, D, k, P )
    
    return UniqueMorphism( cat, P, D[k] );

end : Description := "ProjectionInFactorOfDirectProductWithGivenDirectProduct as the unique morphism",
      CategoryFilter := IsCartesianProset );

##
AddDerivationToCAP( UniversalMorphismIntoDirectProductWithGivenDirectProduct,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, D, test_object, tau, P )
        
    return UniqueMorphism( cat, test_object, P );
        
end : Description := "UniversalMorphismIntoDirectProductWithGivenDirectProduct as the unique morphism",
      CategoryFilter := IsCartesianProset );

##
AddDerivationToCAP( DirectProductFunctorialWithGivenDirectProducts,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, s, source_diagram, L, range_diagram, r )
        
    return UniqueMorphism( cat, s, r );
        
end : Description := "DirectProductFunctorialWithGivenDirectProducts as the unique morphism",
      CategoryFilter := IsCartesianProset );

##
AddDerivationToCAP( CartesianAssociatorRightToLeftWithGivenDirectProducts,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, s, a, b, c, r )
        
    return UniqueMorphism( cat, s, r );
        
end : Description := "CartesianAssociatorRightToLeftWithGivenDirectProducts as the unique morphism",
      CategoryFilter := IsCartesianProset );

##
AddDerivationToCAP( CartesianAssociatorLeftToRightWithGivenDirectProducts,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, s, a, b, c, r )
        
    return UniqueMorphism( cat, s, r );
        
end : Description := "CartesianAssociatorLeftToRightWithGivenDirectProducts as the unique morphism",
      CategoryFilter := IsCartesianProset );

##
AddDerivationToCAP( CartesianLeftUnitorWithGivenDirectProduct,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, M, TM )
        
    return UniqueMorphism( cat, TM, M );

end : Description := "CartesianLeftUnitorWithGivenDirectProduct as the unique morphism",
      CategoryFilter := IsCartesianProset );

##
AddDerivationToCAP( CartesianLeftUnitorInverseWithGivenDirectProduct,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, M, TM )
        
    return UniqueMorphism( cat, M, TM );

end : Description := "CartesianLeftUnitorInverseWithGivenDirectProduct as the unique morphism",
      CategoryFilter := IsCartesianProset );

##
AddDerivationToCAP( CartesianRightUnitorWithGivenDirectProduct,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, M, MT )
        
    return UniqueMorphism( cat, MT, M );

end : Description := "CartesianRightUnitorWithGivenDirectProduct as the unique morphism",
      CategoryFilter := IsCartesianProset );

##
AddDerivationToCAP( CartesianRightUnitorInverseWithGivenDirectProduct,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, M, MT )
        
    return UniqueMorphism( cat, M, MT );

end : Description := "CartesianRightUnitorInverseWithGivenDirectProduct as the unique morphism",
      CategoryFilter := IsCartesianProset );

##
AddDerivationToCAP( CartesianBraidingWithGivenDirectProducts,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, MN, M, N, NM )
        
    return UniqueMorphism( cat, MN, NM );

end : Description := "CartesianBraidingWithGivenDirectProducts as the unique morphism",
      CategoryFilter := IsCartesianProset );

##
AddDerivationToCAP( CartesianBraidingInverseWithGivenDirectProducts,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, NM, M, N, MN )
        
    return UniqueMorphism( cat, NM, MN );

end : Description := "CartesianBraidingInverseWithGivenDirectProducts as the unique morphism",
      CategoryFilter := IsCartesianProset );

#####################################
# Cocartesian prosets
#####################################

##
AddDerivationToCAP( IsHomSetInhabited,
        [ [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ],
          [ Coproduct, 1 ], ],
        
  function( cat, S, T )
    
    return AreIsomorphicForObjectsIfIsHomSetInhabited( cat, T, Coproduct( cat, S, T ) );
    
end : Description := "IsHomSetInhabited using AreIsomorphicForObjectsIfIsHomSetInhabited and Coproduct",
      CategoryFilter := IsCocartesianProset );

##
AddDerivationToCAP( InjectionOfCofactorOfCoproductWithGivenCoproduct,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, D, k, I )
    
    return UniqueMorphism( cat, D[k], I );

end : Description := "InjectionOfCofactorOfCoproductWithGivenCoproduct as the unique morphism",
      CategoryFilter := IsCocartesianProset );

##
AddDerivationToCAP( UniversalMorphismFromCoproductWithGivenCoproduct,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, D, test_object, tau, I )
        
    return UniqueMorphism( cat, I, test_object);
        
end : Description := "UniversalMorphismFromCoproductWithGivenCoproduct as the unique morphism",
      CategoryFilter := IsCocartesianProset );

##
AddDerivationToCAP( CoproductFunctorialWithGivenCoproducts,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, s, source_diagram, L, range_diagram, r )
        
    return UniqueMorphism( cat, s, r );
        
end : Description := "CoproductFunctorialWithGivenCoproducts as the unique morphism",
      CategoryFilter := IsCocartesianProset );

##
AddDerivationToCAP( CocartesianAssociatorRightToLeftWithGivenCoproducts,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, s, a, b, c, r )
        
    return UniqueMorphism( cat, s, r );
        
end : Description := "CocartesianAssociatorRightToLeftWithGivenCoproducts as the unique morphism",
      CategoryFilter := IsCocartesianProset );

##
AddDerivationToCAP( CocartesianAssociatorLeftToRightWithGivenCoproducts,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, s, a, b, c, r )
        
    return UniqueMorphism( cat, s, r );
        
end : Description := "CocartesianAssociatorLeftToRightWithGivenCoproducts as the unique morphism",
      CategoryFilter := IsCocartesianProset );

##
AddDerivationToCAP( CocartesianLeftUnitorWithGivenCoproduct,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, M, TM )
        
    return UniqueMorphism( cat, TM, M );

end : Description := "CocartesianLeftUnitorWithGivenCoproduct as the unique morphism",
      CategoryFilter := IsCocartesianProset );

##
AddDerivationToCAP( CocartesianLeftUnitorInverseWithGivenCoproduct,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, M, TM )
        
    return UniqueMorphism( cat, M, TM );

end : Description := "CocartesianLeftUnitorInverseWithGivenCoproduct as the unique morphism",
      CategoryFilter := IsCocartesianProset );

##
AddDerivationToCAP( CocartesianRightUnitorWithGivenCoproduct,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, M, MT )
        
    return UniqueMorphism( cat, MT, M );

end : Description := "CocartesianRightUnitorWithGivenCoproduct as the unique morphism",
      CategoryFilter := IsCocartesianProset );

##
AddDerivationToCAP( CocartesianRightUnitorInverseWithGivenCoproduct,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, M, MT )
        
    return UniqueMorphism( cat, M, MT );

end : Description := "CocartesianRightUnitorInverseWithGivenCoproduct as the unique morphism",
      CategoryFilter := IsCocartesianProset );

##
AddDerivationToCAP( CocartesianBraidingWithGivenCoproducts,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, MN, M, N, NM )
        
    return UniqueMorphism( cat, MN, NM );

end : Description := "CocartesianBraidingWithGivenCoproducts as the unique morphism",
      CategoryFilter := IsCocartesianProset );

##
AddDerivationToCAP( CocartesianBraidingInverseWithGivenCoproducts,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, NM, M, N, MN )
        
    return UniqueMorphism( cat, NM, MN );

end : Description := "CocartesianBraidingInverseWithGivenCoproducts as the unique morphism",
      CategoryFilter := IsCocartesianProset );

#####################################
# Bicartesian distributive prosets
#####################################

##
AddDerivationToCAP( LeftCartesianDistributivityExpandingWithGivenObjects,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, s, a, L, r )
    
    return UniqueMorphism( cat, s, r );
    
end : Description := "LeftCartesianDistributivityExpandingWithGivenObjects as the unique morphism",
      CategoryFilter := IsDistributiveBicartesianProset );

##
AddDerivationToCAP( RightCartesianDistributivityExpandingWithGivenObjects,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, s, L, a, r )
    
    return UniqueMorphism( cat, s, r );
    
end : Description := "RightCartesianDistributivityExpandingWithGivenObjects as the unique morphism",
      CategoryFilter := IsDistributiveBicartesianProset );

##
AddDerivationToCAP( LeftCocartesianCodistributivityFactoringWithGivenObjects,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, s, a, L, r )
    
    return UniqueMorphism( cat, s, r );
    
end : Description := "LeftCocartesianCodistributivityFactoringWithGivenObjects as the unique morphism",
      CategoryFilter := IsDistributiveBicartesianProset );

##
AddDerivationToCAP( RightCocartesianCodistributivityFactoringWithGivenObjects,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, s, L, a, r )
    
    return UniqueMorphism( cat, s, r );
    
end : Description := "RightCocartesianCodistributivityFactoringWithGivenObjects as the unique morphism",
      CategoryFilter := IsDistributiveBicartesianProset );
