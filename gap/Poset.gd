# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Declarations
#

#! @Chapter Posets (partially ordered sets)

#! Posets are skeletal, thin categories.

#! @Section Operations

#! @Description
#!  Check if <A>A</A> is equal to <A>B</A> under the assumption that
#!  there exists a morphism from <A>A</A> to <A>B</A>, i.e., if
#!  <A>A</A> is known to be less or equal to <A>B</A> w.r.t. the partial order.
#! @Arguments A, B
#! @Returns <C>true</C> or <C>false</C>
DeclareOperation( "IsEqualForObjectsIfIsHomSetInhabited",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

# @Section Tools

DeclareGlobalVariable( "POSET_METHOD_NAME_RECORD" );

DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_POSETS" );
