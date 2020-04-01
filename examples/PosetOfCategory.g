#! @Chunk PosetOfCategory

LoadPackage( "Locales" );

#! @Example
LoadPackage( "SubcategoriesForCAP" );
#! true
Q := HomalgFieldOfRationalsInSingular( );
#! Q
R := Q["x,y"];
#! Q[x,y]
P := CategoryOfRows( R );
#! Rows( Q[x,y] )
S := SliceCategoryOverTensorUnit( P );
#! A slice category of Rows( Q[x,y] )
L := PosetOfCategory( S );
#! Poset( A slice category of Rows( Q[x,y] ) )
I := HomalgMatrix( "x", 1, 1, R ) / P / S / L;
#! An object in the poset given by: An object in the slice category given by:
#! <A morphism in Rows( Q[x,y] )>
J := HomalgMatrix( "x,y", 2, 1, R ) / P / S / L;
#! An object in the poset given by: An object in the slice category given by:
#! <A morphism in Rows( Q[x,y] )>
IJ := TensorProduct( I, J );
#! An object in the poset given by: An object in the slice category given by:
#! <A morphism in Rows( Q[x,y] )>
IiJ := DirectProduct( I, J );
#! An object in the poset given by: An object in the slice category given by:
#! <A morphism in Rows( Q[x,y] )>
IiJ = I;
#! true
IsHomSetInhabited( IJ, IiJ );
#! true
IsHomSetInhabited( IiJ, IJ );
#! false
IpJ := Coproduct( I, J );
#! An object in the poset given by: An object in the slice category given by:
#! <A morphism in Rows( Q[x,y] )>
IpJ = J;
#! true
#! @EndExample
