#! @Chunk MorphismBetweenCoproducts

#! @Example
LoadPackage( "CategoryConstructor" );
#! true
LoadPackage( "FinSetsForCAP", ">= 2023.07-03", fail );
#! true
sFinSets := SkeletalCategoryOfFiniteSets( );
#! SkeletalFinSets
Display( sFinSets );
#! A CAP category with name SkeletalFinSets:
#! 
#! 59 primitive operations were used to derive 317 operations for this category
#! which algorithmically
#! * IsEquippedWithHomomorphismStructure
#! * IsElementaryTopos
#! and furthermore mathematically
#! * IsSkeletalCategory
a := FinSet( sFinSets, 2 );
#! |2|
b := FinSet( sFinSets, 3 );
#! |3|
beta := CocartesianBraiding( a, b );
#! |5| → |5|
Display( beta );
#! { 0,..., 4 } ⱶ[ 3, 4, 0, 1, 2 ]→ { 0,..., 4 }
id_a := IdentityMorphism( a );
#! |2| → |2|
id_b := IdentityMorphism( b );
#! |3| → |3|
f := Pair( [ 1, 0 ], [ id_a, id_b ] );
#! [ [ 1, 0 ], [ |2| → |2|, |3| → |3| ] ]
beta2 := MorphismBetweenCoproducts( [ a, b ], f, [ b, a ] );
#! |5| → |5|
beta2 = beta;
#! true
W := WrapperCategory( sFinSets,
             rec( only_primitive_operations := false ) );
#! WrapperCategory( SkeletalFinSets )
Display( W );
#! A CAP category with name WrapperCategory( SkeletalFinSets ):
#! 
#! 300 primitive operations were used to derive 310 operations for this category
#! which algorithmically
#! * IsEquippedWithHomomorphismStructure
#! * IsElementaryTopos
#! and furthermore mathematically
#! * IsSkeletalCategory
W_a := a / W;
#! <An object in WrapperCategory( SkeletalFinSets )>
W_b := b / W;
#! <An object in WrapperCategory( SkeletalFinSets )>
W_beta := CocartesianBraiding( W_a, W_b );
#! <A morphism in WrapperCategory( SkeletalFinSets )>
MorphismDatum( W_beta ) = beta;
#! true
W_id_a := IdentityMorphism( W_a );
#! <An identity morphism in WrapperCategory( SkeletalFinSets )>
W_id_b := IdentityMorphism( W_b );
#! <An identity morphism in WrapperCategory( SkeletalFinSets )>
W_f := Pair( [ 1, 0 ], [ W_id_a, W_id_b ] );;
W_beta2 := MorphismBetweenCoproducts( [ W_a, W_b ], W_f, [ W_b, W_a ] );
#! <A morphism in WrapperCategory( SkeletalFinSets )>
W_beta2 = W_beta;
#! true
O := Opposite( sFinSets );
#! Opposite( SkeletalFinSets )
Display( O );
#! A CAP category with name Opposite( SkeletalFinSets ):
#! 
#! 244 primitive operations were used to derive 262 operations for this category
#! which algorithmically
#! * IsEquippedWithHomomorphismStructure
#! * IsFiniteCocompleteCategory
#! * IsFiniteCompleteCategory
#! * IsBicartesianCoclosedCategory
#! and furthermore mathematically
#! * IsSkeletalCategory
O_a := a / O;
#! <An object in Opposite( SkeletalFinSets )>
O_b := b / O;
#! <An object in Opposite( SkeletalFinSets )>
O_beta := CartesianBraiding( O_b, O_a );
#! <A morphism in Opposite( SkeletalFinSets )>
MorphismDatum( O_beta ) = beta;
#! true
O_id_a := IdentityMorphism( O_a );
#! <An identity morphism in Opposite( SkeletalFinSets )>
O_id_b := IdentityMorphism( O_b );
#! <An identity morphism in Opposite( SkeletalFinSets )>
O_f := Pair( [ 1, 0 ], [ O_id_a, O_id_b ] );;
O_beta2 := MorphismBetweenDirectProducts( [ O_b, O_a ], O_f, [ O_a, O_b ] );
#! <A morphism in Opposite( SkeletalFinSets )>
O_beta2 = O_beta;
#! true
#! @EndExample
