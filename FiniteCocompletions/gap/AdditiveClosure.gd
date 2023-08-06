# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Declarations
#

#! @Chapter Strict additive closure

####################################
#
#! @Section Constructors
#
####################################

DeclareAttribute( "EmbeddingOfUnderlyingCategoryData",
        IsAdditiveClosureCategory );

#! @Description
#!  The full embedding functor from the pre-abelian category $C$ underlying
#!  the strict additive closure category <A>SC</A> into <A>SC</A>.
#! @Arguments SC
#! @Returns a &CAP; functor
DeclareAttribute( "EmbeddingOfUnderlyingCategory",
        IsAdditiveClosureCategory );

DeclareOperation( "ExtendFunctorToFiniteStrictCoproductCocompletionData",
        [ IsAdditiveClosureCategory, IsList, IsAdditiveCategory ] );

#! @Description
#!  The full embedding functor from the preadditive category $C$ underlying
#!  the strict additive closure category <A>SC</A> into <A>SC</A>.
#! @Arguments SC
#! @Returns a &CAP; functor
DeclareAttribute( "ExtendFunctorToStrictAdditiveClosure",
        IsCapFunctor );
