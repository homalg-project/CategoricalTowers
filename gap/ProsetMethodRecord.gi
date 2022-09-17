# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

InstallValue( PREORDERED_SET_METHOD_NAME_RECORD,
        rec(
            UniqueMorphism := rec(
                                     filter_list := [ "category", "object", "object" ],
                                     return_type := "morphism",
                                     compatible_with_congruence_of_morphisms := true,
                                    ),
            
            AreIsomorphicForObjectsIfIsHomSetInhabited := rec(
                                     filter_list := [ "category", "object", "object" ],
                                     return_type := "bool",
                                     is_merely_set_theoretic := true
                                    ),
            )
        );

CAP_INTERNAL_ENHANCE_NAME_RECORD( PREORDERED_SET_METHOD_NAME_RECORD );

CAP_INTERNAL_GENERATE_DOCUMENTATION_FROM_METHOD_NAME_RECORD(
    PREORDERED_SET_METHOD_NAME_RECORD,
    "Locales",
    "Proset.autogen.gd",
    "Prosets (preordered sets)",
    "Add-methods"
);

CAP_INTERNAL_REGISTER_METHOD_NAME_RECORD_OF_PACKAGE( PREORDERED_SET_METHOD_NAME_RECORD, "Locales" );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( PREORDERED_SET_METHOD_NAME_RECORD );
