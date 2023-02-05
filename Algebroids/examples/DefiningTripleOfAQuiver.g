#! @BeginChunk DefiningTripleOfAQuiver

#! @Example
LoadPackage( "Algebroids" );
#! true
q := RightQuiver( "q(0..4)[a:0->0,s:0->1,t:0->1,m:3->0]" );
#! q(0,1,2,3,4)[a:0->0,s:0->1,t:0->1,m:3->0]
DefiningTripleOfAQuiver( q );
#! [ 5, 4, [ [ 0, 0 ], [ 0, 1 ], [ 0, 1 ], [ 3, 0 ] ] ]
#! @EndExample

#! @EndChunk
