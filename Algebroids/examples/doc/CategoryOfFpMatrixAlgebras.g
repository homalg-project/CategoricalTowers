#! @BeginChunk CategoryOfFpMatrixAlgebras

#! @Example
LoadPackage( "Algebroids", false );
#! true
F2 := HomalgRingOfIntegersInSingular( 2 );
#! GF(2)
MatAlg_F2 := CategoryOfFpMatrixAlgebras( F2 );
#! CategoryOfFpMatrixAlgebras( GF(2) )
Display( MatAlg_F2 );
#! A CAP category with name CategoryOfFpMatrixAlgebras( GF(2) ):
#! 
#! 24 primitive operations were used to derive 45 operations for this category \
#! which algorithmically
#! * IsCategoryWithInitialObject
#! * IsSymmetricMonoidalCategory
#! and not yet algorithmically
#! * IsCategoryWithCoequalizers
#! * IsCartesianCategory
Alg_F2 := UnderlyingCategoryOfFpAlgebras( MatAlg_F2 );
#! CategoryOfFpAlgebras( GF(2) )
Display( Alg_F2 );
#! A CAP category with name CategoryOfFpAlgebras( GF(2) ):
#! 
#! 31 primitive operations were used to derive 130 operations for this category \
#! which algorithmically
#! * IsFiniteCocompleteCategory
#! * IsBicartesianCategory
#! * IsSymmetricMonoidalCategory
Mat_F2 := UnderlyingCategoryOfMatrices( MatAlg_F2 );
#! Rows( GF(2) )
q1 := FinQuiver( "q(o)[x:o->o,y:o->o]" );
#! FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" )
P1 := PathCategory( q1 );
#! PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) )
L1 := F2[P1];
#! GF(2)-LinearClosure( PathCategory( \
#! FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) ) )
relations1 := [ L1.x^2 - L1.x,  L1.y^3 - L1.y,  L1.xy - L1.y * (L1.x+L1.id_o) ];
#! [ 1*x^2 + 1*x:(o) -≻ (o), 1*y^3 + 1*y:(o) -≻ (o),\
#!   1*y⋅x + 1*x⋅y + 1*y:(o) -≻ (o) ]
Q1 := L1 / relations1;
#! GF(2)-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) ) ) / \
#! [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]
Dimension( Q1 );
#! 6
A1 := Q1 / Alg_F2;
#! <An object in CategoryOfFpAlgebras( GF(2) )>
A1 = ( L1 / Alg_F2 ) / relations1;
#! true
IsWellDefined( A1 );
#! true
Dimension( A1 );
#! 6
Display( A1 );
#! GF(2)<x,y> / [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]
xx := HomalgDiagonalMatrix( [ 1, 0, 1, 0 ], F2 ) / Mat_F2;
#! <A morphism in Rows( GF(2) )>
yy := DiagMat( [
              HomalgZeroMatrix( 2, 2, F2 ),
              CertainRows( HomalgIdentityMatrix( 2, F2 ), [ 2, 1 ] ) ] ) / Mat_F2;
#! <A morphism in Rows( GF(2) )>
MA1 := Pair( A1, Pair( 4 / Mat_F2, [ xx, yy ] ) ) / MatAlg_F2;
#! <An object in CategoryOfFpMatrixAlgebras( GF(2) )>
IsWellDefined( MA1 );
#! true
Dimension( MA1 );
#! 6
NrGenerators( MA1 );
#! 2
Generators( MA1 );
#! [ 1*x:(o) -≻ (o), 1*y:(o) -≻ (o) ]
AssociatedLinearClosureOfPathCategory( MA1 );
#! GF(2)-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) ) )
DefiningRelations( MA1 );
#! [ 1*x^2 + 1*x:(o) -≻ (o), 1*y^3 + 1*y:(o) -≻ (o), \
#!   1*y⋅x + 1*x⋅y + 1*y:(o) -≻ (o) ]
AssociatedQuotientCategoryOfLinearClosureOfPathCategory( MA1 );
#! GF(2)-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) ) ) \
#! / [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]
GroebnerBasisOfDefiningRelations( MA1 );
#! [ 1*x^2 + 1*x:(o) -≻ (o), 1*y^3 + 1*y:(o) -≻ (o), \
#!   1*y⋅x + 1*x⋅y + 1*y:(o) -≻ (o) ]
IsOne( PreCompose( LeftUnitor( MA1 ), LeftUnitorInverse( MA1 ) ) );
#! true
IsOne( PreCompose( LeftUnitorInverse( MA1 ), LeftUnitor( MA1 ) ) );
#! true
IsOne( PreCompose( RightUnitor( MA1 ), RightUnitorInverse( MA1 ) ) );
#! true
IsOne( PreCompose( RightUnitorInverse( MA1 ), RightUnitor( MA1 ) ) );
#! true
TestMonoidalPentagonIdentity( MA1, MA1, MA1, MA1 );
#! true
Braiding( MA1, MA1 ) = BraidingInverse( MA1, MA1 );
#! true
TestBraidingCompatability( MA1, MA1, MA1 );
#! true
iota1 := UniversalMorphismFromInitialObject( MA1 );
#! <A morphism in CategoryOfFpMatrixAlgebras( GF(2) )>
IsWellDefined( iota1 );
#! true

#! @EndExample

#! @EndChunk
