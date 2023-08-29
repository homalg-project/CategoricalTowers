# SPDX-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Declarations
#

#! @Chapter Modules over the internal exterior algebra

####################################
##
#! @Section GAP Categories
##
####################################

## categories

#!
DeclareCategory( "IsCategoryOfEModules", IsCategoryOfInternalModules );

#!
DeclareCategory( "IsCategoryOfLeftEModules", IsCategoryOfEModules and IsCategoryOfInternalLeftModules );

#!
DeclareCategory( "IsCategoryOfRightEModules", IsCategoryOfEModules and IsCategoryOfInternalRightModules );

## cells

#!
DeclareCategory( "IsEModuleCell", IsInternalModuleCell );

## objects

#!
DeclareCategory( "IsEModule", IsEModuleCell and IsInternalModule );

#!
DeclareCategory( "IsLeftEModule", IsEModule and IsInternalLeftModule );

#!
DeclareCategory( "IsRightEModule", IsEModule and IsInternalRightModule );

## morphisms

#!
DeclareCategory( "IsEModuleMorphism", IsEModuleCell and IsInternalModuleMorphism );

#!
DeclareCategory( "IsLeftEModuleMorphism", IsEModuleMorphism and IsInternalLeftModuleMorphism );

#!
DeclareCategory( "IsRightEModuleMorphism", IsEModuleMorphism and IsInternalRightModuleMorphism );

####################################
##
#! @Section Constructors
##
####################################

## categories

#! @Arguments V
#! @Returns a &CAP; category in the filter <C>IsCategoryOfLeftEModules</C>
DeclareAttribute( "CategoryOfLeftEModules", IsCapCategoryObject );

#! @Arguments V
#! @Returns a &CAP; category in the filter <C>IsCategoryOfRightEModules</C>
DeclareAttribute( "CategoryOfRightEModules", IsCapCategoryObject );
