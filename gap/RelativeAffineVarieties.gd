#
# ZariskiFrames: Relative affine varieties
#
# Declarations
#

#! @Chapter Relative affine varieties

#! @Section Attributes

#!
DeclareAttribute( "FunctorClosureOfProjectionBetweenZariskiCoframes",
        IsCapCategory );

#!
DeclareAttribute( "ClosureOfProjection",
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
DeclareOperation( "FiberOfProjectionOverBasePoint",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsHomalgMatrix ] );

#!
DeclareOperation( "FiberOfProjectionOverBasePoint",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsList ] );

#! @Description
#!  Compute the tangent space of the fiber of <A>V</A>
#!  over closed base point <A>p_base</A> at the closed point <A>p_fiber</A>
#!  as an affine subspace of the ambient space of <A>V</A> intersecting <A>(p_base, p_fiber)</A>.
#! @Arguments V, p_base, p_fiber
#! @Returns an object in a Zariski coframe
DeclareOperation( "TangentSpaceOfFiberAtPoint",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsHomalgMatrix, IsHomalgMatrix ] );

#! @Arguments V, p_base, p_fiber
DeclareOperation( "TangentSpaceOfFiberAtPoint",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsList, IsList ] );

#! @Description
#!  
#! @Arguments V, p_base, p_fiber
#! @Returns an object in a Zariski coframe
DeclareOperation( "DimensionsOfFibrationAtClosedPoint",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsHomalgMatrix, IsHomalgMatrix ] );

#! @Arguments V, p_base, p_fiber
DeclareOperation( "DimensionsOfFibrationAtClosedPoint",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsList, IsList ] );

DeclareOperation( "ComplementOfTangentSpaceOfFiberAtPoint",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsHomalgMatrix, IsHomalgMatrix ] );

DeclareOperation( "ComplementOfTangentSpaceOfFiberAtPoint",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsList, IsList ] );

#! @Description
#!  Compute a compolement of the tangent space of the fiber of <A>V</A>
#!  over the closed base point <A>p_base</A> at the closed point <A>p_fiber</A>
#!  as an affine subspace of the ambient space of <A>V</A> intersecting <A>(p_base, p_fiber)</A>.
#! @Arguments V, p_base, p_fiber
#! @Returns an object in a Zariski coframe
DeclareOperation( "EmbeddedComplementOfTangentSpaceOfFiberAtPoint",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsHomalgMatrix, IsHomalgMatrix ] );

#! @Arguments V, p_base, p_fiber
DeclareOperation( "EmbeddedComplementOfTangentSpaceOfFiberAtPoint",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsList, IsList ] );
