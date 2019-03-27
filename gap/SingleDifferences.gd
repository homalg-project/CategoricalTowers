#
# Locales: Single differences
#
# Declarations
#

#! @Chapter Meet-semilattice of differences

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of objects in a meet-semilattice of differences.
#! @Arguments object
DeclareCategory( "IsObjectInMeetSemilatticeOfSingleDifferences",
        IsObjectInThinCategory );

#! @Description
#!  The &GAP; category of morphisms in a meet-semilattice of differences.
#! @Arguments morphism
DeclareCategory( "IsMorphismInMeetSemilatticeOfSingleDifferences",
        IsMorphismInThinCategory );

#! @Section Properties

## IsClosed is hijacked as an operation by orb v4.8.1
DeclareProperty( "IsClosedSubobject",
        IsObjectInMeetSemilatticeOfSingleDifferences );

#! @Description
#!  The embedding of the meet-semilattice of formal single differences into the underlying lattice has a right adjoint,
#!  at least in case the underying lattice is a co-Heyting algebra.
#!  A formal single difference is closed if its component of the unit of the above adjunction is an isomorphism.
#! @Arguments A
DeclareOperation( "IsClosed",
        [ IsObjectInMeetSemilatticeOfSingleDifferences ] );

#! @Description
#!  Check if the complement (a constructible object as union of formal single differences) of <A>A</A> is closed.
#! @Arguments A
DeclareProperty( "IsOpen",
        IsObjectInMeetSemilatticeOfSingleDifferences );

#! @Arguments A
DeclareProperty( "IsLocallyClosed",
        IsObjectInMeetSemilatticeOfSingleDifferences );

#! @Section Attributes

DeclareAttribute( "PrePairInUnderlyingLattice",
        IsObjectInMeetSemilatticeOfSingleDifferences, "mutable" );

DeclareAttribute( "NormalizedPairInUnderlyingHeytingOrCoHeytingAlgebra",
        IsObjectInMeetSemilatticeOfSingleDifferences, "mutable" );

DeclareAttribute( "StandardPairInUnderlyingHeytingOrCoHeytingAlgebra",
        IsObjectInMeetSemilatticeOfSingleDifferences, "mutable" );

#! @Arguments A
DeclareAttribute( "NormalizeObject",
        IsObjectInMeetSemilatticeOfSingleDifferences );

#! @Arguments A
DeclareAttribute( "StandardizeObject",
        IsObjectInMeetSemilatticeOfSingleDifferences );

#! @Arguments A
DeclareAttribute( "LocallyClosedApproximation",
        IsObjectInMeetSemilatticeOfSingleDifferences );

#! @Arguments A
DeclareAttribute( "CanonicalObject",
        IsObjectInMeetSemilatticeOfSingleDifferences );

#! @Description
#!  The closure of the formal single difference <A>A</A> in the underlying co-Heyting algebra.
#! @Arguments A
#! @Returns an object in a co-Heyting algebra.
DeclareAttribute( "Closure",
        IsObjectInMeetSemilatticeOfSingleDifferences );

#! @Arguments A
DeclareAttribute( "Dimension",
        IsObjectInMeetSemilatticeOfSingleDifferences );

#! @Section Operations

#! @Description
#!  A morphism in the underlying lattice representing the formal single difference <A>A</A>.
#! @Arguments A
#! @Returns a pair of &CAP; objects
DeclareOperation( "PairInUnderlyingLattice",
        [ IsObjectInMeetSemilatticeOfSingleDifferences ] );

#! @Section Constructors

#! @Description
#!  Construct the meet-semilattice of differences from the lattice <A>L</A>.
#! @Arguments L
#! @Returns a &CAP; category
DeclareAttribute( "MeetSemilatticeOfDifferences",
        IsCapCategory );

#! @Description
#!  Form the formal single difference object <A>A</A> - <A>B</A>.
#!  The expression <A>A</A> - 0 := <A>A</A> - <C>InitialObject</C>( <C>CapCategory</C>( <A>A</A> ) ).
#!  The expression - <A>A</A> := <C>TerminalObject</C>( <C>CapCategory</C>( <A>A</A> ) ) - <A>A</A>.
#! @Group FormalDifference
#! @Arguments A, B
DeclareOperation( "\-",
        [ IsObjectInThinCategory, IsObjectInThinCategory ] );

DeclareOperation( "\-",
        [ IsObjectInThinCategory, IsInt ] );

DeclareOperation( "AdditiveInverseMutable",
        [ IsObjectInThinCategory ] );

#! @Description
#!  <C>FormalDifferenceOfNormalizedObjects</C> assumes that <A>A</A> and <A>B</A>
#!  are <Q>normalized</Q>
#! @Arguments u
#! @Group FormalDifference
DeclareOperation( "FormalDifferenceOfNormalizedObjects",
        [ IsObjectInThinCategory, IsObjectInThinCategory ] );
