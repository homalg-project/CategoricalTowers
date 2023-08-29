# SPDX-License-Identifier: GPL-2.0-or-later
# GradedCategories: Graded closures of categories
#
# Implementations
#

##
InstallMethod( PositivelyZGradedClosureCategory,
        "for a CAP category",
        [ IsCapCategory ],
        
  function ( C )
    local ZC;
    
    ZC := ZGradedClosureCategoryWithBounds( C, "lower" );
    
    Assert( 0, not CanCompute( ZC, "IsCongruentForMorphisms" ) );
    
    return ZC;
    
end );
