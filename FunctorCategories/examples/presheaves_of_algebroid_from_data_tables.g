#! @BeginChunk ProjectiveResolutionAlgebroidFromDataTables

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
#! FreeCategory( RightQuiver( "q(4)[x:1->1,a:1->2,b:2->4,c:1->3,d:3->4,y:4->4]" ) )
k := HomalgFieldOfRationals( );
#! Q
kF := k[F];
#! Algebroid( Q, FreeCategory( RightQuiver( "q(4)[x:1->1,a:1->2,b:2->4,c:1->3,d:3->4,
#! y:4->4]" ) ) )
A := AlgebroidFromDataTables( kF / [ kF.x^3, kF.y^2 ] );
#! Q-algebroid( {1,2,3,4}[x:1-≻1,a:1-≻2,b:2-≻4,c:1-≻3,d:3-≻4,y:4-≻4] ) defined by 4 objects
#! and 6 generating morphisms
SetIsAdmissibleAlgebroid( A, true );
PSh := PreSheaves( A );
#! PreSheaves( Q-algebroid( {1,2,3,4}[x:1-≻1,a:1-≻2,b:2-≻4,c:1-≻3,d:3-≻4,y:4-≻4] ) defined
#! by 4 objects and 6 generating morphisms, Rows( Q ) )
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
#! Image of <1*x:(1) -≻ (1)>:
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
#! Image of <1*a:(1) -≻ (2)>:
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
#! Image of <1*b:(2) -≻ (4)>:
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
#! Image of <1*c:(1) -≻ (3)>:
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
#! Image of <1*d:(3) -≻ (4)>:
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
#! Image of <1*y:(4) -≻ (4)>:
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
#! An object in PreSheaves( Q-algebroid( {1,2,3,4}[x:1-≻1,a:1-≻2,b:2-≻4,c:1-≻3,d:3-≻4,
#! y:4-≻4] ) defined by 4 objects and 6 generating morphisms, Rows( Q ) ) given by
#! the above data
IsWellDefined( MonomorphismIntoSomeInjectiveObject( P ) );
#! true
#! @EndExample
#! @EndChunk
