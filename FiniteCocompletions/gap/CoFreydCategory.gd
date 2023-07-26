# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Declarations
#

#! @Chapter Kernel closure

####################################
#
#! @Section Constructors
#
####################################

DeclareAttribute( "EmbeddingOfUnderlyingCategoryData",
        IsCoFreydCategory );

#! @Description
#!  The full embedding functor from the additive category $C$ underlying
#!  the co-Freyd (=kernel closure) category <A>KC</A> into <A>KC</A>.
#! @Arguments KC
#! @Returns a &CAP; functor
DeclareAttribute( "EmbeddingOfUnderlyingCategory",
        IsCoFreydCategory );

DeclareOperation( "ExtendFunctorToCoFreydCategoryData",
        [ IsCoFreydCategory, IsList, IsAdditiveCategory ] );

#! @Description
#!  The full embedding functor from the additive category $C$ underlying
#!  the kernel closure category <A>FC</A> into <A>FC</A>.
#! @Arguments AC
#! @Returns a &CAP; functor
DeclareAttribute( "ExtendFunctorToCoFreydCategory",
        IsCapFunctor );
