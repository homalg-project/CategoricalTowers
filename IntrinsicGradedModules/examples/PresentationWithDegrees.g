#! @Chunk PresentationWithDegrees

LoadPackage( "IntrinsicGradedModules" );

#! @Example
Q := GradedRing( HomalgFieldOfRationalsInSingular( ) );
#! Q
#! (weights: yet unset)
S := Q["x,y,z"];
#! Q[x,y,z]
#! (weights: yet unset)
A := CategoryOfHomalgFinitelyPresentedGradedLeftModules( S );
#! IntrinsicCategory( CategoryWithAmbientObjects( Freyd( GradedRows(
#! Q[x,y,z] (with weights [ 1, 1, 1 ]) ) ) ) )
mat := HomalgMatrix( "[ 0, z, -y,  -z, 0, x,  y, -x, 0 ]", 3, 3, S );
#! <A 3 x 3 matrix over a graded ring>
phi := GradedMap( mat, "left", S );
#! <A homomorphism of left graded modules>
IsWellDefined( phi );
#! true
phi;
#! <A homomorphism of left graded modules>
N := CokernelObject( phi );
#! <A graded left module presented by 3 relations for 3 generators>
Display( N );
#! 0, z, -y,
#! -z,0, x,
#! y, -x,0
#! (over a graded ring)
#! 
#! Cokernel of the map
#! 
#! R^(1x3) --> R^(1x3), ( for R := Q[x,y,z] (with weights [ 1, 1, 1 ]) )
#! 
#! currently represented by the above matrix
#! 
#! (graded, degrees of generators: [ 0, 0, 0 ])
H := InternalHomOnObjects( N, N );
#! <A graded left module presented by 2 relations for 3 generators>
M := LeftPresentationWithDegrees( mat );
#! <A graded left module presented by 3 relations for 3 generators>
IsWellDefined( M );
#! true
1 * S;
#! <The graded free left module of rank 1 on a free generator>
0 * S;
#! <A graded zero left module>
ZeroObject( A );
#! <A graded zero left module>
0 * S = ZeroObject( A );
#! true
Ms := DualOnObjects( M );
#! <A graded free left module of rank 1 on a free generator>
Display( Ms );
#! Q[x,y,z] (with weights [ 1, 1, 1 ])^(1 x 1)
#! 
#! (graded, degree of generator: 1)
pi := EpimorphismFromSomeProjectiveObject( M );
#! <A homomorphism of left graded modules>
IsWellDefined( pi );
#! true
Display( pi );
#! 1,0,0,
#! 0,1,0,
#! 0,0,1
#! (over a graded ring)
#! 
#! the graded map is currently represented by the above 3 x 3 matrix
#! 
#! (degrees of generators of target: [ 0, 0, 0 ])
#! @EndExample
