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
#! <An object in The coframe of Zariski closed subsets of the affine spectrum
#!  of Q[x,y]>
B := ClosedSubsetOfSpec( HomalgMatrix( "[ x^2 ]", 1, 1, R ) );
#! <An object in The coframe of Zariski closed subsets of the affine spectrum
#!  of Q[x,y]>
C := ClosedSubsetOfSpecByReducedMorphism( HomalgMatrix( "[ y ]", 1, 1, R ) );
#! <An object in The coframe of Zariski closed subsets of the affine spectrum
#!  of Q[x,y]>
D := ClosedSubsetOfSpec( HomalgMatrix( "[ x^2*y^3*(x-y) ]", 1, 1, R ) );
#! <An object in The coframe of Zariski closed subsets of the affine spectrum
#!  of Q[x,y]>
T := TerminalObject( ZC );
#! <An object in The coframe of Zariski closed subsets of the affine spectrum
#!  of Q[x,y]>
I := InitialObject( ZC );
#! <An object in The coframe of Zariski closed subsets of the affine spectrum
#!  of Q[x,y]>
#! @EndExample
