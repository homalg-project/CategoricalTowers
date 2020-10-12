# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallOtherMethod( AsObjectInHomCategory,
        [ IsCapCategory, IsJuliaObject, IsJuliaObject ],
        
  function ( B, images_of_objects, images_of_morphisms )
    
    return AsObjectInHomCategory( B, ConvertJuliaToGAP( images_of_objects ), ConvertJuliaToGAP( images_of_morphisms ) );
    
end );

