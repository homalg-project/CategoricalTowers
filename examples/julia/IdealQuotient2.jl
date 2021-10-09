
using CapAndHomalg

LoadPackage( "FreydCategoriesForCAP" )

LoadPackage( "SubcategoriesForCAP" )

LoadPackage( "Locales" )

LoadPackage( "LazyCategories" )

Q = HomalgFieldOfRationalsInSingular( )

R = Q["x,y"]

K = HomalgMatrix( "[ x, -x ]", 2, 1, R )

J = HomalgMatrix( "[ x, y ]", 2, 1, R )

I = KroneckerMat( K, J )

P = CategoryOfRows( R )

P = LazyCategory( P, primitive_operations = true, show_evaluation = true )

I = I / P

SetLabel( I, "I" ); SetLabel( Source( I ), "R^i" )

R = Range( I )

SetLabel( R, "R" )

J = J / P

SetLabel( J, "J" ); SetLabel( Source( J ), "R^j" )

K = K / P

S = SliceCategoryOverTensorUnit( P )

L = PosetOfCategory( S )

I = I / S / L

J = J / S / L

K = K / S / L

IqJ = InternalHom( J, I )

Visualize( UnderlyingMorphism( UnderlyingCell( IqJ ) ) )

K == IqJ


