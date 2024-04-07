# SPDX-License-Identifier: GPL-2.0-or-later
# SubcategoriesForCAP: Subcategory and other related constructors for CAP categories
#
# Reading the implementation part of the package.
#

ReadPackage( "SubcategoriesForCAP", "gap/Subcategory.gi");
ReadPackage( "SubcategoriesForCAP", "gap/FullSubcategory.gi");
ReadPackage( "SubcategoriesForCAP", "gap/FunctorsForFullSubcategories.gi");
ReadPackage( "SubcategoriesForCAP", "gap/KleisliReflectiveSubcategoryOfIdempotentMonad.gi");

if IsPackageMarkedForLoading( "Toposes", ">= 2020.02.19" ) and
   IsPackageMarkedForLoading( "FreydCategoriesForCAP", ">= 2019.11.02" ) then
    
  ReadPackage( "SubcategoriesForCAP", "gap/SliceCategory.gi");
  ReadPackage( "SubcategoriesForCAP", "gap/EagerSliceCategory.gi");
  ReadPackage( "SubcategoriesForCAP", "gap/LazySliceCategory.gi");
  
fi;

if IsPackageMarkedForLoading( "Digraphs", ">= 1.3.1" ) then
    ReadPackage( "SubcategoriesForCAP", "gap/ToolsUsingDigraphs.gi");
fi;
