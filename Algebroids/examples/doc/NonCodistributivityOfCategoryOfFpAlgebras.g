#! @BeginChunk NonCodistributivityOfCategoryOfFpAlgebras

#! The category of (finitely presented) algebras is not codistributive.
#! An example was suggested by a referee in the paper the paper titled
#! "Distributivity ot coproducts over products" by B. A. Davey and H. Werner,
#! Algebra Universalis, 12 (1981) 387-394.

#! @Example
LoadPackage( "Algebroids", false );
#! true
F := HomalgRingOfIntegers( 2 );
#! GF(2)
Alg_F := CategoryOfFpAlgebras( F );
#! CategoryOfFpAlgebras( GF(2) )
F0 := InitialObject( Alg_F );
#! <An object in CategoryOfFpAlgebras( GF(2) )>
Display( F0 );
#! GF(2) / [  ]
A := DirectProduct( F0, F0 );
#! <An object in CategoryOfFpAlgebras( GF(2) )>
Dimension( A );
#! 2
B := F0;
#! <An object in CategoryOfFpAlgebras( GF(2) )>
C := F0;
#! <An object in CategoryOfFpAlgebras( GF(2) )>
eta := LeftCocartesianCodistributivityExpanding( A, [ B, C ] );
#! <A morphism in CategoryOfFpAlgebras( GF(2) )>
IsWellDefined( eta );
#! true
Dimension( Source( eta ) );
#! infinity
Dimension( Target( eta ) );
#! 4
#! @EndExample

#! @EndChunk
