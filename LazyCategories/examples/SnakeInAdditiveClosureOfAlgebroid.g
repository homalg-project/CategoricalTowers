#! @Chunk SnakeInAdditiveClosureOfAlgebroid

LoadPackage( "LazyCategories" );

#! @Example
LoadPackage( "Algebroids", ">= 2022.05-06" );
#! true
q := RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" );
#! q(4)[a:1->2,b:2->3,c:3->4]
Fq := FreeCategory( q );
#! FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) )
ZZ := HomalgRingOfIntegers( );
#! Z
Zq := ZZ[Fq];
#! Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
A := Zq / [ Zq.abc ];
#! Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#! / relations
LoadPackage( "FreydCategoriesForCAP" );
#! true
A_add := AdditiveClosure( A );
#! Additive closure( Algebroid( Z, FreeCategory(
#! RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations )
Lazy := LazyCategory( A_add : show_evaluation := true,
                lazify_range_of_hom_structure := true );
#! LazyCategory( Additive closure( Algebroid( Z, FreeCategory(
#! RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations ) )
a := A.a / A_add / Lazy; SetLabel( a, "a" );
#! <An evaluated morphism in LazyCategory( Additive closure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) )>
b := A.b / A_add / Lazy; SetLabel( b, "b" ); SetLabel( Range( b ), "3" );
#! <An evaluated morphism in LazyCategory( Additive closure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) )>
c := A.c / A_add / Lazy; SetLabel( c, "c" );
#! <An evaluated morphism in LazyCategory( Additive closure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) )>
Adelman := AdelmanCategory( Lazy );
#! Adelman category( LazyCategory( Additive closure( Algebroid( Z, FreeCategory(
#! RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations ) ) )
a := a / Adelman;
#! <A morphism in Adelman category( LazyCategory( Additive closure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
b := b / Adelman;
#! <A morphism in Adelman category( LazyCategory( Additive closure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
c := c / Adelman;
#! <A morphism in Adelman category( LazyCategory( Additive closure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
d := CokernelProjection( a );
#! <An epimorphism in Adelman category( LazyCategory( Additive closure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
e := CokernelColift( a, PreCompose( b, c ) );
#! <A morphism in Adelman category( LazyCategory( Additive closure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
f := KernelEmbedding( e );
#! <A monomorphism in Adelman category( LazyCategory( Additive closure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
g := KernelEmbedding( c );
#! <A monomorphism in Adelman category( LazyCategory( Additive closure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
h := KernelLift( c, PreCompose( a, b ) );
#! <A morphism in Adelman category( LazyCategory( Additive closure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
i := CokernelProjection( h );
#! <An epimorphism in Adelman category( LazyCategory( Additive closure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
ff := AsGeneralizedMorphism( f );
#! <A morphism in Generalized morphism category of Adelman category(
#!  LazyCategory( Additive closure( Algebroid( Z, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations ) ) ) by cospan>
dd := AsGeneralizedMorphism( d );
#! <A morphism in Generalized morphism category of Adelman category(
#!  LazyCategory( Additive closure( Algebroid( Z, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations ) ) ) by cospan>
bb := AsGeneralizedMorphism( b );
#! <A morphism in Generalized morphism category of Adelman category(
#!  LazyCategory( Additive closure( Algebroid( Z, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations ) ) ) by cospan>
gg := AsGeneralizedMorphism( g );
#! <A morphism in Generalized morphism category of Adelman category(
#!  LazyCategory( Additive closure( Algebroid( Z, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations ) ) ) by cospan>
ii := AsGeneralizedMorphism( i );
#! <A morphism in Generalized morphism category of Adelman category(
#!  LazyCategory( Additive closure( Algebroid( Z, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations ) ) ) by cospan>
ss := PreCompose( [ ff, PseudoInverse( dd ), bb, PseudoInverse( gg ), ii ] );
#! <A morphism in Generalized morphism category of Adelman category(
#!  LazyCategory( Additive closure( Algebroid( Z, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations ) ) ) by cospan>
s := HonestRepresentative( ss );
#! <A morphism in Adelman category( LazyCategory( Additive closure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
j := KernelObjectFunctorial( b, d, e );
#! <A morphism in Adelman category( LazyCategory( Additive closure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
k := CokernelObjectFunctorial( h, g, b );
#! <A morphism in Adelman category( LazyCategory( Additive closure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
HK := HomologyObject( j, s );
#! <An object in Adelman category( LazyCategory( Additive closure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
HC := HomologyObject( s, k );
#! <An object in Adelman category( LazyCategory( Additive closure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
#! @EndExample
