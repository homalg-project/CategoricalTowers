# SPDX-License-Identifier: GPL-2.0-or-later
# SubcategoriesForCAP: Subcategory and other related constructors for CAP categories
#
# This file tests if the package can be loaded without errors or warnings.
#
gap> package_loading_info_level := InfoLevel( InfoPackageLoading );;
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_ERROR );;
gap> LoadPackage( "SubcategoriesForCAP", false );
true
gap> LoadPackage( "Locales", false );
true
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_INFO );;
gap> LoadPackage( "SubcategoriesForCAP" );
true
gap> LoadPackage( "Locales" );
true
gap> SetInfoLevel( InfoPackageLoading, package_loading_info_level );;
gap> HOMALG_IO.show_banners := false;;
