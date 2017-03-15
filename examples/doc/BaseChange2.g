#! @System BaseChange2

LoadPackage( "M2" );

#! @Example
ZZ := HomalgRingOfIntegers( );
#! Z
M := HomalgMatrix( "[ \
2, 3, 4, \
5, 6, 7  \
]", 2, 3, ZZ );
#! <A 2 x 3 matrix over an internal ring>
M := LeftPresentation( M );
#! <A non-torsion left module presented by 2 relations for 3 generators>
Z4 := ZZ / 4;
#! Z/( 4 )
M4 := Z4 * M;
#! <A non-torsion left module presented by 2 relations for 3 generators>
Display( M4 );
#! [ [  2,  3,  4 ],
#!   [  5,  6,  7 ] ]
#! 
#! modulo [ 4 ]
#! 
#! Cokernel of the map
#! 
#! Z/( 4 )^(1x2) --> Z/( 4 )^(1x3),
#! 
#! currently represented by the above matrix
#! @EndExample
