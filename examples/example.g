LoadPackage( "FunctorCategories" );
LoadPackage( "LinearAlgebraForCAP" );

field := HomalgFieldOfRationals( );

quiver := RightQuiver( 
  "q(4)[x0:1->2,x1:1->2,x2:1->2,x3:1->2,y0:2->3,y1:2->3,y2:2->3,y3:2->3,z0:3->4,z1:3->4,z2:3->4,z3:3->4]" 
    );;

Qq := PathAlgebra( field, quiver );;

A := QuotientOfPathAlgebra(
  Qq,
  [ 
    Qq.x0 * Qq.y0 , Qq.y0 * Qq.z0,
    Qq.x1 * Qq.y1 , Qq.y1 * Qq.z1,
    Qq.x2 * Qq.y2 , Qq.y2 * Qq.z2,
    Qq.x3 * Qq.y3 , Qq.y3 * Qq.z3,
    Qq.x0 * Qq.y1 + Qq.x1 * Qq.y0,
    Qq.x0 * Qq.y2 + Qq.x2 * Qq.y0,
    Qq.x0 * Qq.y3 + Qq.x3 * Qq.y0,
    Qq.x1 * Qq.y2 + Qq.x2 * Qq.y1,
    Qq.x1 * Qq.y3 + Qq.x3 * Qq.y1,
    Qq.x2 * Qq.y3 + Qq.x3 * Qq.y2,
    Qq.y0 * Qq.z1 + Qq.y1 * Qq.z0,
    Qq.y0 * Qq.z2 + Qq.y2 * Qq.z0,
    Qq.y0 * Qq.z3 + Qq.y3 * Qq.z0,
    Qq.y1 * Qq.z2 + Qq.y2 * Qq.z1,
    Qq.y1 * Qq.z3 + Qq.y3 * Qq.z1,
    Qq.y2 * Qq.z3 + Qq.y3 * Qq.z2
  ]
);;

SetIsAdmissibleQuiverAlgebra( A, true );

algebroid := Algebroid( A );

quivers_cat := CategoryOfQuiverRepresentations( A );

matrix_cat := MatrixCategory( field );

functors_cat := Hom( algebroid, matrix_cat );

F := IsomorphismFromCategoryOfQuiverRepresentations( functors_cat );

projs := List( IndecProjRepresentations( A ), p -> ApplyFunctor( F, p ) );

a := DirectSum( List( [ 1 .. 10 ], i -> Random( projs ) ) );

b := DirectSum( List( [ 1 .. 10 ], i -> Random( projs ) ) );

h_a_b := HomomorphismStructureOnObjects( a, b );

