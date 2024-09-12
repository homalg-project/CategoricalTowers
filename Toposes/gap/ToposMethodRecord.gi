# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#
# Implementations
#

##
InstallValue( TOPOS_METHOD_NAME_RECORD, rec(

ExactCoverWithGlobalElements := rec(
  filter_list := [ "category", "object" ],
  return_type := "list_of_morphisms" ),

IndexOfNonliftableMorphismFromDistinguishedObject := rec(
  filter_list := [ "category", "morphism" ],
  return_type := "nonneg_integer_or_infinity",
  input_arguments_names := [ "cat", "iota" ] ),

NonliftableMorphismFromDistinguishedObject := rec(
  filter_list := [ "category", "morphism" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "iota" ],
  output_source_getter_string := "DistinguishedObjectOfHomomorphismStructure( cat )",
  output_source_getter_preconditions := [ [ "DistinguishedObjectOfHomomorphismStructure", 1 ] ],
  output_range_getter_string := "Target( iota )",
  output_range_getter_preconditions := [ ] ),

CoproductComplement := rec(
  filter_list := [ "category", "morphism" ],
  input_arguments_names := [ "cat", "iota" ],
  return_type := "object",
  dual_operation := "DirectProductComplement",
  compatible_with_congruence_of_morphisms := false,
),

InjectionOfCoproductComplement := rec(
  filter_list := [ "category", "morphism" ],
  input_arguments_names := [ "cat", "iota" ],
  output_range_getter_string := "Target( iota )",
  output_range_getter_preconditions := [ ],
  with_given_object_position := "Source",
  return_type := "morphism",
  dual_operation := "ProjectionInDirectProductComplement",
  compatible_with_congruence_of_morphisms := false,
),

InjectionOfCoproductComplementWithGivenCoproductComplement := rec(
  filter_list := [ "category", "morphism", "object" ],
  input_arguments_names := [ "cat", "iota", "complement" ],
  output_source_getter_string := "complement",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Target( iota )",
  output_range_getter_preconditions := [ ],
  return_type := "morphism",
  dual_operation := "ProjectionInDirectProductComplementWithGivenDirectProductComplement",
  compatible_with_congruence_of_morphisms := false,
),

DirectProductComplement := rec(
  filter_list := [ "category", "morphism" ],
  input_arguments_names := [ "cat", "pi" ],
  return_type := "object",
  dual_operation := "CoproductComplement",
  compatible_with_congruence_of_morphisms := false,
),

ProjectionInDirectProductComplement := rec(
  filter_list := [ "category", "morphism" ],
  input_arguments_names := [ "cat", "pi" ],
  output_source_getter_string := "Source( pi )",
  output_source_getter_preconditions := [ ],
  with_given_object_position := "Range",
  return_type := "morphism",
  dual_operation := "InjectionOfCoproductComplement",
  compatible_with_congruence_of_morphisms := false,
),

ProjectionInDirectProductComplementWithGivenDirectProductComplement := rec(
  filter_list := [ "category", "morphism", "object" ],
  input_arguments_names := [ "cat", "pi", "complement" ],
  output_source_getter_string := "Source( pi )",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "complement",
  output_range_getter_preconditions := [ ],
  return_type := "morphism",
  dual_operation := "InjectionOfCoproductComplementWithGivenCoproductComplement",
  compatible_with_congruence_of_morphisms := false,
),

SubobjectClassifier := rec(
  filter_list := [ "category" ],
  return_type := "object" ),

CartesianSquareOfSubobjectClassifier := rec(
  filter_list := [ "category" ],
  return_type := "object" ),

TruthMorphismOfTrue := rec(
  filter_list := [ "category" ],
  return_type := "morphism",
  output_source_getter_string := "TerminalObject( cat )",
  output_source_getter_preconditions := [ [ "TerminalObject", 1 ] ],
  output_range_getter_string := "SubobjectClassifier( cat )",
  output_range_getter_preconditions := [ [ "SubobjectClassifier", 1 ] ],
  with_given_object_position := "both" ),

TruthMorphismOfTrueWithGivenObjects := rec(
  filter_list := [ "category", "object", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "T", "Omega" ],
  output_source_getter_string := "T",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Omega",
  output_range_getter_preconditions := [ ],
),

TruthMorphismOfFalse := rec(
  filter_list := [ "category" ],
  return_type := "morphism",
  output_source_getter_string := "TerminalObject( cat )",
  output_source_getter_preconditions := [ [ "TerminalObject", 1 ] ],
  output_range_getter_string := "SubobjectClassifier( cat )",
  output_range_getter_preconditions := [ [ "SubobjectClassifier", 1 ] ],
  with_given_object_position := "both" ),

TruthMorphismOfFalseWithGivenObjects := rec(
  filter_list := [ "category", "object", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "T", "Omega" ],
  output_source_getter_string := "T",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Omega",
  output_range_getter_preconditions := [ ],
),

TruthMorphismOfNot := rec(
  filter_list := [ "category" ],
  return_type := "morphism",
  output_source_getter_string := "SubobjectClassifier( cat )",
  output_source_getter_preconditions := [ [ "SubobjectClassifier", 1 ] ],
  output_range_getter_string := "SubobjectClassifier( cat )",
  output_range_getter_preconditions := [ [ "SubobjectClassifier", 1 ] ],
  with_given_object_position := "both" ),

TruthMorphismOfNotWithGivenObjects := rec(
  filter_list := [ "category", "object", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "Omega", "Omega1" ],
  output_source_getter_string := "Omega",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Omega1",
  output_range_getter_preconditions := [ ],
),

TruthMorphismOfAnd := rec(
  filter_list := [ "category" ],
  return_type := "morphism",
  output_source_getter_string := "CartesianSquareOfSubobjectClassifier( cat )",
  output_source_getter_preconditions := [ [ "CartesianSquareOfSubobjectClassifier", 1 ] ],
  output_range_getter_string := "SubobjectClassifier( cat )",
  output_range_getter_preconditions := [ [ "SubobjectClassifier", 1 ] ],
  with_given_object_position := "both" ),

TruthMorphismOfAndWithGivenObjects := rec(
  filter_list := [ "category", "object", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "Omega2", "Omega" ],
  output_source_getter_string := "Omega2",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Omega",
  output_range_getter_preconditions := [ ],
),

TruthMorphismOfOr := rec(
  filter_list := [ "category" ],
  return_type := "morphism",
  output_source_getter_string := "CartesianSquareOfSubobjectClassifier( cat )",
  output_source_getter_preconditions := [ [ "CartesianSquareOfSubobjectClassifier", 1 ] ],
  output_range_getter_string := "SubobjectClassifier( cat )",
  output_range_getter_preconditions := [ [ "SubobjectClassifier", 1 ] ],
  with_given_object_position := "both" ),

TruthMorphismOfOrWithGivenObjects := rec(
  filter_list := [ "category", "object", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "Omega2", "Omega" ],
  output_source_getter_string := "Omega2",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Omega",
  output_range_getter_preconditions := [ ],
),

TruthMorphismOfImplies := rec(
  filter_list := [ "category" ],
  return_type := "morphism",
  output_source_getter_string := "CartesianSquareOfSubobjectClassifier( cat )",
  output_source_getter_preconditions := [ [ "CartesianSquareOfSubobjectClassifier", 1 ] ],
  output_range_getter_string := "SubobjectClassifier( cat )",
  output_range_getter_preconditions := [ [ "SubobjectClassifier", 1 ] ],
  with_given_object_position := "both" ),

TruthMorphismOfImpliesWithGivenObjects := rec(
  filter_list := [ "category", "object", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "Omega2", "Omega" ],
  output_source_getter_string := "Omega2",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Omega",
  output_range_getter_preconditions := [ ],
),

ClassifyingMorphismOfSubobject := rec(
  filter_list := [ "category", "morphism" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "alpha" ],
  output_range_getter_string := "SubobjectClassifier( cat )",
  output_range_getter_preconditions := [ [ "SubobjectClassifier", 1 ] ],
  with_given_object_position := "Range" ),

ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier := rec(
  filter_list := [ "category", "morphism", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "alpha", "Omega" ],
  output_source_getter_string := "Target( alpha )",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Omega",
  output_range_getter_preconditions := [ ],
),

SubobjectOfClassifyingMorphism := rec(
  filter_list := [ "category", "morphism" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "alpha" ],
  output_range_getter_string := "Source( alpha )",
  output_range_getter_preconditions := [ ],
),

PowerObject := rec(
  filter_list := [ "category", "object" ],
  return_type := "object",
  functorial := "PowerObjectFunctorial" ),

PowerObjectFunctorial := rec(
  filter_list := [ "category", "morphism" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "f" ],
  output_source_getter_string := "PowerObject( cat, Target( f ) )",
  output_source_getter_preconditions := [ [ "PowerObject", 1 ] ],
  output_range_getter_string := "PowerObject( cat, Source( f ) )",
  output_range_getter_preconditions := [ [ "PowerObject", 1 ] ],
  with_given_object_position := "both" ),

PowerObjectFunctorialWithGivenPowerObjects := rec(
  filter_list := [ "category", "object", "morphism", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "Pb", "f", "Pa" ],
  output_source_getter_string := "Pb",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Pa",
  output_range_getter_preconditions := [ ],
),

PowerObjectRightEvaluationMorphism := rec(
  filter_list := [ "category", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "a" ],
  output_source_getter_string := "DirectProduct( cat, [ a, PowerObject( cat, a ) ] )",
  output_source_getter_preconditions := [ [ "PowerObject", 1 ], [ "DirectProduct", 1 ] ],
  output_range_getter_string := "SubobjectClassifier( cat )",
  output_range_getter_preconditions := [ [ "SubobjectClassifier", 1 ] ],
  with_given_object_position := "both" ),

PowerObjectRightEvaluationMorphismWithGivenObjects := rec(
  filter_list := [ "category", "object", "object", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "axPa", "a", "Omega" ],
  output_source_getter_string := "axPa",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Omega",
  output_range_getter_preconditions := [ ],
),

PowerObjectLeftEvaluationMorphism := rec(
  filter_list := [ "category", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "a" ],
  output_source_getter_string := "DirectProduct( cat, [ PowerObject( cat, a ), a ] )",
  output_source_getter_preconditions := [ [ "PowerObject", 1 ], [ "DirectProduct", 1 ] ],
  output_range_getter_string := "SubobjectClassifier( cat )",
  output_range_getter_preconditions := [ [ "SubobjectClassifier", 1 ] ],
  with_given_object_position := "both" ),

PowerObjectLeftEvaluationMorphismWithGivenObjects := rec(
  filter_list := [ "category", "object", "object", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "Pa_xa", "a", "Omega" ],
  output_source_getter_string := "Pa_xa",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Omega",
  output_range_getter_preconditions := [ ],
),

PRightTransposeMorphism := rec(
  filter_list := [ "category", "object", "object", "morphism" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "a", "b", "f" ],
  output_source_getter_string := "b",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "PowerObject( cat, a )",
  output_range_getter_preconditions := [ [ "PowerObject", 1 ] ],
  with_given_object_position := "Range" ),

PRightTransposeMorphismWithGivenRange := rec(
  filter_list := [ "category", "object", "object", "morphism", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "a", "b", "f", "Pa" ],
  output_source_getter_string := "b",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Pa",
  output_range_getter_preconditions := [ ],
),

PLeftTransposeMorphism := rec(
  filter_list := [ "category", "object", "object", "morphism" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "a", "b", "f" ],
  output_source_getter_string := "a",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "PowerObject( cat, b )",
  output_range_getter_preconditions := [ [ "PowerObject", 1 ] ],
  with_given_object_position := "Range" ),

PLeftTransposeMorphismWithGivenRange := rec(
  filter_list := [ "category", "object", "object", "morphism", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "a", "b", "f", "Pb" ],
  output_source_getter_string := "a",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Pb",
  output_range_getter_preconditions := [ ],
),

UpperSegmentOfRelation := rec(
  filter_list := [ "category", "object", "object", "morphism" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "a", "b", "mu" ],
  output_source_getter_string := "a",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "PowerObject( cat, b )",
  output_range_getter_preconditions := [ [ "PowerObject", 1 ] ],
  with_given_object_position := "Range" ),

UpperSegmentOfRelationWithGivenRange := rec(
  filter_list := [ "category", "object", "object", "morphism", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "a", "b", "mu", "Pb" ],
  output_source_getter_string := "a",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Pb",
  output_range_getter_preconditions := [ ],
),

LowerSegmentOfRelation := rec(
  filter_list := [ "category", "object", "object", "morphism" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "a", "b", "mu" ],
  output_source_getter_string := "b",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "PowerObject( cat, a )",
  output_range_getter_preconditions := [ [ "PowerObject", 1 ] ],
  with_given_object_position := "Range" ),

LowerSegmentOfRelationWithGivenRange := rec(
  filter_list := [ "category", "object", "object", "morphism", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "a", "b", "mu", "Pa" ],
  output_source_getter_string := "b",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Pa",
  output_range_getter_preconditions := [ ],
),

SingletonMorphism := rec(
  filter_list := [ "category", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "a" ],
  output_source_getter_string := "a",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "PowerObject( cat, a )",
  output_range_getter_preconditions := [ [ "PowerObject", 1 ] ],
  with_given_object_position := "Range" ),

SingletonMorphismWithGivenPowerObject := rec(
  filter_list := [ "category", "object", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "a", "Pa" ],
  output_source_getter_string := "a",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Pa",
  output_range_getter_preconditions := [ ],
),

IsomorphismOntoCartesianSquareOfPowerObject := rec(
  filter_list := [ "category", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "a" ],
  output_source_getter_string := "ExponentialOnObjects( cat, a, CartesianSquareOfSubobjectClassifier( cat ) )",
  output_source_getter_preconditions := [ [ "ExponentialOnObjects", 1 ], [ "CartesianSquareOfSubobjectClassifier", 1 ] ],
  output_range_getter_string := "DirectProduct( cat, [ PowerObject( cat, a ), PowerObject( cat, a ) ] )",
  output_range_getter_preconditions := [ [ "DirectProduct", 1 ], [ "PowerObject", 2 ] ],
  with_given_object_position := "both" ),

IsomorphismOntoCartesianSquareOfPowerObjectWithGivenObjects := rec(
  filter_list := [ "category", "object", "object", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "ExpaOmega2", "a", "PaxPa" ],
  output_source_getter_string := "ExpaOmega2",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "PaxPa",
  output_range_getter_preconditions := [ ],
),

RelativeTruthMorphismOfTrue := rec(
  filter_list := [ "category", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "a" ],
  output_source_getter_string := "TerminalObject( cat )",
  output_source_getter_preconditions := [ [ "TerminalObject", 1 ] ],
  output_range_getter_string := "PowerObject( cat, a )",
  output_range_getter_preconditions := [ [ "PowerObject", 1 ] ],
  with_given_object_position := "both" ),

RelativeTruthMorphismOfTrueWithGivenObjects := rec(
  filter_list := [ "category", "object", "object", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "T", "a", "Pa" ],
  output_source_getter_string := "T",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Pa",
  output_range_getter_preconditions := [ ],
),

RelativeTruthMorphismOfFalse := rec(
  filter_list := [ "category", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "a" ],
  output_source_getter_string := "TerminalObject( cat )",
  output_source_getter_preconditions := [ [ "TerminalObject", 1 ] ],
  output_range_getter_string := "PowerObject( cat, a )",
  output_range_getter_preconditions := [ [ "PowerObject", 1 ] ],
  with_given_object_position := "both" ),

RelativeTruthMorphismOfFalseWithGivenObjects := rec(
  filter_list := [ "category", "object", "object", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "T", "a", "Pa" ],
  output_source_getter_string := "T",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Pa",
  output_range_getter_preconditions := [ ],
),

RelativeTruthMorphismOfNot := rec(
  filter_list := [ "category", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "a" ],
  output_source_getter_string := "PowerObject( cat, a )",
  output_source_getter_preconditions := [ [ "PowerObject", 1 ] ],
  output_range_getter_string := "PowerObject( cat, a )",
  output_range_getter_preconditions := [ [ "PowerObject", 1 ] ],
  with_given_object_position := "both" ),

RelativeTruthMorphismOfNotWithGivenObjects := rec(
  filter_list := [ "category", "object", "object", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "Pa", "a", "Pa1" ],
  output_source_getter_string := "Pa",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Pa1",
  output_range_getter_preconditions := [ ],
),

RelativeTruthMorphismOfAnd := rec(
  filter_list := [ "category", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "a" ],
  output_source_getter_string := "DirectProduct( cat, [ PowerObject( cat, a ), PowerObject( cat, a ) ] )",
  output_source_getter_preconditions := [ [ "DirectProduct", 1 ], [ "PowerObject", 2 ] ],
  output_range_getter_string := "PowerObject( cat, a )",
  output_range_getter_preconditions := [ [ "PowerObject", 1 ] ],
  with_given_object_position := "both" ),

RelativeTruthMorphismOfAndWithGivenObjects := rec(
  filter_list := [ "category", "object", "object", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "PaxPa", "a", "Pa" ],
  output_source_getter_string := "PaxPa",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Pa",
  output_range_getter_preconditions := [ ],
),

RelativeTruthMorphismOfOr := rec(
  filter_list := [ "category", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "a" ],
  output_source_getter_string := "BinaryDirectProduct( cat, PowerObject( cat, a ), PowerObject( cat, a ) )",
  output_source_getter_preconditions := [ [ "DirectProduct", 1 ], [ "PowerObject", 2 ] ],
  output_range_getter_string := "PowerObject( cat, a )",
  output_range_getter_preconditions := [ [ "PowerObject", 1 ] ],
  with_given_object_position := "both" ),

RelativeTruthMorphismOfOrWithGivenObjects := rec(
  filter_list := [ "category", "object", "object", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "PaxPa", "a", "Pa" ],
  output_source_getter_string := "PaxPa",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Pa",
  output_range_getter_preconditions := [ ],
),

RelativeTruthMorphismOfImplies := rec(
  filter_list := [ "category", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "a" ],
  output_source_getter_string := "DirectProduct( cat, [ PowerObject( cat, a ), PowerObject( cat, a ) ] )",
  output_source_getter_preconditions := [ [ "DirectProduct", 1 ], [ "PowerObject", 2 ] ],
  output_range_getter_string := "PowerObject( cat, a )",
  output_range_getter_preconditions := [ [ "PowerObject", 1 ] ],
  with_given_object_position := "both" ),

RelativeTruthMorphismOfImpliesWithGivenObjects := rec(
  filter_list := [ "category", "object", "object", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "PaxPa", "a", "Pa" ],
  output_source_getter_string := "PaxPa",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Pa",
  output_range_getter_preconditions := [ ],
),

RightFiberMorphism := rec(
  filter_list := [ "category", "object", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "b", "c" ],
  output_source_getter_string := "DirectProduct( cat, [ c, PowerObject( cat, DirectProduct( cat, [ b, c ] ) ) ] )",
  output_source_getter_preconditions := [ [ "DirectProduct", 2 ], [ "PowerObject", 1 ] ],
  output_range_getter_string := "PowerObject( cat, b )",
  output_range_getter_preconditions := [ [ "PowerObject", 1 ] ],
  with_given_object_position := "both" ),

RightFiberMorphismWithGivenObjects := rec(
  filter_list := [ "category", "object", "object", "object", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "cxPbxc", "b", "c", "Pb" ],
  output_source_getter_string := "cxPbxc",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Pb",
  output_range_getter_preconditions := [ ] ),

LeftFiberMorphism := rec(
  filter_list := [ "category", "object", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "b", "c" ],
  output_source_getter_string := "DirectProduct( cat, [ PowerObject( cat, DirectProduct( cat, [ b, c ] ) ), b ] )",
  output_source_getter_preconditions := [ [ "DirectProduct", 2 ], [ "PowerObject", 1 ] ],
  output_range_getter_string := "PowerObject( cat, c )",
  output_range_getter_preconditions := [ [ "PowerObject", 1 ] ],
  with_given_object_position := "both" ),

LeftFiberMorphismWithGivenObjects := rec(
  filter_list := [ "category", "object", "object", "object", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "Pbxc_b", "b", "c", "Pc" ],
  output_source_getter_string := "Pbxc_b",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Pc",
  output_range_getter_preconditions := [ ] ),

ListOfSubobjects := rec(
  filter_list := [ "category", "object" ],
  return_type := "list_of_morphisms" ),

PseudoComplementSubobject := rec(
  filter_list := [ "category", "morphism" ],
  return_type := "object" ),

EmbeddingOfPseudoComplementSubobject := rec(
  filter_list := [ "category", "morphism" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "iota" ],
  output_source_getter_string := "PseudoComplementSubobject( iota )",
  output_source_getter_preconditions := [ [ "PseudoComplementSubobject", 1 ] ],
  output_range_getter_string := "Target( iota )",
  output_range_getter_preconditions := [ ],
  with_given_object_position := "Source" ),

EmbeddingOfPseudoComplementSubobjectWithGivenPseudoComplement := rec(
  filter_list := [ "category", "morphism", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "iota", "complement" ],
  output_source_getter_string := "complement",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Target( iota )",
  output_range_getter_preconditions := [ ],
),

IntersectionSubobject := rec(
  filter_list := [ "category", "morphism", "morphism" ],
  return_type := "object" ),

EmbeddingOfIntersectionSubobject := rec(
  filter_list := [ "category", "morphism", "morphism" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "iota1", "iota2" ],
  output_source_getter_string := "IntersectionSubobject( iota1, iota2 )",
  output_source_getter_preconditions := [ [ "IntersectionSubobject", 1 ] ],
  output_range_getter_string := "Target( iota1 )",
  output_range_getter_preconditions := [ ],
  with_given_object_position := "Source" ),

EmbeddingOfIntersectionSubobjectWithGivenIntersection := rec(
  filter_list := [ "category", "morphism", "morphism", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "iota1", "iota2", "intersection" ],
  output_source_getter_string := "intersection",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Target( iota1 )",
  output_range_getter_preconditions := [ ],
),

UnionSubobject := rec(
  filter_list := [ "category", "morphism", "morphism" ],
  return_type := "object" ),

EmbeddingOfUnionSubobject := rec(
  filter_list := [ "category", "morphism", "morphism" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "iota1", "iota2" ],
  output_source_getter_string := "UnionSubobject( iota1, iota2 )",
  output_source_getter_preconditions := [ [ "UnionSubobject", 1 ] ],
  output_range_getter_string := "Target( iota1 )",
  output_range_getter_preconditions := [ ],
  with_given_object_position := "Source" ),

EmbeddingOfUnionSubobjectWithGivenUnion := rec(
  filter_list := [ "category", "morphism", "morphism", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "iota1", "iota2", "union" ],
  output_source_getter_string := "union",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Target( iota1 )",
  output_range_getter_preconditions := [ ],
),

RelativePseudoComplementSubobject := rec(
  filter_list := [ "category", "morphism", "morphism" ],
  return_type := "object" ),

EmbeddingOfRelativePseudoComplementSubobject := rec(
  filter_list := [ "category", "morphism", "morphism" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "iota1", "iota2" ],
  output_source_getter_string := "RelativePseudoComplementSubobject( iota1, iota2 )",
  output_source_getter_preconditions := [ [ "RelativePseudoComplementSubobject", 1 ] ],
  output_range_getter_string := "Target( iota1 )",
  output_range_getter_preconditions := [ ],
  with_given_object_position := "Source" ),

EmbeddingOfRelativePseudoComplementSubobjectWithGivenImplication := rec(
  filter_list := [ "category", "morphism", "morphism", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "iota1", "iota2", "implication" ],
  output_source_getter_string := "implication",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Target( iota1 )",
  output_range_getter_preconditions := [ ],
),

HasPushoutComplement := rec(
  filter_list := [ "category", "morphism", "morphism" ],
  return_type := "bool",
  pre_function := function( cat, l, m )
    local value;
    
    value := IsEqualForObjects( Target( l ), Source( m ) );
    
    if value = fail then
        
        return [ false, "cannot decide whether the two morphisms are composable" ];
        
    elif value = false then
        
        return [ false, "the two morphisms must be composable" ];
        
    fi;
    
    return [ true ];
  end,
),

PushoutComplement := rec(
  filter_list := [ "category", "morphism", "morphism" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "l", "m" ],
  output_range_getter_string := "Target( m )",
  output_range_getter_preconditions := [ ],
  pre_function := function( cat, l, m )
    local value;
    
    value := IsEqualForObjects( Target( l ), Source( m ) );
    
    if value = fail then
        
        return [ false, "cannot decide whether the two morphisms are composable" ];
        
    elif value = false then
        
        return [ false, "the two morphisms must be composable" ];
        
    fi;
    
    return [ true ];
  end,
),

LawvereTierneyLocalModalityOperators := rec(
  filter_list := [ "category" ],
  return_type := "list_of_morphisms" ),

LawvereTierneySubobjects := rec(
  filter_list := [ "category" ],
  return_type := "list_of_morphisms" ),

LawvereTierneyEmbeddingsOfSubobjectClassifiers := rec(
  filter_list := [ "category" ],
  return_type := "list_of_morphisms" ),

 ) );

CAP_INTERNAL_ENHANCE_NAME_RECORD( TOPOS_METHOD_NAME_RECORD );

CAP_INTERNAL_GENERATE_DECLARATIONS_AND_INSTALLATIONS_FROM_METHOD_NAME_RECORD(
    TOPOS_METHOD_NAME_RECORD,
    "Toposes",
    "ToposMethodRecord",
    "Toposes",
    "Add-methods"
);

CAP_INTERNAL_REGISTER_METHOD_NAME_RECORD_OF_PACKAGE( TOPOS_METHOD_NAME_RECORD, "Toposes" );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( TOPOS_METHOD_NAME_RECORD );
