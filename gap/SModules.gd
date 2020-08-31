############################################################################
##
## InternalModules package
##
## Copyright 2019, Mohamed Barakat, University of Siegen
##
#! @Chapter Modules over the internal symmetric algebra
##
#############################################################################

####################################
##
#! @Section GAP Categories
##
####################################

## categories

#!
DeclareCategory( "IsCategoryOfSModules", IsCategoryOfInternalModules );

#!
DeclareCategory( "IsCategoryOfLeftSModules", IsCategoryOfSModules and IsCategoryOfInternalLeftModules );

#!
DeclareCategory( "IsCategoryOfRightSModules", IsCategoryOfSModules and IsCategoryOfInternalRightModules );

## cells

#!
DeclareCategory( "IsSModuleCell", IsInternalModuleCell );

## objects

#!
DeclareCategory( "IsSModule", IsSModuleCell and IsInternalModule );

#!
DeclareCategory( "IsLeftSModule", IsSModule and IsInternalLeftModule );

#!
DeclareCategory( "IsRightSModule", IsSModule and IsInternalRightModule );

## morphisms

#!
DeclareCategory( "IsSModuleMorphism", IsSModuleCell and IsInternalModuleMorphism );

#!
DeclareCategory( "IsLeftSModuleMorphism", IsSModuleMorphism and IsInternalLeftModuleMorphism );

#!
DeclareCategory( "IsRightSModuleMorphism", IsSModuleMorphism and IsInternalRightModuleMorphism );

####################################
##
#! @Section Constructors
##
####################################

## categories

#! @Arguments V
#! @Returns a &CAP; category in the filter <C>IsCategoryOfLeftSModules</C>
DeclareAttribute( "CategoryOfLeftSModules", IsCapCategoryObject );

#! @Arguments V
#! @Returns a &CAP; category in the filter <C>IsCategoryOfRightSModules</C>
DeclareAttribute( "CategoryOfRightSModules", IsCapCategoryObject );
