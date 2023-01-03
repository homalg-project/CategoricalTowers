#! @Chunk SkeletalDirectProduct

#! @Example
LoadPackage( "FiniteCocompletion" );
#! true
sFinSets := SkeletalFinSetsAsFiniteCoproductCocompletionOfTerminalCategory( );
#! SkeletalFinSetsAsFiniteCoproductCocompletionOfTerminalCategory
m := ObjectConstructor( sFinSets, 7 );
#! |7|
n := ObjectConstructor( sFinSets, 3 );
#! |3|
p := ObjectConstructor( sFinSets, 4 );
#! |4|
d := DirectProduct( [ m, n, p ] );
#! |84|
AsList( d );
#! [ 0 .. 83 ]
pi1 := ProjectionInFactorOfDirectProduct( [ m, n, p ], 1 );
#! |84| → |7|
Display( pi1 );
#! { 0,..., 83 } ⱶ[ 0, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6,
#!                  0, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6,
#!                  0, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6,
#!                  0, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6,
#!                  0, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6,
#!                  0, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6 ]→ { 0,..., 6 }
pi2 := ProjectionInFactorOfDirectProduct( [ m, n, p ], 2 );
#! |84| → |3|
Display( pi2 );
#! { 0,..., 83 } ⱶ[ 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1,
#!                  2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0,
#!                  1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2,
#!                  0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1,
#!                  2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0,
#!                  1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2 ]→ { 0, 1, 2 }
pi3 := ProjectionInFactorOfDirectProduct( [ m, n, p ], 3 );
#! |84| → |4|
Display( pi3 );
#! { 0,..., 83 } ⱶ[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
#!                  0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1,
#!                  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
#!                  2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
#!                  2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3,
#!                  3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3 ]→ { 0,..., 3 }
psi := UniversalMorphismIntoDirectProduct( [ m, n, p ], [ pi1, pi2, pi3 ] );
#! |84| → |84|
psi = IdentityMorphism( d );
#! true
#! @EndExample
