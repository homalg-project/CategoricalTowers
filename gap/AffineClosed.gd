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
#!  of closed subsets in an affine variety) from a morphism
#!  <A>I</A>=<C>AsMorphismInCategoryOfRows</C>( <A>mat</A> ) in the category of rows.
#!  The result is the support of the module-theoretic cokernel <M>M</M>
#!  of the morphism <A>I</A> in the associated Freyd category,
#!  i.e., the result is the vanishing locus of the annihilator of <M>M</M>.
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

#! @Arguments r
#! @Group ClosedSubsetOfSpec
DeclareOperation( "ClosedSubsetOfSpec",
        [ IsHomalgRingElement ] );
#! @InsertChunk ClosedSubsetOfSpecZ

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

#! @Arguments r
#! @Group ClosedSubsetOfSpecByReducedMorphism
DeclareOperation( "ClosedSubsetOfSpecByReducedMorphism",
        [ IsHomalgRingElement ] );

#! @Arguments L
DeclareOperation( "ClosedSubsetOfSpecByListOfMorphismsOfRank1Range",
        [ IsList ] );

#! @Arguments L
DeclareOperation( "ClosedSubsetOfSpecByListOfReducedMorphisms",
        [ IsList ] );

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

#! @Arguments r
#! @Group ClosedSubsetOfSpecByStandardMorphism
DeclareOperation( "ClosedSubsetOfSpecByStandardMorphism",
        [ IsHomalgRingElement ] );

#! @Description
#!  Compute the tangent space of <A>V</A> at the closed point <A>p</A>
#!  as an affine subspace of the ambient space of <A>V</A> intersecting <A>p</A>.
#! @Arguments V, p
#! @Returns an object in a Zariski coframe
DeclareOperation( "TangentSpaceAtPoint",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsHomalgMatrix ] );

#! @Arguments V, p
DeclareOperation( "TangentSpaceAtPoint",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsList ] );

DeclareOperation( "ComplementOfTangentSpaceAtPoint",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsHomalgMatrix ] );

DeclareOperation( "ComplementOfTangentSpaceAtPoint",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsList ] );
