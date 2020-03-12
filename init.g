#
# SubcategoriesForCAP
#
# Reading the declaration part of the package.
#

ReadPackage( "SubcategoriesForCAP", "gap/Subcategory.gd");
ReadPackage( "SubcategoriesForCAP", "gap/FullSubcategory.gd");
ReadPackage( "SubcategoriesForCAP", "gap/FunctorsForFullSubcategories.gd");

if IsPackageMarkedForLoading( "Locales", ">= 2019.11.15" ) and
    IsPackageMarkedForLoading( "FreydCategoriesForCAP", ">= 2019.11.02" ) then
     
  ReadPackage( "SubcategoriesForCAP", "gap/SliceCategory.gd");
  ReadPackage( "SubcategoriesForCAP", "gap/Proset.gd");
  
fi;
