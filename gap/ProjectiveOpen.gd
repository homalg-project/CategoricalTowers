# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Declarations
#

#! @Chapter The frame of Zariski open subsets in a projective variety

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of Zariski frames of a projective variety.
#! @Arguments object
DeclareCategory( "IsZariskiFrameOfAProjectiveVariety",
        IsZariskiFrame );

#! @Description
#!  The &GAP; category of objects in a Zariski frame of a projective variety.
#! @Arguments object
DeclareCategory( "IsObjectInZariskiFrameOfAProjectiveVariety",
        IsObjectInZariskiFrame and
        IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety );

#! @Description
#!  The &GAP; category of morphisms in a Zariski frame of a projective variety.
#! @Arguments morphism
DeclareCategory( "IsMorphismInZariskiFrameOfAProjectiveVariety",
        IsMorphismInZariskiFrame and
        IsMorphismInZariskiFrameOrCoframeOfAProjectiveVariety );

#! @Section Constructors

#! @Description
#!  Construct the Zariski frame of open sets in a projective variety defined as the complements of
#!  vanishing loci of (radical) ideals of a &homalg; ring <A>R</A>.
#! @Arguments R
#! @Returns a &CAP; category
DeclareAttribute( "ZariskiFrameOfProj",
        IsHomalgRing );

#! @Description
#!  Construct a Zariski open subset (as an object in the Zariski frame
#!  of open subsets in a projective variety) from the homogeneous matrix <A>mat</A>.
#!  The result is the projective non-support of the module-theoretic cokernel <M>M</M>
#!  of the matrix <A>mat</A> viewed as a morphism in the Freyd category of the associated category of graded rows,
#!  i.e., the result is the complement of the projective vanishing locus
#!  of the (homogeneous) annihilator of <M>M</M>.
#! @Arguments I
#! @Returns a &CAP; object
#! @Group OpenSubsetOfProj
DeclareOperation( "OpenSubsetOfProj",
        [ IsCapCategoryMorphism ] );

#! @Arguments mat
#! @Group OpenSubsetOfProj
DeclareOperation( "OpenSubsetOfProj",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group OpenSubsetOfProj
DeclareOperation( "OpenSubsetOfProj",
        [ IsString, IsHomalgRing ] );
#! @InsertChunk OpenSubsetOfProj

#! @Description
#!  <C>OpenSubsetOfProjByReducedColumn</C> assumes that the image is a radical ideal.
#! @Arguments I
#! @Group OpenSubsetOfProjByReducedColumn
DeclareOperation( "OpenSubsetOfProjByReducedColumn",
        [ IsCapCategoryMorphism ] );

#! @Arguments mat
#! @Group OpenSubsetOfProjByReducedColumn
DeclareOperation( "OpenSubsetOfProjByReducedColumn",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group OpenSubsetOfProjByReducedColumn
DeclareOperation( "OpenSubsetOfProjByReducedColumn",
        [ IsString, IsHomalgRing ] );

#! @Arguments L
DeclareOperation( "OpenSubsetOfProjByListOfColumns",
        [ IsList ] );

#! @Description
#!  <C>OpenSubsetOfProjByStandardColumn</C> assumes that the image is a radical ideal given by some sort of a <Q>standard</Q> basis.
#! @Arguments I
#! @Group OpenSubsetOfProjByStandardColumn
DeclareOperation( "OpenSubsetOfProjByStandardColumn",
        [ IsCapCategoryMorphism ] );

#! @Arguments mat
#! @Group OpenSubsetOfProjByStandardColumn
DeclareOperation( "OpenSubsetOfProjByStandardColumn",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group OpenSubsetOfProjByStandardColumn
DeclareOperation( "OpenSubsetOfProjByStandardColumn",
        [ IsString, IsHomalgRing ] );
