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
DeclareCategory( "IsEagerSliceCategory",
        IsSliceCategory );

#! @Description
#!  The &GAP; category of cells in an eager slice category.
DeclareCategory( "IsCellInAnEagerSliceCategory",
        IsCellInASliceCategory );

#! @Description
#!  The &GAP; category of objects in an eager slice category.
DeclareCategory( "IsObjectInAnEagerSliceCategory",
        IsObjectInASliceCategory and IsCellInAnEagerSliceCategory );

#! @Description
#!  The &GAP; category of morphisms in an eager slice category.
DeclareCategory( "IsMorphismInAnEagerSliceCategory",
        IsMorphismInASliceCategory and IsCellInAnEagerSliceCategory );

#! @Description
#!  The &GAP; category of an eager slice category over the tensor unit.
DeclareCategory( "IsEagerSliceCategoryOverTensorUnit",
        IsSliceCategoryOverTensorUnit and IsEagerSliceCategory );

#! @Description
#!  The &GAP; category of cells in an eager slice category over the tensor unit.
DeclareCategory( "IsCellInAnEagerSliceCategoryOverTensorUnit",
        IsCellInSliceCategoryOverTensorUnit and IsCellInAnEagerSliceCategory );

#! @Description
#!  The &GAP; category of objects in an eager slice category over the tensor unit.
DeclareCategory( "IsObjectInAnEagerSliceCategoryOverTensorUnit",
        IsObjectInSliceCategoryOverTensorUnit and IsObjectInAnEagerSliceCategory );

#! @Description
#!  The &GAP; category of morphisms in an eager slice category over the tensor unit.
DeclareCategory( "IsMorphismInAnEagerSliceCategoryOverTensorUnit",
        IsMorphismInSliceCategoryOverTensorUnit and IsMorphismInAnEagerSliceCategory );

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
