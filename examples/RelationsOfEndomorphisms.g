#! @BeginChunk Endomorphisms

LoadPackage( "CatReps" );

#! 
#! Two examples to test if RelationsOfEndomorphisms also works
#! on endomorphisms that aren't bijective.
#! The first example is a constant endomorphism, so applying
#! it twice should be the same as once.

#! @Example
GF3 := HomalgRingOfIntegers(3);
#! GF(3)
ccat := ConcreteCategoryForCAP( [ [1,1,1], [4,5,6], [,,,5,6,4] ] );
#! A finite concrete category
relEndo := RelationsOfEndomorphisms( GF3, ccat );
#! [ Z(3)^0*(a*a) + Z(3)*(a), Z(3)^0*(c*c*c) + Z(3)*(2) ]
#! @EndExample

#! The next example is the permutation by the companion matrix to $a^8-a^3$, so
#! neither $a^5-a^0$, $a^6-a^1$ nor $a^7-a^2$ are zero:

#! @Example
GF3 := HomalgRingOfIntegers(3);
#! GF(3)
ccat := ConcreteCategoryForCAP( [ [2,3,4,5,6,7,8,4] ] );
#! A finite concrete category
relEndo := RelationsOfEndomorphisms( GF3, ccat );
#! [ Z(3)^0*(a*a*a*a*a*a*a*a) + Z(3)*(a*a*a) ]
#! @EndExample
#! @EndChunk