#! @Chunk AlgebroidRelations

LoadPackage( "CatReps" );

#! @Example
c3c3c3 := ConcreteCategoryForCAP( [ [2,3,1], [4,5,6], [,,,5,6,4], [,,,7,8,9], [,,,,,,8,9,7], [7,8,9] ] );
#! A finite concrete category
q := RightQuiverFromConcreteCategory( c3c3c3 );
#! q(3)[a:1->1,b:1->2,c:2->2,d:2->3,e:3->3,f:1->3]
HOMALG_MATRICES.PreferDenseMatrices := true;
#! true
GF3 := HomalgRingOfIntegers( 3 );
#! GF(3)
relEndo := RelationsOfEndomorphisms( GF3, c3c3c3 );
#! [ Z(3)^0*(a*a*a) + Z(3)*(1), 
#!   Z(3)^0*(c*c*c) + Z(3)*(2), Z(3)^0*(e*e*e) + Z(3)*(3) ]
kq := PathAlgebra( GF3, q );
#! GF(3) * q
kq / relEndo;
#! (GF(3) * q) / [ Z(3)^0*(a*a*a) + Z(3)*(1),
#!   Z(3)^0*(c*c*c) + Z(3)*(2), Z(3)^0*(e*e*e) + Z(3)*(3) ]
basispaths := BasisPaths(Basis( kq / relEndo ) );
#! [ (1), (2), (3), (a), (b), (c), (d), (e), (f), (a*a),
#! (a*b), (a*f), (b*c), (b*d), (c*c), (c*d),
#! (d*e), (e*e), (f*e), (a*a*b), (a*a*f), (a*b*c), 
#! (a*b*d), (a*f*e), (b*c*c), (b*c*d), (b*d*e),
#! (c*c*d), (c*d*e), (d*e*e), (f*e*e), (a*a*b*c),
#! (a*a*b*d), (a*a*f*e), (a*b*c*c), (a*b*c*d),
#! (a*b*d*e), (a*f*e*e), (b*c*c*d), (b*c*d*e),
#! (b*d*e*e), (c*c*d*e), (c*d*e*e), (a*a*b*c*c),
#! (a*a*b*c*d), (a*a*b*d*e), (a*a*f*e*e), (a*b*c*c*d),
#! (a*b*c*d*e), (a*b*d*e*e), (b*c*c*d*e),
#! (b*c*d*e*e), (c*c*d*e*e), (a*a*b*c*c*d), (a*a*b*c*d*e),
#! (a*a*b*d*e*e), (a*b*c*c*d*e),
#! (a*b*c*d*e*e), (b*c*c*d*e*e), (a*a*b*c*c*d*e),
#! (a*a*b*c*d*e*e), (a*b*c*c*d*e*e), (a*a*b*c*c*d*e*e) ]
#! @EndExample

#! With the loops divided out of the quiver, QPA can give us all
#! the paths in the quiver, sorted by length. To get all the
#! relations in the algebroid, we want to partition the paths
#! that have the same source and the same target.

#! @Example
Filtered( basispaths, p -> 
	Source( p ) = Source(basispaths[1]) and
	Target( p ) = Target(basispaths[1]) );
#! [ (1), (a), (a*a) ]
Filtered( basispaths, p -> 
	Source( p ) = Source(basispaths[2]) and
	Target( p ) = Target(basispaths[2]) );
#! [ (2), (c), (c*c) ]
Filtered( basispaths, p -> 
	Source( p ) = Source(basispaths[3]) and
	Target( p ) = Target(basispaths[3]) );
#! [ (3), (e), (e*e) ]
Filtered( basispaths, p ->
	Source( p ) = Source(basispaths[1]) and
	Target( p ) = Target(basispaths[2]) );
#! [ (b), (a*b), (b*c), (a*a*b), (a*b*c), (b*c*c),
#! (a*a*b*c), (a*b*c*c), (a*a*b*c*c) ]
Filtered( basispaths, p ->
	Source( p ) = Source(basispaths[1]) and
	Target( p ) = Target(basispaths[3]) );
#! [ (f), (a*f), (b*d), (f*e), (a*a*f), (a*b*d), 
#! (a*f*e), (b*c*d), (b*d*e), (f*e*e), (a*a*b*d),
#! (a*a*f*e), (a*b*c*d), (a*b*d*e), (a*f*e*e),
#! (b*c*c*d), (b*c*d*e), (b*d*e*e), (a*a*b*c*d),
#! (a*a*b*d*e), (a*a*f*e*e), (a*b*c*c*d), (a*b*c*d*e),
#! (a*b*d*e*e), (b*c*c*d*e), (b*c*d*e*e), (a*a*b*c*c*d),
#! (a*a*b*c*d*e), (a*a*b*d*e*e), (a*b*c*c*d*e),
#! (a*b*c*d*e*e), (b*c*c*d*e*e), (a*a*b*c*c*d*e),
#! (a*a*b*c*d*e*e), (a*b*c*c*d*e*e), (a*a*b*c*c*d*e*e) ]
Filtered( basispaths, p ->
	Source( p ) = Source(basispaths[2]) and
	Target( p ) = Target(basispaths[3]) );
#! [ (d), (c*d), (d*e), (c*c*d), (c*d*e), (d*e*e), 
#! (c*c*d*e), (c*d*e*e), (c*c*d*e*e) ]
#! @EndExample





