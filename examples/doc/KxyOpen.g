#! @System OpenKxy

LoadPackage( "ZariskiFrames" );

#! @Example
LoadPackage( "RingsForHomalg" );
#! true
R := HomalgFieldOfRationalsInSingular( ) * "x,y";
#! Q[x,y]
ZF := ZariskiFrameOfAffineSpectrumUsingCategoryOfRows( R );
#! The frame of Zariski open subsets of the affine spectrum of Q[x,y]
A := OpenSubsetOfSpecByReducedMorphism( HomalgMatrix( "[ x ]", 1, 1, R ) );
#! D_{Q[x,y]}( <...> )
B := OpenSubsetOfSpec( HomalgMatrix( "[ x^2 ]", 1, 1, R ) );
#! D_{Q[x,y]}( <...> )
C := OpenSubsetOfSpecByReducedMorphism( HomalgMatrix( "[ y ]", 1, 1, R ) );
#! D_{Q[x,y]}( <...> )
D := OpenSubsetOfSpec( HomalgMatrix( "[ x^2*y^3 ]", 1, 1, R ) );
#! D_{Q[x,y]}( <...> )
T := TerminalObject( ZF );
#! D_{Q[x,y]}( <...> )
I := InitialObject( ZF );
#! D_{Q[x,y]}( <...> )
#! @EndExample
