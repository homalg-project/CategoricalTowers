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
DeclareCategory( "IsSliceCategory",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a slice category.
DeclareCategory( "IsCellInASliceCategory",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a slice category.
DeclareCategory( "IsObjectInASliceCategory",
        IsCellInASliceCategory and IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a slice category.
DeclareCategory( "IsMorphismInASliceCategory",
        IsCellInASliceCategory and IsCapCategoryMorphism );

#! @Description
#!  The &GAP; category of a slice category over the tensor unit.
DeclareCategory( "IsSliceCategoryOverTensorUnit",
        IsSliceCategory );

#! @Description
#!  The &GAP; category of cells in a slice category over the tensor unit.
DeclareCategory( "IsCellInSliceCategoryOverTensorUnit",
        IsCellInASliceCategory );

#! @Description
#!  The &GAP; category of objects in a slice category over the tensor unit.
DeclareCategory( "IsObjectInSliceCategoryOverTensorUnit",
        IsCellInSliceCategoryOverTensorUnit and IsObjectInASliceCategory );

#! @Description
#!  The &GAP; category of morphisms in a slice category over the tensor unit.
DeclareCategory( "IsMorphismInSliceCategoryOverTensorUnit",
        IsCellInSliceCategoryOverTensorUnit and IsMorphismInASliceCategory );

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
        IsSliceCategory );

CapJitAddTypeSignature( "AmbientCategory", [ IsSliceCategory ], function ( input_types )
    
    return CapJitDataTypeOfCategory( AmbientCategory( input_types[1].category ) );
    
end );

#! @Description
#!  The base object of the slice category <A>S</A>.
#! @Arguments S
#! @Returns a &CAP; object
DeclareAttribute( "BaseObject",
        IsSliceCategory );

CapJitAddTypeSignature( "BaseObject", [ IsSliceCategory ], function ( input_types )
    
    return CapJitDataTypeOfObjectOfCategory( AmbientCategory( input_types[1].category ) );
    
end );

#! @Description
#!  The base object underlying <A>cell</A>.
#! @Arguments cell
#! @Returns a &CAP; object
DeclareAttribute( "BaseObject",
        IsCellInASliceCategory );

#! @Description
#!  The morphism in the ambient category underlying the slice category object <A>obj</A>.
#! @Arguments obj
#! @Returns a &CAP; morphism
DeclareAttribute( "UnderlyingMorphism",
        IsObjectInASliceCategory );

CapJitAddTypeSignature( "UnderlyingMorphism", [ IsObjectInASliceCategory ], function ( input_types )
    
    Assert( 0, IsSliceCategory( input_types[1].category ) );
    
    return CapJitDataTypeOfMorphismOfCategory( AmbientCategory( input_types[1].category ) );
    
end );

#! @Description
#!  The cell in the ambient category underlying <A>cell</A>.
#! @Arguments cell
#! @Returns a &CAP; cell
DeclareAttribute( "UnderlyingCell",
        IsCellInASliceCategory );

CapJitAddTypeSignature( "UnderlyingCell", [ IsMorphismInASliceCategory ], function ( input_types )
    
    Assert( 0, IsSliceCategory( input_types[1].category ) );
    
    return CapJitDataTypeOfMorphismOfCategory( AmbientCategory( input_types[1].category ) );
    
end );

#! @Description
#!  The natural embedding functor from <A>S</A> to <C>AmbientCategory</C>(<A>S</A>).
#! @Arguments S
#! @Returns a functor
DeclareAttribute( "InclusionFunctor",
        IsSliceCategory );

#! @Description
#!  The argument is an object $J \colon j \rightarrow 1$ in the slice category <A>S</A> over the tensor unit.
#!  The output is the dual morphism $J^\vee \colon 1 \rightarrow \mathrm{\underline{Hom}}(j,1)$ in the ambient category of <A>S</A>.
#! @Arguments J
#! @Returns a &CAP; morphism
DeclareAttribute( "DualOverTensorUnit",
        IsCapCategoryMorphism );

CapJitAddTypeSignature( "DualOverTensorUnit", [ IsCapCategory, IsCapCategoryMorphism ], function ( input_types )
    
    return CapJitDataTypeOfMorphismOfCategory( input_types[1].category );
    
end );

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
        [ IsObjectInSliceCategoryOverTensorUnit, IsObjectInSliceCategoryOverTensorUnit ] );

####################################
#
#! @Section Constructors
#
####################################

#! @Arguments mor, S
DeclareOperation( "AsSliceCategoryCell",
        [ IsCapCategoryMorphism, IsSliceCategory ] );

#! @Arguments mor, S
DeclareOperation( "/",
        [ IsCapCategoryMorphism, IsSliceCategory ] );

#! @Arguments A, mor, B
DeclareOperation( "AsSliceCategoryCell",
        [ IsObjectInASliceCategory, IsCapCategoryMorphism, IsObjectInASliceCategory ] );
