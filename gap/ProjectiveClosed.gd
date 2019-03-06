#
# ZariskiFrames: The coframe of Zariski closed subsets in a projective variety
#
# Declarations
#

#! @Chapter The coframe of Zariski closed subsets in a projective variety

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of objects in a Zariski coframe of a projective variety.
#! @Arguments object
DeclareCategory( "IsObjectInZariskiCoframeOfAProjectiveVariety",
        IsObjectInZariskiCoframe and
        IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety );

#! @Description
#!  The &GAP; category of morphisms in a Zariski coframe of a projective variety.
#! @Arguments morphism
DeclareCategory( "IsMorphismInZariskiCoframeOfAProjectiveVariety",
        IsMorphismInZariskiCoframe and
        IsMorphismInZariskiFrameOrCoframeOfAProjectiveVariety );

#! @Section Attributes

#!
DeclareAttribute( "UnderlyingClosedSubsetOfSpec",
        IsObjectInZariskiCoframeOfAProjectiveVariety );

#! @Section Constructors

#! @Description
#!  Construct the Zariski coframe of closed sets in a projective variety defined as the
#!  vanishing loci of (radical) ideals of a &homalg; ring <A>R</A>.
#! @Arguments R
#! @Returns a &CAP; category
DeclareAttribute( "ZariskiCoframeOfProjUsingCategoryOfRows",
        IsHomalgRing );

#! @Description
#!  Construct a Zariski closed subset (as an object in the Zariski coframe
#!  of closed subsets a projective variety) from a morphism <A>I</A>=<C>AsCategoryOfRowsMorphism</C>( <A>mat</A> )
#!  in the category of rows with <C>RankOfObject</C>( <C>Range</C>( <A>I</A> ) ) = 1.
#!  The morphism <A>I</A> stands for its module-theoretic image which is an ideal.
#! @Arguments I
#! @Returns a &CAP; object
#! @Group ClosedSubsetOfProj
DeclareOperation( "ClosedSubsetOfProj",
        [ IsCapCategoryMorphism ] );

#! @Arguments mat
#! @Group ClosedSubsetOfProj
DeclareOperation( "ClosedSubsetOfProj",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group ClosedSubsetOfProj
DeclareOperation( "ClosedSubsetOfProj",
        [ IsString, IsHomalgRing ] );
#! @InsertSystem ClosedSubsetOfProj

#! @Description
#!  <C>ClosedSubsetOfProjByReducedMorphism</C> assumes that the image is a radical ideal.
#! @Arguments I
#! @Group ClosedSubsetOfProjByReducedMorphism
DeclareOperation( "ClosedSubsetOfProjByReducedMorphism",
        [ IsCapCategoryMorphism ] );

#! @Arguments mat
#! @Group ClosedSubsetOfProjByReducedMorphism
DeclareOperation( "ClosedSubsetOfProjByReducedMorphism",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group ClosedSubsetOfProjByReducedMorphism
DeclareOperation( "ClosedSubsetOfProjByReducedMorphism",
        [ IsString, IsHomalgRing ] );

#! @Description
#!  <C>ClosedSubsetOfProjByStandardMorphism</C> assumes that the image is a radical ideal given by some sort of a <Q>standard</Q> basis.
#! @Arguments I
#! @Group ClosedSubsetOfProjByStandardMorphism
DeclareOperation( "ClosedSubsetOfProjByStandardMorphism",
        [ IsCapCategoryMorphism ] );

#! @Arguments mat
#! @Group ClosedSubsetOfProjByStandardMorphism
DeclareOperation( "ClosedSubsetOfProjByStandardMorphism",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group ClosedSubsetOfProjByStandardMorphism
DeclareOperation( "ClosedSubsetOfProjByStandardMorphism",
        [ IsString, IsHomalgRing ] );
