LoadPackage( "LinearAlgebraForCAP" );

Q := HomalgFieldOfRationals( );

V := VectorSpaceObject( 2, Q );
beta := HomalgMatrix( [ [ 0, 1 ], [ 1, 1 ] ], Q );
beta := VectorSpaceMorphism( V, beta, V );

W := VectorSpaceObject( 3, Q );
alpha := HomalgMatrix( [ [ 1, 1, 1 ], [ -1, -1, -1 ] ], Q );
alpha := VectorSpaceMorphism( V, alpha, W );

LoadPackage( "IntrinsicCategories" );

C := CapCategory( V );
intC := IntrinsicCategory( C );

inta := Intrinsify( intC, alpha );
intV := Source( inta );
intW := Target( inta );

inta2 := Intrinsify( alpha, intV, 1, intW, 1 );

Assert( 0, inta = inta2 );

inta3 := Intrinsify( intC, alpha );

Assert( 0, not inta = inta3 );

intb := Intrinsify( beta, intV, 1, intV, 1 );

Assert( 0, not inta = intb );
