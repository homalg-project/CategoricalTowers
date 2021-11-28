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
