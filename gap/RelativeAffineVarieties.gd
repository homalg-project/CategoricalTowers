#
# ZariskiFrames: Relative affine varieties
#
# Declarations
#

#! @Chapter Relative affine varieties

#! @Section Attributes

#!
DeclareAttribute( "FunctorImageClosureOfProjectionBetweenZariskiCoframes",
        IsCapCategory );

#!
DeclareAttribute( "BaseOfFibration",
        IsObjectInZariskiCoframeOfAnAffineVariety );

#!
DeclareAttribute( "ImageClosureOfProjection",
        IsObjectInZariskiCoframeOfAnAffineVariety );

#!
DeclareAttribute( "FunctorPreimageOfProjectionBetweenZariskiCoframes",
        IsCapCategory );

#! @Section Operations

#!
DeclareOperation( "PreimageOfProjection",
        [ IsHomalgRing, IsObjectInZariskiCoframeOfAnAffineVariety ] );

#!
DeclareOperation( "PreimageOfProjection",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsObjectInZariskiCoframeOfAnAffineVariety ] );

#!
DeclareGlobalFunction( "DecreaseFiberDimensionWithoutAlteringImageClosureOfProjection" );

#! @Section Constructors

#! @Description
#!  Construct a Zariski closed subset (as an object in the Zariski coframe
#!  of closed subsets in a fibered affine variety) from a morphism <A>I</A>=<C>AsCategoryOfRowsMorphism</C>( <A>mat</A> )
#!  in the category of rows with <C>RankOfObject</C>( <C>Range</C>( <A>I</A> ) ) = 1.
#!  The morphism <A>I</A> stands for its module-theoretic image which is an ideal.
#! @Arguments I
#! @Returns a &CAP; object
#! @Group ClosedSubsetOfFiberedSpec
DeclareOperation( "ClosedSubsetOfFiberedSpec",
        [ IsCapCategoryMorphism ] );

#! @Arguments mat
#! @Group ClosedSubsetOfFiberedSpec
DeclareOperation( "ClosedSubsetOfFiberedSpec",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group ClosedSubsetOfFiberedSpec
DeclareOperation( "ClosedSubsetOfFiberedSpec",
        [ IsString, IsHomalgRing ] );

#! @Arguments r
#! @Group ClosedSubsetOfFiberedSpec
DeclareOperation( "ClosedSubsetOfFiberedSpec",
        [ IsHomalgRingElement ] );
#! @InsertSystem ClosedSubsetOfFiberedSpec

#! @Description
#!  <C>ClosedSubsetOfFiberedSpecByReducedMorphism</C> assumes that the image is a radical ideal.
#! @Arguments I
#! @Group ClosedSubsetOfFiberedSpecByReducedMorphism
DeclareOperation( "ClosedSubsetOfFiberedSpecByReducedMorphism",
        [ IsCapCategoryMorphism ] );

#! @Arguments mat
#! @Group ClosedSubsetOfFiberedSpecByReducedMorphism
DeclareOperation( "ClosedSubsetOfFiberedSpecByReducedMorphism",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group ClosedSubsetOfFiberedSpecByReducedMorphism
DeclareOperation( "ClosedSubsetOfFiberedSpecByReducedMorphism",
        [ IsString, IsHomalgRing ] );

#! @Arguments r
#! @Group ClosedSubsetOfFiberedSpecByReducedMorphism
DeclareOperation( "ClosedSubsetOfFiberedSpecByReducedMorphism",
        [ IsHomalgRingElement ] );

#! @Arguments L
DeclareOperation( "ClosedSubsetOfFiberedSpecByListOfReducedMorphisms",
        [ IsList ] );

#! @Description
#!  <C>ClosedSubsetOfFiberedSpecByStandardMorphism</C> assumes that the image is a radical ideal given by some sort of a <Q>standard</Q> basis.
#! @Arguments I
#! @Group ClosedSubsetOfFiberedSpecByStandardMorphism
DeclareOperation( "ClosedSubsetOfFiberedSpecByStandardMorphism",
        [ IsCapCategoryMorphism ] );

#! @Arguments mat
#! @Group ClosedSubsetOfFiberedSpecByStandardMorphism
DeclareOperation( "ClosedSubsetOfFiberedSpecByStandardMorphism",
        [ IsHomalgMatrix ] );

#! @Arguments str, R
#! @Group ClosedSubsetOfFiberedSpecByStandardMorphism
DeclareOperation( "ClosedSubsetOfFiberedSpecByStandardMorphism",
        [ IsString, IsHomalgRing ] );

#! @Arguments r
#! @Group ClosedSubsetOfFiberedSpecByStandardMorphism
DeclareOperation( "ClosedSubsetOfFiberedSpecByStandardMorphism",
        [ IsHomalgRingElement ] );
