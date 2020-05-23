#
# Algebroids: Algebroids with extra structure
#
# Reading the declaration part of the package.
#

ReadPackage( "Algebroids", "gap/Algebroids.gd");
ReadPackage( "Algebroids", "gap/Bialgebroids.gd");
ReadPackage( "Algebroids", "gap/Functors.gd");

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "Algebroids", "gap/Julia.gd" );
fi;
