# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Declarations
#

#! @Chapter Coframes of Zariski closed subsets

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of Zariski coframes.
#! @Arguments object
DeclareCategory( "IsZariskiCoframe",
        IsZariskiFrameOrCoframe );

#! @Description
#!  The &GAP; category of objects in a Zariski coframe.
#! @Arguments object
DeclareCategory( "IsObjectInZariskiCoframe",
        IsObjectInZariskiFrameOrCoframe and IsClosedSubobject );

#! @Description
#!  The &GAP; category of morphisms in a Zariski coframe.
#! @Arguments morphism
DeclareCategory( "IsMorphismInZariskiCoframe",
        IsMorphismInZariskiFrameOrCoframe );

#! @Section Properties

#! @Description
#!  Check if <A>A</A> is irreducible or not.
#!  A shorthand ist <C>IsIrreducible</C>(  <A>A</A> ).
#! @Arguments A
#! @Returns true or false
DeclareProperty( "IsIrreducibleObjectInZariskiCoframe",
        IsObjectInZariskiCoframe );

#! @Section Attributes

#! @Description
#!  The dimension of <A>A</A>.
#! @Arguments A
#! @Returns an integer
DeclareAttribute( "Dimension",
        IsObjectInZariskiCoframe );

#! @Description
#!  The degree of <A>A</A>.
#! @Arguments A
#! @Returns an integer
if false then
DeclareOperation( "Degree",
        [ IsObjectInZariskiCoframe ] );
fi;

DeclareAttribute( "DegreeAttr",
        IsObjectInZariskiCoframe );

#! @Description
#!  The factored object of <A>A</A>.
#! @Arguments A
#! @Returns an object in a Zariski coframe.
DeclareAttribute( "FactorizeObject",
        IsObjectInZariskiCoframe );

#! @Description
#!  The list of irreducible components of <A>A</A>.
#! @Arguments A
#! @Returns a list
DeclareAttribute( "IrreducibleComponents",
        IsObjectInZariskiCoframe );

#! @Section Operations

#! @Description
#!  The <A>i</A>-th irreducible component of <A>A</A>.
#! @Arguments A, i
#! @Returns an object in a Zariski coframe
DeclareOperation( "\[\]",
        [ IsObjectInZariskiCoframe, IsInt ] );

#! @Description
#!  The list of currently known factors of <A>A</A>.
#! @Arguments A
#! @Returns a list
DeclareOperation( "KnownFactors",
        [ IsObjectInZariskiCoframe ] );

# Tools
DeclareGlobalFunction( "IsHomSetInhabitedForCoframes" );

DeclareGlobalFunction( "IsEqualForObjectsIfIsHomSetInhabitedForCoframes" );
