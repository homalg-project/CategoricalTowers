# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
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
DeclareAttribute( "UnderlyingListOfSaturatedColumns",
        IsObjectInZariskiFrameOrCoframe );

#!
DeclareAttribute( "SaturatedUnderlyingColumn",
        IsObjectInZariskiFrameOrCoframe );
