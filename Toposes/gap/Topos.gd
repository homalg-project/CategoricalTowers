# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#
# Declarations
#

####################################
##
#! @Chapter Toposes
##
####################################

####################################
##
#! @Section Morphisms of external Hom
##
####################################

#! @Description
#! The argument are two objects <A>a</A>, <A>b</A>.
#! The output is a list of all morphisms from <A>a</A> to <A>b</A>.
#! @Returns a list of morphisms in $\mathrm{Hom}( a, b )$
#! @Arguments a, b
DeclareOperation( "MorphismsOfExternalHom",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

###################################
##
#! @Section Exact cover with global elements
##
###################################

#! @Description
#!  The argument is an object <A>a</A> of a category $\mathbf{C}$
#!  which is enriched over itself, i.e.,
#!  $\mathbf{C}$ = <C>RangeCategoryOfHomomorphismStructure</C>( $\mathbf{C}$ ).
#!  The output is a list $D$ of global elements of <A>a</A>
#!  (i.e., morphisms from the distinguished object $t :=$<C>DistinguishedObjectOfHomomorphismStructure</C>( $\mathbf{C}$ ) to <A>a</A>),
#!  such that <C>UniversalMorphismFromCoproduct</C>(<A>a</A>, $D$) is an isomorphism.
#! @Returns a list of morphisms in $\mathrm{Hom}( t, a )$
#! @Arguments a
DeclareAttribute( "ExactCoverWithGlobalElements",
        IsCapCategoryObject );

####################################
##
#! @Section Subobject classifier
##
####################################

DeclareGlobalVariable( "TOPOS_METHOD_NAME_RECORD" );


#! @Description
#!  The property of the category <A>C</A> being an elementary topos.
#! @Arguments C
DeclareProperty( "IsElementaryTopos",
        IsCapCategory );

AddCategoricalProperty( [ "IsElementaryTopos", fail ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsElementaryTopos :=
  SortedList(
          Concatenation( [
                  "SubobjectClassifier",
                  "ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier",
                  #"TruthMorphismOfTrueWithGivenObjects", ## derived from SubobjectClassifier & ClassifyingMorphismOfSubobjectWithGiven... & IdentityMorphism
                  "SubobjectOfClassifyingMorphism", ## can be derived from SubobjectClassifier & TruthMorphismOfTrueWithGivenObjects & ProjectionInFactorOfFiberProduct
                  ],
                  CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCartesianClosedCategory,
                  CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsFiniteCompleteCategory,
                  CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsFiniteCocompleteCategory,
                  CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsDistributiveCategory ) );

#! A subobject classifier consists of three parts:
#! * an object $\Omega$,
#! * a function $\mathrm{true}$ providing a morphism $\mathrm{true}: 1 \rightarrow \Omega$,
#! * a function $\chi$ mapping each monomorphism $i : A \rightarrow S$ to a morphism $\chi_i : S \to \Omega$.
#! The triple $(\Omega,\mathrm{true},\chi)$ is called a <Emph>subobject classifier</Emph> if
#! for each monomorphism $i : A \to S$, the morphism $\chi_i : S \to \Omega$ is the unique
#! morphism such that $\chi_i \circ i = \mathrm{true} \circ \ast$ determine a pullback diagram.

#! @Description
#! The argument is a category $C$.
#! The output is the subobject classifier object $\Omega$ of $C$.
#! @Returns an object
#! @Arguments C
DeclareAttribute( "SubobjectClassifier",
        IsCapCategory );

#! @Description
#! The argument is a category $C$.
#! The output is the cartesian square of the subobject classifier object <A>\Omega</A> of $C$.
#! @Returns an object
#! @Arguments C
DeclareAttribute( "CartesianSquareOfSubobjectClassifier",
        IsCapCategory );

#! @Description
#! The argument is a monomorphism $m : A \rightarrow S$.
#! The output is its classifying morphism
#! $\chi_m : S \rightarrow \mathrm{SubobjectClassifier}$.
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{Range}(m), \mathrm{SubobjectClassifier} )$
#! @Arguments m
DeclareAttribute( "ClassifyingMorphismOfSubobject",
        IsCapCategoryMorphism );

#! @Description
#! The arguments are a monomorphism $m : A \rightarrow S$ and
#! the subobject classifier $\Omega$. The output is the classifying morphism
#! of the monomorphism $\chi_m : S \rightarrow \mathrm{SubobjectClassifier}$.
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{Range}(m), \mathrm{SubobjectClassifier} )$
#! @Arguments m, omega
DeclareOperation( "ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier",
        [ IsCapCategoryMorphism, IsCapCategoryObject ] );

#! @Description
#! The argument is a classifying morphism $\chi : S \rightarrow \Omega$.
#! The output is the subobject monomorphism of the classifying morphism,
#! $m : A \rightarrow S$.
#! @Returns a monomorphism in $\mathrm{Hom}( A, S )$
#! @Arguments chi
DeclareAttribute( "SubobjectOfClassifyingMorphism",
        IsCapCategoryMorphism );

#! @Description
#! The argument is an object <A>A</A>.
#! The output is a list of all subobjects of <A>A</A>.
#! @Returns a list of monomorphisms into $A$.
#! @Arguments A
DeclareAttribute( "ListOfSubobjects",
        IsCapCategoryObject );

####################################
##
#! @Section Truth morphisms
##
####################################

#! @Description
#! The argument is a category $C$.
#! The output is the truth morphism
#! $\mathrm{true}: \mathrm{TerminalObject} \rightarrow \mathrm{SubobjectClassifier}$.
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{TerminalObject}, \mathrm{SubobjectClassifier} )$
#! @Arguments C
DeclareAttribute( "TruthMorphismOfTrue",
        IsCapCategory );

