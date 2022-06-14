# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

#! @Chapter Finite completion of a finitely presented category

####################################
#
#! @Section &GAP; Categories
#
####################################

#! @Description
#!  The &GAP; category of a finite completion category.
#! @Arguments category
DeclareCategory( "IsFiniteCompletion",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a finite completion category.
#! @Arguments cell
DeclareCategory( "IsCellInFiniteCompletion",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a finite completion category.
#! @Arguments obj
DeclareCategory( "IsObjectInFiniteCompletion",
        IsCellInFiniteCompletion and
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a finite completion category.
#! @Arguments mor
DeclareCategory( "IsMorphismInFiniteCompletion",
        IsCellInFiniteCompletion and
        IsCapCategoryMorphism );

####################################
#
#! @Section Attributes
#
####################################

#! @Arguments finite_completion
DeclareAttribute( "UnderlyingCategory",
        IsFiniteCompletion );

#! @Arguments finite_completion
DeclareAttribute( "YonedaEmbeddingOfUnderlyingCategory",
        IsFiniteCompletion );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct a finite completion category.
#! @Returns a &CAP; category
#! @Arguments B
#! @Group FunctorCategory
DeclareOperation( "FiniteCompletion",
        [ IsCapCategory ] );

DeclareOperationWithCache( "FiniteCompletion",
        [ IsCapCategory, IsCapCategory ] );
