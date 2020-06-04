#
# CategoryConstructor: Category constructor
#
# Reading the declaration part of the package.
#

ReadPackage( "CategoryConstructor", "gap/CategoryConstructor.gd");
ReadPackage( "CategoryConstructor", "gap/Tools.gd");

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "CategoryConstructor", "gap/Julia.gd" );
fi;
