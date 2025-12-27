# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Declarations
#

#! @Chapter SkeletalFinSets

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of a finite coproduct cocompletion category.
DeclareCategory( "IsSkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategory",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in the category of skeletal finsets.
DeclareCategory( "IsCellInSkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategory",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in the category of skeletal finsets.
DeclareCategory( "IsObjectInSkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategory",
        IsCellInSkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategory and IsCapCategoryObject  );

#! @Description
#!  The &GAP; category of morphisms in the category of skeletal finsets.
DeclareCategory( "IsMorphismInSkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategory",
        IsCellInSkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategory and IsCapCategoryMorphism );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The integer defining the skeletal finite set <A>M</A>, i.e.,
#!  <C>Cardinality( FinSet( n ) ) = n</C>.
#! @Arguments M
#! @Returns an integer
DeclareAttribute( "Cardinality",
        IsObjectInSkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategory );

CapJitAddTypeSignature( "Cardinality", [ IsObjectInSkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategory ], IsBigInt );

#! @Description
#!  The list associated to a skeletal finite set, i.e.,
#!  <C>AsList( FinSet( n ) ) = [ 0 .. n - 1 ]</C>.
#! @Arguments M
#! @Returns a list
DeclareAttribute( "AsList",
        IsObjectInSkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategory );

CapJitAddTypeSignature( "AsList", [ IsObjectInSkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategory ], CapJitDataTypeOfListOf( IsBigInt ) );

#! @Description
#!  The lazy array of images between skeletal finite sets.
#! @Arguments phi
#! @Returns a lazy array
DeclareAttribute( "AsList",
        IsMorphismInSkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategory );

CapJitAddTypeSignature( "AsList", [ IsMorphismInSkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategory ], CapJitDataTypeOfListOf( IsBigInt ) );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct a category of skeletal finite sets
#!  as the finite coproduct cocompletion of the terminal category.
#! @Returns a &CAP; category
DeclareGlobalFunction( "SkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategory" );

#! @Description
#!  The default instance of the category of skeletal finite sets.
#!  It is automatically created while loading this package.
# DeclareGlobalVariable( "SkeletalFinSetsAsFreeElementaryToposOfInitialCategory" );

#KeyDependentOperation( "FinSet", IsSkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategory, IsInt, ReturnTrue );
