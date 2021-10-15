# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicModules: Finitely presented modules over computable rings allowing multiple presentations and the notion of elements
#
# Declarations
#

##
DeclareCategory( "IsCategoryOfFpLeftOrRightModules",
        IsCapCategory );

##
DeclareCategory( "IsCategoryOfFpLeftModules",
        IsCategoryOfFpLeftOrRightModules );

##
DeclareCategory( "IsCategoryOfFpRightModules",
        IsCategoryOfFpLeftOrRightModules );

##
DeclareAttribute( "CategoryOfFpModules",
        IsCapCategory );

##
DeclareAttribute( "CategoryOfFpLeftModules",
        IsHomalgRing );

##
DeclareAttribute( "CategoryOfFpRightModules",
        IsHomalgRing );

##
DeclareAttribute( "FpLeftModuleByFreyd",
        IsHomalgMatrix );

##
DeclareAttribute( "FpRightModuleByFreyd",
        IsHomalgMatrix );

##
DeclareOperation( "FpModuleMorphism",
        [ IsFreydCategoryObject, IsHomalgMatrix, IsFreydCategoryObject ] );

##
DeclareOperation( "FreeFpLeftModuleByFreyd",
        [ IsInt, IsHomalgRing ] );

##
DeclareOperation( "FreeFpRightModuleByFreyd",
        [ IsInt, IsHomalgRing ] );
