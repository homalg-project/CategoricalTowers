#
# ZariskiFrames: Zariski frames and coframes of projective varieties
#
# Declarations
#

#! @Chapter (Co)frames/Locales of Zariski closed/open subsets in projective varieties

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of objects in a Zariski frame or coframe of a projective variety.
#! @Arguments object
DeclareCategory( "IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety",
        IsObjectInZariskiFrameOrCoframe );

#! @Description
#!  The &GAP; category of morphisms in a Zariski frame or coframe of a projective variety.
#! @Arguments morphism
DeclareCategory( "IsMorphismInZariskiFrameOrCoframeOfAProjectiveVariety",
        IsMorphismInZariskiFrameOrCoframe );

#!
DeclareAttribute( "ListOfSaturatedMorphismsOfRank1RangeOfUnderlyingCategory",
        IsObjectInZariskiFrameOrCoframe );
