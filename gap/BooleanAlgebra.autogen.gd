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
