# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Declarations
#

#! @Chapter Path Categories

####################################
#
#! @Section Operations
#
####################################

#! @Description
#!  The input is a path category <A>C</A> and a list <A>rels</A> consisting of pairs of parallel morphisms in <A>C</A>.
#!  The output is the Groebner basis of <A>rels</A>.
#! @Arguments C, rels
#! @Returns a dense list
DeclareOperation( "GroebnerBasis", [ IsPathCategory, IsDenseList ] );

#! @Description
#!  The input is a path category <A>C</A> and a Groebner basis <A>groebner_basis</A> consisting of pairs of parallel morphisms in <A>C</A>.
#!  The output is the reduced Groebner basis of <A>groebner_basis</A>.
#! @Arguments C, groebner_basis
#! @Returns a dense list
DeclareOperation( "ReducedGroebnerBasisWithGivenGroebnerBasis", [ IsPathCategory, IsDenseList ] );

#! @Description
#!  The input is a path category <A>C</A> and a list <A>rels</A> consisting of pairs of parallel morphisms in <A>C</A>.
#!  The output is the reduced Groebner basis of <A>rels</A>.
#! @Arguments C, rels
#! @Returns a dense list
DeclareOperation( "ReducedGroebnerBasis", [ IsPathCategory, IsDenseList ] );

#! @Description
#!  The input is a path category <A>C</A> and a list of morphisms <A>monomials</A> in <A>C</A>
#!  (<A>monomials</A> is usually the leading terms of a Groebner basis).
#!  The output is whether almost all morphisms of <A>C</A> are multiples of elements in <A>monomials</A>.
#!  In other words, whether the number of morphisms that are not multiples of elements in <A>monomials</A> is finite.
#! @Arguments C, monomials
#! @Returns a boolean
DeclareOperation( "HasFiniteNumberOfNonMultiples", [ IsPathCategory, IsDenseList ] );

#! @Description
#!  The input is a path category <A>C</A>, two parallel morphisms <A>f</A>, <A>g</A> and a string
#!  <A>admissible_order</A> which takes one of the following two values <C>"Dp"</C> or <C>"dp"</C>.
#!  The output is whether <A>f</A> $\succ$ <A>g</A> with respect to the specified admissible order.
#!  <C>"Dp"</C>  stands for the left-length-lexicographic order under which <A>f</A> $\succ_{\mathtt{Dp}}$ <A>g</A> if
#!  <C>MorphismLength</C>(<A>f</A>) $\succ$ <C>MorphismLength</C>(<A>g</A>);
#!  or <C>MorphismLength</C>(<A>f</A>)$=$<C>MorphismLength</C>(<A>g</A>) and the first nonzero entry in
#!  <C>MorphismIndices</C>(<A>f</A>)$-$<C>MorphismIndices</C>(<A>g</A>) is negative.
#!  <C>"dp"</C>  stands for the right-length-lexicographic order under which <A>f</A> $\succ_{\mathtt{dp}}$ <A>g</A> if
#!  <C>MorphismLength</C>(<A>f</A>) $\succ$ <C>MorphismLength</C>(<A>g</A>);
#!  or <C>MorphismLength</C>(<A>f</A>)$=$<C>MorphismLength</C>(<A>g</A>) and the last nonzero entry in
#!  <C>MorphismIndices</C>(<A>f</A>)$-$<C>MorphismIndices</C>(<A>g</A>) is negative. For example, if
#!  the quiver of <A>C</A> is defined by the string <C>"(*)[x:*->*,y:*->*]"</C>, then
#!  - $x^2 \succ_{\mathtt{Dp}} xy \succ_{\mathtt{Dp}} yx \succ_{\mathtt{Dp}}  y^2 \succ_{\mathtt{Dp}} x \succ_{\mathtt{Dp}} y \succ_{\mathtt{Dp}} \mathtt{id(*)}$
#!  - $x^2 \succ_{\mathtt{dp}} yx \succ_{\mathtt{dp}} xy \succ_{\mathtt{dp}}  y^2 \succ_{\mathtt{dp}} x \succ_{\mathtt{dp}} y \succ_{\mathtt{dp}} \mathtt{id(*)}$
#! @Arguments C, f, g, admissible_order
#! @Returns a boolean
DeclareOperation( "IsDescendingForMorphisms", [ IsPathCategory, IsPathCategoryMorphism, IsPathCategoryMorphism, IsString ] );

#! @Description
#!  The input is a path category <A>C</A>, two parallel morphisms <A>f</A>, <A>g</A> and a string
#!  <A>admissible_order</A> which takes one of the following two values <C>"Dp"</C> or <C>"dp"</C>.
#!  The output is whether <A>f</A> $\prec$ <A>g</A> with respect to the specified admissible order.
#! @Arguments C, f, g, admissible_order
#! @Returns a boolean
DeclareOperation( "IsAscendingForMorphisms", [ IsPathCategory, IsPathCategoryMorphism, IsPathCategoryMorphism, IsString ] );

DeclareOperation( "ReductionOfMorphism", [ IsPathCategory, IsPathCategoryMorphism, IsDenseList ] );

# @Description
#  The input is a path category <A>C</A> and two morphisms <A>f</A>$:A \to B$, <A>g</A>$:C \to D$.
#  The output is the list of all pairs of following form:
#  - $[[l:C \to A,\mathtt{id}(B)],[\mathtt{id}(C),r:D \to B]]$ with $lf=gr$ and the left-end of $f$ intersects nontrivially with the right-end of $g$.
#  - $[[\mathtt{id}(A),r:B \to D],[l:A \to C,\mathtt{id}(D)]]$ with $fr=lg$ and the right-end of $f$ intersects nontrivially with the left-end of $g$.
#  - $[[\mathtt{id}(A),\mathtt{id}(B)],[l:A \to C,r:D \to B]]$ with $f=lgr$ and $f$ contains $g$.
#  - $[[l:C \to A,r:B \to D],[\mathtt{id}(C),\mathtt{id}(D)]]$ with $lfr=g$ and $g$ contains $f$.
# @Arguments C, f, g
# @Returns a list of pairs of pairs
DeclareOperation( "OverlappingCoefficients", [ IsPathCategory, IsPathCategoryMorphism, IsPathCategoryMorphism ] );

DeclareOperation( "NewRelation", [ IsPathCategory, IsDenseList, IsDenseList, IsDenseList ] );

