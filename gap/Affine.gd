#
# ZariskiFrames: Zariski frames and coframes of affine varieties
#
# Declarations
#

#! @Chapter (Co)frames/Locales of Zariski closed/open subsets in affine varieties

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of objects in a Zariski frame or coframe of an affine variety.
#! @Arguments object
DeclareCategory( "IsObjectInZariskiFrameOrCoframeOfAnAffineVariety",
        IsObjectInZariskiFrameOrCoframe );

#! @Description
#!  The &GAP; category of morphisms in a Zariski frame or coframe of an affine variety.
#! @Arguments morphism
DeclareCategory( "IsMorphismInZariskiFrameOrCoframeOfAnAffineVariety",
        IsMorphismInZariskiFrameOrCoframe );

#! @Section Operatoins

#! @Description
#!  Construct a distinguished quasi-affine set defined set <A>eqs</A> of equations
#!  and the set <A>ineqs</A> of inequations.
#!  A quasi-affine set is called distinguished if it is a difference of an affine set
#!  and a hypersurface (or, equivalently, hypersurfaces).
#! @Arguments eqs, ineqs
#! @Returns an object in a meet-semilattice of formal multiple differences
#! @Group DistinguishedQuasiAffineSet
DeclareOperation( "DistinguishedQuasiAffineSet",
        [ IsList, IsList ] );

#! @Arguments eqs_ineqs
#! @Group DistinguishedQuasiAffineSet
DeclareOperation( "DistinguishedQuasiAffineSet",
        [ IsList ] );
