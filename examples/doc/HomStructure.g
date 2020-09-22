#! @BeginChunk HomStructure

LoadPackage( "Bialgebroid" );

#! We perform simple computations with the Homomorphism structure of the Beilison quiver of
#! the projective space of dimension 3.

#! @Example
q := RightQuiver( "q(4)[\
x0:1->2,x1:1->2,x2:1->2,x3:1->2,\
y0:2->3,y1:2->3,y2:2->3,y3:2->3,\
z0:3->4,z1:3->4,z2:3->4,z3:3->4]" );;
Q := HomalgFieldOfRationals( );;
Qq := PathAlgebra( Q, q );;
Beilinson_P3 := Algebroid( Qq, 
  [ Qq.x0 * Qq.y1 - Qq.x1 * Qq.y0,
    Qq.x0 * Qq.y2 - Qq.x2 * Qq.y0,
    Qq.x0 * Qq.y3 - Qq.x3 * Qq.y0,
    Qq.x1 * Qq.y2 - Qq.x2 * Qq.y1,
    Qq.x1 * Qq.y3 - Qq.x3 * Qq.y1,
    Qq.x2 * Qq.y3 - Qq.x3 * Qq.y2,
    Qq.y0 * Qq.z1 - Qq.y1 * Qq.z0,
    Qq.y0 * Qq.z2 - Qq.y2 * Qq.z0,
    Qq.y0 * Qq.z3 - Qq.y3 * Qq.z0,
    Qq.y1 * Qq.z2 - Qq.y2 * Qq.z1,
    Qq.y1 * Qq.z3 - Qq.y3 * Qq.z1,
    Qq.y2 * Qq.z3 - Qq.y3 * Qq.z2
  ]
);;
objs := SetOfObjects( Beilinson_P3 );;
Length( objs ) = 4;
#! true
maps := SetOfGeneratingMorphisms( Beilinson_P3.1, Beilinson_P3.2 );;
maps = SetOfGeneratingMorphisms( Beilinson_P3, 1, 2 );
#! true
Length( maps ) = 4;
#! true
ForAll( [ 0 .. 3 ], k ->
        Dimension( HomomorphismStructureOnObjects( objs[1], objs[1 + k] ) )
        = Binomial( 4 + k - 1, k )
);
#! true
alpha := Beilinson_P3.x0;;
beta := ( Beilinson_P3.z1 + Beilinson_P3.z2 );;
gamma := PreCompose( [ alpha, (Beilinson_P3.y1 - Beilinson_P3.y3), beta ] );;
sol := SolveLinearSystemInAbCategory(
               [ [ alpha ] ], [ [ beta ] ], [ gamma ] )[1];;
IsCongruentForMorphisms( PreCompose( [ alpha, sol, beta ] ), gamma );
#! true
#! @EndExample

#! @EndChunk
