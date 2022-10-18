#! @BeginChunk ProjectiveResolution

#  x    a
#    1 ---> 2
#    |      |
#  c |      | b
#    v      v
#    3 ---> 4
#       d     y
#

LoadPackage( "FunctorCategories" );

#! @Example
q := RightQuiver( "q(4)[x:1->1,a:1->2,b:2->4,c:1->3,d:3->4,y:4->4]" );
#! q(4)[x:1->1,a:1->2,b:2->4,c:1->3,d:3->4,y:4->4]
F := FreeCategory( q );
#! FreeCategory( RightQuiver( "q(4)[x:1->1,a:1->2,b:2->4,c:1->3,d:3->4,
#! y:4->4]" ) )
k := HomalgFieldOfRationals( );
#! Q
kF := k[F];
#! Algebroid( Q, FreeCategory( RightQuiver( "q(4)[x:1->1,a:1->2,b:2->4,
#! c:1->3,d:3->4,y:4->4]" ) ) )
A := kF / [ kF.x^3, kF.y^2 ];
#! Algebroid( Q, FreeCategory( RightQuiver( "q(4)[x:1->1,a:1->2,b:2->4,
#! c:1->3,d:3->4,y:4->4]" ) ) ) / relations
PSh := PreSheaves( A );
#! PreSheaves( Algebroid( Q, FreeCategory( RightQuiver( "q(4)[x:1->1,
#! a:1->2,b:2->4,c:1->3,d:3->4,y:4->4]" ) ) ) / relations, Rows( Q ) )
P := PSh.4;
#! <(1)->12, (2)->2, (3)->2, (4)->2; (x)->12x12, (a)->2x12, (b)->2x2,
#! (c)->2x12, (d)->2x2, (y)->2x2>
IsProjective( P );
#! true
Display( P );
#! Image of <(1)>:
#! A row module over Q of rank 12
#!
#! Image of <(2)>:
#! A row module over Q of rank 2
#!
#! Image of <(3)>:
#! A row module over Q of rank 2
#!
#! Image of <(4)>:
#! A row module over Q of rank 2
#!
#! Image of (1)-[{ 1*(x) }]->(1):
#! Source:
#! A row module over Q of rank 12
#!
#! Matrix:
#! [ [  0,  0,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  0,  0,  0,  0,  1,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0,  0 ],
#!   [  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0 ],
#!   [  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1 ],
#!   [  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ] ]
#!
#! Range:
#! A row module over Q of rank 12
#!
#! A morphism in Rows( Q )
#!
#! Image of (1)-[{ 1*(a) }]->(2):
#! Source:
#! A row module over Q of rank 2
#!
#! Matrix:
#! [ [  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0 ] ]
#!
#! Range:
#! A row module over Q of rank 12
#!
#! A morphism in Rows( Q )
#!
#! Image of (2)-[{ 1*(b) }]->(4):
#! Source:
#! A row module over Q of rank 2
#!
#! Matrix:
#! [ [  1,  0 ],
#!   [  0,  1 ] ]
#!
#! Range:
#! A row module over Q of rank 2
#!
#! A morphism in Rows( Q )
#!
#! Image of (1)-[{ 1*(c) }]->(3):
#! Source:
#! A row module over Q of rank 2
#!
#! Matrix:
#! [ [  0,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0 ] ]
#!
#! Range:
#! A row module over Q of rank 12
#!
#! A morphism in Rows( Q )
#!
#! Image of (3)-[{ 1*(d) }]->(4):
#! Source:
#! A row module over Q of rank 2
#!
#! Matrix:
#! [ [  1,  0 ],
#!   [  0,  1 ] ]
#!
#! Range:
#! A row module over Q of rank 2
#!
#! A morphism in Rows( Q )
#!
#! Image of (4)-[{ 1*(y) }]->(4):
#! Source:
#! A row module over Q of rank 2
#!
#! Matrix:
#! [ [  0,  1 ],
#!   [  0,  0 ] ]
#!
#! Range:
#! A row module over Q of rank 2
#!
#! A morphism in Rows( Q )
#!
#! An object in PreSheaves( Algebroid( Q, FreeCategory( RightQuiver( "q(4)[x:1->1,
#! a:1->2,b:2->4,c:1->3,d:3->4,y:4->4]" ) ) ) / relations, Rows( Q ) ) given by
#! the above data
IP := InjectiveCochainResolution( P, true );
#! <An object in Cochain complexes( PreSheaves( Algebroid( Q, FreeCategory(
#! RightQuiver( "q(4)[x:1->1,a:1->2,b:2->4,c:1->3,d:3->4,y:4->4]" ) ) )
#! / relations, Rows( Q ) ) ) with active lower bound 0 and active upper
#! bound 1>
IsWellDefined( IP ) and CohomologySupport( IP ) = [ 0 ];
#! true
phi := QuasiIsomorphismFromProjectiveResolution( IP, true );;
IsWellDefined( phi ) and IsQuasiIsomorphism( phi );
#! true
#! @EndExample
#! @EndChunk
