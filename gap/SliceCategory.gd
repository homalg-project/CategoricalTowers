#
# SubcategoriesForCAP: Create a slice category
#
# Declarations
#

#! @Chapter Slice categories

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of a slice category.
DeclareCategory( "IsCapSliceCategory",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a slice category.
DeclareCategory( "IsCapCategoryCellInASliceCategory",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a slice category.
DeclareCategory( "IsCapCategoryObjectInASliceCategory",
        IsCapCategoryCellInASliceCategory and IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a slice category.
DeclareCategory( "IsCapCategoryMorphismInASliceCategory",
        IsCapCategoryCellInASliceCategory and IsCapCategoryMorphism );

####################################
#
#! @Section Global variables
#
####################################

#!
DeclareGlobalVariable( "CAP_INTERNAL_METHOD_NAME_LIST_FOR_SLICE_CATEGORY" );

#!
DeclareGlobalVariable( "CAP_INTERNAL_METHOD_NAME_LIST_FOR_ADDITIVE_SLICE_CATEGORY" );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The base object of the slice category <A>S</A>.
#! @Arguments S
#! @Returns a &CAP; object
DeclareAttribute( "BaseObject",
        IsCapSliceCategory );

#! @Description
#!  The base object underlying <A>cell</A>.
#! @Arguments cell
#! @Returns a &CAP; object
DeclareAttribute( "BaseObject",
        IsCapCategoryCellInASliceCategory );

#! @Description
#!  The morphism in the ambient category underlying <A>object</A>.
#! @Arguments object
#! @Returns a &CAP; morphism
DeclareAttribute( "UnderlyingMorphism",
        IsCapCategoryObjectInASliceCategory );

#! @Description
#!  The cell in the ambient category underlying <A>cell</A>.
#! @Arguments cell
#! @Returns a &CAP; cell
DeclareAttribute( "UnderlyingCell",
        IsCapCategoryCellInASliceCategory );

#! @Description
#!  The ambient category of the slice category <A>A</A>.
#! @Arguments A
#! @Returns a list
DeclareAttribute( "AmbientCategory",
        IsCapSliceCategory );

#! @Description
#!  The natural embedding functor from <A>A</A> to <A>AmbientCategory(A)</A>.
#! @Arguments A
#! @Returns CapFunctor
DeclareAttribute( "InclusionFunctor",
        IsCapSliceCategory );

####################################
#
#! @Section Constructors
#
####################################

DeclareGlobalFunction( "ADD_FUNCTIONS_FOR_SLICE_CATEGORY" );

DeclareAttribute( "SliceCategory",
        IsCapCategoryObject );

DeclareOperation( "AsSliceCategoryCell",
        [ IsCapCategory, IsCapCategoryMorphism ] );

DeclareOperation( "AsSliceCategoryCell",
        [ IsCapCategoryMorphism ] );

DeclareOperation( "AsSliceCategoryCell",
        [ IsCapCategoryObjectInASliceCategory, IsCapCategoryMorphism, IsCapCategoryObjectInASliceCategory ] );
