#! @BeginChunk DefiningPairOfAQuiver

LoadPackage( "FunctorCategories" );

#! @Example
q := RightQuiver( "q(5)[a:1->1,s:1->2,t:1->2,m:4->1]" );
#! q(5)[a:1->1,s:1->2,t:1->2,m:4->1]
DefiningPairOfAQuiver( q );
#! [ 5, [ [ 1, 1 ], [ 1, 2 ], [ 1, 2 ], [ 4, 1 ] ] ]
#! @EndExample

#! @EndChunk
