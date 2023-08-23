# SPDX-License-Identifier: GPL-2.0-or-later
# GradedCategories: Graded closures of categories
#
# Implementations
#

##
InstallMethod( NegativelyZGradedClosureCategory,
        "for a CAP category",
        [ IsCapCategory ],
        
  function ( C )
    local ZC;
    
    ZC := ZGradedClosureCategoryWithBounds( C, "upper" );
    
    Assert( 0, not CanCompute( ZC, "IsCongruentForMorphisms" ) );
    
    return ZC;
    
end );
