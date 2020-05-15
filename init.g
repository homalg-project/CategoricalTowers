#
# LazyCategories
#
# Reading the declaration part of the package.
#

ReadPackage( "LazyCategories", "gap/LazyCategory.gd");

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "LazyCategories", "gap/Julia.gd");
fi;
