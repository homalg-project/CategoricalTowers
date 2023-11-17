# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
AddDerivationToCAP( ExactCoverWithGlobalElements,
                    "",
        [ [ BasisOfExternalHom, 1 ],
          [ TensorUnit, 1 ] ],
        
  function ( cat, A )
    
    return BasisOfExternalHom( cat, TensorUnit( cat ), A );
    
end :
  CategoryFilter := cat ->
                    HasRangeCategoryOfHomomorphismStructure( cat ) and
                    IsIdenticalObj( cat, RangeCategoryOfHomomorphismStructure( cat ) ) and
                    IsMatrixCategory( cat ) or
                    ( IsCategoryOfRows( cat ) and
                      HasCommutativeRingOfLinearCategory( cat ) and
                      ## a commutative ring has the invariant basis property iff it is not the zero ring:
                      HasHasInvariantBasisProperty( CommutativeRingOfLinearCategory( cat ) ) and
                      HasInvariantBasisProperty( CommutativeRingOfLinearCategory( cat ) ) ) );
