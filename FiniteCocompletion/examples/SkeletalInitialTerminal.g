#! @Chunk SkeletalInitialTerminal

#! @Example
LoadPackage( "FiniteCocompletion" );
#! true
sFinSets := SkeletalFinSetsAsFiniteCoproductCocompletionOfTerminalCategory( );
#! SkeletalFinSetsAsFiniteCoproductCocompletionOfTerminalCategory
m := ObjectConstructor( sFinSets, 8 );
#! |8|
IsInitial( m );
#! false
IsTerminal( m );
#! false
i := InitialObject( sFinSets );
#! |0|
Display( i );
#! ∅
IsInitial( i );
#! true
IsTerminal( i );
#! false
iota := UniversalMorphismFromInitialObject( m );
#! |0| → |8|
AsList( i );
#! [  ]
t := TerminalObject( sFinSets );
#! |1|
AsList( t );
#! [ 0 ]
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
AsList( pi_t );
#! [ 0, 0, 0, 0, 0, 0, 0, 0 ]
pi = pi_t;
#! true
#! @EndExample
