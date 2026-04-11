# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallOtherMethod( QUO,
        [ IsMatrix, IsCapCategory and HasCommutativeSemiringOfLinearCategory ],
        
  function ( mat, A )
    
    return HomalgMatrix( mat, CommutativeSemiringOfLinearCategory( A ) ) / A;
    
end );
