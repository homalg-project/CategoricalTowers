# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

#! @Chapter Free distributive completion of a finitely presented category

####################################
#
#! @Section &GAP; Categories
#
####################################

#! @Description
#!  The &GAP; category of a free distributive completion category.
#! @Arguments category
DeclareCategory( "IsFreeDistributiveCompletion",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a free distributive completion category.
#! @Arguments cell
DeclareCategory( "IsCellInFreeDistributiveCompletion",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a free distributive completion category.
#! @Arguments obj
DeclareCategory( "IsObjectInFreeDistributiveCompletion",
        IsCellInFreeDistributiveCompletion and
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a free distributive completion category.
#! @Arguments mor
DeclareCategory( "IsMorphismInFreeDistributiveCompletion",
        IsCellInFreeDistributiveCompletion and
        IsCapCategoryMorphism );

####################################
#
#! @Section Attributes
#
####################################

#! @Arguments finite_completion
DeclareAttribute( "UnderlyingCategory",
        IsFreeDistributiveCompletion );

#! @Arguments finite_completion
#! @Returns a &CAP; functor
DeclareAttribute( "EmbeddingOfUnderlyingCategory",
        IsFreeDistributiveCompletion );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct a free distributive completion category.
#! @Returns a &CAP; category
#! @Arguments B
#! @Group FreeDistributiveCompletion
DeclareOperation( "FreeDistributiveCompletion",
        [ IsCapCategory ] );

#! @Arguments B, H
#! @Group FreeDistributiveCompletion
DeclareOperationWithCache( "FreeDistributiveCompletion",
        [ IsCapCategory, IsCapCategory ] );
