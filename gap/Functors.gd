# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

####################################
#
#! @Chapter Categories of functors
#! @Section Attributes
#
####################################

DeclareOperation( "ConvertToCellInFunctorCategory", [ IsQuiverRepresentation, IsFunctorCategory ] );
DeclareOperation( "ConvertToCellInFunctorCategory", [ IsObjectInFunctorCategory, IsQuiverRepresentationHomomorphism, IsObjectInFunctorCategory ] );

DeclareAttribute( "ConvertToCellInCategoryOfQuiverRepresentations", IsObjectInFunctorCategory );
DeclareAttribute( "ConvertToCellInCategoryOfQuiverRepresentations", IsMorphismInFunctorCategory );

#! @Description
#! The input is a Hom-category <A>H</A><C>:=Hom(B,C)</C> where <C>B</C> is an algebroid defined by some quiver algebra <C>A</C> and
#! <C>C</C> is a matrix category over some homalg field <C>K</C>.
#! The output is the isomorphism from <A>H</A> into <C>CategoryOfQuiverRepresentations(A)</C>.
#! @Arguments H
#! @Returns a &CAP; functor
DeclareAttribute( "IsomorphismOntoCategoryOfQuiverRepresentations", IsFunctorCategory );


#! @Description
#! The input is a Hom-category <A>H</A><C>:=Hom(B,C)</C> where <C>B</C> is an algebroid defined by some quiver algebra <C>A</C> and
#! <C>C</C> is a matrix category over some homalg field <C>K</C>.
#! The output is the isomorphism from  <C>CategoryOfQuiverRepresentations(A)</C> into <A>H</A>.
#! @Arguments H
#! @Returns a &CAP; functor
DeclareAttribute( "IsomorphismFromCategoryOfQuiverRepresentations", IsFunctorCategory );

#! @Description
#!  The input is a category <A>B</A> with finitely many objects equipped with
#!  a homomorphism structure with values in a finite complete and finite cocomplete category <A>H</A>.
#!  The output is the nerve of <A>B</A> truncated in degree $2$,
#!  as an object in the category of presheaves on <C>SimplicialCategoryTruncatedInDegree</C>($2$)
#!  with values in <A>H</A>.
#! @Arguments B
#! @Returns a &CAP; functor
DeclareAttribute( "NerveTruncatedInDegree2", IsCapCategory );
#! @InsertChunk NerveTruncatedInDegree2

DeclareAttribute( "YonedaEmbeddingData", IsCapCategory );

#! @Description
#!  The input is a finitely presented category <A>B</A>. The output is the Yoneda embedding functor from
#!  <A>B</A> into the functors category <C>Hom</C>( <C>OppositeAlgebroid</C>(<A>B</A>),$H$), where
#!  $H$=<C>RangeCategoryOfHomomorphismStructure</C>(<A>B</A>).
#! @Arguments B
#! @Returns a &CAP; functor
DeclareAttribute( "YonedaEmbedding", IsCapCategory );
CapJitAddTypeSignature( "YonedaEmbedding", [ IsCapCategory ], IsCapFunctor );

DeclareAttribute( "YonedaEmbeddingOpposite", IsCapCategory );

##
DeclareAttribute( "YonedaEmbeddingOfOppositeOfSourceCategory",
        IsFunctorCategory );

#! @Description
#!  The input is a finitely presented category <A>B</A>. The output is an epimorphism in the category
#!  of functors from <A>B</A> into $H :=$<C>RangeCategoryOfHomomorphismStructure</C>( <A>B</A> ).
#!  Its source is the functor $B \to H, c \mapsto \sqcup_{a\in B} \mathrm{Hom}(a,c),
#!  \psi \mapsto \sqcup_{a\in B} \mathrm{Hom}(a,\psi)$.
#!  Its targe is the constant functor of $0$-cells
#!  $B \to H, c \mapsto B_0, \psi \mapsto \mathrm{id}_{B_0}$.
#! @Arguments B
#! @Returns a morphism in a &CAP; category
DeclareAttribute( "YonedaFibration", IsCapCategory );

#! @Description
#!  The input is a finitely presented category <A>B</A>. The output is an epimorphism in the category
#!  of functors from <A>B</A> into $H :=$<C>RangeCategoryOfHomomorphismStructure</C>( <A>B</A> ).
#!  Its source is the functor
#!  $B \to H, c \mapsto \sqcup_{a,b\in B} \mathrm{Hom}(a,b) \times \mathrm{Hom}(b,c),
#!  \psi \mapsto \sqcup_{a,b\in B} \mathrm{Hom}(1_a,1_b) \times \mathrm{Hom}(b,\psi)$.
#!  Its target is the functor $B \to H, c \mapsto \sqcup_{a\in B} \mathrm{Hom}(a,c),
#!  \psi \mapsto \sqcup_{a\in B} \mathrm{Hom}(a,\psi)$.
#! @Arguments B
#! @Returns a morphism in a &CAP; category
DeclareAttribute( "YonedaProjection", IsCapCategory );

#! @Description
#!  The input is a finitely presented category <A>B</A>. The output is an epimorphism in the category
#!  of functors from <A>B</A> into $H :=$<C>RangeCategoryOfHomomorphismStructure</C>( <A>B</A> ).
#!  Its source is the functor
#!  $B \to H, c \mapsto \sqcup_{a,b\in B} \mathrm{Hom}(a,b) \times \mathrm{Hom}(b,c),
#!  \psi \mapsto \sqcup_{a,b\in B} \mathrm{Hom}(1_a,1_b) \times \mathrm{Hom}(b,\psi)$.
#!  Its target is the functor $B \to H, c \mapsto \sqcup_{a\in B} \mathrm{Hom}(a,c),
#!  \psi \mapsto \sqcup_{a\in B} \mathrm{Hom}(a,\psi)$.
#! @Arguments B
#! @Returns a morphism in a &CAP; category
DeclareAttribute( "YonedaComposition", IsCapCategory );
#! @InsertChunk YonedaComposition

#! @Description
#!  The input is a monomorphism <A>iota</A>:$Q \to P$ in the category of
#!  presheaves with values in <C>RangeCategoryOfHomomorphismStructure</C>($C$)
#!  on the finitely presented category
#!  $C:=$<C>OppositeFpCategory</C>(<C>Source</C>($P$)) with finite $\mathrm{Hom}$-sets.
#!  The output is the morphism from $P$ to
#!  the <C>SieveFunctor</C>($C$) mapping for each $c \in C$ the element $x \in P(c)$
#!  to its <Q>paths to truth</Q> $f: a \to c$ translating $x$ into $f(x) \in Q(a) \subseteq P(a)$.
#! @Returns a monomorphisms in a Hom-category of functors
#! @Arguments iota
#! @Group SievesOfPathsToTruth
DeclareAttribute( "SievesOfPathsToTruth", IsMorphismInFunctorCategory );

#! @Arguments Hom, iota
#! @Group SievesOfPathsToTruth
DeclareOperation( "SievesOfPathsToTruth",
        [ IsFunctorCategory, IsMorphismInFunctorCategory ] );

DeclareAttribute( "RadicalFunctorAttr", IsFunctorCategory );

#! @Description
#!  The input is a Hom-category <A>H</A><C>:=Hom(B,C)</C>, where <C>B</C> is a f.p. algebroid and
#!  <C>C</C> is a matrix category over some homalg field <C>K</C>.
#!  The output is the radical endofunctor on <A>H</A>.
#! @Arguments H
#! @Returns a &CAP; functor
DeclareOperation( "RadicalFunctor", [ IsFunctorCategory ] );
