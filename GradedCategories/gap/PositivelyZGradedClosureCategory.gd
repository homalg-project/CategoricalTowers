# SPDX-License-Identifier: GPL-2.0-or-later
# GradedCategories: Graded closures of categories
#
# Declarations
#

#! @Chapter The positively Z-graded closure of a category

####################################
#
#! @Section GAP Categories
#
####################################

#! @Description
#!  The &GAP; category of positively Z-graded categories.
#! @Arguments object
DeclareCategory( "IsPositivelyZGradedClosureCategory",
        IsZGradedClosureCategoryWithBounds );

#! @Description
#!  The &GAP; category of cells in a positively Z-graded category.
#! @Arguments object
DeclareCategory( "IsCellInPositivelyZGradedClosureCategory",
        IsCellInZGradedClosureCategoryWithBounds );

#! @Description
#!  The &GAP; category of objects in a positively Z-graded category.
#! @Arguments object
DeclareCategory( "IsObjectInPositivelyZGradedClosureCategory",
        IsCellInPositivelyZGradedClosureCategory and
        IsObjectInZGradedClosureCategoryWithBounds );

#! @Description
#!  The &GAP; category of morphisms in a positively Z-graded category.
#! @Arguments morphism
DeclareCategory( "IsMorphismInPositivelyZGradedClosureCategory",
        IsCellInPositivelyZGradedClosureCategory and
        IsMorphismInZGradedClosureCategoryWithBounds );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct the positively $Z$-graded closure of the category <A>C</A>.
#! @Arguments C
#! @Returns a &CAP; category
DeclareAttribute( "PositivelyZGradedClosureCategory",
        IsCapCategory );
