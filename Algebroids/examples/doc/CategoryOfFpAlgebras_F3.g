#! @Chunk CategoryOfFpAlgebras_F

#! @Example

LoadPackage( "Algebroids", false );
#! true
q := FinQuiver( "q(o)[g:o->o,x:o->o]" );
#! FinQuiver( "q(o)[g:o-≻o,x:o-≻o]" )
P := PathCategory( q );
#! PathCategory( FinQuiver( "q(o)[g:o-≻o,x:o-≻o]" ) )
F := HomalgRingOfIntegersInSingular( 3 );
#! GF(3)
L := F[P];
#! GF(3)-LinearClosure( PathCategory( FinQuiver( "q(o)[g:o-≻o,x:o-≻o]" ) ) )
Q := L / [ L.g^2-L.id_o, L.x^3-L.x, L.gx+L.xg ];
#! GF(3)-LinearClosure( PathCategory( FinQuiver( "q(o)[g:o-≻o,x:o-≻o]" ) ) )
#! / [ 1*g^2, 1*x^3 - 1*x, 1*g⋅x + 1*x⋅g ]
Dimension( Q );
#! 6;
a := LinearCategoryOnOneObjectAsInternalMonoid( Q );
#! <An object in CategoryOfMonoids( Rows( GF(3) ) )>
IsWellDefined( a );
#! true
Mon_F := CapCategory( a );
#! CategoryOfMonoids( Rows( GF(3) ) )
Mat_F := UnderlyingCategory( Mon_F );
#! Rows( GF(3) )
Alg_F := CategoryOfFpAlgebras( Mat_F );
#! 
A := Q / Alg_F;
#! 
FpAlgebraAsInternalMonoid( A ) = a;
#! true
o := A.id_o;
#! [1*id(o)]:(o) -≻ (o)
g := A.g;
#! [1*g]:(o) -≻ (o)
x := A.x;
#! [1*x]:(o) -≻ (o)
counit := Counit( A, [ 1, 0 ] );
#! <A split epimorphism in CategoryOfFpAlgebras( GF(3) )>
comult := Comultiplication( A,
                  [ [ [ g, g ] ],
                    [ [ o, x ], [ x, o ] ] ] );;
#! <A morphism in CategoryOfFpAlgebras( GF(3) )>
Bialg_F := CategoryOfFpBialgebras( Alg_F );
#! CategoryOfFpBialgebras( GF(3) )
FpB := Bimonoid( Bialg_F, A, counit, comult );
#! <An object in CategoryOfFpBialgebras( GF(3) )>
IsWellDefined( FpB );
#! true
B := FpBialgebraAsInternalBimonoid( FpB );
#! <An object in CategoryOfBimonoids( Rows( GF(3) ) )>
IsWellDefined( B );
#! true

antipode := Antipode( A, [ g, -x ] );
#! <A morphism in CategoryOfFpAlgebras( GF(3) )>
HopfAlg_F := CategoryOfFpHopfAlgebras( Bialg_F );
#! CategoryOfFpHopfAlgebras( GF(3) )
FpH := HopfMonoid( HopfAlg_F, A, counit, comult, antipode );
#! <An object in CategoryOfFpHopfAlgebras( GF(3) )>
IsWellDefined( FpH );
#! true

H := FpHopfAlgebraAsInternalHopfMonoid( FpH );
#! <An object in CategoryOfBimonoids( Rows( GF(3) ) )>
Assert( 0, IsWellDefined( H ) );
#! true

LoadPackage( "FunctorCategories", false );
#! true
YA := YonedaFpMatrixAlgebra( A );
#! <An object in CategoryOfFpMatrixAlgebras( GF(2) )>
IsWellDefined( YA );
#! true
YB := YonedaFpMatrixBialgebra( FpB );
#! <An object in CategoryOfFpMatrixBialgebras( GF(2) )>
Assert( 0, IsWellDefined( YB ) );
#! true
YH := YonedaFpMatrixHopfAlgebra( FpH );
#! <An object in CategoryOfFpMatrixHopfAlgebras( GF(2) )>
Assert( 0, IsWellDefined( YH ) );

