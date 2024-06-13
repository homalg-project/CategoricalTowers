#! @Chunk InternalMonoid

#! @Example

LoadPackage( "InternalModules", false );
#! true
zz := HomalgRingOfIntegers( );
#! Z
Zmat := CategoryOfRows( zz );;
#! Rows( Z )
MonZmat := CategoryOfMonoids( Zmat );
#! CategoryOfMonoids( Rows( Z ) )
Display( MonZmat );
#! A CAP category with name CategoryOfMonoids( Rows( Z ) ):
#! 
#! 29 primitive operations were used to derive 85 operations for this category
#! which algorithmically
#! * IsCategoryWithInitialObject
#! * IsCartesianCategory
#! * IsSymmetricMonoidalCategory
I := TensorUnit( MonZmat );
#! <An object in CategoryOfMonoids( Rows( Z ) )>
Assert( 0, IsWellDefined( I ) );
Assert( 0, IsInitial( I ) );
T := TerminalObject( MonZmat );
#! <An object in CategoryOfMonoids( Rows( Z ) )>
Assert( 0, IsTerminal( T ) );
U := TensorUnit( Zmat );
#! <A row module over Z of rank 1>
M := FullMatrixAlgebraAsInternalMonoid( 2, MonZmat );
#! <An object in Category of monoid objects>
Assert( 0, IsWellDefined( M ) );
id_M := IdentityMorphism( M );
#! <An identity morphism in Category of monoid objects>
Assert( 0, IsWellDefined( id_M ) );
Assert( 0, IsWellDefined( TensorProduct( M, M ) ) );
Assert( 0, IsWellDefined( TensorProduct( id_M, id_M ) ) );
Assert( 0, IsWellDefined( LeftUnitor( M ) ) );
Assert( 0, IsWellDefined( RightUnitor( M ) ) );
Assert( 0, IsWellDefined( AssociatorLeftToRight( M, I, M ) ) );
Assert( 0, IsWellDefined( Braiding( M, M ) ) );
Assert( 0, IsWellDefined( BraidingInverse( M, M ) ) );
Assert( 0, InverseForMorphisms( Braiding( M, M ) ) = BraidingInverse( M, M ) );
D := [ I, I, M ];
A := DirectProduct( D );
#! <An object in CategoryOfMonoids( Rows( Z ) )>
Assert( 0, IsWellDefined( A ) );
Assert( 0, IsWellDefined( UniversalMorphismFromInitialObject( A ) ) );
pr1 := ProjectionInFactorOfDirectProduct( D, 1 );
#! <A morphism in CategoryOfMonoids( Rows( Z ) )>
pr2 := ProjectionInFactorOfDirectProduct( D, 2 );
#! <A morphism in CategoryOfMonoids( Rows( Z ) )>
pr3 := ProjectionInFactorOfDirectProduct( D, 3 );
#! <A morphism in CategoryOfMonoids( Rows( Z ) )>
Assert( 0, IsOne( UniversalMorphismIntoDirectProduct( [ pr1, pr2, pr3 ] ) ) );
C := DualComonoid( A );
Assert( 0, IsWellDefined( C ) );
Assert( 0, IsWellDefined( UniversalMorphismIntoTerminalObject( C ) ) );
Assert( 0, DualMonoid( C ) = A );
BimonZmat := CategoryOfBimonoids( Zmat );
#! CategoryOfBimonoids( Rows( Z ) )
Display( BimonZmat );
#! A CAP category with name CategoryOfBimonoids( Rows( Z ) ):
#! 
#! 30 primitive operations were used to derive 106 operations for this category
#! which algorithmically
#! * IsCategoryWithTerminalObject
#! * IsRigidSymmetricClosedMonoidalCategory
B := FullTransformationMonoid( 2 ) / Zmat;
Assert( 0, IsWellDefined( B ) );
Assert( 0, IsWellDefined( UniversalMorphismFromZeroObject( B ) ) );
Assert( 0, IsWellDefined( UniversalMorphismIntoZeroObject( B ) ) );
Assert( 0, IsWellDefined( DualOnObjects( B ) ) );
Assert( 0, IsWellDefined( DualOnMorphisms( IdentityMorphism( B ) ) ) );
Assert( 0, IsOne( DualOnMorphisms( IdentityMorphism( B ) ) ) );

b := FullTransformationMonoid( 2 ) / SkeletalFinSets;
Assert( 0, IsWellDefined( b ) );
Assert( 0, IsWellDefined( UniversalMorphismFromZeroObject( b ) ) );
Assert( 0, IsWellDefined( UniversalMorphismIntoZeroObject( b ) ) );

HmonZmat := CategoryOfHopfMonoids( Zmat );
#! CategoryOfHopfMonoids( Rows( Z ) )
Display( HmonZmat );
#! A CAP category with name CategoryOfHopfMonoids( Rows( Z ) ):
#! 
#! 31 primitive operations were used to derive 123 operations for this category
#! which algorithmically
#! * IsSymmetricMonoidalCategory
#! * IsCategoryWithZeroObject
G := CyclicGroup( 4 ) / Zmat;
Assert( 0, IsWellDefined( G ) );
Assert( 0, IsWellDefined( DualOnObjects( G ) ) );
Assert( 0, IsWellDefined( UniversalMorphismFromZeroObject( G ) ) );
Assert( 0, IsWellDefined( UniversalMorphismIntoZeroObject( G ) ) );
Assert( 0, OppositeHopfMonoid( G ) = G );
Assert( 0, CoOppositeHopfMonoid( G ) = G );
Assert( 0, OppositeCoOppositeHopfMonoid( G ) = G );
Assert( 0, not DualOnObjects( G ) = G );
H := SymmetricGroup( 3 ) / Zmat;
Assert( 0, not OppositeHopfMonoid( H ) = H );
Assert( 0, CoOppositeHopfMonoid( H ) = H );

g := CyclicGroup( 4 ) / SkeletalFinSets;
Assert( 0, IsWellDefined( g ) );
Assert( 0, IsWellDefined( UniversalMorphismFromZeroObject( g ) ) );
Assert( 0, IsWellDefined( UniversalMorphismIntoZeroObject( g ) ) );
Assert( 0, OppositeHopfMonoid( g ) = g );
Assert( 0, CoOppositeHopfMonoid( g ) = g );
Assert( 0, OppositeCoOppositeHopfMonoid( g ) = g );
#! @EndExample
