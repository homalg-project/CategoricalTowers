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

