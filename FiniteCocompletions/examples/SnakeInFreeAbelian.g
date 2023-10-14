#! @Chunk SnakeInFreeAbelian

#! @Example
#! #@if ValueOption( "no_precompiled_code" ) <> true
LoadPackage( "Algebroids", false );
#! true
LoadPackage( "FiniteCocompletions", false );
#! true
q := RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" );
#! q(4)[a:1->2,b:2->3,c:3->4]
Fq := FreeCategory( q );
#! FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) )
Q := HomalgFieldOfRationals( );
#! Q
Qq := Q[Fq];
#! Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
L := Qq / [ Qq.abc ];
#! Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#! / relations
A := AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure( L );
#! AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#! Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#! / relations )
a := A.a;
#! <A morphism in
#! AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#! Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#! / relations )>
b := A.b;
#! <A morphism in
#! AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#! Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#! / relations )>
c := A.c;
#! <A morphism in
#! AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#! Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#! / relations )>
IsZero( PreCompose( [ a, b, c ] ) );
#! true
d := CokernelProjection( a );
#! <An epimorphism in
#! AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#! Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#! / relations )>
e := CokernelColift( a, PreCompose( b, c ) );
#! <A morphism in
#! AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#! Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#! / relations )>
f := KernelEmbedding( e );
#! <A monomorphism in
#! AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#! Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#! / relations )>
g := KernelEmbedding( c );
#! <A monomorphism in
#! AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#! Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#! / relations )>
h := KernelLift( c, PreCompose( a, b ) );
#! <A morphism in
#! AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#! Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#! / relations )>
i := CokernelProjection( h );
#! <An epimorphism in
#! AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#! Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#! / relations )>
ker := Source( f );
#! <An object in
#! AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#! Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#! / relations )>
coker := Target( i );
#! <An object in
#! AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#! Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#! / relations )>
HomStructure( ker, coker );
#! <A row module over Q of rank 1>
hom_ker_coker := BasisOfExternalHom( ker, coker );
#! [ <A morphism in
#!    AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#!    Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!    / relations )> ]
s := hom_ker_coker[1];
#! <A morphism in
#!  AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#!  Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations )>
j := KernelObjectFunctorial( b, d, e );
#! <A morphism in
#!  AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#!  Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations )>
k := CokernelObjectFunctorial( h, g, b );
#! <A morphism in
#!  AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#!  Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations )>
HK := HomologyObject( j, s );
#! <An object in
#!  AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#!  Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations )>
IsZero( HK );
#! true
HC := HomologyObject( s, k );
#! <An object in
#!  AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#!  Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations )>
IsZero( HC );
#! true
ff := AsGeneralizedMorphism( f );
#! <A morphism in Generalized morphism category of
#!  AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#!  Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations )>
dd := AsGeneralizedMorphism( d );
#! <A morphism in Generalized morphism category of
#!  AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#!  Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations )>
bb := AsGeneralizedMorphism( b );
#! <A morphism in Generalized morphism category of
#!  AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#!  Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations )>
gg := AsGeneralizedMorphism( g );
#! <A morphism in Generalized morphism category of
#!  AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#!  Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations )>
ii := AsGeneralizedMorphism( i );
#! <A morphism in Generalized morphism category of
#!  AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#!  Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations )>
ss := PreCompose( [ ff, PseudoInverse( dd ), bb, PseudoInverse( gg ), ii ] );
#! <A morphism in Generalized morphism category of
#!  AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#!  Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations )>
IsHonest( ss );
#! true
s = HonestRepresentative( ss );
#! true
Id := ExtendFunctorToAbelianClosureWithStrictDirectSums(
              EmbeddingOfUnderlyingCategory( A ) );
#! Extension to
#! AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#! Source( Embedding functor into an abelian closure category
#!         with strict direct sums ) )
Id( s );
#! <A morphism in
#!  AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure(
#!  Algebroid( Q, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations )>
IsWellDefined( Id( s ) );
#! true
#! #@fi
#! @EndExample
