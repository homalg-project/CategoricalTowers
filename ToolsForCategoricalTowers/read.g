# SPDX-License-Identifier: GPL-2.0-or-later
# ToolsForCategoricalTowers: Tools for CategoricalTowers
#
# Reading the implementation part of the package.
#

ReadPackage( "ToolsForCategoricalTowers", "gap/Tools.gi");
ReadPackage( "ToolsForCategoricalTowers", "gap/ToolsMethodRecord.gi");
ReadPackage( "ToolsForCategoricalTowers", "gap/ToolsDerivedMethods.gi");

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "ToolsForCategoricalTowers", "gap/Julia.gi" );
fi;
