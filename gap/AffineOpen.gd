#
# ZariskiFrames: The frame of Zariski open subsets in an affine variety
#
# Declarations
#

#! @Chapter The frame of Zariski open subsets in an affine variety

#! @Section GAP Categories

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
DeclareAttribute( "ZariskiFrameOfAffineSpectrumUsingCategoryOfRows",
        IsHomalgRing );

#! @Description
#!  Construct a Zariski open subset (as an object in the Zariski frame
#!  of open subsets in an affine variety) from a morphism
#!  <A>I</A>=<C>AsCategoryOfRowsMorphism</C>( <A>mat</A> ) in the category of rows.
#!  The result is the non-support of the module-theoretic cokernel <M>M</M>
#!  of the morphism <A>I</A> in the associated Freyd category,
#!  i.e., the result is the complement of the vanishing locus of the annihilator of <M>M</M>.
#! @Arguments I
#! @Returns a &CAP; object
#! @Group OpenSubsetOfSpec
DeclareOperation( "OpenSubsetOfSpec",
        [ IsCapCategoryMorphism ] );

#! @Arguments mat
#! @Group OpenSubsetOfSpec
DeclareOperation( "OpenSubsetOfSpec",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group OpenSubsetOfSpec
DeclareOperation( "OpenSubsetOfSpec",
        [ IsString, IsHomalgRing ] );
#! @InsertChunk OpenSubsetOfSpecZ

#! @Description
#!  <C>OpenSubsetOfSpecByReducedMorphism</C> assumes that the image is a radical ideal.
#! @Arguments I
#! @Group OpenSubsetOfSpecByReducedMorphism
DeclareOperation( "OpenSubsetOfSpecByReducedMorphism",
        [ IsCapCategoryMorphism ] );

#! @Arguments mat
#! @Group OpenSubsetOfSpecByReducedMorphism
DeclareOperation( "OpenSubsetOfSpecByReducedMorphism",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group OpenSubsetOfSpecByReducedMorphism
DeclareOperation( "OpenSubsetOfSpecByReducedMorphism",
        [ IsString, IsHomalgRing ] );

#! @Arguments L
DeclareOperation( "OpenSubsetOfSpecByListOfMorphismsOfRank1Range",
        [ IsList ] );

#! @Description
#!  <C>OpenSubsetOfSpecByStandardMorphism</C> assumes that the image is a radical ideal given by some sort of a <Q>standard</Q> basis.
#! @Arguments I
#! @Group OpenSubsetOfSpecByStandardMorphism
DeclareOperation( "OpenSubsetOfSpecByStandardMorphism",
        [ IsCapCategoryMorphism ] );

#! @Arguments mat
#! @Group OpenSubsetOfSpecByStandardMorphism
DeclareOperation( "OpenSubsetOfSpecByStandardMorphism",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group OpenSubsetOfSpecByStandardMorphism
DeclareOperation( "OpenSubsetOfSpecByStandardMorphism",
        [ IsString, IsHomalgRing ] );
