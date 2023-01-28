#! @Chunk AdditionForMorphisms

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
N := HomalgMatrix( "[ 2, 3, 4, 5,   6, 7, 8, 9 ]", 2, 4, ZZ );
#! <A 2 x 4 matrix over an internal ring>
N := LeftPresentation( N );
#! <A non-torsion left module presented by 2 relations for 4 generators>
mat := HomalgMatrix( "[ \
1, 0, -2, -4, \
0, 1,  4,  7, \
1, 0, -2, -4  \
]", 3, 4, ZZ );
#! <A 3 x 4 matrix over an internal ring>
phi := HomalgMap( mat, M, N );
#! <A "homomorphism" of left modules>
0 * phi;
#! <The zero morphism of left modules>
nu := -phi;
#! <A "homomorphism" of left modules>
psi := HomalgMap( mat, M, N );
#! <A "homomorphism" of left modules>
chi := phi + psi;
#! <A "homomorphism" of left modules>
eta := phi - psi;
#! <The zero morphism of left modules>
IsMorphism( phi );
#! true
phi;
#! <A homomorphism of left modules>
nu;
#! <A homomorphism of left modules>
IsMorphism( psi );
#! true
chi;
#! <A homomorphism of left modules>
lambda := HomalgMap( CertainColumns( mat, [ 1, 2, 4 ] ), M, M );
#! <An endo"morphism" of a left module>
IsMorphism( lambda );
#! false
lambda;
#! <A non-well-defined self-map of a left module>
#! @EndExample