#! @Description
#! The arguments are the terminal object of the category and
#! the subobject classifier.
#! The output is the truth morphism
#! $\mathrm{true}: T \rightarrow \Omega$.
#! @Returns a morphism in $\mathrm{Hom}( T, \Omega )$
#! @Arguments T, Omega
DeclareOperation( "TruthMorphismOfTrueWithGivenObjects",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#! The argument is a category $C$.
#! The output is the truth morphism
#! $\mathrm{false}: \mathrm{TerminalObject} \rightarrow \mathrm{SubobjectClassifier}$.
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{TerminalObject}, \mathrm{SubobjectClassifier} )$
#! @Arguments C
DeclareAttribute( "TruthMorphismOfFalse",
        IsCapCategory );

#! @Description
#! The arguments are the terminal object <A>T</A> of the category and
#! the subobject classifier <A>Omega</A>.
#! The output is the truth morphism
#! $\mathrm{false}: T \rightarrow \Omega$.
#! @Returns a morphism in $\mathrm{Hom}( T, \Omega )$
#! @Arguments T, Omega
DeclareOperation( "TruthMorphismOfFalseWithGivenObjects",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#! The argument is a category $C$.
#! The output is the truth endomorphism
#! $\mathrm{not}: \mathrm{SubobjectClassifier} \rightarrow \mathrm{SubobjectClassifier}$.
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{SubobjectClassifier}, \mathrm{SubobjectClassifier} )$
#! @Arguments C
DeclareAttribute( "TruthMorphismOfNot",
        IsCapCategory );

#! @Description
#! The arguments are a subobject classifier <A>Omega</A> as first and as second argument.
#! The output is the truth endomorphism
#! $\mathrm{not}: \Omega \rightarrow \Omega$.
#! @Returns a morphism in $\mathrm{Hom}( \Omega, \Omega )$
#! @Arguments Omega, Omega
DeclareOperation( "TruthMorphismOfNotWithGivenObjects",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#! The argument is a category $C$.
#! The output is the truth morphism
#! $\mathrm{and}: \mathrm{CartesianSquareOfSubobjectClassifier} \rightarrow \mathrm{SubobjectClassifier}$.
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{CartesianSquareOfSubobjectClassifier}, \mathrm{SubobjectClassifier} )$
#! @Arguments C
DeclareAttribute( "TruthMorphismOfAnd",
        IsCapCategory );

