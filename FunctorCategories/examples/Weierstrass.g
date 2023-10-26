#! @BeginChunk Weierstrass

#! @Example
LoadPackage( "FunctorCategories", ">= 2023.10-06", false );
#! true
Q := HomalgFieldOfRationals( );
#! Q
R := Q["x"];
#! Q[x]
x := Indeterminates( R )[1];
#! x
p := x^2-x-1;
#! x^2-x-1
d := Degree( p );
#! 2
cmat3 := HomalgMatrix( CompanionMat( p^3 ), 3 * d, 3 * d, Q );
#! <A 6 x 6 matrix over an internal ring>
cmat2 := HomalgMatrix( CompanionMat( p^2 ), 2 * d, 2 * d, Q );
#! <A 4 x 4 matrix over an internal ring>
cmat1 := HomalgMatrix( CompanionMat( p^1 ), 1 * d, 1 * d, Q );
#! <A 2 x 2 matrix over an internal ring>
Display( cmat3 );
#! [ [   0,   0,   0,   0,   0,   1 ],
#!   [   1,   0,   0,   0,   0,   3 ],
#!   [   0,   1,   0,   0,   0,   0 ],
#!   [   0,   0,   1,   0,   0,  -5 ],
#!   [   0,   0,   0,   1,   0,   0 ],
#!   [   0,   0,   0,   0,   1,   3 ] ]
cmat := Q * DiagMat( [ cmat1, cmat1, cmat3 ] );
#! <An unevaluated 10 x 10 matrix over an internal ring>
n := NrRows( cmat );
#! 10
inv := HomalgMatrix( RandomUnimodularMat( n ), n, n, Q );
#! <A 10 x 10 matrix over an internal ring>
mat := LeftInverse( inv ) * cmat * inv;
#! <An unevaluated 10 x 10 matrix over an internal ring>
mat :=
  [ [     0,     0,     3,     0,    -1,     3,    -8,     6,     0,    -3 ],
    [    39,    15,   -25,     2,     0,    -9,    10,   -15,     2,     1 ],
    [    21,     5,    -5,     3,    -1,     2,   -16,     5,     0,    -7 ],
    [    30,    10,    -4,     3,    -5,    10,   -44,    22,    -2,   -18 ],
    [    40,     0,   -66,     9,    27,   -70,   170,  -140,     9,    62 ],
    [  -204,     0,    82,   -57,   -36,    50,    29,   100,     5,    13 ],
    [   -52,   -15,    18,    -6,     2,    -1,    30,    -5,     0,    14 ],
    [   105,     0,   -51,    29,    22,   -36,    14,   -72,    -1,     4 ],
    [     6,     1,   -11,     1,     3,    -9,    19,   -18,     0,     7 ],
    [   152,    45,   -52,    17,    -7,     5,   -93,    19,     0,   -43 ] ];;
