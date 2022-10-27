# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Declarations
#

#! @Chapter Boolean algebra of constructible objects

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of a Boolean algebra of constructible objects as union of multiple differences.
DeclareCategory( "IsBooleanAlgebraOfConstructibleObjectsAsUnionOfMultipleDifferences",
        IsBooleanAlgebraOfConstructibleObjects );

#! @Description
#!  The &GAP; category of objects in ...
#! @Arguments object
DeclareCategory( "IsConstructibleObjectAsUnionOfMultipleDifferences",
        IsConstructibleObject );

#! @Description
#!  The &GAP; category of morphisms in ...
#! @Arguments morphism
DeclareCategory( "IsMorphismBetweenConstructibleObjectsAsUnionOfMultipleDifferences",
        IsMorphismBetweenConstructibleObjects );

#! @Section Attributes

DeclareAttribute( "ListOfPreObjectsInMeetSemilatticeOfDifferences",
        IsConstructibleObjectAsUnionOfMultipleDifferences );

DeclareAttribute( "ListOfNormalizedObjectsInMeetSemilatticeOfDifferences",
        IsConstructibleObjectAsUnionOfMultipleDifferences );

DeclareAttribute( "ListOfStandardObjectsInMeetSemilatticeOfDifferences",
        IsConstructibleObjectAsUnionOfMultipleDifferences );

DeclareAttribute( "UnderlyingMeetSemilatticeOfDifferences",
        IsBooleanAlgebraOfConstructibleObjectsAsUnionOfMultipleDifferences );

#! @Section Operations

#! @Description
#!  A list of morphisms in the underlying lattice representing the formal multiple difference <A>A</A>.
#! @Arguments A
#! @Returns a list of &CAP; morphism
DeclareOperation( "ListOfObjectsInMeetSemilatticeOfDifferences",
        [ IsConstructibleObjectAsUnionOfMultipleDifferences ] );

DeclareOperation( "ListOp",
        [ IsConstructibleObjectAsUnionOfMultipleDifferences ] );

DeclareOperation( "ListOp",
        [ IsConstructibleObjectAsUnionOfMultipleDifferences, IsFunction ] );

DeclareOperation( "IsHomSetInhabitedWithTypeCast",
        [ IsMeetSemilatticeOfMultipleDifferences, IsObjectInMeetSemilatticeOfMultipleDifferences, IsConstructibleObjectAsUnionOfMultipleDifferences ] );

CapJitAddTypeSignature( "Length", [ IsConstructibleObjectAsUnionOfMultipleDifferences ], IsInt );

#! @Section Constructors

#! @Description
#!  Construct the Boolean algebra of constructible objects
#!  as union of objects in the poset <A>D</A> of multiple differences.
#! @Arguments D
#! @Returns a &CAP; category
DeclareAttribute( "BooleanAlgebraOfConstructibleObjectsAsUnionOfMultipleDifferences",
        IsCapCategory );

#! @Description
#!  If <A>D1</A>=<M>A1-B1</M>, <A>D2</A>=<M>A2-B2</M>, ..., then
#!  the output is <C>DirectProduct</C><M>(A1,A2,...)</M> - <C>Coproduct</C><M>(B1,B2,...)</M>.
#! @Arguments D1, D2, ...
#! @Returns an object in a &CAP; category
#! @Group UnionOfMultipleDifferences_group
DeclareGlobalFunction( "UnionOfMultipleDifferences" );

DeclareOperation( "UnionOfListOfMultipleDifferences", [ IsList ] );
