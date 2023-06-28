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
DeclareCategory( "IsLazySliceCategory",
        IsSliceCategory );

#! @Description
#!  The &GAP; category of cells in an eager slice category.
DeclareCategory( "IsCellInALazySliceCategory",
        IsCellInASliceCategory );

#! @Description
#!  The &GAP; category of objects in an eager slice category.
DeclareCategory( "IsObjectInALazySliceCategory",
        IsObjectInASliceCategory and IsCellInALazySliceCategory );

#! @Description
#!  The &GAP; category of morphisms in an eager slice category.
DeclareCategory( "IsMorphismInALazySliceCategory",
        IsMorphismInASliceCategory and IsCellInALazySliceCategory );

#! @Description
#!  The &GAP; category of an eager slice category over the tensor unit.
DeclareCategory( "IsLazySliceCategoryOverTensorUnit",
        IsSliceCategoryOverTensorUnit and IsLazySliceCategory );

#! @Description
#!  The &GAP; category of cells in an eager slice category over the tensor unit.
DeclareCategory( "IsCellInALazySliceCategoryOverTensorUnit",
        IsCellInSliceCategoryOverTensorUnit and IsCellInALazySliceCategory );

#! @Description
#!  The &GAP; category of objects in an eager slice category over the tensor unit.
DeclareCategory( "IsObjectInALazySliceCategoryOverTensorUnit",
        IsObjectInSliceCategoryOverTensorUnit and IsObjectInALazySliceCategory );

#! @Description
#!  The &GAP; category of morphisms in an eager slice category over the tensor unit.
DeclareCategory( "IsMorphismInALazySliceCategoryOverTensorUnit",
        IsMorphismInSliceCategoryOverTensorUnit and IsMorphismInALazySliceCategory );

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
