# SPDX-License-Identifier: GPL-2.0-or-later
# SliceCategories: Slice categories
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
#!  The &GAP; category of a lazy slice category.
DeclareCategory( "IsLazySliceCategory",
        IsSliceCategory );

#! @Description
#!  The &GAP; category of cells in a lazy slice category.
DeclareCategory( "IsCellInALazySliceCategory",
        IsCellInASliceCategory );

#! @Description
#!  The &GAP; category of objects in a lazy slice category.
DeclareCategory( "IsObjectInALazySliceCategory",
        FilterIntersection( IsObjectInASliceCategory, IsCellInALazySliceCategory ) );

#! @Description
#!  The &GAP; category of morphisms in a lazy slice category.
DeclareCategory( "IsMorphismInALazySliceCategory",
        FilterIntersection( IsMorphismInASliceCategory, IsCellInALazySliceCategory ) );

#! @Description
#!  The &GAP; category of a lazy slice category over the tensor unit.
DeclareCategory( "IsLazySliceCategoryOverTensorUnit",
        FilterIntersection( IsSliceCategoryOverTensorUnit, IsLazySliceCategory ) );

#! @Description
#!  The &GAP; category of cells in a lazy slice category over the tensor unit.
DeclareCategory( "IsCellInALazySliceCategoryOverTensorUnit",
        FilterIntersection( IsCellInSliceCategoryOverTensorUnit, IsCellInALazySliceCategory ) );

#! @Description
#!  The &GAP; category of objects in a lazy slice category over the tensor unit.
DeclareCategory( "IsObjectInALazySliceCategoryOverTensorUnit",
        FilterIntersection( IsObjectInSliceCategoryOverTensorUnit, IsObjectInALazySliceCategory ) );

#! @Description
#!  The &GAP; category of morphisms in a lazy slice category over the tensor unit.
DeclareCategory( "IsMorphismInALazySliceCategoryOverTensorUnit",
        FilterIntersection( IsMorphismInSliceCategoryOverTensorUnit, IsMorphismInALazySliceCategory ) );

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
        IsObjectInALazySliceCategory );

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
