gap> LoadPackage( "FunctorCategories", false );
true
gap> Q := HomalgFieldOfRationals( );
Q
gap> q := RightQuiver( "q(x,y,z,w)[a:x->y,b:y->z,c:z->w,d:z->w]" );
q(x,y,z,w)[a:x->y,b:y->z,c:z->w,d:z->w]
gap> P := FreeCategory( q );
FreeCategory( RightQuiver( "q(x,y,z,w)[a:x->y,b:y->z,c:z->w,d:z->w]" ) )
gap> D := P / [ [ P.bc, P.bd ] ];
FreeCategory( RightQuiver( "q(x,y,z,w)[a:x->y,b:y->z,c:z->w,d:z->w]" ) ) / [ b*c = b*d ]
gap> L := Q[D];
Algebroid( Q, FreeCategory( RightQuiver( "q(x,y,z,w)[a:x->y,b:y->z,c:z->w,d:z->w]" ) ) ) / relations
gap> B := L / [ L.abc ];
Algebroid( Q, FreeCategory( RightQuiver( "q(x,y,z,w)[a:x->y,b:y->z,c:z->w,d:z->w]" ) ) ) / relations
gap> UnderlyingQuiverAlgebra( B );
(Q * q) / [ -1*(b*d) + 1*(b*c), 1*(a*b*c) ]
gap> A := RangeCategoryOfHomomorphismStructure( B );
Rows( Q )
gap> H := FunctorCategory( B, A );
FunctorCategory( Algebroid( Q, FreeCategory( RightQuiver( "q(x,y,z,w)[a:x->y,b:y->z,c:z->w,d:z->w]" ) ) ) / relations, Rows( Q ) )
gap> mat_a := [[2,3,1], [1,0,-1]];;
gap> mat_b := [[2,0,-1,7], [3,2,1,5], [-2,5,6,-7]];;
gap> mat_c := [[-8],[2],[0],[3]];;
gap> mat_d := [[-14],[35],[-33],[0]];;
gap> alpha := mat_a / A;;
gap> beta := mat_b / A;;
gap> gamma := mat_c / A;;
gap> delta := mat_d / A;;
gap> F := AsObjectInFunctorCategory( H, [ 2, 3, 4, 1 ], [ alpha, beta, gamma, delta ] );
<(x)->2, (y)->3, (z)->4, (w)->1; (a)->2x3, (b)->3x4, (c)->4x1, (d)->4x1>				     
gap> F( B.bc ) = F( B.bd );
true
gap> IsZero( F( B.abc ) );
true
gap> IsZero( F( B.abd ) );
true
gap> IsWellDefined( F );
true
gap> mat_x := [[49/3,49/3],[-49/3,-49/3]];;
gap> mat_y := [[-44,28,-12],[44,-28,12],[5,77,-12]];;
gap> mat_z := [[-84,0,0,0],[0,-84,0,0],[57,102,0,84],[35,14,0,0]];;
gap> mat_w := [[-84]];;
gap> eta := AsMorphismInFunctorCategory( F, [ mat_x / A, mat_y / A, mat_z / A, mat_w / A ], F );
<(x)->2x2, (y)->3x3, (z)->4x4, (w)->1x1>	      
gap> IsWellDefined( eta );
true
gap> im := ImageObject( eta );
<(x)->1, (y)->2, (z)->3, (w)->1; (a)->1x2, (b)->2x3, (c)->3x1, (d)->3x1>
gap> Display( im );
Image of <(x)>:
A row module over Q of rank 1

Image of <(y)>:
A row module over Q of rank 2

Image of <(z)>:
A row module over Q of rank 3

Image of <(w)>:
A row module over Q of rank 1

Image of (x)-[{ 1*(a) }]->(y):
Source:
A row module over Q of rank 1

Matrix:
[ [  3,  3 ] ]

Range:
A row module over Q of rank 2

A morphism in Rows( Q )

Image of (y)-[{ 1*(b) }]->(z):
Source:
A row module over Q of rank 2

Matrix:
[ [   5/3,   5/6,  35/6 ],
  [  10/3,   7/6,  37/6 ] ]

Range:
A row module over Q of rank 3

A morphism in Rows( Q )

Image of (z)-[{ 1*(c) }]->(w):
Source:
A row module over Q of rank 3

Matrix:
[ [  -8 ],
  [   2 ],
  [   3 ] ]

Range:
A row module over Q of rank 1

A morphism in Rows( Q )

Image of (z)-[{ 1*(d) }]->(w):
Source:
A row module over Q of rank 3

Matrix:
[ [  -14 ],
  [   35 ],
  [    0 ] ]

Range:
A row module over Q of rank 1

A morphism in Rows( Q )

An object in FunctorCategory( Algebroid( Q, FreeCategory( RightQuiver( "q(x,y,z,w)[a:x->y,b:y->z,c:z->w,d:z->w]" ) ) ) / relations, Rows( Q ) ) given by the above data

