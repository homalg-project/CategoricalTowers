#! @Chunk ColimitingCocone

#! @Example
LoadPackage( "FunctorCategories", false );
#! true
q := "q(a,l,m,r,i,i1,i2,c,b)[ac:a->c,lc:l->c,mi:m->i,ic:i->c,ri1:r->i1,i1i2:i1->i2,i2c:i2->c,cb:c->b]";;
q := RightQuiver( q );
#! RightQuiver( "" );
F := FreeCategory( q );
#F := PathCategory( q );
#! FreeCategory(
#! RightQuiver( "" ) );
Size( F );
#! 7
PSh := PreSheaves( F );
#! PreSheaves( FreeCategory(
#! RightQuiver( "" ) ) );
#! SkeletalFinSets )
Y := YonedaEmbeddingOfSourceCategory( PSh );
#! Yoneda embedding functor
coprd_cocone := [ F.c, [ F.lc, F.mi * F.ic, F.ri1 * F.i1i2 * F.i2c ] ];
#coprd_cocone := [ F.c, [ F.ac, F.lc ] ];
is_closed := G -> IsClosedPreSheafWRTCoproductCocones( PSh, G, [ coprd_cocone ] );
#! function( G ) ... end
G := Coproduct( [ PSh.a, PSh.a, PSh.l, PSh.m, PSh.r, PSh.r, PSh.c, PSh.b ] );
#G := Coproduct( [ PSh.a, PSh.l, PSh.l ] );
#! <An object in PreSheaves( FreeCategory(
#!  RightQuiver( "" ) ),
#!  SkeletalFinSets )>
emb := EmbeddingIntoClosureOfPreSheafWRTCoproductCocones( G, [ coprd_cocone ] );
Assert( 0, IsWellDefined( emb ) );
Assert( 0, IsMonomorphism( emb ) );
Assert( 0, Source( emb ) = G );
Assert( 0, is_closed( Target( emb ) ) );
#! @EndExample
