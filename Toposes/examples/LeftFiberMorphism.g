#! @Chunk LeftFiberMorphism

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
a := FinSet( 2 );
#! |2|
b := FinSet( 3 );
#! |3|
left := LeftFiberMorphism( a, b );
#! |128| → |8|
LoadPackage( "LazyCategories", false );
#! true
L := LazyCategory( SkeletalFinSets : primitive_operations := true );
#! LazyCategory( SkeletalFinSets )
lazy_left := LeftFiberMorphism( a / L, b / L );
#! <A morphism in LazyCategory( SkeletalFinSets )>
#! @EndExample
