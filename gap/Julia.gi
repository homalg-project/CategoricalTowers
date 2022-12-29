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

##
InstallOtherMethod( Subobject,
        [ IsObjectInCategoryOfBouquets, IsJuliaObject, IsJuliaObject ],
        
  function ( quiver, images_of_vertices, images_of_arrows )
    
    return Subobject( quiver, ConvertJuliaToGAP( images_of_vertices ), ConvertJuliaToGAP( images_of_arrows ) );
    
end );

##
InstallOtherMethod( Subobject,
        [ IsObjectInCategoryOfBouquets, IsJuliaObject ],
        
  function ( quiver, images_of_arrows )
    
    return Subobject( quiver, ConvertJuliaToGAP( images_of_arrows ) );
    
end );

##
InstallOtherMethod( CreateBouquet,
        [ IsCategoryOfQuivers, IsInt, IsJuliaObject ],
        
  function ( category_of_quivers, n, loops )
    
    return CreateBouquet( category_of_quivers, n, ConvertJuliaToGAP( loops ) );
    
end );

##
InstallOtherMethod( CreateBouquet,
        [ IsInt, IsJuliaObject ],
        
  function ( n, loops )
    
    return CreateBouquet( n, ConvertJuliaToGAP( loops ) );
    
end );

##
InstallOtherMethod( CreateBouquetMorphism,
        [ IsObjectInCategoryOfBouquets, IsJuliaObject, IsJuliaObject, IsObjectInCategoryOfBouquets ],
        
  function ( source, images_of_vertices, images_of_loops, range )
    
    return CreateBouquetMorphism( source, ConvertJuliaToGAP( images_of_vertices ), ConvertJuliaToGAP( images_of_loops ), range );
    
end );

##
InstallOtherMethod( CategoryOfDecoratedQuiversEnrichedOver,
        [ IsObjectInCategoryOfQuivers, IsJuliaObject, IsJuliaObject ],
        
  function ( decorating_quiver, decoration_of_vertices, decoration_of_arrows )
    
    return CategoryOfDecoratedQuiversEnrichedOver( decorating_quiver, ConvertJuliaToGAP( decoration_of_vertices ), ConvertJuliaToGAP( decoration_of_arrows ) );
    
end );

##
InstallOtherMethod( CreateDecoratedQuiver,
        [ IsCategoryOfDecoratedQuivers, IsJuliaObject, IsJuliaObject ],
        
  function ( decorating_quiver, decoration_of_vertices, arrows_with_decoration )
    
    return CreateDecoratedQuiver( decorating_quiver, ConvertJuliaToGAP( decoration_of_vertices ), ConvertJuliaToGAP( arrows_with_decoration ) );
    
end );

##
InstallOtherMethod( Subobject,
        [ IsObjectInCategoryOfDecoratedQuivers, IsJuliaObject, IsJuliaObject ],
        
  function ( decorated_quiver, images_of_vertices, images_of_arrows )
    
    return Subobject( decorated_quiver, ConvertJuliaToGAP( images_of_vertices ), ConvertJuliaToGAP( images_of_arrows ) );
    
end );

##
InstallOtherMethod( Subobject,
        [ IsObjectInCategoryOfDecoratedQuivers, IsJuliaObject ],
        
  function ( decorated_quiver, images_of_arrows )
    
    return Subobject( decorated_quiver, ConvertJuliaToGAP( images_of_arrows ) );
    
end );
