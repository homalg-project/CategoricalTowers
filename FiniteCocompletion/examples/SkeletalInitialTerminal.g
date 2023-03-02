#! @Chunk SkeletalInitialTerminal

#! @Example
LoadPackage( "FiniteCocompletion" );
#! true
sFinSets := SkeletalFinSetsAsFiniteStrictCoproductCocompletionOfTerminalCategory;
#! SkeletalFinSetsAsFiniteStrictCoproductCocompletionOfTerminalCategory
m := ObjectConstructor( sFinSets, 8 );
#! |8|
IsInitial( m );
#! false
IsTerminal( m );
#! false
i := InitialObject( sFinSets );
#! |0|
AsList( i );
#! [  ]
Display( i );
#! ∅
IsInitial( i );
#! true
IsTerminal( i );
#! false
iota := UniversalMorphismFromInitialObject( m );
#! |0| → |8|
ii := InitialObjectFunctorial( sFinSets );
#! |0| → |0|
IsOne( ii );
#! true
ii;
#! |0| ⭇ |0|
t := TerminalObject( sFinSets );
#! |1|
AsList( t );
#! [ 0 ]
Display( t );
#! { 0 }
IsInitial( t );
#! false
IsTerminal( t );
#! true
pi := UniversalMorphismIntoTerminalObject( m );
#! |8| → |1|
IsIdenticalObj( Range( pi ), t );
#! true
pi_t := UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( m, t );
#! |8| → |1|
Display( pi_t );
#! { 0,..., 7 } ⱶ[ 0, 0, 0, 0, 0, 0, 0, 0 ]→ { 0 }
pi = pi_t;
#! true
#! @EndExample
