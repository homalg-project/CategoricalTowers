# SPDX-License-Identifier: GPL-2.0-or-later
# ToolsForCategoricalTowers: Tools for CategoricalTowers
#
# Declarations
#

#! @Chapter Tools

####################################
#
# @Section Global variables
#
####################################

DeclareGlobalVariable( "RECORD_OF_COMPACT_NAMES_OF_CATEGORICAL_OPERATIONS" );

####################################
##
#! @Section Tools
##
####################################

DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_CATEGORY_CONSTRUCTOR" );

DeclareGlobalFunction( "RELATIVE_WEAK_BI_FIBER_PRODUCT_PREFUNCTION" );

DeclareGlobalFunction( "UNIVERSAL_MORPHISM_INTO_BIASED_RELATIVE_WEAK_FIBER_PRODUCT_PREFUNCTION" );

DeclareGlobalFunction( "CAP_INTERNAL_CORRESPONDING_WITH_GIVEN_OBJECTS_METHOD" );

DeclareGlobalFunction( "CAP_INTERNAL_COMPACT_NAME_OF_CATEGORICAL_OPERATION" );

#! @Description
#!  The input are two categories <A>C</A> and <A>H</A>.
#!  There is not output but the following side effects are applied to <A>C</A>:
#!  * <C>SetRangeCategoryOfHomomorphismStructure</C>( <A>C</A>, <A>H</A> )
#!  * <C>SetIsEquippedWithHomomorphismStructure</C>( <A>C</A>, <C>true</C> )
#!  
#!  Furthermore, if <C>IsCategoryWithDecidableLifts</C>( <A>H</A> ) then
#!  * <C>SetIsCategoryWithDecidableLifts</C>( <A>C</A>, <C>true</C> )
#!  * <C>SetIsCategoryWithDecidableColifts</C>( <A>C</A>, <C>true</C> )
#!
#!  An error is raised if <C>RangeCategoryOfHomomorphismStructure</C>( <A>C</A> )
#!  is already set.
#! @Arguments C, H
DeclareOperation( "SET_RANGE_CATEGORY_Of_HOMOMORPHISM_STRUCTURE",
        [ IsCapCategory, IsCapCategory ] );

#! @Description
#!  The function takes no arguments and returns the list of known doctrines.
#! @Returns a list
DeclareGlobalFunction( "ListKnownDoctrines" );
#! @InsertChunk ListKnownDoctrines

#! @Description
#!  The argument is a nonempty list <A>doctrine_names</A> of strings of doctrine names and the output
#!  is a dummy category created using <C>DummyCategory</C> which lies in the given doctrine.
#!  If the option `minimal` is set to true, then only a logically minimal subset of the doctrines is considered.
#! @Returns a &CAP; category
#! @Arguments doctrine_names
DeclareOperation( "DummyCategoryInDoctrines",
        [ IsList ] );
#! @InsertChunk DummyCategoryInDoctrines

####################################
##
#! @Section Properties
##
####################################

####################################
##
#! @Section Attributes
##
####################################

###################################
##
#! @Section Functors
##
###################################

##
DeclareOperation( "Subobject",
        [ IsCapCategoryMorphism ] );

DeclareOperationWithCache( "CovariantHomFunctorData",
        [ IsCapCategory, IsCapCategoryObject ] );

#! @Description
#!  The input is an object <A>o</A> in a category $C$.
#!  The output is the covariant Hom functor $\mathrm{Hom}$(<A>o</A>,-)
#!  from the category $C$ to <C>RangeCategoryOfHomomorphismStructure</C>( <A>C</A> ).
#! @Arguments o
#! @Returns a &CAP; functor
DeclareAttribute( "CovariantHomFunctor",
        IsCapCategoryObject );

DeclareAttribute( "GlobalSectionFunctorData",
        IsCapCategory );

#! @Description
#!  Returns the global section functor $\mathrm{Hom}(1,-)$ from the category <A>C</A>
#!  with terminal object $1$ to <C>RangeCategoryOfHomomorphismStructure</C>( <A>C</A> ).
#! @Arguments C
#! @Returns a &CAP; functor
DeclareAttribute( "GlobalSectionFunctor",
        IsCapCategory );

