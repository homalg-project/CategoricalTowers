# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletion: Finite (co)product/(co)limit (co)completions
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
DeclareCategory( "IsCategoryOfSkeletalFinSetsAsFiniteCoproductCocompletionOfTerminalCategory",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in the category of skeletal finsets.
DeclareCategory( "IsCellSkeletalFinSets",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in the category of skeletal finsets.
DeclareCategory( "IsObjectInSkeletalFinSets",
        IsCellSkeletalFinSets and IsCapCategoryObject  );

#! @Description
#!  The &GAP; category of morphisms in the category of skeletal finsets.
DeclareCategory( "IsMorphismInSkeletalFinSets",
        IsCellSkeletalFinSets and IsCapCategoryMorphism );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The integer defining the skeletal finite set <A>M</A>, i.e.,
#!  <C>Length( FinSet( n ) ) = n</C>.
#! @Arguments M
#! @Returns an integer
DeclareAttribute( "Length",
        IsObjectInSkeletalFinSets );

CapJitAddTypeSignature( "Length", [ IsObjectInSkeletalFinSets ], IsInt );

#! @Description
#!  The list associated to a skeletal finite set, i.e.,
#!  <C>AsList( FinSet( n ) ) = [ 0 .. n - 1 ]</C>.
#! @Arguments M
#! @Returns a list
DeclareAttribute( "AsList",
        IsObjectInSkeletalFinSets );

CapJitAddTypeSignature( "AsList", [ IsObjectInSkeletalFinSets ], rec( filter := IsList, element_type := rec( filter := IsInt ) ) );

#! @Description
#!  The lazy array of images between skeletal finite sets.
#! @Arguments phi
#! @Returns a lazy array
DeclareAttribute( "AsList",
        IsMorphismInSkeletalFinSets );

CapJitAddTypeSignature( "AsList", [ IsMorphismInSkeletalFinSets ], rec( filter := IsList, element_type := rec( filter := IsInt ) ) );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct a category of skeletal finite sets
#!  as the finite coproduct cocompletion of the terminal category.
#! @Returns a &CAP; category
DeclareOperation( "SkeletalFinSetsAsFiniteCoproductCocompletionOfTerminalCategory", [ ] );

#! @Description
#!  The default instance of the category of skeletal finite sets.
#!  It is automatically created while loading this package.
# DeclareGlobalVariable( "SkeletalFinSetsAsFreeElementaryToposOfInitialCategory" );

#! @Description
#!  Construct a skeletal finite set residing in
#!  the given category of skeletal finite sets <A>C</A>
#!  of order given by the nonnegative integer <A>n</A>.
#! @Arguments C, n
#! @Returns a &CAP; object
DeclareOperation( "FinSetConstructor",
        [ IsCategoryOfSkeletalFinSetsAsFiniteCoproductCocompletionOfTerminalCategory, IsInt ] );

#KeyDependentOperation( "FinSet", IsCategoryOfSkeletalFinSetsAsFiniteCoproductCocompletionOfTerminalCategory, IsInt, ReturnTrue );

#! @Description
#!  Construct a map $\phi:$<A>s</A>$\to$<A>t</A> of the skeletal finite sets <A>s</A> and <A>t</A>,
#!  i.e., a morphism in the &CAP; category of <A>s</A>, where <A>G</A>
#!  is a list of integers in <A>t</A> describing the graph of $\phi$.
#! @Arguments s, G, t
#! @Returns a &CAP; morphism
DeclareOperation( "MapOfFinSets",
        [ IsObjectInSkeletalFinSets, IsList, IsObjectInSkeletalFinSets ] );
