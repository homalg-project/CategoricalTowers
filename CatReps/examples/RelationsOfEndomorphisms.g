#! @BeginChunk RelationsOfEndomorphisms

LoadPackage( "CatReps" );

#! The two examples below test <C>RelationsOfEndomorphisms</C>
#! on endomorphisms that are not bijective.

#! The first generating morphism of the first example is constant, and hence an idempotent.

#! @Example
ccat := ConcreteCategoryForCAP( [ [1,1,1], [4,5,6], [,,,5,6,4] ] );
#! A finite concrete category
relEndo := RelationsOfEndomorphisms( ccat );
#! [ [ (a*a), (a) ], [ (c*c*c), (2) ] ]
#! @EndExample

#! The next example is a single permutation defined by the companion matrix of $a^8-a^3$, hence
#! neither $a^5-a^0$, $a^6-a^1$, nor $a^7-a^2$ are zero:

#! @Example
ccat := ConcreteCategoryForCAP( [ [2,3,4,5,6,7,8,4] ] );
#! A finite concrete category
relEndo := RelationsOfEndomorphisms( ccat );
#! [ [ (a*a*a*a*a*a*a*a), (a*a*a) ] ]
#! @EndExample
#! @EndChunk