#! @Description
#! The arguments are the cartesian square <A>Omega^{\times 2}</A> of a subobject classifier <A>Omega</A> of the category and
#! the subobject classifier.
#! The output is the truth morphism
#! $\mathrm{and}: \Omega^{\times 2} \rightarrow \Omega$.
#! @Returns a morphism in $\mathrm{Hom}( \Omega^{\times 2}, \Omega )$
#! @Arguments Omega2, Omega
DeclareOperation( "TruthMorphismOfAndWithGivenObjects",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#! The argument is a category $C$.
#! The output is the truth morphism
#! $\mathrm{or}: \mathrm{CartesianSquareOfSubobjectClassifier} \rightarrow \mathrm{SubobjectClassifier}$.
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{CartesianSquareOfSubobjectClassifier}, \mathrm{SubobjectClassifier} )$
#! @Arguments C
DeclareAttribute( "TruthMorphismOfOr",
        IsCapCategory );

#! @Description
#! The arguments are the cartesian square <A>Omega^{\times 2}</A> of a subobject classifier <A>Omega</A> of the category and
#! the subobject classifier.
#! The output is the truth morphism
#! $\mathrm{or}: \Omega^{\times 2} \rightarrow \Omega$.
#! @Returns a morphism in $\mathrm{Hom}( \Omega^{\times 2}, \Omega )$
#! @Arguments Omega2, Omega
DeclareOperation( "TruthMorphismOfOrWithGivenObjects",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#! The argument is a category $C$.
#! The output is the truth morphism
#! $\mathrm{implies}: \mathrm{CartesianSquareOfSubobjectClassifier} \rightarrow \mathrm{SubobjectClassifier}$.
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{CartesianSquareOfSubobjectClassifier}, \mathrm{SubobjectClassifier} )$
#! @Arguments C
DeclareAttribute( "TruthMorphismOfImplies",
        IsCapCategory );

#! @Description
#! The arguments are the cartesian square <A>Omega^{\times 2}</A> of a subobject classifier <A>Omega</A> of the category and
#! the subobject classifier.
#! The output is the truth morphism
#! $\mathrm{implies}: \Omega^{\times 2} \rightarrow \Omega$.
#! @Returns a morphism in $\mathrm{Hom}( \Omega^{\times 2}, \Omega )$
#! @Arguments Omega2, Omega
DeclareOperation( "TruthMorphismOfImpliesWithGivenObjects",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

####################################
##
#! @Section Power object
##
####################################

#! @Description
#! The argument is an object <A>a</A>.
#! The output is the power object $P(a)$ of <A>a</A>.
#! @Arguments a
#! @Returns an object
DeclareAttribute( "PowerObject",
        IsCapCategoryObject );

#! @Description
#! The argument is a morphism <A>f</A>$:a \to b$.
#! The output is the power morphism of $P(f): P(b) \to P(a)$.
#! @Arguments f
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{PowerObject}(b), \mathrm{PowerObject}(a) )$
DeclareAttribute( "PowerObjectFunctorial",
        IsCapCategoryMorphism );
#! @InsertChunk PowerObjectFunctorial

#! @Description
#! The arguments are an object <A>Pb</A>, a morphism $f:a \to b$, and object <A>Pa</A>,
#! such that <A>Pa</A>$= P(a)$ and <A>Pb</A>$= P(b)$.
#! The output is the power morphism of $P(f): Pb \to Pa$.
#! @Arguments Pb, f, Pa
#! @Returns a morphism in $\mathrm{Hom}( Pb, Pa )$
DeclareOperation( "PowerObjectFunctorialWithGivenPowerObjects",
        [ IsCapCategoryObject, IsCapCategoryMorphism, IsCapCategoryObject ] );

#! @Description
#! The argument is an object <A>a</A>.
#! The output is the singleton morphism from <A>a</A> to the power object $\mathrm{PowerObject}(a)$.
#! @Arguments a
#! @Returns a morphism in $\mathrm{Hom}( a, \mathrm{PowerObject}(a) )$
DeclareAttribute( "SingletonMorphism",
        IsCapCategoryObject );
#! @InsertChunk SingletonMorphism

