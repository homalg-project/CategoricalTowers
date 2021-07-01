# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

InstallOtherMethod( QUO,
        [ IsMatrix, IsCapCategory and HasCommutativeRingOfLinearCategory ],

  function( mat, A )
    
    return HomalgMatrix( mat, CommutativeRingOfLinearCategory( A ) ) / A;
    
end );
