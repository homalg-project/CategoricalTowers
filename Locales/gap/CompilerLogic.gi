# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat", "pair" ],
        src_template := "MinuendAndSubtrahendInUnderlyingLattice( CreateCapCategoryObjectWithAttributes( cat, PreMinuendAndSubtrahendInUnderlyingLattice, pair, IsLocallyClosed, true ) )",
        dst_template := "pair",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat", "list" ],
        src_template := "ListOfSingleDifferences( CreateCapCategoryObjectWithAttributes( cat, ListOfPreObjectsInMeetSemilatticeOfDifferences, list, IsLocallyClosed, true ) )",
        dst_template := "list",
    )
);
