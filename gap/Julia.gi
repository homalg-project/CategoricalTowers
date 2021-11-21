# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallOtherMethod( AsObjectInFunctorCategory,
        [ IsCapCategory, IsJuliaObject, IsJuliaObject ],
        
  function ( B, images_of_objects, images_of_morphisms )
    
    return AsObjectInFunctorCategory( B, ConvertJuliaToGAP( images_of_objects ), ConvertJuliaToGAP( images_of_morphisms ) );
    
end );

##
InstallOtherMethod( AsMorphismInFunctorCategory,
        [ IsObjectInFunctorCategory, IsJuliaObject, IsObjectInFunctorCategory ],
        
  function ( F, images_of_objects, G )
    
    return AsMorphismInFunctorCategory( F, ConvertJuliaToGAP( images_of_objects ), G );
    
end );