mat := HomalgMatrix( mat, 10, 10 , Q );
#! <A 10 x 10 matrix over an internal ring>
q := RightQuiver( "q(o)[x:o->o]" );
#! q(o)[x:o->o]
F := FreeCategory( q );
#! FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
QF := Q[F];
#! Algebra( Q, FreeCategory( RightQuiver( "q(o)[x:o->o]" ) ) )
A := QF / [ QF.xxxxxx - 3 * QF.xxxxx + 5 * QF.xxx - 3 * QF.x - IdentityMorphism( QF.o ) ];
#! Algebra( Q, FreeCategory( RightQuiver( "q(o)[x:o->o]" ) ) ) / relations
o := A.o;
#! <(o)>
x := A.x;
#! (o)-[{ 1*(x) }]->(o)
IsMonomorphism( A.x );
#! true
IsEpimorphism( A.x );
#! true
IsIsomorphism( A.x );
#! true
Qmat := RangeCategoryOfHomomorphismStructure( A );
#! Rows( Q )
U := n / Qmat;
#! <A row module over Q of rank 10>
phi := mat / Qmat;
#! <A morphism in Rows( Q )>
PSh := PreSheaves( A );
#! PreSheaves( Algebra( Q, FreeCategory( RightQuiver( "q(o)[x:o->o]" ) ) )
#! / relations, Rows( Q ) )
G := CreatePreSheafByValues( PSh, Pair( [ U ], [ phi ] ) );
#! <(o)->10; (x)->10x10>
IsWellDefined( G );
#! true
Display( G );
#! Image of <(o)>:
#! A row module over Q of rank 10
#! 
#! Image of (o)-[{ 1*(x) }]->(o):
#! Source:
#! A row module over Q of rank 10
#! 
#! Matrix:
#! [ [     0,     0,     3,     0,    -1,     3,    -8,     6,     0,    -3 ],
#!   [    39,    15,   -25,     2,     0,    -9,    10,   -15,     2,     1 ],
#!   [    21,     5,    -5,     3,    -1,     2,   -16,     5,     0,    -7 ],
#!   [    30,    10,    -4,     3,    -5,    10,   -44,    22,    -2,   -18 ],
#!   [    40,     0,   -66,     9,    27,   -70,   170,  -140,     9,    62 ],
#!   [  -204,     0,    82,   -57,   -36,    50,    29,   100,     5,    13 ],
#!   [   -52,   -15,    18,    -6,     2,    -1,    30,    -5,     0,    14 ],
#!   [   105,     0,   -51,    29,    22,   -36,    14,   -72,    -1,     4 ],
#!   [     6,     1,   -11,     1,     3,    -9,    19,   -18,     0,     7 ],
#!   [   152,    45,   -52,    17,    -7,     5,   -93,    19,     0,   -43 ] ]
#! 
#! Range:
#! A row module over Q of rank 10
#! 
#! A morphism in Rows( Q )
#! 
#! An object in PreSheaves(
#! Algebra( Q, FreeCategory( RightQuiver( "q(o)[x:o->o]" ) ) ) / relations,
#! Rows( Q ) ) given by the above data
cy := ProjectionOntoCoequalizer( CoYonedaLemmaCoequalizerPair( G )[2] );
#! <(o)->60x10>
pi := EpimorphismFromSomeProjectiveObject( G );
#! <(o)->18x10>
pmat := UnderlyingMatrix( CoimageObject( pi ).x );
#! <An unevaluated 10 x 10 matrix over an internal ring>
range3 := [ 1 .. 3 * d ];
#! [ 1 .. 6 ]
pmat3 := CertainColumns( CertainRows( pmat, range3 ), range3 );
#! <An unevaluated 6 x 6 matrix over an internal ring>
Display( pmat3 );
#! [ [   0,   1,   0,   0,   0,   0 ],
#!   [   0,   0,   1,   0,   0,   0 ],
#!   [   0,   0,   0,   1,   0,   0 ],
#!   [   0,   0,   0,   0,   1,   0 ],
#!   [   0,   0,   0,   0,   0,   1 ],
#!   [   1,   3,   0,  -5,   0,   3 ] ]
pmat3 = TransposedMatrix( cmat3 );
#! true
range1 := [ 1 .. 1 * d ];
#! [ 1, 2 ]
pmat1_1 := CertainColumns( CertainRows( pmat, 3 * d + range1 ), 3 * d + range1 );
#! <An unevaluated 2 x 2 matrix over an internal ring>
Display( pmat1_1 );
#! [ [  0,  1 ],
#!   [  1,  1 ] ]
pmat1_1 = TransposedMatrix( cmat1 );
#! true
pmat1_2 := CertainColumns( CertainRows( pmat, 4 * d + range1 ), 4 * d + range1 );
#! <An unevaluated 2 x 2 matrix over an internal ring>
Display( pmat1_2 );
#! [ [  0,  1 ],
#!   [  1,  1 ] ]
pmat1_2 = TransposedMatrix( cmat1 );
#! true
CoimageObject( cy ) = CoimageObject( pi );
#! false
ps := EpimorphismFromSomeProjectiveObjectUsingSplits( G );
#! <(o)->18x10>
nf := CoimageObject( ps );
#! <(o)->10; (x)->10x10>
nf = CoimageObject( cy );
#! false
Display( nf );
#! Image of <(o)>:
#! A row module over Q of rank 10
#! 
#! Image of (o)-[{ 1*(x) }]->(o):
#! Source:
#! A row module over Q of rank 10
#! 
#! Matrix:
#! [ [   0,   1,   0,   0,   0,   0,   0,   0,   0,   0 ],
#!   [   0,   0,   1,   0,   0,   0,   0,   0,   0,   0 ],
#!   [   0,   0,   0,   1,   0,   0,   0,   0,   0,   0 ],
#!   [   0,   0,   0,   0,   1,   0,   0,   0,   0,   0 ],
#!   [   0,   0,   0,   0,   0,   1,   0,   0,   0,   0 ],
#!   [   1,   3,   0,  -5,   0,   3,   0,   0,   0,   0 ],
#!   [   0,   0,   0,   0,   0,   0,   0,   1,   0,   0 ],
#!   [   0,   0,   0,   0,   0,   0,   1,   1,   0,   0 ],
#!   [   0,   0,   0,   0,   0,   0,   0,   0,   0,   1 ],
#!   [   0,   0,   0,   0,   0,   0,   0,   0,   1,   1 ] ]
#! 
#! Range:
#! A row module over Q of rank 10
#! 
#! A morphism in Rows( Q )
#! 
#! An object in PreSheaves(
#! Algebra( Q, FreeCategory( RightQuiver( "q(o)[x:o->o]" ) ) ) / relations,
#! Rows( Q ) ) given by the above data
section := SectionFromOptimizedCoYonedaProjectiveObjectIntoCoYonedaProjectiveObject( G );
#! <A morphism in AdditiveClosure(
#!  Algebra( Q, FreeCategory( RightQuiver( "q(o)[x:o->o]" ) ) ) / relations )
#!  defined by a 3 x 10 matrix of underlying morphisms>
IsWellDefined( section );
#! true
Emb := EmbeddingFunctorOfFiniteStrictCoproductCompletionIntoPreSheaves( PSh );
#! The embedding functor of the finite coproduct completion into f.p. presheaves
ip := PreCompose( Emb( section ), cy );
#! <(o)->18x10>
IsEqualAsFactorobjects( pi, ip );
#! true
pi = ip;
#! false
CoimageObject( ip ) = CoimageObject( pi );
#! true
retraction := RetractionFromCoYonedaProjectiveObjectOntoOptimizedCoYonedaProjectiveObject( G );
#! <A morphism in AdditiveClosure(
#!  Algebra( Q, FreeCategory( RightQuiver( "q(o)[x:o->o]" ) ) ) / relations )
#!  defined by a 10 x 3 matrix of underlying morphisms>
IsWellDefined( retraction );
#! true
IsOne( PreCompose( section, retraction ) );
#! true
co := ProjectionOntoCoequalizer( OptimizedCoYonedaLemmaCoequalizerPair( G )[2] );
#! <(o)->18x10>
IsEqualAsFactorobjects( pi, co );
#! true
pi = co;
#! false
CoimageObject( pi ) = CoimageObject( co );
#! true
#! @EndExample
#! @EndChunk
