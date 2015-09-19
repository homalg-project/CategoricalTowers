LoadPackage( "IntrinsicCategories" );

C := CreateCapCategory( "tst" );
C := IntrinsicCategory( C );
G := Group( (1,2) );
AddObject( C, G );
g := Intrinsify( G );
Add( C, g );

LoadPackage( "LinearAlgebraForCAP" );

Q := HomalgFieldOfRationals( );
VectQ := MatrixCategory( Q );
