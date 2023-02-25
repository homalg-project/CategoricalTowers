#! @Chunk DiscreteCategory

#! @Example
LoadPackage( "DiscreteCategories" );
#! true
D := DiscreteCategory( "IsInt" );
#! DiscreteCategory( "IsInt" )
Display( D );
#! A CAP category with name DiscreteCategory( "IsInt" ):
#! 
#! 12 primitive operations were used to derive 74 operations for this category
#! which algorithmically
#! * IsPosetCategory
#! * IsEquippedWithHomomorphismStructure
#! and furthermore mathematically
#! * IsSkeletalCategory
one := 1 / D;
#! <An object in DiscreteCategory( "IsInt" )>
Display( one );
#! 1
IsWellDefined( one );
#! true
IsWellDefined( "1" / D );
#! false
two := 2 / D;
#! <An object in DiscreteCategory( "IsInt" )>
id_one := IdentityMorphism( one );
#! <An identity morphism in DiscreteCategory( "IsInt" )>
MorphismDatum( id_one );
#! fail
IsOne( PreCompose( id_one, id_one ) );
#! true
IsOne( MorphismInDiscreteCategory( one, one ) );
#! true
IsWellDefined( MorphismInDiscreteCategory( one, two ) );
#! false
HomStructure( one, one );
#! <(⊤)>
HomStructure( one, two );
#! <(⊥)>
#! @EndExample
