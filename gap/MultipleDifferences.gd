#
# Locales: Multiple differences
#
# Declarations
#

#! @Chapter Meet-semilattice of multiple differences

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of objects in a meet-semilattice of multiple differences.
#! @Arguments object
DeclareCategory( "IsObjectInMeetSemilatticeOfMultipleDifferences",
        IsObjectInMeetSemilatticeOfDifferences );

#! @Description
#!  The &GAP; category of morphisms in a meet-semilattice of multiple differences.
#! @Arguments morphism
DeclareCategory( "IsMorphismInMeetSemilatticeOfMultipleDifferences",
        IsMorphismInMeetSemilatticeOfDifferences );

#! @Section Attributes

DeclareAttribute( "ListOfPreObjectsInMeetSemilatticeOfDifferences",
        IsObjectInMeetSemilatticeOfMultipleDifferences );

DeclareAttribute( "ListOfPreNormalizedObjectsInMeetSemilatticeOfDifferences",
        IsObjectInMeetSemilatticeOfMultipleDifferences );

DeclareAttribute( "ListOfNormalizedObjectsInMeetSemilatticeOfDifferences",
        IsObjectInMeetSemilatticeOfMultipleDifferences );

DeclareAttribute( "ListOfStandardObjectsInMeetSemilatticeOfDifferences",
        IsObjectInMeetSemilatticeOfMultipleDifferences );

DeclareAttribute( "EquivalenceToMeetSemilatticeOfDifferences",
        IsCapCategory );

#! @Arguments A
DeclareAttribute( "AsDifference",
        IsObjectInMeetSemilatticeOfMultipleDifferences );

#! @Section Operations

#! @Description
#!  A list of formal single differences in the underlying lattice representing the formal multiple difference <A>A</A>.
#! @Arguments A
#! @Returns a list of &CAP; morphism
DeclareOperation( "ListOfObjectsOfDifferences",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ] );

DeclareOperation( "ListOp",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ] );

DeclareOperation( "ListOp",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences, IsFunction ] );

DeclareOperation( "Iterator",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences ] );

DeclareOperation( "ForAllOp",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences, IsFunction ] );

DeclareOperation( "ForAnyOp",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences, IsFunction ] );

#!
DeclareOperation( "\[\]",
        [ IsObjectInMeetSemilatticeOfMultipleDifferences, IsInt ] );

#! @Section Constructors

#! @Description
#!  Construct the meet-semilattice of multiple differences from the lattice <A>L</A>.
#! @Arguments L
#! @Returns a &CAP; category
DeclareAttribute( "MeetSemilatticeOfMultipleDifferences",
        IsCapCategory );

#! @Description
#!  If <A>D1</A>=<M>A1-B1</M>, <A>D2</A>=<M>A2-B2</M>, ..., then
#!  the output is <C>DirectProduct</C><M>(A1,A2,...)</M> - <C>Coproduct</C><M>(B1,B2,...)</M>.
#! @Arguments D1, D2, ...
#! @Returns an object in a &CAP; category
#! @Group AsFormalMultipleDifference_group
DeclareGlobalFunction( "AsFormalMultipleDifference" );

#! @Description
#!  <C>AsFormalMultipleDifferenceOfNormalizedMorphisms</C> assumes that the input is normalized.
#! @Arguments D1, D2, ...
#! @Group AsFormalMultipleDifference_group
DeclareGlobalFunction( "AsFormalMultipleDifferenceOfNormalizedObjects" );
