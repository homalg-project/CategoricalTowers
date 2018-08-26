#
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets
#
# Declarations
#

#! @Chapter The coframe of Zariski closed subsets of an affine scheme

#! @Section Constructors

#! @Description
#!  Construct the Zariski coframe of closed sets defined as the
#!  vanishing loci of (radical) ideals of a &homalg; ring <A>R</A>.
#! @Arguments R
#! @Returns a &CAP; category
DeclareAttribute( "ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows",
        IsHomalgRing );

#! @Description
#!  Construct a Zariski closed subset (as an object in the Zariski coframe
#!  of closed subsets) from a morphism <A>I</A>=<C>AsCategoryOfRowsMorphism</C>( <A>mat</A> )
#!  in the category of rows with <C>RankOfObject</C>( <C>Range</C>( <A>I</A> ) ) = 1.
#!  The morphism <A>I</A> stands for its module-theoretic image which is an ideal.
#! @Arguments I
#! @Returns a &CAP; object
#! @Group ClosedSubsetOfSpec
DeclareOperation( "ClosedSubsetOfSpec",
        [ IsCapCategoryMorphism ] );

#! @Arguments mat
#! @Group ClosedSubsetOfSpec
DeclareOperation( "ClosedSubsetOfSpec",
        [ IsHomalgMatrix ] );
#! @InsertSystem ClosedSubsetOfSpec

#! @Description
#!  <C>ClosedSubsetOfSpecByReducedMorphism</C> assumes that the image is a radical ideal.
#! @Arguments I
#! @Group ClosedSubsetOfSpec
DeclareOperation( "ClosedSubsetOfSpecByReducedMorphism",
        [ IsCapCategoryMorphism ] );

#! @Arguments mat
#! @Group ClosedSubsetOfSpec
DeclareOperation( "ClosedSubsetOfSpecByReducedMorphism",
        [ IsHomalgMatrix ] );

#! @Description
#!  <C>ClosedSubsetOfSpecByStandardMorphism</C> assumes that the image is a radical ideal given by some sort of a <Q>standard</Q> basis.
#! @Arguments I
#! @Group ClosedSubsetOfSpec
DeclareOperation( "ClosedSubsetOfSpecByStandardMorphism",
        [ IsCapCategoryMorphism ] );

#! @Arguments mat
#! @Group ClosedSubsetOfSpec
DeclareOperation( "ClosedSubsetOfSpecByStandardMorphism",
        [ IsHomalgMatrix ] );
