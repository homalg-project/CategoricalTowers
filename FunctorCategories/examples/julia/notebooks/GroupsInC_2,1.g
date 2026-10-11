LoadPackage( "FunctorCategories", false );

q := FinQuiver( "q(o)[e:o->o]" );

P := PathCategory( q );

C := P / [ [ P.ee, P.e ] ];

PSh := PreSheaves( C );

Display( PSh );

T := TerminalObject( PSh );

InitialObject( PSh );

omega := SubobjectClassifier( PSh );

SomeProjectiveObject( omega );

EpimorphismFromSomeProjectiveObject( omega );

omega2 := DirectProduct( omega, omega );

HomStructure( omega2, omega );

homs := MorphismsOfExternalHom( omega2, omega );

p1 := ProjectionInFactorOfDirectProduct( [ omega, omega ], 1 );

p2 := ProjectionInFactorOfDirectProduct( [ omega, omega ], 2 );

Position( homs, p1 );

Position( homs, p2 );

assoc := Filtered( homs, mult -> AssociativitiyLawOfMonoid( PSh, omega, mult ) );

Length( assoc );

units := MorphismsOfExternalHom( T, omega );

List( units, IsMonomorphism );

cart := Cartesian( units, assoc );

left := Filtered( cart, pair -> LeftUnitLawOfMonoid( PSh, omega, pair[1], pair[2] ) );

Length( left );

right := Filtered( left, pair -> RightUnitLawOfMonoid( PSh, omega, pair[1], pair[2] ) );

Length( right );

Hmon := CategoryOfHopfMonoids( PSh );

Bimon := AssociatedCategoryOfBimonoids( Hmon );

Mon := AssociatedCategoryOfMonoids( Bimon );

t := UniversalMorphismIntoTerminalObject( omega );

delta := CartesianDiagonal( omega, 2 );

bimonoids := List( right, pair -> Bimonoid( Bimon, Triple( omega, pair[1], pair[2] ) / Mon, t, delta ) );

Length( bimonoids );

ForAll( bimonoids, IsWellDefined );

isos := Filtered( MorphismsOfExternalHom( omega, omega ), IsIsomorphism );

cart2 := Cartesian( bimonoids, isos );

left2 := Filtered( cart2, pair -> LeftAntipodeLawOfHopfMonoid( Bimon, pair[1], pair[2] ) );

Length( left2 );

right2 := Filtered( left2, pair -> RightAntipodeLawOfHopfMonoid( Bimon, pair[1], pair[2] ) );

Length( right2 );

groups := List( right2, pair -> HopfMonoid( Hmon, pair[1], pair[2] ) );

Length( groups );

ForAll( groups, IsWellDefined );
