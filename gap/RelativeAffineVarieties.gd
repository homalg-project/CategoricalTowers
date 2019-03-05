#
# ZariskiFrames: Relative affine varieties
#
# Declarations
#

#! @Chapter Relative affine varieties

#! @Section Attributes

#!
DeclareAttribute( "FunctorImageClosureOfProjectionBetweenZariskiCoframes",
        IsCapCategory );
#!
DeclareAttribute( "ImageClosureOfProjection",
        IsObjectInZariskiCoframeOfAnAffineVariety );

#! @Section Operations

#!
DeclareGlobalFunction( "DecreaseFiberDimensionWithoutAlteringImageClosureOfProjection" );
