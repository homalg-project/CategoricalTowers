#! @Chunk PreSheavesOfSkeletalFinSets

#! @Example
LoadPackage( "PreSheaves" );
#! true
LoadPackage( "Toposes", ">= 2025.08-02", fail );
#! true
LoadPackage( "FinSetsForCAP", fail );
#! true
PSh := PreSheaves( SkeletalFinSets, SkeletalFinSets );
#! PreSheaves( SkeletalFinSets, SkeletalFinSets )
Display( PSh );
#! A CAP category with name PreSheaves( SkeletalFinSets, SkeletalFinSets ):
#! 
#! 28 primitive operations were used to derive 192 operations for this category
#! which not yet algorithmically
#! * IsSymmetricMonoidalCategory
#! * IsElementaryTopos
#! and furthermore mathematically
#! * IsSymmetricMonoidalCategoryStructureGivenByDirectProduct
MissingOperationsForConstructivenessOfCategory( PSh, "IsElementaryTopos" );
#! [ "IsEqualForObjects", "IsEqualForMorphisms", "IsCongruentForMorphisms",
#!   "ExponentialOnObjects", "ExponentialOnMorphisms",
#!   "CartesianRightEvaluationMorphism", "CartesianRightCoevaluationMorphism",
#!   "CartesianLeftEvaluationMorphism", "CartesianLeftCoevaluationMorphism",
#!   "SubobjectClassifier", "ClassifyingMorphismOfSubobject",
#!   "SubobjectOfClassifyingMorphism" ]
Y := YonedaEmbeddingOfSourceCategory( PSh );
#! Yoneda embedding functor
omega := SubobjectClassifier( SourceOfFunctor( Y ) );
#! |2|
M := FinSet( 3 );
#! |3|
Y( omega )( M );
#! |8|
phi := MapOfFinSets( omega, [ 2, 0 ], M );
#! |2| → |3|
omega_phi := Y( omega )( phi );
#! |8| → |4|
Display( omega_phi );
#! { 0,..., 7 } ⱶ[ 0, 2, 0, 2, 1, 3, 1, 3 ]→ { 0,..., 3 }
phi_omega := Y( phi )( omega );
#! |4| → |9|
Display( phi_omega );
#! { 0,..., 3 } ⱶ[ 8, 6, 2, 0 ]→ { 0,..., 8 }
six1 := Y( FinSet( 6 ) );
#! <A projective object in PreSheaves( SkeletalFinSets, SkeletalFinSets )>
six2 := DirectProduct( Y( FinSet( 2 ) ), Y( FinSet( 3 ) ) );
#! <An object in PreSheaves( SkeletalFinSets, SkeletalFinSets )>
List( [ 0 .. 7 ], i -> six1( FinSet( i ) ) );
#! [ |1|, |6|, |36|, |216|, |1296|, |7776|, |46656|, |279936| ]
List( [ 0 .. 7 ], i -> six2( FinSet( i ) ) );
#! [ |1|, |6|, |36|, |216|, |1296|, |7776|, |46656|, |279936| ]
six1_on_mor := six1( UniversalMorphismIntoTerminalObject( FinSet( 3 ) ) );
#! |6| → |216|
Display( six1_on_mor );
#! { 0,..., 5 } ⱶ[ 0, 43, 86, 129, 172, 215 ]→ { 0,..., 215 }
six2_on_mor := six2( UniversalMorphismIntoTerminalObject( FinSet( 3 ) ) );
#! |6| → |216|
Display( six2_on_mor );
#! { 0,..., 5 } ⱶ[ 0, 7, 104, 111, 208, 215 ]→ { 0,..., 215 }
#! @EndExample
