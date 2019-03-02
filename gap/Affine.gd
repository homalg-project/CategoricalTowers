#
# ZariskiFrames: Zariski frames and coframes of affine varieties
#
# Declarations
#

#! @Chapter (Co)frames/Locales of Zariski closed/open subsets in affine varieties

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of objects in a Zariski frame or coframe of an affine variety.
#! @Arguments object
DeclareCategory( "IsObjectInZariskiFrameOrCoframeOfAnAffineVariety",
        IsObjectInZariskiFrameOrCoframe );

#! @Description
#!  The &GAP; category of morphisms in a Zariski frame or coframe of an affine variety.
#! @Arguments morphism
DeclareCategory( "IsMorphismInZariskiFrameOrCoframeOfAnAffineVariety",
        IsMorphismInZariskiFrameOrCoframe );
