#! @Chunk NilRadical

LoadPackage( "Locales" );

#! @Example
LoadPackage( "SubcategoriesForCAP", ">= 2020.10-02" );
#! true
Q := HomalgFieldOfRationalsInSingular( );
#! Q
R := Q["x"] / "x^2";
#! Q[x]/( x^2 )
F := CategoryOfRows( R );
#! Rows( Q[x]/( x^2 ) )
S := SliceCategoryOverTensorUnit( F );
#! SliceCategoryOverTensorUnit( Rows( Q[x]/( x^2 ) ) )
P := PosetOfCategory( S );
#! Poset( SliceCategoryOverTensorUnit( Rows( Q[x]/( x^2 ) ) ) )
L := StablePosetOfCategory( P );
#! StablePoset( Poset( SliceCategoryOverTensorUnit( Rows( Q[x]/( x^2 ) ) ) ) )
N := HomalgMatrix( "[ x ]", 1, 1, R ) / F / S / P;
#! An object in the poset given by:
#! An object in the slice category given by: <A morphism in Rows( Q[x]/( x^2 ) )>
I := InitialObject( P );
#! An object in the poset given by:
#! An object in the slice category given by:
#! <A zero, split monomorphism in Rows( Q[x]/( x^2 ) )>
I = N;
#! false
IsInitial( I );
#! true
IsInitial( N );
#! false
rN := N / L;
#! An object in the stable poset given by:
#! An object in the poset given by:
#! An object in the slice category given by: <A morphism in Rows( Q[x]/( x^2 ) )>
rI := I / L;
#! An object in the stable poset given by:
#! An object in the poset given by:
#! An object in the slice category given by:
#! <A zero, split monomorphism in Rows( Q[x]/( x^2 ) )>
rI = rN;
#! true
IsInitial( rI );
#! true
IsInitial( rN );
#! true
#! @EndExample
