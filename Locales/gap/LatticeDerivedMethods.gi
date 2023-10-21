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
                    "IsHomSetInhabited using AreIsomorphicForObjectsIfIsHomSetInhabited and DirectProduct",
                    [ [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ],
                      [ DirectProduct, 1 ] ],
                    
  function( cat, S, T )
    
    return AreIsomorphicForObjectsIfIsHomSetInhabited( cat, DirectProduct( cat, [ S, T ] ), S );
    
end : CategoryFilter := IsCartesianProset );

##
AddDerivationToCAP( ProjectionInFactorOfDirectProductWithGivenDirectProduct,
                    "ProjectionInFactorOfDirectProductWithGivenDirectProduct as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, D, k, P )
    
    return UniqueMorphism( cat, P, D[k] );

end : CategoryFilter := IsCartesianProset );

##
AddDerivationToCAP( UniversalMorphismIntoDirectProductWithGivenDirectProduct,
                    "UniversalMorphismIntoDirectProductWithGivenDirectProduct as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, D, test_object, tau, P )
        
    return UniqueMorphism( cat, test_object, P );
        
end : CategoryFilter := IsCartesianProset );

##
AddDerivationToCAP( DirectProductFunctorialWithGivenDirectProducts,
                    "DirectProductFunctorialWithGivenDirectProducts as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, s, source_diagram, L, range_diagram, r )
        
    return UniqueMorphism( cat, s, r );
        
end : CategoryFilter := IsCartesianProset );

##
AddDerivationToCAP( CartesianAssociatorRightToLeftWithGivenDirectProducts,
                    "CartesianAssociatorRightToLeftWithGivenDirectProducts as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, s, a, b, c, r )
        
    return UniqueMorphism( cat, s, r );
        
end : CategoryFilter := IsCartesianProset );

##
AddDerivationToCAP( CartesianAssociatorLeftToRightWithGivenDirectProducts,
                    "CartesianAssociatorLeftToRightWithGivenDirectProducts as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, s, a, b, c, r )
        
    return UniqueMorphism( cat, s, r );
        
end : CategoryFilter := IsCartesianProset );

##
AddDerivationToCAP( CartesianLeftUnitorWithGivenDirectProduct,
                    "CartesianLeftUnitorWithGivenDirectProduct as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, M, TM )
        
    return UniqueMorphism( cat, TM, M );

end : CategoryFilter := IsCartesianProset );

##
AddDerivationToCAP( CartesianLeftUnitorInverseWithGivenDirectProduct,
                    "CartesianLeftUnitorInverseWithGivenDirectProduct as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, M, TM )
        
    return UniqueMorphism( cat, M, TM );

end : CategoryFilter := IsCartesianProset );

##
AddDerivationToCAP( CartesianRightUnitorWithGivenDirectProduct,
                    "CartesianRightUnitorWithGivenDirectProduct as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, M, MT )
        
    return UniqueMorphism( cat, MT, M );

end : CategoryFilter := IsCartesianProset );

##
AddDerivationToCAP( CartesianRightUnitorInverseWithGivenDirectProduct,
                    "CartesianRightUnitorInverseWithGivenDirectProduct as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, M, MT )
        
    return UniqueMorphism( cat, M, MT );

end : CategoryFilter := IsCartesianProset );

##
AddDerivationToCAP( CartesianBraidingWithGivenDirectProducts,
                    "CartesianBraidingWithGivenDirectProducts as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, MN, M, N, NM )
        
    return UniqueMorphism( cat, MN, NM );

end : CategoryFilter := IsCartesianProset );

##
AddDerivationToCAP( CartesianBraidingInverseWithGivenDirectProducts,
                    "CartesianBraidingInverseWithGivenDirectProducts as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, NM, M, N, MN )
        
    return UniqueMorphism( cat, NM, MN );

end : CategoryFilter := IsCartesianProset );

#####################################
# Cocartesian prosets
#####################################

##
AddDerivationToCAP( IsHomSetInhabited,
                    "IsHomSetInhabited using AreIsomorphicForObjectsIfIsHomSetInhabited and Coproduct",
                    [ [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ],
                      [ Coproduct, 1 ] ],
                    
  function( cat, S, T )
    
    return AreIsomorphicForObjectsIfIsHomSetInhabited( cat, T, Coproduct( cat, S, T ) );
    
end : CategoryFilter := IsCocartesianProset );

##
AddDerivationToCAP( InjectionOfCofactorOfCoproductWithGivenCoproduct,
                    "InjectionOfCofactorOfCoproductWithGivenCoproduct as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, D, k, I )
    
    return UniqueMorphism( cat, D[k], I );

end : CategoryFilter := IsCocartesianProset );

