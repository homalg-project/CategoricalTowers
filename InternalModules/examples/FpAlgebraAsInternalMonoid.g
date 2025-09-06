#! @Chunk FpAlgebraAsInternalMonoid

#! @Example

LoadPackage( "InternalModules", false );
#! true
LoadPackage( "Algebroids", false );
#! true
q := FinQuiver( "q(o)[g:o->o,x:o->o]" );
#! FinQuiver( "q(o)[g:o-≻o,x:o-≻o]" )
F := PathCategory( q );
#! PathCategory( FinQuiver( "q(o)[g:o-≻o,x:o-≻o]" ) )
F := HomalgRingOfIntegers( 3 );
#! GF(3)
L := F[F];
#! GF(3)-LinearClosure( PathCategory( FinQuiver( "q(o)[g:o-≻o,x:o-≻o]" ) ) )
Q := L / [ L.g^2-L.id_o, L.x^3-L.x, L.gx+L.xg ];
#! GF(3)-LinearClosure( PathCategory( FinQuiver( "q(o)[g:o-≻o,x:o-≻o]" ) ) ) \
#! / [ 1*g^2, 1*x^3 - 1*x, 1*g⋅x + 1*x⋅g ]
Dimension( Q );
#! 6;
A := LinearCategoryOnOneObjectAsInternalMonoid( Q );
#! <An object in CategoryOfMonoids( Rows( GF(3) ) )>
Assert( 0, IsWellDefined( A ) );
#! true
Mon_F := CapCategory( A );
#! CategoryOfMonoids( Rows( GF(3) ) )
Mat_F := UnderlyingCategory( Mon_F );
#! Rows( GF(3) )
FpAlg_F := CategoryOfFpAlgebras( Mat_F );
#! CategoryOfFpAlgebras( GF(3) )
FpAlgebraAsInternalMonoid( Q / FpAlg_F ) = A;
#! true
o := A.id_o;
#! [1*id(o)]:(o) -≻ (o)
g := A.g;
#! [1*g]:(o) -≻ (o)
x := A.x;
#! [1*x]:(o) -≻ (o)
counit := rec( g := 1,
               x := 0 );;
comult := rec( g := [ [ g, g ] ],
               x := [ [ o, x ], [ x, o ] ] );;
B := Bimonoid( A, counit, comult );
#! <An object in CategoryOfBimonoids( Rows( GF(3) ) )>
antipode := rec( g := g,
                 x := -x );;
H := HopfMonoid( A, counit, comult, antipode );
#! <An object in CategoryOfHopfMonoids( Rows( GF(3) ) )>
Assert( 0, IsWellDefined( B ) );
Assert( 0, IsWellDefined( H ) );
#! @EndExample
