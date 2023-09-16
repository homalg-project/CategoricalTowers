#! @Chunk ExteriorPowersCategory

LoadPackage( "IntrinsicModules" );
LoadPackage( "ExteriorPowersCategories" );

#! @Example
zz := HomalgRingOfIntegers( );
#! Z
M := HomalgMatrix( "[ \
2, 3, 4, \
5, 6, 7  \
]", 2, 3, zz );
#! <A 2 x 3 matrix over an external ring>
M := LeftPresentation( M );
#! <A non-torsion left module presented by 2 relations for 3 generators>
A := CapCategory( M );
#! IntrinsicCategory( CategoryWithAmbientObjects( Freyd( Rows( Z ) ) ) )
eA := ExteriorPowersCategory( 3, A );
#! ExteriorPowersCategory( 3,
#!   IntrinsicCategory( CategoryWithAmbientObjects( Freyd( Rows( Z ) ) ) ) )
M1 := ObjectInExteriorPowersCategory( M, 1, eA );
M2 := ObjectInExteriorPowersCategory( M, 2, eA );
M3 := ObjectInExteriorPowersCategory( M, 3, eA );
one := IdentityMorphism( M );
phi := MorphismInExteriorPowersCategory( M1, [ 1 * one, 2 * one, 3 * one ], M2 );
psi := MorphismInExteriorPowersCategory( M2, [ 1 * one, 2 * one, 3 * one ], M3 );
#! @EndExample