###################################
##
#! @Section Cell as evaluatable string
##
###################################

#! @Description
#!  The arguments is a category cell <A>c</A> and a list <A>list_of_evaluatable_strings</A>
#!  of string all which must be evalutable with <C>EvalString</C>.
#!  The output is a string <C>str</C> such that
#!  * <C>EvalString</C>( <C>str</C> ) = ObjectDatum( <A>c</A> ) if <A>c</A> is a category object, or
#!  * <C>EvalString</C>( <C>str</C> ) = MorphismDatum( <A>c</A> ) if <A>c</A> is a category morphism.
#!  
#!  The output string must, apart from the brackets, only consist of
#!  the substrings "<C>ObjectConstructor</C>", "<C>MorphismConstructor</C>"
#!  and the string in <A>list_of_evaluatable_strings</A>.
#! @Returns a string
#! @Arguments c, list_of_evaluatable_strings
DeclareOperation( "DatumOfCellAsEvaluatableString",
        [ IsCapCategoryCell, IsList ] );

#! @Description
#!  The arguments is a category cell <A>c</A> and a list <A>list_of_evaluatable_strings</A>
#!  of string all which must be evalutable with <C>EvalString</C>.
#!  The output is a string <C>str</C> such that
#!  * IsEqualForObjects( <C>EvalString</C>( <C>str</C> ), <A>c</A> ) if <A>c</A> is a category object, or
#!  * IsEqualForMorphismsOnMor( <C>EvalString</C>( <C>str</C> ), <A>c</A> ) if <A>c</A> is a category morphism.
#!  
#!  The output string must, apart from the brackets, only consist of
#!  the substrings "<C>ObjectConstructor</C>", "<C>MorphismConstructor</C>"
#!  and the string in <A>list_of_evaluatable_strings</A>.
#! @Returns a string
#! @Arguments c, list_of_evaluatable_strings
DeclareOperation( "CellAsEvaluatableString",
        [ IsCapCategoryCell, IsList ] );

#! @Chapter Futher CAP operations

###################################
##
#! @Section MorphismBetweenCoproducts and MorphismBetweenDirectProducts
##
###################################

#! @Description
#! The arguments are given as follows:
#! * <A>diagram_S</A> is a list of objects $(A_i)_{i = 0 \dots m - 1}$,
#! * <A>diagram_T</A> is a list of objects $(B_j)_{j = 0 \dots n - 1}$,
#! * <A>F</A> is a pair consisting of a list $f = (f_i)_{i = 0 \dots m - 1}$
#!   of length $m$ of integers between $0, \ldots, n - 1$
#!   and a list of morphisms $( A_i \rightarrow B_{f_i} )_{i = 0 \dots m - 1}$.
#! The output is the morphism
#! $\sqcup_{i=0}^{m-1} A_i \rightarrow \sqcup_{j=0}^{n-1} B_j$
#! defined by the pair <A>F</A>.
#! @Returns a morphism in $\mathrm{Hom}(\sqcup_{i=0}^{m-1}A_i, \sqcup_{j=0}^{n-1} B_j)$
#! @Arguments diagram_S, F, diagram_T
DeclareOperation( "MorphismBetweenCoproducts",
                  [ IsList, IsList, IsList ] );
#! @InsertChunk MorphismBetweenCoproducts

