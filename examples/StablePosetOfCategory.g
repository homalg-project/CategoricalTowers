#! @Chunk StablePosetOfCategory

LoadPackage( "Locales" );

#! @Example
LoadPackage( "SubcategoriesForCAP", ">= 2020.03.04" );
#! true
Q := HomalgFieldOfRationalsInSingular( );
#! Q
R := Q["x,y"];
#! Q[x,y]
P := CategoryOfRows( R );
#! Rows( Q[x,y] )
S := SliceCategoryOverTensorUnit( P );
#! A slice category of Rows( Q[x,y] )
L := StablePosetOfCategory( S );
#! Poset( A slice category of Rows( Q[x,y] ) )
I := HomalgMatrix( "x", 1, 1, R ) / P / S / L;
#! An object in the stable poset given by:
#! An object in the slice category given by: <A morphism in Rows( Q[x,y] )>
J := HomalgMatrix( "x,y", 2, 1, R ) / P / S / L;
#! An object in the stable poset given by:
#! An object in the slice category given by: <A morphism in Rows( Q[x,y] )>
IJ := TensorProduct( I, J );
#! An object in the stable poset given by:
#! An object in the slice category given by: <A morphism in Rows( Q[x,y] )>
IiJ := DirectProduct( I, J );
#! An object in the stable poset given by:
#! An object in the slice category given by: <A morphism in Rows( Q[x,y] )>
IsHomSetInhabited( IJ, IiJ );
#! true
IsHomSetInhabited( IiJ, IJ );
#! true
IiJ = I;
#! true
IpJ := Coproduct( I, J );
#! An object in the stable poset given by:
#! An object in the slice category given by: <A morphism in Rows( Q[x,y] )>
IpJ = J;
#! true
IJqJ := InternalHom( J, IJ ); ## this is the ideal quotient IJ : J
#! An object in the stable poset given by:
#! An object in the slice category given by: <A morphism in Rows( Q[x,y] )>
IJqJ = I;
#! true
iota := InternalHom( UniversalMorphismIntoTerminalObject( J ), IJ );
#! <An epi-, monomorphism in Poset( A slice category of Rows( Q[x,y] ) )>
IsWellDefined( iota );
#! true
IsIsomorphism( iota );
#! true
IJJ := TensorProduct( IJ, J );
#! An object in the stable poset given by:
#! An object in the slice category given by: <A morphism in Rows( Q[x,y] )>
IJJqJ := InternalHom( J, IJJ );
#! An object in the stable poset given by:
#! An object in the slice category given by: <A morphism in Rows( Q[x,y] )>
IJJqJ = I;
#! true
IJJsJ := StableInternalHom( J, IJJ );
#! An object in the stable poset given by:
#! An object in the slice category given by: <A morphism in Rows( Q[x,y] )>
IJJsJ = I;
#! true
#! @EndExample
