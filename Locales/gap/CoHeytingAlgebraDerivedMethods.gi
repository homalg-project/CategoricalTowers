# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

## See: https://ncatlab.org/nlab/show/co-Heyting+algebra#properties:
## IsInitial( S \ T ) = IsInitial( coExp( S, T ) )
## <=(thin)=>
## coExp( S, T ) ≤ InitialObject
## <=(cocart. coclosed)=>
## S ≤ ( InitialObject ∨ T )
## <==>
## S ≤ T
##
AddDerivationToCAP( IsHomSetInhabited,
                    "IsHomSetInhabited using IsInitial and CoexponentialOnObjects",
                    [ [ IsInitial, 1 ],
                      [ CoexponentialOnObjects, 1 ] ],
                    
  function( cat, S, T )
    
    return IsInitial( cat, CoexponentialOnObjects( cat, S, T ) );
    
end : CategoryFilter := IsThinCategory and IsCocartesianCoclosedCategory );

#####################################
# Coheyting algebroids
#####################################

##
AddDerivationToCAP( CoexponentialOnMorphismsWithGivenCoexponentials,
                    "CoexponentialOnMorphismsWithGivenCoexponentials as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, S, alpha, beta, R )
        
    return UniqueMorphism( cat, S, R );
    
end : CategoryFilter := IsCoHeytingAlgebroid );

##
AddDerivationToCAP( CocartesianLeftEvaluationMorphismWithGivenRange,
                    "CocartesianLeftEvaluationMorphismWithGivenRange as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, A, B, Coex_B_A_uA )
        
    return UniqueMorphism( cat, B, Coex_B_A_uA );
    
end : CategoryFilter := IsCoHeytingAlgebroid );

##
AddDerivationToCAP( CocartesianLeftCoevaluationMorphismWithGivenSource,
                    "CocartesianLeftCoevaluationMorphismWithGivenSource as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, A, B, Coex_BuA_A )
        
    return UniqueMorphism( cat, Coex_BuA_A, B );
    
end : CategoryFilter := IsCoHeytingAlgebroid );

##
AddDerivationToCAP( CoproductToCoexponentialLeftAdjunctMorphismWithGivenCoexponential,
                    "CoproductToCoexponentialLeftAdjunctMorphismWithGivenCoexponential using the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, B, C, g, Coexp )
            
    return UniqueMorphism( cat, Coexp, B );
    
end : CategoryFilter := IsCoHeytingAlgebroid );

##
AddDerivationToCAP( CoexponentialToCoproductLeftAdjunctMorphismWithGivenCoproduct,
                    "CoexponentialToCoproductLeftAdjunctMorphismWithGivenCoproduct using the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, A, C, f, P )
        
        return UniqueMorphism( cat, A, P );
    
end : CategoryFilter := IsCoHeytingAlgebroid );

##
AddDerivationToCAP( CocartesianPreCoComposeMorphismWithGivenObjects,
                    "CocartesianPreCoComposeMorphismWithGivenObjects as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, Coex_A_C, A, B, C, Coex_A_BuCoex_B_C )
        
    return UniqueMorphism( cat, Coex_A_C, Coex_A_BuCoex_B_C );
    
end : CategoryFilter := IsCoHeytingAlgebroid );

##
AddDerivationToCAP( CocartesianPostCoComposeMorphismWithGivenObjects,
                    "CocartesianPostCoComposeMorphismWithGivenObjects as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, Coex_A_C, A, B, C, Coex_A_BuCoex_B_C )
        
    return UniqueMorphism( cat, Coex_A_C, Coex_A_BuCoex_B_C );
    
end : CategoryFilter := IsCoHeytingAlgebroid );

##
AddDerivationToCAP( CoexponentialCoproductCompatibilityMorphismWithGivenObjects,
                    "CoexponentialCoproductCompatibilityMorphismWithGivenObjects as the unique morphism",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, source, L, range )
        
    return UniqueMorphism( cat, source, range );
    
end : CategoryFilter := IsCoHeytingAlgebroid );

##
AddDerivationToCAP( ConegationOnObjects,
                    "ConegationOnObjects using CoexponentialOnObjects and TerminalObject",
                    [ [ CoexponentialOnObjects, 1 ],
                      [ TerminalObject, 1 ] ],
                    
  function( cat, A )
    
    return CoexponentialOnObjects( cat, TerminalObject( cat ), A );
    
end : CategoryFilter := IsCoHeytingAlgebroid );

##
AddDerivationToCAP( ConegationOnMorphismsWithGivenConegations,
                    "ConegationOnMorphismsWithGivenConegations using CoexponentialOnMorphismsWithGivenCoexponentials and IdentityMorphism and TerminalObject",
                    [ [ CoexponentialOnMorphismsWithGivenCoexponentials, 1 ],
                      [ IdentityMorphism, 1 ],
                      [ TerminalObject, 1 ] ],
                    
  function( cat, B_, u, A_ )
    
    return CoexponentialOnMorphismsWithGivenCoexponentials( cat, B_, IdentityMorphism( cat, TerminalObject( cat ) ), u, A_ );
    
end : CategoryFilter := IsCoHeytingAlgebroid );

##
AddDerivationToCAP( MorphismFromDoubleConegation,
                    "MorphismFromDoubleConegation as the unique morphism from the double-conegation",
                    [ [ ConegationOnObjects, 2 ],
                      [ UniqueMorphism, 1 ] ],
                    
  function( cat, A )
    
    return UniqueMorphism( cat, ConegationOnObjects( cat, ConegationOnObjects( cat, A ) ), A );
    
end : CategoryFilter := IsCoHeytingAlgebroid );

##
AddDerivationToCAP( MorphismFromDoubleConegationWithGivenDoubleConegation,
                    "MorphismFromDoubleConegationWithGivenDoubleConegation as the unique morphism from the double-conegation",
                    [ [ UniqueMorphism, 1 ] ],
                    
  function( cat, A, CN )
    
    return UniqueMorphism( cat, CN, A );
    
end : CategoryFilter := IsCoHeytingAlgebroid );
