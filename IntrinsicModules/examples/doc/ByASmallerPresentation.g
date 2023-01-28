#! @Chunk ByASmallerPresentation

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
Display( M );
#! [ [  2,  3,  4 ],
#!   [  5,  6,  7 ] ]
#! 
#! Cokernel of the map
#! 
#! Z^(1x2) --> Z^(1x3),
#! 
#! currently represented by the above matrix
ByASmallerPresentation( M );
#! <A rank 1 left module presented by 1 relation for 2 generators>
Display( M );
#! Z/< 3 > + Z^(1 x 1)
M;
#! <A rank 1 left module presented by 1 relation for 2 generators>
SetPositionOfTheDefaultPresentation( M, 1 );
M;
#! <A rank 1 left module presented by 2 relations for 3 generators>
#! @EndExample