#! @Description
#! The arguments are given as follows:
#! * <A>diagram_S</A> is a list of objects $(A_i)_{i = 0 \dots m - 1}$,
#! * <A>diagram_T</A> is a list of objects $(B_j)_{j = 0 \dots n - 1}$,
#! * <A>S</A> is the coproduct $\sqcup_{i=0}^{m-1} A_i$,
#! * <A>T</A> is the coproduct $\sqcup_{j=0}^{n-1} B_j$,
#! * <A>F</A> is a pair consisting of a list $f = (f_i)_{i = 0 \dots m - 1}$
#!   of length $m$ of integers between $0, \ldots, n - 1$
#!   and a list of morphisms $( A_i \rightarrow B_{f_i} )_{i = 0 \dots m - 1}$.
#! The output is the morphism
#! $\sqcup_{i=0}^{m-1} A_i \rightarrow \sqcup_{j=0}^{n-1} B_j$
#! defined by the pair <A>F</A>.
#! @Returns a morphism in $\mathrm{Hom}(\sqcup_{i=0}^{m-1}A_i, \sqcup_{j=0}^{n-1} B_j)$
#! @Arguments S, diagram_S, F, diagram_T, T
DeclareOperation( "MorphismBetweenCoproductsWithGivenCoproducts",
                  [ IsCapCategoryObject, IsList, IsList, IsList, IsCapCategoryObject ] );

#! @Description
#! The arguments are given as follows:
#! * <A>diagram_S</A> is a list of objects $(A_i)_{i = 0 \dots m - 1}$,
#! * <A>diagram_T</A> is a list of objects $(B_j)_{j = 0 \dots n - 1}$,
#! * <A>F</A> is a pair consisting of a list $f = (f_j)_{j = 0 \dots n - 1}$
#!   of length $n$ of integers between $0, \ldots, m - 1$
#!   and a list of morphisms $( A_{f_j} \rightarrow B_j )_{j = 0 \dots n - 1}$.
#! The output is the morphism
#! $\times_{i=0}^{m-1} A_i \rightarrow \times_{j=0}^{n-1} B_j$
#! defined by the pair <A>F</A>.
#! @Returns a morphism in $\mathrm{Hom}(\times_{i=0}^{m-1}A_i, \times_{j=0}^{n-1} B_j)$
#! @Arguments diagram_S, F, diagram_T
DeclareOperation( "MorphismBetweenDirectProducts",
                  [ IsList, IsList, IsList ] );
#! @InsertChunk MorphismBetweenDirectProducts

#! @Description
#! The arguments are given as follows:
#! * <A>diagram_S</A> is a list of objects $(A_i)_{i = 0 \dots m - 1}$,
#! * <A>diagram_T</A> is a list of objects $(B_j)_{j = 0 \dots n - 1}$,
#! * <A>S</A> is the product $\times_{i=0}^{m-1} A_i$,
#! * <A>T</A> is the product $\times_{j=0}^{n-1} B_j$,
#! * <A>F</A> is a pair consisting of a list $f = (f_j)_{j = 0 \dots n - 1}$
#!   of length $n$ of integers between $0, \ldots, m - 1$
#!   and a list of morphisms $( A_{f_j} \rightarrow B_j )_{j = 0 \dots n - 1}$.
#! The output is the morphism
#! $\times_{i=0}^{m-1} A_i \rightarrow \times_{j=0}^{n-1} B_j$
#! defined by the pair <A>F</A>.
#! @Returns a morphism in $\mathrm{Hom}(\times_{i=0}^{m-1}A_i, \times_{j=0}^{n-1} B_j)$
#! @Arguments S, diagram_S, F, diagram_T, T
DeclareOperation( "MorphismBetweenDirectProductsWithGivenDirectProducts",
                  [ IsCapCategoryObject, IsList, IsList, IsList, IsCapCategoryObject ] );

###################################
##
#! @Section IsWeakTerminal and IsWeakInitial
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
#! The argument is an object $a$ of a category $\mathbf{C}$.
#! The output is <C>true</C> if $a$ is weak initial in $\mathbf{C}$,
#! otherwise the output is <C>false</C>.
#! @Returns a boolean
#! @Arguments a
DeclareProperty( "IsWeakInitial",
                 IsCapCategoryObject );

###################################
##
#! @Section RelativeLift/RelativeColift
##
###################################

