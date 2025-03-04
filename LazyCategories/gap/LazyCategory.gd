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
#!  The &GAP; category of a lazy category.
DeclareCategory( "IsLazyCategory",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a lazy category.
DeclareCategory( "IsCellInLazyCategory",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a lazy category.
DeclareCategory( "IsObjectInLazyCategory",
        IsCellInLazyCategory and IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a lazy category.
DeclareCategory( "IsMorphismInLazyCategory",
        IsCellInLazyCategory and IsCapCategoryMorphism );

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
        IsLazyCategory );

#!
DeclareAttribute( "GenesisOfCell",
        IsCellInLazyCategory );

# Do not turn GenesisOfCellOperation into an attribute
# for InfoOfObject to stay readable
#!
DeclareOperation( "GenesisOfCellOperation",
        [ IsCellInLazyCategory ] );

# Do not turn GenesisOfCellArguments into an attribute
# for InfoOfObject to stay readable
#!
DeclareOperation( "GenesisOfCellArguments",
        [ IsCellInLazyCategory ] );

#!
DeclareAttribute( "ListOfEvaluationNodes",
        IsCellInLazyCategory );

#!
DeclareAttribute( "DigraphOfEvaluation",
        IsCellInLazyCategory );

#!
DeclareGlobalFunction( "_EvaluationOfCell" );

#!
DeclareAttribute( "EvaluatedCell",
        IsCellInLazyCategory );

####################################
#
#! @Section Constructors
#
####################################

DeclareOperation( "AsObjectInLazyCategory",
                  [ IsLazyCategory, IsCapCategoryObject ] );

DeclareOperation( "AsObjectInLazyCategory",
                  [ IsLazyCategory, IsString, IsList ] );

DeclareOperation( "AsMorphismInLazyCategory",
                  [ IsLazyCategory, IsCapCategoryMorphism ] );

DeclareOperation( "AsMorphismInLazyCategory",
                  [ IsObjectInLazyCategory, IsCapCategoryMorphism, IsObjectInLazyCategory ] );

DeclareOperation( "AsMorphismInLazyCategory",
                  [ IsObjectInLazyCategory, IsString, IsList, IsObjectInLazyCategory ] );

#!
DeclareOperation( "\/",
                [ IsCapCategoryCell, IsLazyCategory ] );

#!
DeclareOperation( "LazyCategory",
                  [ IsCapCategory ] );

#!
DeclareOperation( "EmbeddingFunctorOfUnderlyingCategory",
                  [ IsCapCategory ] );

####################################
#
#! @Section Operations
#
####################################

#!
DeclareOperation( "SetLabel",
                [ IsCellInLazyCategory, IsString ] );

#!
DeclareOperation( "GetLabel",
                [ IsCapCategoryCell ] );

#!
DeclareOperation( "IsEqualForCells",
                  [ IsObject, IsObject ] );

#!
DeclareOperation( "Visualize",
                  [ IsCellInLazyCategory ] );

####################################
#
#! @Section Tools
#
####################################

DeclareGlobalFunction( "AreEqualForLazyCells" );

DeclareOperation( "PositionsOfParentsOfALazyCell",
        [ IsList, IsCellInLazyCategory ] );

DeclareOperation( "PositionsOfParentsOfALazyCell",
        [ IsList, IsList ] );

DeclareGlobalFunction( "CAP_INTERNAL_COMPACT_NAME_OF_CATEGORICAL_OPERATION" );
