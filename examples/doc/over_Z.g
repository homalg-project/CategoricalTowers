#! @BeginChunk over_Z
LoadPackage( "Bialgebroid" );

#! We create two algebroids from the same algebra.
#! One will be defined over the rationals, the other over the integers.

#! @Example
q := RightQuiver( "q(4)[a:1->2,b:1->3,c:3->4,d:2->4]" );;
Q := HomalgFieldOfRationals( );;
Qq := PathAlgebra( Q, q );;
Qq := Qq / [ Qq.a * Qq. d - Qq.b * Qq.c];;
A_Z := AlgebroidOverZ( Qq );;
A_Q := Algebroid( Qq );;
#! @EndExample

#! We demonstrate the practical difference between the two algebroids
#! by trying to solve one and the same linear system.

#! @Example
alpha := (2/Q) * A_Q.a;;
id := IdentityMorphism( A_Q.4 );;
gamma := PreCompose( A_Q.b, A_Q.c );;
sol := SolveLinearSystemInAbCategory( [ [ alpha ] ], [ [ id ] ], [ gamma ] );
#! [ (2)-[{ 1/2*(d) }]->(4) ]
#! @EndExample

#! Thus, a solution exists over the rationals.

#! @Example
alpha := A_Z.a + A_Z.a;;
id := IdentityMorphism( A_Z.4 );;
gamma := PreCompose( A_Z.b, A_Z.c );;
sol := SolveLinearSystemInAbCategory( [ [ alpha ] ], [ [ id ] ], [ gamma ] );
#! fail
#! @EndExample

#! No solution exists over the integers.

#! @EndChunk