#! @Description
#! The arguments are two morphisms $\beta: b \rightarrow c$, $\alpha: a \rightarrow c$, and $\nu: d \rightarrow c$
#! such that a relative lift $\beta / \alpha: b \rightarrow a$ of $\beta$ along $\alpha$ modulo $\nu$ exists.
#! Such a relative lift is returned.
#! Recall that a relative lift $\beta / \alpha: b \rightarrow a$ of $\beta$ along $\alpha$ modulo $\nu$ is
#! a morphism such that $\alpha \circ (\beta / \alpha) \sim_{b,c} \beta + \chi \nu$, for some morphism $\chi: b \rightarrow d$.
#! @Returns a morphism in $\mathrm{Hom}(b,a) + \{ \mathtt{fail} \}$
#! @Arguments beta, alpha, nu
DeclareOperation( "RelativeLift",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ] );

####################################
##
#! @Section Biased relative weak fiber product
##
####################################

#! For a given pair of morphisms $(\alpha: A \rightarrow B, \beta \colon C \rightarrow B)$, a biased relative weak fiber product of $(\alpha, \beta)$ consists of three parts:
#! * an object $P$,
#! * a morphism $\pi: P \rightarrow A$ such that there exists a morphism $\delta: P \rightarrow C$ such that $\beta \circ \delta \sim_{P,B} \alpha \circ \pi$,
#! * a dependent function $u$ mapping each $\tau: T \rightarrow A$, which admits a morphism $\mu \colon T \rightarrow C$ with $\beta \circ \mu \sim_{T,B} \alpha \circ \tau$, to a morphism $u(\tau):T \rightarrow P$ such that $\pi \circ u(\tau) \sim_{T,A} \tau$.
#! The triple $( P, \pi, u )$ is called a <Emph>biased relative weak fiber product</Emph> of $(\alpha,\beta)$.
#! We denote the object $P$ of such a triple by $\mathrm{BiasedRelativeWeakFiberProduct}(\alpha,\beta)$.
#! We say that the morphism $u(\tau)$ is induced by the
#! <Emph>universal property of the biased relative weak fiber product</Emph>.

#! @BeginLatexOnly
#! \begin{center}
#! \begin{tikzpicture}
#! \def\w{2};
#! \node (A) at (0,0) {$A$};
#! \node (B) at (\w,0) {$B$};
#! \node (C) at (\w,\w) {$C$};
#! \node (P) at (0,\w) {$P$};
#! \node (T) at (-\w,2*\w) {$T$};
#! \draw[-latex] (A) to node[pos=0.45, above] {$\alpha$} (B);
#! \draw[-latex] (C) to node[pos=0.45, right] {$\beta$} (B);
#! \draw[-latex] (P) to node[pos=0.45, left] {$\pi$} (A);
#! \draw[-latex] (T) to [out = -90, in = 180] node[pos=0.45, left] {$\tau$} (A);
#! \draw[-latex] (T) to node[pos=0.45, above right] {$\exists u( \tau )$} (P);
#! \draw[-latex, dotted] (P) to node[pos=0.45, above] {$\delta$} (C);
#! \draw[-latex, dotted] (T) to [out = 0, in = 90] node[pos=0.45, above] {$\mu$} (C);
#! \end{tikzpicture}
#! \end{center}
#! @EndLatexOnly


## Main Operations and Attributes

#! @Description
#! The arguments are two morphisms $\alpha: A \rightarrow B$, $\beta: C \rightarrow B$.
#! The output is the biased relative weak fiber product $P$ of $\alpha$ and $\beta$.
#! @Returns an object
#! @Arguments alpha, beta, sigma
DeclareOperation( "BiasedRelativeWeakFiberProduct",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ] );

## corresponds to projection in 1st factor
#! @Description
#! The arguments are three morphisms $\alpha: A \rightarrow B$, $\beta: C \rightarrow B$, $\sigma: D \rightarrow A$.
#! The output is the biased relative weak fiber product projection $\pi: P \rightarrow A$.
#! @Returns a morphism in $\mathrm{Hom}( P, A )$
#! @Arguments alpha, beta, sigma
DeclareOperation( "ProjectionOfBiasedRelativeWeakFiberProduct",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ] );

