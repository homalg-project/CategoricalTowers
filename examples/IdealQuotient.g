#! @Chunk IdealQuotient

LoadPackage( "Locales" );

#! @Example
LoadPackage( "SubcategoriesForCAP", ">= 2020.04.16" );
#! true
LoadPackage( "LazyCategories", ">= 2020.04.23" );
#! true
Q := HomalgFieldOfRationalsInSingular( );
#! Q
R := Q["x,y"];
#! Q[x,y]
K := HomalgMatrix( "[ x, -x ]", 2, 1, R );
#! <A 2 x 1 matrix over an external ring>
J := HomalgMatrix( "[ x, y ]", 2, 1, R );
#! <A 2 x 1 matrix over an external ring>
I := KroneckerMat( K, J );
#! <An unevaluated 4 x 1 matrix over an external ring>
P := CategoryOfRows( R );
#! Rows( Q[x,y] )
P := LazyCategory( P : show_evaluation := false );
#! LazyCategory( Rows( Q[x,y] ) )
I := I / P; SetLabel( I, "I" ); SetLabel( Source( I ), "R^i" );
#! <An evaluated morphism in LazyCategory( Rows( Q[x,y] ) )>
R := Range( I ); SetLabel( R, "R" );
#! <An evaluated object in LazyCategory( Rows( Q[x,y] ) )>
J := J / P; SetLabel( J, "J" ); SetLabel( Source( J ), "R^j" );
#! <An evaluated morphism in LazyCategory( Rows( Q[x,y] ) )>
K := K / P;
#! <An evaluated morphism in LazyCategory( Rows( Q[x,y] ) )>
S := SliceCategoryOverTensorUnit( P );
#! SliceCategoryOverTensorUnit( LazyCategory( Rows( Q[x,y] ) ) )
L := PosetOfCategory( S );
#! Poset( SliceCategoryOverTensorUnit( LazyCategory( Rows( Q[x,y] ) ) ) )
I := I / S / L;
#! An object in the poset given by: An object in the slice category given by:
#! <An evaluated morphism in LazyCategory( Rows( Q[x,y] ) )>
J := J / S / L;
#! An object in the poset given by: An object in the slice category given by:
#! <An evaluated morphism in LazyCategory( Rows( Q[x,y] ) )>
K := K / S / L;
#! An object in the poset given by: An object in the slice category given by:
#! <An evaluated morphism in LazyCategory( Rows( Q[x,y] ) )>
IqJ := InternalHom( J, I ); ## this is the ideal quotient I : J
#! An object in the poset given by: An object in the slice category given by:
#! <A morphism in LazyCategory( Rows( Q[x,y] ) )>
K = IqJ;
#! true
#! @EndExample
