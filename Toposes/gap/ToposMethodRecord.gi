# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#
# Implementations
#

##
InstallValue( TOPOS_METHOD_NAME_RECORD, rec(

MorphismsOfExternalHom := rec(
  filter_list := [ "category", "object", "object" ],
  return_type := "list_of_morphisms" ),

ExactCoverWithGlobalElements := rec(
  filter_list := [ "category", "object" ],
  return_type := "list_of_morphisms" ),

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
  io_type := [ [ "T", "Omega" ], [ "T", "Omega" ] ] ),

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
  io_type := [ [ "T", "Omega" ], [ "T", "Omega" ] ] ),

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
  io_type := [ [ "Omega", "Omega1" ], [ "Omega", "Omega1" ] ] ),

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
  io_type := [ [ "Omega2", "Omega" ], [ "Omega2", "Omega" ] ] ),

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
  io_type := [ [ "Omega2", "Omega" ], [ "Omega2", "Omega" ] ] ),

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
  io_type := [ [ "Omega2", "Omega" ], [ "Omega2", "Omega" ] ] ),

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
  io_type := [ [ "alpha", "Omega" ], [ "alpha_range", "Omega" ] ] ),

SubobjectOfClassifyingMorphism := rec(
  filter_list := [ "category", "morphism" ],
  return_type := "morphism",
  io_type := [ [ "alpha" ], [ "subobject", "alpha_source" ] ] ),

PowerObject := rec(
  filter_list := [ "category", "object" ],
  return_type := "object",
  functorial := "PowerObjectFunctorial" ),

PowerObjectFunctorial := rec(
  filter_list := [ "category", "morphism" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "f" ],
  output_source_getter_string := "PowerObject( cat, Range( f ) )",
  output_source_getter_preconditions := [ [ "PowerObject", 1 ] ],
  output_range_getter_string := "PowerObject( cat, Source( f ) )",
  output_range_getter_preconditions := [ [ "PowerObject", 1 ] ],
  with_given_object_position := "both" ),

PowerObjectFunctorialWithGivenPowerObjects := rec(
  filter_list := [ "category", "object", "morphism", "object" ],
  return_type := "morphism",
  io_type := [ [ "Pb", "f", "Pa" ], [ "Pb", "Pa" ] ] ),

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
  io_type := [ [ "a", "b", "mu", "Pb" ], [ "a", "Pb" ] ] ),

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
  io_type := [ [ "a", "b", "mu", "Pa" ], [ "b", "Pa" ] ] ),

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
  io_type := [ [ "a", "Pa" ], [ "a", "Pa" ] ] ),

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
  io_type := [ [ "ExpaOmega2", "a", "PaxPa" ], [ "ExpaOmega2", "PaxPa" ] ] ),

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
  io_type := [ [ "T", "a", "Pa" ], [ "T", "Pa" ] ] ),

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
  io_type := [ [ "T", "a", "Pa" ], [ "T", "Pa" ] ] ),

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
  io_type := [ [ "Pa", "a", "Pa1" ], [ "Pa", "Pa1" ] ] ),

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
  io_type := [ [ "PaxPa", "a", "Pa" ], [ "PaxPa", "Pa" ] ] ),

RelativeTruthMorphismOfOr := rec(
  filter_list := [ "category", "object" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "a" ],
  output_source_getter_string := "DirectProduct( cat, [ PowerObject( cat, a ), PowerObject( cat, a ) ] )",
  output_source_getter_preconditions := [ [ "DirectProduct", 1 ], [ "PowerObject", 2 ] ],
  output_range_getter_string := "PowerObject( cat, a )",
  output_range_getter_preconditions := [ [ "PowerObject", 1 ] ],
  with_given_object_position := "both" ),

RelativeTruthMorphismOfOrWithGivenObjects := rec(
  filter_list := [ "category", "object", "object", "object" ],
  return_type := "morphism",
  io_type := [ [ "PaxPa", "a", "Pa" ], [ "PaxPa", "Pa" ] ] ),

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
  io_type := [ [ "PaxPa", "a", "Pa" ], [ "PaxPa", "Pa" ] ] ),

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
  output_range_getter_string := "Range( iota )",
  output_range_getter_preconditions := [ ],
  with_given_object_position := "Source" ),

