#
# CategoryConstructor: Category constructor
#
# Declarations
#

#! @Chapter Tools

DeclareGlobalVariable( "CATEGORY_CONSTRUCTOR_METHOD_NAME_RECORD" );

DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_CATEGORY_CONSTRUCTOR" );

###################################
##
#! @Section EmbeddingOfSumOfImagesOfAllMorphisms
##
###################################

#! @Description
#!  Return a morphism onto the sum of images of all morphisms between <A>a</A> and <A>b</A>.
#! @Arguments a, b
#! @Returns a morphism
DeclareOperation( "MorphismOntoSumOfImagesOfAllMorphisms",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#!  The arguments are a category $C$ and a function $F$.
#!  This operation adds the given function $F$
#!  to the category for the basic operation <C>MorphismOntoSumOfImagesOfAllMorphisms</C>.
#!  $F: A, B \mapsto \mathrm{MorphismOntoSumOfImagesOfAllMorphisms}(A, B)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddMorphismOntoSumOfImagesOfAllMorphisms",
        [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddMorphismOntoSumOfImagesOfAllMorphisms",
        [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddMorphismOntoSumOfImagesOfAllMorphisms",
        [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddMorphismOntoSumOfImagesOfAllMorphisms",
        [ IsCapCategory, IsList ] );

#! @Description
#!  Return the embedding of the sum of images of all morphisms between <A>a</A> and <A>b</A>.
#! @Arguments a, b
#! @Returns a morphism
DeclareOperation( "EmbeddingOfSumOfImagesOfAllMorphisms",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#!  The arguments are a category $C$ and a function $F$.
#!  This operation adds the given function $F$
#!  to the category for the basic operation <C>EmbeddingOfSumOfImagesOfAllMorphisms</C>.
#!  $F: A, B \mapsto \mathrm{EmbeddingOfSumOfImagesOfAllMorphisms}(A, B)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddEmbeddingOfSumOfImagesOfAllMorphisms",
        [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddEmbeddingOfSumOfImagesOfAllMorphisms",
        [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddEmbeddingOfSumOfImagesOfAllMorphisms",
        [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddEmbeddingOfSumOfImagesOfAllMorphisms",
        [ IsCapCategory, IsList ] );

#! @Description
#!  Return the sum of images of all morphisms between <A>a</A> and <A>b</A>.
#! @Arguments a, b
#! @Returns a morphism
DeclareOperation( "SumOfImagesOfAllMorphisms",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#!  The arguments are a category $C$ and a function $F$.
#!  This operation adds the given function $F$
#!  to the category for the basic operation <C>SumOfImagesOfAllMorphisms</C>.
#!  $F: A, B \mapsto \mathrm{SumOfImagesOfAllMorphisms}(A, B)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddSumOfImagesOfAllMorphisms",
        [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddSumOfImagesOfAllMorphisms",
        [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddSumOfImagesOfAllMorphisms",
        [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddSumOfImagesOfAllMorphisms",
        [ IsCapCategory, IsList ] );

####################################
#
#! @Section Operations
#
####################################
