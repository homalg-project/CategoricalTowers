#! @Chunk SnakeInAbelian2

LoadPackage( "LazyCategories" );

#! @Example
LoadPackage( "FreydCategoriesForCAP" );
#! true
SwitchGeneralizedMorphismStandard( "cospan" );
snake_quiver := RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" );
#! q(4)[a:1->2,b:2->3,c:3->4]
Q := HomalgFieldOfRationals( );
#! Q
A := PathAlgebra( Q, snake_quiver );
#! Q * q
A := A / [ A.abc ];
#! (Q * q) / [ 1*(a*b*c) ]
QRowsA := QuiverRows( A );
#! QuiverRows( (Q * q) / [ 1*(a*b*c) ] )
Adelman := AdelmanCategory( QRowsA );
#! Adelman category( QuiverRows( (Q * q) / [ 1*(a*b*c) ] ) )
Lazy := LazyCategory( Adelman :
                show_evaluation := true, primitive_operations := true );
#! LazyCategory( Adelman category( QuiverRows( (Q * q) / [ 1*(a*b*c) ] ) ) )
a := A.a / QRowsA / Adelman / Lazy; SetLabel( a, "a" );
#! <An evaluated morphism in LazyCategory(
#!  Adelman category( QuiverRows( (Q * q) / [ 1*(a*b*c) ] ) ) )>
b := A.b / QRowsA / Adelman / Lazy; SetLabel( b, "b" ); SetLabel(Range( b ), "3");
#! <An evaluated morphism in LazyCategory(
#!  Adelman category( QuiverRows( (Q * q) / [ 1*(a*b*c) ] ) ) )>
c := A.c / QRowsA / Adelman / Lazy; SetLabel( c, "c" );
#! <An evaluated morphism in LazyCategory(
#!  Adelman category( QuiverRows( (Q * q) / [ 1*(a*b*c) ] ) ) )>
d := CokernelProjection( a );
#! <An epimorphism in LazyCategory(
#!  Adelman category( QuiverRows( (Q * q) / [ 1*(a*b*c) ] ) ) )>
e := CokernelColift( a, PreCompose( b, c ) );
#! <A morphism in LazyCategory(
#!  Adelman category( QuiverRows( (Q * q) / [ 1*(a*b*c) ] ) ) )>
f := KernelEmbedding( e );
#! <A monomorphism in LazyCategory(
#!  Adelman category( QuiverRows( (Q * q) / [ 1*(a*b*c) ] ) ) )>
g := KernelEmbedding( c );
#! <A monomorphism in LazyCategory(
#!  Adelman category( QuiverRows( (Q * q) / [ 1*(a*b*c) ] ) ) )>
h := KernelLift( c, PreCompose( a, b ) );
#! <A morphism in LazyCategory(
#!  Adelman category( QuiverRows( (Q * q) / [ 1*(a*b*c) ] ) ) )>
i := CokernelProjection( h );
#! <An epimorphism in LazyCategory(
#!  Adelman category( QuiverRows( (Q * q) / [ 1*(a*b*c) ] ) ) )>
ff := AsGeneralizedMorphism( f );
#! <A morphism in Generalized morphism category of LazyCategory(
#!  Adelman category( QuiverRows( (Q * q) / [ 1*(a*b*c) ] ) ) ) by cospan>
dd := AsGeneralizedMorphism( d );
#! <A morphism in Generalized morphism category of LazyCategory(
#!  Adelman category( QuiverRows( (Q * q) / [ 1*(a*b*c) ] ) ) ) by cospan>
bb := AsGeneralizedMorphism( b );
#! <A morphism in Generalized morphism category of LazyCategory(
#!  Adelman category( QuiverRows( (Q * q) / [ 1*(a*b*c) ] ) ) ) by cospan>
gg := AsGeneralizedMorphism( g );
#! <A morphism in Generalized morphism category of LazyCategory(
#!  Adelman category( QuiverRows( (Q * q) / [ 1*(a*b*c) ] ) ) ) by cospan>
ii := AsGeneralizedMorphism( i );
#! <A morphism in Generalized morphism category of LazyCategory(
#!  Adelman category( QuiverRows( (Q * q) / [ 1*(a*b*c) ] ) ) ) by cospan>
ss := PreCompose( [ ff, PseudoInverse( dd ), bb, PseudoInverse( gg ), ii ] );
#! <A morphism in Generalized morphism category of LazyCategory(
#!  Adelman category( QuiverRows( (Q * q) / [ 1*(a*b*c) ] ) ) ) by cospan>
s := HonestRepresentative( ss );
#! <A morphism in LazyCategory(
#!  Adelman category( QuiverRows( (Q * q) / [ 1*(a*b*c) ] ) ) )>
j := KernelObjectFunctorial( b, d, e );
#! <A morphism in LazyCategory(
#!  Adelman category( QuiverRows( (Q * q) / [ 1*(a*b*c) ] ) ) )>
k := CokernelObjectFunctorial( h, g, b );
#! <A morphism in LazyCategory(
#!  Adelman category( QuiverRows( (Q * q) / [ 1*(a*b*c) ] ) ) )>
HK := HomologyObject( j, s );
#! <An object in LazyCategory(
#!  Adelman category( QuiverRows( (Q * q) / [ 1*(a*b*c) ] ) ) )>
HC := HomologyObject( s, k );
#! <An object in LazyCategory(
#!  Adelman category( QuiverRows( (Q * q) / [ 1*(a*b*c) ] ) ) )>
#! @EndExample
