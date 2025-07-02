# SPDX-License-Identifier: GPL-2.0-or-later
# CategoriesWithAmbientObjects: Categories with objects having ambient objects
#
# This file tests if the package can be loaded without errors or warnings.
#
# do not load suggested dependencies automatically
gap> PushOptions( rec( OnlyNeeded := true ) );
gap> package_loading_info_level := InfoLevel( InfoPackageLoading );;
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_ERROR );;
gap> LoadPackage( "AdditiveClosuresForCAP", false );
true
gap> LoadPackage( "ModulePresentationsForCAP", false );
true
gap> LoadPackage( "HomologicalAlgebraForCAP", false );
true
gap> LoadPackage( "RingsForHomalg", false );
true
gap> LoadPackage( "IO_ForHomalg", false );
true
gap> LoadPackage( "CategoriesWithAmbientObjects", false );
true
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_INFO );;
gap> LoadPackage( "AdditiveClosuresForCAP" );
true
gap> LoadPackage( "ModulePresentationsForCAP" );
true
gap> LoadPackage( "HomologicalAlgebraForCAP" );
true
gap> LoadPackage( "RingsForHomalg" );
true
gap> LoadPackage( "IO_ForHomalg" );
true
gap> LoadPackage( "CategoriesWithAmbientObjects" );
true
gap> SetInfoLevel( InfoPackageLoading, package_loading_info_level );;
gap> HOMALG_IO.show_banners := false;;
