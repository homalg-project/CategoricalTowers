#! @Chapter Examples and Tests

#! @Section Opposite category

#! @Example

LoadPackage( "Toposes", false );
#! true
LoadPackage( "FinSetsForCAP", ">= 2021.12-09", false );
#! true
op := Opposite( SkeletalFinSets );
#! Opposite( SkeletalFinSets )
Display( ListKnownCategoricalProperties( op ) );
#! [ "IsBicartesianCategory", "IsBicartesianCoclosedCategory",\
#!  "IsCartesianCategory", "IsCocartesianCategory",\
#!  "IsCocartesianCoclosedCategory", "IsCodistributiveCategory",\
#!  "IsEquippedWithHomomorphismStructure", "IsFiniteCocompleteCategory",\
#!  "IsFiniteCompleteCategory", "IsSkeletalCategory" ]
#! @EndExample
