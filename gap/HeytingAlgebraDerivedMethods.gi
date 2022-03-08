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

##
AddDerivationToCAP( NegationOnObjects,
        [ [ ExponentialOnObjects, 1 ],
          [ InitialObject, 1 ] ],
        
  function( cat, A )
    
    return ExponentialOnObjects( cat, A, InitialObject( cat ) );
    
end : Description := "NegationOnObjects using ExponentialOnObjects and InitialObject",
      CategoryFilter := IsThinCategory and IsCartesianClosedCategory );

##
AddDerivationToCAP( NegationOnMorphismsWithGivenNegations,
        [ [ ExponentialOnMorphismsWithGivenExponentials, 1 ],
          [ IdentityMorphism, 1 ],
          [ InitialObject, 1 ] ],
        
  function( cat, B_, u, A_ )
    
    return ExponentialOnMorphismsWithGivenExponentials( cat, B_, u, IdentityMorphism( cat, InitialObject( cat ) ), A_ );
    
end : Description := "NegationOnMorphismsWithGivenNegations using ExponentialOnMorphismsWithGivenExponentials and IdentityMorphism and InitialObject",
      CategoryFilter := IsThinCategory and IsCartesianCategory and IsCocartesianCategory and IsCartesianClosedCategory );
