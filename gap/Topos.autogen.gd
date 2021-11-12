# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#
# Declarations
#
# THIS FILE IS AUTOMATICALLY GENERATED, SEE CAP_project/CAP/gap/MethodRecord.gi

#! @Chapter Toposes

#! @Section Subobject Classifier

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CartesianSquareOfSubobjectClassifier`.
#! $F: (  ) \mapsto \mathtt{CartesianSquareOfSubobjectClassifier}()$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCartesianSquareOfSubobjectClassifier",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddCartesianSquareOfSubobjectClassifier",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddCartesianSquareOfSubobjectClassifier",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddCartesianSquareOfSubobjectClassifier",
                  [ IsCapCategory, IsList ] );

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `ClassifyingMorphismOfSubobject`.
#! $F: ( alpha ) \mapsto \mathtt{ClassifyingMorphismOfSubobject}(alpha)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddClassifyingMorphismOfSubobject",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddClassifyingMorphismOfSubobject",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddClassifyingMorphismOfSubobject",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddClassifyingMorphismOfSubobject",
                  [ IsCapCategory, IsList ] );

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier`.
#! $F: ( alpha, Omega ) \mapsto \mathtt{ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier}(alpha, Omega)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier",
                  [ IsCapCategory, IsList ] );

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `SubobjectClassifier`.
#! $F: (  ) \mapsto \mathtt{SubobjectClassifier}()$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddSubobjectClassifier",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddSubobjectClassifier",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddSubobjectClassifier",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddSubobjectClassifier",
                  [ IsCapCategory, IsList ] );

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `SubobjectOfClassifyingMorphism`.
#! $F: ( alpha ) \mapsto \mathtt{SubobjectOfClassifyingMorphism}(alpha)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddSubobjectOfClassifyingMorphism",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddSubobjectOfClassifyingMorphism",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddSubobjectOfClassifyingMorphism",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddSubobjectOfClassifyingMorphism",
                  [ IsCapCategory, IsList ] );

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `TruthMorphismOfAnd`.
#! $F: (  ) \mapsto \mathtt{TruthMorphismOfAnd}()$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddTruthMorphismOfAnd",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddTruthMorphismOfAnd",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddTruthMorphismOfAnd",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddTruthMorphismOfAnd",
                  [ IsCapCategory, IsList ] );

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `TruthMorphismOfAndWithGivenObjects`.
#! $F: ( Omega2, Omega ) \mapsto \mathtt{TruthMorphismOfAndWithGivenObjects}(Omega2, Omega)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddTruthMorphismOfAndWithGivenObjects",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddTruthMorphismOfAndWithGivenObjects",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddTruthMorphismOfAndWithGivenObjects",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddTruthMorphismOfAndWithGivenObjects",
                  [ IsCapCategory, IsList ] );

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `TruthMorphismOfFalse`.
#! $F: (  ) \mapsto \mathtt{TruthMorphismOfFalse}()$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddTruthMorphismOfFalse",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddTruthMorphismOfFalse",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddTruthMorphismOfFalse",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddTruthMorphismOfFalse",
                  [ IsCapCategory, IsList ] );

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `TruthMorphismOfFalseWithGivenObjects`.
#! $F: ( T, Omega ) \mapsto \mathtt{TruthMorphismOfFalseWithGivenObjects}(T, Omega)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddTruthMorphismOfFalseWithGivenObjects",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddTruthMorphismOfFalseWithGivenObjects",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddTruthMorphismOfFalseWithGivenObjects",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddTruthMorphismOfFalseWithGivenObjects",
                  [ IsCapCategory, IsList ] );

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `TruthMorphismOfOr`.
#! $F: (  ) \mapsto \mathtt{TruthMorphismOfOr}()$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddTruthMorphismOfOr",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddTruthMorphismOfOr",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddTruthMorphismOfOr",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddTruthMorphismOfOr",
                  [ IsCapCategory, IsList ] );

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `TruthMorphismOfOrWithGivenObjects`.
#! $F: ( Omega2, Omega ) \mapsto \mathtt{TruthMorphismOfOrWithGivenObjects}(Omega2, Omega)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddTruthMorphismOfOrWithGivenObjects",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddTruthMorphismOfOrWithGivenObjects",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddTruthMorphismOfOrWithGivenObjects",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddTruthMorphismOfOrWithGivenObjects",
                  [ IsCapCategory, IsList ] );

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `TruthMorphismOfTrue`.
#! $F: (  ) \mapsto \mathtt{TruthMorphismOfTrue}()$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddTruthMorphismOfTrue",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddTruthMorphismOfTrue",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddTruthMorphismOfTrue",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddTruthMorphismOfTrue",
                  [ IsCapCategory, IsList ] );

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `TruthMorphismOfTrueWithGivenObjects`.
#! $F: ( T, Omega ) \mapsto \mathtt{TruthMorphismOfTrueWithGivenObjects}(T, Omega)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddTruthMorphismOfTrueWithGivenObjects",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddTruthMorphismOfTrueWithGivenObjects",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddTruthMorphismOfTrueWithGivenObjects",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddTruthMorphismOfTrueWithGivenObjects",
                  [ IsCapCategory, IsList ] );
