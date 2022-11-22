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
#! @EndExample
