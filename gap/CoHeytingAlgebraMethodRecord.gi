# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

InstallValue( COHEYTING_ALGEBRA_METHOD_NAME_RECORD,
        rec(
ConegationOnObjects := rec(
  installation_name := "ConegationOnObjects",
  filter_list := [ "category", "object" ],
  io_type := [ [ "a" ], [ "an" ] ],
  cache_name := "ConegationOnObjects",
  return_type := "object" ),

ConegationOnMorphismsWithGivenConegations := rec(
  installation_name := "ConegationOnMorphismsWithGivenConegations",
  io_type := [ [ "s", "alpha", "r" ], [ "s", "r" ] ],
  filter_list := [ "category", "object", "morphism", "object" ],
  cache_name := "ConegationOnMorphismsWithGivenConegations",
  return_type := "morphism" ),

MorphismFromDoubleConegationWithGivenDoubleConegation := rec(
  installation_name := "MorphismFromDoubleConegationWithGivenDoubleConegation",
  filter_list := [ "category", "object", "object" ],
  io_type := [ [ "a", "r" ], [ "a", "r" ] ],
  cache_name := "MorphismFromDoubleConegationWithGivenDoubleConegation",
  return_type := "morphism" )

            ) );

CAP_INTERNAL_ENHANCE_NAME_RECORD( COHEYTING_ALGEBRA_METHOD_NAME_RECORD );

CAP_INTERNAL_GENERATE_DOCUMENTATION_FROM_METHOD_NAME_RECORD(
    COHEYTING_ALGEBRA_METHOD_NAME_RECORD,
    "Locales",
    "CoHeytingAlgebra.autogen.gd",
    "Co-Heyting algebras",
    "Add-methods"
);

CAP_INTERNAL_REGISTER_METHOD_NAME_RECORD_OF_PACKAGE( COHEYTING_ALGEBRA_METHOD_NAME_RECORD, "Locales" );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( COHEYTING_ALGEBRA_METHOD_NAME_RECORD );
