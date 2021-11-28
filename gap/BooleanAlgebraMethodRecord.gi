# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

InstallValue( BOOLEAN_ALGEBRA_METHOD_NAME_RECORD,
        rec(
MorphismFromDoubleNegationWithGivenDoubleNegation := rec(
  installation_name := "MorphismFromDoubleNegationWithGivenDoubleNegation",
  filter_list := [ "category", "object", "object" ],
  io_type := [ [ "a", "s" ], [ "s", "a" ] ],
  cache_name := "MorphismFromDoubleNegationWithGivenDoubleNegation",
  return_type := "morphism" ),

MorphismToDoubleConegationWithGivenDoubleConegation := rec(
  installation_name := "MorphismToDoubleConegationWithGivenDoubleConegation",
  filter_list := [ "category", "object", "object" ],
  io_type := [ [ "a", "s" ], [ "s", "a" ] ],
  cache_name := "MorphismToDoubleConegationWithGivenDoubleConegation",
  return_type := "morphism" ),
) );

CAP_INTERNAL_ENHANCE_NAME_RECORD( BOOLEAN_ALGEBRA_METHOD_NAME_RECORD );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( BOOLEAN_ALGEBRA_METHOD_NAME_RECORD );

CAP_INTERNAL_REGISTER_METHOD_NAME_RECORD_OF_PACKAGE( BOOLEAN_ALGEBRA_METHOD_NAME_RECORD, "Locales" );