#! @Description
#! The arguments are an object <A>a</A> and an object <A>Pa</A> which is equal to the power object $\mathrm{PowerObject}(a)$.
#! The output is the singleton morphism from <A>a</A> to <A>Pa</A>.
#! @Arguments a, Pa
#! @Returns a morphism in $\mathrm{Hom}( a, Pa )$
DeclareOperation( "SingletonMorphismWithGivenPowerObject",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#! The argument is an object <A>a</A> in a category $C$.
#! The output is the isomorphism
#! $\mathrm{Exponential}( a, \mathrm{CartesianSquareOfSubobjectClassifier}( C ) ) \rightarrow \mathrm{DirectProduct}( \mathrm{PowerObject}(a), \mathrm{PowerObject}(a) )$.
#! @Arguments a
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{Exponential}( a, \mathrm{CartesianSquareOfSubobjectClassifier}( C ) ), \mathrm{DirectProduct}( \mathrm{PowerObject}(a), \mathrm{PowerObject}(a) ) )$
DeclareAttribute( "IsomorphismOntoCartesianSquareOfPowerObject",
        IsCapCategoryObject );
#! @InsertChunk IsomorphismOntoCartesianSquareOfPowerObject

#! @Description
#! The arguments are an object the exponential <A>Exp_a_Omega2</A> = <C>Exponential</C>( <A>a</A>, <C>CartesianSquareOfSubobjectClassifier</C> ),
#! an object <A>a</A> in a category $C$, and the cartesian squre <A>PaxPa</A> of the power object <C>PowerObject</C>( <A>a</A> ).
#! The output is the isomorphism $Exp\_a\_Omega2 \stackrel{\sim}{\rightarrow} PaxPa$
#! @Arguments Exp_a_Omega2, a, PaxPa
#! @Returns a morphism in $\mathrm{Hom}( Exp\_a\_Omega2, PaxPa )$
DeclareOperation( "IsomorphismOntoCartesianSquareOfPowerObjectWithGivenObjects",
        [ IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject ] );

####################################
##
#! @Section Relative truth morphisms
##
####################################

#! @Description
#! The argument is an object <A>a</A> in a category $C$.
#! The output is the relative truth morphism
#! $\mathrm{true}: \mathrm{TerminalObject} \rightarrow \mathrm{PowerObject}( a )$.
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{TerminalObject}, \mathrm{PowerObect}( a ) )$
#! @Arguments a
DeclareAttribute( "RelativeTruthMorphismOfTrue",
        IsCapCategoryObject );

