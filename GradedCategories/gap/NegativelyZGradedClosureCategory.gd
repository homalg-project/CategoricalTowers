# SPDX-License-Identifier: GPL-2.0-or-later
# GradedCategories: Graded closures of categories
#
# Declarations
#

#! @Chapter The negatively Z-graded closure of a category

####################################
#
#! @Section GAP Categories
#
####################################

#! @Description
#!  The &GAP; category of negatively Z-graded categories.
#! @Arguments object
DeclareCategory( "IsNegativelyZGradedClosureCategory",
        IsZGradedClosureCategoryWithBounds );

#! @Description
#!  The &GAP; category of cells in a negatively Z-graded category.
#! @Arguments object
DeclareCategory( "IsCellInNegativelyZGradedClosureCategory",
        IsCellInZGradedClosureCategoryWithBounds );

#! @Description
#!  The &GAP; category of objects in a negatively Z-graded category.
#! @Arguments object
DeclareCategory( "IsObjectInNegativelyZGradedClosureCategory",
        IsCellInNegativelyZGradedClosureCategory and
        IsObjectInZGradedClosureCategoryWithBounds );

#! @Description
#!  The &GAP; category of morphisms in a negatively Z-graded category.
#! @Arguments morphism
DeclareCategory( "IsMorphismInNegativelyZGradedClosureCategory",
        IsCellInNegativelyZGradedClosureCategory and
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
DeclareAttribute( "NegativelyZGradedClosureCategory",
        IsCapCategory );
