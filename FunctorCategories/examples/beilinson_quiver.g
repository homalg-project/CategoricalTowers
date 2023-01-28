LoadPackage( "FunctorCategories" );

k := HomalgFieldOfRationals( );

q := RightQuiver(
  "q(4)[x0:1->2,x1:1->2,x2:1->2,x3:1->2,y0:2->3,y1:2->3,y2:2->3,y3:2->3,z0:3->4,z1:3->4,z2:3->4,z3:3->4]" 
    );;

F := FreeCategory( q );

kF := k[F];

A := kF / [
            kF.x0 * kF.y0 , kF.y0 * kF.z0,
            kF.x1 * kF.y1 , kF.y1 * kF.z1,
            kF.x2 * kF.y2 , kF.y2 * kF.z2,
            kF.x3 * kF.y3 , kF.y3 * kF.z3,
            kF.x0 * kF.y1 + kF.x1 * kF.y0,
            kF.x0 * kF.y2 + kF.x2 * kF.y0,
            kF.x0 * kF.y3 + kF.x3 * kF.y0,
            kF.x1 * kF.y2 + kF.x2 * kF.y1,
            kF.x1 * kF.y3 + kF.x3 * kF.y1,
            kF.x2 * kF.y3 + kF.x3 * kF.y2,
            kF.y0 * kF.z1 + kF.y1 * kF.z0,
            kF.y0 * kF.z2 + kF.y2 * kF.z0,
            kF.y0 * kF.z3 + kF.y3 * kF.z0,
            kF.y1 * kF.z2 + kF.y2 * kF.z1,
            kF.y1 * kF.z3 + kF.y3 * kF.z1,
            kF.y2 * kF.z3 + kF.y3 * kF.z2
          ];;

PSh := PreSheaves( A );

indec := Shuffle( Concatenation( IndecomposableProjectiveObjects( PSh ), IndecomposableInjectiveObjects( PSh ) ) );

F := DirectSum( List( [ 1 .. 5 ], i -> Random( indec ) ) );

G := DirectSum( List( [ 1 .. 4 ], i -> Random( indec ) ) );
