#! @Chunk SkeletalCoproductComplement

#! @Example
LoadPackage( "FiniteCocompletions", false );
#! true
sFinSets :=
  SkeletalFinSetsAsFiniteStrictCoproductCompletionOfTerminalCategory;
#! SkeletalFinSetsAsFiniteStrictCoproductCompletionOfTerminalCategory
m := ObjectConstructor( sFinSets, 3 );
#! |3|
n := ObjectConstructor( sFinSets, 5 );
#! |5|
iota:= MorphismConstructor( m, [ 1, 4, 2 ], n );
#! |3| → |5|
Display( iota );
#! { 0, 1, 2 } ⱶ[ 1, 4, 2 ]→ { 0,..., 4 }
kappa := InjectionOfCoproductComplement( iota );
#! |2| → |5|
IsWellDefined( kappa );
#! true
Display( kappa );
#! { 0, 1 } ⱶ[ 0, 3 ]→ { 0,..., 4 }
iso := UniversalMorphismFromCoproduct( [ iota, kappa ] );
#! |5| → |5|
IsWellDefined( iso );
#! true
Display( iso );
#! { 0,..., 4 } ⱶ[ 1, 4, 2, 0, 3 ]→ { 0,..., 4 }
IsIsomorphism( iso );
#! true
#! @EndExample
