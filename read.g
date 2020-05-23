#
# Algebroids: Algebroids with extra structure
#
# Reading the implementation part of the package.
#

ReadPackage( "Algebroids", "gap/Algebroids.gi");
ReadPackage( "Algebroids", "gap/Bialgebroids.gi");
ReadPackage( "Algebroids", "gap/QPA2.gi");
ReadPackage( "Algebroids", "gap/Functors.gi");

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "Algebroids", "gap/Julia.gi" );
fi;
