#
# LazyCategories
#
# Reading the implementation part of the package.
#

ReadPackage( "LazyCategories", "gap/LazyCategory.gi");

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "LazyCategories", "gap/Julia.gi");
fi;
