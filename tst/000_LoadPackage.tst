# SPDX-License-Identifier: GPL-2.0-or-later
# LazyCategories: Construct an equivalent lazy category out of a CAP category
#
# This file tests if the package can be loaded without errors or warnings.
#
gap> package_loading_info_level := InfoLevel( InfoPackageLoading );;
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_ERROR );;
gap> LoadPackage( "LazyCategories", false );
true
gap> LoadPackage( "LinearAlgebraForCAP", false );
true
gap> LoadPackage( "GeneralizedMorphismsForCAP", false );
true
gap> LoadPackage( "FreydCategoriesForCAP", false );
true
gap> LoadPackage( "Algebroids", false );
true
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_INFO );;
gap> LoadPackage( "LazyCategories" );
true
gap> LoadPackage( "LinearAlgebraForCAP" );
true
gap> LoadPackage( "GeneralizedMorphismsForCAP" );
true
gap> LoadPackage( "FreydCategoriesForCAP" );
true
gap> LoadPackage( "Algebroids" );
true
gap> SetInfoLevel( InfoPackageLoading, package_loading_info_level );;
