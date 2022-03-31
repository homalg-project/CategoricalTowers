# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Declarations
#

#! @Chapter Prosets (preordered sets)

#! Prosets are thin categories, i.e., each Hom-set is either a singleton or empty.

#! @Section Info Class
DeclareInfoClass( "InfoLocales" );

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of objects in a thin &CAP; category.
#! @Arguments object
DeclareCategory( "IsObjectInThinCategory",
                 IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a thin &CAP; category.
#! @Arguments morphism
DeclareCategory( "IsMorphismInThinCategory",
                 IsCapCategoryMorphism and IsMonomorphism and IsEpimorphism );

#! @Section GAP Properties

#! @Description
#!  The property of <A>C</A> being a thin &CAP; category.
#! @Arguments C
AddCategoricalProperty( [ "IsThinCategory", "IsThinCategory" ] );

#! @Section Operations

#! @Description
#!  Check if <A>A</A> is isomorphic to <A>B</A> under the assumption that
#!  there exists a morphism from <A>A</A> to <A>B</A>, i.e., if
#!  <A>A</A> is known to be less or equal to <A>B</A> w.r.t. the preorder.
#! @Arguments A, B
#! @Returns <C>true</C> or <C>false</C>
DeclareOperation( "AreIsomorphicForObjectsIfIsHomSetInhabited",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Section Constructors

#! @Description
#!  Construct the unique morphism with source <A>A</A> and target <A>B</A>.
#! @Arguments A, B
#! @Returns a &CAP; morphism
DeclareOperation( "UniqueMorphism",
        [ IsObjectInThinCategory, IsObjectInThinCategory ] );

# @Section Tools

DeclareGlobalVariable( "PREORDERED_SET_METHOD_NAME_RECORD" );

DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_PREORDERED_SETS" );
