#
# ZariskiFrames: The coframe of Zariski closed subsets in an affine variety
#
# Declarations
#

#! @Chapter The coframe of Zariski closed subsets in an affine variety

#! @Section GAP Categories

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
DeclareAttribute( "ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows",
        IsHomalgRing );

#! @Description
#!  Construct a Zariski closed subset (as an object in the Zariski coframe
#!  of closed subsets in an affine variety) from a morphism <A>I</A>=<C>AsCategoryOfRowsMorphism</C>( <A>mat</A> )
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

#! @Arguments str, R
#! @Group ClosedSubsetOfSpec
DeclareOperation( "ClosedSubsetOfSpec",
        [ IsString, IsHomalgRing ] );
#! @InsertSystem ClosedSubsetOfSpec

#! @Description
#!  <C>ClosedSubsetOfSpecByReducedMorphism</C> assumes that the image is a radical ideal.
#! @Arguments I
#! @Group ClosedSubsetOfSpecByReducedMorphism
DeclareOperation( "ClosedSubsetOfSpecByReducedMorphism",
        [ IsCapCategoryMorphism ] );

#! @Arguments mat
#! @Group ClosedSubsetOfSpecByReducedMorphism
DeclareOperation( "ClosedSubsetOfSpecByReducedMorphism",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group ClosedSubsetOfSpecByReducedMorphism
DeclareOperation( "ClosedSubsetOfSpecByReducedMorphism",
        [ IsString, IsHomalgRing ] );

#! @Description
#!  <C>ClosedSubsetOfSpecByStandardMorphism</C> assumes that the image is a radical ideal given by some sort of a <Q>standard</Q> basis.
#! @Arguments I
#! @Group ClosedSubsetOfSpecByStandardMorphism
DeclareOperation( "ClosedSubsetOfSpecByStandardMorphism",
        [ IsCapCategoryMorphism ] );

#! @Arguments mat
#! @Group ClosedSubsetOfSpecByStandardMorphism
DeclareOperation( "ClosedSubsetOfSpecByStandardMorphism",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group ClosedSubsetOfSpecByStandardMorphism
DeclareOperation( "ClosedSubsetOfSpecByStandardMorphism",
        [ IsString, IsHomalgRing ] );
