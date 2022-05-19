# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Declarations
#

#! @Chapter Frames of Zariski open subsets

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of Zariski frames.
#! @Arguments object
DeclareCategory( "IsZariskiFrame",
        IsCapCategory and IsThinCategory );

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

#! @Description
#!  The dimension of the closed complement of <A>A</A>.
#! @Arguments A
#! @Returns an integer
DeclareAttribute( "DimensionOfComplement",
        IsObjectInZariskiFrame );


#! @Description
#!  The degree of the closed complement of <A>A</A>.
#! @Arguments A
#! @Returns an integer
DeclareAttribute( "DegreeOfComplement",
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
