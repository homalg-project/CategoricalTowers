#
# ZariskiFrames: Relative affine varieties
#
# Declarations
#

#! @Chapter Relative affine varieties

#! @Section Attributes

#!
DeclareAttribute( "FunctorClosureOfProjectionBetweenZariskiCoframes",
        IsCapCategory );
#!
DeclareAttribute( "ClosureOfProjection",
        IsObjectInZariskiCoframeOfAnAffineVariety );

#! @Section Operations

#!
DeclareGlobalFunction( "DecreaseFiberDimensionWithoutAlteringClosureOfProjection" );
