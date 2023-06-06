#! @Chunk SliceCategoryOverTensorUnit

#! @Example
LoadPackage( "FreydCategoriesForCAP" );
#! true
Q := HomalgFieldOfRationalsInSingular( );
#! Q
R := Q["x,y"];
#! Q[x,y]
P := CategoryOfRows( R );
#! Rows( Q[x,y] )
S := SliceCategoryOverTensorUnit( P );
#! SliceCategoryOverTensorUnit( Rows( Q[x,y] ) )
I := HomalgMatrix( "[ x^2, x*y ]", 2, 1, R ) / P / S;
#! An object in the slice category given by: <A morphism in Rows( Q[x,y] )>
J := HomalgMatrix( "[ x ]", 1, 1, R ) / P / S;
#! An object in the slice category given by: <A morphism in Rows( Q[x,y] )>
phi := HomalgMatrix( "[ x, y ]", 2, 1, R ) / P;
#! <A morphism in Rows( Q[x,y] )>
phi := MorphismConstructor( S, I, phi, J );
#! A morphism in the slice category given by: <A morphism in Rows( Q[x,y] )>
IsWellDefined( phi );
#! true
Ip := HomalgMatrix( "[ x*y, x*y^2 ]", 2, 1, R ) / P / S;
#! An object in the slice category given by: <A morphism in Rows( Q[x,y] )>
Jp := HomalgMatrix( "[ x ]", 1, 1, R ) / P / S;
#! An object in the slice category given by: <A morphism in Rows( Q[x,y] )>
psi := HomalgMatrix( "[ y, y^2 ]", 2, 1, R ) / P;
#! <A morphism in Rows( Q[x,y] )>
psi := MorphismConstructor( S, Ip, psi, Jp );
#! A morphism in the slice category given by: <A morphism in Rows( Q[x,y] )>
IsWellDefined( psi );
#! true
TensorProductOnObjects( I, J );
#! An object in the slice category given by: <A morphism in Rows( Q[x,y] )>
TensorProductOnMorphisms( phi, psi );
#! A morphism in the slice category given by: <A morphism in Rows( Q[x,y] )>
LeftUnitor( I );
#! A morphism in the slice category given by: <An identity morphism in Rows( Q[x,y] )>
RightUnitor( I );
#! A morphism in the slice category given by: <An identity morphism in Rows( Q[x,y] )>
AssociatorLeftToRight( I, J, Ip );
#! A morphism in the slice category given by: <An identity morphism in Rows( Q[x,y] )>
AssociatorRightToLeft( I, J, Ip );
#! A morphism in the slice category given by: <An identity morphism in Rows( Q[x,y] )>
Braiding( I, J );
#! A morphism in the slice category given by: <A morphism in Rows( Q[x,y] )>
#! @EndExample
