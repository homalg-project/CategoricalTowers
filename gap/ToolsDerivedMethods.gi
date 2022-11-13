# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
AddDerivationToCAP( ExactCoverWithGlobalElements,
        [ [ BasisOfExternalHom, 1 ],
          [ TensorUnit, 1 ] ],
        
  function ( cat, A )
    
    return BasisOfExternalHom( cat, TensorUnit( cat ), A );
    
end :
  CategoryFilter := cat ->
                    IsMatrixCategory( cat ) or
                    ( IsCategoryOfRows( cat ) and
                      HasIsFieldForHomalg( CommutativeRingOfLinearCategory( cat ) ) and
                      IsFieldForHomalg( CommutativeRingOfLinearCategory( cat ) ) ) );
