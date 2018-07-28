#
# ZariskiFrames: Frames/Locales of Zariski open subsets
#
# Declarations
#

#! @Chapter The category of finite sets

#! @Section GAP Categories

#! @Description
#! The GAP category of objects in a Zariski frame
#! @Arguments object
DeclareCategory( "IsObjectInZariskiFrame",
                 IsCapCategoryObject );

#! @Description
#! The GAP category of morphisms in a Zariski frame
#! @Arguments object
DeclareCategory( "IsMorphismInZariskiFramee",
                 IsCapCategoryMorphism );

#! @Section Attributes

#! @Description
#!  
#! @Arguments O
#! @Returns 
DeclareAttribute( "ObjectOfUnderlyingCategory",
        IsObjectInZariskiFrame );

#! @Section Constructors

#! @Description
#!  Construct a Zariski open subset
#! @Arguments L
#! @Returns a &CAP; object
DeclareOperation( "ZariskiOpenSubset",
        [ IsList ] );
# @InsertSystem ZariskiOpenSubset

#! @Section Tools

