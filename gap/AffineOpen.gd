# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Declarations
#

#! @Chapter The frame of Zariski open subsets in an affine variety

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of Zariski frames of an affine variety.
#! @Arguments object
DeclareCategory( "IsZariskiFrameOfAnAffineVariety",
        IsZariskiFrame );

#! @Description
#!  The &GAP; category of objects in a Zariski frame of an affine variety.
#! @Arguments object
DeclareCategory( "IsObjectInZariskiFrameOfAnAffineVariety",
        IsObjectInZariskiFrame and
        IsObjectInZariskiFrameOrCoframeOfAnAffineVariety );

#! @Description
#!  The &GAP; category of morphisms in a Zariski frame of an affine variety.
#! @Arguments morphism
DeclareCategory( "IsMorphismInZariskiFrameOfAnAffineVariety",
        IsMorphismInZariskiFrame and
        IsMorphismInZariskiFrameOrCoframeOfAnAffineVariety );

#! @Section Constructors

#! @Description
#!  Construct the Zariski frame of open sets in an affine variety defined as the complements of
#!  vanishing loci of (radical) ideals of a &homalg; ring <A>R</A>.
#! @Arguments R
#! @Returns a &CAP; category
DeclareAttribute( "ZariskiFrameOfAffineSpectrum",
        IsHomalgRing );

#! @Description
#!  Construct a Zariski open subset (as an object in the Zariski frame
#!  of open subsets in an affine variety) from a matrix <A>mat</A>.
#!  The result is the non-support of the module-theoretic cokernel <M>M</M>
#!  of <A>mat</A> viewed as a morphism in the Freyd category of the associated category of rows,
#!  i.e., the result is the complement of the vanishing locus of the annihilator of <M>M</M>.
#! @Arguments mat
#! @Returns a &CAP; object
#! @Group OpenSubsetOfSpec
DeclareOperation( "OpenSubsetOfSpec",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group OpenSubsetOfSpec
DeclareOperation( "OpenSubsetOfSpec",
        [ IsString, IsHomalgRing ] );
#! @InsertChunk OpenSubsetOfSpecZ

#! @Arguments r
#! @Group OpenSubsetOfSpec
DeclareOperation( "OpenSubsetOfSpec",
        [ IsHomalgRingElement ] );
#! @InsertChunk OpenSubsetOfSpecZ

#! @Arguments L
#! @Group OpenSubsetOfSpec
DeclareOperation( "OpenSubsetOfSpecByListOfColumns",
        [ IsList ] );

#! @Description
#!  <C>OpenSubsetOfSpecByRadicalColumn</C> assumes that the image is a radical ideal.
#! @Arguments I
#! @Group OpenSubsetOfSpecByRadicalColumn
DeclareOperation( "OpenSubsetOfSpecByRadicalColumn",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group OpenSubsetOfSpecByRadicalColumn
DeclareOperation( "OpenSubsetOfSpecByRadicalColumn",
        [ IsString, IsHomalgRing ] );

#! @Arguments r
#! @Group OpenSubsetOfSpecByRadicalColumn
DeclareOperation( "OpenSubsetOfSpecByRadicalColumn",
        [ IsHomalgRingElement ] );

#! @Arguments L
#! @Group OpenSubsetOfSpecByRadicalColumn
DeclareOperation( "OpenSubsetOfSpecByListOfRadicalColumns",
        [ IsList ] );

#! @Description
#!  <C>OpenSubsetOfSpecByStandardColumn</C> assumes that the image is a radical ideal given by some sort of a <Q>standard</Q> basis.
#! @Arguments I
#! @Group OpenSubsetOfSpecByStandardColumn
DeclareOperation( "OpenSubsetOfSpecByStandardColumn",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group OpenSubsetOfSpecByStandardColumn
DeclareOperation( "OpenSubsetOfSpecByStandardColumn",
        [ IsString, IsHomalgRing ] );

#! @Arguments r
#! @Group OpenSubsetOfSpecByStandardColumn
DeclareOperation( "OpenSubsetOfSpecByStandardColumn",
        [ IsHomalgRingElement ] );