#! @Description
#! The arguments are the terminal object of the category $C$, an object <A>a</A>, and the power object <A>Pa</A> of <A>a</A>.
#! The output is the relative truth morphism
#! $\mathrm{true}: T \rightarrow Pa$.
#! @Returns a morphism in $\mathrm{Hom}( T, Pa )$
#! @Arguments T, a, Pa
DeclareOperation( "RelativeTruthMorphismOfTrueWithGivenObjects",
        [ IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#! The argument is an object <A>a</A> in a category $C$.
#! The output is the relative truth morphism
#! $\mathrm{false}: \mathrm{TerminalObject} \rightarrow \mathrm{PowerObject}( a )$.
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{TerminalObject}, \mathrm{PowerObect}( a ) )$
#! @Arguments a
DeclareAttribute( "RelativeTruthMorphismOfFalse",
        IsCapCategoryObject );

#! @Description
#! The arguments are the terminal object of the category $C$, an object <A>a</A>, and the power object <A>Pa</A> of <A>a</A>.
#! The output is the relative truth morphism
#! $\mathrm{false}: T \rightarrow Pa$.
#! @Returns a morphism in $\mathrm{Hom}( T, Pa )$
#! @Arguments T, a, Pa
DeclareOperation( "RelativeTruthMorphismOfFalseWithGivenObjects",
        [ IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#! The argument is an object <A>a</A> in a category $C$.
#! The output is the relative truth endomorphism
#! $\mathrm{not}: \mathrm{PowerObject}( a ) \rightarrow \mathrm{PowerObject}( a )$.
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{PowerObject}( a ), \mathrm{PowerObect}( a ) )$
#! @Arguments a
DeclareAttribute( "RelativeTruthMorphismOfNot",
        IsCapCategoryObject );

#! @Description
#! The arguments are the power object <A>Pa</A> of <A>a</A>, the object <A>a</A>, and <A>Pa</A>.
#! The output is the relative truth endomorphism
#! $\mathrm{not}: Pa \rightarrow Pa$.
#! @Returns a morphism in $\mathrm{Hom}( Pa, Pa )$
#! @Arguments Pa, a, Pa
DeclareOperation( "RelativeTruthMorphismOfNotWithGivenObjects",
        [ IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#! The argument is an object <A>a</A> in a category $C$.
#! The output is the relative truth morphism
#! $\mathrm{and}: \mathrm{PowerObject}( a ) \times \mathrm{PowerObject}( a ) \rightarrow \mathrm{PowerObject}( a )$.
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{PowerObject}( a ) \times \mathrm{PowerObject}( a ), \mathrm{PowerObject}( a ) )$
#! @Arguments a
DeclareAttribute( "RelativeTruthMorphismOfAnd",
        IsCapCategoryObject );

#! @Description
#! The arguments are the cartesian square <A>PaxPa</A> of the power object <A>Pa</A> of <A>a</A>, the object <A>a</A>, and <A>Pa</A>.
#! The output is the relative truth morphism
#! $\mathrm{and}: PaxPa \rightarrow Pa$.
#! @Returns a morphism in $\mathrm{Hom}( PaxPa, Pa )$
#! @Arguments PaxPa, a, Pa
DeclareOperation( "RelativeTruthMorphismOfAndWithGivenObjects",
        [ IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#! The argument is an object <A>a</A> in a category $C$.
#! The output is the relative truth morphism
#! $\mathrm{or}: \mathrm{PowerObject}( a ) \times \mathrm{PowerObject}( a ) \rightarrow \mathrm{PowerObject}( a )$.
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{PowerObject}( a ) \times \mathrm{PowerObject}( a ), \mathrm{PowerObject}( a ) )$
#! @Arguments a
DeclareAttribute( "RelativeTruthMorphismOfOr",
        IsCapCategoryObject );

#! @Description
#! The arguments are the cartesian square <A>PaxPa</A> of the power object <A>Pa</A> of <A>a</A>, the object <A>a</A>, and <A>Pa</A>.
#! The output is the relative truth morphism
#! $\mathrm{or}: PaxPa \rightarrow Pa$.
#! @Returns a morphism in $\mathrm{Hom}( PaxPa, Pa )$
#! @Arguments PaxPa, a, Pa
DeclareOperation( "RelativeTruthMorphismOfOrWithGivenObjects",
        [ IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#! The argument is an object <A>a</A> in a category $C$.
#! The output is the relative truth morphism
#! $\mathrm{implies}: \mathrm{PowerObject}( a ) \times \mathrm{PowerObject}( a ) \rightarrow \mathrm{PowerObject}( a )$.
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{PowerObject}( a ) \times \mathrm{PowerObject}( a ), \mathrm{PowerObject}( a ) )$
#! @Arguments a
DeclareAttribute( "RelativeTruthMorphismOfImplies",
        IsCapCategoryObject );

#! @Description
#! The arguments are the cartesian square <A>PaxPa</A> of the power object <A>Pa</A> of <A>a</A>, the object <A>a</A>, and <A>Pa</A>.
#! The output is the relative truth morphism
#! $\mathrm{implies}: PaxPa \rightarrow Pa$.
#! @Returns a morphism in $\mathrm{Hom}( PaxPa, Pa )$
#! @Arguments PaxPa, a, Pa
DeclareOperation( "RelativeTruthMorphismOfImpliesWithGivenObjects",
        [ IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject ] );

#! @InsertChunk RelativeTruthMorphisms

####################################
##
#! @Section Heyting algebra of subobjects
##
####################################

#! @Description
#!  The argument is a monomorphism $\iota: S \hookrightarrow A$.
#!  The output is the <Q>pseudo-complement of $S$ in $A$</Q>, i.e.,
#!  the pseudo-complement object of $\iota$.
#! @Returns an object
#! @Arguments iota
DeclareOperation( "PseudoComplementSubobject",
                  [ IsCapCategoryMorphism ] );

#! @Description
#!  The argument is a monomorphism $\iota: S \hookrightarrow A$.
#!  The output is the embedding <C>PseudoComplementSubobject</C>($\iota$) $\hookrightarrow A$
#!  of pseudo-complement object of $\iota$.
#! @Returns an object
#! @Arguments iota
DeclareOperation( "EmbeddingOfPseudoComplementSubobject",
                  [ IsCapCategoryMorphism ] );

#! @Description
#!  The argument is a monomorphism $\iota: S \hookrightarrow A$ and an object <A>T</A> with
#!  <C>IsEqualForObjects</C>(<A>T</A>, <C>PseudoComplementSubobject</C>($\iota$)).
#!  The output is the embedding of $\iota:T \hookrightarrow A$
#!  of pseudo-complement object <A>T</A> of $\iota$.
#! @Returns an object
#! @Arguments iota
DeclareOperation( "EmbeddingOfPseudoComplementSubobjectWithGivenPseudoComplement",
                  [ IsCapCategoryMorphism, IsCapCategoryObject ] );

#! @Description
#!  The arguments are two monomorphisms $\iota_i: S_i \hookrightarrow A$ for $i=1,2$.
#!  The output is the <Q>intersection of $S_1$ and $S_2$</Q>, which is
#!  naturally isomorphic to the pullback of $\iota_1$ and $\iota_2$.
#! @Returns an object
#! @Arguments iota1, iota2
DeclareOperation( "IntersectionSubobject",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism ] );

#! @Description
#!  The arguments are two monomorphisms $\iota_i: S_i \hookrightarrow A$ for $i=1,2$.
#!  The output is the embedding <C>IntersectionSubobject</C>($\iota$) $\hookrightarrow A$ of their intersection subobject.
#! @Returns a monomorphism into $A$
#! @Arguments iota1, iota2
DeclareOperation( "EmbeddingOfIntersectionSubobject",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism ] );

#! @Description
#!  The arguments are two monomorphisms $\iota_i: S_i \hookrightarrow A$ for $i=1,2$ and an object <A>T</A> with
#!  <C>IsEqualForObjects</C>(<A>T</A>, <C>IntersectionSubobject</C>(<A>iota1</A>, <A>iota2</A>)).
#!  The output is the embedding $T \hookrightarrow A$ of their intersection subobject <A>T</A>.
#! @Returns a monomorphism in $\mathrm{Hom}( T, A )$
#! @Arguments iota1, iota2, T
DeclareOperation( "EmbeddingOfIntersectionSubobjectWithGivenIntersection",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryObject ] );

#! @Description
#!  The arguments are two monomorphisms $\iota_i: S_i \hookrightarrow A$ for $i=1,2$.
#!  The output is the <Q>union of $S_1$ and $S_2$</Q>, which is
#!  naturally isomorphic to the image object of the coproduct morphism of $\iota_1$ and $\iota_2$.
#! @Returns an object
#! @Arguments iota1, iota2
DeclareOperation( "UnionSubobject",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism ] );

#! @Description
#!  The arguments are two monomorphisms $\iota_i: S_i \hookrightarrow A$ for $i=1,2$.
#!  The output is the embedding <C>UnionSubobject</C>(<A>iota1</A>, <A>iota2</A>) $\hookrightarrow A$ of their union subobject.
#! @Returns a monomorphism into $A$
#! @Arguments iota1, iota2
DeclareOperation( "EmbeddingOfUnionSubobject",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism ] );

