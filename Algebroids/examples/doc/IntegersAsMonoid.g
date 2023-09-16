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
zz := Category( q, L );
#! FreeCategory( RightQuiver( "q(o)[m:o->o,i:o->o]" ) ) / [ m*i = o, i*m = o ]
IsCommutative( zz );
#! true
zz.o;
#! <(o)>
IsWellDefined( zz.o );
#! true
m := zz.m;
#! (o)-[(m)]->(o)
i := zz.i;
#! (o)-[(i)]->(o)
SetOfObjects( zz );
#! [ <(o)> ]
SetOfGeneratingMorphisms( zz );
#! [ (o)-[(m)]->(o), (o)-[(i)]->(o) ]
SetOfGeneratingMorphisms( zz, zz.o, zz.o );
#! [ (o)-[(m)]->(o), (o)-[(i)]->(o) ]
ObjectInFpCategory( zz, o ) = zz.o;
#! true
zz.o = o / zz;
#! true
IdentityMorphism( zz.o );
#! (o)-[(o)]->(o)
MorphismInFpCategory( zz, q.m ) = zz.m;
#! true
zz.m = q.m / zz;
#! true
#! @EndExample

#! We can compute in the algebroids.
#! For instance we can form compositions.

#! @Example
m2 := PreCompose( [ m, i, m, m, i, m, i, m ] );
#! (o)-[(m*m)]->(o)
IsWellDefined( m2 );
#! true
unit := Unit( zz );
#! Functor from FreeCategory( RightQuiver( "*(1)[]" ) ) ->
#! FreeCategory( RightQuiver( "q(o)[m:o->o,i:o->o]" ) ) / [ m*i = o, i*m = o ]
mul := Multiplication( zz );
#! Functor from
#! FreeCategory( RightQuiver(
#!   "qxq(oo)[om:oo->oo,oi:oo->oo,mo:oo->oo,io:oo->oo]" ) ) / relations ->
#! FreeCategory( RightQuiver( "q(o)[m:o->o,i:o->o]" ) ) / [ m*i = o, i*m = o ]
#! @EndExample

#! @EndChunk
