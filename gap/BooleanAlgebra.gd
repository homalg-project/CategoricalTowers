# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Declarations
#

#! @Chapter Boolean algebras

#! @Section GAP Properties

#! @Section Properties

#! @Description
#!  The property of <A>C</A> being a bi-Heyting algebroid.
#! @Arguments C
AddCategoricalProperty( [ "IsBiHeytingAlgebroid", "IsBiHeytingAlgebroid" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsBiHeytingAlgebroid :=
  DuplicateFreeList( Concatenation(
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsHeytingAlgebroid,
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCoHeytingAlgebroid ) );

#! @Description
#!  The property of <A>C</A> being a bi-Heyting algebra.
#! @Arguments C
AddCategoricalProperty( [ "IsBiHeytingAlgebra", "IsBiHeytingAlgebra" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsBiHeytingAlgebra :=
  DuplicateFreeList( Concatenation(
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsBiHeytingAlgebroid,
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsPosetCategory ) );

#! @Description
#!  The property of <A>C</A> being a Boolean algebroid.
#! @Arguments C
AddCategoricalProperty( [ "IsBooleanAlgebroid", "IsBooleanAlgebroid" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsBooleanAlgebroid :=
  DuplicateFreeList( Concatenation( [
          "MorphismFromDoubleNegationWithGivenDoubleNegation",
          "MorphismToDoubleConegationWithGivenDoubleConegation",
          ],
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsBiHeytingAlgebroid ) );

#! @Description
#!  The property of <A>C</A> being a Boolean algebra.
#! @Arguments C
AddCategoricalProperty( [ "IsBooleanAlgebra", "IsBooleanAlgebra" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsBooleanAlgebra :=
  DuplicateFreeList( Concatenation(
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsBooleanAlgebroid,
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsPosetCategory ) );

#! @Section Operations

##
#! @Description
#! The argument is an object $a$.
#! The output is the inverse $\neg\neg a \rightarrow a$ of the morphism to the double negation.
#! @Returns a morphism in $\mathrm{Hom}(\neg\neg a, a)$.
#! @Arguments a
DeclareAttribute( "MorphismFromDoubleNegation",
                  IsCapCategoryObject );

#! @Description
#! The argument is an object $a$,
#! and an object $s = \neg\neg a$.
#! The output is the inverse $\neg\neg a \rightarrow a$ of the morphism to the double negation.
#! @Returns a morphism in $\mathrm{Hom}(\neg\neg a, a)$.
#! @Arguments a, s
DeclareOperation( "MorphismFromDoubleNegationWithGivenDoubleNegation",
                  [ IsCapCategoryObject, IsCapCategoryObject ] );

##
#! @Description
#! The argument is an object $a$.
#! The output is the inverse $a \rightarrow \ulcorner\ulcorner a$ of the morphism from the double conegation.
#! @Returns a morphism in $\mathrm{Hom}(a, \ulcorner\ulcorner a)$.
#! @Arguments a
DeclareAttribute( "MorphismToDoubleConegation",
                  IsCapCategoryObject );

#! @Description
#! The argument is an object $a$,
#! and an object $r = \ulcorner\ulcorner a$.
#! The output is the inverse $a \rightarrow \ulcorner\ulcorner a$ of the morphism from the double conegation.
#! @Returns a morphism in $\mathrm{Hom}(a, \ulcorner\ulcorner a)$.
#! @Arguments a, s
DeclareOperation( "MorphismToDoubleConegationWithGivenDoubleConegation",
                  [ IsCapCategoryObject, IsCapCategoryObject ] );

# @Section Tools

DeclareGlobalVariable( "BOOLEAN_ALGEBRA_METHOD_NAME_RECORD" );

DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_BOOLEAN_ALGEBRAS" );
