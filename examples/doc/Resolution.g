#! @Chunk Resolution

LoadPackage( "ModulesForHomalg" );

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
dM := Resolution( M );
#! <A non-zero right acyclic complex containing a single morphism of left modules
#!  at degrees [ 0 .. 1 ]>
Display( dM );
#! -------------------------
#! at homology degree: 1
#! Z^(1 x 2)
#! -------------------------
#! [ [   1,   0,  -1 ],
#!   [   0,   3,   6 ] ]
#! 
#! the map is currently represented by the above 2 x 3 matrix
#! ------------v------------
#! at homology degree: 0
#! Z^(1 x 3)
#! -------------------------
#! @EndExample
