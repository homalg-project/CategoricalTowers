# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Declarations
#

#! @Chapter Cokernel closure

####################################
#
#! @Section Constructors
#
####################################

DeclareAttribute( "EmbeddingOfUnderlyingCategoryData",
        IsFreydCategory );

#! @Description
#!  The full embedding functor from the additive category $C$ underlying
#!  the Freyd (=cokernel closure) category <A>FC</A> into <A>FC</A>.
#! @Arguments FC
#! @Returns a &CAP; functor
DeclareAttribute( "EmbeddingOfUnderlyingCategory",
        IsFreydCategory );

DeclareOperation( "ExtendFunctorToFreydCategoryData",
        [ IsFreydCategory, IsList, IsAdditiveCategory ] );

#! @Description
#!  The full embedding functor from the additive category $C$ underlying
#!  the cokernel closure category <A>FC</A> into <A>FC</A>.
#! @Arguments AC
#! @Returns a &CAP; functor
DeclareAttribute( "ExtendFunctorToFreydCategory",
        IsCapFunctor );
