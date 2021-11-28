# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

InstallValue( POSET_METHOD_NAME_RECORD,
        rec(
            IsEqualForObjectsIfIsHomSetInhabited := rec(
                                     installation_name := "IsEqualForObjectsIfIsHomSetInhabited",
                                     filter_list := [ "category", "object", "object" ],
                                     return_type := "bool",
                                     is_merely_set_theoretic := true
                                    ),
            )
        );

CAP_INTERNAL_ENHANCE_NAME_RECORD( POSET_METHOD_NAME_RECORD );

CAP_INTERNAL_GENERATE_DOCUMENTATION_FROM_METHOD_NAME_RECORD(
    POSET_METHOD_NAME_RECORD,
    "Locales",
    "Poset.autogen.gd",
    "Posets (partially ordered sets)",
    "Add-methods"
);

CAP_INTERNAL_REGISTER_METHOD_NAME_RECORD_OF_PACKAGE( POSET_METHOD_NAME_RECORD, "Locales" );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( POSET_METHOD_NAME_RECORD );
