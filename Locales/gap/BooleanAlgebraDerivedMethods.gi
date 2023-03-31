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
                    "MorphismFromDoubleNegation as the unique morphism",
                    [ [ NegationOnObjects, 2 ],
                      [ UniqueMorphism, 1 ] ],
                    
  function( cat, A )
        
    return UniqueMorphism( cat, NegationOnObjects( cat, NegationOnObjects( cat, A ) ), A );
    
end : CategoryFilter := IsBooleanAlgebroid );

##
AddDerivationToCAP( MorphismFromDoubleNegationWithGivenDoubleNegation,
                    "MorphismFromDoubleNegationWithGivenDoubleNegation as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, A, B )
        
    return UniqueMorphism( cat, B, A );
    
end : CategoryFilter := IsBooleanAlgebroid );

##
AddDerivationToCAP( MorphismToDoubleConegation,
                    "MorphismToDoubleConegation as the unique morphism",
                    [ [ ConegationOnObjects, 2 ],
                      [ UniqueMorphism, 1 ] ],
                    
  function( cat, A )
        
    return UniqueMorphism( cat, A, ConegationOnObjects( cat, ConegationOnObjects( cat, A ) ) );
    
end : CategoryFilter := IsBooleanAlgebroid );
      
##
AddDerivationToCAP( MorphismToDoubleConegationWithGivenDoubleConegation,
                    "MorphismToDoubleConegationWithGivenDoubleConegation as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, A, B )
        
    return UniqueMorphism( cat, A, B );
    
end : CategoryFilter := IsBooleanAlgebroid );

##
AddDerivationToCAP( NegationOnObjects,
                    "NegationOnObjects as ConegationOnObjects",
                    [ [ ConegationOnObjects, 1 ] ],
                    
  function( cat, A )
    
    return ConegationOnObjects( cat, A );
    
end : CategoryFilter := IsBooleanAlgebroid );

##
AddDerivationToCAP( NegationOnMorphisms,
                    "NegationOnMorphisms as ConegationOnMorphisms",
                    [ [ ConegationOnMorphisms, 1 ] ],
                    
  function( cat, A )
    
    return ConegationOnMorphisms( cat, A );
    
end : CategoryFilter := IsBooleanAlgebroid );

##
AddDerivationToCAP( NegationOnMorphismsWithGivenNegations,
                    "NegationOnMorphismsWithGivenNegations as ConegationOnMorphismsWithGivenConegations",
                    [ [ ConegationOnMorphismsWithGivenConegations, 1 ] ],
                    
  function( cat, B_, u, A_ )
    
    return ConegationOnMorphismsWithGivenConegations( cat, B_, u, A_ );
    
end : CategoryFilter := IsBooleanAlgebroid );

##
AddDerivationToCAP( ConegationOnObjects,
                    "ConegationOnObjects as NegationOnObjects",
                    [ [ NegationOnObjects, 1 ] ],
                    
  function( cat, A )
    
    return NegationOnObjects( cat, A );
    
end : CategoryFilter := IsBooleanAlgebroid );

##
AddDerivationToCAP( ConegationOnMorphisms,
                    "ConegationOnMorphisms as NegationOnMorphisms",
                    [ [ NegationOnMorphisms, 1 ] ],
                    
  function( cat, A )
    
    return NegationOnMorphisms( cat, A );
    
end : CategoryFilter := IsBooleanAlgebroid );

##
AddDerivationToCAP( ConegationOnMorphismsWithGivenConegations,
                    "ConegationOnMorphismsWithGivenConegations as NegationOnMorphismsWithGivenNegations",
                    [ [ NegationOnMorphismsWithGivenNegations, 1 ] ],
                    
  function( cat, B_, u, A_ )
    
    return NegationOnMorphismsWithGivenNegations( cat, B_, u, A_ );
    
end : CategoryFilter := IsBooleanAlgebroid );
