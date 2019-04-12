#
# Locales: ConstructibleObjects
#
# Declarations
#

#! @Chapter Boolean algebra of constructible objects

#! @Section GAP Categories

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

#! @Arguments A
DeclareAttribute( "LocallyClosedApproximation",
        IsConstructibleObject );

DeclareOperation( "CanonicalObjectOp",
        [ IsConstructibleObject ] );

#! @Arguments A
DeclareAttribute( "CanonicalObject",
        IsConstructibleObject );

#! @Arguments A
DeclareAttribute( "FactorizedObject",
        IsConstructibleObject );

#! @Section Attributes

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
