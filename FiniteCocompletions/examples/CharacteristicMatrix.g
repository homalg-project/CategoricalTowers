#! @BeginChunk CharacteristicMatrix

#! @Example
LoadPackage( "FunctorCategories", ">= 2023.11-07", false );
#! true
q := RightQuiver( "q(o)[x:o->o]" );
#! q(o)[x:o->o]
F := FreeCategory( q );
#! FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
Q := HomalgFieldOfRationals( );
#! Q
QF := Q[F];
#! Algebra( Q, FreeCategory( RightQuiver( "q(o)[x:o->o]" ) ) )
A := QF / [ QF.xxx ];
#! Algebra( Q, FreeCategory( RightQuiver( "q(o)[x:o->o]" ) ) ) / relations
o := A.o;
#! <(o)>
x := A.x;
#! (o)-[{ 1*(x) }]->(o)
Qmat := RangeCategoryOfHomomorphismStructure( A );
#! Rows( Q )
U := 3 / Qmat;
#! <A row module over Q of rank 3>
phi := HomalgMatrix( [ 0,1,0, 0,0,1, 0,0,0 ], 3, 3, Q ) / Qmat;
#! <A morphism in Rows( Q )>
Display( phi );
#! Source:
#! A row module over Q of rank 3
#! 
#! Matrix:
#! [ [  0,  1,  0 ],
#!   [  0,  0,  1 ],
#!   [  0,  0,  0 ] ]
#! 
#! Range:
#! A row module over Q of rank 3
#! 
#! A morphism in Rows( Q )
PSh := PreSheaves( A );
#! PreSheaves( Algebra( Q, FreeCategory( RightQuiver( "q(o)[x:o->o]" ) ) )
#! / relations, Rows( Q ) )
Mphi := CreatePreSheafByValues( PSh, Pair( [ U ], [ phi ] ) );
#! <(o)->3; (x)->3x3>
IsWellDefined( Mphi );
#! true
Display( Mphi );
#! Image of <(o)>:
#! A row module over Q of rank 3
#! 
#! Image of (o)-[{ 1*(x) }]->(o):
#! Source:
#! A row module over Q of rank 3
#! 
#! Matrix:
#! [ [  0,  1,  0 ],
#!   [  0,  0,  1 ],
#!   [  0,  0,  0 ] ]
#! 
#! Range:
#! A row module over Q of rank 3
#! 
#! A morphism in Rows( Q )
#! 
#! An object in PreSheaves(
#! Algebra( Q, FreeCategory( RightQuiver( "q(o)[x:o->o]" ) ) ) / relations,
#! Rows( Q ) ) given by the above data
Mphi_as_coequqlizer_pair := CoYonedaLemmaOnObjects( Mphi );
#! <An object in FiniteColimitCompletionWithStrictCoproducts(
#!  Algebra( Q, FreeCategory( RightQuiver( "q(o)[x:o->o]" ) ) ) / relations )>
Display( Mphi_as_coequqlizer_pair );
#! Image of <(V)>:
#! A formal direct sum consisting of 3 objects.
#! <(o)>
#! <(o)>
#! <(o)>
#! 
#! Image of <(A)>:
#! A formal direct sum consisting of 3 objects.
#! <(o)>
#! <(o)>
#! <(o)>
#! 
#! Image of (V)-[(s)]->(A):
#! A 3 x 3 matrix with entries in
#! Algebra( Q, FreeCategory( RightQuiver( "q(o)[x:o->o]" ) ) ) / relations
#! 
#! [1,1]: (o)-[{ 0 }]->(o)
#! [1,2]: (o)-[{ 1*(o) }]->(o)
#! [1,3]: (o)-[{ 0 }]->(o)
#! [2,1]: (o)-[{ 0 }]->(o)
#! [2,2]: (o)-[{ 0 }]->(o)
#! [2,3]: (o)-[{ 1*(o) }]->(o)
#! [3,1]: (o)-[{ 0 }]->(o)
#! [3,2]: (o)-[{ 0 }]->(o)
#! [3,3]: (o)-[{ 0 }]->(o)
#! Image of (V)-[(t)]->(A):
#! A 3 x 3 matrix with entries in
#! Algebra( Q, FreeCategory( RightQuiver( "q(o)[x:o->o]" ) ) ) / relations
#! 
#! [1,1]: (o)-[{ 1*(x) }]->(o)
#! [1,2]: (o)-[{ 0 }]->(o)
#! [1,3]: (o)-[{ 0 }]->(o)
#! [2,1]: (o)-[{ 0 }]->(o)
#! [2,2]: (o)-[{ 1*(x) }]->(o)
#! [2,3]: (o)-[{ 0 }]->(o)
#! [3,1]: (o)-[{ 0 }]->(o)
#! [3,2]: (o)-[{ 0 }]->(o)
#! [3,3]: (o)-[{ 1*(x) }]->(o)
#! An object in PreSheaves( PathCategory( FinQuiver( "q(V,A)[s:V→A,t:V→A]" ) ),
#! AdditiveClosure( Algebra( Q, FreeCategory( RightQuiver( "q(o)[x:o->o]" ) ) ) /
#! relations ) ) given by the above data
#! 
#! An object in FiniteColimitCompletionWithStrictCoproducts(
#! Algebra( Q, FreeCategory( RightQuiver( "q(o)[x:o->o]" ) ) ) / relations )
#! given by the above data
phi_in_additive_closure :=
  TensorizeObjectWithMorphismInRangeCategoryOfHomomorphismStructure( o, phi );
#! <A morphism in AdditiveClosure(
#!  Algebra( Q, FreeCategory( RightQuiver( "q(o)[x:o->o]" ) ) ) / relations )
#!  defined by a 3 x 3 matrix of underlying morphisms>
x_in_additive_closure :=
  TensorizeMorphismWithObjectInRangeCategoryOfHomomorphismStructure( x, U );
#! <A morphism in AdditiveClosure(
#!  Algebra( Q, FreeCategory( RightQuiver( "q(o)[x:o->o]" ) ) ) / relations )
#!  defined by a 3 x 3 matrix of underlying morphisms>
Mphi_as_coequqlizer_pair.s = phi_in_additive_closure;
#! true
Mphi_as_coequqlizer_pair.t = x_in_additive_closure;
#! true
#! @EndExample
#! @EndChunk
