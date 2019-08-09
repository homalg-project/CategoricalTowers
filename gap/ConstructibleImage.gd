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
#!  Compute the projection of <A>A</A>
#!  as a constructible subset of <C>BaseOfFibration</C>( <A>A</A> ).
#! @Arguments A
#! @Returns a constructible object as a union of formal multiple differences
DeclareOperation( "ConstructibleProjection",
        [ IsObjectInThinCategory ] );
#! @InsertChunk ConstructibleProjection
#! @InsertChunk CharSet
#! @InsertChunk ConstructibleProjectionOfDifferences

#! @Description
#!  Compute the image of the morphism defined by the morphism <A>phi</A> of affine rings
#!  as a constructible subset.
#! @Arguments phi
#! @Returns a constructible object as a union of formal multiple differences
DeclareOperation( "ConstructibleImage",
        [ IsHomalgRingMap ] );

DeclareOperation( "ConstructibleImage",
        [ IsHomalgRingMap, IsHomalgRing ] );

#! @Description
#!  Opens a PDF with the graph of datastructure underlying the constructible object <A>A</A>,
#!  provided it was created using <C>AsUnionOfMultipleDifferences</C>.
#! @Arguments A
#! @Returns nothing
#! @Group Visualize
DeclareOperation( "Visualize",
        [ IsConstructibleObject ] );

#! @Group Visualize
DeclareOperation( "VisualizeInJulia",
        [ IsConstructibleObject ] );
