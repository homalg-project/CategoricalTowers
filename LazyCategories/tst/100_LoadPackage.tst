# SPDX-License-Identifier: GPL-2.0-or-later
# LazyCategories: Construct an equivalent lazy category out of a CAP category
#
# This file tests if the package can be loaded without errors or warnings.
#
# do not load suggested dependencies automatically
gap> PushOptions( rec( OnlyNeeded := true ) );
gap> package_loading_info_level := InfoLevel( InfoPackageLoading );;
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_ERROR );;
gap> LoadPackage( "LinearAlgebraForCAP", false );
true
gap> LoadPackage( "GeneralizedMorphismsForCAP", false );
true
gap> LoadPackage( "Algebroids", false );
true
gap> LoadPackage( "GRAPE", false );
true
gap> LoadPackage( "Digraphs", false );
true
gap> LoadPackage( "Locales", false );
true
gap> LoadPackage( "SubcategoriesForCAP", false );
true
gap> LoadPackage( "LazyCategories", false );
true
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_INFO );;
gap> LoadPackage( "LinearAlgebraForCAP" );
true
gap> LoadPackage( "GeneralizedMorphismsForCAP" );
true
gap> LoadPackage( "Algebroids" );
true
gap> LoadPackage( "GRAPE" );
true
gap> LoadPackage( "Digraphs" );
true
gap> LoadPackage( "Locales" );
true
gap> LoadPackage( "SubcategoriesForCAP" );
true
gap> LoadPackage( "LazyCategories" );
true
gap> SetInfoLevel( InfoPackageLoading, package_loading_info_level );;
