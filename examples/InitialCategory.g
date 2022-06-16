#! @Chunk InitialCategory

LoadPackage( "Toposes" );

#! @Example
I := InitialCategory( );
#! InitialCategory( )
IsInitialCategory( I );
#! true
InfoOfInstalledOperationsOfCategory( I );
#! 0 primitive operations were used to derive 5 operations for this category
OI := Opposite( I );
#! Opposite of InitialCategory( )
IsInitialCategory( OI );
#! true
InfoOfInstalledOperationsOfCategory( OI );
#! 9 primitive operations were used to derive 9 operations for this category
#! @EndExample
