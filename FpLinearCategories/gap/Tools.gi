# SPDX-License-Identifier: GPL-2.0-or-later
# FpLinearCategories: Finitely presented linear categories by generating quivers and relations
#
# Implementations
#

##
InstallOtherMethod( Dimension,
        "for an algebroid",
        [ IsCapCategory and IsObjectFiniteCategory and IsLinearCategoryOverCommutativeRingWithFinitelyGeneratedFreeExternalHoms ],
        
  function( A )
    local objects;
    
    objects := SetOfObjects( A );
    
    return Sum( objects, s -> Sum( objects, t -> ObjectDatum( HomomorphismStructureOnObjects( s, t ) ) ) );
    
end );
