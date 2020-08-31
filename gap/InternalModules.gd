#
# InternalModules: Modules over internal algebras
#
# Declarations
#

#! @Chapter Modules over internal algebras

####################################
##
#! @Section GAP Categories
##
####################################

## categories

#!
DeclareCategory( "IsCategoryOfInternalModules", IsCapCategory );

#!
DeclareCategory( "IsCategoryOfInternalLeftModules", IsCategoryOfInternalModules );

#!
DeclareCategory( "IsCategoryOfInternalRightModules", IsCategoryOfInternalModules );

#!
DeclareCategory( "IsInternalModuleCell", IsCapCategoryCell );

## objects

#!
DeclareCategory( "IsInternalModule", IsInternalModuleCell and IsCapCategoryObject );

#!
DeclareCategory( "IsInternalLeftModule", IsInternalModule and IsLeftActionObject );

#!
DeclareCategory( "IsInternalRightModule", IsInternalModule and IsRightActionObject );

## morphisms

#!
DeclareCategory( "IsInternalModuleMorphism", IsInternalModuleCell and IsCapCategoryMorphism );

#!
DeclareCategory( "IsInternalLeftModuleMorphism", IsInternalModuleMorphism and IsLeftActionMorphism );

#!
DeclareCategory( "IsInternalRightModuleMorphism", IsInternalModuleMorphism and IsRightActionMorphism );

####################################
##
#! @Section Constructors
##
####################################

## objects

#! @Arguments alpha, AMod
#! @Returns a &CAP; category object in filter <C>IsInternalModule</C>
DeclareOperation( "InternalModule",
        [ IsCapCategoryMorphism, IsCategoryOfInternalModules ] );

#! @Arguments U, AMod
#! @Group FreeInternalModule
DeclareOperationWithCache( "FreeInternalModule",
        [ IsCapCategoryObject, IsCategoryOfInternalModules ] );

# graded version
#! @Arguments U, degree, AMod
#! @Group FreeInternalModule
DeclareOperationWithCache( "FreeInternalModule",
        [ IsCapCategoryObject, IsInt, IsCategoryOfInternalModules ] );

## morphisms

#! @Arguments M, phi, N
#! @Returns a &CAP; category morphism in filter <C>IsInternalModuleMorphism</C>
DeclareOperation( "InternalModuleMorphism",
        [ IsInternalModule, IsCapCategoryMorphism, IsInternalModule ] );

####################################
##
#! @Section Attributes
##
####################################

####################################
##
#! @Section Operations
##
####################################

#! @Arguments U, SVmod
#! @Group FreeInternalModuleActionMorphism
DeclareOperation( "FreeInternalModuleActionMorphism",
        [ IsCapCategoryObject, IsCategoryOfInternalModules ] );

# graded version
#! @Arguments U, degree, SVmod
#! @Returns a morphism in a positively Z-graded category
#! @Group FreeInternalModuleActionMorphism
DeclareOperation( "FreeInternalModuleActionMorphism",
        [ IsCapCategoryObject, IsInt, IsCategoryOfInternalModules ] );

#! @Arguments phi, M
#! @Returns a &CAP; morphism
#! @Group UniversalMorphismFromFreeModule
DeclareOperation( "UniversalMorphismFromFreeModule",
        [ IsCapCategoryMorphism, IsInternalModule ] );

# graded version
#! @Arguments M, chi, degree, i
#! @Group UniversalMorphismFromFreeModule
DeclareOperation( "UniversalMorphismFromFreeModule",
        [ IsInternalModule, IsObject, IsInt, IsInt ] );

# graded version
#! @Arguments M, chi, i
#! @Group UniversalMorphismFromFreeModule
DeclareOperation( "UniversalMorphismFromFreeModule",
        [ IsInternalModule, IsObject, IsInt ] );

# graded version
#! @Arguments M, degree
#! @Group UniversalMorphismFromFreeModule
DeclareOperation( "UniversalMorphismFromFreeModule",
        [ IsInternalModule, IsInt ] );

####################################
##
## Helpers for grading
##
####################################

#! @Description
#!  The <A>i</A>-th degree part of the cell (=object or morphism) <A>c</A>.
#! @Arguments c, n
#! @Returns a &CAP; category
DeclareOperation( "[]",
        [ IsInternalModuleCell, IsInt ] );

#! @Description
#!  The <A>L</A>-th sublist of the cell (=object or morphism) <A>c</A>.
#! @Arguments c, L
#! @Returns a &CAP; category
DeclareOperation( "Sublist",
        [ IsInternalModuleCell, IsList ] );

#! @Arguments cell, degree
#! @Returns true or a list
#! @Group IsWellDefined
DeclareOperation( "IsWellDefined",
        [ IsInternalModuleCell, IsInt ] );

#! @Arguments cell, L
#! @Returns true or a list
#! @Group IsWellDefined
DeclareOperation( "IsWellDefined",
        [ IsInternalModuleCell, IsList ] );
