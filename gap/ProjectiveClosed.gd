# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Declarations
#

#! @Chapter The coframe of Zariski closed subsets in a projective variety

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of Zariski coframes of a projective variety.
#! @Arguments object
DeclareCategory( "IsZariskiCoframeOfAProjectiveVariety",
        IsZariskiCoframe );

#! @Description
#!  The &GAP; category of objects in a Zariski coframe of a projective variety.
#! @Arguments object
DeclareCategory( "IsObjectInZariskiCoframeOfAProjectiveVariety",
        IsObjectInZariskiCoframe and
        IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety );

#! @Description
#!  The &GAP; category of morphisms in a Zariski coframe of a projective variety.
#! @Arguments morphism
DeclareCategory( "IsMorphismInZariskiCoframeOfAProjectiveVariety",
        IsMorphismInZariskiCoframe and
        IsMorphismInZariskiFrameOrCoframeOfAProjectiveVariety );

#! @Section Attributes

#!
DeclareAttribute( "UnderlyingClosedSubsetOfSpec",
        IsObjectInZariskiCoframeOfAProjectiveVariety );

#! @Section Constructors

#! @Description
#!  Construct the Zariski coframe of closed sets in a projective variety defined as the
#!  vanishing loci of (radical) ideals of a &homalg; ring <A>R</A>.
#! @Arguments R
#! @Returns a &CAP; category
DeclareAttribute( "ZariskiCoframeOfProj",
        IsHomalgRing );

#! @Description
#!  Construct a Zariski closed subset (as an object in the Zariski coframe
#!  of closed subsets a projective variety) from the homogeneous matrix <A>mat</A>.
#!  The result is the projective support of the module-theoretic cokernel <M>M</M>
#!  of the matrix <A>mat</A> viewed as a morphism in the Freyd category of the associated category of graded rows,
#!  i.e., the result is the projective vanishing locus of the (homogeneous) annihilator of <M>M</M>.
#! @Arguments mat
#! @Returns a &CAP; object
#! @Group ClosedSubsetOfProj
DeclareOperation( "ClosedSubsetOfProj",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group ClosedSubsetOfProj
DeclareOperation( "ClosedSubsetOfProj",
        [ IsString, IsHomalgRing ] );
#! @InsertChunk ClosedSubsetOfProj

#! @Arguments L
#! @Group ClosedSubsetOfProj
DeclareOperation( "ClosedSubsetOfProjByListOfColumns",
        [ IsList ] );

#! @Description
#!  <C>ClosedSubsetOfProjByReducedColumn</C> assumes that the image is a radical ideal.
#! @Arguments I
#! @Group ClosedSubsetOfProjByReducedColumn
DeclareOperation( "ClosedSubsetOfProjByReducedColumn",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group ClosedSubsetOfProjByReducedColumn
DeclareOperation( "ClosedSubsetOfProjByReducedColumn",
        [ IsString, IsHomalgRing ] );

#! @Description
#!  <C>ClosedSubsetOfProjByStandardColumn</C> assumes that the image is a radical ideal given by some sort of a <Q>standard</Q> basis.
#! @Arguments I
#! @Group ClosedSubsetOfProjByStandardColumn
DeclareOperation( "ClosedSubsetOfProjByStandardColumn",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group ClosedSubsetOfProjByStandardColumn
DeclareOperation( "ClosedSubsetOfProjByStandardColumn",
        [ IsString, IsHomalgRing ] );
