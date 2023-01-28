# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Declarations
#

#! @Chapter Relative projective varieties

#! @Section Attributes

#!
DeclareAttribute( "PointsAtInfinityOfFiberwiseProjectiveClosure",
        IsObjectInZariskiCoframeOfAnAffineVariety );

#!
DeclareAttribute( "FunctorClosedProjectionBetweenZariskiCoframes",
        IsCapCategory );

#!
DeclareAttribute( "ImageOfProjection",
        IsObjectInZariskiCoframeOfAProjectiveVariety );

#!
DeclareAttribute( "ProjectionOfPointsAtInfinityOfFiberwiseProjectiveClosure",
        IsObjectInZariskiCoframeOfAnAffineVariety );
