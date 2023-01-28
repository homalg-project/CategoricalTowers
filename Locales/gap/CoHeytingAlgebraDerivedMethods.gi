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
        [ [ IsInitial, 1 ],
          [ CoexponentialOnObjects, 1 ] ],
        
  function( cat, S, T )
    
    return IsInitial( cat, CoexponentialOnObjects( cat, S, T ) );
    
end : Description := "IsHomSetInhabited using IsInitial and CoexponentialOnObjects",
      CategoryFilter := IsThinCategory and IsCocartesianCoclosedCategory );

#####################################
# Coheyting algebroids
#####################################

##
AddDerivationToCAP( CoexponentialOnMorphismsWithGivenCoexponentials,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, S, alpha, beta, R )
        
    return UniqueMorphism( cat, S, R );
    
end : Description := "CoexponentialOnMorphismsWithGivenCoexponentials as the unique morphism",
      CategoryFilter := IsCoHeytingAlgebroid );

##
AddDerivationToCAP( CocartesianEvaluationMorphismWithGivenRange,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, A, B, Coex_A_BuB )
        
    return UniqueMorphism( cat, A, Coex_A_BuB );
    
end : Description := "CocartesianEvaluationMorphismWithGivenRange as the unique morphism",
      CategoryFilter := IsCoHeytingAlgebroid );

##
AddDerivationToCAP( CocartesianCoevaluationMorphismWithGivenSource,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, A, B, Coex_AuB_A)
        
    return UniqueMorphism( cat, Coex_AuB_A, B );
    
end : Description := "CocartesianCoevaluationMorphismWithGivenSource as the unique morphism",
      CategoryFilter := IsCoHeytingAlgebroid );

##
AddDerivationToCAP( CoproductToCoexponentialAdjunctionMapWithGivenCoexponential,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, C, B, g, Coexp )
            
    return UniqueMorphism( cat, Coexp, C );
    
end : Description := "CoproductToCoexponentialAdjunctionMapWithGivenCoexponential using the unique morphism",
      CategoryFilter := IsCoHeytingAlgebroid );

##
AddDerivationToCAP( CoexponentialToCoproductAdjunctionMapWithGivenCoproduct,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, A, B, f, P )
        
        return UniqueMorphism( cat, A, P );
    
end : Description := "CoexponentialToCoproductAdjunctionMapWithGivenCoproduct using the unique morphism",
      CategoryFilter := IsCoHeytingAlgebroid );

##
AddDerivationToCAP( CocartesianPreCoComposeMorphismWithGivenObjects,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, Coex_A_C, A, B, C, Coex_A_BuCoex_B_C )
        
    return UniqueMorphism( cat, Coex_A_C, Coex_A_BuCoex_B_C );
    
end : Description := "CocartesianPreCoComposeMorphismWithGivenObjects as the unique morphism",
      CategoryFilter := IsCoHeytingAlgebroid );

##
AddDerivationToCAP( CocartesianPostCoComposeMorphismWithGivenObjects,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, Coex_A_C, A, B, C, Coex_A_BuCoex_B_C )
        
    return UniqueMorphism( cat, Coex_A_C, Coex_A_BuCoex_B_C );
    
end : Description := "CocartesianPostCoComposeMorphismWithGivenObjects as the unique morphism",
      CategoryFilter := IsCoHeytingAlgebroid );

##
AddDerivationToCAP( CoexponentialCoproductCompatibilityMorphismWithGivenObjects,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, source, L, range )
        
    return UniqueMorphism( cat, source, range );
    
end : Description := "CoexponentialCoproductCompatibilityMorphismWithGivenObjects as the unique morphism",
      CategoryFilter := IsCoHeytingAlgebroid );

##
AddDerivationToCAP( ConegationOnObjects,
        [ [ CoexponentialOnObjects, 1 ],
          [ TerminalObject, 1 ] ],
        
  function( cat, A )
    
    return CoexponentialOnObjects( cat, TerminalObject( cat ), A );
    
end : Description := "ConegationOnObjects using CoexponentialOnObjects and TerminalObject",
      CategoryFilter := IsCoHeytingAlgebroid );

##
AddDerivationToCAP( ConegationOnMorphismsWithGivenConegations,
        [ [ CoexponentialOnMorphismsWithGivenCoexponentials, 1 ],
          [ IdentityMorphism, 1 ],
          [ TerminalObject, 1 ] ],
        
  function( cat, B_, u, A_ )
    
    return CoexponentialOnMorphismsWithGivenCoexponentials( cat, B_, IdentityMorphism( cat, TerminalObject( cat ) ), u, A_ );
    
end : Description := "ConegationOnMorphismsWithGivenConegations using CoexponentialOnMorphismsWithGivenCoexponentials and IdentityMorphism and TerminalObject",
      CategoryFilter := IsCoHeytingAlgebroid );

##
AddDerivationToCAP( MorphismFromDoubleConegation,
        [ [ ConegationOnObjects, 2 ],
          [ UniqueMorphism, 1 ] ],
        
  function( cat, A )
    
    return UniqueMorphism( cat, ConegationOnObjects( cat, ConegationOnObjects( cat, A ) ), A );
    
end : Description := "MorphismFromDoubleConegation as the unique morphism from the double-conegation",
      CategoryFilter := IsCoHeytingAlgebroid );

##
AddDerivationToCAP( MorphismFromDoubleConegationWithGivenDoubleConegation,
        [ [ UniqueMorphism, 1 ] ],
        
  function( cat, A, CN )
    
    return UniqueMorphism( cat, CN, A );
    
end : Description := "MorphismFromDoubleConegationWithGivenDoubleConegation as the unique morphism from the double-conegation",
      CategoryFilter := IsCoHeytingAlgebroid );
