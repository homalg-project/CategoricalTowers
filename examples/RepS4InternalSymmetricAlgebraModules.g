#! @Chapter Examples and tests

#! @Section Examples

LoadPackage( "InternalModules" );

#! @Example

G := SymmetricGroup( 4 );;
irr := Irr( G );;
one := GIrreducibleObject( irr[5] );;
SetString( one, "1" );;
sigma := GIrreducibleObject( irr[1] );;
SetString( sigma, "sigma" );;
rho := GIrreducibleObject( irr[3] );;
SetString( rho, "rho" );;
nu := GIrreducibleObject( irr[4] );;
SetString( nu, "nu" );;
chi := GIrreducibleObject( irr[2] );;
SetString( chi, "chi" );;

RepG := RepresentationCategory( G );;
v := RepresentationCategoryObject( irr[2], RepG );;
ZRepG := PositivelyZGradedCategory( RepG );
#! The positively graded category of The representation category of
#! SymmetricGroup( [ 1 .. 4 ] )
V := ObjectInPositivelyZGradedCategory( v, 1 );;
SVMod := CategoryOfLeftSModules( v );
#! Abelian category of left modules over the internal symmetric algebra of
#! 1*(x_chi)
#! with undecidable (mathematical) equality of morphisms and
#! uncomputable lifts and colifts
ModSV := CategoryOfRightSModules( v );;
SV := UnderlyingActingObject( SVMod );
#! <An object in The positively graded category of
#!  The representation category of SymmetricGroup( [ 1 .. 4 ] )>
S := SymmetricAlgebraAsLeftModule( v );
#! <An object in Abelian category of
#!  left modules over the internal symmetric algebra of 1*(x_chi)
#!  with undecidable (mathematical) equality of morphisms and
#!  uncomputable lifts and colifts>

u := RepresentationCategoryObject( irr[2], RepG );;
U := ObjectInPositivelyZGradedCategory( u, 3 );;
F := FreeInternalModule( U, SVMod );
#! <An object in Abelian category of
#!  left modules over the internal symmetric algebra of 1*(x_chi)
#!  with undecidable (mathematical) equality of morphisms and
#!  uncomputable lifts and colifts>
H := FreeInternalModule( U, ModSV );;

nu := Support( F[6] )[4];
#! <x_nu>
c1 := UniversalMorphismFromFreeModule( F, nu, 6, 1 );;
c2 := UniversalMorphismFromFreeModule( F, nu, 6, 2 );;
c := 2 * c1 - 3 * c2;;
Display( c[6] );
#! Component: (x_nu)
#! 
#! 2,-3,0,0
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------

a := InternalElement( SV, Support( SV[1] )[1], 1, 1 );;
b := InternalElement( SV, Support( SV[2] )[1], 2, 1 );;
c := InternalElement( SV, Support( SV[2] )[2], 2, 1 );;
d := InternalElement( SV, Support( SV[3] )[3], 3, 1 );;

cc := UniversalMorphismFromFreeModule( c );;
dd := UniversalMorphismFromFreeModule( d );;

pp := ProjectionInFactorOfFiberProduct( [ cc, dd ], 1 );;
qq := ProjectionInFactorOfFiberProduct( [ cc, dd ], 2 );;

ff := PreCompose( pp, cc ) - PreCompose( qq, dd );;
Set( List( Sublist( ff, [ 0 .. 5 ] ), IsZero ) );
#! [ true ]

ss := UniversalMorphismIntoDirectSum( pp, -qq );;
tt := UniversalMorphismFromDirectSum( cc, dd );;

homology := HomologyObject( ss, tt );;
Set( List( Sublist( homology, [ 0 .. 5 ] ), IsZero ) );
#! [ true ]

sigma := Support( SV[3] )[1];
#! <x_sigma>
chi := Support( SV[3] )[2];
#! <x_chi>
nu := Support( SV[3] )[3];
#! <x_nu>

e1 := InternalElement( SV, sigma, 3, 1 );;
e2 := InternalElement( SV, chi, 3, 1 );;
e3 := InternalElement( SV, chi, 3, 2 );;
e4 := InternalElement( SV, nu, 3, 1 );;

e := e1 + 2 * e2 - 1/3 * e3 + e4;
#! degree: 3
#! 
#! Component: (x_sigma)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_chi)
#! 
#! 2,-1/3
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_nu)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------

e2 * e3 = BraidedMultiplication( e3, e2 );
#! true

m1 := InternalElement( F, nu, 6, 1 );;
m2 := InternalElement( F, nu, 6, 2 );;

m := 2 * m1 - 1/3 * m2;
#! degree: 6
#! 
#! Component: (x_nu)
#! 
#! 2,-1/3,0,0
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------

# computations in the proposal
sigma := RepresentationCategoryObject( irr[1], RepG );;
rho := RepresentationCategoryObject( irr[3], RepG );;
Display( AssociatorRightToLeft( rho, sigma, rho ) );
#! Component: (x_sigma)
#! 
#! -1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_rho)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_1)
#! 
#! -1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
Display( Braiding( rho, rho ) );
#! Component: (x_sigma)
#! 
#! -1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_rho)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_1)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------

chi1 := InternalElement( SV, GIrreducibleObject( irr[2] ), 1, 1 );;
rho2 := InternalElement( SV, GIrreducibleObject( irr[3] ), 2, 1 );;
nu2 := InternalElement( SV, GIrreducibleObject( irr[4] ), 2, 1 );;
nu3 := InternalElement( SV, GIrreducibleObject( irr[4] ), 3, 1 );;
chi1 * ( chi1 * ( chi1 * chi1 ) );
#! degree: 4
#! 
#! Component: (x_chi)
#! 
#! -2
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_rho)
#! 
#! 3,-31
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_nu)
#! 
#! 5,6
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_1)
#! 
#! 5,3
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------

#! @EndExample
