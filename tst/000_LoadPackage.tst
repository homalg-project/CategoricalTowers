gap> LoadPackage( "LazyCategories", false );
true
gap> package_loading_info_level := InfoLevel( InfoPackageLoading );;
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_INFO );;
gap> LoadPackage( "LazyCategories" );
true
gap> SetInfoLevel( InfoPackageLoading, package_loading_info_level );;
