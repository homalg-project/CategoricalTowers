# SPDX-License-Identifier: GPL-2.0-or-later
# ToolsForCategoricalTowers: Tools for CategoricalTowers
#
# Reading the implementation part of the package.
#

ReadPackage( "ToolsForCategoricalTowers", "gap/Tools.gi" );
ReadPackage( "ToolsForCategoricalTowers", "gap/ToolsMethodRecord.gi" );
ReadPackage( "ToolsForCategoricalTowers", "gap/ToolsMethodRecordInstallations.autogen.gi" );
ReadPackage( "ToolsForCategoricalTowers", "gap/ToolsDerivedMethods.gi" );

#= comment for Julia
if IsPackageMarkedForLoading( "Digraphs", ">= 1.3.1" ) then
    ReadPackage( "ToolsForCategoricalTowers", "gap/ToolsUsingDigraphs.gi" );
fi;

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "ToolsForCategoricalTowers", "gap/Julia.gi" );
fi;
# =#