#! @Description
#! The arguments are two morphisms $\alpha: A \rightarrow B$, $\beta: C \rightarrow B$, $\sigma: D \rightarrow A$,
#! and an object $P = \mathrm{BiasedRelativeWeakFiberProduct}( \alpha, \beta )$.
#! The output is the biased relative weak fiber product projection $\pi: P \rightarrow A$.
#! @Returns a morphism in $\mathrm{Hom}( P, A )$
#! @Arguments alpha, beta, sigma, P
DeclareOperation( "ProjectionOfBiasedRelativeWeakFiberProductWithGivenBiasedRelativeWeakFiberProduct",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryObject ] );

#! @Description
#! The arguments are three morphisms $\alpha: A \rightarrow B$, $\beta: C \rightarrow B$, $\sigma: D \rightarrow A$,
#! $\tau: T \rightarrow A$.
#! The output is the morphism $u( \tau )$ induced by the universal property of the biased relative weak fiber product
#! $P$ of $\alpha$ and $\beta$.
#! @Returns a morphism in $\mathrm{Hom}( T, P )$
#! @Arguments alpha, beta, sigma, tau
DeclareOperation( "UniversalMorphismIntoBiasedRelativeWeakFiberProduct",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ] );

#! @Description
#! The arguments are three morphisms $\alpha: A \rightarrow B$, $\beta: C \rightarrow B$,
#! $\tau: T \rightarrow A$
#! and an object $P = \mathrm{BiasedRelativeWeakFiberProduct}( \alpha, \beta )$.
#! The output is the morphism $u( \tau )$ induced by the universal property of the biased relative weak fiber product
#! $P$ of $\alpha$ and $\beta$.
#! @Returns a morphism in $\mathrm{Hom}( T, P )$
#! @Arguments alpha, beta, sigma, tau, P
DeclareOperation( "UniversalMorphismIntoBiasedRelativeWeakFiberProductWithGivenBiasedRelativeWeakFiberProduct",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryObject ] );

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
#!  Return the embedding of the sum of images of all morphisms between <A>a</A> and <A>b</A>.
#! @Arguments a, b
#! @Returns a morphism
DeclareOperation( "EmbeddingOfSumOfImagesOfAllMorphisms",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#!  Return the sum of images of all morphisms between <A>a</A> and <A>b</A>.
#! @Arguments a, b
#! @Returns a morphism
DeclareOperation( "SumOfImagesOfAllMorphisms",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

###################################
##
#! @Section Limit
##
###################################

#! @Description
#!  The input is
#!  * a category <A>cat</A> and
#!  * a finite diagram (or subquiver) in <A>cat</A> given by
#!      - a list <A>objs</A> of objects in <A>cat</A>, and
#!      - a list <A>decorated_mors</A> of triples <A>[ i, mor, j ]</A>,
#!        where <A>mor</A>:<A>objs</A>[<A>i</A>] $\to$ <A>objs</A>[<A>j</A>] is a morphism in <A>cat</A>.
#!
#!  The output is a pair consisting of an object in <A>cat</A> and two parallel morphisms having this object as source,
#!  such that the binary equalizer of the two morphisms is the limit of the diagram.
#! @Arguments cat, objs, decorated_mors
#! @Returns a pair of morphisms
DeclareOperation( "LimitPair",
        [ IsCapCategory, IsList, IsList ] );

#! @Description
#!  The input is a finite diagram (or subquiver) <A>D</A> (in a category <A>cat</A>)
#!  consisting of
#!  * a list <A>objs</A> of objects in <A>cat</A> and
#!  * a list <A>decorated_mors</A> of triples <A>[ i, mor, j ]</A>,
#!    where <A>mor</A>:<A>objs</A>[<A>i</A>] $\to$ <A>objs</A>[<A>j</A>] is a morphism in <A>cat</A>.
#!
#!  The output is the limit object $\mathrm{Limit}$(<A>D</A>) of the diagram <A>D</A>.
#! @Arguments objs, decorated_mors
#! @Returns an object
DeclareOperation( "Limit",
        [ IsList, IsList ] );

#! @Description
#!  The input is
#!  * a finite diagram (or subquiver) <A>D</A> (in a category <A>cat</A>) consisting of
#!      - a list <A>objs</A> = $(P_i)_{i = 1 \dots n}$ of objects in <A>cat</A>,
#!      - a list <A>decorated_mors</A> of triples <A>[ i, mor, j ]</A>,
#!        where <A>mor</A>:<A>objs</A>[<A>i</A>] $\to$ <A>objs</A>[<A>j</A>] is a morphism in <A>cat</A>, and
#!  * a positive integer <A>k</A>.
#!  
#!  The output is the projection of the limit object $P := \mathrm{Limit}$(<A>D</A>) of the diagram <A>D</A>
#!  into the <A>k</A>-th objects $P_k =$<A>objs</A>[<A>k</A>].
#! @Arguments objects, decorated_morphisms, k
#! @Returns a morphism in $\mathrm{Hom}( P, P_k )$
DeclareOperation( "ProjectionInFactorOfLimit",
                  [ IsList, IsList, IsInt ] );

#! @Description
#!  The input is
#!  * a finite diagram (or subquiver) <M>D</M> (in a category <A>cat</A>) consisting of
#!      - a list <A>objs</A> = $(P_i)_{i = 1 \dots n}$ of objects in <A>cat</A>,
#!      - a list <A>decorated_mors</A> of triples <A>[ i, mor, j ]</A>,
#!        where <A>mor</A>:<A>objs</A>[<A>i</A>] $\to$ <A>objs</A>[<A>j</A>] is a morphism in <A>cat</A>,
#!  * a positive integer <A>k</A>, and
#!  * an object <A>P</A>$= \mathrm{Limit}(D)$.
#!  
#!  The output is the projection of the limit object <A>P</A> $:=\mathrm{Limit}(D)$ into $P_k =$<A>objs</A>[<A>k</A>].
#! @Returns a morphism in $\mathrm{Hom}( P, P_k )$
#! @Arguments objects, decorated_morphisms, k, P
DeclareOperation( "ProjectionInFactorOfLimitWithGivenLimit",
                  [ IsList, IsList, IsInt, IsCapCategoryObject ] );

#! @Description
#!  The input is
#!  * a finite diagram (or subquiver) <M>D</M> (in a category <M>cat</M>) consisting of
#!      - a list <A>objs</A> = $(P_i)_{i = 1 \dots n}$ of objects in <M>cat</M>,
#!      - a list <A>decorated_mors</A> of triples <A>[ i, mor, j ]</A>,
#!        where <A>mor</A>:<A>objs</A>[<A>i</A>] $\to$ <A>objs</A>[<A>j</A>] is a morphism in <M>cat</M>,
#!  * a test object <A>T</A>, and
#!  * a list of morphisms $\tau = ( \tau_i: T \rightarrow P_i )$ in <M>cat</M> defining a cone over $D$.
#!  
#!  The output is the morphism $u( \tau ): T \rightarrow \mathrm{Limit}(D)$
#!  given by the universal property of the limit.
#! @Returns a morphism in $\mathrm{Hom}( T, \mathrm{Limit}(D) )$
#! @Arguments objects, decorated_morphisms, T, tau
DeclareOperation( "UniversalMorphismIntoLimit",
                  [ IsList, IsList, IsCapCategoryObject, IsList ] );

#! @Description
#!  The input is
#!  * a finite diagram (or subquiver) <M>D</M> (in a category <M>cat</M>) consisting of
#!      - a list <A>objs</A> = $(P_i)_{i = 1 \dots n}$ of objects in <M>cat</M>,
#!      - a list <A>decorated_mors</A> of triples <A>[ i, mor, j ]</A>,
#!        where <A>mor</A>:<A>objs</A>[<A>i</A>] $\to$ <A>objs</A>[<A>j</A>] is a morphism in <M>cat</M>,
#!  * a test object <A>T</A>,
#!  * a list of morphisms $\tau = ( \tau_i: T \rightarrow P_i )$ in <M>cat</M> defining a cone over $D$, and
#!  * an object <A>P</A>$= \mathrm{Limit}(D)$.
#!  
#!  The output is the morphism $u( \tau ): T \rightarrow P = \mathrm{Limit}(D)$
#!  given by the universal property of the limit.
#! @Returns a morphism in $\mathrm{Hom}( T, P )$
#! @Arguments objects, decorated_morphisms, T, tau, P
DeclareOperation( "UniversalMorphismIntoLimitWithGivenLimit",
                  [ IsList, IsList, IsCapCategoryObject, IsList, IsCapCategoryObject ] );

###################################
##
#! @Section Colimit
##
###################################

#! @Description
#!  The input is
#!  * a category <A>cat</A> and
#!  * a finite diagram (or subquiver) in <A>cat</A> given by
#!      - a list <A>objs</A> of objects in <A>cat</A>, and
#!      - a list <A>decorated_mors</A> of triples <A>[ i, mor, j ]</A>,
#!        where <A>mor</A>:<A>objs</A>[<A>i</A>] $\to$ <A>objs</A>[<A>j</A>] is a morphism in <A>cat</A>.
#!
#!  The output is a pair consisting of an object in <A>cat</A> and two parallel morphisms having this object as range,
#!  such that the binary coequalizer of the two morphisms is the colimit of the diagram.
#! @Arguments cat, objs, decorated_mors
#! @Returns a pair of morphisms
DeclareOperation( "ColimitPair",
        [ IsCapCategory, IsList, IsList ] );

#! @Description
#!  The input is a finite diagram (or subquiver) <A>D</A> (in a category <A>cat</A>)
#!  consisting of
#!  * a list <A>objs</A> of objects in <A>cat</A> and
#!  * a list <A>decorated_mors</A> of triples <A>[ i, mor, j ]</A>,
#!    where <A>mor</A>:<A>objs</A>[<A>i</A>] $\to$ <A>objs</A>[<A>j</A>] is a morphism in <A>cat</A>.
#!
#!  The output is the colimit object $\mathrm{Colimit}$(<A>D</A>) of the diagram <A>D</A>.
#! @Arguments objs, decorated_mors
#! @Returns an object
DeclareOperation( "Colimit",
        [ IsList, IsList ] );

#! @Description
#!  The input is
#!  * a finite diagram (or subquiver) <A>D</A> (in a category <A>cat</A>) consisting of
#!      - a list <A>objs</A> = $(P_i)_{i = 1 \dots n}$ of objects in <A>cat</A>,
#!      - a list <A>decorated_mors</A> of triples <A>[ i, mor, j ]</A>,
#!        where <A>mor</A>:<A>objs</A>[<A>i</A>] $\to$ <A>objs</A>[<A>j</A>] is a morphism in <A>cat</A>, and
#!  * a positive integer <A>k</A>.
#!  
#!  The output is the injection of the <A>k</A>-th objects $P_k =$<A>objs</A>[<A>k</A>]
#!  into the colimit object $P := \mathrm{Colimit}$(<A>D</A>) of the diagram <A>D</A>.
#! @Arguments objects, decorated_morphisms, k
#! @Returns a morphism in $\mathrm{Hom}( P_k, P )$
DeclareOperation( "InjectionOfCofactorOfColimit",
                  [ IsList, IsList, IsInt ] );

#! @Description
#!  The input is
#!  * a finite diagram (or subquiver) <M>D</M> (in a category <A>cat</A>) consisting of
#!      - a list <A>objs</A> = $(P_i)_{i = 1 \dots n}$ of objects in <A>cat</A>,
#!      - a list <A>decorated_mors</A> of triples <A>[ i, mor, j ]</A>,
#!        where <A>mor</A>:<A>objs</A>[<A>i</A>] $\to$ <A>objs</A>[<A>j</A>] is a morphism in <A>cat</A>,
#!  * a positive integer <A>k</A>, and
#!  * an object <A>P</A>$= \mathrm{Colimit}(D)$.
#!  
#!  The output is the projection of $P_k =$<A>objs</A>[<A>k</A>] into the colimit object <A>P</A> $:=\mathrm{Colimit}(D)$.
#! @Returns a morphism in $\mathrm{Hom}( P_k, P )$
#! @Arguments objects, decorated_morphisms, k, P
DeclareOperation( "InjectionOfCofactorOfColimitWithGivenColimit",
                  [ IsList, IsList, IsInt, IsCapCategoryObject ] );

#! @Description
#!  The input is
#!  * a finite diagram (or subquiver) <M>D</M> (in a category <M>cat</M>) consisting of
#!      - a list <A>objs</A> = $(P_i)_{i = 1 \dots n}$ of objects in <M>cat</M>,
#!      - a list <A>decorated_mors</A> of triples <A>[ i, mor, j ]</A>,
#!        where <A>mor</A>:<A>objs</A>[<A>i</A>] $\to$ <A>objs</A>[<A>j</A>] is a morphism in <M>cat</M>,
#!  * a test object <A>T</A>, and
#!  * a list of morphisms $\tau = ( \tau_i: P_i \rightarrow T )$ in <M>cat</M> defining a cocone over $D$.
#!  
#!  The output is the morphism $u( \tau ): \mathrm{Colimit}(D) \rightarrow T$
#!  given by the universal property of the colimit.
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{Colimit}(D), T )$
#! @Arguments objects, decorated_morphisms, T, tau
DeclareOperation( "UniversalMorphismFromColimit",
                  [ IsList, IsList, IsCapCategoryObject, IsList ] );

#! @Description
#!  The input is
#!  * a finite diagram (or subquiver) <M>D</M> (in a category <M>cat</M>) consisting of
#!      - a list <A>objs</A> = $(P_i)_{i = 1 \dots n}$ of objects in <M>cat</M>,
#!      - a list <A>decorated_mors</A> of triples <A>[ i, mor, j ]</A>,
#!        where <A>mor</A>:<A>objs</A>[<A>i</A>] $\to$ <A>objs</A>[<A>j</A>] is a morphism in <M>cat</M>,
#!  * a test object <A>T</A>,
#!  * a list of morphisms $\tau = ( \tau_i: P_i \rightarrow T )$ in <M>cat</M> defining a cocone over $D$, and
#!  * an object <A>P</A>$= \mathrm{Colimit}(D)$.
#!  
#!  The output is the morphism $u( \tau ): P = \mathrm{Colimit}(D) \rightarrow T$
#!  given by the universal property of the colimit.
#! @Returns a morphism in $\mathrm{Hom}( P, T )$
#! @Arguments objects, decorated_morphisms, T, tau, P
DeclareOperation( "UniversalMorphismFromColimitWithGivenColimit",
                  [ IsList, IsList, IsCapCategoryObject, IsList, IsCapCategoryObject ] );

DeclareOperation( "PreComposeFunctorsByData",
        [ IsCapCategory, IsList, IsList ] );

DeclareOperation( "PreComposeWithWrappingFunctorData",
        [ IsWrapperCapCategory, IsList ] );

DeclareOperation( "ExtendFunctorToWrapperCategoryData",
        [ IsWrapperCapCategory, IsList, IsCapCategory ] );

DeclareOperation( "ListPrimitivelyInstalledOperationsOfCategoryWhereMorphismOperationsAreReplacedWithCorrespondingObjectAndWithGivenOperations",
        [ IsCapCategory ] );

##
DeclareAttribute( "YonedaEmbeddingData",
        IsCapCategory );

##
DeclareAttribute( "CoYonedaEmbeddingData",
        IsCapCategory );

#! @Description
#!  returns all indices $1 \leq i \leq$ <C>Length</C>(<A>superlist</A>) at which a sublist (of <A>superlist</A>) equal to <A>sublist</A> starts.
#!  If <A>sublist</A> does not occur the output is the empty-list. The version with given <A>from</A> starts searching after the position <A>from</A>.
#! @Arguments superlist, sublist [, from]
#! @Returns a list of integers
DeclareGlobalFunction( "PositionsOfSublist" );

#! @Description
#!  The input is a category <A>cat</A> and a list of objects therein, such that the list $L$ of all possible finite coproducts is finite.
#!  The output is the list $L$.
#! @Arguments cat, objects
#! @Returns a list of objects
DeclareOperation( "AllCoproducts",
        [ IsCapCategory and IsCocartesianCategory, IsList ] );