EmbeddingOfPseudoComplementSubobjectWithGivenPseudoComplement := rec(
  filter_list := [ "category", "morphism", "object" ],
  return_type := "morphism",
  io_type := [ [ "iota", "complement" ], [ "complement", "iota_range" ] ] ),

IntersectionSubobject := rec(
  filter_list := [ "category", "morphism", "morphism" ],
  return_type := "object" ),

EmbeddingOfIntersectionSubobject := rec(
  filter_list := [ "category", "morphism", "morphism" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "iota1", "iota2" ],
  output_source_getter_string := "IntersectionSubobject( iota1, iota2 )",
  output_source_getter_preconditions := [ [ "IntersectionSubobject", 1 ] ],
  output_range_getter_string := "Range( iota1 )",
  output_range_getter_preconditions := [ ],
  with_given_object_position := "Source" ),

EmbeddingOfIntersectionSubobjectWithGivenIntersection := rec(
  filter_list := [ "category", "morphism", "morphism", "object" ],
  return_type := "morphism",
  io_type := [ [ "iota1", "iota2", "intersection" ], [ "intersection", "iota1_range" ] ] ),

UnionSubobject := rec(
  filter_list := [ "category", "morphism", "morphism" ],
  return_type := "object" ),

EmbeddingOfUnionSubobject := rec(
  filter_list := [ "category", "morphism", "morphism" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "iota1", "iota2" ],
  output_source_getter_string := "UnionSubobject( iota1, iota2 )",
  output_source_getter_preconditions := [ [ "UnionSubobject", 1 ] ],
  output_range_getter_string := "Range( iota1 )",
  output_range_getter_preconditions := [ ],
  with_given_object_position := "Source" ),

EmbeddingOfUnionSubobjectWithGivenUnion := rec(
  filter_list := [ "category", "morphism", "morphism", "object" ],
  return_type := "morphism",
  io_type := [ [ "iota1", "iota2", "union" ], [ "union", "iota1_range" ] ] ),

RelativePseudoComplementSubobject := rec(
  filter_list := [ "category", "morphism", "morphism" ],
  return_type := "object" ),

EmbeddingOfRelativePseudoComplementSubobject := rec(
  filter_list := [ "category", "morphism", "morphism" ],
  return_type := "morphism",
  input_arguments_names := [ "cat", "iota1", "iota2" ],
  output_source_getter_string := "RelativePseudoComplementSubobject( iota1, iota2 )",
  output_source_getter_preconditions := [ [ "RelativePseudoComplementSubobject", 1 ] ],
  output_range_getter_string := "Range( iota1 )",
  output_range_getter_preconditions := [ ],
  with_given_object_position := "Source" ),

EmbeddingOfRelativePseudoComplementSubobjectWithGivenImplication := rec(
  filter_list := [ "category", "morphism", "morphism", "object" ],
  return_type := "morphism",
  io_type := [ [ "iota1", "iota2", "implication" ], [ "implication", "iota1_range" ] ] ),

HasPushoutComplement := rec(
  filter_list := [ "category", "morphism", "morphism" ],
  return_type := "bool",
  pre_function := function( cat, l, m )
    local value;
    
    value := IsEqualForObjects( Range( l ), Source( m ) );
    
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
  io_type := [ [ "l", "m" ], [ "D", "m_range" ] ],
  pre_function := function( cat, l, m )
    local value;
    
    value := IsEqualForObjects( Range( l ), Source( m ) );
    
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

CAP_INTERNAL_GENERATE_DOCUMENTATION_FROM_METHOD_NAME_RECORD(
    TOPOS_METHOD_NAME_RECORD,
    "Toposes",
    "Topos.autogen.gd",
    "Toposes",
    "Add-methods"
);

CAP_INTERNAL_REGISTER_METHOD_NAME_RECORD_OF_PACKAGE( TOPOS_METHOD_NAME_RECORD, "Toposes" );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( TOPOS_METHOD_NAME_RECORD );
