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
#! The argument are two objects <A>A</A>, <A>B</A>.
#! The output is a list of all morphisms from <A>A</A> to <A>B</A>.
#! @Returns a list of morphism
#! @Arguments A, B
DeclareOperation( "MorphismsOfExternalHom",
                  [ IsCapCategoryObject, IsCapCategoryObject ] );

###################################
##
#! @Section Exact cover with global elements
##
###################################

#! @Description
#!  The argument is an object <A>a</A> of a category $\mathbf{C}$.
#!  The output is a list $D$ of global elements of <A>a</A> (i.e.,
#!  morphisms from the terminal object $t$ of $\mathbf{C}$ to <A>a</A>),
#!  such that <C>UniversalMorphismFromCoproduct</C>(<A>a</A>, $D$)
#!  is an isomorphism.
#! @Returns a list of morphisms in $\mathrm{Hom}(t,a)$.
#! @Arguments a
DeclareAttribute( "ExactCoverWithGlobalElements",
        IsCapCategoryObject );

####################################
##
#! @Section Subobject Classifier
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

#! A subobject classifier object consists of three parts:
#! * an object $\Omega$,
#! * a function $\mathrm{true}$ providing a morphism $\mathrm{true}: 1 \rightarrow \Omega$,
#! * a function $\chi$ mapping each monomorphism $i : A \rightarrow S$ to a morphism $\chi_i : S \to \Omega$.
#! The triple $(\Omega,\mathrm{true},\chi)$ is called a <Emph>subobject classifier</Emph> if
#! for each monomorphism $i : A \to S$, the morphism $\chi_i : S \to \Omega$ is the unique
#! morphism such that $\chi_i \circ i = \mathrm{true} \circ \ast$ determine a pullback diagram.

#! @Description
#! The argument is a category $C$.
#! The output is a subobject classifier object $\Omega$ of $C$.
#! @Returns an object
#! @Arguments C
DeclareAttribute( "SubobjectClassifier",
        IsCapCategory );

#! @Description
#! The argument is a category $C$.
#! The output is cartesian square of a subobject classifier object $\Omega$ of $C$.
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
#! a subobject classifier $\Omega$. The output is the classifying morphism
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
#! @Returns a list of monomorphism
#! @Arguments A
DeclareAttribute( "ListOfSubobjects",
        IsCapCategoryObject );

####################################
##
#! @Section Truth Morphisms
##
####################################

#! @Description
#! The argument is a category $C$.
#! The output is the truth morphism of true into the subobject classifier
#! $\mathrm{true}: \mathrm{TerminalObject} \rightarrow \mathrm{SubobjectClassifier}$.
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{TerminalObject}, \mathrm{SubobjectClassifier} )$
#! @Arguments C
DeclareAttribute( "TruthMorphismOfTrue",
        IsCapCategory );

#! @Description
#! The arguments are a terminal object of the category and
#! a subobject classifier.
#! The output is the truth morphism of true into the subobject classifier <A>Omega</A>
#! $\mathrm{true}: \mathrm{TerminalObject} \rightarrow \Omega$.
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{TerminalObject}, \Omega )$
#! @Arguments T, Omega
DeclareOperation( "TruthMorphismOfTrueWithGivenObjects",
        [ IsCapCategoryObject, IsCapCategoryObject ]);

#! @Description
#! The argument is a category $C$.
#! The output is the truth morphism of false into the subobject classifier
#! $\mathrm{false}: \mathrm{TerminalObject} \rightarrow \mathrm{SubobjectClassifier}$.
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{TerminalObject}, \mathrm{SubobjectClassifier} )$
#! @Arguments C
DeclareAttribute( "TruthMorphismOfFalse",
        IsCapCategory );

#! @Description
#! The arguments are a terminal object of the category and
#! a subobject classifier.
#! The output is the truth morphism of false into the subobject classifier <A>Omega</A>
#! $\mathrm{false}: \mathrm{TerminalObject} \rightarrow \Omega$.
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{TerminalObject}, \Omega )$
#! @Arguments T, Omega
DeclareOperation( "TruthMorphismOfFalseWithGivenObjects",
        [ IsCapCategoryObject, IsCapCategoryObject ]);

