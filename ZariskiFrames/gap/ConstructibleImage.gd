# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
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
DeclareOperation( "ClosedSubsetWithGenericallyZeroDimensionalFibersOnComponentOfProjection",
        [ IsObjectInZariskiCoframe ] );

#! @Description
#!  A list consisting of two entries.
#!  The first entry is a locally closed approximation of the projection of <A>A</A>.
#!  The second entry is a list of closed subsets of <A>A</A> which upon projection yield
#!  the remaining parts of the constructible projection of <A>A</A>.
#! @Arguments A
#! @Returns a list
DeclareOperation( "LocallyClosedApproximationOfProjection",
        [ IsObjectInZariskiCoframe ] );

#! @Description
#!  A list consisting of two entries.
#!  The first entry is a locally closed approximation of the image of <A>phi</A>.
#!  The second entry is a list of closed subsets of the domain of <A>phi</A>
#!  the images of which yield the remaining parts of the constructible image of <A>phi</A>.
#! @Arguments phi
#! @Returns a list
DeclareOperation( "LocallyClosedApproximationOfImage",
        [ IsHomalgRingMap ] );

#! @Description
#!  A list consisting of two entries.
#!  The first entry is a locally closed approximation of the projection of <A>A</A> (using generic freeness).
#!  The second entry is a list of closed subsets of <A>A</A> which upon projection yield
#!  the remaining parts of the constructible projection of <A>A</A>.
#! @Arguments A
#! @Returns a list
DeclareOperation( "LocallyClosedApproximationOfProjectionViaGenericFreeness",
        [ IsObjectInZariskiCoframe ] );

#! @Description
#!  A list consisting of two entries.
#!  The first entry is a locally closed approximation of the image of <A>phi</A> (using generic freeness).
#!  The second entry is a list of closed subsets of the domain of <A>phi</A>
#!  the images of which yield the remaining parts of the constructible image of <A>phi</A>.
#! @Arguments phi
#! @Returns a list
DeclareOperation( "LocallyClosedApproximationOfImageViaGenericFreeness",
        [ IsHomalgRingMap ] );

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

DeclareAttribute( "CharacteristicSetAsList",
        IsObjectInThinCategory );

DeclareOperation( "DotVertexLabelledDigraph",
        [ IsConstructibleObject ] );

#! @Description
#!  Opens a PDF with the graph of datastructure underlying the constructible object <A>A</A>,
#!  provided it was created using <C>AsUnionOfMultipleDifferences</C>.
#! @Arguments A
#! @Returns nothing
DeclareOperation( "Visualize",
        [ IsConstructibleObject ] );
