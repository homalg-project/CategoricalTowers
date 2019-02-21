#
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets
#
# Declarations
#

#! @Chapter Coframes of Zariski closed subsets

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of objects in a Zariski coframe.
#! @Arguments object
DeclareCategory( "IsObjectInZariskiCoframe",
        IsObjectInZariskiFrameOrCoframe );

#! @Description
#!  The &GAP; category of morphisms in a Zariski coframe.
#! @Arguments morphism
DeclareCategory( "IsMorphismInZariskiCoframe",
        IsMorphismInZariskiFrameOrCoframe );

#! @Section Attributes

#!
DeclareAttribute( "Dimension",
        IsObjectInZariskiCoframe );
