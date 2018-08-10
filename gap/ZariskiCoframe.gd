#
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets
#
# Declarations
#

#! @Chapter (Co)frames/Locales of Zariski closed/open subsets

#! @Section GAP Categories

#! @Description
#! The GAP category of objects in a Zariski coframe
#! @Arguments object
DeclareCategory( "IsObjectInZariskiCoframe",
                 IsCapCategoryObject );

#! @Description
#! The GAP category of morphisms in a Zariski coframe
#! @Arguments object
DeclareCategory( "IsMorphismInZariskiCoframe",
                 IsCapCategoryMorphism );

#! @Section Attributes

DeclareAttribute( "PreMorphismOfUnderlyingCategory",
        IsObjectInZariskiCoframe );

#! @Description
#!  The morphism in the category of rows the module-theoretic image
#!  of which is the vanishing ideal of <A>A</A>.
#! @Arguments A
#! @Returns A &CAP; morphism
DeclareAttribute( "MorphismOfUnderlyingCategory",
        IsObjectInZariskiCoframe );

#! @Section Constructors

#! @Description
#!  Construct the morphism between Zariski closed subsets
#! @Arguments A, B
#! @Returns a &CAP; morphism
DeclareOperation( "MorphismOfZariskiClosedSubsets",
        [ IsObjectInZariskiCoframe, IsObjectInZariskiCoframe ] );

#! @Section Tools

DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_ZARISKI_COFRAMES" );
