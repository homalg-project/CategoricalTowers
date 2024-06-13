#! @Chunk CategoryOfFpAlgebras_F3

#! @Example

LoadPackage( "Algebroids", false );
#! true
q := FinQuiver( "q(o)[g:o->o,x:o->o]" );
#! FinQuiver( "q(o)[g:o→o,x:o→o]" )
P := PathCategory( q );
#! PathCategory( FinQuiver( "q(o)[g:o→o,x:o→o]" ) )
F := HomalgRingOfIntegersInSingular( 3 );
#! GF(3)
L := F[P];
#! GF(3)-LinearClosure( PathCategory( FinQuiver( "q(o)[g:o→o,x:o→o]" ) ) )
one := L.id_o;
#! 1*id(o):(o) → (o)
g := L.g;
#! 1*g:(o) → (o)
x := L.x;
#! 1*x:(o) → (o)
Q := L / [ g^2-one, x^3-x, g*x+x*g ];
#! GF(3)-LinearClosure( PathCategory( FinQuiver( "q(o)[g:o→o,x:o→o]" ) ) )
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
FpAlg_F := CategoryOfFpAlgebras( Mat_F );
#! 
A := Q / FpAlg_F;
#! 
FpAlgebraAsInternalMonoid( A ) = a;
#! true
counit := rec( g := 1, x := 0 );;
comult := rec( g := [ [ g, g ] ],
               x := [ [ one, x ], [ x, one ] ] );;
B := Bimonoid( A, counit, comult );
#! <An object in CategoryOfFpBialgebras( GF(3) )>
IsWellDefined( B );
#! true
b := FpBialgebraAsInternalBimonoid( B );
#! <An object in CategoryOfBimonoids( Rows( GF(3) ) )>
IsWellDefined( b );
#! true

antipode := rec( g := g, x := -x );;
H := HopfMonoid( A, counit, comult, antipode );
#! <An object in CategoryOfFpHopfAlgebras( GF(3) )>
IsWellDefined( H );
#! true

h := FpHopfAlgebraAsInternalHopfMonoid( H );
#! <An object in CategoryOfBimonoids( Rows( GF(3) ) )>
Assert( 0, IsWellDefined( h ) );
#! true

LoadPackage( "FunctorCategories", false );
#! true
YA := YonedaFpMatrixAlgebra( A );
#! <An object in CategoryOfFpMatrixAlgebras( GF(2) )>
IsWellDefined( YA );
#! true
YB := YonedaFpMatrixBialgebra( B );
#! <An object in CategoryOfFpMatrixBialgebras( GF(2) )>
Assert( 0, IsWellDefined( YB ) );
#! true
YH := YonedaFpMatrixHopfAlgebra( H );
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
M := Pair( A, matrix_generators ) / MatAlg_F;
#! <An object in CategoryOfFpMatrixAlgebras( GF(2) )>

Assert( 0, IsWellDefined( FpMatrixAlgebraAsInternalMonoid( M ) ) );

FpMatBialg_F := CategoryOfFpMatrixBialgebras( MatAlg_F );

MB := Bimonoid( M, counit, comult );

Assert( 0, IsWellDefined( MB ) );

Assert( 0, FpMatrixBialgebraAsInternalBimonoid( MB ) = b );

FpMatHopfAlg_F := CategoryOfFpMatrixHopfAlgebras( FpMatBialg_F );

MH := HopfMonoid( M, counit, comult, antipode );

Assert( 0, IsWellDefined( MH ) );

Assert( 0, FpMatrixHopfAlgebraAsInternalHopfMonoid( MH ) = h );

partial_comult := rec( g := [ [ g, g ] ] );
partial_antipode := rec( g := g );

bimonoid_variety := AffineVarietyOfBimonoids( a, counit, partial_comult );

MBimonoid_variety := AffineVarietyOfBimonoids( M, counit, partial_comult );

S := UnderlyingRing( bimonoid_variety );

bimonoid_bas := BasisOfRows( UnderlyingColumn( bimonoid_variety ) );

MBimonoid_bas := BasisOfRows( S * UnderlyingColumn( bimonoid_variety ) );

Assert( 0, bimonoid_bas = MBimonoid_bas );

MBimonoid_variety_smaller_embedding := EmbedInSmallerAmbientSpace( MBimonoid_variety );

MBimonoid_family := ParametrizedObject( MBimonoid_variety_smaller_embedding );

IsCocommutative( FpMatrixBialgebraAsInternalBimonoid( MBimonoid_family ) );
#! false

MBimonoid_components := List( Factors( MBimonoid_variety_smaller_embedding ), factor -> StandardizeObject( EmbedInSmallerAmbientSpace( factor ) ) );

MBimonoid_families := List( MBimonoid_components, irr -> UnderlyingRing( irr ) / BasisOfRows( UnderlyingColumn( irr ) ) * ParametrizedObject( irr ) );

#List( MBimonoid_families, family -> IsCocommutative( FpMatrixBialgebraAsInternalBimonoid( family ) ) );

MBimonoid_points := List( MBimonoid_components, AClosedPoint );

MBimonoid_noncocommutative := List( MBimonoid_points{[1,2,4,5]}, FpMatrixBialgebraAsInternalBimonoid );

hopf_monoid_variety := AffineVarietyOfHopfMonoids( a, counit, partial_comult, partial_antipode );

R := UnderlyingRing( hopf_monoid_variety );

Assert( 0, IsWellDefined( ( UnderlyingRing( hopf_monoid_variety ) / UnderlyingColumn( hopf_monoid_variety ) ) * ParametrizedObject( hopf_monoid_variety ) ) );

hopf_monoid_bas := BasisOfRows( UnderlyingColumn( hopf_monoid_variety ) );

#Hopf_monoid_variety := AffineVarietyOfHopfMonoids( A, counit, partial_comult, partial_antipode );

#Hopf_monoid_bas := BasisOfRows( R * UnderlyingColumn( Hopf_monoid_variety ) );

#Assert( 0, hopf_monoid_bas = Hopf_monoid_bas );

MHopf_monoid_variety := AffineVarietyOfHopfMonoids( M, counit, partial_comult, partial_antipode );

Assert( 0, IsWellDefined( ( UnderlyingRing( MHopf_monoid_variety ) / UnderlyingColumn( MHopf_monoid_variety ) ) * ParametrizedObject( MHopf_monoid_variety ) ) );

MHopf_monoid_bas := BasisOfRows( R * UnderlyingColumn( MHopf_monoid_variety ) );

Assert( 0, hopf_monoid_bas = MHopf_monoid_bas );

MHopf_monoid_variety_smaller_embedding := EmbedInSmallerAmbientSpace( MHopf_monoid_variety );

MHopf_monoid_family := ParametrizedObject( MHopf_monoid_variety_smaller_embedding );

Display( MHopf_monoid_family );

Assert( 0, IsCocommutative( FpMatrixHopfAlgebraAsInternalHopfMonoid( MHopf_monoid_family ) ) );

#! @EndExample
