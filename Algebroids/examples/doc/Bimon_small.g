#! @BeginChunk Bimon_small

#! @Example
LoadPackage( "Algebroids", false );
#! true
F := HomalgFieldOfRationalsInSingular( );
#! Q
MatAlg_F := CategoryOfFpMatrixAlgebras( F );
#! CategoryOfFpMatrixAlgebras( Q )
Display( MatAlg_F );
#! 27 primitive operations were used to derive 76 operations for this category \
#! which algorithmically
#! * IsCategoryWithInitialObject
#! * IsCartesianCategory
#! * IsSymmetricMonoidalCategory
#! and not yet algorithmically
#! * IsCategoryWithCoequalizers
Alg_F := UnderlyingCategory( MatAlg_F );
#! CategoryOfFpAlgebras( Q )
Display( Alg_F );
#! A CAP category with name CategoryOfFpAlgebras( Q ):
#! 
#! 31 primitive operations were used to derive 130 operations for this category \
#! which algorithmically
#! * IsFiniteCocompleteCategory
#! * IsBicartesianCategory
#! * IsSymmetricMonoidalCategory
q := FinQuiver( "q(o)[e:o->o]" );
#! FinQuiver( "q(o)[e:o-≻o]" )
P := PathCategory( q );
#! PathCategory( FinQuiver( "q(o)[e:o-≻o]" ) )
L := F[P];
#! Q-LinearClosure( PathCategory( FinQuiver( "q(o)[e:o-≻o]" ) ) )
Q := L / [ L.ee - L.id_o ];
#! Q-LinearClosure( PathCategory( FinQuiver( "q(o)[e:o-≻o]" ) ) ) / \
#! [ 1*e^2 + 1*id(o) ]
a := LinearCategoryOnOneObjectAsInternalMonoid( Q );
#! 
A := Q / Alg_F;
#! <An object in CategoryOfFpAlgebras( Q )>
IsWellDefined( A );
#! true
d := Dimension( A );
#! 2
Display( A );
#! Q<e> / [ 1*e^2 + 1*id(o) ]
Mat_F := UnderlyingCategoryOfMatrices( MatAlg_F );
#! Rows( Q )
me := HomalgDiagonalMatrix( [ 1, -1 ], F ) / Mat_F;
#! <A morphism in Rows( Q )>
matrix_generators := Pair( 2 / Mat_F, [ me ] );
#! [ <A row module over Q of rank 2>,\
#!   [ <A morphism in Rows( Q )> ] ]
M := ObjectConstructor( MatAlg_F, Pair( A, matrix_generators ) );
#! <An object in CategoryOfFpMatrixAlgebras( Q )>

#Assert( 0, a = FpAlgebraAsInternalMonoid( A ) );

Assert( 0, IsWellDefined( a ) );
Assert( 0, IsWellDefined( A ) );
Assert( 0, IsWellDefined( M ) );

Bimonoid_variety := AffineVarietyOfBimonoids( A );

Assert( 0, IsWellDefined( ( UnderlyingRing( Bimonoid_variety ) / UnderlyingColumn( Bimonoid_variety ) ) * ParametrizedObject( Bimonoid_variety ) ) );

Bas := BasisOfRows( UnderlyingColumn( Bimonoid_variety ) );

R := UnderlyingRing( Bimonoid_variety );

bimonoid_variety := AffineVarietyOfBimonoids( a );

Assert( 0, IsWellDefined( ( UnderlyingRing( bimonoid_variety ) / UnderlyingColumn( bimonoid_variety ) ) * ParametrizedObject( bimonoid_variety ) ) );

bas := BasisOfRows( R * UnderlyingColumn( bimonoid_variety ) );

Assert( 0, bas = Bas );

MBimonoid_variety := AffineVarietyOfBimonoids( M );

Assert( 0, IsWellDefined( ( UnderlyingRing( MBimonoid_variety ) / UnderlyingColumn( MBimonoid_variety ) ) * ParametrizedObject( MBimonoid_variety ) ) );

MBas := BasisOfRows( R * UnderlyingColumn( MBimonoid_variety ) );

Assert( 0, bas = MBas );

Hopf_monoid_variety := AffineVarietyOfHopfMonoids( A );

Assert( 0, IsWellDefined( ( UnderlyingRing( Hopf_monoid_variety ) / UnderlyingColumn( Hopf_monoid_variety ) ) * ParametrizedObject( Hopf_monoid_variety ) ) );

HBas := BasisOfRows( UnderlyingColumn( Hopf_monoid_variety ) );

S := UnderlyingRing( Hopf_monoid_variety );

hopf_monoid_variety := AffineVarietyOfHopfMonoids( a );

Assert( 0, IsWellDefined( ( UnderlyingRing( hopf_monoid_variety ) / UnderlyingColumn( hopf_monoid_variety ) ) * ParametrizedObject( hopf_monoid_variety ) ) );

Hbas := BasisOfRows( S * UnderlyingColumn( hopf_monoid_variety ) );

Assert( 0, Hbas = HBas );

MHopf_monoid_variety := AffineVarietyOfHopfMonoids( M );

Assert( 0, IsWellDefined( ( UnderlyingRing( MHopf_monoid_variety ) / UnderlyingColumn( MHopf_monoid_variety ) ) * ParametrizedObject( MHopf_monoid_variety ) ) );

MHBas := BasisOfRows( S * UnderlyingColumn( MHopf_monoid_variety ) );

Assert( 0, Hbas = MHBas );

#! @EndExample

#! @EndChunk
