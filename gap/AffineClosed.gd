# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Declarations
#

#! @Chapter The coframe of Zariski closed subsets in an affine variety

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of Zariski coframes of an affine variety.
#! @Arguments object
DeclareCategory( "IsZariskiCoframeOfAnAffineVariety",
        IsZariskiCoframe );

#! @Description
#!  The &GAP; category of objects in a Zariski coframe of an affine variety.
#! @Arguments object
DeclareCategory( "IsObjectInZariskiCoframeOfAnAffineVariety",
        IsObjectInZariskiCoframe and
        IsObjectInZariskiFrameOrCoframeOfAnAffineVariety );

#! @Description
#!  The &GAP; category of morphisms in a Zariski coframe of an affine variety.
#! @Arguments morphism
DeclareCategory( "IsMorphismInZariskiCoframeOfAnAffineVariety",
        IsMorphismInZariskiCoframe and
        IsMorphismInZariskiFrameOrCoframeOfAnAffineVariety );

#! @Section Constructors

#! @Description
#!  Construct the Zariski coframe of closed sets in an affine variety defined as the
#!  vanishing loci of (radical) ideals of a &homalg; ring <A>R</A>.
#! @Arguments R
#! @Returns a &CAP; category
DeclareAttribute( "ZariskiCoframeOfAffineSpectrum",
        IsHomalgRing );

#! @Description
#!  Construct a Zariski closed subset (as an object in the Zariski coframe
#!  of closed subsets in an affine variety) from a matrix <A>mat</A>.
#!  The result is the support of the module-theoretic cokernel <M>M</M>
#!  of <A>mat</A> viewed as a morphism in the Freyd category of the associated category of rows,
#!  i.e., the result is the vanishing locus of the annihilator of <M>M</M>.
#! @Arguments mat
#! @Returns a &CAP; object
#! @Group ClosedSubsetOfSpec
DeclareOperation( "ClosedSubsetOfSpec",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group ClosedSubsetOfSpec
DeclareOperation( "ClosedSubsetOfSpec",
        [ IsString, IsHomalgRing ] );

#! @Arguments r
#! @Group ClosedSubsetOfSpec
DeclareOperation( "ClosedSubsetOfSpec",
        [ IsHomalgRingElement ] );
#! @InsertChunk ClosedSubsetOfSpecZ

#! @Arguments L
#! @Group ClosedSubsetOfSpec
DeclareOperation( "ClosedSubsetOfSpecByListOfColumns",
        [ IsList ] );

#! @Description
#!  <C>ClosedSubsetOfSpecByReducedColumn</C> assumes that the image is a radical ideal.
#! @Arguments I
#! @Group ClosedSubsetOfSpecByReducedColumn
DeclareOperation( "ClosedSubsetOfSpecByReducedColumn",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group ClosedSubsetOfSpecByReducedColumn
DeclareOperation( "ClosedSubsetOfSpecByReducedColumn",
        [ IsString, IsHomalgRing ] );

#! @Arguments r
#! @Group ClosedSubsetOfSpecByReducedColumn
DeclareOperation( "ClosedSubsetOfSpecByReducedColumn",
        [ IsHomalgRingElement ] );

#! @Arguments L
#! @Group ClosedSubsetOfSpec
DeclareOperation( "ClosedSubsetOfSpecByListOfReducedColumns",
        [ IsList ] );

#! @Description
#!  <C>ClosedSubsetOfSpecByStandardColumn</C> assumes that the image is a radical ideal given by some sort of a <Q>standard</Q> basis.
#! @Arguments I
#! @Group ClosedSubsetOfSpecByStandardColumn
DeclareOperation( "ClosedSubsetOfSpecByStandardColumn",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group ClosedSubsetOfSpecByStandardColumn
DeclareOperation( "ClosedSubsetOfSpecByStandardColumn",
        [ IsString, IsHomalgRing ] );

#! @Arguments r
#! @Group ClosedSubsetOfSpecByStandardColumn
DeclareOperation( "ClosedSubsetOfSpecByStandardColumn",
        [ IsHomalgRingElement ] );

#! @Description
#!  Compute the tangent space of <A>V</A> at the closed point <A>p</A>
#!  as an affine subspace of the ambient space of <A>V</A> intersecting <A>p</A>.
#! @Arguments V, p
#! @Returns an object in a Zariski coframe
DeclareOperation( "TangentSpaceAtPoint",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsHomalgMatrix ] );

#! @Arguments V, p
DeclareOperation( "TangentSpaceAtPoint",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsList ] );

DeclareOperation( "ComplementOfTangentSpaceAtPoint",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsHomalgMatrix ] );

DeclareOperation( "ComplementOfTangentSpaceAtPoint",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsList ] );
