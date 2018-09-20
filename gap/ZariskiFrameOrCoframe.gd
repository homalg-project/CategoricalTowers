#
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets
#
# Declarations
#

#! @Chapter (Co)frames/Locales of Zariski closed/open subsets

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of objects in a Zariski frame or coframe.
#! @Arguments object
DeclareCategory( "IsObjectInZariskiFrameOrCoframe",
        IsObjectInThinCategory );

#! @Description
#!  The &GAP; category of morphisms in a Zariski frame or coframe.
#! @Arguments morphism
DeclareCategory( "IsMorphismInZariskiFrameOrCoframe",
        IsMorphismInThinCategory );

#! @Section Attributes

DeclareAttribute( "PreMorphismOfUnderlyingCategory",
        IsObjectInZariskiFrameOrCoframe );

DeclareAttribute( "ReducedMorphismOfUnderlyingCategory",
        IsObjectInZariskiFrameOrCoframe );

DeclareAttribute( "StandardMorphismOfUnderlyingCategory",
        IsObjectInZariskiFrameOrCoframe );

#! @Section Operations

#! @Description
#!  The morphism in the category of rows the module-theoretic image
#!  of which is the vanishing ideal of <A>A</A>.
#! @Arguments A
#! @Returns a &CAP; morphism
DeclareOperation( "MorphismOfUnderlyingCategory",
        [ IsObjectInZariskiFrameOrCoframe ] );
