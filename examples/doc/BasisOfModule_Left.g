#! @System BasisOfModule_Left

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
Display( M );
#! [ [  2,  3,  4 ],
#!   [  5,  6,  7 ] ]
#! 
#! Cokernel of the map
#! 
#! Z^(1x2) --> Z^(1x3),
#! 
#! currently represented by the above matrix
BasisOfModule( M );
#! <A set of 2 relations for 3 generators of a homalg left module>
M;
#! <A non-torsion left module presented by 2 relations for 3 generators>
Display( M );
#! [ [   1,   0,  -1 ],
#!   [   0,   3,   6 ] ]
#! 
#! Cokernel of the map
#! 
#! Z^(1x2) --> Z^(1x3),
#! 
#! currently represented by the above matrix
#! @EndExample
