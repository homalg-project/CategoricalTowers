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
alpha := HomStructure( A, B, homAB[6] );
#! |3| → |2|
Display( alpha );
#! { 0, 1, 2 } ⱶ[ 1, 0, 1 ]→ { 0, 1 }
gamma := HomStructure( A, B, homAB[2] );
#! |3| → |2|
Display( gamma );
#! { 0, 1, 2 } ⱶ[ 1, 0, 0 ]→ { 0, 1 }
hom_alpha_gamma := HomStructure( alpha, gamma );
#! |9| → |8|
Display( hom_alpha_gamma );
#! { 0,..., 8 } ⱶ[ 7, 5, 5, 2, 0, 0, 2, 0, 0 ]→ { 0,..., 7 }
IsWellDefined( hom_alpha_gamma );
#! true
#! @EndExample
