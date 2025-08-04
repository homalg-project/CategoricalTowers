# SPDX-License-Identifier: GPL-2.0-or-later
# ToolsForCategoricalTowers: Tools for CategoricalTowers
#
# Reading the declaration part of the package.
#

ReadPackage( "ToolsForCategoricalTowers", "gap/Tools.gd" );
ReadPackage( "ToolsForCategoricalTowers", "gap/ToolsMethodRecordDeclarations.autogen.gd" );

ReadPackage( "ToolsForCategoricalTowers", "gap/ToolsUsingDigraphs.gd" );

#= comment for Julia
if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
#    ReadPackage( "ToolsForCategoricalTowers", "gap/Julia.gd" );
fi;
# =#
