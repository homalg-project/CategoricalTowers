#! @System ClosedKxy

LoadPackage( "ZariskiFrames" );

#! @Example
LoadPackage( "RingsForHomalg" );
#! true
R := HomalgFieldOfRationalsInSingular( ) * "x,y";
#! Q[x,y]
ZC := ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows( R );
#! The coframe of Zariski closed subsets of the affine spectrum of Q[x,y]
A := ClosedSubsetOfSpecByReducedMorphism( HomalgMatrix( "[ x ]", 1, 1, R ) );
#! V_{Q[x,y]}( <...> )
B := ClosedSubsetOfSpec( HomalgMatrix( "[ x^2 ]", 1, 1, R ) );
#! V_{Q[x,y]}( <...> )
C := ClosedSubsetOfSpecByReducedMorphism( HomalgMatrix( "[ y ]", 1, 1, R ) );
#! V_{Q[x,y]}( <...> )
D := ClosedSubsetOfSpec( HomalgMatrix( "[ x^2*y^3*(x-y) ]", 1, 1, R ) );
#! V_{Q[x,y]}( <...> )
T := TerminalObject( ZC );
#! V_{Q[x,y]}( <...> )
Dimension( T );
#! 2
I := InitialObject( ZC );
#! V_{Q[x,y]}( <...> )
Dimension( I );
#! -1
#! @EndExample
