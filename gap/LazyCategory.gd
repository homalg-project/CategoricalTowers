# SPDX-License-Identifier: GPL-2.0-or-later
# LazyCategories: Construct an equivalent lazy category out of a CAP category
#
# Declarations
#

#! @Chapter Create lazy hulls of a category

####################################
#
#! @Section Info class
#
####################################

DeclareInfoClass( "InfoLazyCategory" );

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of a lazy CAP category.
DeclareCategory( "IsLazyCapCategory",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a lazy CAP category.
DeclareCategory( "IsLazyCapCategoryCell",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a lazy CAP category.
DeclareCategory( "IsLazyCapCategoryObject",
        IsLazyCapCategoryCell and IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a lazy CAP category.
DeclareCategory( "IsLazyCapCategoryMorphism",
        IsLazyCapCategoryCell and IsCapCategoryMorphism );

####################################
#
#! @Section Global variables
#
####################################

#!
DeclareGlobalVariable( "RECORD_OF_COMPACT_NAMES_OF_CATEGORICAL_OPERATIONS" );

####################################
#
#! @Section Attributes
#
####################################

#!
DeclareAttribute( "UnderlyingCategory",
        IsLazyCapCategory );

#!
DeclareAttribute( "GenesisOfCellOperation",
        IsLazyCapCategoryCell );
#!
DeclareAttribute( "GenesisOfCellArguments",
        IsLazyCapCategoryCell );
#!
DeclareAttribute( "ListOfEvaluationNodes",
        IsLazyCapCategoryCell );

#!
DeclareAttribute( "DigraphOfEvaluation",
        IsLazyCapCategoryCell );

#!
DeclareAttribute( "EvaluatedCell",
        IsLazyCapCategoryCell );

####################################
#
#! @Section Constructors
#
####################################

DeclareOperation( "AsObjectInLazyCategory",
                  [ IsLazyCapCategory, IsCapCategoryObject ] );

DeclareOperation( "AsObjectInLazyCategory",
                  [ IsLazyCapCategory, IsString, IsList ] );

DeclareOperation( "AsMorphismInLazyCategory",
                  [ IsLazyCapCategory, IsCapCategoryMorphism ] );

DeclareOperation( "AsMorphismInLazyCategory",
                  [ IsLazyCapCategoryObject, IsCapCategoryMorphism, IsLazyCapCategoryObject ] );

DeclareOperation( "AsMorphismInLazyCategory",
                  [ IsLazyCapCategoryObject, IsString, IsList, IsLazyCapCategoryObject ] );

#!
DeclareOperation( "\/",
                [ IsCapCategoryCell, IsLazyCapCategory ] );

#!
DeclareOperation( "LazyCategory",
                  [ IsCapCategory ] );

####################################
#
#! @Section Operations
#
####################################

#!
DeclareOperation( "SetLabel",
                [ IsLazyCapCategoryCell, IsString ] );

#!
DeclareOperation( "GetLabel",
                [ IsCapCategoryCell ] );

#!
DeclareOperation( "IsEqualForCells",
                  [ IsObject, IsObject ] );

#!
DeclareOperation( "Visualize",
                  [ IsLazyCapCategoryCell ] );

####################################
#
#! @Section Tools
#
####################################

DeclareGlobalFunction( "AreEqualForLazyCells" );

DeclareGlobalFunction( "PositionsOfChildrenOfALazyCell" );

DeclareGlobalFunction( "CAP_INTERNAL_COMPACT_NAME_OF_CATEGORICAL_OPERATION" );
