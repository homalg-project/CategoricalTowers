#! @Chapter Examples

#! @Section Full subcategory of free abelian groups

#! @Example
LoadPackage( "FreydCategoriesForCAP" );
#! true
LoadPackage( "SubcategoriesForCAP" );
#! true
zz := HomalgRingOfIntegers( );;
rows := CategoryOfRows( zz );
#! Rows( Z )
A := FreydCategory( rows );
#! Freyd( Rows( Z ) )
Proj_A := FullSubcategoryOfProjectiveObjects( A );
#! FullSubcategoryOfProjectiveObjects( Freyd( Rows( Z ) ) )
M1 := HomalgMatrix( [ [ 1, 0 ], [ 0, 0 ] ], 2, 2, zz ) / rows / A / Proj_A;;
M2 := HomalgMatrix( [ [ 2, 0 ], [ 0, 0 ] ], 2, 2, zz ) / rows / A / Proj_A;;
IsWellDefinedForObjects( M1 );
#! true
IsWellDefinedForObjects( M2 );
#! false
#! @EndExample
