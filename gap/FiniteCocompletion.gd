# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

#! @Chapter Finite cocompletion of a finitely presented category

####################################
#
#! @Section &GAP; Categories
#
####################################

#! @Description
#!  The &GAP; category of a finite cocompletion category.
#! @Arguments category
DeclareCategory( "IsFiniteCocompletion",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a finite cocompletion category.
#! @Arguments cell
DeclareCategory( "IsCellInFiniteCocompletion",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a finite cocompletion category.
#! @Arguments obj
DeclareCategory( "IsObjectInFiniteCocompletion",
        IsCellInFiniteCocompletion and
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a finite cocompletion category.
#! @Arguments mor
DeclareCategory( "IsMorphismInFiniteCocompletion",
        IsCellInFiniteCocompletion and
        IsCapCategoryMorphism );

####################################
#
#! @Section Attributes
#
####################################

#! @Arguments finite_cocompletion
DeclareAttribute( "UnderlyingCategory",
        IsFiniteCocompletion );

#! @Arguments finite_cocompletion
DeclareAttribute( "YonedaEmbeddingOfUnderlyingCategory",
        IsFiniteCocompletion );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct a finite cocompletion category.
#! @Returns a &CAP; category
#! @Arguments B
#! @Group FunctorCategory
DeclareOperation( "FiniteCocompletion",
        [ IsCapCategory ] );

DeclareOperationWithCache( "FiniteCocompletion",
        [ IsCapCategory, IsCapCategory ] );