#! @Description
#! The argument is a category $C$.
#! The output is the truth morphism of <Q>not</Q> of the subobject classifier
#! $\mathrm{not}: \mathrm{SubobjectClassifier} \rightarrow \mathrm{SubobjectClassifier}$.
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{SubobjectClassifier}, \mathrm{SubobjectClassifier} )$
#! @Arguments C
DeclareAttribute( "TruthMorphismOfNot",
        IsCapCategory );

#! @Description
#! The argument is a subobject classifier.
#! The output is the truth endomorphism of <Q>not</Q> of the subobject classifier <A>Omega</A>
#! $\mathrm{not}: \Omega \rightarrow \Omega$.
#! @Returns a morphism in $\mathrm{Hom}( \Omega, \Omega )$
#! @Arguments Omega, Omega
DeclareOperation( "TruthMorphismOfNotWithGivenObjects",
        [ IsCapCategoryObject, IsCapCategoryObject ]);

#! @Description
#! The argument is a category $C$.
#! The output is the truth morphism of <Q>and</Q> into the subobject classifier
#! $\mathrm{and}: \mathrm{CartesianSquareOfSubobjectClassifier} \rightarrow \mathrm{SubobjectClassifier}$.
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{CartesianSquareOfSubobjectClassifier}, \mathrm{SubobjectClassifier} )$
#! @Arguments C
DeclareAttribute( "TruthMorphismOfAnd",
        IsCapCategory );

#! @Description
#! The arguments are a cartesian square of a subobject classifier of the category and
#! a subobject classifier.
#! The output is the truth morphism of <Q>and</Q> into the subobject classifier <A>Omega</A>
#! $\mathrm{and}: \Omega^{\times 2} \rightarrow \Omega$.
#! @Returns a morphism in $\mathrm{Hom}( \Omega^{\times 2}, \Omega )$
#! @Arguments Omega2, Omega
DeclareOperation( "TruthMorphismOfAndWithGivenObjects",
                  [ IsCapCategoryObject, IsCapCategoryObject ]);

#! @Description
#! The argument is a category $C$.
#! The output is the truth morphism of <Q>or</Q> into the subobject classifier
#! $\mathrm{or}: \mathrm{CartesianSquareOfSubobjectClassifier} \rightarrow \mathrm{SubobjectClassifier}$.
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{CartesianSquareOfSubobjectClassifier}, \mathrm{SubobjectClassifier} )$
#! @Arguments C
DeclareAttribute( "TruthMorphismOfOr",
        IsCapCategory );

#! @Description
#! The arguments are a cartesian square of a subobject classifier of the category and
#! a subobject classifier.
#! The output is the truth morphism of <Q>or</Q> into the subobject classifier <A>Omega</A>
#! $\mathrm{or}: \Omega^{\times 2} \rightarrow \Omega$.
#! @Returns a morphism in $\mathrm{Hom}( \Omega^{\times 2}, \Omega )$
#! @Arguments Omega2, Omega
DeclareOperation( "TruthMorphismOfOrWithGivenObjects",
        [ IsCapCategoryObject, IsCapCategoryObject ]);

#! @Description
#! The argument is a category $C$.
#! The output is the truth morphism of <Q>implies</Q> into the subobject classifier
#! $\mathrm{implies}: \mathrm{CartesianSquareOfSubobjectClassifier} \rightarrow \mathrm{SubobjectClassifier}$.
#! @Returns a morphism in $\mathrm{Hom}( \mathrm{CartesianSquareOfSubobjectClassifier}, \mathrm{SubobjectClassifier} )$
#! @Arguments C
DeclareAttribute( "TruthMorphismOfImplies",
        IsCapCategory );

#! @Description
#! The arguments are a cartesian square of a subobject classifier of the category and
#! a subobject classifier.
#! The output is the truth morphism of <Q>implies</Q> into the subobject classifier <A>Omega</A>
#! $\mathrm{implies}: \Omega^{\times 2} \rightarrow \Omega$.
#! @Returns a morphism in $\mathrm{Hom}( \Omega^{\times 2}, \Omega )$
#! @Arguments Omega2, Omega
DeclareOperation( "TruthMorphismOfImpliesWithGivenObjects",
        [ IsCapCategoryObject, IsCapCategoryObject ]);

####################################
##
#! @Section Power object
##
####################################

