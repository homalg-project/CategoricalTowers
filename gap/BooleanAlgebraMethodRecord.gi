# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

InstallValue( BOOLEAN_ALGEBRA_METHOD_NAME_RECORD,
        rec(
MorphismFromDoubleNegation:= rec(
  filter_list := [ "category", "object" ],
  io_type := [ [ "a" ], [ "s", "a" ] ],
  output_source_getter_string := "NegationOnObjects( cat, NegationOnObjects( cat, a ) )",
  output_range_getter_string := "a",
  with_given_object_position := "Source",
  return_type := "morphism",
  dual_operation := "MorphismToDoubleConegation" ),

MorphismFromDoubleNegationWithGivenDoubleNegation := rec(
  filter_list := [ "category", "object", "object" ],
  io_type := [ [ "a", "s" ], [ "s", "a" ] ],
  return_type := "morphism",
  dual_operation := "MorphismToDoubleConegationWithGivenDoubleConegation",
  dual_arguments_reversed := false ),

MorphismToDoubleConegation := rec(
  filter_list := [ "category", "object" ],
  io_type := [ [ "a" ], [ "a", "r" ] ],
  output_source_getter_string := "a",
  output_range_getter_string := "ConegationOnObjects( cat, ConegationOnObjects( cat, a ) )",
  with_given_object_position := "Range",
  return_type := "morphism",
  dual_operation := "MorphismFromDoubleNegation" ),

MorphismToDoubleConegationWithGivenDoubleConegation := rec(
  filter_list := [ "category", "object", "object" ],
  io_type := [ [ "a", "r" ], [ "a", "r" ] ],
  return_type := "morphism",
  dual_operation := "MorphismFromDoubleNegationWithGivenDoubleNegation",
  dual_arguments_reversed := false ),
) );

CAP_INTERNAL_ENHANCE_NAME_RECORD( BOOLEAN_ALGEBRA_METHOD_NAME_RECORD );

CAP_INTERNAL_GENERATE_DOCUMENTATION_FROM_METHOD_NAME_RECORD(
    BOOLEAN_ALGEBRA_METHOD_NAME_RECORD,
    "Locales",
    "BooleanAlgebra.autogen.gd",
    "Boolean algebras",
    "Add-methods"
);

CAP_INTERNAL_REGISTER_METHOD_NAME_RECORD_OF_PACKAGE( BOOLEAN_ALGEBRA_METHOD_NAME_RECORD, "Locales" );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( BOOLEAN_ALGEBRA_METHOD_NAME_RECORD );
