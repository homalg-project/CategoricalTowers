# SPDX-License-Identifier: GPL-2.0-or-later
# QuotientCategories: Quotient categories of CAP categories by two-sided ideals
#
# This file tests if the package can be loaded without errors or warnings.
#
# do not load suggested dependencies automatically
gap> PushOptions( rec( OnlyNeeded := true ) );
gap> package_loading_info_level := InfoLevel( InfoPackageLoading );;
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_ERROR );;
gap> LoadPackage( "ModulePresentations", false );
true
gap> LoadPackage( "QuotientCategories", false );
true
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_INFO );;
gap> LoadPackage( "ModulePresentations" );
true
gap> LoadPackage( "QuotientCategories" );
true
gap> SetInfoLevel( InfoPackageLoading, package_loading_info_level );;
