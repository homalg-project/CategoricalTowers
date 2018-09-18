#
# Locales: BooleanAlgebraOfConstructibleObjects
#
# Declarations
#

#! @Chapter Meet-semilattice of multiple differences

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of objects in ...
#! @Arguments object
DeclareCategory( "IsConstructibleObject",
        IsObjectInThinCategory );

#! @Description
#!  The &GAP; category of morphisms in ...
#! @Arguments morphism
DeclareCategory( "IsMorphismBetweenConstructibleObjects",
        IsMorphismInThinCategory );

#! @Section Attributes

DeclareAttribute( "ListOfPreObjectsInMeetSemilatticeOfMultipleDifferences",
        IsConstructibleObject );

DeclareAttribute( "ListOfNormalizedObjectsInMeetSemilatticeOfMultipleDifferences",
        IsConstructibleObject );

DeclareAttribute( "ListOfStandardObjectsInMeetSemilatticeOfMultipleDifferences",
        IsConstructibleObject );

#! @Section Operations

#! @Description
#!  A list of morphisms in the underlying lattice representing the formal multiple difference <A>A</A>.
#! @Arguments A
#! @Returns a list of &CAP; morphism
DeclareOperation( "ListOfObjectsOfUnderlyingMeetSemilatticeOfMultipleDifferences",
        [ IsConstructibleObject ] );

DeclareOperation( "IsHomSetInhabitedWithTypeCast",
        [ IsObjectInMeetSemilatticeOfDifferences, IsConstructibleObject ] );

#! @Section Constructors

#! @Description
#!  Construct the meet-semilattice of multiple differences from the lattice <A>L</A>.
#! @Arguments L
#! @Returns a &CAP; category
DeclareAttribute( "BooleanAlgebraOfConstructibleObjects",
        IsCapCategory );

#! @Description
#!  If <A>D1</A>=<M>A1-B1</M>, <A>D2</A>=<M>A2-B2</M>, ..., then
#!  the output is <C>DirectProduct</C><M>(A1,A2,...)</M> - <C>Coproduct</C><M>(B1,B2,...)</M>.
#! @Arguments D1, D2, ...
#! @Returns an object in a &CAP; category
#! @Group AsFormalMultipleDifference_group
DeclareGlobalFunction( "UnionOfMultipleDifferences" );

#! @Description
#!  <C>AsFormalMultipleDifferenceOfNormalizedMorphisms</C> assumes that the input is normalized.
#! @Arguments D1, D2, ...
#! @Group AsFormalMultipleDifference_group
DeclareGlobalFunction( "UnionOfMultipleDifferencesOfNormalizedObjects" );
