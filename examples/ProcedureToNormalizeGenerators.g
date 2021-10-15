#! @Chunk ProcedureToNormalizeGenerators

LoadPackage( "IntrinsicModules" );
LoadPackage( "RingsForHomalg" );

#! @Example
ZZ := HomalgRingOfIntegersInExternalGAP( );
#! Z
M := HomalgMatrix( "[ \
2, 3, 4, \
5, 6, 7  \
]", 2, 3, ZZ );
#! <A 2 x 3 matrix over an external ring>
M := LeftPresentation( M );
#! <A non-torsion left module presented by 2 relations for 3 generators>
N := End( M );
#! <A non-torsion right module on 5 generators satisfying 4 relations>
e := End( N );
#! <A non-torsion left module presented by 20 relations for 21 generators>
ByASmallerPresentation( e );
#! <A non-torsion left module presented by 6 relations for 7 generators>
g := GetGenerators( e );
#! [ <An endomorphism of a right module>, <An endomorphism of a right module>,
#!   <An endomorphism of a right module>, <An endomorphism of a right module>,
#!   <An endomorphism of a right module>, <An endomorphism of a right module>,
#!   <An endomorphism of a right module> ]
Perform( g, Display );
#! [ [  -22,    0,    0,    0,    0 ],
#!   [  -17,   -4,    2,    8,    4 ],
#!   [   -4,    6,    0,   -8,   -2 ],
#!   [    1,    2,    2,    2,    0 ],
#!   [  -20,  -16,    2,   24,    8 ] ]
#! 
#! the map is currently represented by the above 5 x 5 matrix
#! [ [  -12,    0,    0,    0,    0 ],
#!   [   -8,   -2,    2,    6,    1 ],
#!   [   -3,    4,    0,   -4,    0 ],
#!   [    0,    0,    0,    1,    0 ],
#!   [   -8,  -10,    2,   14,    1 ] ]
#! 
#! the map is currently represented by the above 5 x 5 matrix
#! [ [  -54,    0,    0,    0,    0 ],
#!   [  -52,  -22,    0,   31,    1 ],
#!   [    0,   23,    1,  -30,   -1 ],
#!   [    2,    1,    1,    1,    1 ],
#!   [  -79,  -68,   -2,   91,    3 ] ]
#! 
#! the map is currently represented by the above 5 x 5 matrix
#! [ [  -6,   0,   0,   0,   0 ],
#!   [  -1,   0,   2,   2,   2 ],
#!   [  -4,   2,   0,  -1,   0 ],
#!   [   0,   0,   0,   2,   0 ],
#!   [   4,  -4,   2,   4,   2 ] ]
#! 
#! the map is currently represented by the above 5 x 5 matrix
#! [ [  -56,    0,    0,    0,    0 ],
#!   [  -57,  -23,   -1,   32,    2 ],
#!   [    1,   23,    1,  -31,   -2 ],
#!   [    1,    2,    2,    2,    1 ],
#!   [  -87,  -69,   -3,   94,    6 ] ]
#! 
#! the map is currently represented by the above 5 x 5 matrix
#! [ [  -4,   0,   0,   0,   0 ],
#!   [  -2,  -2,   0,   2,   2 ],
#!   [  -2,   2,   0,  -2,   0 ],
#!   [   0,   0,   0,   2,   0 ],
#!   [   0,  -6,   0,   6,   2 ] ]
#! 
#! the map is currently represented by the above 5 x 5 matrix
#! [ [  -3,   0,   0,   0,   0 ],
#!   [  -2,  -1,   1,   3,   1 ],
#!   [  -2,   2,   0,  -1,   0 ],
#!   [   0,   0,   0,   1,   0 ],
#!   [   1,  -4,  -1,   5,   0 ] ]
#! 
#! the map is currently represented by the above 5 x 5 matrix
ByASmallerPresentation( N );
#! <A non-torsion right module on 3 generators satisfying 2 relations>
Perform( g, Display );
#! [ [   -68,  -170,   -90 ],
#!   [    12,    92,    40 ],
#!   [     0,     0,     0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [   -51,  -168,   -82 ],
#!   [    28,   118,    54 ],
#!   [     0,     0,     0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  -158,  -473,  -239 ],
#!   [   131,   628,   281 ],
#!   [     0,     0,     0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [   -46,  -158,   -77 ],
#!   [    24,    88,    42 ],
#!   [     0,     0,     0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  -138,  -384,  -199 ],
#!   [   107,   563,   249 ],
#!   [     0,     0,     0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [   -34,  -108,   -54 ],
#!   [    24,    98,    46 ],
#!   [     0,     0,     0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  -26,  -85,  -42 ],
#!   [   21,   80,   37 ],
#!   [    0,    0,   -1 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
Perform( g, DecideZero );
Perform( g, Display );
#! [ [  1,  1,  0 ],
#!   [  0,  2,  1 ],
#!   [  0,  0,  0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  0,  0,  2 ],
#!   [  1,  1,  0 ],
#!   [  0,  0,  0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  1,  1,  1 ],
#!   [  2,  1,  2 ],
#!   [  0,  0,  0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  2,  1,  1 ],
#!   [  0,  1,  0 ],
#!   [  0,  0,  0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  0,  0,  2 ],
#!   [  2,  2,  0 ],
#!   [  0,  0,  0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  2,  0,  0 ],
#!   [  0,  2,  1 ],
#!   [  0,  0,  0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [   1,   2,   0 ],
#!   [   0,   2,   1 ],
#!   [   0,   0,  -1 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! @EndExample
