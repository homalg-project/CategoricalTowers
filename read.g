#
# SubcategoriesForCAP
#
# Reading the implementation part of the package.
#

ReadPackage( "SubcategoriesForCAP", "gap/Subcategory.gi");
ReadPackage( "SubcategoriesForCAP", "gap/FullSubcategory.gi");
ReadPackage( "SubcategoriesForCAP", "gap/FunctorsForFullSubcategories.gi");

if IsPackageMarkedForLoading( "Toposes", ">= 2019.11.15" ) and
    IsPackageMarkedForLoading( "FreydCategoriesForCAP", ">= 2019.11.02" ) then
    
  ReadPackage( "SubcategoriesForCAP", "gap/SliceCategory.gi");
  
fi;
