#! @System HomalgMap

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
IsMorphism( phi );
#! true
phi;
#! <A homomorphism of left modules>
Display( phi );
#! [ [   1,   0,  -2,  -4 ],
#!   [   0,   1,   4,   7 ],
#!   [   1,   0,  -2,  -4 ] ]
#! 
#! the map is currently represented by the above 3 x 4 matrix
ByASmallerPresentation( M );
#! <A non-torsion left module presented by 1 relation for 2 generators>
Display( M );
#! Z/< 3 > + Z^(1 x 1)
Display( phi );
#! [ [   2,   1,   0,  -1 ],
#!   [   1,   0,  -2,  -4 ] ]
#! 
#! the map is currently represented by the above 2 x 4 matrix
ByASmallerPresentation( N );
#! <A non-torsion left module presented by 1 relation for 3 generators>
Display( N );
#! Z/< 4 > + Z^(1 x 2)
Display( phi );
#! [ [  -8,   0,   0 ],
#!   [  -3,  -1,  -2 ] ]
#! 
#! the map is currently represented by the above 2 x 3 matrix
ByASmallerPresentation( phi );
#! <A non-zero homomorphism of left modules>
Display( phi );
#! [ [   0,   0,   0 ],
#!   [   1,  -1,  -2 ] ]
#! 
#! the map is currently represented by the above 2 x 3 matrix
#! @EndExample
#!  To construct a map with source being a not yet specified free module
#! @Example
N;
#! <A rank 2 left module presented by 1 relation for 3 generators>
SetPositionOfTheDefaultSetOfGenerators( N, 1 );
N;
#! <A rank 2 left module presented by 2 relations for 4 generators>
psi := HomalgMap( mat, "free", N );
#! <A homomorphism of left modules>
Source( psi );
#! <A free left module of rank 3 on free generators>
#! @EndExample
#!  To construct a map between not yet specified free left modules
#! @Example
chi := HomalgMap( mat );	## or chi := HomalgMap( mat, "l" );
#! <A homomorphism of left modules>
Source( chi );
#! <A free left module of rank 3 on free generators>
Range( chi );
#! <A free left module of rank 4 on free generators>
#! ]]></Example>
#! To construct a map between not yet specified free right modules
#!     <Example><![CDATA[
kappa := HomalgMap( mat, "r" );
#! <A homomorphism of right modules>
Source( kappa );
#! <A free right module of rank 4 on free generators>
Range( kappa );
#! <A free right module of rank 3 on free generators>
#! @EndExample
