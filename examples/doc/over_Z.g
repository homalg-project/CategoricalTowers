#! @BeginChunk over_Z

LoadPackage( "Algebroids" );

#! We create an algebroid over $\mathbb{Q}$ and its descent to $\mathbb{Z}$ defined by basis paths.

#! @Example
q := RightQuiver( "q(4)[a:1->2,b:1->3,c:3->4,d:2->4]" );;
Q := HomalgFieldOfRationals( );;
Qq := PathAlgebra( Q, q );;
Qq := Qq / [ Qq.a * Qq.d - Qq.b * Qq.c];;
A_Q := Algebroid( Qq );;
A_Z := DescentToZDefinedByBasisPaths( A_Q );;
#! @EndExample

#! We demonstrate the practical difference between the two algebroids
#! by trying to solve one and the same linear system.

#! @Example
alpha := 2 * A_Q.a;;
id := IdentityMorphism( A_Q.4 );;
gamma := PreCompose( A_Q.b, A_Q.c );;
sol := SolveLinearSystemInAbCategory( [ [ alpha ] ], [ [ id ] ], [ gamma ] );
#! [ (2)-[{ 1/2*(d) }]->(4) ]
#! @EndExample

#! Thus, a solution exists over the rationals.

#! @Example
alpha := 2 * A_Z.a;;
id := IdentityMorphism( A_Z.4 );;
gamma := PreCompose( A_Z.b, A_Z.c );;
sol := MereExistenceOfSolutionOfLinearSystemInAbCategory(
               [ [ alpha ] ], [ [ id ] ], [ gamma ] );
#! false
#! @EndExample

#! No solution exists over the integers.

#! @EndChunk
