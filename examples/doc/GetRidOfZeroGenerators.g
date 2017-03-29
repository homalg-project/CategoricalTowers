#! @System GetRidOfZeroGenerators

LoadPackage( "M2" );

#! @Example
ZZ := HomalgRingOfIntegers( );
#! Z
mat := HomalgMatrix( "[ \
0, 1, 0, \
5, 6, 7, \
4, 6, 7  \
]", 3, 3, ZZ );
#! <A 3 x 3 matrix over an internal ring>
M := LeftPresentation( mat );
#! <A left module presented by 3 relations for 3 generators>
Display( M );
#! [ [  0,  1,  0 ],
#!   [  5,  6,  7 ],
#!   [  4,  6,  7 ] ]
#! 
#! Cokernel of the map
#! 
#! Z^(1x3) --> Z^(1x3),
#! 
#! currently represented by the above matrix
GetRidOfZeroGenerators( M );
#! <A cyclic left module presented by 2 relations for a cyclic generator>
Display( M );
#! Z/< 7, 7 >
N := RightPresentation( Involution( mat ) );
#! <A right module on 3 generators satisfying 3 relations>
Display( N );
#! [ [  0,  5,  4 ],
#!   [  1,  6,  6 ],
#!   [  0,  7,  7 ] ]
#! 
#! Cokernel of the map
#! 
#! Z^(3x1) --> Z^(3x1),
#! 
#! currently represented by the above matrix
GetRidOfZeroGenerators( N );
#! <A cyclic right module on a cyclic generator satisfying 2 relations>
Display( N );
#! Z/< 7, 7 >
#! @EndExample
