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

###################################
##
#! @Section Systems of homogeneous linear equations in linear categories
##
###################################

##
DeclareOperation( "MereExistenceOfUniqueSolutionOfLinearSystemInAbCategoryOp",
                   [ IsList, IsList, IsList, IsCapCategory ] );

#! @Description
#! Like <C>SolveLinearSystemInAbCategory</C>,
#! but the output is simply <C>true</C> if a unique solution exists,
#! <C>false</C> otherwise.
#! @Returns a boolean
#! @Arguments left_coeffs, right_coeffs, right_side
DeclareOperation( "MereExistenceOfUniqueSolutionOfLinearSystemInAbCategory",
                   [ IsList, IsList, IsList ] );

DeclareOperation( "AddMereExistenceOfUniqueSolutionOfLinearSystemInAbCategory",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddMereExistenceOfUniqueSolutionOfLinearSystemInAbCategory",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddMereExistenceOfUniqueSolutionOfLinearSystemInAbCategory",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddMereExistenceOfUniqueSolutionOfLinearSystemInAbCategory",
                  [ IsCapCategory, IsList ] );

##
DeclareOperation( "MereExistenceOfUniqueSolutionOfHomogeneousLinearSystemInAbCategoryOp",
                   [ IsList, IsList, IsCapCategory ] );

#! @Description
#! but the output is <C>true</C> if the homogeneous system has only the trivial solution,
#! <C>false</C> otherwise.
#! @Returns a boolean
#! @Arguments left_coeffs, right_coeffs
DeclareOperation( "MereExistenceOfUniqueSolutionOfHomogeneousLinearSystemInAbCategory",
                   [ IsList, IsList ] );

DeclareOperation( "AddMereExistenceOfUniqueSolutionOfHomogeneousLinearSystemInAbCategory",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddMereExistenceOfUniqueSolutionOfHomogeneousLinearSystemInAbCategory",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddMereExistenceOfUniqueSolutionOfHomogeneousLinearSystemInAbCategory",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddMereExistenceOfUniqueSolutionOfHomogeneousLinearSystemInAbCategory",
                  [ IsCapCategory, IsList ] );

##
DeclareOperation( "BasisOfSolutionsOfHomogeneousLinearSystemInLinearCategoryOp",
                   [ IsList, IsList, IsCapCategory ] );

#! @Description
#! The arguments are two lists $\alpha$ and $\beta$ of morphisms in some linear category over commutative ring.
#! The first list $\alpha$ (the left coefficients) is a list of list of morphisms $\alpha_{ij}: A_i \rightarrow B_j$,
#! where $i = 1 \dots m$ and $j = 1 \dots n$ for integers $m,n \geq 1$.
#! The second list $\beta$ (the right coefficients) is a list of list of morphisms $\beta_{ij}: C_j \rightarrow D_i$,
#! where $i = 1 \dots m$ and $j = 1 \dots n$.
#! The output is either
#! a generating set $[X^1,\dots,X^t]$ for the solutions of the homogeneous linear system
#! defined by $\alpha$, $\beta$, i.e.,
#! $\sum_{j = 1}^n \alpha_{ij}\cdot X^{k}_{j} \cdot \beta_{ij} = 0$
#! for all $i = 1 \dots m$ and all $k = 1 \dots t$
#! or $\texttt{fail}$ if no such solution exists.
#! @Returns a list of lists of morphisms $[X^1, \dots, X^t]$
#! @Arguments alpha, beta
DeclareOperation( "BasisOfSolutionsOfHomogeneousLinearSystemInLinearCategory",
                   [ IsList, IsList ] );

DeclareOperation( "AddBasisOfSolutionsOfHomogeneousLinearSystemInLinearCategory",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddBasisOfSolutionsOfHomogeneousLinearSystemInLinearCategory",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddBasisOfSolutionsOfHomogeneousLinearSystemInLinearCategory",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddBasisOfSolutionsOfHomogeneousLinearSystemInLinearCategory",
                  [ IsCapCategory, IsList ] );

##
DeclareOperation( "BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategoryOp",
                   [ IsList, IsList, IsList, IsList, IsCapCategory ] );

#! @Description
#! The arguments are four lists $\alpha$, $\beta$, $\gamma$, $\delta$ of morphisms in some linear category over commutative ring.
#! Each of $\alpha$ and $\gamma$ is a list of list of morphisms $\alpha_{ij}, \gamma_{ij}: A_i \rightarrow B_j$,
#! where $i = 1 \dots m$ and $j = 1 \dots n$ for integers $m,n \geq 1$.
#! Each of $\beta$ and $\delta$ is also a list of list of morphisms $\beta_{ij}, \delta_{ij}: C_j \rightarrow D_i$,
#! where $i = 1 \dots m$ and $j = 1 \dots n$.
#! The output is either
#! a generating set $[X^1,\dots,X^t]$ for the solutions of the homogeneous linear system
#! defined by $\alpha$, $\beta$, $\gamma$ and $\delta$, i.e.,
#! $\sum_{j = 1}^n \alpha_{ij}\cdot X^{k}_{j} \cdot \beta_{ij} = \sum_{j = 1}^n \gamma_{ij}\cdot X^{k}_{j} \cdot \delta_{ij}$
#! for all $i = 1 \dots m$ and all $k = 1 \dots t$
#! or $\texttt{fail}$ if no such solution exists.
#! @Returns a list of lists of morphisms $[X^1, \dots, X^t]$
#! @Arguments alpha, beta, gamma, delta
DeclareOperation( "BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory",
                   [ IsList, IsList, IsList, IsList] );

DeclareOperation( "AddBasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddBasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddBasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddBasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory",
                  [ IsCapCategory, IsList ] );


####################################
#
#! @Section Operations
#
####################################
