# SPDX-License-Identifier: GPL-2.0-or-later
# SubcategoriesForCAP: Subcategory and other related constructors for CAP categories
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

#! @Description
#!  The &GAP; category of a slice category over the tensor unit.
DeclareCategory( "IsCapSliceCategoryOverTensorUnit",
        IsCapSliceCategory );

#! @Description
#!  The &GAP; category of cells in a slice category over the tensor unit.
DeclareCategory( "IsCapCategoryCellInASliceCategoryOverTensorUnit",
        IsCapCategoryCellInASliceCategory );

#! @Description
#!  The &GAP; category of objects in a slice category over the tensor unit.
DeclareCategory( "IsCapCategoryObjectInASliceCategoryOverTensorUnit",
        IsCapCategoryCellInASliceCategoryOverTensorUnit and IsCapCategoryObjectInASliceCategory );

#! @Description
#!  The &GAP; category of morphisms in a slice category over the tensor unit.
DeclareCategory( "IsCapCategoryMorphismInASliceCategoryOverTensorUnit",
        IsCapCategoryCellInASliceCategoryOverTensorUnit and IsCapCategoryMorphismInASliceCategory );

####################################
#
#! @Section Global variables
#
####################################

#!
DeclareGlobalVariable( "CAP_INTERNAL_METHOD_NAME_LIST_FOR_SLICE_CATEGORY" );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The ambient category of the slice category <A>S</A>.
#! @Arguments S
#! @Returns a list
DeclareAttribute( "AmbientCategory",
        IsCapSliceCategory );

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

CapJitAddTypeSignature( "UnderlyingMorphism", [ IsCapCategoryObjectInASliceCategory ], function ( args, func_stack )
    
    Assert( 0, IsCapSliceCategory( args.1.data_type.category ) );
    
    return rec( args := args, output_type := rec( filter := AmbientCategory( args.1.data_type.category )!.morphism_representation, category := AmbientCategory( args.1.data_type.category ) ) );
    
end );

#! @Description
#!  The cell in the ambient category underlying <A>cell</A>.
#! @Arguments cell
#! @Returns a &CAP; cell
DeclareAttribute( "UnderlyingCell",
        IsCapCategoryCellInASliceCategory );

CapJitAddTypeSignature( "UnderlyingCell", [ IsCapCategoryMorphismInASliceCategory ], function ( args, func_stack )
    
    Assert( 0, IsCapSliceCategory( args.1.data_type.category ) );
    
    return rec( args := args, output_type := rec( filter := AmbientCategory( args.1.data_type.category )!.morphism_representation, category := AmbientCategory( args.1.data_type.category ) ) );
    
end );

#! @Description
#!  The natural embedding functor from <A>S</A> to <C>AmbientCategory</C>(<A>S</A>).
#! @Arguments S
#! @Returns a functor
DeclareAttribute( "InclusionFunctor",
        IsCapSliceCategory );

DeclareAttribute( "DualOverTensorUnit",
        IsCapCategoryMorphism );

####################################
#
#! @Section Operations
#
####################################

#! @Description
#!  The natural morphism $I \to \mathrm{\underline{Hom}}(J,I)$, where
#!  <A>I</A> and <A>J</A> are objects in a slice category over the tensor unit.
#! @Arguments J, I
#! @Returns a morphism
DeclareOperation( "MorphismFromCovariantArgumentOfInternalHom",
        [ IsCapCategoryObjectInASliceCategoryOverTensorUnit, IsCapCategoryObjectInASliceCategoryOverTensorUnit ] );

####################################
#
#! @Section Constructors
#
####################################

#! @Arguments mor, S
DeclareOperation( "AsSliceCategoryCell",
        [ IsCapCategoryMorphism, IsCapSliceCategory ] );

#! @Arguments mor, S
DeclareOperation( "/",
        [ IsCapCategoryMorphism, IsCapSliceCategory ] );

#! @Arguments A, mor, B
DeclareOperation( "AsSliceCategoryCell",
        [ IsCapCategoryObjectInASliceCategory, IsCapCategoryMorphism, IsCapCategoryObjectInASliceCategory ] );
