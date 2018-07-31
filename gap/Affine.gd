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
#! @Returns a &CAP; object
DeclareAttribute( "ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows",
        IsHomalgRing );
# @InsertSystem ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows

#! @Description
#!  Construct a Zariski closed subset
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

