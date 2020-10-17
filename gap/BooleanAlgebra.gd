# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Declarations
#

#! @Chapter Boolean algebras

#! @Section GAP Properties

#! @Description
#!  The property of <A>C</A> being a cartesian closed &CAP; category with isomorphic double negations.
#! @Arguments C
AddCategoricalProperty( [ "IsCartesianClosedCategoryWithIsomorphicDoubleNegations" ] );

#! @Description
#!  The property of <A>C</A> being a cocartesian coclosed &CAP; category with isomorphic double conegations.
#! @Arguments C
AddCategoricalProperty( [ "IsCocartesianCoclosedCategoryWithIsomorphicDoubleConegations" ] );

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

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation <C>MorphismFromDoubleNegationWithGivenDoubleNegation</C>.
#! $F: (a, \neg\neg a) \mapsto (\neg\neg a \rightarrow a)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddMorphismFromDoubleNegationWithGivenDoubleNegation",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddMorphismFromDoubleNegationWithGivenDoubleNegation",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddMorphismFromDoubleNegationWithGivenDoubleNegation",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddMorphismFromDoubleNegationWithGivenDoubleNegation",
                  [ IsCapCategory, IsList ] );

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

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation <C>MorphismToDoubleConegationWithGivenDoubleConegation</C>.
#! $F: (a, \ulcorner\ulcorner a) \mapsto (a \rightarrow \ulcorner\ulcorner a)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddMorphismToDoubleConegationWithGivenDoubleConegation",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddMorphismToDoubleConegationWithGivenDoubleConegation",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddMorphismToDoubleConegationWithGivenDoubleConegation",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddMorphismToDoubleConegationWithGivenDoubleConegation",
                  [ IsCapCategory, IsList ] );

# @Section Tools

DeclareGlobalVariable( "BOOLEAN_ALGEBRA_METHOD_NAME_RECORD" );

DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_BOOLEAN_ALGEBRAS" );
