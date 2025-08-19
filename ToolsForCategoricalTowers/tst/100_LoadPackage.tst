# SPDX-License-Identifier: GPL-2.0-or-later
# ToolsForCategoricalTowers: Tools for CategoricalTowers
#
# This file tests if the package can be loaded without errors or warnings.
#
# do not load suggested dependencies automatically
gap> PushOptions( rec( OnlyNeeded := true ) );
gap> package_loading_info_level := InfoLevel( InfoPackageLoading );;
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_ERROR );;
gap> LoadPackage( "Digraphs", false );
true
gap> LoadPackage( "FinSetsForCAP", false );
true
gap> LoadPackage( "FreydCategoriesForCAP", false );
true
gap> LoadPackage( "SubcategoriesForCAP", false );
true
gap> LoadPackage( "ToolsForCategoricalTowers", false );
true
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_INFO );;
gap> LoadPackage( "Digraphs" );
true
gap> LoadPackage( "FinSetsForCAP" );
true
gap> LoadPackage( "FreydCategoriesForCAP" );
true
gap> LoadPackage( "SubcategoriesForCAP" );
true
gap> LoadPackage( "ToolsForCategoricalTowers" );
true
gap> SetInfoLevel( InfoPackageLoading, package_loading_info_level );;
