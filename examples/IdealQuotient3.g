#! @Chunk IdealQuotient3

LoadPackage( "Locales" );

#! @Example
LoadPackage( "FreydCategoriesForCAP" );
#! true
LoadPackage( "SubcategoriesForCAP", ">= 2020.04.16" );
#! true
LoadPackage( "LazyCategories", ">= 2020.06.01" );
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
S := LazyCategory( SliceCategoryOverTensorUnit( P ) );
#! LazyCategory( SliceCategoryOverTensorUnit( LazyCategory( Rows( Q[x,y] ) ) ) )
L := LazyCategory( PosetOfCategory( S ) );
#! LazyCategory( Poset( LazyCategory( SliceCategoryOverTensorUnit(
#!   LazyCategory( Rows( Q[x,y] ) ) ) ) ) )
I := I / S; SetLabel( I, "I" );
#! <An evaluated object in LazyCategory(
#!  SliceCategoryOverTensorUnit( LazyCategory( Rows( Q[x,y] ) ) ) )>
I := I / L; SetLabel( I, "I" );
#! <An evaluated object in LazyCategory( Poset( LazyCategory(
#!  SliceCategoryOverTensorUnit( LazyCategory( Rows( Q[x,y] ) ) ) ) ) )>
J := J / S; SetLabel( J, "J" );
#! <An evaluated object in LazyCategory(
#!  SliceCategoryOverTensorUnit( LazyCategory( Rows( Q[x,y] ) ) ) )>
J := J / L; SetLabel( J, "J" );
#! <An evaluated object in LazyCategory( Poset( LazyCategory(
#!  SliceCategoryOverTensorUnit( LazyCategory( Rows( Q[x,y] ) ) ) ) ) )>
K := K / S; SetLabel( K, "K" );
#! <An evaluated object in LazyCategory(
#!  SliceCategoryOverTensorUnit( LazyCategory( Rows( Q[x,y] ) ) ) )>
K := K / L; SetLabel( K, "K" );
#! <An evaluated object in LazyCategory( Poset( LazyCategory(
#!  SliceCategoryOverTensorUnit( LazyCategory( Rows( Q[x,y] ) ) ) ) ) )>
IqJ := InternalHom( J, I ); ## this is the ideal quotient I : J
#! <An object in LazyCategory( Poset( LazyCategory(
#!  SliceCategoryOverTensorUnit( LazyCategory( Rows( Q[x,y] ) ) ) ) ) )>
IsHomSetInhabited( K, IqJ );
#! true
IsHomSetInhabited( IqJ, K );
#! true
#! @EndExample
