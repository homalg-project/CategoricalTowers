#! @BeginChunk IntegersAsMonoid

LoadPackage( "Algebroids" );

#! Create a right quiver $q$ with a single vertix $o$ and two arrows $m$, $i$.

#! @Example
q := RightQuiver( "q(o)[m:o->o,i:o->o]" );
#! q(o)[m:o->o,i:o->o]
o := q.o;
#! (o)
m := q.m;
#! (m)
i := q.i;
#! (i)
L := [ [ m * i, o ], [ i * m, o ] ];
#! [ [ (m*i), (o) ], [ (i*m), (o) ] ]
#! @EndExample

#! Create a monoid from $q$ and the list $L$ of relations.

#! @Example
ZZ := Category( q, L );
#! FreeCategory( RightQuiver( "q(o)[m:o->o,i:o->o]" ) ) / [ m*i = o, i*m = o ]
IsCommutative( ZZ );
#! true
ZZ.o;
#! <(o)>
IsWellDefined( ZZ.o );
#! true
m := ZZ.m;
#! (o)-[(m)]->(o)
i := ZZ.i;
#! (o)-[(i)]->(o)
SetOfObjects( ZZ );
#! [ <(o)> ]
SetOfGeneratingMorphisms( ZZ );
#! [ (o)-[(m)]->(o), (o)-[(i)]->(o) ]
SetOfGeneratingMorphisms( ZZ, ZZ.o, ZZ.o );
#! [ (o)-[(m)]->(o), (o)-[(i)]->(o) ]
ObjectInFpCategory( ZZ, o ) = ZZ.o;
#! true
ZZ.o = o / ZZ;
#! true
IdentityMorphism( ZZ.o );
#! (o)-[(o)]->(o)
MorphismInFpCategory( ZZ, q.m ) = ZZ.m;
#! true
ZZ.m = q.m / ZZ;
#! true
#! @EndExample

#! We can compute in the algebroids.
#! For instance we can form compositions.

#! @Example
m2 := PreCompose( [ m, i, m, m, i, m, i, m ] );
#! (o)-[(m*m)]->(o)
IsWellDefined( m2 );
#! true
unit := Unit( ZZ );
#! Functor from FreeCategory( RightQuiver( "*(1)[]" ) ) ->
#! FreeCategory( RightQuiver( "q(o)[m:o->o,i:o->o]" ) ) / [ m*i = o, i*m = o ]
mul := Multiplication( ZZ );
#! Functor from
#! FreeCategory( RightQuiver(
#!   "qxq(oo)[om:oo->oo,oi:oo->oo,mo:oo->oo,io:oo->oo]" ) ) / relations ->
#! FreeCategory( RightQuiver( "q(o)[m:o->o,i:o->o]" ) ) / [ m*i = o, i*m = o ]
#! @EndExample

#! @EndChunk
