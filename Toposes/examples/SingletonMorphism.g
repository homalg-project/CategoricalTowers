#! @Chunk SingletonMorphism

#! @Example
LoadPackage( "FinSetsForCAP" );
#! true
sFinSets := SkeletalCategoryOfFiniteSets( : no_precompiled_code := true );
#! SkeletalFinSets
a := 3 / sFinSets;
#! |3|
sa := SingletonMorphism( a );
#! |3| ↪ |8|
Display( sa );
#! { 0, 1, 2 } ⱶ[ 1, 2, 4 ]→ { 0,..., 7 }
sa = UpperSegmentOfRelation( a, a, CartesianDiagonal( a, 2 ) );
#! true
sa = LowerSegmentOfRelation( a, a, CartesianDiagonal( a, 2 ) );
#! true
#! @EndExample
