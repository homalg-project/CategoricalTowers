# SPDX-License-Identifier: GPL-2.0-or-later
# SubcategoriesForCAP: Subcategory and other related constructors for CAP categories
#
# Declarations
#

#! @Chapter Slice categories (eager data structure)

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of an eager slice category.
DeclareCategory( "IsCapEagerSliceCategory",
        IsCapSliceCategory );

#! @Description
#!  The &GAP; category of cells in an eager slice category.
DeclareCategory( "IsCapCategoryCellInAnEagerSliceCategory",
        IsCapCategoryCellInASliceCategory );

#! @Description
#!  The &GAP; category of objects in an eager slice category.
DeclareCategory( "IsCapCategoryObjectInAnEagerSliceCategory",
        IsCapCategoryObjectInASliceCategory and IsCapCategoryCellInAnEagerSliceCategory );

#! @Description
#!  The &GAP; category of morphisms in an eager slice category.
DeclareCategory( "IsCapCategoryMorphismInAnEagerSliceCategory",
        IsCapCategoryMorphismInASliceCategory and IsCapCategoryCellInAnEagerSliceCategory );

#! @Description
#!  The &GAP; category of an eager slice category over the tensor unit.
DeclareCategory( "IsCapEagerSliceCategoryOverTensorUnit",
        IsCapSliceCategoryOverTensorUnit and IsCapEagerSliceCategory );

#! @Description
#!  The &GAP; category of cells in an eager slice category over the tensor unit.
DeclareCategory( "IsCapCategoryCellInAnEagerSliceCategoryOverTensorUnit",
        IsCapCategoryCellInASliceCategoryOverTensorUnit and IsCapCategoryCellInAnEagerSliceCategory );

#! @Description
#!  The &GAP; category of objects in an eager slice category over the tensor unit.
DeclareCategory( "IsCapCategoryObjectInAnEagerSliceCategoryOverTensorUnit",
        IsCapCategoryObjectInASliceCategoryOverTensorUnit and IsCapCategoryObjectInAnEagerSliceCategory );

#! @Description
#!  The &GAP; category of morphisms in an eager slice category over the tensor unit.
DeclareCategory( "IsCapCategoryMorphismInAnEagerSliceCategoryOverTensorUnit",
        IsCapCategoryMorphismInASliceCategoryOverTensorUnit and IsCapCategoryMorphismInAnEagerSliceCategory );

####################################
#
#! @Section Constructors
#
####################################

#! @Arguments B
DeclareAttribute( "SliceCategory",
        IsCapCategoryObject );

#! @Arguments M
DeclareAttribute( "SliceCategoryOverTensorUnit",
        IsCapCategory );

#! @Arguments mor
DeclareAttribute( "AsSliceCategoryCell",
        IsCapCategoryMorphism );
