#! @Chunk RelativeTruthMorphisms

#! @Example
LoadPackage( "FinSetsForCAP" );
#! true
sFinSets := SkeletalFinSets;
#! SkeletalFinSets
t := TerminalObject( sFinSets );
#! |1|
TruthMorphismOfFalse( sFinSets ) = RelativeTruthMorphismOfFalse( t );
#! true
TruthMorphismOfTrue( sFinSets ) = RelativeTruthMorphismOfTrue( t );
#! true
TruthMorphismOfNot( sFinSets ) = RelativeTruthMorphismOfNot( t );
#! true
TruthMorphismOfAnd( sFinSets ) = RelativeTruthMorphismOfAnd( t );
#! true
TruthMorphismOfOr( sFinSets ) = RelativeTruthMorphismOfOr( t );
#! true
TruthMorphismOfImplies( sFinSets ) = RelativeTruthMorphismOfImplies( t );
#! true
a := FinSet( 2 );
#! |2|
fPa := RelativeTruthMorphismOfFalse( a );
#! |1| → |4|
Display( fPa );
#! { 0 } ⱶ[ 0 ]→ { 0,..., 3 }
tPa := RelativeTruthMorphismOfTrue( a );
#! |1| → |4|
Display( tPa );
#! { 0 } ⱶ[ 3 ]→ { 0,..., 3 }
nPa := RelativeTruthMorphismOfNot( a );
#! |4| → |4|
Display( nPa );
#! { 0,..., 3 } ⱶ[ 3, 2, 1, 0 ]→ { 0,..., 3 }
aPa := RelativeTruthMorphismOfAnd( a );
#! |16| → |4|
Display( aPa );
#! { 0,..., 15 } ⱶ[ 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 2, 2, 0, 1, 2, 3 ]→ { 0,..., 3 }
oPa := RelativeTruthMorphismOfOr( a );
#! |16| → |4|
Display( oPa );
#! { 0,..., 15 } ⱶ[ 0, 1, 2, 3, 1, 1, 3, 3, 2, 3, 2, 3, 3, 3, 3, 3 ]→ { 0,..., 3 }
iPa := RelativeTruthMorphismOfImplies( a );
#! |16| → |4|
Display( iPa );
#! { 0,..., 15 } ⱶ[ 3, 2, 1, 0, 3, 3, 1, 1, 3, 2, 3, 2, 3, 3, 3, 3 ]→ { 0,..., 3 }
#! @EndExample
