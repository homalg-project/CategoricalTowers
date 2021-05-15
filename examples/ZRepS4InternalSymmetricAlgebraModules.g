#! @Chunk ZRepS4InternalSymmetricAlgebraModules

LoadPackage( "InternalModules" );

#! @Example

G := SymmetricGroup( 4 );;
RepG := RepresentationCategoryZGraded( G );;

irr := Irr( G );;

v := RepresentationCategoryZGradedObject( 1, irr[2], RepG );;
ZRepG := PositivelyZGradedCategory( RepG );
#! The positively graded category of The skeletal Z-graded representation category
#! of SymmetricGroup( [ 1 .. 4 ] )
V := ObjectInPositivelyZGradedCategory( v );;
SVMod := CategoryOfLeftSModules( v );
#! Abelian category of left modules over the internal symmetric algebra of
#! 1*(x_[1, 2])
#! with undecidable (mathematical) equality of morphisms and
#! uncomputable lifts and colifts
ModSV := CategoryOfRightSModules( v );;
SV := UnderlyingActingObject( SVMod );
#! <An object in The positively graded category of
#!  The skeletal Z-graded representation category of SymmetricGroup( [ 1 .. 4 ] )>
S := SymmetricAlgebraAsLeftModule( v );
#! <An object in Abelian category of
#!  left modules over the internal symmetric algebra of 1*(x_[1, 2])
#!  with undecidable (mathematical) equality of morphisms and
#!  uncomputable lifts and colifts>

u := RepresentationCategoryZGradedObject( 3, irr[2], RepG );;
U := ObjectInPositivelyZGradedCategory( u );;
F := FreeInternalModule( U, SVMod );
#! <An object in Abelian category
#!  of left modules over the internal symmetric algebra of 1*(x_[1, 2])
#!  with undecidable (mathematical) equality of morphisms and
#!  uncomputable lifts and colifts>
H := FreeInternalModule( U, ModSV );;

nu6 := Support( F[6] )[4];
#! <x_[6, 4]>
c1 := UniversalMorphismFromFreeModule( F, nu6, 1 );;
c2 := UniversalMorphismFromFreeModule( F, nu6, 2 );;
c := 2 * c1 - 3 * c2;;
Display( c[6] );
#! Component: (x_[6, 4])
#! 
#! 2,-3,0,0
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------

a := InternalElement( SV, Support( SV[1] )[1], 1 );;
b := InternalElement( SV, Support( SV[2] )[1], 1 );;
c := InternalElement( SV, Support( SV[2] )[2], 1 );;
d := InternalElement( SV, Support( SV[3] )[3], 1 );;

cc := UniversalMorphismFromFreeModule( c );;
dd := UniversalMorphismFromFreeModule( d );;

pp := ProjectionInFactorOfFiberProduct( [ cc, dd ], 1 );;
qq := ProjectionInFactorOfFiberProduct( [ cc, dd ], 2 );;

ff := PreCompose( pp, cc ) - PreCompose( qq, dd );;
Set( List( Sublist( ff, [ 0 .. 5 ] ), IsZero ) );
#! [ true ]

ss := UniversalMorphismIntoDirectSum( [ pp, -qq ] );;
tt := UniversalMorphismFromDirectSum( [ cc, dd ] );;

homology := HomologyObject( ss, tt );;
Set( List( Sublist( homology, [ 0 .. 5 ] ), IsZero ) );
#! [ true ]

sigma3 := Support( SV[3] )[1];
#! <x_[3, 1]>
chi3 := Support( SV[3] )[2];
#! <x_[3, 2]>
nu3 := Support( SV[3] )[3];
#! <x_[3, 4]>

e1 := InternalElement( SV, sigma3, 1 );;
e2 := InternalElement( SV, chi3, 1 );;
e3 := InternalElement( SV, chi3, 2 );;
e4 := InternalElement( SV, nu3, 1 );;

e := e1 + 2 * e2 - 1/3 * e3 + e4;
#! degree: 3
#! 
#! Component: (x_[3, 1])
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_[3, 2])
#! 
#! 2,-1/3
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_[3, 4])
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------

e2 * e3 = BraidedMultiplication( e3, e2 );
#! true

m1 := InternalElement( F, nu6, 1 );;
m2 := InternalElement( F, nu6, 2 );;

m := 2 * m1 - 1/3 * m2;
#! degree: 6
#! 
#! Component: (x_[6, 4])
#! 
#! 2,-1/3,0,0
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------

#! @EndExample
