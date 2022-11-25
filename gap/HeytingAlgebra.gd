# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Declarations
#

#! @Chapter Heyting algebras

#! @Section Properties

#! @Description
#!  The property of <A>C</A> being a Heyting algebroid.
#! @Arguments C
DeclareProperty( "IsHeytingAlgebroid",
        IsCapCategory );

AddCategoricalProperty( [ "IsHeytingAlgebroid", "IsCoHeytingAlgebroid" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsHeytingAlgebroid :=
  DuplicateFreeList( Concatenation(
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsDistributiveBicartesianProset,
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCartesianClosedCategory ) );

#! @Description
#!  The property of <A>C</A> being a Heyting algebra.
#! @Arguments C
DeclareProperty( "IsHeytingAlgebra",
        IsCapCategory );

AddCategoricalProperty( [ "IsHeytingAlgebra", "IsCoHeytingAlgebra" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsHeytingAlgebra :=
  DuplicateFreeList( Concatenation(
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsHeytingAlgebroid,
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsPosetCategory ) );

#! @Section Operations

##
#! @Description
#! The argument is an object $a$.
#! The output is its negated object $\neg a$.
#! @Returns an object
#! @Arguments a
DeclareAttribute( "NegationOnObjects",
                  IsCapCategoryObject );

##
#! @Description
#! The argument is a morphism $\alpha: a \rightarrow b$.
#! The output is its negated morphism $\neg \alpha: \neg b \rightarrow \neg a$.
#! @Returns a morphism in $\mathrm{Hom}( \neg b, \neg a )$.
#! @Arguments alpha
DeclareAttribute( "NegationOnMorphisms",
                  IsCapCategoryMorphism );

#! @Description
#! The argument is an object $s = \neg b$,
#! a morphism $\alpha: a \rightarrow b$,
#! and an object $r = \neg a$.
#! The output is the negated morphism $\neg \alpha: \neg b \rightarrow \neg a$.
#! @Returns a morphism in $\mathrm{Hom}( \neg b, \neg a )$.
#! @Arguments s,alpha,r
DeclareOperation( "NegationOnMorphismsWithGivenNegations",
                  [ IsCapCategoryObject, IsCapCategoryMorphism, IsCapCategoryObject ] );

##
#! @Description
#! The argument is an object $a$.
#! The output is the morphism to the double negation $a \rightarrow \neg\neg a$.
#! @Returns a morphism in $\mathrm{Hom}(a, \neg\neg a)$.
#! @Arguments a
DeclareAttribute( "MorphismToDoubleNegation",
                  IsCapCategoryObject );

#! @Description
#! The arguments are an object $a$,
#! and an object $r = \neg\neg a$.
#! The output is the morphism to the double negation $a \rightarrow \neg\neg a$.
#! @Returns a morphism in $\mathrm{Hom}(a, \neg\neg a)$.
#! @Arguments a, r
DeclareOperation( "MorphismToDoubleNegationWithGivenDoubleNegation",
                  [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Section Stable internal Hom

#! @Description
#!  Return the stable internal Hom: $\mathrm{\underline{Hom}}(J,\mathrm{\underline{Hom}}(J,...\mathrm{\underline{Hom}}(J,I)...))$.
#! @Arguments J, I
#! @Returns a &CAP; object
DeclareOperation( "StableInternalHom",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

# @Section Tools

DeclareGlobalVariable( "HEYTING_ALGEBRA_METHOD_NAME_RECORD" );

DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_HEYTING_ALGEBRAS" );
