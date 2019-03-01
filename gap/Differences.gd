#
# Locales: Differences
#
# Declarations
#

#! @Chapter Meet-semilattice of differences

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of objects in a meet-semilattice of differences.
#! @Arguments object
DeclareCategory( "IsObjectInMeetSemilatticeOfDifferences",
        IsObjectInThinCategory );

#! @Description
#!  The &GAP; category of morphisms in a meet-semilattice of differences.
#! @Arguments morphism
DeclareCategory( "IsMorphismInMeetSemilatticeOfDifferences",
        IsMorphismInThinCategory );

#! @Section Properties

## IsClosed is hijacked as an operation by orb v4.8.1
DeclareProperty( "IsClosedSubobject",
        IsObjectInMeetSemilatticeOfDifferences );

#! @Description
#!  The embedding of the meet-semilattice of formal differences into the underlying lattice has a right adjoint,
#!  at least in case the underying lattice is a co-Heyting algebra.
#!  A formal difference is closed if its component of the unit of the above adjunction is an isomorphism.
#! @Arguments A
DeclareOperation( "IsClosed",
        [ IsObjectInMeetSemilatticeOfDifferences ] );

#! @Description
#!  Check if the complement (a constructible object as union of formal differences) of <A>A</A> is closed.
#! @Arguments A
DeclareProperty( "IsOpen",
        IsObjectInMeetSemilatticeOfDifferences );

#! @Arguments A
DeclareProperty( "IsLocallyClosed",
        IsObjectInMeetSemilatticeOfDifferences );

#! @Section Attributes

DeclareAttribute( "PrePairInUnderlyingLattice",
        IsObjectInMeetSemilatticeOfDifferences, "mutable" );

DeclareAttribute( "NormalizedPairInUnderlyingHeytingAlgebra",
        IsObjectInMeetSemilatticeOfDifferences, "mutable" );

DeclareAttribute( "StandardPairInUnderlyingHeytingOrCoHeytingAlgebra",
        IsObjectInMeetSemilatticeOfDifferences, "mutable" );

#! @Arguments A
DeclareAttribute( "NormalizedObject",
        IsObjectInMeetSemilatticeOfDifferences );

#! @Arguments A
DeclareAttribute( "StandardObject",
        IsObjectInMeetSemilatticeOfDifferences );

#! @Arguments A
DeclareAttribute( "LocallyClosedApproximation",
        IsObjectInMeetSemilatticeOfDifferences );

#! @Arguments A
DeclareAttribute( "CanonicalObject",
        IsObjectInMeetSemilatticeOfDifferences );

#! @Description
#!  The closure of the formal difference <A>A</A> in the underlying co-Heyting algebra.
#! @Arguments A
#! @Returns an object in a co-Heyting algebra.
DeclareAttribute( "Closure",
        IsObjectInMeetSemilatticeOfDifferences );

#! @Arguments A
DeclareAttribute( "Dimension",
        IsObjectInMeetSemilatticeOfDifferences );

#! @Section Operations

#! @Description
#!  A morphism in the underlying lattice representing the formal difference <A>A</A>.
#! @Arguments A
#! @Returns a pair of &CAP; objects
DeclareOperation( "PairInUnderlyingLattice",
        [ IsObjectInMeetSemilatticeOfDifferences ] );

#! @Section Constructors

#! @Description
#!  Construct the meet-semilattice of differences from the lattice <A>L</A>.
#! @Arguments L
#! @Returns a &CAP; category
DeclareAttribute( "MeetSemilatticeOfDifferences",
        IsCapCategory );

#! @Description
#!  Form the formal difference object <A>A</A> - <A>B</A>.
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
