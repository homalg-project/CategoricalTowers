#
# ZariskiFrames: Frames of Zariski open subsets
#
# Declarations
#

#! @Chapter Frames of Zariski open subsets

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of objects in a Zariski frame.
#! @Arguments object
DeclareCategory( "IsObjectInZariskiFrame",
        IsObjectInZariskiFrameOrCoframe );

#! @Description
#!  The &GAP; category of morphisms in a Zariski frame.
#! @Arguments morphism
DeclareCategory( "IsMorphismInZariskiFrame",
        IsMorphismInZariskiFrameOrCoframe );

#! @Section Attributes

#!
DeclareAttribute( "DimensionOfComplement",
        IsObjectInZariskiFrame );

#!
DeclareAttribute( "ComplementAsClosedSubset",
        IsObjectInZariskiFrame );

#!
DeclareAttribute( "AsDifferenceOfClosed",
        IsObjectInZariskiFrame );

# Tools
DeclareGlobalFunction( "IsHomSetInhabitedForFramesUsingCategoryOfRows" );

DeclareGlobalFunction( "IsEqualForObjectsIfIsHomSetInhabitedForFramesUsingCategoryOfRows" );
