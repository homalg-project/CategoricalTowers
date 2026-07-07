# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

#= comment for Julia
##
InstallOtherMethod( QUO,
        [ IsMatrix, FilterIntersection( IsCapCategory, HasCommutativeSemiringOfLinearCategory ) ],
        
  function ( mat, A )
    
    return HomalgMatrix( mat, CommutativeSemiringOfLinearCategory( A ) ) / A;
    
end );
# =#
