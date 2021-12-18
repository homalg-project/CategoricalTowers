#! @BeginChunk HomStructure

LoadPackage( "Algebroids" );

#! We perform simple computations with the Homomorphism structure of the Beilison quiver of
#! the projective space of dimension 3.

#! @Example
q := RightQuiver( "q(4)[\
x0:1->2,x1:1->2,x2:1->2,x3:1->2,\
y0:2->3,y1:2->3,y2:2->3,y3:2->3,\
z0:3->4,z1:3->4,z2:3->4,z3:3->4]" );;
F := FreeCategory( q );;
beilinson_P3 := F /
                [ [ PreCompose( F.x0, F.y1 ), PreCompose( F.x1, F.y0 ) ],
                  [ PreCompose( F.x0, F.y2 ), PreCompose( F.x2, F.y0 ) ],
                  [ PreCompose( F.x0, F.y3 ), PreCompose( F.x3, F.y0 ) ],
                  [ PreCompose( F.x1, F.y2 ), PreCompose( F.x2, F.y1 ) ],
                  [ PreCompose( F.x1, F.y3 ), PreCompose( F.x3, F.y1 ) ],
                  [ PreCompose( F.x2, F.y3 ), PreCompose( F.x3, F.y2 ) ],
                  [ PreCompose( F.y0, F.z1 ), PreCompose( F.y1, F.z0 ) ],
                  [ PreCompose( F.y0, F.z2 ), PreCompose( F.y2, F.z0 ) ],
                  [ PreCompose( F.y0, F.z3 ), PreCompose( F.y3, F.z0 ) ],
                  [ PreCompose( F.y1, F.z2 ), PreCompose( F.y2, F.z1 ) ],
                  [ PreCompose( F.y1, F.z3 ), PreCompose( F.y3, F.z1 ) ],
                  [ PreCompose( F.y2, F.z3 ), PreCompose( F.y3, F.z2 ) ] ];;
Q := HomalgFieldOfRationals( );;
Beilinson_P3 := Q[beilinson_P3];;
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
