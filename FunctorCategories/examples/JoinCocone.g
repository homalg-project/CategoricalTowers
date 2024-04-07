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
digraphF := DigraphOfPoset( P );;
digraphF!.vertexlabels := List( SetOfObjects( F ), String );
#Splash( DotVertexLabelledDigraph( digraphF ) );
#Splash( DotVertexLabelledDigraph( DigraphOfPoset( P ) ) );
PSh := PreSheaves( P );
#! PreSheaves( PosetOfCategory( PathCategory(
#! FinQuiver( "q(a,l,r,i,c,b)[ac:a-≻c,lc:l-≻c,ri:r-≻i,ic:i-≻c,cb:c-≻b]" ) ) ),
#! IntervalCategory )
Y := YonedaEmbeddingOfSourceCategory( PSh );
#! Yoneda embedding functor
coproducts := [ [ P.c, [ P.l, P.r ] ] ];;
#! [ [ An object in the poset given by: (c),
#!     [ An object in the poset given by: (l),
#!       An object in the poset given by: (r) ] ] ]
PSh_J := ClosedPreSheavesWRTCoproducts( P, coproducts );;
closed := SetOfObjects( PSh_J );;
Assert( 0, Length( closed ) = 10 );
psh_J := ModelingCategory( ModelingCategory( PSh_J ) );;
Assert( 0, Length( SetOfObjects( psh_J ) ) = Length( SetOfObjects( PSh_J ) ) );
is_closed := psh_J!.ObjectMembershipFunction;
Assert( 0, ForAll( closed, obj -> is_closed( ObjectDatum( ModelingObject( PSh_J, obj ) ) ) ) );
#Splash( DotVertexLabelledDigraph( PSh, [ Y, psh_J ], [ "grey", "blue", "red" ] : offset := 0 ) );
#! @EndExample
