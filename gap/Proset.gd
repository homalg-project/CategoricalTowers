#
# Locales: Prosets (preordered sets)
#
# Declarations
#

#! @Chapter Prosets (preordered sets)

#! Prosets are thin categories, i.e., each Hom-set is either a singleton or empty.

#! @Section Info Class
DeclareInfoClass( "InfoLocales" );

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of objects in a thin &CAP; category.
#! @Arguments object
DeclareCategory( "IsObjectInThinCategory",
                 IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a thin &CAP; category.
#! @Arguments morphism
DeclareCategory( "IsMorphismInThinCategory",
                 IsCapCategoryMorphism );

#! @Section GAP Properties

#! @Description
#!  The property of <A>C</A> being a thin &CAP; category.
#! @Arguments C
AddCategoricalProperty( [ "IsThinCategory" ] );

#! @Description
#!  The property of <A>C</A> being a skeletal &CAP; category.
#! @Arguments C
AddCategoricalProperty( [ "IsSkeletalCategory" ] );

#! @Section Operations

#! @Description
#!  Check if <A>B</A> is bigger than <A>A</A> w.r.t. the preorder.
#! @Arguments A, B
#! @Returns <C>true</C> or <C>false</C>
DeclareOperation( "IsHomSetInhabited",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation <C>IsHomSetInhabited</C>.
#! $F: A, B \mapsto \mathrm{IsHomSetInhabited}(A, B)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddIsHomSetInhabited",
        [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddIsHomSetInhabited",
        [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddIsHomSetInhabited",
        [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddIsHomSetInhabited",
        [ IsCapCategory, IsList ] );

#! @Description
#!  Check if <A>A</A> is equal to <A>B</A> under the assumption that
#!  <A>A</A> is known to be less or equal to <A>B</A> w.r.t. the preorder.
#! @Arguments A, B
#! @Returns <C>true</C> or <C>false</C>
DeclareOperation( "IsEqualForObjectsIfIsHomSetInhabited",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

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

#! @Section Constructors

#! @Description
#!  Construct the unique morphism with source <A>A</A> and target <A>B</A>.
#! @Arguments A, B
#! @Returns a &CAP; morphism
DeclareOperation( "UniqueMorphism",
        [ IsObjectInThinCategory, IsObjectInThinCategory ] );

# @Section Tools

DeclareGlobalVariable( "PROSET_METHOD_NAME_RECORD" );

DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_PREORDERED_SETS" );
