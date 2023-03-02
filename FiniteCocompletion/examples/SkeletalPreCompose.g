#! @Chunk SkeletalPreCompose

#! @Example
LoadPackage( "FiniteCocompletion" );
#! true
sFinSets := SkeletalFinSetsAsFiniteStrictCoproductCocompletionOfTerminalCategory;
#! SkeletalFinSetsAsFiniteStrictCoproductCocompletionOfTerminalCategory
m := ObjectConstructor( sFinSets, 3 );
#! |3|
n := ObjectConstructor( sFinSets, 5 );
#! |5|
p := ObjectConstructor( sFinSets, 7 );
#! |7|
psi := MorphismConstructor( m, [ 1, 4, 2 ], n );
#! |3| → |5|
phi := MorphismConstructor( n, [ 0, 3, 5, 5, 2 ], p );
#! |5| → |7|
alpha := PreCompose( psi, phi );
#! |3| → |7|
Display( alpha );
#! { 0, 1, 2 } ⱶ[ 3, 2, 5 ]→ { 0,..., 6 }
#! @EndExample
