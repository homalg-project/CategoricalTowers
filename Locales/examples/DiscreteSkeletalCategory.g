#! @Chunk DiscreteSkeletalCategory

#! @Example
LoadPackage( "Locales" );
#! true
D := DiscreteSkeletalCategory( "IsPosInt" );
#! DiscreteSkeletalCategory( "IsPosInt" )
Display( D );
#! A CAP category with name DiscreteSkeletalCategory( "IsPosInt" ):
#! 
#! 8 primitive operations were used to derive 75 operations for this category
#! which algorithmically
#! * IsCategoryWithDecidableColifts
#! * IsCategoryWithDecidableLifts
#! * IsPosetCategory
#! * IsEquippedWithHomomorphismStructure
#! and furthermore mathematically
#! * IsDiscreteCategory
one := 1 / D;
#! <An object in DiscreteSkeletalCategory( "IsPosInt" )>
Display( one );
#! 1
#!
#! An object in DiscreteSkeletalCategory( "IsPosInt" ) given by the above data
IsWellDefined( one );
#! true
two := 2 / D;
#! <An object in DiscreteSkeletalCategory( "IsPosInt" )>
id_one := IdentityMorphism( one );
#! <An identity morphism in DiscreteSkeletalCategory( "IsPosInt" )>
MorphismDatum( id_one );
#! fail
IsOne( PreCompose( id_one, id_one ) );
#! true
IsOne( UniqueMorphism( one, one ) );
#! true
IsWellDefined( UniqueMorphism( one, two ) );
#! false
HomStructure( one, one );
#! <(⊤)>
HomStructure( one, two );
#! <(⊥)>
HomStructure( two, one );
#! <(⊥)>
#! @EndExample
