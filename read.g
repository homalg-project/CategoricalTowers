#
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Reading the implementation part of the package.
#

ReadPackage( "Locales", "gap/Proset.gi");
ReadPackage( "Locales", "gap/ProsetOfCategory.gi");
ReadPackage( "Locales", "gap/Poset.gi");
ReadPackage( "Locales", "gap/Lattice.gi");
ReadPackage( "Locales", "gap/HeytingAlgebra.gi");
ReadPackage( "Locales", "gap/CoHeytingAlgebra.gi");
ReadPackage( "Locales", "gap/BooleanAlgebra.gi");
ReadPackage( "Locales", "gap/Differences.gi");
ReadPackage( "Locales", "gap/SingleDifferences.gi");
ReadPackage( "Locales", "gap/MultipleDifferences.gi");
ReadPackage( "Locales", "gap/Tools.gi");
ReadPackage( "Locales", "gap/ConstructibleObjects.gi");
ReadPackage( "Locales", "gap/ConstructibleObjectsAsUnionOfSingleDifferences.gi");
ReadPackage( "Locales", "gap/ConstructibleObjectsAsUnionOfMultipleDifferences.gi");

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "Locales", "gap/Julia.gi");
fi;
