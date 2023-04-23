#! @Chunk PowerObjectFunctorial

#! @Example
LoadPackage( "FinSetsForCAP" );
#! true
a := FinSet( 3 );
#! |3|
b := FinSet( 4 );
#! |4|
f := MapOfFinSets( a, [ 0, 1, 1 ], b );
#! |3| → |4|
Pf := PowerObjectFunctorial( f );
#! |16| → |8|
Display( Pf );
#! { 0,..., 15 } ⱶ[ 0, 1, 6, 7, 0, 1, 6, 7, 0, 1, 6, 7, 0, 1, 6, 7 ]→ { 0,..., 7 }
#! @EndExample