#! @Description
#!  The arguments are two monomorphisms $\iota_i: S_i \hookrightarrow A$ for $i=1,2$ and an object <A>U</A> with
#!  <C>IsEqualForObjects</C>(<A>U</A>, <C>UnionSubobject</C>(<A>iota1</A>, <A>iota2</A>)).
#!  The output is the embedding $U \hookrightarrow A$ of their union subobject <A>U</A>.
#! @Returns a monomorphism in $\mathrm{Hom}( U, A )$
#! @Arguments iota1, iota2, U
DeclareOperation( "EmbeddingOfUnionSubobjectWithGivenUnion",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryObject ] );

#! @Description
#!  The arguments are two monomorphisms $\iota_i: S_i \hookrightarrow A$ for $i=1,2$.
#!  The output is the <Q>relative pseudo-complement of $S_1$ relative to $S_2$</Q>.
#! @Returns an object
#! @Arguments iota1, iota2
DeclareOperation( "RelativePseudoComplementSubobject",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism ] );

#! @Description
#!  The arguments are two monomorphisms $\iota_i: S_i \hookrightarrow A$ for $i=1,2$.
#!  The output is the embedding <C>RelativePseudoComplementSubobject</C>(<A>iota1</A>, <A>iota2</A>) $\hookrightarrow A$
#!  of their relative pseudo-complement into $A$.
#! @Returns a monomorphism into $A$
#! @Arguments iota1, iota2
DeclareOperation( "EmbeddingOfRelativePseudoComplementSubobject",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism ] );

