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

##
InstallOtherMethod( CreateQuiver,
        [ IsCategoryOfQuivers, IsInt, IsJuliaObject ],
        
  function ( category_of_quivers, n, arrows )
    
    return CreateQuiver( category_of_quivers, n, ConvertJuliaToGAP( arrows ) );
    
end );

##
InstallOtherMethod( CreateQuiver,
        [ IsInt, IsJuliaObject ],
        
  function ( n, arrows )
    
    return CreateQuiver( n, ConvertJuliaToGAP( arrows ) );
    
end );

##
InstallOtherMethod( CreateQuiverMorphism,
        [ IsObjectInCategoryOfQuivers, IsJuliaObject, IsJuliaObject, IsObjectInCategoryOfQuivers ],
        
  function ( source, images_of_vertices, images_of_arrows, range )
    
    return CreateQuiverMorphism( source, ConvertJuliaToGAP( images_of_vertices ), ConvertJuliaToGAP( images_of_arrows ), range );
    
end );

##
InstallOtherMethod( Subobject,
        [ IsObjectInCategoryOfQuivers, IsJuliaObject, IsJuliaObject ],
        
  function ( quiver, images_of_vertices, images_of_arrows )
    
    return Subobject( quiver, ConvertJuliaToGAP( images_of_vertices ), ConvertJuliaToGAP( images_of_arrows ) );
    
end );

##
InstallOtherMethod( Subobject,
        [ IsObjectInCategoryOfQuivers, IsJuliaObject ],
        
  function ( quiver, images_of_arrows )
    
    return Subobject( quiver, ConvertJuliaToGAP( images_of_arrows ) );
    
end );
