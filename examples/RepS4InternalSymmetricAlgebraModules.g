LoadPackage( "GroupRepresentationsForCAP" );

RepG := RepresentationCategory( SymmetricGroup( 4 ) );

G := UnderlyingGroupForRepresentationCategory( RepG );

irr := Irr( G );

v := RepresentationCategoryObject( irr[2], RepG );

LoadPackage( "GradedCategories" );

ZRepG := PositivelyZGradedCategory( RepG );

LoadPackage( "InternalModules" );

V := ObjectInPositivelyZGradedCategory( v, 1 );

SVMod := CategoryOfLeftSModules( v );

SV := UnderlyingActingObject( SVMod );

ModSV := CategoryOfRightSModules( v );

S := SymmetricAlgebraAsLeftModule( v );

u := RepresentationCategoryObject( irr[2], RepG );

U := ObjectInPositivelyZGradedCategory( u, 3 );

F := FreeInternalModule( U, SVMod );

H := FreeInternalModule( U, ModSV );

chi := Support( F[6] )[4];

c1 := UniversalMorphismFromFreeModule( F, chi, 6, 1 );

c2 := UniversalMorphismFromFreeModule( F, chi, 6, 2 );

c := 2 * c1 - 3 * c2;

a := InternalElement( SV, Support( SV[1] )[1], 1, 1 );
b := InternalElement( SV, Support( SV[2] )[1], 2, 1 );
c := InternalElement( SV, Support( SV[2] )[2], 2, 1 );
d := InternalElement( SV, Support( SV[3] )[3], 3, 1 );

cc := UniversalMorphismFromFreeModule( c );
dd := UniversalMorphismFromFreeModule( d );

pp := ProjectionInFactorOfFiberProduct( [ cc, dd ], 1 );
qq := ProjectionInFactorOfFiberProduct( [ cc, dd ], 2 );

ff := PreCompose( pp, cc ) - PreCompose( qq, dd );

Assert( 0, Set( List( Sublist( ff, [ 0 .. 5 ] ), IsZero ) ) = [ true ] );

ss := UniversalMorphismIntoDirectSum( pp, -qq );
tt := UniversalMorphismFromDirectSum( cc, dd );

## homology
hh := ImageObject( PreCompose( KernelEmbedding( tt ), CokernelProjection( ss ) ) );

Assert( 0, Set( List( Sublist( hh, [ 0 .. 5 ] ), IsZero ) ) = [ true ] );

chi1 := Support( SV[3] )[1];
chi2 := Support( SV[3] )[2];
chi3 := Support( SV[3] )[3];

e1 := InternalElement( SV, chi1, 3, 1 );
e2 := InternalElement( SV, chi2, 3, 1 );
e3 := InternalElement( SV, chi2, 3, 2 );
e4 := InternalElement( SV, chi3, 3, 1 );

e := e1 + 2 * e2 - 1/3 * e3 + e4;

Assert( 0, e2 * e3 = BraidedMultiplication( e3, e2 ) );

m1 := InternalElement( F, chi, 6, 1 );
m2 := InternalElement( F, chi, 6, 2 );

m := 2 * m1 - 1/3 * m2;
