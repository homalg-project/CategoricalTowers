# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Reading the implementation part of the package.
#

ReadPackage( "FunctorCategories", "gap/Tools.gi");
ReadPackage( "FunctorCategories", "gap/precompiled_categories/FinQuiversPrecompiled.gi");

ReadPackage( "FunctorCategories", "gap/FunctorCategories.gi");
ReadPackage( "FunctorCategories", "gap/HomStructure.gi");
ReadPackage( "FunctorCategories", "gap/Functors.gi");
ReadPackage( "FunctorCategories", "gap/DirectSumDecomposition.gi");
ReadPackage( "FunctorCategories", "gap/FiniteCocompletion.gi");
ReadPackage( "FunctorCategories", "gap/CategoryOfQuivers.gi");
ReadPackage( "FunctorCategories", "gap/FiniteCompletion.gi");
ReadPackage( "FunctorCategories", "gap/AbelianClosure.gi");
ReadPackage( "FunctorCategories", "gap/Tools.gi");

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "FunctorCategories", "gap/Julia.gi" );
fi;
