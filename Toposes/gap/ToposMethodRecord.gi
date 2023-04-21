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
  output_source_getter_string := "TerminalObject( cat )",
  output_source_getter_preconditions := [ [ "TerminalObject", 1 ] ],
  output_range_getter_string := "SubobjectClassifier( cat )",
  output_range_getter_preconditions := [ [ "SubobjectClassifier", 1 ] ],
  with_given_object_position := "both",
  io_type := [ [ ] , [ "T", "Omega" ] ],
  return_type := "morphism" ),

TruthMorphismOfTrueWithGivenObjects := rec(
  filter_list := [ "category", "object", "object" ],
  io_type := [ [ "T", "Omega" ] , [ "T", "Omega" ] ],
  return_type := "morphism" ),

TruthMorphismOfFalse := rec(
  filter_list := [ "category" ],
  output_source_getter_string := "TerminalObject( cat )",
  output_source_getter_preconditions := [ [ "TerminalObject", 1 ] ],
  output_range_getter_string := "SubobjectClassifier( cat )",
  output_range_getter_preconditions := [ [ "SubobjectClassifier", 1 ] ],
  with_given_object_position := "both",
  io_type := [ [ ] , [ "T", "Omega" ] ],
  return_type := "morphism" ),

TruthMorphismOfFalseWithGivenObjects := rec(
  filter_list := [ "category", "object", "object" ],
  io_type := [ [ "T", "Omega" ] , [ "T", "Omega" ] ],
  return_type := "morphism" ),

TruthMorphismOfNot := rec(
  filter_list := [ "category" ],
  output_source_getter_string := "SubobjectClassifier( cat )",
  output_source_getter_preconditions := [ [ "SubobjectClassifier", 1 ] ],
  output_range_getter_string := "SubobjectClassifier( cat )",
  output_range_getter_preconditions := [ [ "SubobjectClassifier", 1 ] ],
  with_given_object_position := "both",
  io_type := [ [ ] , [ "Omega", "Omega1" ] ],
  return_type := "morphism" ),

TruthMorphismOfNotWithGivenObjects := rec(
  filter_list := [ "category", "object", "object" ],
  io_type := [ [ "Omega", "Omega1" ] , [ "Omega", "Omega1" ] ],
  return_type := "morphism" ),

TruthMorphismOfAnd := rec(
  filter_list := [ "category" ],
  output_source_getter_string := "CartesianSquareOfSubobjectClassifier( cat )",
  output_source_getter_preconditions := [ [ "CartesianSquareOfSubobjectClassifier", 1 ] ],
  output_range_getter_string := "SubobjectClassifier( cat )",
  output_range_getter_preconditions := [ [ "SubobjectClassifier", 1 ] ],
  with_given_object_position := "both",
  io_type := [ [ ] , [ "Omega2", "Omega" ] ],
  return_type := "morphism" ),

TruthMorphismOfAndWithGivenObjects := rec(
  filter_list := [ "category", "object", "object" ],
  io_type := [ [ "Omega2", "Omega" ] , [ "Omega2", "Omega" ] ],
  return_type := "morphism" ),

TruthMorphismOfOr := rec(
  filter_list := [ "category" ],
  output_source_getter_string := "CartesianSquareOfSubobjectClassifier( cat )",
  output_source_getter_preconditions := [ [ "CartesianSquareOfSubobjectClassifier", 1 ] ],
  output_range_getter_string := "SubobjectClassifier( cat )",
  output_range_getter_preconditions := [ [ "SubobjectClassifier", 1 ] ],
  with_given_object_position := "both",
  io_type := [ [ ] , [ "Omega2", "Omega" ] ],
  return_type := "morphism" ),

TruthMorphismOfOrWithGivenObjects := rec(
  filter_list := [ "category", "object", "object" ],
  io_type := [ [ "Omega2", "Omega" ] , [ "Omega2", "Omega" ] ],
  return_type := "morphism" ),

TruthMorphismOfImplies := rec(
  filter_list := [ "category" ],
  output_source_getter_string := "CartesianSquareOfSubobjectClassifier( cat )",
  output_source_getter_preconditions := [ [ "CartesianSquareOfSubobjectClassifier", 1 ] ],
  output_range_getter_string := "SubobjectClassifier( cat )",
  output_range_getter_preconditions := [ [ "SubobjectClassifier", 1 ] ],
  with_given_object_position := "both",
  io_type := [ [ ] , [ "Omega2", "Omega" ] ],
  return_type := "morphism" ),

TruthMorphismOfImpliesWithGivenObjects := rec(
  filter_list := [ "category", "object", "object" ],
  io_type := [ [ "Omega2", "Omega" ] , [ "Omega2", "Omega" ] ],
  return_type := "morphism" ),

ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier := rec(
  filter_list := [ "category", "morphism", "object" ],
  io_type := [ [ "alpha", "Omega" ] , [ "alpha_range", "Omega" ] ],
  return_type := "morphism" ),

ClassifyingMorphismOfSubobject := rec(
  filter_list := [ "category", "morphism" ],
  io_type := [ [ "alpha" ] , [ "alpha_range", "Omega" ] ],
  with_given_object_position := "Range",
  return_type := "morphism" ),

SubobjectOfClassifyingMorphism := rec(
  filter_list := [ "category", "morphism" ],
  io_type := [ [ "alpha" ] , [ "subobject", "alpha_source" ] ],
  return_type := "morphism" ),

PowerOfObject := rec(
  filter_list := [ "category", "object" ],
  return_type := "object" ),

