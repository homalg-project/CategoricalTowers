#! @BeginChunk Endomorphisms

LoadPackage( "CatReps" );

#! @Example
GF3 := HomalgRingOfIntegers(3);
#! GF(3)
ccat := ConcreteCategoryForCAP( [ [1,1,1], [4,5,6], [,,,5,6,4] ] );
#! A finite concrete category
relEndo := RelationsOfEndomorphisms( GF3, ccat );
#! [ Z(3)^0*(a*a) + Z(3)*(a), Z(3)^0*(c*c*c) + Z(3)*(2) ]
#! @EndExample

#! The next example is the companion matrix to $f^8-f^3$, so
#! neither $f^5-f^0$, $f^6-f^1$ nor $f^7-f^2$ are zero:

#! @Example
GF3 := HomalgRingOfIntegers(3);
#! GF(3)
ccat := ConcreteCategoryForCAP( [ [2,3,4,5,6,7,8,4] ] );
#
relEndo := RelationsOfEndomorphisms( GF3, ccat );
#! [ Z(3)^0*(a*a*a*a*a*a*a*a) + Z(3)*(a*a*a) ]
#! @EndExample
#! @EndChunk