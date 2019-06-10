#! @Chunk ProcedureToNormalizeGenerators

LoadPackage( "ModulesForHomalg" );
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
#! <A right module on 5 generators satisfying yet unknown relations>
e := End( N );
#! <A left module presented by yet unknown relations for 20 generators>
ByASmallerPresentation( e );
#! <A non-torsion left module presented by 6 relations for 7 generators>
g := GetGenerators( e );
#! [ <An endomorphism of a right module>, <An endomorphism of a right module>,
#!   <An endomorphism of a right module>, <An endomorphism of a right module>,
#!   <An endomorphism of a right module>, <An endomorphism of a right module>,
#!   <An endomorphism of a right module> ]
Perform( g, Display );
#! [ [  -42,    0,    0,    0,    0 ],
#!   [  -40,  -17,    0,   24,    2 ],
#!   [   -1,   19,    2,  -24,   -1 ],
#!   [    2,    1,    1,    1,    2 ],
#!   [  -59,  -55,   -4,   72,    4 ] ]
#! 
#! the map is currently represented by the above 5 x 5 matrix
#! [ [  -48,    0,    0,    0,    0 ],
#!   [  -46,  -21,   -1,   28,    2 ],
#!   [    0,   22,    2,  -28,   -1 ],
#!   [    2,    1,    1,    1,    2 ],
#!   [  -70,  -65,   -5,   84,    4 ] ]
#! 
#! the map is currently represented by the above 5 x 5 matrix
#! [ [  -12,    0,    0,    0,    0 ],
#!   [   -9,   -7,   -1,    8,    2 ],
#!   [   -1,    8,    2,   -8,    0 ],
#!   [    0,    0,    0,    1,    2 ],
#!   [  -13,  -23,   -5,   24,    2 ] ]
#! 
#! the map is currently represented by the above 5 x 5 matrix
#! [ [  -50,    0,    0,    0,    0 ],
#!   [  -47,  -22,   -1,   29,    3 ],
#!   [   -1,   23,    2,  -29,   -1 ],
#!   [    2,    1,    1,    2,    2 ],
#!   [  -70,  -68,   -5,   87,    5 ] ]
#! 
#! the map is currently represented by the above 5 x 5 matrix
#! [ [  -42,    0,    0,    0,    0 ],
#!   [  -39,  -18,   -1,   24,    3 ],
#!   [   -1,   19,    2,  -24,   -1 ],
#!   [    2,    1,    1,    1,    2 ],
#!   [  -58,  -56,   -5,   72,    5 ] ]
#! 
#! the map is currently represented by the above 5 x 5 matrix
#! [ [  -58,    0,    0,    0,    0 ],
#!   [  -55,  -24,   -1,   34,    3 ],
#!   [   -1,   25,    2,  -32,   -1 ],
#!   [    2,    1,    1,    1,    2 ],
#!   [  -82,  -74,   -5,   98,    5 ] ]
#! 
#! the map is currently represented by the above 5 x 5 matrix
#! [ [   -87,     0,     0,     0,     0 ],
#!   [   -88,   -34,    -1,    49,     2 ],
#!   [     1,    34,     1,   -47,    -2 ],
#!   [     1,     2,     2,     2,     1 ],
#!   [  -134,  -103,    -1,   143,     7 ] ]
#! 
#! the map is currently represented by the above 5 x 5 matrix
ByASmallerPresentation( N );
#! <A non-torsion right module on 3 generators satisfying 2 relations>
Perform( g, Display );
#! [ [  -124,  -391,  -197 ],
#!   [   107,   521,   234 ],
#!   [     0,     0,     0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  -132,  -407,  -206 ],
#!   [   127,   615,   276 ],
#!   [     0,     0,     0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  -21,  -98,  -48 ],
#!   [   57,  265,  121 ],
#!   [    0,    0,    0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  -149,  -461,  -233 ],
#!   [   139,   664,   299 ],
#!   [     0,     0,     0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  -118,  -361,  -183 ],
#!   [   110,   536,   241 ],
#!   [     0,     0,     0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  -162,  -489,  -247 ],
#!   [   142,   694,   311 ],
#!   [     0,     0,     0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  -229,  -655,  -334 ],
#!   [   162,   843,   373 ],
#!   [     0,     0,     1 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
Perform( g, DecideZero );
Perform( g, Display );
#! [ [  2,  2,  1 ],
#!   [  2,  2,  0 ],
#!   [  0,  0,  0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  0,  1,  1 ],
#!   [  1,  0,  0 ],
#!   [  0,  0,  0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  0,  1,  0 ],
#!   [  0,  1,  1 ],
#!   [  0,  0,  0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  1,  1,  1 ],
#!   [  1,  1,  2 ],
#!   [  0,  0,  0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  2,  2,  0 ],
#!   [  2,  2,  1 ],
#!   [  0,  0,  0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  0,  0,  2 ],
#!   [  1,  1,  2 ],
#!   [  0,  0,  0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  2,  2,  2 ],
#!   [  0,  0,  1 ],
#!   [  0,  0,  1 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! @EndExample
