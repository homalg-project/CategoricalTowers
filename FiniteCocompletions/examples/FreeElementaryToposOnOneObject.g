#! @BeginChunk FreeElementaryToposOnOneObject

#! @Example
LoadPackage( "FunctorCategories" );
#! true
SkeletalFinBool := Opposite( SkeletalFinSets );
#! Opposite( SkeletalFinSets )
FreeTopos1 := FiniteColimitCompletionWithStrictCoproducts( SkeletalFinBool );
#! FiniteColimitCompletionWithStrictCoproducts( Opposite( SkeletalFinSets ) )
Display( FreeTopos1 );
#! A CAP category with name
#! FiniteColimitCompletionWithStrictCoproducts( Opposite( SkeletalFinSets ) ):
#! 
#! 26 primitive operations were used to derive 101 operations for this category
#! which algorithmically
#! * IsBicartesianCategory
#! and not yet algorithmically
#! * IsFiniteCocompleteCategory
CheckConstructivenessOfCategory( FreeTopos1, "IsFiniteCocompleteCategory" );
#! [ "UniversalMorphismFromCoequalizerWithGivenCoequalizer" ]
Poly := FiniteCoproductCompletionOfUnderlyingCategory( FreeTopos1 );
#! FiniteStrictCoproductCompletion( Opposite( SkeletalFinSets ) )
Display( Poly );
#! A CAP category with name
#! FiniteStrictCoproductCompletion( Opposite( SkeletalFinSets ) ):
#! 
#! 33 primitive operations were used to derive 172 operations for this category
#! which algorithmically
#! * IsCategoryWithDecidableLifts
#! * IsEquippedWithHomomorphismStructure
#! * IsFiniteCompleteCategory
#! * IsDistributiveCategory
#! and furthermore mathematically
#! * IsStrictCocartesianCategory
#! @EndExample
#! @EndChunk
