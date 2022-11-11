#! @Chunk LawvereTierney

#! Compute the Lawvere-Tierney topologies of `SkeletalFinSets`:

#! @Example
LoadPackage( "FinSetsForCAP" );
#! true
LTI := LawvereTierneyLocalModalityOperators( SkeletalFinSets );
#! [ |2| → |2|, |2| → |2| ]
Perform( LTI, Display );
#! { 0, 1 } ⱶ[ 0, 1 ]→ { 0, 1 }
#! { 0, 1 } ⱶ[ 1, 1 ]→ { 0, 1 }
LTS := LawvereTierneySubobjects( SkeletalFinSets );
#! [ |1| ↪ |2|, |2| ↪ |2| ]
Perform( LTS, Display );
#! { 0 } ⱶ[ 1 ]→ { 0, 1 }
#! { 0, 1 } ⱶ[ 0, 1 ]→ { 0, 1 }
LTC := LawvereTierneyEmbeddingsOfSubobjectClassifiers( SkeletalFinSets );
#! [ |2| → |2|, |1| → |2| ]
Perform( LTC, Display );
#! { 0, 1 } ⱶ[ 0, 1 ]→ { 0, 1 }
#! { 0 } ⱶ[ 1 ]→ { 0, 1 }
#! @EndExample
