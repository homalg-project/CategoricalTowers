#
# Bialgebroids: Create a full subcategory
#
# Declarations
#

#! @Chapter Full subcategories

####################################
#
#! @Section Categories
#
####################################

#! @Description
#!  The &GAP; category of a full subcategory.
DeclareCategory( "IsCapFullSubcategory",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a full subcategory.
DeclareCategory( "IsCapCategoryCellInAFullSubcategory",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a full subcategory.
DeclareCategory( "IsCapCategoryObjectInAFullSubcategory",
        IsCapCategoryCellInAFullSubcategory and IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a full subcategory.
DeclareCategory( "IsCapCategoryMorphismInAFullSubcategory",
        IsCapCategoryCellInAFullSubcategory and IsCapCategoryMorphism );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The cell in the ambient category underlying <A>cell</A>.
#! @Arguments cell
#! @Returns a &CAP; cell
DeclareAttribute( "UnderlyingCell",
        IsCapCategoryCellInAFullSubcategory );

#! @Description
#!  The set of known objects of the full subcategory <A>A</A>.
#! @Arguments A
#! @Returns a list
DeclareAttribute( "SetOfKnownObjects",
        IsCapCategory, "mutable" );

#! @Description
#!  The ambient category of the full subcategory <A>A</A>.
#! @Arguments A
#! @Returns a list
DeclareAttribute( "AmbientCapCategory",
        IsCapFullSubcategory );

#! @Description
#!  The natural embedding functor from <A>A</A> to <A>AmbientCapCategory(A)</A>.
#! @Arguments A
#! @Returns CapFunctor
DeclareAttribute( "NaturalEmbeddingFunctor",
        IsCapFullSubcategory );

####################################
#
#! @Section Constructors
#
####################################

DeclareGlobalFunction( "ADD_FUNCTIONS_FOR_FULL_SUBCATEGORY" );

DeclareGlobalFunction( "ADD_FUNCTIONS_FOR_HOM_STRUCTURE_OF_FULL_SUBCATEGORY" );

DeclareOperation( "FullSubcategory",
                  [ IsCapCategory, IsString ] );

DeclareOperation( "AsFullSubcategoryCell",
                  [ IsCapCategory, IsCapCategoryCell ] );
