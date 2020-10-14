# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Declarations
#

#! @Chapter The frame of Zariski open subsets in a projective variety

#! @Section GAP Categories

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
DeclareAttribute( "ZariskiFrameOfProjUsingCategoryOfRows",
        IsHomalgRing );

#! @Description
#!  Construct a Zariski open subset (as an object in the Zariski frame
#!  of open subsets in a projective variety) from a morphism
#!  <A>I</A>=<C>AsMorphismInCategoryOfRows</C>( <A>mat</A> ) in the category of (graded) rows.
#!  The result is the projective non-support of the module-theoretic cokernel <M>M</M>
#!  of the morphism <A>I</A> in the associated Freyd category,
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
#!  <C>OpenSubsetOfProjByReducedMorphism</C> assumes that the image is a radical ideal.
#! @Arguments I
#! @Group OpenSubsetOfProjByReducedMorphism
DeclareOperation( "OpenSubsetOfProjByReducedMorphism",
        [ IsCapCategoryMorphism ] );

#! @Arguments mat
#! @Group OpenSubsetOfProjByReducedMorphism
DeclareOperation( "OpenSubsetOfProjByReducedMorphism",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group OpenSubsetOfProjByReducedMorphism
DeclareOperation( "OpenSubsetOfProjByReducedMorphism",
        [ IsString, IsHomalgRing ] );

#! @Arguments L
DeclareOperation( "OpenSubsetOfProjByListOfMorphismsOfRank1Range",
        [ IsList ] );

#! @Description
#!  <C>OpenSubsetOfProjByStandardMorphism</C> assumes that the image is a radical ideal given by some sort of a <Q>standard</Q> basis.
#! @Arguments I
#! @Group OpenSubsetOfProjByStandardMorphism
DeclareOperation( "OpenSubsetOfProjByStandardMorphism",
        [ IsCapCategoryMorphism ] );

#! @Arguments mat
#! @Group OpenSubsetOfProjByStandardMorphism
DeclareOperation( "OpenSubsetOfProjByStandardMorphism",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group OpenSubsetOfProjByStandardMorphism
DeclareOperation( "OpenSubsetOfProjByStandardMorphism",
        [ IsString, IsHomalgRing ] );
