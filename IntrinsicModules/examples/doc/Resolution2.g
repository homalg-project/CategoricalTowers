#! @Chunk Resolution2

LoadPackage( "IntrinsicModules" );

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
d := Resolution( 2, M4 );
#! <A right acyclic complex containing 2 morphisms of left modules at degrees
#!  [ 0 .. 2 ]>
Display( d );
#! -------------------------
#! at homology degree: 2
#! 0
#! -------------------------
#! (an empty 0 x 2 matrix)
#! 
#! the map is currently represented by the above 0 x 2 matrix
#! ------------v------------
#! at homology degree: 1
#! Z/( 4 )^(1 x 2)
#! -------------------------
#! [ [  1,  0,  3 ],
#!   [  0,  1,  2 ] ]
#! 
#! modulo [ 4 ]
#! 
#! the map is currently represented by the above 2 x 3 matrix
#! ------------v------------
#! at homology degree: 0
#! Z/( 4 )^(1 x 3)
#! -------------------------
#! @EndExample
