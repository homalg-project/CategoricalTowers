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

#! @Section GAP Properties

#! @Description
#!  The property of <A>C</A> being a thin &CAP; category.
#! @Arguments C
DeclareProperty( "IsThinCategory",
                 IsCapCategory );

#! @Description
#!  The property of <A>C</A> being a skeletal &CAP; category.
#! @Arguments C
DeclareProperty( "IsSkeletalCategory",
                 IsCapCategory );

#! @Section Operations

#! @Description
#!  Check if <A>A</A> is bigger than <A>B</A> w.r.t. the preorder.
#! @Arguments A, B
#! @Returns <C>true</C> or <C>false</C>
DeclareOperation( "IsSubset",
        [ IsObjectInThinCategory, IsObjectInThinCategory ] );

#! @Section Constructors

#! @Description
#!  Construct the unique morphism with source <A>A</A> and target <A>B</A>.
#! @Arguments A, B
#! @Returns a &CAP; morphism
DeclareOperation( "UniqueMorphism",
        [ IsObjectInThinCategory, IsObjectInThinCategory ] );

# @Section Tools

DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_PREORDERED_SETS" );
