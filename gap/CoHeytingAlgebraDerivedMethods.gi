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

##
AddDerivationToCAP( ConegationOnObjects,
        [ [ CoexponentialOnObjects, 1 ],
          [ TerminalObject, 1 ] ],
        
  function( cat, A )
    
    return CoexponentialOnObjects( cat, TerminalObject( cat ), A );
    
end : Description := "ConegationOnObjects using CoexponentialOnObjects and TerminalObject",
      CategoryFilter := IsCoHeytingAlgebra );

##
AddDerivationToCAP( ConegationOnMorphismsWithGivenConegations,
        [ [ CoexponentialOnMorphismsWithGivenCoexponentials, 1 ],
          [ IdentityMorphism, 1 ],
          [ TerminalObject, 1 ] ],
        
  function( cat, B_, u, A_ )
    
    return CoexponentialOnMorphismsWithGivenCoexponentials( cat, B_, IdentityMorphism( cat, TerminalObject( cat ) ), u, A_ );
    
end : Description := "ConegationOnMorphismsWithGivenConegations using CoexponentialOnMorphismsWithGivenCoexponentials and IdentityMorphism and TerminalObject",
      CategoryFilter := IsCoHeytingAlgebra );

##
AddDerivationToCAP( MorphismFromDoubleConegation,
        [ [ ConegationOnObjects, 2 ],
          [ UniqueMorphism, 1 ] ],
        
  function( cat, A )
    
    return UniqueMorphism( cat, ConegationOnObjects( cat, ConegationOnObjects( cat, A ) ), A );
    
end : Description := "MorphismFromDoubleConegationWithGivenDoubleConegation as the unique morphism from the double-conegation",
      CategoryFilter := IsCoHeytingAlgebra );
