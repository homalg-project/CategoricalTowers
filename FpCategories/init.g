# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Reading the declaration part of the package.
#

ReadPackage( "FpCategories", "gap/Quivers.gd");
ReadPackage( "FpCategories", "gap/PathCategories.gd");
ReadPackage( "FpCategories", "gap/GroebnerBasesForPathCategories.gd");
ReadPackage( "FpCategories", "gap/QuotientsOfPathCategories.gd");
ReadPackage( "FpCategories", "gap/CategoryFromNerveData.gd");
ReadPackage( "FpCategories", "gap/Tools.gd");
ReadPackage( "FpCategories", "gap/ToolsMethodRecordDeclarations.autogen.gd");
ReadPackage( "FpCategories", "gap/SimplicialCategory.gd");

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "FpCategories", "gap/Julia.gi" );
fi;
