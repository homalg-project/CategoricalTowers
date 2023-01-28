LoadPackage( "IntrinsicCategories" );

C := CreateCapCategory( "tst");
Finalize( C );
G := Group( (1,2) );
AddObject( C, G );
C := IntrinsicCategory( C );
G := Intrinsify( C, G );

LoadPackage( "LinearAlgebraForCAP" );

Q := HomalgFieldOfRationals( );
VectQ := MatrixCategory( Q );
VectQ := IntrinsicCategory( VectQ );
