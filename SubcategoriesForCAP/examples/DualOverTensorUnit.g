#! @Chunk SliceCategoryOverTensorUnit

#! We type-check DualOverTensorUnit via LazyCategories.

#! @Example
LoadPackage( "LazyCategories", false );;
T := TerminalCategoryWithMultipleObjects();
#! TerminalCategoryWithMultipleObjects( )
L := LazyCategory( T : primitive_operations := true, optimize := 0 );
#! LazyCategory( TerminalCategoryWithMultipleObjects( ) )
a := "a" / T;
#! <A zero object in TerminalCategoryWithMultipleObjects( )>
I := MorphismConstructor( T, a, "I", TensorUnit( T ) ) / L;
#! <An evaluated morphism in LazyCategory( TerminalCategoryWithMultipleObjects( ) )>
DualOverTensorUnit( L, I );
#! <A morphism in LazyCategory( TerminalCategoryWithMultipleObjects( ) )>
#! @EndExample
