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
IiJ = I;
#! true
IsHomSetInhabited( IJ, IiJ );
#! true
IsHomSetInhabited( IiJ, IJ );
#! true
IpJ := Coproduct( I, J );
#! An object in the stable poset given by:
#! An object in the slice category given by: <A morphism in Rows( Q[x,y] )>
IpJ = J;
#! true
IJqJ := InternalHomOnObjects( J, IJ );
#! An object in the stable poset given by:
#! An object in the slice category given by: <A morphism in Rows( Q[x,y] )>
IJqJ = I;
#! true
iota := InternalHomOnMorphisms( UniversalMorphismIntoTerminalObject( J ),
                IdentityMorphism( IJ ) );
#! <An epi-, monomorphism in Poset( A slice category of Rows( Q[x,y] ) )>
IsWellDefined( iota );
#! true
IJJ := TensorProduct( IJ, J );
#! An object in the stable poset given by:
#! An object in the slice category given by: <A morphism in Rows( Q[x,y] )>
IJJqJ := InternalHomOnObjects( J, IJJ );
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
