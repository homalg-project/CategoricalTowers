#! @Chunk ProcedureToNormalizeGenerators

LoadPackage( "IntrinsicModules" );
LoadPackage( "RingsForHomalg" );

#! @Example
zz := HomalgRingOfIntegersInExternalGAP( );
#! Z
M := HomalgMatrix( "[ \
2, 3, 4, \
5, 6, 7  \
]", 2, 3, zz );
#! <A 2 x 3 matrix over an external ring>
M := LeftPresentation( M );
#! <A non-torsion left module presented by 2 relations for 3 generators>
N := End( M );
#! <A non-torsion right module on 4 generators satisfying 3 relations>
e := End( N );
#! <A non-torsion left module presented by 7 relations for 8 generators>
ByASmallerPresentation( e );
#! <A non-torsion left module presented by 6 relations for 7 generators>
g := GetGenerators( e );
#! [ <An endomorphism of a right module>, <An endomorphism of a right module>,
#!   <An endomorphism of a right module>, <An endomorphism of a right module>,
#!   <An endomorphism of a right module>, <An endomorphism of a right module>,
#!   <An endomorphism of a right module> ]
Perform( g, Display );
#! [ [   1,   3,   3,   5 ],
#!   [   1,   2,   1,   2 ],
#!   [   1,   1,  -1,  -1 ],
#!   [   1,   1,   1,   1 ] ]
#! 
#! the map is currently represented by the above 4 x 4 matrix
#! [ [  -1,   3,   1,   5 ],
#!   [   0,   2,   0,   2 ],
#!   [   1,   1,  -1,  -1 ],
#!   [   1,   1,   1,   1 ] ]
#! 
#! the map is currently represented by the above 4 x 4 matrix
#! [ [   0,   0,   0,   4 ],
#!   [   0,   1,   0,   1 ],
#!   [   0,   2,   0,  -2 ],
#!   [   0,   2,   0,   2 ] ]
#! 
#! the map is currently represented by the above 4 x 4 matrix
#! [ [   0,  -1,   0,   5 ],
#!   [   0,   0,   0,   2 ],
#!   [   0,   1,   0,  -1 ],
#!   [   0,   1,   0,   1 ] ]
#! 
#! the map is currently represented by the above 4 x 4 matrix
#! [ [   0,  -2,   0,   2 ],
#!   [   0,   0,   0,   1 ],
#!   [   0,   2,   0,   0 ],
#!   [   0,   0,   0,   2 ] ]
#! 
#! the map is currently represented by the above 4 x 4 matrix
#! [ [   0,  -1,   0,   0 ],
#!   [   0,   0,   0,   0 ],
#!   [   0,   1,   0,   0 ],
#!   [   0,   0,   0,   1 ] ]
#! 
#! the map is currently represented by the above 4 x 4 matrix
#! [ [  -1,   0,   3,   4 ],
#!   [   0,   1,   0,   1 ],
#!   [   2,   0,  -2,  -2 ],
#!   [   2,   2,   2,   0 ] ]
#! 
#! the map is currently represented by the above 4 x 4 matrix
ByASmallerPresentation( N );
#! <A non-torsion right module on 3 generators satisfying 2 relations>
Perform( g, Display );
#! [ [  -2,   2,   1 ],
#!   [   0,   1,   0 ],
#!   [   0,   0,   0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  -4,   2,   2 ],
#!   [   0,   1,   0 ],
#!   [   0,   0,   0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  -2,   1,   1 ],
#!   [  -4,   2,   2 ],
#!   [   0,   0,   0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  -6,   2,   2 ],
#!   [  -2,   1,   1 ],
#!   [   0,   0,   0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  -3,   1,   1 ],
#!   [  -6,   2,   2 ],
#!   [   0,   0,   0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [   0,   0,   0 ],
#!   [  -3,   1,   1 ],
#!   [   0,   0,   0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  -2,   1,   1 ],
#!   [   6,   0,  -3 ],
#!   [   0,   0,   1 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
Perform( g, DecideZero );
Perform( g, Display );
#! [ [  1,  2,  1 ],
#!   [  0,  1,  0 ],
#!   [  0,  0,  0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  2,  2,  2 ],
#!   [  0,  1,  0 ],
#!   [  0,  0,  0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  1,  1,  1 ],
#!   [  2,  2,  2 ],
#!   [  0,  0,  0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  0,  2,  2 ],
#!   [  1,  1,  1 ],
#!   [  0,  0,  0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  0,  1,  1 ],
#!   [  0,  2,  2 ],
#!   [  0,  0,  0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  0,  0,  0 ],
#!   [  0,  1,  1 ],
#!   [  0,  0,  0 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! [ [  1,  1,  1 ],
#!   [  0,  0,  0 ],
#!   [  0,  0,  1 ] ]
#! 
#! the map is currently represented by the above 3 x 3 matrix
#! @EndExample
