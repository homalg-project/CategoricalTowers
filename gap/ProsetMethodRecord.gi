# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

InstallValue( PREORDERED_SET_METHOD_NAME_RECORD,
        rec(
            AreIsomorphicForObjectsIfIsHomSetInhabited := rec(
                                     installation_name := "AreIsomorphicForObjectsIfIsHomSetInhabited",
                                     filter_list := [ "category", "object", "object" ],
                                     return_type := "bool",
                                     is_merely_set_theoretic := true
                                    ),
            )
        );

CAP_INTERNAL_ENHANCE_NAME_RECORD( PREORDERED_SET_METHOD_NAME_RECORD );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( PREORDERED_SET_METHOD_NAME_RECORD );

CAP_INTERNAL_REGISTER_METHOD_NAME_RECORD_OF_PACKAGE( PREORDERED_SET_METHOD_NAME_RECORD, "Locales" );
