LoadPackage( "FunctorCategories" );

omega := SubobjectClassifier( FinQuivers );

EnableTimingStatistics( FinQuivers );

Display( "Computing MorphismsOfExternalHom( FinQuivers, SubobjectClassifier( FinQuivers ), SubobjectClassifier( FinQuivers ) )..." );

list_of_subobjects := MorphismsOfExternalHom( FinQuivers, omega, omega );

Assert( 0, Length( list_of_subobjects ) = 39 );

DisplayTimingStatistics( FinQuivers );
