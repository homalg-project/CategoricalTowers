#
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets
#
# Declarations
#

#! @Chapter The frame of Zariski open subsets of an affine scheme

#! @Section Constructors

#! @Description
#!  Construct the Zariski frame of open sets defined as the complements of
#!  vanishing loci of (radical) ideals of a &homalg; ring <A>R</A>.
#! @Arguments R
#! @Returns a &CAP; category
DeclareAttribute( "ZariskiFrameOfAffineSpectrumUsingCategoryOfRows",
        IsHomalgRing );

#! @Description
#!  Construct a Zariski open subset (as an object in the Zariski frame
#!  of open subsets) from a morphism <A>I</A>=<C>AsCategoryOfRowsMorphism</C>( <A>mat</A> )
#!  in the category of rows with <C>RankOfObject</C>( <C>Range</C>( <A>I</A> ) ) = 1.
#!  The morphism <A>I</A> stands for its module-theoretic image which is an ideal.
#! @Arguments I
#! @Returns a &CAP; object
#! @Group OpenSubsetOfSpec
DeclareOperation( "OpenSubsetOfSpec",
        [ IsCapCategoryMorphism ] );

#! @Arguments mat
#! @Group OpenSubsetOfSpec
DeclareOperation( "OpenSubsetOfSpec",
        [ IsHomalgMatrix ] );
#! @InsertSystem OpenSubsetOfSpec

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
