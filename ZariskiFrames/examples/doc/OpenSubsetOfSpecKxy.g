#! @Chunk OpenKxy

LoadPackage( "ZariskiFrames" );

#! @Example
R := HomalgFieldOfRationalsInSingular( ) * "x,y";
#! Q[x,y]
ZF := ZariskiFrameOfAffineSpectrum( R );
#! The frame of Zariski open subsets of the affine spectrum of Q[x,y]
A := OpenSubsetOfSpecByRadicalColumn( HomalgMatrix( "[ x ]", 1, 1, R ) );
#! D_{Q[x,y]}( <...> )
B := OpenSubsetOfSpec( "[ x^2 ]", R );
#! D_{Q[x,y]}( <...> )
A = B;
#! true
C := OpenSubsetOfSpecByRadicalColumn( "[ y ]", R );
#! D_{Q[x,y]}( <...> )
D := OpenSubsetOfSpec( "[ x^2*y^3 ]", R );
#! D_{Q[x,y]}( <...> )
A * C = D;
#! true
T := TerminalObject( ZF );
#! D_{Q[x,y]}( <...> )
I := InitialObject( ZF );
#! D_{Q[x,y]}( <...> )
#! @EndExample
