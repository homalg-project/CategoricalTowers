# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

## IsTerminal( Exp( S, T ) )
## <=(thin)=>
## TerminalObject ≤ Exp( S, T )
## <=(cart. closed)=>
## ( TerminalObject ∧ S ) ≤ T
## <==>
## S ≤ T
##
AddDerivationToCAP( IsHomSetInhabited,
        [ [ IsTerminal, 1 ],
          [ ExponentialOnObjects, 1 ] ],
        
  function( cat, S, T )
    
    return IsTerminal( cat, ExponentialOnObjects( cat, S, T ) );
    
end : Description := "IsHomSetInhabited using IsTerminal and ExponentialOnObjects",
      CategoryFilter := IsThinCategory and IsCartesianClosedCategory );

#####################################
# Heyting algebroids
#####################################

##
AddDerivationToCAP( ExponentialOnMorphismsWithGivenExponentials,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, S, alpha, beta, R )
        
    return UniqueMorphism( cat, S, R );
    
end : Description := "ExponentialOnMorphismsWithGivenExponentials as the unique morphism",
      CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( CartesianEvaluationMorphismWithGivenSource,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, A, B, Exp_A_BxA )
        
    return UniqueMorphism( cat, Exp_A_BxA, B);
    
end : Description := "CartesianEvaluationMorphismWithGivenSource as the unique morphism",
      CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( CartesianCoevaluationMorphismWithGivenRange,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, A, B, Exp_B_AxB )
        
    return UniqueMorphism( cat, A, Exp_B_AxB );
    
end : Description := "CartesianCoevaluationMorphismWithGivenRange as the unique morphism",
      CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( DirectProductToExponentialAdjunctionMapWithGivenExponential,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, A, B, f, Exp )
    
    return UniqueMorphism( cat, A, Exp );
    
end : Description := "DirectProductToExponentialAdjunctionMapWithGivenExponential using the unique morphism",
      CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( ExponentialToDirectProductAdjunctionMapWithGivenDirectProduct,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, B, C, g, DP )
        
        return UniqueMorphism( cat, DP, C );
    
end : Description := "ExponentialToDirectProductAdjunctionMapWithGivenDirectProduct using the unique morphism",
      CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( CartesianPreComposeMorphismWithGivenObjects,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, Exp_A_BxExp_B_C, A, B, C, Exp_A_C )
        
    return UniqueMorphism( cat, Exp_A_BxExp_B_C, Exp_A_C );
    
end : Description := "CartesianPreComposeMorphismWithGivenObjects as the unique morphism",
      CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( CartesianPostComposeMorphismWithGivenObjects,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, Exp_B_CxExp_A_B, A, B, C, Exp_A_C )
        
    return UniqueMorphism( cat, Exp_B_CxExp_A_B, Exp_A_C );
    
end : Description := "CartesianPostComposeMorphismWithGivenObjects as the unique morphism",
      CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( DirectProductExponentialCompatibilityMorphismWithGivenObjects,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, source, L, range )
        
    return UniqueMorphism( cat, source, range );
    
end : Description := "DirectProductExponentialCompatibilityMorphismWithGivenObjects as the unique morphism",
      CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( NegationOnObjects,
        [ [ ExponentialOnObjects, 1 ],
          [ InitialObject, 1 ] ],
        
  function( cat, A )
    
    return ExponentialOnObjects( cat, A, InitialObject( cat ) );
    
end : Description := "NegationOnObjects using ExponentialOnObjects and InitialObject",
      CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( NegationOnMorphismsWithGivenNegations,
        [ [ ExponentialOnMorphismsWithGivenExponentials, 1 ],
          [ IdentityMorphism, 1 ],
          [ InitialObject, 1 ] ],
        
  function( cat, B_, u, A_ )
    
    return ExponentialOnMorphismsWithGivenExponentials( cat, B_, u, IdentityMorphism( cat, InitialObject( cat ) ), A_ );
    
end : Description := "NegationOnMorphismsWithGivenNegations using ExponentialOnMorphismsWithGivenExponentials and IdentityMorphism and InitialObject",
      CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( MorphismToDoubleNegation,
        [ [ NegationOnObjects, 2 ],
          [ UniqueMorphism, 1 ] ],
        
  function( cat, A )
    
    return UniqueMorphism( cat, A, NegationOnObjects( cat, NegationOnObjects( cat, A ) ) );
    
end : Description := "MorphismToDoubleNegation as the unique morphism into the double-negation",
      CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( MorphismToDoubleNegationWithGivenDoubleNegation,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, A, B )
    
    return UniqueMorphism( cat, A, B );
    
end : Description := "MorphismToDoubleNegationWithGivenDoubleNegation as the unique morphism into the double-negation",
      CategoryFilter := IsHeytingAlgebroid );