#! @Description
#! The argument is an object $a$.
#! The output is the power object $P(a)$ of $a$.
#! @Arguments a
#! @Returns an object
DeclareAttribute( "PowerObject",
        IsCapCategoryObject );

#! @Description
#! The argument is a morphism $f:a \to b$.
#! The output is the power morphism of $P(f): P(b) \to P(a)$.
#! @Arguments f
#! @Returns a morphism
DeclareAttribute( "PowerObjectFunctorial",
        IsCapCategoryMorphism );
#! @InsertChunk PowerObjectFunctorial

#! @Description
#! The arguments are an object $Pb$, a morphism $f:a \to b$, and and object $Pa$,
#! such that $Pa = P(a)$ and $Pb = P(b)$.
#! The output is the power morphism of $P(f): Pb \to Pa$.
#! @Arguments Pb, f, Pa
#! @Returns a morphism
DeclareOperation( "PowerObjectFunctorialWithGivenPowerObjects",
        [ IsCapCategoryObject, IsCapCategoryMorphism, IsCapCategoryObject ] );

#! @Description
#! The argument is an object $a$.
#! The output is the singleton morphism from $a$ to the power object $\mathrm{PowerObject}(a)$.
#! @Arguments a
#! @Returns a morphism in $\mathrm{Hom}( a, \mathrm{PowerObject}(a) )$
DeclareAttribute( "SingletonMorphism",
        IsCapCategoryObject );

#! @Description
#! The arguments are an object $a$ and object $b$ which is equal to the power object $\mathrm{PowerObject}(a)$.
#! The output is the singleton morphism from $a$ to $b$.
#! @Arguments a, b
#! @Returns a morphism in $\mathrm{Hom}( a, b )$
DeclareOperation( "SingletonMorphismWithGivenPowerObject",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

####################################
##
#! @Section Heyting Algebra of Subobjects
##
####################################

#! @Description
#!  The argument is a monomorphism $\iota: S \hookrightarrow A$.
#!  The output is the <Q>pseudo-complement of $S$ in $A$</Q>, i.e.,
#!  the pseudo-complement object of $\iota$.
#! @Returns an object
#! @Arguments iota
DeclareOperation( "PseudoComplementSubobject",
                  [ IsCapCategoryMorphism ]);

#! @Description
#!  The argument is a monomorphism $\iota: S \hookrightarrow A$.
#!  The output is the embedding <C>PseudoComplementSubobject</C>($\iota$) $\hookrightarrow A$
#!  of pseudo-complement object of $\iota$.
#! @Returns an object
#! @Arguments iota
DeclareOperation( "EmbeddingOfPseudoComplementSubobject",
                  [ IsCapCategoryMorphism ]);

#! @Description
#!  The argument is a monomorphism $\iota: S \hookrightarrow A$ and an object $T$ with
#!  <C>IsEqualForObjects</C>($T$, <C>PseudoComplementSubobject</C>($\iota$)).
#!  The output is the embedding of $\iota:T \hookrightarrow A$
#!  of pseudo-complement object $T$ of $\iota$.
#! @Returns an object
#! @Arguments iota
DeclareOperation( "EmbeddingOfPseudoComplementSubobjectWithGivenPseudoComplement",
                  [ IsCapCategoryMorphism, IsCapCategoryObject ]);

#! @Description
#!  The arguments are two monomorphisms $\iota_i: S_i \hookrightarrow A$ for $i=1,2$.
#!  The output is the <Q>intersection of $S_1$ and $S_2$</Q>, which is
#!  naturally isomorphic to the pullback of $\iota_1$ and $\iota_2$.
#! @Returns an object
#! @Arguments iota1, iota2
DeclareOperation( "IntersectionSubobject",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism ]);

#! @Description
#!  The arguments are two monomorphisms $\iota_i: S_i \hookrightarrow A$ for $i=1,2$.
#!  The output is the embedding <C>IntersectionSubobject</C>($\iota$) $\hookrightarrow A$ of their intersection subobject.
#! @Returns a monomorphism
#! @Arguments iota1, iota2
DeclareOperation( "EmbeddingOfIntersectionSubobject",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism ]);

