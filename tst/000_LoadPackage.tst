gap> LoadPackage( "CatReps", false );
#I  method installed for UnderlyingField matches more than one declaration
#I  method installed for + matches more than one declaration
#I  method installed for IsZero matches more than one declaration
#I  method installed for InverseMutable matches more than one declaration
#I  method installed for IsZero matches more than one declaration
#I  method installed for + matches more than one declaration
#I  method installed for InverseMutable matches more than one declaration
#I  method installed for IsZero matches more than one declaration
#I  method installed for + matches more than one declaration
#I  method installed for InverseMutable matches more than one declaration
true
gap> package_loading_info_level := InfoLevel( InfoPackageLoading );;
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_INFO );;
gap> LoadPackage( "CatReps" );
true
gap> SetInfoLevel( InfoPackageLoading, package_loading_info_level );;
