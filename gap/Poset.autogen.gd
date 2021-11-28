#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation <C>IsEqualForObjectsIfIsHomSetInhabited</C>.
#! $F: A, B \mapsto \mathrm{IsEqualForObjectsIfIsHomSetInhabited}(A, B)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddIsEqualForObjectsIfIsHomSetInhabited",
        [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddIsEqualForObjectsIfIsHomSetInhabited",
        [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddIsEqualForObjectsIfIsHomSetInhabited",
        [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddIsEqualForObjectsIfIsHomSetInhabited",
        [ IsCapCategory, IsList ] );

