LoadPackage( "LinearAlgebraForCAP" );

Q := HomalgFieldOfRationals( );

V := VectorSpaceObject( 2, Q );
beta := HomalgMatrix( [ [ 0, 1 ], [ 1, 1 ] ], Q );
beta := VectorSpaceMorphism( V, beta, V );

W := VectorSpaceObject( 3, Q );
alpha := HomalgMatrix( [ [ 1, 1, 1 ], [ -1, -1, -1 ] ], Q );
alpha := VectorSpaceMorphism( V, alpha, W );

LoadPackage( "IntrinsicCategories" );

inta := Intrinsify( alpha );
intV := Source( inta );
intW := Range( inta );

inta2 := Intrinsify( alpha, intV, 1, intW, 1 );

inta3 := Intrinsify( alpha );

intb := Intrinsify( beta, intV, 1, intV, 1 );

C := CapCategory( V );
intC := IntrinsicCategory( C );

AddMorphism( intC, inta );
AddMorphism( intC, inta2 );
AddMorphism( intC, inta3 );
AddMorphism( intC, intb );
