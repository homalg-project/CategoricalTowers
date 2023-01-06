#! @Chunk SkeletalCoproduct

#! @Example
LoadPackage( "FiniteCocompletion" );
#! true
sFinSets :=
  SkeletalFinSetsAsFiniteStrictCoproductCocompletionOfTerminalCategory( );
#! SkeletalFinSetsAsFiniteStrictCoproductCocompletionOfTerminalCategory
m := ObjectConstructor( sFinSets, 7 );
#! |7|
n := ObjectConstructor( sFinSets, 3 );
#! |3|
p := ObjectConstructor( sFinSets, 4 );
#! |4|
c := Coproduct( m, n, p );
#! |14|
AsList( c );
#! [ 0 .. 13 ]
iota1 := InjectionOfCofactorOfCoproduct( [ m, n, p ], 1 );
#! |7| → |14|
IsWellDefined( iota1 );
#! true
Display( iota1 );
#! { 0,..., 6 } ⱶ[ 0 .. 6 ]→ { 0,..., 13 }
iota2 := InjectionOfCofactorOfCoproduct( [ m, n, p ], 2 );
#! |3| → |14|
IsWellDefined( iota2 );
#! true
Display( iota2 );
#! { 0, 1, 2 } ⱶ[ 7 .. 9 ]→ { 0,..., 13 }
iota3 := InjectionOfCofactorOfCoproduct( [ m, n, p ], 3 );
#! |4| → |14|
IsWellDefined( iota3 );
#! true
Display( iota3 );
#! { 0,..., 3 } ⱶ[ 10 .. 13 ]→ { 0,..., 13 }
psi := UniversalMorphismFromCoproduct(
               [ m, n, p ], [ iota1, iota2, iota3 ] );
#! |14| → |14|
id := IdentityMorphism( Coproduct( [ m, n, p ] ) );
#! |14| → |14|
psi = id;
#! true
#! @EndExample
