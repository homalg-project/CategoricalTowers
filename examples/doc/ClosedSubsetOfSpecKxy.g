#! @Chunk ClosedKxy

LoadPackage( "ZariskiFrames" );

#! @Example
R := HomalgFieldOfRationalsInSingular( ) * "x,y";
#! Q[x,y]
ZC := ZariskiCoframeOfAffineSpectrum( R );
#! The coframe of Zariski closed subsets of the affine spectrum of Q[x,y]
A := ClosedSubsetOfSpecByReducedColumn( HomalgMatrix( "[ x ]", 1, 1, R ) );
#! V_{Q[x,y]}( <...> )
B := ClosedSubsetOfSpec( "[ x^2 ]", R );
#! V_{Q[x,y]}( <...> )
A = B;
#! true
C := ClosedSubsetOfSpecByReducedColumn( "[ y ]", R );
#! V_{Q[x,y]}( <...> )
D := ClosedSubsetOfSpec( "[ x^2*y^3 ]", R );
#! V_{Q[x,y]}( <...> )
A + C = D;
#! true
T := TerminalObject( ZC );
#! V_{Q[x,y]}( <...> )
Dimension( T );
#! 2
I := InitialObject( ZC );
#! V_{Q[x,y]}( <...> )
Dimension( I );
#! -1
F := DistinguishedLocallyClosedPart( -( A * C ) );
#! V_{Q[x,y]}( I ) \ V_{Q[x,y]}( J )
Display( F );
#! V( <> ) \ V( <y> )
#! @EndExample
