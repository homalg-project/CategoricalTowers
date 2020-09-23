#
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
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
#!  Construct a distinguished quasi-affine set <C>A</C> defined by the set <A>eqs</A> of equations
#!  and the set <A>ineqs</A> of inequations over the commutative unital ring <A>R</A>.
#!  A quasi-affine set is called distinguished if it is a difference of an affine set
#!  and a hypersurface (or, equivalently, hypersurfaces).
#!  The optional object <A>point_emb</A> is an object parametrized by <C>A</C>
#!  and giving an embedding/realization of the abstract points of <C>A</C> in some context.
#! @Arguments eqs, ineqs, R, point_emb
#! @Returns an object in a meet-semilattice of formal multiple differences
#! @Group DistinguishedQuasiAffineSet
DeclareOperation( "DistinguishedQuasiAffineSet",
        [ IsList, IsList, IsHomalgRing, IsObject ] );

#! @Arguments eqs, ineqs, point_emb
#! @Group DistinguishedQuasiAffineSet
DeclareOperation( "DistinguishedQuasiAffineSet",
        [ IsList, IsList, IsObject ] );

#! @Arguments eqs, ineqs
#! @Group DistinguishedQuasiAffineSet
DeclareOperation( "DistinguishedQuasiAffineSet",
        [ IsList, IsList ] );

#! @Arguments eqs_ineqs
#! @Group DistinguishedQuasiAffineSet
DeclareOperation( "DistinguishedQuasiAffineSet",
        [ IsList ] );
