gap> LoadPackage( "CatReps", false );
true
gap> package_loading_info_level := InfoLevel( InfoPackageLoading );;
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_INFO );;
gap> LoadPackage( "CatReps" );
true
gap> SetInfoLevel( InfoPackageLoading, package_loading_info_level );;
