#! @Chunk QS3

#! @Example
LoadPackage( "FunctorCategories", false );
#! true
q := RightQuiver( "q(1)[a:1->1,b:1->1]" );
#! q(1)[a:1->1,b:1->1]
S3 := Category( q, [ [ q.a^2, q.1 ], [ q.b^3, q.1 ], [ q.bab, q.a ] ] );
#! FreeCategory( RightQuiver( "q(1)[a:1->1,b:1->1]" ) ) / \
#! [ a*a = 1, b*b*b = 1, b*a*b = a ]
Q := HomalgFieldOfRationals( );
#! Q
QS3 := Q[S3];
#! Algebra( Q, FreeCategory( RightQuiver( "q(1)[a:1->1,b:1->1]" ) ) ) / relations
PSh := PreSheaves( QS3 );
#! PreSheaves( Algebra( Q, FreeCategory( \
#! RightQuiver( "q(1)[a:1->1,b:1->1]" ) ) ) / relations, Rows( Q ) )
Y1 := PSh.1;
#! <(1)->6; (a)->6x6, (b)->6x6>
Display( Y1 );
#! Image of <(1)>:
#! A row module over Q of rank 6
#! 
#! Image of (1)-[{ 1*(a) }]->(1):
#! Source:
#! A row module over Q of rank 6
#! 
#! Matrix:
#! [ [  0,  1,  0,  0,  0,  0 ],
#!   [  1,  0,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  1,  0,  0 ],
#!   [  0,  0,  1,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  0,  1 ],
#!   [  0,  0,  0,  0,  1,  0 ] ]
#! 
#! Range:
#! A row module over Q of rank 6
#! 
#! A morphism in Rows( Q )
#! 
#! Image of (1)-[{ 1*(b) }]->(1):
#! Source:
#! A row module over Q of rank 6
#! 
#! Matrix:
#! [ [  0,  0,  1,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  1,  0 ],
#!   [  0,  0,  0,  0,  0,  1 ],
#!   [  0,  1,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  1,  0,  0 ],
#!   [  1,  0,  0,  0,  0,  0 ] ]
#! 
#! Range:
#! A row module over Q of rank 6
#! 
#! A morphism in Rows( Q )
#! 
#! An object in PreSheaves( Algebra( Q, FreeCategory(
#! RightQuiver( "q(1)[a:1->1,b:1->1]" ) ) ) / relations, Rows( Q ) )
#! given by the above data
#! @EndExample
