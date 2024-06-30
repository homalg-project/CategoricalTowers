#! @Chunk DummyCategoryInDoctrines

#! @Example
LoadPackage( "ToolsForCategoricalTowers", false );
#! true
D1 := DummyCategoryInDoctrines( "IsAbCategory" );
#! DummyCategoryInDoctrines( [ "IsAbCategory" ] )
Display( D1 );
#! A CAP category with name DummyCategoryInDoctrines( [ "IsAbCategory" ] ):
#! 
#! 10 primitive operations were used to derive 21 operations for this category
#! which algorithmically
#! * IsAbCategory
D2 := DummyCategoryInDoctrines( [ "IsAbCategory", "IsAbelianCategory" ] );
#! DummyCategoryInDoctrines( [ "IsAbelianCategory" ] )
Display( D2 );
#! A CAP category with name DummyCategoryInDoctrines( [ "IsAbelianCategory" ] ):
#! 
#! 26 primitive operations were used to derive 284 operations for this category
#! which algorithmically
#! * IsAbelianCategory
#! @EndExample
