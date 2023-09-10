#! @BeginChunk FreeElementaryToposOnOneObject

#! @Example
LoadPackage( "FunctorCategories" );
#! true
SkeletalFinBool := Opposite( SkeletalFinSets );
#! Opposite( SkeletalFinSets )
Poly := FiniteStrictCoproductCompletion( SkeletalFinBool );
#! FiniteStrictCoproductCompletion( Opposite( SkeletalFinSets ) )
Display( Poly );
#! A CAP category with name
#! FiniteStrictCoproductCompletion( Opposite( SkeletalFinSets ) ):
#! 
#! 30 primitive operations were used to derive 169 operations for this category
#! which algorithmically
#! * IsEquippedWithHomomorphismStructure
#! * IsFiniteCompleteCategory
#! * IsDistributiveCategory
#! and furthermore mathematically
#! * IsStrictCocartesianCategory
FreeTopos1 := CoequalizerCompletion( Poly );
#! CoequalizerCompletion( FiniteStrictCoproductCompletion(
#! Opposite( SkeletalFinSets ) ) )
Display( FreeTopos1 );
#! A CAP category with name
#! CoequalizerCompletion( FiniteStrictCoproductCompletion(
#! Opposite( SkeletalFinSets ) ) ):
#! 
#! 26 primitive operations were used to derive 101 operations for this category
#! which algorithmically
#! * IsBicartesianCategory
#! and not yet algorithmically
#! * IsFiniteCocompleteCategory
#! @EndExample
#! @EndChunk
