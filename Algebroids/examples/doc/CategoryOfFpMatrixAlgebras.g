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
#! 27 primitive operations were used to derive 76 operations for this category \
#! which algorithmically
#! * IsCategoryWithInitialObject
#! * IsCartesianCategory
#! * IsSymmetricMonoidalCategory
#! and not yet algorithmically
#! * IsCategoryWithCoequalizers
T := TerminalObject( MatAlg_F2 );
#! <An object in CategoryOfFpMatrixAlgebras( GF(2) )>
Display( T );
#! GF(2) / [ 1*id(o) ]
#!
#! A finitely presented matrix algebra with an empty list of matrix generators
iota := UniversalMorphismFromInitialObject( T );
#! <A morphism in CategoryOfFpMatrixAlgebras( GF(2) )>
I := Source( iota );
#! <An object in CategoryOfFpMatrixAlgebras( GF(2) )>
Display( I );
#! GF(2) / [  ]
#! 
#! A finitely presented matrix algebra with an empty list of matrix generators
Display( iota );
#! GF(2) / [ 1*id(o) ]
#!  ^
#!  |
#! [  ]
#!  |
#! GF(2) / [  ]
K := TensorUnit( MatAlg_F2 );
#! <An object in CategoryOfFpMatrixAlgebras( GF(2) )>
Display( K );
#! GF(2) / [  ]
#! 
#! A finitely presented matrix algebra with an empty list of matrix generators
K = I;
#! true
Alg_F2 := UnderlyingCategory( MatAlg_F2 );
#! CategoryOfFpAlgebras( GF(2) )
Display( Alg_F2 );
#! A CAP category with name CategoryOfFpAlgebras( GF(2) ):
#! 
#! 31 primitive operations were used to derive 130 operations for this category \
#! which algorithmically
#! * IsFiniteCocompleteCategory
#! * IsBicartesianCategory
#! * IsSymmetricMonoidalCategory
q := FinQuiver( "q(o)[x:o->o,y:o->o]" );
#! FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" )
P := PathCategory( q );
#! PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) )
L := F2[P];
#! GF(2)-LinearClosure( PathCategory( \
#! FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) ) )
relations := [ L.x^2 - L.x,  L.y^3 - L.y,  L.xy - L.y * (L.x+L.id_o) ];
#! [ 1*x^2 + 1*x:(o) -≻ (o), 1*y^3 + 1*y:(o) -≻ (o),\
#!   1*y⋅x + 1*x⋅y + 1*y:(o) -≻ (o) ]
Q := L / relations;
#! GF(2)-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) ) ) / \
#! [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]
Dimension( Q );
#! 6
A := Q / Alg_F2;
#! <An object in CategoryOfFpAlgebras( GF(2) )>
Dimension( A );
#! 6
Display( A );
#! GF(2)<x,y> / [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]

Mat_F2 := UnderlyingCategoryOfMatrices( MatAlg_F2 );
#! Rows( GF(2) )
mx := HomalgDiagonalMatrix( [ 1, 0, 1, 0 ], F2 ) / Mat_F2;
#! <A morphism in Rows( GF(2) )>
my := DiagMat( [
              HomalgZeroMatrix( 2, 2, F2 ),
              CertainRows( HomalgIdentityMatrix( 2, F2 ), [ 2, 1 ] ) ] ) / Mat_F2;
