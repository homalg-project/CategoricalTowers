# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

InstallValue( HEYTING_ALGEBRA_METHOD_NAME_RECORD,
        rec(
NegationOnObjects := rec(
  filter_list := [ "category", "object" ],
  return_type := "object",
  dual_operation := "ConegationOnObjects" ),

NegationOnMorphisms := rec(
  filter_list := [ "category", "morphism" ],
  input_arguments_names := [ "cat", "alpha" ],
  output_source_getter_string := "NegationOnObjects( cat, Range( alpha ) )",
  output_range_getter_string := "NegationOnObjects( cat, Source( alpha ) )",
  with_given_object_position := "both",
  return_type := "morphism",
  dual_operation := "ConegationOnMorphisms" ),

NegationOnMorphismsWithGivenNegations := rec(
  filter_list := [ "category", "object", "morphism", "object" ],
  io_type := [ [ "s", "alpha", "r" ], [ "s", "r" ] ],
  return_type := "morphism",
  dual_operation := "ConegationOnMorphismsWithGivenConegations" ),

MorphismToDoubleNegation := rec(
  filter_list := [ "category", "object" ],
  input_arguments_names := [ "cat", "a" ],
  output_source_getter_string := "a",
  output_range_getter_string := "NegationOnObjects( cat, NegationOnObjects( cat, a ) )",
  with_given_object_position := "Range",
  return_type := "morphism",
  dual_operation := "MorphismFromDoubleConegation" ),

MorphismToDoubleNegationWithGivenDoubleNegation := rec(
  filter_list := [ "category", "object", "object" ],
  io_type := [ [ "a", "r" ], [ "a", "r" ] ],
  return_type := "morphism",
  dual_operation := "MorphismFromDoubleConegationWithGivenDoubleConegation" ),

            ) );