#! @Description
#!  The arguments are two monomorphisms $\iota_i: S_i \hookrightarrow A$ for $i=1,2$ and an object $T$ with
#!  <C>IsEqualForObjects</C>($T$, <C>IntersectionSubobject</C>($\iota$)).
#!  The output the embedding $T \hookrightarrow A$ of their intersection subobject $T$.
#! @Returns a monomorphism
#! @Arguments iota1, iota2
DeclareOperation( "EmbeddingOfIntersectionSubobjectWithGivenIntersection",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryObject ]);

#! @Description
#!  The arguments are two monomorphisms $\iota_i: S_i \hookrightarrow A$ for $i=1,2$.
#!  The output is the <Q>union of $S_1$ and $S_2$</Q>, which is
#!  naturally isomorphic to the image object of the coproduct morphism of $\iota_1$ and $\iota_2$.
#! @Returns an object
#! @Arguments iota1, iota2
DeclareOperation( "UnionSubobject",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism ]);

#! @Description
#!  The arguments are two monomorphisms $\iota_i: S_i \hookrightarrow A$ for $i=1,2$.
#!  The output is the embedding <C>UnionSubobject</C>($\iota$) $\hookrightarrow A$ of their union subobject.
#! @Returns a monomorphism
#! @Arguments iota1, iota2
DeclareOperation( "EmbeddingOfUnionSubobject",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism ]);

#! @Description
#!  The arguments are two monomorphisms $\iota_i: S_i \hookrightarrow A$ for $i=1,2$ and an object $T$ with
#!  <C>IsEqualForObjects</C>($T$, <C>UnionSubobject</C>($\iota$)).
#!  The output is the embedding $T \hookrightarrow A$ of their union subobject $T$.
#! @Returns a monomorphism
#! @Arguments iota1, iota2
DeclareOperation( "EmbeddingOfUnionSubobjectWithGivenUnion",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryObject ]);

#! @Description
#!  The arguments are two monomorphisms $\iota_i: S_i \hookrightarrow A$ for $i=1,2$.
#!  The output is the <Q>relative pseudo-complement of $S_1$ relative to $S_2$</Q>.
#! @Returns an object
#! @Arguments iota1, iota2
DeclareOperation( "RelativePseudoComplementSubobject",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism ]);

#! @Description
#!  The arguments are two monomorphisms $\iota_i: S_i \hookrightarrow A$ for $i=1,2$.
#!  The output is the embedding <C>RelativePseudoComplementSubobject</C>($\iota$) $\hookrightarrow A$
#!  of their relative pseudo-complement into $A$.
#! @Returns a monomorphism
#! @Arguments iota1, iota2
DeclareOperation( "EmbeddingOfRelativePseudoComplementSubobject",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism ]);

#! @Description
#!  The arguments are two monomorphisms $\iota_i: S_i \hookrightarrow A$ for $i=1,2$ and an object $T$ with
#!  <C>IsEqualForObjects</C>($T$, <C>RelativePseudoComplementSubobject</C>($\iota$)).
#!  The output is the embedding $T \hookrightarrow A$ of their relative pseudo-complement $T$ into $A$.
#! @Returns a monomorphism
#! @Arguments iota1, iota2
DeclareOperation( "EmbeddingOfRelativePseudoComplementSubobjectWithGivenImplication",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryObject ]);

###################################
##
#! @Section Lawvere-Tierney topologies
##
###################################

#! @Description
#!  The input is an elementary topos <A>T</A>.
#!  The output is the list of Lawvere-Tierney idempotents of the subobject classifier of the topos <A>T</A>.
#! @Returns a list
#! @Arguments T
DeclareAttribute( "LawvereTierneyLocalModalityOperators",
        IsCapCategory );

#! @Description
#!  The input is an elementary topos <A>T</A>.
#!  The output is the list of Lawvere-Tierney subobjects of the subobject classifier of the topos <A>T</A>.
#! @Returns a list
#! @Arguments T
DeclareAttribute( "LawvereTierneySubobjects",
        IsCapCategory );

#! @Description
#!  The input is an elementary topos <A>T</A>.
#!  The output is the list of embeddings of the subobject classifiers of full sheaf subtoposes
#!  (with respect to the Lawvere-Tierney topologies of the topos <A>T</A>) into the subobject classifier of <A>T</A>.
#! @Returns a list
#! @Arguments T
DeclareAttribute( "LawvereTierneyEmbeddingsOfSubobjectClassifiers",
        IsCapCategory );

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
