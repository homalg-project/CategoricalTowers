#! @Chunk InternalMonoidInLazyCategory

#! @Example

LoadPackage( "InternalModules", false );
#! true
LoadPackage( "LazyCategories", false );
#! true
zz := HomalgRingOfIntegers( );
#! Z
Zmat := CategoryOfRows( zz );;
#! Rows( Z )
L := LazyCategory( Zmat : primitive_operations := true );
#! LazyCategory( Rows( Z ) )
MonZmat := CategoryOfMonoids( L );
#! CategoryOfMonoids( LazyCategory( Rows( Z ) ) )
Display( MonZmat );
#! A CAP category with name CategoryOfMonoids( LazyCategory( Rows( Z ) ) ):
#! 
#! 29 primitive operations were used to derive 85 operations for this category
#! which algorithmically
#! * IsCategoryWithInitialObject
#! * IsCartesianCategory
#! * IsSymmetricMonoidalCategory
I := TensorUnit( MonZmat );
#! <An object in CategoryOfMonoids( LazyCategory( Rows( Z ) ) )>
Assert( 0, IsWellDefined( I ) );
Assert( 0, IsInitial( I ) );
T := TerminalObject( MonZmat );
#! <An object in CategoryOfMonoids( LazyCategory( Rows( Z ) ) )>
Assert( 0, IsTerminal( T ) );
U := TensorUnit( Zmat );
#! <A row module over Z of rank 1>
V := 4 / Zmat;;
#! <A row module over Z of rank 4>
V2 := TensorProduct( V, V );
#! <A row module over Z of rank 16>
unit := [ [ 1, 0, 0, 1 ] ];;
unit := HomalgMatrix( unit, 1, 4, zz );;
unit := CategoryOfRowsMorphism( U, unit, V );
#! <A morphism in Rows( Z )>
mult := HomalgIdentityMatrix( 4, zz );;
mult := List( [ 1 .. 4 ], r -> ConvertRowToMatrix( CertainRows( mult, [ r ] ), 2, 2 ) );;
mult := List( mult, a -> List( mult, b -> ConvertMatrixToRow( a * b ) ) );;
mult := UnionOfRows( Concatenation( mult ) );;
mult := CategoryOfRowsMorphism( V2, mult, V );
#! <A morphism in Rows( Z )>
multL := AsMorphismInLazyCategory( TensorProduct( V / L, V / L ), mult, V / L );;
M := ObjectConstructor( MonZmat, Triple( V / L, unit / L, multL ) );
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
#! <An object in CategoryOfMonoids( LazyCategory( Rows( Z ) ) )>
Assert( 0, IsWellDefined( A ) );
Assert( 0, IsWellDefined( UniversalMorphismFromInitialObject( A ) ) );
pr1 := ProjectionInFactorOfDirectProduct( D, 1 );
#! <A morphism in CategoryOfMonoids( LazyCategory( Rows( Z ) ) )>
pr2 := ProjectionInFactorOfDirectProduct( D, 2 );
#! <A morphism in CategoryOfMonoids( LazyCategory( Rows( Z ) ) )>
pr3 := ProjectionInFactorOfDirectProduct( D, 3 );
#! <A morphism in CategoryOfMonoids( LazyCategory( Rows( Z ) ) )>
Assert( 0, IsOne( UniversalMorphismIntoDirectProduct( [ pr1, pr2, pr3 ] ) ) );
C := DualComonoid( A );
Assert( 0, IsWellDefined( C ) );
Assert( 0, IsWellDefined( UniversalMorphismIntoTerminalObject( C ) ) );
BimonZmat := CategoryOfBimonoids( L );
#! CategoryOfBimonoids( LazyCategory( Rows( Z ) ) )
Assert( 0, IsWellDefined( TerminalObject( BimonZmat ) ) );
Assert( 0, IsWellDefined( DualOnObjects( TerminalObject( BimonZmat ) ) ) );
#! @EndExample