MatAlg_F := CapCategory( YA );
#! CategoryOfFpMatrixAlgebras( GF(2) )
mg := HomalgDiagonalMatrix( [ 1, -1, 1, -1 ], F ) / Mat_F;
#! <A morphism in Rows( GF(2) )>
mx := DiagMat( [
              HomalgZeroMatrix( 2, 2, F ),
              CertainRows( HomalgIdentityMatrix( 2, F ), [ 2, 1 ] ) ] ) / Mat_F;
#! <A morphism in Rows( GF(2) )>
matrix_generators := Pair( 4 / Mat_F, [ mg, mx ] );
#! [ <A row module over GF(2) of rank 4>,\
#!   [ <A morphism in Rows( GF(2) )>, <A morphism in Rows( GF(2) )> ] ]
M := ObjectConstructor( MatAlg_F, Pair( A, matrix_generators ) );
#! <An object in CategoryOfFpMatrixAlgebras( GF(2) )>

Assert( 0, IsWellDefined( FpMatrixAlgebraAsInternalMonoid( M ) ) );

Mcounit := Counit( M, [ 1, 0 ] );
#! <A split epimorphism in CategoryOfFpMatrixAlgebras( GF(3) )>
Mcomult := Comultiplication( M,
                  [ [ [ g, g ] ],
                    [ [ o, x ], [ x, o ] ] ] );;
#! <A morphism in CategoryOfFpMatrixAlgebras( GF(3) )>
Mantipode := Antipode( M, [ g, -x ] );
#! <A morphism in CategoryOfFpMatrixAlgebras( GF(3) )>

MatBialg_F := CategoryOfFpMatrixBialgebras( MatAlg_F );

MB := Triple( M, Mcounit, Mcomult ) / MatBialg_F;

Assert( 0, IsWellDefined( MB ) );

Assert( 0, IsWellDefined( FpMatrixBialgebraAsInternalBimonoid( MB ) ) );

HopfMatAlg_F := CategoryOfFpMatrixHopfAlgebras( MatBialg_F );

MH := [ M, Mcounit, Mcomult, Mantipode ] / HopfMatAlg_F;

Assert( 0, IsWellDefined( MH ) );

Assert( 0, IsWellDefined( FpMatrixHopfAlgebraAsInternalHopfMonoid( MH ) ) );

partial_counit := rec( g := 1, x := 0 );
partial_comult := rec( g := [ [ g, g ] ] );
partial_antipode := rec( g := g );

bimonoid_variety := AffineVarietyOfBimonoids( a, partial_counit, partial_comult );

Mbimonoid_variety := AffineVarietyOfBimonoids( M, partial_counit, partial_comult );

S := UnderlyingRing( bimonoid_variety );

bimonoid_bas := BasisOfRows( UnderlyingColumn( bimonoid_variety ) );

Mbimonoid_bas := BasisOfRows( S * UnderlyingColumn( bimonoid_variety ) );

Assert( 0, bimonoid_bas = Mbimonoid_bas );

hopf_monoid_variety := AffineVarietyOfHopfMonoids( a, partial_counit, partial_comult, partial_antipode );

R := UnderlyingRing( hopf_monoid_variety );

Assert( 0, IsWellDefined( ( UnderlyingRing( hopf_monoid_variety ) / UnderlyingColumn( hopf_monoid_variety ) ) * ParametrizedObject( hopf_monoid_variety ) ) );

hopf_monoid_bas := BasisOfRows( UnderlyingColumn( hopf_monoid_variety ) );

#Hopf_monoid_variety := AffineVarietyOfHopfMonoids( A, partial_counit, partial_comult, partial_antipode );

#Hopf_monoid_bas := BasisOfRows( R * UnderlyingColumn( Hopf_monoid_variety ) );

#Assert( 0, hopf_monoid_bas = Hopf_monoid_bas );

MHopf_monoid_variety := AffineVarietyOfHopfMonoids( M, partial_counit, partial_comult, partial_antipode );

Assert( 0, IsWellDefined( ( UnderlyingRing( MHopf_monoid_variety ) / UnderlyingColumn( MHopf_monoid_variety ) ) * ParametrizedObject( MHopf_monoid_variety ) ) );

MHopf_monoid_bas := BasisOfRows( R * UnderlyingColumn( MHopf_monoid_variety ) );

Assert( 0, hopf_monoid_bas = MHopf_monoid_bas );

#! @EndExample
