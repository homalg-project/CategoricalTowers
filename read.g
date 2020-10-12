# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Reading the implementation part of the package.
#

ReadPackage( "FunctorCategories", "gap/FunctorCategories.gi");
ReadPackage( "FunctorCategories", "gap/HomStructure.gi");
ReadPackage( "FunctorCategories", "gap/Functors.gi");
ReadPackage( "FunctorCategories", "gap/DirectSumDecomposition.gi");

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "FunctorCategories", "gap/Julia.gi" );
fi;
