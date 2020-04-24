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
#! @EndExample










