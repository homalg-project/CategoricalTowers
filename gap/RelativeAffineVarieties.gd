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
        IsObjectInZariskiCoframe );

#! @Section Operations

#!
DeclareGlobalFunction( "DecreaseFiberDimensionWithoutAlteringClosureOfProjection" );