##
AddDerivationToCAP( UniversalMorphismFromCoproductWithGivenCoproduct,
                    "UniversalMorphismFromCoproductWithGivenCoproduct as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, D, test_object, tau, I )
        
    return UniqueMorphism( cat, I, test_object);
        
end : CategoryFilter := IsCocartesianProset );

##
AddDerivationToCAP( CoproductFunctorialWithGivenCoproducts,
                    "CoproductFunctorialWithGivenCoproducts as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, s, source_diagram, L, range_diagram, r )
        
    return UniqueMorphism( cat, s, r );
        
end : CategoryFilter := IsCocartesianProset );

##
AddDerivationToCAP( CocartesianAssociatorRightToLeftWithGivenCoproducts,
                    "CocartesianAssociatorRightToLeftWithGivenCoproducts as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, s, a, b, c, r )
        
    return UniqueMorphism( cat, s, r );
        
end : CategoryFilter := IsCocartesianProset );

##
AddDerivationToCAP( CocartesianAssociatorLeftToRightWithGivenCoproducts,
                    "CocartesianAssociatorLeftToRightWithGivenCoproducts as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, s, a, b, c, r )
        
    return UniqueMorphism( cat, s, r );
        
end : CategoryFilter := IsCocartesianProset );

##
AddDerivationToCAP( CocartesianLeftUnitorWithGivenCoproduct,
                    "CocartesianLeftUnitorWithGivenCoproduct as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, M, TM )
        
    return UniqueMorphism( cat, TM, M );

end : CategoryFilter := IsCocartesianProset );

##
AddDerivationToCAP( CocartesianLeftUnitorInverseWithGivenCoproduct,
                    "CocartesianLeftUnitorInverseWithGivenCoproduct as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, M, TM )
        
    return UniqueMorphism( cat, M, TM );

end : CategoryFilter := IsCocartesianProset );

##
AddDerivationToCAP( CocartesianRightUnitorWithGivenCoproduct,
                    "CocartesianRightUnitorWithGivenCoproduct as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, M, MT )
        
    return UniqueMorphism( cat, MT, M );

end : CategoryFilter := IsCocartesianProset );

##
AddDerivationToCAP( CocartesianRightUnitorInverseWithGivenCoproduct,
                    "CocartesianRightUnitorInverseWithGivenCoproduct as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, M, MT )
        
    return UniqueMorphism( cat, M, MT );

end : CategoryFilter := IsCocartesianProset );

##
AddDerivationToCAP( CocartesianBraidingWithGivenCoproducts,
                    "CocartesianBraidingWithGivenCoproducts as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, MN, M, N, NM )
        
    return UniqueMorphism( cat, MN, NM );

end : CategoryFilter := IsCocartesianProset );

##
AddDerivationToCAP( CocartesianBraidingInverseWithGivenCoproducts,
                    "CocartesianBraidingInverseWithGivenCoproducts as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, NM, M, N, MN )
        
    return UniqueMorphism( cat, NM, MN );

end : CategoryFilter := IsCocartesianProset );

#####################################
# Bicartesian distributive prosets
#####################################

##
AddDerivationToCAP( LeftCartesianDistributivityExpandingWithGivenObjects,
                    "LeftCartesianDistributivityExpandingWithGivenObjects as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, s, a, L, r )
    
    return UniqueMorphism( cat, s, r );
    
end : CategoryFilter := IsDistributiveBicartesianProset );

##
AddDerivationToCAP( RightCartesianDistributivityExpandingWithGivenObjects,
                    "RightCartesianDistributivityExpandingWithGivenObjects as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, s, L, a, r )
    
    return UniqueMorphism( cat, s, r );
    
end : CategoryFilter := IsDistributiveBicartesianProset );

##
AddDerivationToCAP( LeftCocartesianCodistributivityFactoringWithGivenObjects,
                    "LeftCocartesianCodistributivityFactoringWithGivenObjects as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, s, a, L, r )
    
    return UniqueMorphism( cat, s, r );
    
end : CategoryFilter := IsDistributiveBicartesianProset );

##
AddDerivationToCAP( RightCocartesianCodistributivityFactoringWithGivenObjects,
                    "RightCocartesianCodistributivityFactoringWithGivenObjects as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, s, L, a, r )
    
    return UniqueMorphism( cat, s, r );
    
end : CategoryFilter := IsDistributiveBicartesianProset );
