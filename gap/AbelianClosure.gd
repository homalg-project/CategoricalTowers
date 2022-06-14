# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

#! @Chapter Free Abelian category of a finitely presented category

####################################
#
#! @Section &GAP; Categories
#
####################################

#! @Description
#!  The &GAP; category of an Abelian closure category.
#! @Arguments category
DeclareCategory( "IsAbelianClosure",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in an Abelian closure category.
#! @Arguments cell
DeclareCategory( "IsCellInAbelianClosure",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in an Abelian closure category.
#! @Arguments obj
DeclareCategory( "IsObjectInAbelianClosure",
        IsCellInAbelianClosure and
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in an Abelian closure category.
#! @Arguments mor
DeclareCategory( "IsMorphismInAbelianClosure",
        IsCellInAbelianClosure and
        IsCapCategoryMorphism );

####################################
#
#! @Section Attributes
#
####################################

#! @Arguments finite_cocompletion
DeclareAttribute( "UnderlyingCategory",
        IsAbelianClosure );

#! @Arguments finite_cocompletion
DeclareAttribute( "YonedaEmbeddingOfUnderlyingCategory",
        IsAbelianClosure );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct an Abelian closure category.
#! @Returns a &CAP; category
#! @Arguments B
#! @Group FunctorCategory
DeclareOperation( "AbelianClosure",
        [ IsAlgebroid ] );

DeclareOperationWithCache( "AbelianClosure",
        [ IsAlgebroid, IsCapCategory ] );
