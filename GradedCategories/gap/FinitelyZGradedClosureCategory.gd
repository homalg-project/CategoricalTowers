# SPDX-License-Identifier: GPL-2.0-or-later
# GradedCategories: Graded closures of categories
#
# Declarations
#

#! @Chapter The finitely Z-graded closure of a category

####################################
#
#! @Section GAP Categories
#
####################################

#! @Description
#!  The &GAP; category of finitely Z-graded categories.
#! @Arguments object
DeclareCategory( "IsFinitelyZGradedClosureCategory",
        IsZGradedClosureCategoryWithBounds );

#! @Description
#!  The &GAP; category of cells in a finitely Z-graded category.
#! @Arguments object
DeclareCategory( "IsCellInFinitelyZGradedClosureCategory",
        IsCellInZGradedClosureCategoryWithBounds );

#! @Description
#!  The &GAP; category of objects in a finitely Z-graded category.
#! @Arguments object
DeclareCategory( "IsObjectInFinitelyZGradedClosureCategory",
        IsCellInFinitelyZGradedClosureCategory and
        IsObjectInZGradedClosureCategoryWithBounds );

#! @Description
#!  The &GAP; category of morphisms in a finitely Z-graded category.
#! @Arguments morphism
DeclareCategory( "IsMorphismInFinitelyZGradedClosureCategory",
        IsCellInFinitelyZGradedClosureCategory and
        IsMorphismInZGradedClosureCategoryWithBounds );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct the negatively $Z$-graded closure of the category <A>C</A>.
#! @Arguments C
#! @Returns a &CAP; category
DeclareAttribute( "FinitelyZGradedClosureCategory",
        IsCapCategory );
#! @InsertChunk FinitelyZGradedClosureCategory
