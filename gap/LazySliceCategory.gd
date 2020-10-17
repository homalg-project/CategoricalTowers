# SPDX-License-Identifier: GPL-2.0-or-later
# SubcategoriesForCAP: Subcategory and other related constructors for CAP categories
#
# Declarations
#

#! @Chapter Slice categories (lazy data structure)

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of an eager slice category.
DeclareCategory( "IsCapLazySliceCategory",
        IsCapSliceCategory );

#! @Description
#!  The &GAP; category of cells in an eager slice category.
DeclareCategory( "IsCapCategoryCellInALazySliceCategory",
        IsCapCategoryCellInASliceCategory );

#! @Description
#!  The &GAP; category of objects in an eager slice category.
DeclareCategory( "IsCapCategoryObjectInALazySliceCategory",
        IsCapCategoryObjectInASliceCategory and IsCapCategoryCellInALazySliceCategory );

#! @Description
#!  The &GAP; category of morphisms in an eager slice category.
DeclareCategory( "IsCapCategoryMorphismInALazySliceCategory",
        IsCapCategoryMorphismInASliceCategory and IsCapCategoryCellInALazySliceCategory );

#! @Description
#!  The &GAP; category of an eager slice category over the tensor unit.
DeclareCategory( "IsCapLazySliceCategoryOverTensorUnit",
        IsCapSliceCategoryOverTensorUnit and IsCapLazySliceCategory );

#! @Description
#!  The &GAP; category of cells in an eager slice category over the tensor unit.
DeclareCategory( "IsCapCategoryCellInALazySliceCategoryOverTensorUnit",
        IsCapCategoryCellInASliceCategoryOverTensorUnit and IsCapCategoryCellInALazySliceCategory );

#! @Description
#!  The &GAP; category of objects in an eager slice category over the tensor unit.
DeclareCategory( "IsCapCategoryObjectInALazySliceCategoryOverTensorUnit",
        IsCapCategoryObjectInASliceCategoryOverTensorUnit and IsCapCategoryObjectInALazySliceCategory );

#! @Description
#!  The &GAP; category of morphisms in an eager slice category over the tensor unit.
DeclareCategory( "IsCapCategoryMorphismInALazySliceCategoryOverTensorUnit",
        IsCapCategoryMorphismInASliceCategoryOverTensorUnit and IsCapCategoryMorphismInALazySliceCategory );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The list of morphisms in the ambient category underlying <A>object</A>.
#! @Arguments object
#! @Returns a list
DeclareAttribute( "UnderlyingMorphismList",
        IsCapCategoryObjectInALazySliceCategory );

####################################
#
#! @Section Constructors
#
####################################

#! @Arguments B
DeclareAttribute( "LazySliceCategory",
        IsCapCategoryObject );

#! @Arguments M
DeclareAttribute( "LazySliceCategoryOverTensorUnit",
        IsCapCategory );

#! @Arguments L
DeclareAttribute( "AsSliceCategoryCell",
        IsList );
