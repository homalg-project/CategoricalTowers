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
P := CategoryOfRows( R );
#! Rows( Q[x,y] )
P := LazyCategory( P : show_evaluation := false );
#! LazyCategory( Rows( Q[x,y] ) )
I := HomalgMatrix( "[ x ]", 1, 1, R ) / P;
#! <An evaluated morphism in LazyCategory( Rows( Q[x,y] ) )>
SetLabel( Range( I ), "R" );
J := HomalgMatrix( "[ x, y ]", 2, 1, R ) / P;
#! <An evaluated morphism in LazyCategory( Rows( Q[x,y] ) )>
SetLabel( J, "J" ); SetLabel( Source( J ), "R^j" );
IJ := HomalgMatrix( "[ x^2, x*y ]", 2, 1, R ) / P;
#! <An evaluated morphism in LazyCategory( Rows( Q[x,y] ) )>
SetLabel( IJ, "IJ" ); SetLabel( Source( IJ ), "R^ij" );
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
IJ := IJ / S / L;
#! An object in the poset given by: An object in the slice category given by:
#! <An evaluated morphism in LazyCategory( Rows( Q[x,y] ) )>
IJqJ := InternalHom( J, IJ ); ## this is the ideal quotient IJ : J
#! An object in the poset given by: An object in the slice category given by:
#! <A morphism in LazyCategory( Rows( Q[x,y] ) )>
I = IJqJ;
#! true
#! @EndExample
