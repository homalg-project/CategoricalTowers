#
# Locales: Preordered sets (prosets)
#
# Declarations
#

#! @Chapter Thin categories, a.k.a. prosets (preordered sets)

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of objects in a thin &CAP; category.
#! @Arguments object
DeclareCategory( "IsObjectInThinCategory",
                 IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a thin &CAP; category.
#! @Arguments morphism
DeclareCategory( "IsMorphismInThinCategory",
                 IsCapCategoryMorphism );

#! @Section Constructors

#! @Description
#!  Construct the unique morphism with source <A>A</A> and target <A>B</A>.
#! @Arguments A, B
#! @Returns a &CAP; morphism
DeclareOperation( "UniqueMorphism",
        [ IsObjectInThinCategory, IsObjectInThinCategory ] );

# @Section Tools

DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_PREORDERED_SETS" );
