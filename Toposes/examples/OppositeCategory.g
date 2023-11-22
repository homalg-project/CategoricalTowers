#! @Chapter Examples and Tests

#! @Section Opposite category

#! @Example

LoadPackage( "Toposes", false );
#! true
LoadPackage( "FinSetsForCAP", ">= 2023.11-01", false );
#! true
op := Opposite( SkeletalFinSets );
#! Opposite( SkeletalFinSets )
Display( ListKnownCategoricalProperties( op ) );
#! [ "IsBicartesianCategory", "IsBicartesianCoclosedCategory",\
#!  "IsCartesianCategory", "IsCategoryWithDecidableColifts",\
#!  "IsCategoryWithDecidableLifts", "IsCocartesianCategory",\
#!  "IsCocartesianCoclosedCategory", "IsCodistributiveCategory",\
#!  "IsEquippedWithHomomorphismStructure", "IsFiniteCocompleteCategory",\
#!  "IsFiniteCompleteCategory", "IsSkeletalCategory" ]
#! @EndExample
