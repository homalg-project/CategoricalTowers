# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

#! @Chapter The category of quivers in a category

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct the category of quivers over the category <A>C</A>.
#! @Returns a &CAP; category
#! @Arguments C
DeclareAttribute( "CategoryOfQuivers",
        IsCapCategory );
#! @InsertChunk CategoryOfQuivers

#!
DeclareOperation( "CreateQuiverInCategory",
        [ IsCategoryOfQuivers, IsList ] );

#!
DeclareOperation( "CreateQuiverMorphismInCategory",
        [ IsObjectInCategoryOfQuivers, IsList ] );
