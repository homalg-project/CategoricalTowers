# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

InstallValue( HEYTING_ALGEBRA_METHOD_NAME_RECORD,
        rec(
NegationOnObjects := rec(
  installation_name := "NegationOnObjects",
  filter_list := [ "category", "object" ],
  io_type := [ [ "a" ], [ "an" ] ],
  cache_name := "NegationOnObjects",
  return_type := "object" ),

NegationOnMorphismsWithGivenNegations := rec(
  installation_name := "NegationOnMorphismsWithGivenNegations",
  io_type := [ [ "s", "alpha", "r" ], [ "s", "r" ] ],
  filter_list := [ "category", "object", "morphism", "object" ],
  cache_name := "NegationOnMorphismsWithGivenNegations",
  return_type := "morphism" ),

MorphismToDoubleNegationWithGivenDoubleNegation := rec(
  installation_name := "MorphismToDoubleNegationWithGivenDoubleNegation",
  filter_list := [ "category", "object", "object" ],
  io_type := [ [ "a", "r" ], [ "a", "r" ] ],
  cache_name := "MorphismToDoubleNegationWithGivenDoubleNegation",
  return_type := "morphism" )

            ) );

CAP_INTERNAL_ENHANCE_NAME_RECORD( HEYTING_ALGEBRA_METHOD_NAME_RECORD );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( HEYTING_ALGEBRA_METHOD_NAME_RECORD );

CAP_INTERNAL_REGISTER_METHOD_NAME_RECORD_OF_PACKAGE( HEYTING_ALGEBRA_METHOD_NAME_RECORD, "Locales" );
