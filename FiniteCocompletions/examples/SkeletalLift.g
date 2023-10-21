#! @Chunk SkeletalLift

#! @Example
LoadPackage( "FiniteCocompletions" );
#! true
sFinSets :=
  SkeletalFinSetsAsFiniteStrictCoproductCompletionOfTerminalCategory;
#! SkeletalFinSetsAsFiniteStrictCoproductCompletionOfTerminalCategory
m := ObjectConstructor( sFinSets, 3 );
#! |3|
n := ObjectConstructor( sFinSets, 4 );
#! |4|
f := MorphismConstructor( m, [ 1, 1, 0 ], m );
#! |3| → |3|
g := MorphismConstructor( n, [ 2, 1, 0, 1 ], m );
#! |4| → |3|
IsLiftable( f, g );
#! true
chi := Lift( f, g );
#! |3| → |4|
Display( chi );
#! { 0, 1, 2 } ⱶ[ 1, 1, 2 ]→ { 0,..., 3 }
PreCompose( Lift( f, g ), g ) = f;
#! true
IsLiftable( g, f );
#! false
k := ObjectConstructor( sFinSets, 100000 );
#! |100000|
h := ListWithIdenticalEntries( Length( k ) - 3, 2 );;
h := Concatenation( h, [ 1, 0, 1 ] );;
h := MorphismConstructor( k, h, m );
#! |100000| → |3|
IsLiftable( f, h );
#! true
IsLiftable( h, f );
#! false
#! @EndExample
