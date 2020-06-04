#
# CategoryConstructor: Category constructor
#
# Reading the implementation part of the package.
#

ReadPackage( "CategoryConstructor", "gap/CategoryConstructor.gi");
ReadPackage( "CategoryConstructor", "gap/Tools.gi");

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "CategoryConstructor", "gap/Julia.gi" );
fi;
