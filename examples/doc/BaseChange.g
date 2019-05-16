#! @Chunk BaseChange

LoadPackage( "M2" );

#! @Example
ZZ := HomalgRingOfIntegers( );
#! Z
Display( ZZ );
#! <An internal ring>
Z4 := ZZ / 4;
#! Z/( 4 )
Display( Z4 );
#! <A residue class ring>
M := HomalgDiagonalMatrix( [ 2 .. 4 ], ZZ );
#! <An unevaluated diagonal 3 x 3 matrix over an internal ring>
M := LeftPresentation( M );
#! <A torsion left module presented by 3 relations for 3 generators>
Display( M );
#! Z/< 2 > + Z/< 3 > + Z/< 4 >
M;
#! <A torsion left module presented by 3 relations for 3 generators>
N := Z4 * M; ## or N := M * Z4;
#! <A non-torsion left module presented by 2 relations for 3 generators>
ByASmallerPresentation( N );
#! <A non-torsion left module presented by 1 relation for 2 generators>
Display( N );
#! Z/( 4 )/< |[ 2 ]| > + Z/( 4 )^(1 x 1)
N;
#! <A non-torsion left module presented by 1 relation for 2 generators>
#! @EndExample
