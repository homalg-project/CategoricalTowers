#
# Locales: Co-Heyting algebras
#
# Declarations
#

#! @Chapter Co-Heyting algebras

#! @Section Operations

##
#! @Description
#! The argument is an object $a$.
#! The output is its co-negated object $\ulcorner a$.
#! @Returns an object
#! @Arguments a
DeclareAttribute( "ConegationOnObjects",
                  IsCapCategoryObject );

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation <C>ConegationOnObjects</C>.
#! $F: a \mapsto \ulcorner a$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddConegationOnObjects",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddConegationOnObjects",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddConegationOnObjects",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddConegationOnObjects",
                  [ IsCapCategory, IsList ] );

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

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation <C>ConegationOnMorphismsWithGivenConegations</C>.
#! $F: (\ulcorner b,\alpha,\ulcorner a) \mapsto \ulcorner \alpha$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddConegationOnMorphismsWithGivenConegations",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddConegationOnMorphismsWithGivenConegations",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddConegationOnMorphismsWithGivenConegations",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddConegationOnMorphismsWithGivenConegations",
                  [ IsCapCategory, IsList ] );

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

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation <C>MorphismFromDoubleConegationWithGivenDoubleConegation</C>.
#! $F: (a, \ulcorner\ulcorner a) \mapsto (\ulcorner\ulcorner a \rightarrow a)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddMorphismFromDoubleConegationWithGivenDoubleConegation",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddMorphismFromDoubleConegationWithGivenDoubleConegation",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddMorphismFromDoubleConegationWithGivenDoubleConegation",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddMorphismFromDoubleConegationWithGivenDoubleConegation",
                  [ IsCapCategory, IsList ] );

# @Section Tools

DeclareGlobalVariable( "COHEYTING_ALGEBRA_METHOD_NAME_RECORD" );

DeclareGlobalVariable( "CAP_INTERNAL_COHEYTING_ALGEBRAS_BASIC_OPERATIONS" );

DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_COHEYTING_ALGEBRAS" );
