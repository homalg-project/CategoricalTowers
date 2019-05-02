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

#!
DeclareAttribute( "FunctorPreimageOfProjectionBetweenZariskiCoframes",
        IsCapCategory );

#! @Section Operations

#!
DeclareOperation( "PreimageOfProjection",
        [ IsHomalgRing, IsObjectInZariskiCoframeOfAnAffineVariety ] );

#!
DeclareOperation( "PreimageOfProjection",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsObjectInZariskiCoframeOfAnAffineVariety ] );

#!
DeclareGlobalFunction( "DecreaseFiberDimensionWithoutAlteringImageClosureOfProjection" );
