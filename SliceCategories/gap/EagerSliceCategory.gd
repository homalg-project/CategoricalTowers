# SPDX-License-Identifier: GPL-2.0-or-later
# SliceCategories: Slice categories
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
        FilterIntersection( IsObjectInASliceCategory, IsCellInAnEagerSliceCategory ) );

#! @Description
#!  The &GAP; category of morphisms in an eager slice category.
DeclareCategory( "IsMorphismInAnEagerSliceCategory",
        FilterIntersection( IsMorphismInASliceCategory, IsCellInAnEagerSliceCategory ) );

#! @Description
#!  The &GAP; category of an eager slice category over the tensor unit.
DeclareCategory( "IsEagerSliceCategoryOverTensorUnit",
        FilterIntersection( IsSliceCategoryOverTensorUnit, IsEagerSliceCategory ) );

#! @Description
#!  The &GAP; category of cells in an eager slice category over the tensor unit.
DeclareCategory( "IsCellInAnEagerSliceCategoryOverTensorUnit",
        FilterIntersection( IsCellInSliceCategoryOverTensorUnit, IsCellInAnEagerSliceCategory ) );

#! @Description
#!  The &GAP; category of objects in an eager slice category over the tensor unit.
DeclareCategory( "IsObjectInAnEagerSliceCategoryOverTensorUnit",
        FilterIntersection( IsObjectInSliceCategoryOverTensorUnit, IsObjectInAnEagerSliceCategory ) );

#! @Description
#!  The &GAP; category of morphisms in an eager slice category over the tensor unit.
DeclareCategory( "IsMorphismInAnEagerSliceCategoryOverTensorUnit",
        FilterIntersection( IsMorphismInSliceCategoryOverTensorUnit, IsMorphismInAnEagerSliceCategory ) );

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
