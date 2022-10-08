LoadPackage( "FunctorCategories" );

#  x    a
#    1 ---> 2
#    |      |
#  c |      | b
#    v      v
#    3 ---> 4
#       d     y
#
quiver := RightQuiver( "q(4)[x:1->1,a:1->2,b:2->4,c:1->3,d:3->4,y:4->4]" );

F := FreeCategory( quiver );

Q := HomalgFieldOfRationals( );

QF := Q[F];

A := QF / [ QF.x^3, QF.y^2 ];

H := FunctorCategory( A );

indec_projs := IndecProjectiveObjects( H );

a := DirectSum( List( [ 1 .. 4 ], i -> Random( indec_projs ) ) );

b := DirectSum( List( [ 1 .. 4 ], i -> Random( indec_projs ) ) );

Hom_a_b := HomStructure( a, b );

B := BasisOfExternalHom( a, b );
