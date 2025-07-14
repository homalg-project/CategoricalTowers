# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Declarations
#

####################################
#
#! @Chapter Prosets (preordered sets)
#
####################################

#! Prosets are thin categories, i.e., each Hom-set is either a singleton or empty.

#! @Section Info Class
DeclareInfoClass( "InfoLocales" );

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of categories with morphisms without a morphism datum.
#! @Arguments object
DeclareCategory( "IsCategoryWithoutMorphismData",
        IsCapCategory );

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

####################################
#
#! @Section Properties
#
####################################

#! @Description
#!  The property of <A>C</A> being a thin &CAP; category.
#! @Arguments C
DeclareProperty( "IsThinCategory",
        IsCapCategory );

AddCategoricalProperty( [ "IsThinCategory", "IsThinCategory" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsThinCategory :=
  DuplicateFreeList( Concatenation(
          ListOfDefiningOperations( "IsCapCategory" ),
          [ "AreIsomorphicForObjectsIfIsHomSetInhabited",
            ] ) );

#! @Description
#!  The property of <A>C</A> being a monoidal thin category.
#! @Arguments C
DeclareProperty( "IsMonoidalProset",
        IsCapCategory );

AddCategoricalProperty( [ "IsMonoidalProset", "IsMonoidalProset" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsMonoidalProset :=
  DuplicateFreeList( Concatenation(
          ListOfDefiningOperations( "IsThinCategory" ),
          ListOfDefiningOperations( "IsMonoidalCategory" ) ) );

#! @Description
#!  The property of <A>C</A> being a closed monoidal thin category.
#! @Arguments C
DeclareProperty( "IsClosedMonoidalProset",
        IsCapCategory );

AddCategoricalProperty( [ "IsClosedMonoidalProset", "IsCoclosedMonoidalProset" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsClosedMonoidalProset :=
  DuplicateFreeList( Concatenation(
          ListOfDefiningOperations( "IsMonoidalProset" ),
          ListOfDefiningOperations( "IsClosedMonoidalCategory" ) ) );

#! @Description
#!  The property of <A>C</A> being a coclosed monoidal thin category.
#! @Arguments C
DeclareProperty( "IsCoclosedMonoidalProset",
        IsCapCategory );

AddCategoricalProperty( [ "IsCoclosedMonoidalProset", "IsClosedMonoidalProset" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCoclosedMonoidalProset :=
  DuplicateFreeList( Concatenation(
          ListOfDefiningOperations( "IsMonoidalProset" ),
          ListOfDefiningOperations( "IsCoclosedMonoidalCategory" ) ) );

#! @Description
#!  The property of <A>C</A> being a symmetric monoidal thin category.
#! @Arguments C
DeclareProperty( "IsSymmetricMonoidalProset",
        IsCapCategory );

AddCategoricalProperty( [ "IsSymmetricMonoidalProset", "IsSymmetricMonoidalProset" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsSymmetricMonoidalProset :=
  DuplicateFreeList( Concatenation(
          ListOfDefiningOperations( "IsThinCategory" ),
          ListOfDefiningOperations( "IsSymmetricMonoidalCategory" ) ) );

#! @Description
#!  The property of <A>C</A> being a symmetric closed monoidal thin category.
#! @Arguments C
DeclareProperty( "IsSymmetricClosedMonoidalProset",
        IsCapCategory );

AddCategoricalProperty( [ "IsSymmetricClosedMonoidalProset", "IsSymmetricCoclosedMonoidalProset" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsSymmetricClosedMonoidalProset :=
  DuplicateFreeList( Concatenation(
          ListOfDefiningOperations( "IsSymmetricMonoidalProset" ),
          ListOfDefiningOperations( "IsSymmetricClosedMonoidalCategory" ) ) );

#! @Description
#!  The property of <A>C</A> being a symmetric coclosed monoidal thin category.
#! @Arguments C
DeclareProperty( "IsSymmetricCoclosedMonoidalProset",
        IsCapCategory );

AddCategoricalProperty( [ "IsSymmetricCoclosedMonoidalProset", "IsSymmetricClosedMonoidalProset" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsSymmetricCoclosedMonoidalProset :=
  DuplicateFreeList( Concatenation(
          ListOfDefiningOperations( "IsSymmetricMonoidalProset" ),
          ListOfDefiningOperations( "IsSymmetricCoclosedMonoidalCategory" ) ) );

####################################
#
#! @Section Operations
#
####################################

#! @Description
#!  Check if <A>A</A> is isomorphic to <A>B</A> under the assumption that
#!  there exists a morphism from <A>A</A> to <A>B</A>, i.e., if
#!  <A>A</A> is known to be less or equal to <A>B</A> w.r.t. the preorder.
#! @Arguments A, B
#! @Returns <C>true</C> or <C>false</C>
DeclareOperation( "AreIsomorphicForObjectsIfIsHomSetInhabited",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct the unique morphism with source <A>A</A> and target <A>B</A>.
#! @Arguments A, B
#! @Returns a &CAP; morphism
DeclareOperation( "UniqueMorphism",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

# @Section Tools

DeclareGlobalVariable( "PREORDERED_SET_METHOD_NAME_RECORD" );

DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_PREORDERED_SETS" );
