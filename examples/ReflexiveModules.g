#! @Chunk ReflexiveModules

LoadPackage( "FunctorCategories" );

#! @Example
q := RightQuiver( "q(1)[t:1->1]" );
#! q(1)[t:1->1]
F := FreeCategory( q );
#! FreeCategory( RightQuiver( "q(1)[t:1->1]" ) )
Q := HomalgFieldOfRationals( );
#! Q
Qq := Q[F];
#! Algebra( Q, FreeCategory( RightQuiver( "q(1)[t:1->1]" ) ) )
A := Qq / [ Qq.t^3 ];
#! Algebra( Q, FreeCategory( RightQuiver( "q(1)[t:1->1]" ) ) ) / relations
PSh := PreSheaves( A );
#! PreSheaves(
#! Algebra( Q, FreeCategory( RightQuiver( "q(1)[t:1->1]" ) ) ) / relations,
#! Rows( Q ) )
CommutativeRingOfLinearCategory( PSh );
#! Q
Display( PSh.1 );
#! Image of <(1)>:
#! A row module over Q of rank 3
#! 
#! Image of (1)-[{ 1*(t) }]->(1):
#! Source:
#! A row module over Q of rank 3
#! 
#! Matrix:
#! [ [  0,  1,  0 ],
#!   [  0,  0,  1 ],
#!   [  0,  0,  0 ] ]
#! 
#! Range:
#! A row module over Q of rank 3
#! 
#! A morphism in Rows( Q )
#! 
#! An object in PreSheaves(
#! Algebra( Q, FreeCategory( RightQuiver( "q(1)[t:1->1]" ) ) ) / relations,
#! Rows( Q ) ) given by the above data
Display( PSh.t );
#! Image of <(1)>:
#! Source:
#! A row module over Q of rank 3
#! 
#! Matrix:
#! [ [  0,  1,  0 ],
#!   [  0,  0,  1 ],
#!   [  0,  0,  0 ] ]
#! 
#! Range:
#! A row module over Q of rank 3
#! 
#! A morphism in Rows( Q )
#! 
#! A morphism in PreSheaves(
#! Algebra( Q, FreeCategory( RightQuiver( "q(1)[t:1->1]" ) ) ) / relations,
#! Rows( Q ) ) given by the above data
phi := PreCompose( PSh.t, PSh.t );
#! <(1)->3x3>
V := DirectSum( [ PSh.1, KernelObject( phi ), ImageObject( phi ) ] );
#! <(1)->6; (t)->6x6>
Display( V );
#! Image of <(1)>:
#! A row module over Q of rank 6
#! 
#! Image of (1)-[{ 1*(t) }]->(1):
#! Source:
#! A row module over Q of rank 6
#! 
#! Matrix:
#! [ [  0,  1,  0,  0,  0,  0 ],
#!   [  0,  0,  1,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  1,  0 ],
#!   [  0,  0,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  0,  0 ] ]
#! 
#! Range:
#! A row module over Q of rank 6
#! 
#! A morphism in Rows( Q )
#! 
#! An object in PreSheaves(
#! Algebra( Q, FreeCategory( RightQuiver( "q(1)[t:1->1]" ) ) ) / relations,
#! Rows( Q ) ) given by the above data
IsProjective( V );
#! false
IsReflexive( V );
#! true
#! @EndExample
