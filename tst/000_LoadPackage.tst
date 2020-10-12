# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# This file tests if the package can be loaded without errors or warnings.
#
gap> package_loading_info_level := InfoLevel( InfoPackageLoading );;
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_ERROR );;
gap> LoadPackage( "CategoryConstructor", false );
true
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_INFO );;
gap> LoadPackage( "CategoryConstructor" );
true
gap> SetInfoLevel( InfoPackageLoading, package_loading_info_level );;
gap> HOMALG_IO.show_banners := false;;
