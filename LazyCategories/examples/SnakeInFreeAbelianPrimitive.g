#! @Chunk SnakeInFreeAbelianPrimitive

LoadPackage( "LazyCategories" );

#! @Example
LoadPackage( "Algebroid", ">= 2022.05-02" );
#! true
q := RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" );
#! q(4)[a:1->2,b:2->3,c:3->4]
Fq := FreeCategory( q );
#! FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) )
zz := HomalgRingOfIntegers( );
#! Z
Zq := zz[Fq];
#! Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
A := Zq / [ Zq.abc ];
#! Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#! / relations
LoadPackage( "FreydCategoriesForCAP" );
#! true
A_add := AdditiveClosure( A );
#! AdditiveClosure( Algebroid( Z, FreeCategory(
#! RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations )
A_abel := AdelmanCategory( A_add );
#! Adelman category( AdditiveClosure( Algebroid( Z, FreeCategory(
#! RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations ) )
LoadPackage( "LazyCategories" );
#! true
Lazy := LazyCategory( A_abel :
                show_evaluation := true, primitive_operations := true );
#! LazyCategory( Adelman category( AdditiveClosure( Algebroid( Z, FreeCategory(
#! RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations ) ) )
a := A.a / A_add / A_abel / Lazy;
#! <An evaluated morphism in LazyCategory( Adelman category( AdditiveClosure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
b := A.b / A_add / A_abel / Lazy;
#! <An evaluated morphism in LazyCategory( Adelman category( AdditiveClosure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
c := A.c / A_add / A_abel / Lazy;
#! <An evaluated morphism in LazyCategory( Adelman category( AdditiveClosure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
SetLabel( a, "a" );
SetLabel( b, "b" );
SetLabel( c, "c" );
SetLabel( Source( a ), "1" );
SetLabel( Source( b ), "2" );
SetLabel( Target( b ), "3" );
SetLabel( Target( c ), "4" );
d := CokernelProjection( a );
#! <An epimorphism in LazyCategory( Adelman category( AdditiveClosure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
e := CokernelColift( a, PreCompose( b, c ) );
#! <A morphism in LazyCategory( Adelman category( AdditiveClosure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
f := KernelEmbedding( e );
#! <A monomorphism in LazyCategory( Adelman category( AdditiveClosure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
g := KernelEmbedding( c );
#! <A monomorphism in LazyCategory( Adelman category( AdditiveClosure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
h := KernelLift( c, PreCompose( a, b ) );
#! <A morphism in LazyCategory( Adelman category( AdditiveClosure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
i := CokernelProjection( h );
#! <An epimorphism in LazyCategory( Adelman category( AdditiveClosure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
ff := AsGeneralizedMorphism( f );
#! <A morphism in Generalized morphism category of LazyCategory(
#!  Adelman category( AdditiveClosure( Algebroid( Z, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations ) ) ) by cospan>
dd := AsGeneralizedMorphism( d );
#! <A morphism in Generalized morphism category of LazyCategory(
#!  Adelman category( AdditiveClosure( Algebroid( Z, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations ) ) ) by cospan>
bb := AsGeneralizedMorphism( b );
#! <A morphism in Generalized morphism category of LazyCategory(
#!  Adelman category( AdditiveClosure( Algebroid( Z, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations ) ) ) by cospan>
gg := AsGeneralizedMorphism( g );
#! <A morphism in Generalized morphism category of LazyCategory(
#!  Adelman category( AdditiveClosure( Algebroid( Z, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations ) ) ) by cospan>
ii := AsGeneralizedMorphism( i );
#! <A morphism in Generalized morphism category of LazyCategory(
#!  Adelman category( AdditiveClosure( Algebroid( Z, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations ) ) ) by cospan>
ss := PreCompose( [ ff, PseudoInverse( dd ), bb, PseudoInverse( gg ), ii ] );
#! <A morphism in Generalized morphism category of LazyCategory(
#!  Adelman category( AdditiveClosure( Algebroid( Z, FreeCategory(
#!  RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) / relations ) ) ) by cospan>
s := HonestRepresentative( ss );
#! <A morphism in LazyCategory( Adelman category( AdditiveClosure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
j := KernelObjectFunctorial( b, d, e );
#! <A morphism in LazyCategory( Adelman category( AdditiveClosure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
k := CokernelObjectFunctorial( h, g, b );
#! <A morphism in LazyCategory( Adelman category( AdditiveClosure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
HK := HomologyObject( j, s );
#! <An object in LazyCategory( Adelman category( AdditiveClosure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
HC := HomologyObject( s, k );
#! <An object in LazyCategory( Adelman category( AdditiveClosure(
#!  Algebroid( Z, FreeCategory( RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) )
#!  / relations ) ) )>
#! @EndExample
