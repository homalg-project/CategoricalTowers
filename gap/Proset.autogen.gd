#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation <C>AreIsomorphicForObjectsIfIsHomSetInhabited</C>.
#! $F: A, B \mapsto \mathrm{AreIsomorphicForObjectsIfIsHomSetInhabited}(A, B)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddAreIsomorphicForObjectsIfIsHomSetInhabited",
        [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddAreIsomorphicForObjectsIfIsHomSetInhabited",
        [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddAreIsomorphicForObjectsIfIsHomSetInhabited",
        [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddAreIsomorphicForObjectsIfIsHomSetInhabited",
        [ IsCapCategory, IsList ] );

