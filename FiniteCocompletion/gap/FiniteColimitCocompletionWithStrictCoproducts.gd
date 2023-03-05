# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

#! @Chapter The finite colimit cocompletion (with strict coproducts) of a category

####################################
#
#! @Section &GAP; Categories
#
####################################

#! @Description
#!  The &GAP; category of finite colimit cocompletions (with strict coproducts) of categories.
#! @Arguments category
DeclareCategory( "IsFiniteColimitCocompletionWithStrictCoproducts",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in the finite colimit cocompletion (with strict coproducts) of a category.
#! @Arguments cell
DeclareCategory( "IsCellInFiniteColimitCocompletionWithStrictCoproducts",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in the finite colimit cocompletion (with strict coproducts) of a category.
#! @Arguments obj
DeclareCategory( "IsObjectInFiniteColimitCocompletionWithStrictCoproducts",
        IsCellInFiniteColimitCocompletionWithStrictCoproducts and
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in the finite colimit cocompletion (with strict coproducts) of a category.
#! @Arguments mor
DeclareCategory( "IsMorphismInFiniteColimitCocompletionWithStrictCoproducts",
        IsCellInFiniteColimitCocompletionWithStrictCoproducts and
        IsCapCategoryMorphism );

####################################
#
#! @Section Attributes
#
####################################

#! @Arguments quiver
DeclareAttribute( "DefiningPairOfQuiverInCategory",
        IsObjectInFiniteColimitCocompletionWithStrictCoproducts );

#! @Arguments quiver_morphism
DeclareAttribute( "DefiningPairOfQuiverMorphismInCategory",
        IsMorphismInFiniteColimitCocompletionWithStrictCoproducts );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct the finite colimit cocompletion (with strict coproducts) of the category <A>C</A>.
#! @Returns a &CAP; category
#! @Arguments C
DeclareAttribute( "FiniteColimitCocompletionWithStrictCoproducts",
        IsCapCategory );
#! @InsertChunk FinBouquetsAsFiniteColimitCocompletion
#! @InsertChunk FinReflexiveQuiversAsFiniteColimitCocompletion

#!
DeclareOperation( "CreateColimitDiagram",
        [ IsFiniteColimitCocompletionWithStrictCoproducts, IsList ] );

#!
DeclareOperation( "CreateMorphismOfColimitDiagrams",
        [ IsObjectInFiniteColimitCocompletionWithStrictCoproducts, IsList ] );
