#! @Chunk SingletonMorphism

#! @Example
LoadPackage( "FinSetsForCAP" );
#! true
a := FinSet( 3 );
#! |3|
sa := SingletonMorphism( a );
#! |3| ↪ |8|
Display( sa );
#! { 0, 1, 2 } ⱶ[ 1, 2, 4 ]→ { 0,..., 7 }
sa = LowerSegmentOfRelation( a, a, CartesianDiagonal( a, 2 ) );
#! true
#! @EndExample
