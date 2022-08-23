# SPDX-License-Identifier: GPL-2.0-or-later
# Modules: A homalg based package for the Abelian category of finitely presented modules over computable rings
#
# This file tests if the package can be loaded without errors or warnings.
#

# this is due to
# 
# IsPackageMarkedForLoading( "FreydCategoriesForCAP", ">= 2021.12-01" ) then
#   ReadPackage( "LinearAlgebraForCAP", "gap/MatrixCategoryAsAdditiveClosureOfRingAsCategory.gi" );
# fi;
# 
# in LinearAlgebraForCAP/read.g, but we need the content of that file in examples/Precompile*.g
gap> LoadPackage( "FreydCategoriesForCAP", false );
true
