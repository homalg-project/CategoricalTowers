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
        IsObjectInMeetSemilatticeOfDifferences );

#! @Description
#!  The &GAP; category of morphisms in a meet-semilattice of differences.
#! @Arguments morphism
DeclareCategory( "IsMorphismInMeetSemilatticeOfSingleDifferences",
        IsMorphismInMeetSemilatticeOfDifferences );

#! @Section Attributes

DeclareAttribute( "PrePairInUnderlyingLattice",
        IsObjectInMeetSemilatticeOfSingleDifferences, "mutable" );

DeclareAttribute( "NormalizedPairInUnderlyingHeytingOrCoHeytingAlgebra",
        IsObjectInMeetSemilatticeOfSingleDifferences, "mutable" );

DeclareAttribute( "StandardPairInUnderlyingHeytingOrCoHeytingAlgebra",
        IsObjectInMeetSemilatticeOfSingleDifferences, "mutable" );

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
