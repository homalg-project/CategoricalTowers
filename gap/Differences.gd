#
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Declarations
#

#! @Chapter Meet-semilattice of single/multiple differences

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of objects in a meet-semilattice of single/multiple differences.
#! @Arguments object
DeclareCategory( "IsObjectInMeetSemilatticeOfDifferences",
        IsObjectInThinCategory );

#! @Description
#!  The &GAP; category of morphisms in a meet-semilattice of single/multiple differences.
#! @Arguments morphism
DeclareCategory( "IsMorphismInMeetSemilatticeOfDifferences",
        IsMorphismInThinCategory );

#! @Section Properties

## IsClosed is hijacked as an operation by orb v4.8.1
DeclareProperty( "IsClosedSubobject",
        IsObjectInMeetSemilatticeOfDifferences );

#! @Description
#!  The embedding of the meet-semilattice of formal single/multiple differences into the underlying lattice has a right adjoint,
#!  at least in case the underying lattice is a co-Heyting algebra.
#!  A formal single difference is closed if its component of the unit of the above adjunction is an isomorphism.
#! @Arguments A
DeclareOperation( "IsClosed",
        [ IsObjectInMeetSemilatticeOfDifferences ] );

#! @Description
#!  Check if the complement (a constructible object) of <A>A</A> is closed.
#! @Arguments A
DeclareProperty( "IsOpen",
        IsObjectInMeetSemilatticeOfDifferences );

#! @Arguments A
DeclareProperty( "IsLocallyClosed",
        IsObjectInMeetSemilatticeOfDifferences );

#! @Section Attributes

#! @Arguments A
DeclareAttribute( "LocallyClosedPart",
        IsObjectInMeetSemilatticeOfDifferences );

DeclareOperation( "CanonicalObjectOp",
        [ IsObjectInMeetSemilatticeOfDifferences ] );

#! @Arguments A
DeclareAttribute( "CanonicalObject",
        IsObjectInMeetSemilatticeOfDifferences );

#! @Arguments A
DeclareAttribute( "FactorizeObject",
        IsObjectInMeetSemilatticeOfDifferences );

#! @Description
#!  The closure of the formal single difference <A>A</A> in the underlying co-Heyting algebra.
#! @Arguments A
#! @Returns an object in a co-Heyting algebra.
DeclareAttribute( "Closure",
        IsObjectInMeetSemilatticeOfDifferences );

#! @Arguments A
DeclareAttribute( "Dimension",
        IsObjectInMeetSemilatticeOfDifferences );

#! @Arguments A
if false then
DeclareOperation( "Degree",
        [ IsObjectInMeetSemilatticeOfDifferences ] );
fi;

DeclareAttribute( "DegreeAttr",
        IsObjectInMeetSemilatticeOfDifferences );

#! @Section Operations

#! @Arguments A
DeclareOperation( "NormalizeObject",
        [ IsObjectInMeetSemilatticeOfDifferences ] );

#! @Arguments A
DeclareOperation( "StandardizeObject",
        [ IsObjectInMeetSemilatticeOfDifferences ] );
