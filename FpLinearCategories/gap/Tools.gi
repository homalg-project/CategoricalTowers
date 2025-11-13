# SPDX-License-Identifier: GPL-2.0-or-later
# FpLinearCategories: Finitely presented linear categories by generating quivers and relations
#
# Implementations
#

##
InstallOtherMethod( Dimension,
        "for a linear category with finite objects and free external homs",
        [ IsCapCategory ],
        
  function( A )
    local objects;
    
    if not ( HasIsObjectFiniteCategory( A ) and IsObjectFiniteCategory( A ) and
              HasIsLinearCategoryOverCommutativeRingWithFinitelyGeneratedFreeExternalHoms( A ) and
              IsLinearCategoryOverCommutativeRingWithFinitelyGeneratedFreeExternalHoms( A ) ) then

        TryNextMethod( );
    fi;
    
    objects := SetOfObjects( A );
    
    return Sum( objects, s -> Sum( objects, t -> ObjectDatum( HomomorphismStructureOnObjects( s, t ) ) ) );
    
end );
