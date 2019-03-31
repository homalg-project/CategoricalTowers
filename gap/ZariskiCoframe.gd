#
# ZariskiFrames: Coframes of Zariski closed subsets
#
# Declarations
#

#! @Chapter Coframes of Zariski closed subsets

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of objects in a Zariski coframe.
#! @Arguments object
DeclareCategory( "IsObjectInZariskiCoframe",
        IsObjectInZariskiFrameOrCoframe );

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
#!  The factored object of <A>A</A>.
#! @Arguments A
#! @Returns an object in a Zariski coframe.
DeclareAttribute( "FactorizedObject",
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

# Tools
DeclareGlobalFunction( "IsHomSetInhabitedForCoframesUsingCategoryOfRows" );

DeclareGlobalFunction( "IsEqualForObjectsIfIsHomSetInhabitedForCoframesUsingCategoryOfRows" );
