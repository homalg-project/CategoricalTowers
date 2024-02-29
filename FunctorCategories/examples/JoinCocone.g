#! @Chunk JoinCocone

#! @Example
LoadPackage( "FunctorCategories", false );
#! true
q := FinQuiver( "q(a,l,r,i,c,b)[ac:a->c,lc:l->c,ri:r->i,ic:i->c,cb:c->b]" );
#! FinQuiver( "q(a,l,r,i,c,b)[ac:a-≻c,lc:l-≻c,ri:r-≻i,ic:i-≻c,cb:c-≻b]" )
F := PathCategory( q );
#! PathCategory(
#! FinQuiver( "q(a,l,r,i,c,b)[ac:a-≻c,lc:l-≻c,ri:r-≻i,ic:i-≻c,cb:c-≻b]" ) )
Size( F );
#! 16
P := PosetOfCategory( F );
#! PosetOfCategory( PathCategory(
#! FinQuiver( "q(a,l,r,i,c,b)[ac:a-≻c,lc:l-≻c,ri:r-≻i,ic:i-≻c,cb:c-≻b]" ) ) )
Size( P );
#! 16
PSh := PreSheaves( P );
#! PreSheaves( PosetOfCategory( PathCategory(
#! FinQuiver( "q(a,l,r,i,c,b)[ac:a-≻c,lc:l-≻c,ri:r-≻i,ic:i-≻c,cb:c-≻b]" ) ) ),
#! IntervalCategory )
Y := YonedaEmbeddingOfSourceCategory( PSh );
#! Yoneda embedding functor
coprd_cocone := [ P.c, [ P.l, P.r ] ];;
#! [ [ An object in the poset given by: (c),
#!     [ An object in the poset given by: (l),
#!       An object in the poset given by: (r) ] ] ]
is_closed := G -> IsClosedPreSheafWRTCoproducts( PSh, G, [ coprd_cocone ] );
#! function( G ) ... end
PShJ := FullSubcategoryByObjectMembershipFunction( PSh, is_closed );
#Splash( DotVertexLabelledDigraph( PSh, [ Y, PShJ ], [ "grey", "blue", "red" ] ) );
G := Coproduct( [ PSh.l, PSh.r ] );
emb := EmbeddingIntoClosureOfPreSheafWRTCoproducts( G, [ coprd_cocone ] );
#Assert( 0, IsWellDefined( emb ) );
Assert( 0, IsMonomorphism( emb ) );
Assert( 0, Source( emb ) = G );
Assert( 0, is_closed( Target( emb ) ) );
closed := List( SetOfObjects( PSh ), G -> Target( EmbeddingIntoClosureOfPreSheafWRTCoproducts( G, [ coprd_cocone ] ) ) );
Assert( 0, ForAll( closed, is_closed ) );
Assert( 0, Length( SetOfObjects( PShJ ) ) = Length( DuplicateFreeList( closed ) ) );
#! @EndExample
