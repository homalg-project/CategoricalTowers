
using HomalgProject

LoadPackage( "Locales" )

LoadPackage( "SubcategoriesForCAP" )

LoadPackage( "LazyCategories" )

Q = HomalgFieldOfRationalsInSingular( )

R = Q["x,y"]

P = CategoryOfRows( R )

P = LazyCategory( P, show_evaluation = true )

I = HomalgMatrix( "[ x ]", 2, 1, R ) / P

SetLabel( Range( I ), "R" )

J = HomalgMatrix( "[ x, y ]", 2, 1, R ) / P

SetLabel( J, "J" ); SetLabel( Source( J ), "R^j" )

IJ = HomalgMatrix( "[ x^2, x*y ]", 2, 1, R ) / P

SetLabel( IJ, "IJ" ); SetLabel( Source( IJ ), "R^ij" )

S = SliceCategoryOverTensorUnit( P )

L = PosetOfCategory( S )

I = I / S / L

J = J / S / L

IJ = IJ / S / L

IJqJ = InternalHom( J, IJ )

VisualizeInJulia( UnderlyingMorphism( UnderlyingCell( IJqJ ) ) )

I == IJqJ


