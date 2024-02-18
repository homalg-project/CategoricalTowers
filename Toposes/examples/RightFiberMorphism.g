#! @Chunk RightFiberMorphism

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
a := FinSet( 3 );
#! |3|
b := FinSet( 2 );
#! |2|
right := RightFiberMorphism( a, b );
#! |128| → |8|
LoadPackage( "LazyCategories", false );
#! true
L := LazyCategory( SkeletalFinSets : primitive_operations := true );
#! LazyCategory( SkeletalFinSets )
lazy_right := RightFiberMorphism( a / L, b / L );
#! <A morphism in LazyCategory( SkeletalFinSets )>
#! @EndExample
