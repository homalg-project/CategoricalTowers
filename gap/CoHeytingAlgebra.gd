# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Declarations
#

#! @Chapter Co-Heyting algebras

#! @Section Properties

#! @Description
#!  The property of <A>C</A> being a co-Heyting algebroid.
#! @Arguments C
AddCategoricalProperty( [ "IsCoHeytingAlgebroid", "IsHeytingAlgebroid" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCoHeytingAlgebroid :=
  DuplicateFreeList( Concatenation(
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsDistributiveBicartesianProset,
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCocartesianCoclosedCategory ) );

#! @Description
#!  The property of <A>C</A> being a co-Heyting algebra.
#! @Arguments C
AddCategoricalProperty( [ "IsCoHeytingAlgebra", "IsHeytingAlgebra" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCoHeytingAlgebra :=
  DuplicateFreeList( Concatenation(
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCoHeytingAlgebroid,
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsPosetCategory ) );

#! @Section Operations

##
#! @Description
#! The argument is an object $a$.
#! The output is its co-negated object $\ulcorner a$.
#! @Returns an object
#! @Arguments a
DeclareAttribute( "ConegationOnObjects",
                  IsCapCategoryObject );

##
#! @Description
#! The argument is a morphism $\alpha: a \rightarrow b$.
#! The output is its negated morphism $\ulcorner \alpha: \ulcorner b \rightarrow \ulcorner a$.
#! @Returns a morphism in $\mathrm{Hom}( \ulcorner b, \ulcorner a )$.
#! @Arguments alpha
DeclareAttribute( "ConegationOnMorphisms",
                  IsCapCategoryMorphism );

#! @Description
#! The argument is an object $s = \ulcorner b$,
#! a morphism $\alpha: a \rightarrow b$,
#! and an object $r = \ulcorner a$.
#! The output is the negated morphism $\ulcorner \alpha: \ulcorner b \rightarrow \ulcorner a$.
#! @Returns a morphism in $\mathrm{Hom}( \ulcorner b, \ulcorner a )$.
#! @Arguments s,alpha,r
DeclareOperation( "ConegationOnMorphismsWithGivenConegations",
                  [ IsCapCategoryObject, IsCapCategoryMorphism, IsCapCategoryObject ] );

##
#! @Description
#! The argument is an object $a$.
#! The output is the morphism from the double conegation $\ulcorner\ulcorner a \rightarrow a$.
#! @Returns a morphism in $\mathrm{Hom}(\ulcorner\ulcorner a, a)$.
#! @Arguments a
DeclareAttribute( "MorphismFromDoubleConegation",
                  IsCapCategoryObject );

#! @Description
#! The arguments are an object $a$,
#! and an object $r = \ulcorner\ulcorner a$.
#! The output is the morphism from the double conegation $\ulcorner\ulcorner a \rightarrow a$.
#! @Returns a morphism in $\mathrm{Hom}(\ulcorner\ulcorner a, a)$.
#! @Arguments a, r
DeclareOperation( "MorphismFromDoubleConegationWithGivenDoubleConegation",
                  [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Section Stable internal coHom

#! @Description
#!  Return the stable internal coHom: $\mathrm{\underline{coHom}}(\mathrm{\underline{coHom}}(...\mathrm{\underline{coHom}}(V,W)...,W),W)$.
#! @Arguments V, W
#! @Returns a &CAP; object
DeclareOperation( "StableInternalCoHom",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

# @Section Tools

DeclareGlobalVariable( "COHEYTING_ALGEBRA_METHOD_NAME_RECORD" );

DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_COHEYTING_ALGEBRAS" );
