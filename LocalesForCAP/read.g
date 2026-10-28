# SPDX-License-Identifier: GPL-2.0-or-later
# LocalesForCAP: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Reading the implementation part of the package.
#

ReadPackage( "LocalesForCAP", "gap/ProsetMethodRecord.gi");
ReadPackage( "LocalesForCAP", "gap/ProsetMethodRecordInstallations.autogen.gi");
ReadPackage( "LocalesForCAP", "gap/Proset.gi");
ReadPackage( "LocalesForCAP", "gap/ProsetDerivedMethods.gi");

ReadPackage( "LocalesForCAP", "gap/PosetMethodRecord.gi");
ReadPackage( "LocalesForCAP", "gap/PosetMethodRecordInstallations.autogen.gi");
ReadPackage( "LocalesForCAP", "gap/Poset.gi");
ReadPackage( "LocalesForCAP", "gap/PosetDerivedMethods.gi");

ReadPackage( "LocalesForCAP", "gap/Lattice.gi");
ReadPackage( "LocalesForCAP", "gap/LatticeDerivedMethods.gi");

ReadPackage( "LocalesForCAP", "gap/HeytingAlgebraMethodRecord.gi");
ReadPackage( "LocalesForCAP", "gap/CoHeytingAlgebraMethodRecord.gi");

ReadPackage( "LocalesForCAP", "gap/HeytingAlgebraMethodRecordInstallations.autogen.gi");
ReadPackage( "LocalesForCAP", "gap/CoHeytingAlgebraMethodRecordInstallations.autogen.gi");

ReadPackage( "LocalesForCAP", "gap/HeytingAlgebra.gi");
ReadPackage( "LocalesForCAP", "gap/CoHeytingAlgebra.gi");

ReadPackage( "LocalesForCAP", "gap/HeytingAlgebraDerivedMethods.gi");
ReadPackage( "LocalesForCAP", "gap/CoHeytingAlgebraDerivedMethods.gi");

ReadPackage( "LocalesForCAP", "gap/BooleanAlgebraMethodRecord.gi");
ReadPackage( "LocalesForCAP", "gap/BooleanAlgebraMethodRecordInstallations.autogen.gi");
ReadPackage( "LocalesForCAP", "gap/BooleanAlgebra.gi");
ReadPackage( "LocalesForCAP", "gap/BooleanAlgebraDerivedMethods.gi");

ReadPackage( "LocalesForCAP", "gap/Tools.gi");

ReadPackage( "LocalesForCAP", "gap/ProsetOfCategory.gi");

ReadPackage( "LocalesForCAP", "gap/Differences.gi");
ReadPackage( "LocalesForCAP", "gap/SingleDifferences.gi");
ReadPackage( "LocalesForCAP", "gap/MultipleDifferences.gi");

ReadPackage( "LocalesForCAP", "gap/ConstructibleObjects.gi");
ReadPackage( "LocalesForCAP", "gap/ConstructibleObjectsAsUnionOfSingleDifferences.gi");
ReadPackage( "LocalesForCAP", "gap/ConstructibleObjectsAsUnionOfMultipleDifferences.gi");

ReadPackage( "LocalesForCAP", "gap/IntervalCategory.gi");

ReadPackage( "LocalesForCAP", "gap/ProsetAsCategory.gi");

#= comment for Julia
if IsPackageMarkedForLoading( "Digraphs", ">= 1.3.1" ) then
    ReadPackage( "LocalesForCAP", "gap/ToolsUsingDigraphs.gi");
fi;

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) and IsPackageMarkedForLoading( "Digraphs", ">= 1.3.1" ) then
    ReadPackage( "LocalesForCAP", "gap/JuliaWithDigraphs.gi");
fi;
# =#
