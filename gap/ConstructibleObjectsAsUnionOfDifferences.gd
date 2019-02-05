#
# Locales: ConstructibleObjectsAsUnionOfDifferences
#
# Declarations
#

#! @Chapter Boolean algebra of constructible objects

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of objects in ...
#! @Arguments object
DeclareCategory( "IsConstructibleObjectAsUnionOfDifferences",
        IsObjectInThinCategory );

#! @Description
#!  The &GAP; category of morphisms in ...
#! @Arguments morphism
DeclareCategory( "IsMorphismBetweenConstructibleObjectsAsUnionOfDifferences",
        IsMorphismInThinCategory );

#! @Section Attributes

DeclareAttribute( "ListOfPreObjectsInMeetSemilatticeOfDifferences",
        IsConstructibleObjectAsUnionOfDifferences );

DeclareAttribute( "ListOfNormalizedObjectsInMeetSemilatticeOfDifferences",
        IsConstructibleObjectAsUnionOfDifferences );

DeclareAttribute( "ListOfStandardObjectsInMeetSemilatticeOfDifferences",
        IsConstructibleObjectAsUnionOfDifferences );

#! @Section Operations

#! @Description
#!  A list of morphisms in the underlying lattice representing the formal multiple difference <A>A</A>.
#! @Arguments A
#! @Returns a list of &CAP; morphism
DeclareOperation( "ListOfObjectsOfUnderlyingMeetSemilatticeOfDifferences",
        [ IsConstructibleObjectAsUnionOfDifferences ] );

DeclareOperation( "IsHomSetInhabitedWithTypeCast",
        [ IsObjectInMeetSemilatticeOfDifferences, IsConstructibleObjectAsUnionOfDifferences ] );

#! @Section Constructors

#! @Description
#!  Construct the meet-semilattice of multiple differences from the lattice <A>L</A>.
#! @Arguments L
#! @Returns a &CAP; category
DeclareAttribute( "BooleanAlgebraOfConstructibleObjectsAsUnionOfDifferences",
        IsCapCategory );

#! @Description
#!  If <A>D1</A>=<M>A1-B1</M>, <A>D2</A>=<M>A2-B2</M>, ..., then
#!  the output is <C>DirectProduct</C><M>(A1,A2,...)</M> - <C>Coproduct</C><M>(B1,B2,...)</M>.
#! @Arguments D1, D2, ...
#! @Returns an object in a &CAP; category
#! @Group AsFormalDifference_group
DeclareGlobalFunction( "UnionOfDifferences" );

#! @Description
#!  <C>AsFormalDifferenceOfNormalizedMorphisms</C> assumes that the input is normalized.
#! @Arguments D1, D2, ...
#! @Group AsFormalDifference_group
DeclareGlobalFunction( "UnionOfDifferencesOfNormalizedObjects" );