#! @Description
#!  The arguments are two monomorphisms $\iota_i: S_i \hookrightarrow A$ for $i=1,2$ and an object <A>I</A> with
#!  <C>IsEqualForObjects</C>(<A>I</A>, <C>RelativePseudoComplementSubobject</C>(<A>iota1</A>, <A>iota2</A>)).
#!  The output is the embedding $I \hookrightarrow A$ of their relative pseudo-complement <A>I</A> into $A$.
#! @Returns a monomorphism in $\mathrm{Hom}( I, A )$
#! @Arguments iota1, iota2, I
DeclareOperation( "EmbeddingOfRelativePseudoComplementSubobjectWithGivenImplication",
        [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryObject ] );

###################################
##
#! @Section Pushout complements
##
###################################

#! @Description
#!  The arguments are two composable morphisms $l: K \rightarrow L$, $m: L \rightarrow G$.
#!  The output is <C>true</C> if there exists a morphism $d: K \rightarrow D$ and a morphism $g: D \rightarrow G$
#!  such that the four morphisms $l,d,m,g$ form a pushout diagram, i.e., such that
#!  $m$=<C>InjectionOfCofactorOfPushoutWithGivenPushout</C>([$l,d$], 1) and
#!  $g$=<C>InjectionOfCofactorOfPushoutWithGivenPushout</C>([$l,d$], 2).
#!  Otherwise the output is <C>false</C>.
#! @Returns a boolean
#! @Arguments l, m
DeclareOperation( "HasPushoutComplement",
        [ IsCapCategoryMorphism, IsCapCategoryMorphism ] );

#! @Description
#!  The arguments are two composable morphisms $l: K \rightarrow L$, $m: L \rightarrow G$.
#!  The output is a morphism $d: K \rightarrow D$ such that there exists a morphism $g: D \rightarrow G$
#!  turing the four morphisms $l,d,m,g$ into a pushout diagram, i.e., such that
#!  $m$=<C>InjectionOfCofactorOfPushoutWithGivenPushout</C>([$l,d$], 1) and
#!  $g$=<C>InjectionOfCofactorOfPushoutWithGivenPushout</C>([$l,d$], 2).
#! @Returns a morphism
#! @Arguments l, m
DeclareOperation( "PushoutComplement",
        [ IsCapCategoryMorphism, IsCapCategoryMorphism ] );

###################################
##
#! @Section Lawvere-Tierney topologies
##
###################################

#! @Description
#!  The input is an elementary topos <A>T</A>.
#!  The output is the list of Lawvere-Tierney idempotents of the subobject classifier of the topos <A>T</A>.
#! @Returns a list of endomorphisms in $\mathrm{Hom}( \mathrm{SubobjectClassifier}( T ), \mathrm{SubobjectClassifier}( T ) )$
#! @Arguments T
DeclareAttribute( "LawvereTierneyLocalModalityOperators",
        IsCapCategory );

#! @Description
#!  The input is an elementary topos <A>T</A>.
#!  The output is the list of Lawvere-Tierney subobjects of the subobject classifier of the topos <A>T</A>.
#! @Returns a list of monomorphisms into $\mathrm{SubobjectClassifier}( T )$
#! @Arguments T
DeclareAttribute( "LawvereTierneySubobjects",
        IsCapCategory );

#! @Description
#!  The input is an elementary topos <A>T</A>.
#!  The output is the list of embeddings of the subobject classifiers of full sheaf subtoposes
#!  (with respect to the Lawvere-Tierney topologies of the topos <A>T</A>) into the subobject classifier of <A>T</A>.
#! @Returns a list of monomorphisms $\mathrm{SubobjectClassifier}( T )$
#! @Arguments T
DeclareAttribute( "LawvereTierneyEmbeddingsOfSubobjectClassifiers",
        IsCapCategory );
