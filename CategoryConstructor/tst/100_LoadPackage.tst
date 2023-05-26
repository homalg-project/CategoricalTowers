# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# This file tests if the package can be loaded without errors or warnings.
#
# do not load suggested dependencies automatically
gap> PushOptions( rec( OnlyNeeded := true ) );
gap> package_loading_info_level := InfoLevel( InfoPackageLoading );;
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_ERROR );;
gap> LoadPackage( "Locales", false );
true
gap> LoadPackage( "SubcategoriesForCAP", false );
true
gap> LoadPackage( "FreydCategoriesForCAP", false );
true
gap> LoadPackage( "CategoryConstructor", false );
true
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_INFO );;
gap> LoadPackage( "Locales" );
true
gap> LoadPackage( "SubcategoriesForCAP" );
true
gap> LoadPackage( "FreydCategoriesForCAP" );
true
gap> LoadPackage( "CategoryConstructor" );
true
gap> SetInfoLevel( InfoPackageLoading, package_loading_info_level );;
