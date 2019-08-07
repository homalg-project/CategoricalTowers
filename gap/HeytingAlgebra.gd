#
# Locales: Heyting algebras
#
# Declarations
#

#! @Chapter Heyting algebras

#! @Section Operations

##
#! @Description
#! The argument is an object $a$.
#! The output is its negated object $\neg a$.
#! @Returns an object
#! @Arguments a
DeclareAttribute( "NegationOnObjects",
                  IsCapCategoryObject );

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation <C>NegationOnObjects</C>.
#! $F: a \mapsto \neg a$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddNegationOnObjects",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddNegationOnObjects",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddNegationOnObjects",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddNegationOnObjects",
                  [ IsCapCategory, IsList ] );

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

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation <C>NegationOnMorphismsWithGivenNegations</C>.
#! $F: (\neg b,\alpha,\neg a) \mapsto \neg \alpha$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddNegationOnMorphismsWithGivenNegations",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddNegationOnMorphismsWithGivenNegations",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddNegationOnMorphismsWithGivenNegations",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddNegationOnMorphismsWithGivenNegations",
                  [ IsCapCategory, IsList ] );

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

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation <C>MorphismToDoubleNegationWithGivenDoubleNegation</C>.
#! $F: (a, \neg\neg a) \mapsto (a \rightarrow \neg\neg a)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddMorphismToDoubleNegationWithGivenDoubleNegation",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddMorphismToDoubleNegationWithGivenDoubleNegation",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddMorphismToDoubleNegationWithGivenDoubleNegation",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddMorphismToDoubleNegationWithGivenDoubleNegation",
                  [ IsCapCategory, IsList ] );

# @Section Tools

DeclareGlobalVariable( "HEYTING_ALGEBRA_METHOD_NAME_RECORD" );

DeclareGlobalVariable( "CAP_INTERNAL_HEYTING_ALGEBRAS_BASIC_OPERATIONS" );

DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_HEYTING_ALGEBRAS" );
