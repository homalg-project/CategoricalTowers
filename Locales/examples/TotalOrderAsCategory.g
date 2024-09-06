#! @Chunk TotalOrderAsCategory

#! @Example
LoadPackage( "Locales" );
#! true
D := TotalOrderAsCategory( "IsInt", {a,b} -> a <= b );
#! TotalOrderAsCategory( "IsInt" )
Display( D );
#! A CAP category with name TotalOrderAsCategory( "IsInt" ):
#! 
#! 8 primitive operations were used to derive 77 operations for this category
#! which algorithmically
#! * IsCategoryWithDecidableColifts
#! * IsCategoryWithDecidableLifts
#! * IsPosetCategory
#! * IsEquippedWithHomomorphismStructure
#! and furthermore mathematically
#! * IsTotalOrderCategory
one := 1 / D;
#! <An object in TotalOrderAsCategory( "IsInt" )>
Display( one );
#! 1
#!
#! An object in TotalOrderAsCategory( "IsInt" ) given by the above data
IsWellDefined( one );
#! true
IsWellDefined( -1 / D );
#! true
two := 2 / D;
#! <An object in TotalOrderAsCategory( "IsInt" )>
id_one := IdentityMorphism( one );
#! <An identity morphism in TotalOrderAsCategory( "IsInt" )>
MorphismDatum( id_one );
#! fail
IsOne( PreCompose( id_one, id_one ) );
#! true
IsOne( UniqueMorphism( one, one ) );
#! true
IsWellDefined( UniqueMorphism( one, two ) );
#! true
HomStructure( one, one );
#! <(⊤)>
IsHomSetInhabited( one, one );
#! true
HomStructure( one, two );
#! <(⊤)>
IsHomSetInhabited( one, two );
#! true
HomStructure( two, one );
#! <(⊥)>
IsHomSetInhabited( two, one );
#! false
DirectProduct( [ one, two ] ) = one;
#! true
Coproduct( [ one, two ] ) = two;
#! true
#! @EndExample
