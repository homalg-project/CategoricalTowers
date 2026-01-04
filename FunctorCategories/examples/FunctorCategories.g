LoadPackage( "FunctorCategories", false );
Q := HomalgFieldOfRationals( );
q := RightQuiver( "q(x,y,z,w)[a:x->y,b:y->z,c:z->w,d:z->w]" );
P := FreeCategory( q );
D := P / [ [ P.bc, P.bd ] ];
L := Q[D];
B := L / [ L.abc ];
UnderlyingQuiverAlgebra( B );
A := RangeCategoryOfHomomorphismStructure( B );
H := FunctorCategory( B, A : no_precompiled_code := true );
mat_a := [[2,3,1], [1,0,-1]];
mat_b := [[2,0,-1,7], [3,2,1,5], [-2,5,6,-7]];
mat_c := [[-8],[2],[0],[3]];
mat_d := [[-14],[35],[-33],[0]];
alpha := mat_a / A;
Display( alpha );
beta := mat_b / A;
Display( beta );
gamma := mat_c / A;
Display( gamma );
delta := mat_d / A;
Display( delta );
F := AsObjectInFunctorCategory( H,
             [ 2, 3, 4, 1 ],
             [ alpha, beta, gamma, delta ]);
Display( F( B.a ) );
Display( F( B.b ) );
Display( F( B.ab ) );
Display( PreCompose( F( B.a ), F( B.b ) ) );
Assert( 0, F( B.bc ) = F( B.bd ) );
Assert( 0, IsZero( F( B.abc ) ) );
Assert( 0, IsZero( F( B.abd ) ) );
Assert( 0, IsWellDefined( F ) );
mat_x := [[49/3,49/3],[-49/3,-49/3]];
mat_y := [[-44,28,-12],[44,-28,12],[5,77,-12]];
mat_z := [[-84,0,0,0],[0,-84,0,0],[57,102,0,84],[35,14,0,0]];
mat_w := [[-84]];
eta := AsMorphismInFunctorCategory( F,
               [ mat_x / A, mat_y / A, mat_z / A, mat_w / A ],
               F );
Display( eta( B.x ) );
Assert( 0, IsWellDefined( eta ) );
im := ImageObject( eta );
Display( im );
