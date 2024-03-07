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
                    "IsHomSetInhabited using IsTerminal and ExponentialOnObjects",
                    [ [ IsTerminal, 1 ],
                      [ ExponentialOnObjects, 1 ] ],
                    
  function( cat, S, T )
    
    return IsTerminal( cat, ExponentialOnObjects( cat, S, T ) );
    
end : CategoryFilter := IsThinCategory and IsCartesianClosedCategory );

#####################################
# Heyting algebroids
#####################################

##
AddDerivationToCAP( ExponentialOnMorphismsWithGivenExponentials,
                    "ExponentialOnMorphismsWithGivenExponentials as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, S, alpha, beta, R )
        
    return UniqueMorphism( cat, S, R );
    
end : CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( CartesianRightEvaluationMorphismWithGivenSource,
                    "CartesianRightEvaluationMorphismWithGivenSource as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, A, B, AxExp_A_B )
        
    return UniqueMorphism( cat, AxExp_A_B, B );
    
end : CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( CartesianRightCoevaluationMorphismWithGivenRange,
                    "CartesianRightCoevaluationMorphismWithGivenRange as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, A, B, Exp_A_AxB )
        
    return UniqueMorphism( cat, A, Exp_A_AxB );
    
end : CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( DirectProductToExponentialRightAdjunctMorphismWithGivenExponential,
                    "DirectProductToExponentialRightAdjunctMorphismWithGivenExponential using the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, A, B, f, Exp )
    
    return UniqueMorphism( cat, B, Exp );
    
end : CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( ExponentialToDirectProductRightAdjunctMorphismWithGivenDirectProduct,
                    "ExponentialToDirectProductRightAdjunctMorphismWithGivenDirectProduct using the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, B, C, g, DP )
        
        return UniqueMorphism( cat, DP, C );
    
end : CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( CartesianLeftEvaluationMorphismWithGivenSource,
                    "CartesianLeftEvaluationMorphismWithGivenSource as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, A, B, Exp_A_B_xA )
        
    return UniqueMorphism( cat, Exp_A_B_xA, B );
    
end : CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( CartesianLeftCoevaluationMorphismWithGivenRange,
                    "CartesianLeftCoevaluationMorphismWithGivenRange as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, A, B, Exp_A_BxA )
        
    return UniqueMorphism( cat, B, Exp_A_BxA );
    
end : CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( DirectProductToExponentialLeftAdjunctMorphismWithGivenExponential,
                    "DirectProductToExponentialLeftAdjunctMorphismWithGivenExponential using the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, A, B, f, Exp )
    
    return UniqueMorphism( cat, A, Exp );
    
end : CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( ExponentialToDirectProductLeftAdjunctMorphismWithGivenDirectProduct,
                    "ExponentialToDirectProductLeftAdjunctMorphismWithGivenDirectProduct using the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, B, C, g, DP )
        
        return UniqueMorphism( cat, DP, C );
    
end : CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( CartesianPreComposeMorphismWithGivenObjects,
                    "CartesianPreComposeMorphismWithGivenObjects as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, Exp_A_BxExp_B_C, A, B, C, Exp_A_C )
        
    return UniqueMorphism( cat, Exp_A_BxExp_B_C, Exp_A_C );
    
end : CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( CartesianPostComposeMorphismWithGivenObjects,
                    "CartesianPostComposeMorphismWithGivenObjects as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, Exp_B_CxExp_A_B, A, B, C, Exp_A_C )
        
    return UniqueMorphism( cat, Exp_B_CxExp_A_B, Exp_A_C );
    
end : CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( DirectProductExponentialCompatibilityMorphismWithGivenObjects,
                    "DirectProductExponentialCompatibilityMorphismWithGivenObjects as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, source, L, range )
        
    return UniqueMorphism( cat, source, range );
    
end : CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( NegationOnObjects,
                    "NegationOnObjects using ExponentialOnObjects and InitialObject",
                    [ [ ExponentialOnObjects, 1 ],
                      [ InitialObject, 1 ] ],
                    
  function( cat, A )
    
    return ExponentialOnObjects( cat, A, InitialObject( cat ) );
    
end : CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( NegationOnMorphismsWithGivenNegations,
                    "NegationOnMorphismsWithGivenNegations using ExponentialOnMorphismsWithGivenExponentials and IdentityMorphism and InitialObject",
                    [ [ ExponentialOnMorphismsWithGivenExponentials, 1 ],
                      [ IdentityMorphism, 1 ],
                      [ InitialObject, 1 ] ],
                    
  function( cat, B_, u, A_ )
    
    return ExponentialOnMorphismsWithGivenExponentials( cat, B_, u, IdentityMorphism( cat, InitialObject( cat ) ), A_ );
    
end : CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( MorphismToDoubleNegation,
                    "MorphismToDoubleNegation as the unique morphism into the double-negation",
                    [ [ NegationOnObjects, 2 ],
                      [ UniqueMorphism, 1 ] ],
                    
  function( cat, A )
    
    return UniqueMorphism( cat, A, NegationOnObjects( cat, NegationOnObjects( cat, A ) ) );
    
end : CategoryFilter := IsHeytingAlgebroid );

##
AddDerivationToCAP( MorphismToDoubleNegationWithGivenDoubleNegation,
                    "MorphismToDoubleNegationWithGivenDoubleNegation as the unique morphism into the double-negation",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, A, B )
    
    return UniqueMorphism( cat, A, B );
    
end : CategoryFilter := IsHeytingAlgebroid );
