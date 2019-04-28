#
# ZariskiFrames: Constructible image
#
# Declarations
#

#! @Chapter Constructible image

#! @Section Info Class
DeclareInfoClass( "InfoConstructibleImage" );

#! @Section Operations

#! @Description
#!  
#! @Arguments A
#! @Returns a list
DeclareOperation( "DecreaseCodimensionByFixingVariables",
        [ IsObjectInZariskiCoframe ] );

#! @Description
#!  
#! @Arguments A
#! @Returns a list
DeclareOperation( "LocallyClosedProjection",
        [ IsObjectInZariskiCoframe ] );

#! @Description
#!  Compute the constructible projection of the fibered object <A>A</A>
#!  in a Zariski coframe of an affine variety created using
#!  one of the constructors <C>ClosedSubsetOfFiberedSpec*</C>.
#! @Arguments A
#! @Returns a constructible object as a union of formal multiple differences
DeclareOperation( "ConstructibleProjection",
        [ IsObjectInZariskiCoframe ] );
#! @InsertSystem ConstructibleProjection
#! @InsertSystem CharSet
