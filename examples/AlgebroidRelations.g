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
relEndo := RelationsOfEndomorphisms( c3c3c3 );
#! [ "kq.a^3-kq.1", "kq.c^3-kq.2", "kq.e^3-kq.3" ]
#! @EndExample










