#! @Chunk SkeletalWellDefined

#! @Example
LoadPackage( "FiniteCocompletion" );
#! true
sFinSets :=
  SkeletalFinSetsAsFiniteStrictCoproductCocompletionOfTerminalCategory( );
#! SkeletalFinSetsAsFiniteStrictCoproductCocompletionOfTerminalCategory
s := ObjectConstructor( sFinSets, 7 );
#! |7|
t := ObjectConstructor( sFinSets, 4 );
#! |4|
psi := MorphismConstructor( s, [ 0, 2, 1, 2, 1, 3 ], t );
#! |7| → |4|
IsWellDefined( psi );
#! false
psi := MorphismConstructor( s, [ 0, 2, 1, 2, 1, 3, -2 ], t );
#! |7| → |4|
IsWellDefined( psi );
#! false
psi := MorphismConstructor( s, [ 1, 2, 1, 4, 2, 1, 3 ], t );
#! |7| → |4|
IsWellDefined( psi );
#! false
psi:= MorphismConstructor( s, [ 0, 2, 1, 3, 2, 1, 3 ], t );
#! |7| → |4|
IsWellDefined( psi );
#! true
#! @EndExample
