#! @Chunk SnakeInFreeAbelian

LoadPackage( "FunctorCategories" );

#! @Example
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
A := AbelianClosure( L );
#! AbelianClosure( Algebroid( Q, FreeCategory(
#! RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations )
a := A.a;
#! <A morphism in AbelianClosure( Algebroid( Q, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations )>
b := A.b;
#! <A morphism in AbelianClosure( Algebroid( Q, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations )>
c := A.c;
#! <A morphism in AbelianClosure( Algebroid( Q, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations )>
IsZero( PreCompose( [ a, b, c ] ) );
#! true
d := CokernelProjection( a );
#! <An epimorphism in AbelianClosure( Algebroid( Q, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations )>
e := CokernelColift( a, PreCompose( b, c ) );
#! <A morphism in AbelianClosure( Algebroid( Q, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations )>
f := KernelEmbedding( e );
#! <A monomorphism in AbelianClosure( Algebroid( Q, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations )>
g := KernelEmbedding( c );
#! <A monomorphism in AbelianClosure( Algebroid( Q, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations )>
h := KernelLift( c, PreCompose( a, b ) );
#! <A morphism in AbelianClosure( Algebroid( Q, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations )>
i := CokernelProjection( h );
#! <An epimorphism in AbelianClosure( Algebroid( Q, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations )>
ff := AsGeneralizedMorphism( f );
#! <A morphism in Generalized morphism category of
#!  AbelianClosure( Algebroid( Q, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations )>
dd := AsGeneralizedMorphism( d );
#! <A morphism in Generalized morphism category of
#!  AbelianClosure( Algebroid( Q, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations )>
bb := AsGeneralizedMorphism( b );
#! <A morphism in Generalized morphism category of
#!  AbelianClosure( Algebroid( Q, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations )>
gg := AsGeneralizedMorphism( g );
#! <A morphism in Generalized morphism category of
#!  AbelianClosure( Algebroid( Q, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations )>
ii := AsGeneralizedMorphism( i );
#! <A morphism in Generalized morphism category of
#!  AbelianClosure( Algebroid( Q, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations )>
ss := PreCompose( [ ff, PseudoInverse( dd ), bb, PseudoInverse( gg ), ii ] );
#! <A morphism in Generalized morphism category of
#!  AbelianClosure( Algebroid( Q, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations )>
IsHonest( ss );
#! true
s := HonestRepresentative( ss );
#! <A morphism in AbelianClosure( Algebroid( Q, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations )>
j := KernelObjectFunctorial( b, d, e );
#! <A morphism in AbelianClosure( Algebroid( Q, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations )>
k := CokernelObjectFunctorial( h, g, b );
#! <A morphism in AbelianClosure( Algebroid( Q, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations )>
HK := HomologyObject( j, s );
#! <An object in AbelianClosure( Algebroid( Q, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations )>
IsZero( HK );
#! true
HC := HomologyObject( s, k );
#! <An object in AbelianClosure( Algebroid( Q, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations )>
IsZero( HC );
#! true
#! @EndExample
