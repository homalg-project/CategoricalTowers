#! @Chunk MorphismBetweenDirectProducts

#! @Example
LoadPackage( "ToolsForCategoricalTowers" );
#! true
LoadPackage( "Toposes", ">= 2024.02-08", false );
#! true
LoadPackage( "FinSetsForCAP", ">= 2025.08-05", false );
#! true
sFinSets := SkeletalCategoryOfFiniteSets( );
#! SkeletalFinSets
Display( sFinSets );
#! A CAP category with name SkeletalFinSets:
#! 
#! 58 primitive operations were used to derive 368 operations for this category \
#! which algorithmically
#! * IsCategoryWithDecidableColifts
#! * IsCategoryWithDecidableLifts
#! * IsEquippedWithHomomorphismStructure
#! * IsSymmetricMonoidalCategory
#! * IsElementaryTopos
#! and furthermore mathematically
#! * IsSkeletalCategory
#! * IsStrictCartesianCategory
#! * IsStrictCocartesianCategory
#! * IsSymmetricMonoidalCategoryStructureGivenByDirectProduct
a := FinSet( sFinSets, 2 );
#! |2|
b := FinSet( sFinSets, 3 );
#! |3|
beta := CartesianBraiding( a, b );
#! |6| → |6|
Display( beta );
#! { 0,..., 5 } ⱶ[ 0, 3, 1, 4, 2, 5 ]→ { 0,..., 5 }
id_a := IdentityMorphism( a );
#! |2| → |2|
id_b := IdentityMorphism( b );
#! |3| → |3|
f := Pair( [ 1, 0 ], [ id_b, id_a ] );;
beta2 := MorphismBetweenDirectProducts( [ a, b ], f, [ b, a ] );
#! |6| → |6|
beta2 = beta;
#! true
W := WrapperCategory( sFinSets,
             rec( only_primitive_operations := false ) );
#! WrapperCategory( SkeletalFinSets )
Display( W );
#! A CAP category with name WrapperCategory( SkeletalFinSets ):
#! 
#! 344 primitive operations were used to derive 358 operations for this category \
#! which algorithmically
#! * IsCategoryWithDecidableColifts
#! * IsCategoryWithDecidableLifts
#! * IsEquippedWithHomomorphismStructure
#! * IsSymmetricMonoidalCategory
#! * IsElementaryTopos
#! and furthermore mathematically
#! * IsSkeletalCategory
#! * IsStrictCartesianCategory
#! * IsStrictCocartesianCategory
#! * IsSymmetricMonoidalCategoryStructureGivenByDirectProduct
W_a := a / W;
#! <An object in WrapperCategory( SkeletalFinSets )>
W_b := b / W;
#! <An object in WrapperCategory( SkeletalFinSets )>
W_beta := CartesianBraiding( W_a, W_b );
#! <A morphism in WrapperCategory( SkeletalFinSets )>
MorphismDatum( W_beta ) = beta;
#! true
W_id_a := IdentityMorphism( W_a );
#! <An identity morphism in WrapperCategory( SkeletalFinSets )>
W_id_b := IdentityMorphism( W_b );
#! <An identity morphism in WrapperCategory( SkeletalFinSets )>
W_f := Pair( [ 1, 0 ], [ W_id_b, W_id_a ] );;
W_beta2 := MorphismBetweenDirectProducts( [ W_a, W_b ], W_f, [ W_b, W_a ] );
#! <A morphism in WrapperCategory( SkeletalFinSets )>
W_beta2 = W_beta;
#! true
O := Opposite( sFinSets );
#! Opposite( SkeletalFinSets )
Display( O );
#! A CAP category with name Opposite( SkeletalFinSets ):
#! 
#! 277 primitive operations were used to derive 293 operations for this category \
#! which algorithmically
#! * IsCategoryWithDecidableColifts
#! * IsCategoryWithDecidableLifts
#! * IsEquippedWithHomomorphismStructure
#! * IsSymmetricMonoidalCategory
#! * IsBicartesianCoclosedCategory
#! * IsFiniteBicompleteCategory
#! and furthermore mathematically
#! * IsSkeletalCategory
#! * IsStrictCartesianCategory
#! * IsStrictCocartesianCategory
#! * IsSymmetricMonoidalCategoryStructureGivenByCoproduct
O_a := a / O;
#! <An object in Opposite( SkeletalFinSets )>
O_b := b / O;
#! <An object in Opposite( SkeletalFinSets )>
O_beta := CocartesianBraiding( O_b, O_a );
#! <A morphism in Opposite( SkeletalFinSets )>
MorphismDatum( O_beta ) = beta;
#! true
O_id_a := IdentityMorphism( O_a );
#! <An identity morphism in Opposite( SkeletalFinSets )>
O_id_b := IdentityMorphism( O_b );
#! <An identity morphism in Opposite( SkeletalFinSets )>
O_f := Pair( [ 1, 0 ], [ O_id_b, O_id_a ] );;
O_beta2 := MorphismBetweenCoproducts( [ O_b, O_a ], O_f, [ O_a, O_b ] );
#! <A morphism in Opposite( SkeletalFinSets )>
O_beta2 = O_beta;
#! true
#! @EndExample
