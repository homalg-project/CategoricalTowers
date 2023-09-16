LoadPackage( "ZariskiFrames" );

zz := HomalgRingOfIntegersInSingular( );

R := zz * "a2,a4,a5,a8,a10";

A := AsMultipleDifference( ClosedSubsetOfSpec( "a8*a10-a8+a10,a2*a10-a10+1,a2*a8+1,a4*a5+a4*a10-a5*a10-a4+a5", R ) -
ClosedSubsetOfSpec( "a10+1", R ) );
A := A - ClosedSubsetOfSpec( "a4", R );
A := A - ClosedSubsetOfSpec( "a4*a10-a5*a10+a4", R );
A := A - ClosedSubsetOfSpec( "a4*a8-a10", R );
A := A - ClosedSubsetOfSpec( "a4*a8-a4*a10+a5*a10", R );
A := A - ClosedSubsetOfSpec( "a4*a8^2+a10", R );
A := A - ClosedSubsetOfSpec( "a4*a8^2-1", R );
A := A - ClosedSubsetOfSpec( "a4-1", R );
A := A - ClosedSubsetOfSpec( "a8", R );

B := AsMultipleDifference( ClosedSubsetOfSpec( "a8*a10-a8+a10,a2*a10-a10+1,a2*a8+1,a4*a5+a4*a10-a5*a10-a4+a5", R ) -
ClosedSubsetOfSpec( "2*a5+a10-1", R ) );
B := B - ClosedSubsetOfSpec( "a10+1", R );
B := B - ClosedSubsetOfSpec( "a2-a4-a10+1", R );
B := B - ClosedSubsetOfSpec( "a4*a10-a5*a10+a4", R );
B := B - ClosedSubsetOfSpec( "a4*a10-a5*a10+a5", R );
B := B - ClosedSubsetOfSpec( "a4*a8-a5*a8-a4*a10+a5*a10-a5", R );
B := B - ClosedSubsetOfSpec( "a4-1", R );
B := B - ClosedSubsetOfSpec( "a5", R );

Assert( 0, A = B );
