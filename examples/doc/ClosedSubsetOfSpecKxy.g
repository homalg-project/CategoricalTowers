#! @Chunk ClosedKxy

LoadPackage( "ZariskiFrames" );

#! @Example
R := HomalgFieldOfRationalsInSingular( ) * "x,y";
#! Q[x,y]
ZC := ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows( R );
#! The coframe of Zariski closed subsets of the affine spectrum of Q[x,y]
A := ClosedSubsetOfSpecByReducedMorphism( HomalgMatrix( "[ x ]", 1, 1, R ) );
#! V_{Q[x,y]}( <...> )
B := ClosedSubsetOfSpec( "[ x^2 ]", R );
#! V_{Q[x,y]}( <...> )
A = B;
#! true
C := ClosedSubsetOfSpecByReducedMorphism( "[ y ]", R );
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
F := DistinguishedLocallyClosedApproximation( -( A * C ) );
#! V_{Q[x,y]}( I ) \ V_{Q[x,y]}( J )
Display( F );
#! V( <> ) \ V( <y> )
#! @EndExample
