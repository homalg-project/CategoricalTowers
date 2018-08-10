#
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets
#
# Declarations
#

#! @Chapter The (co)frame of Zariski closed/open subsets of an affine scheme

#! @Section Constructors

#! @Description
#!  Construct the spectrum of a &homalg; ring <A>R</A>
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
#! @Group ZariskiClosedSubsetOfAffineSpectrum
DeclareOperation( "ZariskiClosedSubsetOfAffineSpectrum",
        [ IsCapCategoryMorphism ] );

#! @Arguments mat
#! @Group ZariskiClosedSubsetOfAffineSpectrum
DeclareOperation( "ZariskiClosedSubsetOfAffineSpectrum",
        [ IsHomalgMatrix ] );
#! @InsertSystem ZariskiClosedSubsetOfAffineSpectrum

