#! @Chunk DummyCategoryInDoctrines

#! @Example
LoadPackage( "ToolsForCategoricalTowers", false );
#! true
D1 := DummyCategoryInDoctrines( [ "IsAbCategory" ] );
#! DummyCategoryInDoctrines( [ "IsAbCategory" ] )
Display( D1 );
#! A CAP category with name DummyCategoryInDoctrines( [ "IsAbCategory" ] ):
#! 
#! 16 primitive operations were used to derive 29 operations for this category \
#! which algorithmically
#! * IsAbCategory
D2 := DummyCategoryInDoctrines( [ "IsAbCategory", "IsAbelianCategory" ] );
#! DummyCategoryInDoctrines( [ "IsAbelianCategory" ] )
Display( D2 );
#! A CAP category with name DummyCategoryInDoctrines( [ "IsAbelianCategory" ] ):
#! 
#! 33 primitive operations were used to derive 292 operations for this category \
#! which algorithmically
#! * IsAbelianCategory
D3 := DummyCategoryInDoctrines(
              [ "IsCategoryWithInitialObject",
                "IsCategoryWithTerminalObject",
                "IsCategoryWithZeroObject" ] );
#! DummyCategoryInDoctrines( [ "IsCategoryWithInitialObject", \
#! "IsCategoryWithTerminalObject", "IsCategoryWithZeroObject" ] )
Display( D3 );
#! A CAP category with name \
#! DummyCategoryInDoctrines( [ "IsCategoryWithInitialObject", \
#! "IsCategoryWithTerminalObject", "IsCategoryWithZeroObject" ] ):
#! 
#! 18 primitive operations were used to derive 41 operations for this category \
#! which algorithmically
#! * IsCategoryWithZeroObject
D4 := DummyCategoryInDoctrines(
              [ "IsCategoryWithInitialObject",
                "IsCategoryWithTerminalObject",
                "IsCategoryWithZeroObject" ] : minimal := true );
#! DummyCategoryInDoctrines( [ "IsCategoryWithZeroObject" ] )
Display( D4 );
#! A CAP category with name \
#! DummyCategoryInDoctrines( [ "IsCategoryWithZeroObject" ] ):
#! 
#! 14 primitive operations were used to derive 41 operations for this category \
#! which algorithmically
#! * IsCategoryWithZeroObject
#! @EndExample
