# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Declarations
#

#! @Chapter Boolean algebra of constructible objects

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of a Boolean algebra of constructible objects as union of single differences.
DeclareCategory( "IsBooleanAlgebraOfConstructibleObjectsAsUnionOfSingleDifferences",
        IsBooleanAlgebraOfConstructibleObjects );

#! @Description
#!  The &GAP; category of objects in a Boolean algebra of constructible objects,
#!  the latter as unions of formal single differences.
#! @Arguments object
DeclareCategory( "IsConstructibleObjectAsUnionOfSingleDifferences",
        IsConstructibleObject );

#! @Description
#!  The &GAP; category of morphisms in a Boolean algebra of constructible objects,
#!  the latter as unions of formal single differences.
#! @Arguments morphism
DeclareCategory( "IsMorphismBetweenConstructibleObjectsAsUnionOfDifferences",
        IsMorphismBetweenConstructibleObjects );

#! @Section Attributes

DeclareAttribute( "ListOfPreObjectsInMeetSemilatticeOfDifferences",
        IsConstructibleObjectAsUnionOfSingleDifferences );

DeclareAttribute( "ListOfNormalizedObjectsInMeetSemilatticeOfDifferences",
        IsConstructibleObjectAsUnionOfSingleDifferences );

DeclareAttribute( "ListOfStandardObjectsInMeetSemilatticeOfDifferences",
        IsConstructibleObjectAsUnionOfSingleDifferences );

DeclareAttribute( "UnderlyingMeetSemilatticeOfDifferences",
        IsBooleanAlgebraOfConstructibleObjectsAsUnionOfSingleDifferences );

CapJitAddTypeSignature( "List", [ IsConstructibleObjectAsUnionOfSingleDifferences ], function ( input_types )
    
    Assert( 0, IsBooleanAlgebraOfConstructibleObjectsAsUnionOfSingleDifferences( input_types[1].category ) );
    
    return rec( filter := IsList,
                element_type :=
                rec( filter := UnderlyingMeetSemilatticeOfDifferences( input_types[1].category )!.object_representation,
                     category := UnderlyingMeetSemilatticeOfDifferences( input_types[1].category ) ) );
    
end );

#! @Section Operations

#! @Description
#!  A list of morphisms in the underlying lattice representing the formal multiple difference <A>A</A>.
#! @Arguments A
#! @Returns a list of &CAP; morphism
DeclareOperation( "ListOfObjectsInMeetSemilatticeOfDifferences",
        [ IsConstructibleObjectAsUnionOfSingleDifferences ] );

DeclareOperation( "ListOp",
        [ IsConstructibleObjectAsUnionOfSingleDifferences ] );

DeclareOperation( "ListOp",
        [ IsConstructibleObjectAsUnionOfSingleDifferences, IsFunction ] );

DeclareOperation( "IsHomSetInhabitedWithTypeCast",
        [ IsObjectInMeetSemilatticeOfSingleDifferences, IsConstructibleObjectAsUnionOfSingleDifferences ] );

#! @Section Constructors

#! @Description
#!  Construct the Boolean algebra of constructible objects
#!  as union of objects in the poset <A>D</A> of single differences.
#! @Arguments D
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

DeclareOperation( "UnionOfListOfDifferences", [ IsList ] );

DeclareOperation( "\+",
        [ IsObjectInThinCategory, IsInt ] );

DeclareOperation( "\+",
        [ IsInt, IsObjectInThinCategory ] );

#! @Description
#!  <C>AsFormalDifferenceOfNormalizedMorphisms</C> assumes that the input is normalized.
#! @Arguments D1, D2, ...
#! @Group AsFormalDifference_group
DeclareGlobalFunction( "UnionOfDifferencesOfNormalizedObjects" );
