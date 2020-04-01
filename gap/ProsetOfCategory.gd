#
# SubcategoriesForCAP: The proset/poset of a category
#
# Declarations
#

#! @Chapter The proset/poset of a category

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of a proset or poset of a CAP category.
DeclareCategory( "IsProsetOrPosetOfCapCategory",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a proset or poset of a CAP category.
DeclareCategory( "IsCapCategoryCellInProsetOrPosetOfACategory",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a proset or poset of a CAP category.
DeclareCategory( "IsCapCategoryObjectInProsetOrPosetOfACategory",
        IsCapCategoryCellInProsetOrPosetOfACategory and IsObjectInThinCategory );

#! @Description
#!  The &GAP; category of a proset of a CAP category.
DeclareCategory( "IsProsetOfCapCategory",
        IsProsetOrPosetOfCapCategory );

#! @Description
#!  The &GAP; category of cells in a proset of a CAP category.
DeclareCategory( "IsCapCategoryCellInProsetOfACategory",
        IsCapCategoryCellInProsetOrPosetOfACategory );

#! @Description
#!  The &GAP; category of objects in a proset of a CAP category.
DeclareCategory( "IsCapCategoryObjectInProsetOfACategory",
        IsCapCategoryCellInProsetOfACategory and IsCapCategoryObjectInProsetOrPosetOfACategory );

#! @Description
#!  The &GAP; category of morphisms in a proset of a CAP category.
DeclareCategory( "IsCapCategoryMorphismInProsetOfACategory",
        IsCapCategoryCellInProsetOfACategory and IsMorphismInThinCategory );

#! @Description
#!  The &GAP; category of a poset of a CAP category.
DeclareCategory( "IsPosetOfCapCategory",
        IsProsetOrPosetOfCapCategory );

#! @Description
#!  The &GAP; category of cells in a poset of a CAP category.
DeclareCategory( "IsCapCategoryCellInPosetOfACategory",
        IsCapCategoryCellInProsetOrPosetOfACategory );

#! @Description
#!  The &GAP; category of objects in a poset of a CAP category.
DeclareCategory( "IsCapCategoryObjectInPosetOfACategory",
        IsCapCategoryCellInPosetOfACategory and IsCapCategoryObjectInProsetOrPosetOfACategory );

#! @Description
#!  The &GAP; category of morphisms in a poset of a CAP category.
DeclareCategory( "IsCapCategoryMorphismInPosetOfACategory",
        IsCapCategoryCellInPosetOfACategory and IsMorphismInThinCategory );

####################################
#
#! @Section Global variables
#
####################################

#!
DeclareGlobalVariable( "CAP_INTERNAL_METHOD_NAME_LIST_FOR_PREORDERED_SET_OF_CATEGORY" );

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
        IsProsetOrPosetOfCapCategory );

#! @Description
#!  The ambient category of the proset <A>P</A>.
#! @Arguments P
#! @Returns a list
DeclareAttribute( "AmbientCategory",
        IsProsetOrPosetOfCapCategory );

####################################
#
#! @Section Constructors
#
####################################

#! @Arguments C
DeclareOperation( "CreateProsetOrPosetOfCategory",
        [ IsCapCategory ] );

#! @Arguments C
DeclareAttribute( "ProsetOfCategory",
        IsCapCategory );

#! @Arguments c
DeclareAttribute( "AsCellOfProset",
        IsCapCategoryCell );

#! @Arguments C
DeclareAttribute( "PosetOfCategory",
        IsCapCategory );

#! @Arguments c
DeclareAttribute( "AsCellOfPoset",
        IsCapCategoryCell );

#! @Arguments object, P
DeclareOperation( "/",
        [ IsCapCategoryObject, IsProsetOrPosetOfCapCategory ] );
