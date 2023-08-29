# SPDX-License-Identifier: GPL-2.0-or-later
# GradedCategories: Graded closures of categories
#
# Implementations
#

##
InstallMethod( FinitelyZGradedClosureCategory,
        "for a CAP category",
        [ IsCapCategory ],
        
  function ( C )
    local ZC;
    
    ZC := ZGradedClosureCategoryWithBounds( C, "both" );
    
    Assert( 0, CanCompute( ZC, "IsCongruentForMorphisms" ) );
    
    return ZC;
    
end );
