#! @Chunk SkeletalHomStructure

#! @Example
LoadPackage( "FiniteCocompletion" );
#! true
sFinSets :=
  SkeletalFinSetsAsFiniteStrictCoproductCocompletionOfTerminalCategory( );
#! SkeletalFinSetsAsFiniteStrictCoproductCocompletionOfTerminalCategory
A := ObjectConstructor( sFinSets, 3 );
#! |3|
Display( A );
#! { 0, 1, 2 }
B := ObjectConstructor( sFinSets, 2 );
#! |2|
A = B;
#! false
Display( B );
#! { 0, 1 }
HomAB := HomStructure( A, B );
#! |8|
I := HomStructure( sFinSets );
#! |1|
homAB := List( [ 0 .. Length( HomAB ) - 1 ], i ->
               MorphismConstructor( I, [ i ], HomAB ) );
#! [ |1| → |8|, |1| → |8|, |1| → |8|, |1| → |8|,
#!   |1| → |8|, |1| → |8|, |1| → |8|, |1| → |8| ]
List( homAB, IsWellDefined );
#! [ true, true, true, true, true, true, true, true ]
List( homAB, m -> HomStructure( HomStructure( A, B, m ) ) ) = homAB;
#! true
#! @EndExample
