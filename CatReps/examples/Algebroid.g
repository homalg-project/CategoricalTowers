#! @Chunk Algebroid

LoadPackage( "CatReps" );

#! We can also create finite concrete categories with objects
#! not starting with $1$, to demonstrate that
#! <C>ConcreteCategoryForCAP</C>( [ [,,,5,6,4], [,,,7,8,9], [,,,,,,8,9,7] ] )
#! and <C>ConcreteCategoryForCAP</C>( [ [2,3,1], [4,5,6], [,,,5,6,4] ] ) yield
#! even identical categories, in particular, their underlying quivers are identical,
#! inducing identical algebroids, and identical categories of representations.

#! @Example
ccat1 := ConcreteCategoryForCAP( [ [2,3,1], [4,5,6], [,,,5,6,4] ] );
#! A finite concrete category
ccat2 := ConcreteCategoryForCAP( [ [,,,5,6,4], [,,,7,8,9], [,,,,,,8,9,7] ] );
#! A finite concrete category
Q := HomalgFieldOfRationals( );
#! Q
A1 := Q[ccat1];
#! Algebroid( Q, FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations
A2 := Q[ccat2];
#! Algebroid( Q, FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations
IsIdenticalObj( A1, A2 );
#! true
UnderlyingCategory( A1 );
#! FreeCategory( RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) / relations
UnderlyingCategory( A2 );
#! FreeCategory( RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) / relations
IsIdenticalObj( UnderlyingCategory( A1 ), UnderlyingCategory( A2 ) );
#! true
CatReps1 := FunctorCategory( A1, Q );
#! FunctorCategory( Algebroid( Q, FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over Q )
CatReps2 := FunctorCategory( A2, Q );
#! FunctorCategory( Algebroid( Q, FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over Q )
IsIdenticalObj( CatReps1, CatReps2 );
#! true
#! @EndExample
