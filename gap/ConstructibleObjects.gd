# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Declarations
#

#! @Chapter Boolean algebra of constructible objects

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of a Boolean algebra of constructible objects.
DeclareCategory( "IsBooleanAlgebraOfConstructibleObjects",
        IsCapCategory and IsThinCategory );

#! @Description
#!  The &GAP; category of objects in a Boolean algebra of constructible objects.
#! @Arguments object
DeclareCategory( "IsConstructibleObject",
        IsObjectInThinCategory );

#! @Description
#!  The &GAP; category of morphisms in a Boolean algebra of constructible objects.
#! @Arguments morphism
DeclareCategory( "IsMorphismBetweenConstructibleObjects",
        IsMorphismInThinCategory );

#! @Section Properties

#! @Arguments A
DeclareProperty( "IsOpen",
        IsConstructibleObject );

## IsClosed is hijacked as an operation by orb v4.8.1
DeclareProperty( "IsClosedSubobject",
        IsConstructibleObject );

#! @Arguments A
DeclareOperation( "IsClosed",
        [ IsConstructibleObject ] );

#! @Arguments A
DeclareProperty( "IsLocallyClosed",
        IsConstructibleObject );

#! @Section Attributes

#! @Description
#!  The category underlying the Boolean algebra of constructible objects <A>C</A>.
#! @Arguments C
#! @Returns a CAP category
DeclareAttribute( "UnderlyingCategory",
        IsBooleanAlgebraOfConstructibleObjects );

DeclareAttribute( "UnderlyingMeetSemilatticeOfDifferences",
        IsBooleanAlgebraOfConstructibleObjects );

#! @Arguments A
DeclareAttribute( "LocallyClosedPart",
        IsConstructibleObject );

DeclareOperation( "CanonicalObjectOp",
        [ IsConstructibleObject ] );

#! @Arguments A
DeclareAttribute( "CanonicalObject",
        IsConstructibleObject );

#! @Arguments A
DeclareAttribute( "FactorizeObject",
        IsConstructibleObject );

#! @Arguments A
DeclareAttribute( "NormalizedObject",
        IsConstructibleObject );

#! @Arguments A
DeclareAttribute( "StandardizedObject",
        IsConstructibleObject );

#! @Description
#!  The closure of the constructible object <A>A</A> in the underlying co-Heyting algebra.
#! @Arguments A
#! @Returns an object in a co-Heyting algebra.
DeclareAttribute( "Closure",
        IsConstructibleObject );

#! @Description
#!  The closure of the constructible object <A>A</A> as a constructible object.
#! @Arguments A
#! @Returns a constructible object.
DeclareAttribute( "ClosureAsConstructibleObject",
        IsConstructibleObject );

#! @Arguments A
DeclareAttribute( "Dimension",
        IsConstructibleObject );

#! @Arguments A
if false then
DeclareOperation( "DegreeAttr",
        [ IsConstructibleObject ] );
fi;

DeclareAttribute( "DegreeAttr",
        IsConstructibleObject );

#! @Section Operations

#! @Arguments A
DeclareOperation( "NormalizeObject",
        [ IsConstructibleObject ] );

#! @Arguments A
DeclareOperation( "StandardizeObject",
        [ IsConstructibleObject ] );


#! @Arguments A
DeclareAttribute( "Length",
        IsConstructibleObject );

#! @Arguments A, i
DeclareOperation( "\[\]",
        [ IsConstructibleObject, IsInt ] );

#! @Arguments A
DeclareOperation( "Iterator",
        [ IsConstructibleObject ] );

#! @Arguments A, f
DeclareOperation( "ForAllOp",
        [ IsConstructibleObject, IsFunction ] );

#! @Arguments A, f
DeclareOperation( "ForAnyOp",
        [ IsConstructibleObject, IsFunction ] );
