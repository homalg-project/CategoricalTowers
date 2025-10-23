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

#= comment for Julia
if IsPackageMarkedForLoading( "Digraphs", ">= 1.3.1" ) then
    ReadPackage( "FpCategories", "gap/ToolsUsingDigraphs.gd");
fi;
# =#