SingletonMorphism := rec(
  filter_list := [ "category", "object" ],
  io_type := [ [ "object" ] , [ "object", "power_object" ] ],
  output_source_getter_string := "object",
  output_range_getter_string := "PowerOfObject( cat, object )",
  output_range_getter_preconditions := [ [ "PowerOfObject", 1 ] ],
  return_type := "morphism" ),

SingletonMorphismWithGivenPowerOfObject := rec(
  filter_list := [ "category", "object", "object" ],
  io_type := [ [ "object", "power_object" ] , [ "object", "power_object" ] ],
  output_source_getter_string := "object",
  output_range_getter_string := "power_object",
  return_type := "morphism" ),

ListOfSubobjects := rec(
  filter_list := [ "category", "object" ],
  return_type := "list_of_morphisms" ),

LawvereTierneyLocalModalityOperators := rec(
  filter_list := [ "category" ],
  return_type := "list_of_morphisms" ),

LawvereTierneySubobjects := rec(
  filter_list := [ "category" ],
  return_type := "list_of_morphisms" ),

LawvereTierneyEmbeddingsOfSubobjectClassifiers := rec(
  filter_list := [ "category" ],
  return_type := "list_of_morphisms" ),

PseudoComplementSubobject := rec(
  filter_list := [ "category", "morphism" ],
  return_type := "object" ),

EmbeddingOfPseudoComplementSubobject := rec(
  filter_list := [ "category", "morphism" ],
  input_arguments_names := [ "cat", "iota" ],
  output_source_getter_string := "PseudoComplementSubobject( iota )",
  output_source_getter_preconditions := [ [ "PseudoComplementSubobject", 1 ] ],
  output_range_getter_string := "Range( iota )",
  output_range_getter_preconditions := [ ],
  with_given_object_position := "Source",
  return_type := "morphism" ),

EmbeddingOfPseudoComplementSubobjectWithGivenPseudoComplement := rec(
  filter_list := [ "category", "morphism", "object" ],
  input_arguments_names := [ "cat", "iota", "complement" ],
  output_source_getter_string := "complement",
  output_range_getter_string := "Range( iota )",
  io_type := [ [ "iota", "complement" ] , [ "complement", "iota_range" ] ],
  return_type := "morphism" ),

IntersectionSubobject := rec(
  filter_list := [ "category", "morphism", "morphism" ],
  return_type := "object" ),

EmbeddingOfIntersectionSubobject := rec(
  filter_list := [ "category", "morphism", "morphism" ],
  input_arguments_names := [ "cat", "iota1", "iota2" ],
  output_source_getter_string := "IntersectionSubobject( iota1, iota2 )",
  output_source_getter_preconditions := [ [ "IntersectionSubobject", 1 ] ],
  output_range_getter_string := "Range( iota1 )",
  output_range_getter_preconditions := [ ],
  with_given_object_position := "Source",
  return_type := "morphism" ),

EmbeddingOfIntersectionSubobjectWithGivenIntersection := rec(
  filter_list := [ "category", "morphism", "morphism", "object" ],
  input_arguments_names := [ "cat", "iota1", "iota2", "intersection" ],
  output_source_getter_string := "intersection",
  output_range_getter_string := "Range( iota1 )",
  io_type := [ [ "iota1", "iota2", "intersection" ] , [ "intersection", "iota1_range" ] ],
  return_type := "morphism" ),

UnionSubobject := rec(
  filter_list := [ "category", "morphism", "morphism" ],
  return_type := "object" ),

EmbeddingOfUnionSubobject := rec(
  filter_list := [ "category", "morphism", "morphism" ],
  input_arguments_names := [ "cat", "iota1", "iota2" ],
  output_source_getter_string := "UnionSubobject( iota1, iota2 )",
  output_source_getter_preconditions := [ [ "UnionSubobject", 1 ] ],
  output_range_getter_string := "Range( iota1 )",
  output_range_getter_preconditions := [ ],
  with_given_object_position := "Source",
  return_type := "morphism" ),

EmbeddingOfUnionSubobjectWithGivenUnion := rec(
  filter_list := [ "category", "morphism", "morphism", "object" ],
  input_arguments_names := [ "cat", "iota1", "iota2", "union" ],
  output_source_getter_string := "union",
  output_range_getter_string := "Range( iota1 )",
  io_type := [ [ "iota1", "iota2", "union" ] , [ "union", "iota1_range" ] ],
  return_type := "morphism" ),

RelativePseudoComplementSubobject := rec(
  filter_list := [ "category", "morphism", "morphism" ],
  return_type := "object" ),

EmbeddingOfRelativePseudoComplementSubobject := rec(
  filter_list := [ "category", "morphism", "morphism" ],
  input_arguments_names := [ "cat", "iota1", "iota2" ],
  output_source_getter_string := "RelativePseudoComplementSubobject( iota1, iota2 )",
  output_source_getter_preconditions := [ [ "RelativePseudoComplementSubobject", 1 ] ],
  output_range_getter_string := "Range( iota1 )",
  output_range_getter_preconditions := [ ],
  with_given_object_position := "Source",
  return_type := "morphism" ),

EmbeddingOfRelativePseudoComplementSubobjectWithGivenImplication := rec(
  filter_list := [ "category", "morphism", "morphism", "object" ],
  input_arguments_names := [ "cat", "iota1", "iota2", "implication" ],
  output_source_getter_string := "implication",
  output_range_getter_string := "Range( iota1 )",
  io_type := [ [ "iota1", "iota2", "implication" ] , [ "implication", "iota1_range" ] ],
  return_type := "morphism" ),

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
  io_type := [ [ "l", "m" ], [ "D", "m_range" ] ],
  return_type := "morphism",
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
