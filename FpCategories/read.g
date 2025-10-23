# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Reading the implementation part of the package.
#

ReadPackage( "FpCategories", "gap/precompiled_categories/CategoryFromNerveDataPrecompiled.gi" );
ReadPackage( "FpCategories", "gap/precompiled_categories/CategoryFromNerveDataHomStructureOnMorphismsPrecompiled.gi" );

ReadPackage( "FpCategories", "gap/Quivers.gi");
ReadPackage( "FpCategories", "gap/PathCategories.gi");
ReadPackage( "FpCategories", "gap/GroebnerBasesForPathCategories.gi");
ReadPackage( "FpCategories", "gap/QuotientsOfPathCategories.gi");
ReadPackage( "FpCategories", "gap/CategoryFromNerveData.gi");
ReadPackage( "FpCategories", "gap/Tools.gi");
ReadPackage( "FpCategories", "gap/ToolsMethodRecord.gi");
ReadPackage( "FpCategories", "gap/ToolsMethodRecordInstallations.autogen.gi");
ReadPackage( "FpCategories", "gap/ToolsDerivedMethods.gi");
ReadPackage( "FpCategories", "gap/SimplicialCategory.gi");

#= comment for Julia
if IsPackageMarkedForLoading( "Digraphs", ">= 1.3.1" ) then
    ReadPackage( "FpCategories", "gap/ToolsUsingDigraphs.gi");
fi;

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "FpCategories", "gap/Julia.gi" );
fi;
# =#