#! <A morphism in Rows( GF(2) )>
matrix_generators := Pair( 4 / Mat_F2, [ mx, my ] );
#! [ <A row module over GF(2) of rank 4>,\
#!   [ <A morphism in Rows( GF(2) )>, <A morphism in Rows( GF(2) )> ] ]
M := ObjectConstructor( MatAlg_F2, Pair( A, matrix_generators ) );
#! <An object in CategoryOfFpMatrixAlgebras( GF(2) )>
Display( M );
#! 1,0,0,0,
#! 0,0,0,0,
#! 0,0,1,0,
#! 0,0,0,0
#! 
#! 0,0,0,0,
#! 0,0,0,0,
#! 0,0,0,1,
#! 0,0,1,0
#! 
#! GF(2)<x,y> / [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]
#! 
#! A finitely presented matrix algebra with the above matrix generators
IsWellDefined( M );
#! true
M.x;
#! 1*x:(o) -≻ (o)
M.y;
#! 1*y:(o) -≻ (o)
Dimension( M );
#! 6
NrGenerators( M );
#! 2
Generators( M );
#! [ 1*x:(o) -≻ (o), 1*y:(o) -≻ (o) ]
MatrixGenerators( M ) = [ mx, my ];
#! true
AssociatedLinearClosureOfPathCategory( M );
#! GF(2)-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) ) )
DefiningRelations( M );
#! [ 1*x^2 + 1*x:(o) -≻ (o), 1*y^3 + 1*y:(o) -≻ (o), \
#!   1*y⋅x + 1*x⋅y + 1*y:(o) -≻ (o) ]
AssociatedQuotientCategoryOfLinearClosureOfPathCategory( M );
#! GF(2)-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) ) ) \
#! / [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]
GroebnerBasisOfDefiningRelations( M );
#! [ 1*x^2 + 1*x:(o) -≻ (o), 1*y^3 + 1*y:(o) -≻ (o), \
#!   1*y⋅x + 1*x⋅y + 1*y:(o) -≻ (o) ]
P := DirectProduct( I, M );
#! <An object in CategoryOfFpMatrixAlgebras( GF(2) )>
Display( P );
#! 1,0,0,0,0,
#! 0,0,0,0,0,
#! 0,0,0,0,0,
#! 0,0,0,0,0,
#! 0,0,0,0,0
#! 
#! 0,0,0,0,0,
#! 0,1,0,0,0,
#! 0,0,0,0,0,
#! 0,0,0,1,0,
#! 0,0,0,0,0
#! 
#! 0,0,0,0,0,
#! 0,0,0,0,0,
#! 0,0,0,0,0,
#! 0,0,0,0,1,
#! 0,0,0,1,0
#! 
#! 0,0,0,0,0,
#! 0,1,0,0,0,
#! 0,0,1,0,0,
#! 0,0,0,1,0,
#! 0,0,0,0,1
#! 
#! GF(2)<a1,a2,a3,a4> / [ 1*a2^2 + 1*a2, 1*a3^3 + 1*a3, 1*a3⋅a2 + 1*a2⋅a3 + 1*a3, \
#! ... ]
#!
#! A finitely presented matrix algebra with the above matrix generators
counit := Counit( M, [ 1, 0 ] );
#! <A morphism in CategoryOfFpMatrixAlgebras( GF(2) )>
Display( counit );
#! GF(2) / [  ]
#!  ^
#!  |
#! [ 1*id(o), 0 ]
#!  |
#! GF(2)<x,y> / [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]
IsWellDefined( counit );
#! true
o := M.id_o;
#! 1*id(o):(o) -≻ (o)
x := M.x;
#! 1*x:(o) -≻ (o)
y := M.y;
#! 1*y:(o) -≻ (o)
comult := Comultiplication( M,
                  [ [ [ o, x ], [ x, o ], [ o, o ], [ y^2, y^2 ] ],
                    [ [ o, y ], [ y, o + y^2 ] ] ] );
#! <A morphism in CategoryOfFpMatrixAlgebras( GF(2) )>
Display( comult );
#! GF(2)<a1,a2,a3,a4> / [ 1*a1^2 + 1*a1, 1*a2^3 + 1*a2, 1*a2⋅a1 + 1*a1⋅a2 + 1*a2, \
#! ... ]
#!  ^
#!  |
#! [ 1*a2^2⋅a4^2 + 1*a1 + 1*a3 + 1*id(o), 1*a2⋅a4^2 + 1*a2 + 1*a4 ]
#!  |
#! GF(2)<x,y> / [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]
IsWellDefined( comult );
#! true
Perform( ListOfMatrixImages( comult ), Display );
#! Source:
#! A row module over GF(2) of rank 16
#! 
#! Matrix:
#! 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
#! 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
#! 0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
#! 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
#! 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
#! 0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,
#! 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
#! 0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,
#! 0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,
#! 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
#! 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
#! 0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,
#! 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
#! 0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,
#! 0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,
#! 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
#! 
#! Range:
#! A row module over GF(2) of rank 16
#! 
#! A morphism in Rows( GF(2) )
#! Source:
#! A row module over GF(2) of rank 16
#! 
#! Matrix:
#! 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
#! 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
#! 0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,
#! 0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
#! 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
#! 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
#! 0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,
#! 0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
#! 0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,
#! 0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,
#! 0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,
#! 0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,
#! 0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,
#! 0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,
#! 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
#! 0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0
#! 
#! Range:
#! A row module over GF(2) of rank 16
#! 
#! A morphism in Rows( GF(2) )
#! @EndExample

#! @EndChunk
