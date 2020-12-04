# SPDX-License-Identifier: GPL-2.0-or-later
# QuotientCategories: Quotient categories of CAP categories by two-sided ideals
#
# This file tests if the package can be loaded without errors or warnings.
#
gap> package_loading_info_level := InfoLevel( InfoPackageLoading );;
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_ERROR );;
gap> LoadPackage( "QuotientCategories", false );
true
gap> LoadPackage( "ModulePresentations", false );
true
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_INFO );;
gap> LoadPackage( "QuotientCategories" );
true
gap> LoadPackage( "ModulePresentations" );
true
gap> SetInfoLevel( InfoPackageLoading, package_loading_info_level );;
