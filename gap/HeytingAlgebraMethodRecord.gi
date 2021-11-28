# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

InstallValue( HEYTING_ALGEBRA_METHOD_NAME_RECORD,
        rec(
NegationOnObjects := rec(
  filter_list := [ "category", "object" ],
  return_type := "object" ),

NegationOnMorphismsWithGivenNegations := rec(
  io_type := [ [ "s", "alpha", "r" ], [ "s", "r" ] ],
  filter_list := [ "category", "object", "morphism", "object" ],
  return_type := "morphism" ),

MorphismToDoubleNegationWithGivenDoubleNegation := rec(
  filter_list := [ "category", "object", "object" ],
  io_type := [ [ "a", "r" ], [ "a", "r" ] ],
  return_type := "morphism" )

            ) );

CAP_INTERNAL_ENHANCE_NAME_RECORD( HEYTING_ALGEBRA_METHOD_NAME_RECORD );

CAP_INTERNAL_GENERATE_DOCUMENTATION_FROM_METHOD_NAME_RECORD(
    HEYTING_ALGEBRA_METHOD_NAME_RECORD,
    "Locales",
    "HeytingAlgebra.autogen.gd",
    "Heyting algebras",
    "Add-methods"
);

CAP_INTERNAL_REGISTER_METHOD_NAME_RECORD_OF_PACKAGE( HEYTING_ALGEBRA_METHOD_NAME_RECORD, "Locales" );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( HEYTING_ALGEBRA_METHOD_NAME_RECORD );
