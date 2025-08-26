gap> START_TEST("CategoryOfFpMatrixAlgebras.tst");

# doc/_Chunks.xml:1710-1816
gap> LoadPackage( "Algebroids", false );
true
gap> F2 := HomalgRingOfIntegersInSingular( 2 );
GF(2)
gap> MatAlg_F2 := CategoryOfFpMatrixAlgebras( F2 );
CategoryOfFpMatrixAlgebras( GF(2) )
gap> T := TerminalObject( MatAlg_F2 );
<An object in CategoryOfFpMatrixAlgebras( GF(2) )>
gap> iota := UniversalMorphismFromInitialObject( T );
<A morphism in CategoryOfFpMatrixAlgebras( GF(2) )>
gap> I := Source( iota );
<An object in CategoryOfFpMatrixAlgebras( GF(2) )>
gap> T := TerminalObject( MatAlg_F2 );
<An object in CategoryOfFpMatrixAlgebras( GF(2) )>
gap> IsWellDefined( T );
true
gap> iota := UniversalMorphismFromInitialObject( T );
<A morphism in CategoryOfFpMatrixAlgebras( GF(2) )>
gap> IsWellDefined( iota );
true
gap> I := Source( iota );
<An object in CategoryOfFpMatrixAlgebras( GF(2) )>
gap> K := TensorUnit( MatAlg_F2 );
<An object in CategoryOfFpMatrixAlgebras( GF(2) )>
gap> IsWellDefined( K );
true
gap> K = I;
true
gap> Alg_F2 := UnderlyingCategoryOfFpAlgebras( MatAlg_F2 );
CategoryOfFpAlgebras( GF(2) )
gap> Mat_F2 := UnderlyingCategoryOfMatrices( MatAlg_F2 );
Rows( GF(2) )
gap> q := FinQuiver( "q(o)[x:o->o,y:o->o]" );
FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" )
gap> P := PathCategory( q );
PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) )
gap> L := F2[P];
GF(2)-LinearClosure( PathCategory( \
FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) ) )
gap> relations := [ L.x^2 - L.x,  L.y^3 - L.y,  L.xy - L.y * (L.x+L.id_o) ];
[ 1*x^2 + 1*x:(o) -≻ (o), 1*y^3 + 1*y:(o) -≻ (o),\
  1*y⋅x + 1*x⋅y + 1*y:(o) -≻ (o) ]
gap> Q := L / relations;
GF(2)-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) ) ) / \
[ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]
gap> Dimension( Q );
6
gap> A := Q / Alg_F2;
<An object in CategoryOfFpAlgebras( GF(2) )>
gap> IsWellDefined( A );
true
gap> Dimension( A );
6
gap> mx := HomalgDiagonalMatrix( [ 1, 0, 1, 0 ], F2 ) / Mat_F2;
<A morphism in Rows( GF(2) )>
gap> my := DiagMat( [
>               HomalgZeroMatrix( 2, 2, F2 ),
>               CertainRows( HomalgIdentityMatrix( 2, F2 ), [ 2, 1 ] ) ] ) / Mat_F2;
<A morphism in Rows( GF(2) )>
gap> matrix_generators := Pair( 4 / Mat_F2, [ mx, my ] );
[ <A row module over GF(2) of rank 4>,\
  [ <A morphism in Rows( GF(2) )>, <A morphism in Rows( GF(2) )> ] ]
gap> M := ObjectConstructor( MatAlg_F2, Pair( A, matrix_generators ) );
<An object in CategoryOfFpMatrixAlgebras( GF(2) )>
gap> IsWellDefined( M );
true
gap> M = Pair( ( L / Alg_F2 ) / relations, matrix_generators ) / MatAlg_F2;
true
gap> M.x;
[1*x]:(o) -≻ (o)
gap> M.y;
[1*y]:(o) -≻ (o)
gap> Dimension( M );
6
gap> NrGenerators( M );
2
gap> Generators( M );
[ 1*x:(o) -≻ (o), 1*y:(o) -≻ (o) ]
gap> MatrixGenerators( M ) = [ mx, my ];
true
gap> AssociatedLinearClosureOfPathCategory( M );
GF(2)-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) ) )
gap> DefiningRelations( M );
[ 1*x^2 + 1*x:(o) -≻ (o), 1*y^3 + 1*y:(o) -≻ (o), \
  1*y⋅x + 1*x⋅y + 1*y:(o) -≻ (o) ]
gap> AssociatedQuotientCategoryOfLinearClosureOfPathCategory( M );
GF(2)-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) ) ) \
/ [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]
gap> GroebnerBasisOfDefiningRelations( M );
[ 1*x^2 + 1*x:(o) -≻ (o), 1*y^3 + 1*y:(o) -≻ (o), \
  1*y⋅x + 1*x⋅y + 1*y:(o) -≻ (o) ]
gap> TestMonoidalUnitorsForInvertibility( MatAlg_F2, M );
true
gap> TestMonoidalTriangleIdentity( MatAlg_F2, M, M );
true
gap> TestAssociatorForInvertibility( MatAlg_F2, M, M, M );
true
gap> TestMonoidalPentagonIdentity( MatAlg_F2, M, M, M, M );
true
gap> TestBraidingForInvertibility( MatAlg_F2, M, M );
true
gap> TestBraidingCompatibility( MatAlg_F2, M, M, M );
true
gap> BraidingInverse( M, M ) = Braiding( M, M );
true
gap> TestCartesianTriangleIdentity( MatAlg_F2, M, I );
true
gap> TestCartesianAssociatorForInvertibility( MatAlg_F2, M, I, T );
true
gap> TestCartesianPentagonIdentity( MatAlg_F2, I, M, I, T );
true
gap> TestCartesianBraidingForInvertibility( MatAlg_F2, M, I );
true
gap> TestCartesianBraidingCompatibility( MatAlg_F2, I, M, T );
true
gap> CartesianBraidingInverse( M, I ) = CartesianBraiding( I, M );
true

#
gap> STOP_TEST("CategoryOfFpMatrixAlgebras.tst", 1);
