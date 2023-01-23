# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Reading the implementation part of the package.
#

ReadPackage( "FunctorCategories", "gap/precompiled_categories/FinBouquetsPrecompiled.gi");
ReadPackage( "FunctorCategories", "gap/precompiled_categories/FinQuiversPrecompiled.gi");
ReadPackage( "FunctorCategories", "gap/precompiled_categories/FinQuiversAsCCCPrecompiled.gi");
ReadPackage( "FunctorCategories", "gap/precompiled_categories/FinReflexiveQuiversPrecompiled.gi");
ReadPackage( "FunctorCategories", "gap/precompiled_categories/FinReflexiveQuiversAsCCCPrecompiled.gi");
ReadPackage( "FunctorCategories", "gap/precompiled_categories/PreSheavesOfFpCategoryInSkeletalFinSetsPrecompiled.gi");
ReadPackage( "FunctorCategories", "gap/precompiled_categories/PreSheavesOfFreeAlgebroidInCategoryOfRowsPrecompiled.gi");
ReadPackage( "FunctorCategories", "gap/precompiled_categories/PreSheavesOfAlgebroidWithRelationsInCategoryOfRowsPrecompiled.gi");

ReadPackage( "FunctorCategories", "gap/Tools.gi");
ReadPackage( "FunctorCategories", "gap/ToolsMethodRecord.gi");
ReadPackage( "FunctorCategories", "gap/ToolsDerivedMethods.gi");

ReadPackage( "FunctorCategories", "gap/PreSheaves.gi");
ReadPackage( "FunctorCategories", "gap/HomStructure.gi");
ReadPackage( "FunctorCategories", "gap/FunctorCategories.gi");
ReadPackage( "FunctorCategories", "gap/CoPreSheaves.gi");
ReadPackage( "FunctorCategories", "gap/FiniteCocompletion.gi");
ReadPackage( "FunctorCategories", "gap/CategoryOfBouquets.gi");
ReadPackage( "FunctorCategories", "gap/CategoryOfQuivers.gi");
ReadPackage( "FunctorCategories", "gap/CategoryOfDecoratedQuivers.gi");
ReadPackage( "FunctorCategories", "gap/CategoryOfReflexiveQuivers.gi");
ReadPackage( "FunctorCategories", "gap/FiniteCompletion.gi");
ReadPackage( "FunctorCategories", "gap/AbelianClosure.gi");
ReadPackage( "FunctorCategories", "gap/Functors.gi");
ReadPackage( "FunctorCategories", "gap/DirectSumDecomposition.gi");
ReadPackage( "FunctorCategories", "gap/HomologicalMethods.gi");

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "FunctorCategories", "gap/Julia.gi" );
fi;
