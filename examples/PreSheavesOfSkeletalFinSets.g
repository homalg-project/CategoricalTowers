#! @Chunk PreSheavesOfSkeletalFinSets

LoadPackage( "FunctorCategories" );

#! @Example
PSh := PreSheaves( SkeletalFinSets, SkeletalFinSets );
#! PreSheaves( SkeletalFinSets, SkeletalFinSets )
Display( PSh );
#! A CAP category with name PreSheaves( SkeletalFinSets, SkeletalFinSets ):
#! 
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
