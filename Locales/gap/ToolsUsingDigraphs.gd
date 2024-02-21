# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Declarations
#

#! @Description
#!  The Hasse digraph of a poset.
#! @Arguments C
#! @Returns a digraph
DeclareOperation( "DigraphOfPoset",
        [ IsThinCategory and IsFiniteCategory ] );

