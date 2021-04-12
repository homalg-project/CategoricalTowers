# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# Declarations
#

#! @Chapter Tools

DeclareGlobalVariable( "CATEGORY_CONSTRUCTOR_METHOD_NAME_RECORD" );

DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_CATEGORY_CONSTRUCTOR" );

###################################
##
#! @Section PreInverse and PostInverse
##
###################################

#! @Description
#!  The argument is a morphism $\alpha: A \rightarrow B$.
#!  The output is the preinverse $\iota: B \rightarrow A$.
#! @Returns a morphism in $\mathrm{Hom}(B,A)$
#! @Arguments alpha
#! @Returns a morphism
DeclareOperation( "PreInverse",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#!  The arguments are a category $C$ and a function $F$.
#!  This operation adds the given function $F$
#!  to the category for the basic operation <C>PreInverse</C>.
#!  $F: A, B \mapsto \mathrm{PreInverse}(A, B)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddPreInverse",
        [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddPreInverse",
        [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddPreInverse",
        [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddPreInverse",
        [ IsCapCategory, IsList ] );

#! @Description
#!  The argument is a morphism $\alpha: A \rightarrow B$.
#!  The output is the postinverse $\iota: B \rightarrow A$.
#! @Returns a morphism in $\mathrm{Hom}(B,A)$
#! @Arguments alpha
#! @Returns a morphism
DeclareOperation( "PostInverse",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#!  The arguments are a category $C$ and a function $F$.
#!  This operation adds the given function $F$
#!  to the category for the basic operation <C>PostInverse</C>.
#!  $F: A, B \mapsto \mathrm{PostInverse}(A, B)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddPostInverse",
        [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddPostInverse",
        [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddPostInverse",
        [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddPostInverse",
        [ IsCapCategory, IsList ] );

###################################
##
#! @Section IsWeakTerminal
##
###################################

#! @Description
#! The argument is an object $a$ of a category $\mathbf{C}$.
#! The output is <C>true</C> if $a$ is weak terminal $\mathbf{C}$,
#! otherwise the output is <C>false</C>.
#! @Returns a boolean
#! @Arguments a
DeclareProperty( "IsWeakTerminal",
                 IsCapCategoryObject );

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation <C>IsWeakTerminal</C>.
#! $F: a \mapsto \mathtt{IsWeakTerminal}(a)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddIsWeakTerminal",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddIsWeakTerminal",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddIsWeakTerminal",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddIsWeakTerminal",
                  [ IsCapCategory, IsList ] );

###################################
##
#! @Section IsWeakInitial
##
###################################

#! @Description
#! The argument is an object $a$ of a category $\mathbf{C}$.
#! The output is <C>true</C> if $a$ is weak initial in $\mathbf{C}$,
#! otherwise the output is <C>false</C>.
#! @Returns a boolean
#! @Arguments a
DeclareProperty( "IsWeakInitial",
                 IsCapCategoryObject );

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation <C>IsWeakInitial</C>.
#! $F: a \mapsto \mathtt{IsWeakInitial}(a)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddIsWeakInitial",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddIsWeakInitial",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddIsWeakInitial",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddIsWeakInitial",
                  [ IsCapCategory, IsList ] );

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
                   [ IsList, IsList, IsList ] );

#! @Description
#! Like <C>SolveLinearSystemInAbCategory</C>,
#! but the output is simply <C>true</C> if a unique solution exists,
#! and <C>false</C> otherwise.
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
                   [ IsCapCategory, IsList, IsList ] );

#! @Description
#! but the output is <C>true</C> if the homogeneous system has only the trivial solution,
#! and <C>false</C> otherwise.
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
                   [ IsCapCategory, IsList, IsList ] );

#! @Description
#! The arguments are two lists of lists $\alpha$ and $\beta$ of morphisms in some linear category over commutative ring.
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
                   [ IsCapCategory, IsList, IsList, IsList, IsList ] );

#! @Description
#! The arguments are four lists of lists $\alpha$, $\beta$, $\gamma$, $\delta$ of morphisms in some linear category over commutative ring.
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

#! @Description
#! The arguments are two lists of lists $\alpha$, $\delta$ morphisms in some linear category
#! over commutative ring.
#! $\alpha$ is a list of list of morphisms $\alpha_{ij}:A_i \rightarrow B_j$ and
#! $\delta$ is a list of list of morphisms $\delta_{ij}:C_j \rightarrow D_i$,
#! where $i = 1 \dots m$ and $j = 1 \dots n$ for integers $m,n \geq 1$.
#! The method delegates to <C>BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory</C> applied on
#! $\alpha$, $\beta$, $\gamma$, $\delta$ where $\beta_{ij}$ equals <C>IdentityMorphism</C>(<C>Source</C>($\delta_{ij}$))
#! whenever $\delta_{ij}$ is endomorphism and equals to $0*\delta_{ij}$ otherwise; and
#! $\gamma_{ij}$ equals <C>IdentityMorphism</C>(<C>Source</C>($\alpha_{ij}$))
#! whenever $\alpha_{ij}$ is endomorphism and equals to $0*\alpha_{ij}$ otherwise for all
#! $i = 1 \dots m$ and $j = 1 \dots n$.
#! @Returns a list of lists of morphisms $[X^1, \dots, X^t]$
#! @Arguments alpha, delta
DeclareOperation( "BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory",
                   [ IsList, IsList ] );

####################################
#
#! @Section Operations
#
####################################

#!
DeclareOperation( "PostInverse",
        [ IsCapCategoryMorphism ] );

#!
DeclareOperation( "PreInverse",
        [ IsCapCategoryMorphism ] );
