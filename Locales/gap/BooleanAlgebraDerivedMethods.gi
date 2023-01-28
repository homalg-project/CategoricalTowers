# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

#####################################
# Boolean algebroids
#####################################

##
AddDerivationToCAP( MorphismFromDoubleNegation,
        [ [ NegationOnObjects, 2 ],
          [ UniqueMorphism, 1 ] ],
        
  function( cat, A )
        
    return UniqueMorphism( cat, NegationOnObjects( cat, NegationOnObjects( cat, A ) ), A );
    
end : Description := "MorphismFromDoubleNegation as the unique morphism",
      CategoryFilter := IsBooleanAlgebroid );

##
AddDerivationToCAP( MorphismFromDoubleNegationWithGivenDoubleNegation,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, A, B )
        
    return UniqueMorphism( cat, B, A );
    
end : Description := "MorphismFromDoubleNegationWithGivenDoubleNegation as the unique morphism",
      CategoryFilter := IsBooleanAlgebroid );

##
AddDerivationToCAP( MorphismToDoubleConegation,
        [ [ ConegationOnObjects, 2 ],
          [ UniqueMorphism, 1 ] ],
        
  function( cat, A )
        
    return UniqueMorphism( cat, A, ConegationOnObjects( cat, ConegationOnObjects( cat, A ) ) );
    
end : Description := "MorphismToDoubleConegation as the unique morphism",
      CategoryFilter := IsBooleanAlgebroid );
      
##
AddDerivationToCAP( MorphismToDoubleConegationWithGivenDoubleConegation,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, A, B )
        
    return UniqueMorphism( cat, A, B );
    
end : Description := "MorphismToDoubleConegationWithGivenDoubleConegation as the unique morphism",
      CategoryFilter := IsBooleanAlgebroid );

##
AddDerivationToCAP( NegationOnObjects,
        [ [ ConegationOnObjects, 1 ] ],
        
  function( cat, A )
    
    return ConegationOnObjects( cat, A );
    
end : Description := "NegationOnObjects as ConegationOnObjects",
      CategoryFilter := IsBooleanAlgebroid );

##
AddDerivationToCAP( NegationOnMorphisms,
        [ [ ConegationOnMorphisms, 1 ] ],
        
  function( cat, A )
    
    return ConegationOnMorphisms( cat, A );
    
end : Description := "NegationOnMorphisms as ConegationOnMorphisms",
      CategoryFilter := IsBooleanAlgebroid );

##
AddDerivationToCAP( NegationOnMorphismsWithGivenNegations,
        [ [ ConegationOnMorphismsWithGivenConegations, 1 ] ],
        
  function( cat, B_, u, A_ )
    
    return ConegationOnMorphismsWithGivenConegations( cat, B_, u, A_ );
    
end : Description := "NegationOnMorphismsWithGivenNegations as ConegationOnMorphismsWithGivenConegations",
      CategoryFilter := IsBooleanAlgebroid );

##
AddDerivationToCAP( ConegationOnObjects,
        [ [ NegationOnObjects, 1 ] ],
        
  function( cat, A )
    
    return NegationOnObjects( cat, A );
    
end : Description := "ConegationOnObjects as NegationOnObjects",
      CategoryFilter := IsBooleanAlgebroid );

##
AddDerivationToCAP( ConegationOnMorphisms,
        [ [ NegationOnMorphisms, 1 ] ],
        
  function( cat, A )
    
    return NegationOnMorphisms( cat, A );
    
end : Description := "ConegationOnMorphisms as NegationOnMorphisms",
      CategoryFilter := IsBooleanAlgebroid );

##
AddDerivationToCAP( ConegationOnMorphismsWithGivenConegations,
        [ [ NegationOnMorphismsWithGivenNegations, 1 ] ],
        
  function( cat, B_, u, A_ )
    
    return NegationOnMorphismsWithGivenNegations( cat, B_, u, A_ );
    
end : Description := "ConegationOnMorphismsWithGivenConegations as NegationOnMorphismsWithGivenNegations",
      CategoryFilter := IsBooleanAlgebroid );
