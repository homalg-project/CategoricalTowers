#! @Chunk PreSheavesOfSkeletalFinSets

#! @Example
LoadPackage( "PreSheaves" );
#! true
LoadPackage( "FinSetsForCAP" );
#! true
PSh := PreSheaves( SkeletalFinSets, SkeletalFinSets );
#! PreSheaves( SkeletalFinSets, SkeletalFinSets )
InfoOfInstalledOperationsOfCategory( PSh );
#! 45 primitive operations were used to derive 152 operations for this category
#! which algorithmically
#! * IsFiniteCocompleteCategory
#! * IsFiniteCompleteCategory
#! * IsDistributiveCategory
CheckConstructivenessOfCategory( PSh, "IsElementaryTopos" );
#! [ "CartesianCoevaluationMorphismWithGivenRange",
#!   "CartesianEvaluationMorphismWithGivenSource",
#!   "ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier",
#!   "ExponentialOnMorphismsWithGivenExponentials", "ExponentialOnObjects",
#!   "SubobjectClassifier", "SubobjectOfClassifyingMorphism" ]
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
#! @EndExample
