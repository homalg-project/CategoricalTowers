# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

#! @Chapter Categories of functors

# our info class:
DeclareInfoClass( "InfoFunctorCategories" );
SetInfoLevel( InfoFunctorCategories, 1 );

####################################
#
#! @Section &GAP; Categories
#
####################################

#! @Description
#!  The &GAP; category of Hom-categories of functors between two fixed categories.
#! @Arguments category
DeclareCategory( "IsFunctorCategory",
        IsCapCategory and
        IsAttributeStoringRep );

#! @Description
#!  The &GAP; category of cells in a Hom-category of functors between two fixed categories.
#! @Arguments cell
DeclareCategory( "IsCellInFunctorCategory",
        IsCapCategoryCell and
        IsAttributeStoringRep );

#! @Description
#!  The &GAP; category of objects in a Hom-category of functors between two fixed categories.
#! @Arguments obj
DeclareCategory( "IsObjectInFunctorCategory",
        IsCellInFunctorCategory and
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a Hom-category of functors between two fixed categories.
#! @Arguments mor
DeclareCategory( "IsMorphismInFunctorCategory",
        IsCellInFunctorCategory and
        IsCapCategoryMorphism );

####################################
#
#! @Section Global variables
#
####################################

#!
DeclareGlobalVariable( "CAP_INTERNAL_METHOD_NAME_LIST_FOR_FUNCTOR_CATEGORY" );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The source of the functor underlying functor object <A>F</A>.
#! @Arguments F
#! @Returns a &CAP; category
DeclareAttribute( "Source",
        IsObjectInFunctorCategory );

#! @Description
#!  The target of the functor underlying the functor object <A>F</A>.
#! @Arguments F
#! @Returns a &CAP; category
DeclareAttribute( "Range",
        IsObjectInFunctorCategory );

#! @Description
#!  The functor underlying the functor object <A>F</A>.
#! @Arguments F
#! @Returns a &CAP; functor
DeclareAttribute( "UnderlyingCapTwoCategoryCell",
        IsObject );

#! @Description
#!  The argument is a category of functors <A>Hom</A> into some matrix category of a homalg field.
#!  The output is the list of indecomposable projective objects in <A>Hom</A> up to isomorphism.
#! @Arguments Hom
#! @Returns a list
DeclareAttribute( "IndecProjectiveObjects",
        IsFunctorCategory );

#! @Description
#!  The argument is a category of functors <A>Hom</A> into some matrix category of a homalg field.
#!  The output is the list of indecomposable injective objects in <A>Hom</A> up to isomorphism.
#! @Arguments Hom
#! @Returns a list
DeclareAttribute( "IndecInjectiveObjects",
        IsFunctorCategory );

#! @Description
#!  The argument is a category of functors <A>Hom</A> into some matrix category of a homalg field.
#!  The output is the list of simple objects in <A>Hom</A>.
#! @Arguments Hom
#! @Returns a list
DeclareAttribute( "SimpleObjects",
        IsFunctorCategory );

####################################
#
#! @Section Operations
#
####################################

#! @Description
#!  Apply the functor <A>F</A> (as an object in the corresponding Hom-category) to the cell <A>c</A>.
#!  The shorthand is <A>F</A>(<A>c</A>).
#! @Arguments F, c
#! @Returns a &CAP; cell
DeclareOperation( "ApplyCell",
        [ IsObjectInFunctorCategory, IsCapCategoryCell ] );

#! @Description
#!  Apply the natural transformation <A>eta</A> (as an object in the corresponding Hom-category) to the object <A>o</A>.
#!  The shorthand is <A>eta</A>(<A>o</A>).
#! @Arguments eta, o
DeclareOperation( "ApplyCell",
        [ IsMorphismInFunctorCategory, IsCapCategoryObject ] );

#! @Description
#! @Returns Four morphisms that form a commutative square that appears in the definition of natural transformations
#! (as an object in the corresponding Hom-category).
#! These are the four morphisms of the compatibility diagram of a natural transformation <A>eta</A> with the morphism <A>mor</A>.
#! @Arguments eta, mor
DeclareOperation( "ApplyCell",
        [ IsMorphismInFunctorCategory, IsCapCategoryMorphism ] );

##
DeclareOperation( "ApplyCell",
        [ IsCapFunctor, IsCapCategoryCell ] );

##
DeclareOperation( "ApplyCell",
        [ IsCapNaturalTransformation, IsCapCategoryObject ] );

##
DeclareOperation( "ApplyCell",
        [ IsCapNaturalTransformation, IsCapCategoryMorphism ] );

##
DeclareOperation( "ApplyCell",
        [ IsList, IsCapCategoryCell ] );

##
DeclareOperation( "ApplyCell",
        [ IsInt, IsCapCategoryCell ] );


##
DeclareOperation( "ApplyCell",
        [ IsCapCategory, IsCapCategoryCell ] );


#! @Description
#!  Returns the values of the cell <A>c</A> in the functor category <A>Hom</A>
#!  (which is either a functor or a natural transformation)
#!  on all objects of the source category of <A>Hom</A>.
#! @Arguments c
#! @Returns a list
DeclareOperation( "ValuesOnAllObjects",
        [ IsCellInFunctorCategory ] );

#! @Description
#!  Returns the values of the functor <A>F</A>
#!  on all morphisms of the source category.
#! @Arguments F
#! @Returns a list
DeclareOperation( "ValuesOnAllGeneratingMorphisms",
        [ IsObjectInFunctorCategory ] );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct the category <C>FunctorCategory(</C> <A>B</A>, <A>C</A> <C>)</C>=
#!  <C>Hom(</C> <A>B</A>, <A>C</A> <C>)</C> of functors from the small category
#!  <A>B</A> to the category <A>C</A> as objects
#!  and their natural transformations as morphisms.
#! @Returns a &CAP; category
#! @Arguments B, C
#! @Group FunctorCategory
DeclareOperationWithCache( "FunctorCategory",
        [ IsCapCategory, IsCapCategory ] );

#! @Arguments B, k
#! @Group FunctorCategory
DeclareOperationWithCache( "FunctorCategory",
        [ IsCapCategory, IsHomalgRing ] );

#! @Arguments B, C
#! @Group FunctorCategory
DeclareOperation( "Hom",
        [ IsCapCategory, IsCapCategory ] );

#! @Arguments B, k
#! @Group FunctorCategory
DeclareOperation( "Hom",
        [ IsCapCategory, IsHomalgRing ] );

#! @Description
#!  Construct the category <C>Hom( <A>B</A>^op, <A>C</A> )</C> of
#!  functors from the opposite of the small category <A>B</A> to the category <A>C</A> as objects
#!  and their natural transformations as morphisms.
#! @Arguments B, C
#! @Returns a &CAP; category
#! @Group PreSheaves
DeclareOperationWithCache( "PreSheaves",
        [ IsCapCategory, IsCapCategory ] );

#! @Arguments B, k
#! @Group PreSheaves
DeclareOperationWithCache( "PreSheaves",
        [ IsCapCategory, IsHomalgRing ] );

#! @Arguments B
#! @Group PreSheaves
DeclareOperationWithCache( "PreSheaves",
        [ IsCapCategory ] );

#! @Description
#!  Turn the functor <C><A>F</A>:<A>B</A></C> $\to$ <C>C</C> into an object in the category of functors <C><A>H</A> := Hom( <A>B</A>, C )</C>.
#! @Arguments H, F
#! @Returns an object in a &CAP; category
#! @Group AsObjectInFunctorCategory
DeclareOperation( "AsObjectInFunctorCategory",
        [ IsCapCategory, IsCapFunctor ] );

#! @Arguments F
#! @Group AsObjectInFunctorCategory
DeclareAttribute( "AsObjectInFunctorCategory",
        IsCapFunctor );

#! @Description
#!  An alternative input is the source category <A>B</A> and two defining records <A>rec_images_of_objects</A> and <A>rec_images_of_morphisms</A> of <A>F</A>.
#! @Arguments B, rec_images_of_objects, rec_images_of_morphisms
#! @Group AsObjectInFunctorCategory
DeclareOperation( "AsObjectInFunctorCategory",
        [ IsCapCategory, IsRecord, IsRecord ] );

#! @Description
#!  Another alternative input is the source category <A>B</A> and two defining lists <A>images_of_objects</A> and <A>images_of_morphisms</A> of <A>F</A>.
#!  The order of their entries must correspond to that of the vertices and arrows of the underlying quiver.
#!
#!  For the convenience of the user the following input is also valid:
#!  If <A>images_of_objects</A> is a list of nonnegative integers,
#!  <A>images_of_morphisms</A> is a list of matrices, and
#!  $k:=$ <C>CommutativeRingOfLinearCategory</C>( B ) is a field
#!  then the two lists are interpreted as objects and morphisms
#!  in <C>MatrixCategory</C>( $k$ ), respectively.
#! @Arguments B, images_of_objects, images_of_morphisms
#! @Group AsObjectInFunctorCategory
DeclareOperation( "AsObjectInFunctorCategory",
        [ IsCapCategory, IsList, IsList ] );

#! @Description
#!  Turn the natrual transformation <A>eta</A>:$F \to G$ into a morphism
#!  <C><A>U</A> := AsObjectInFunctorCategory( F )</C> $\to$ <C><A>V</A> := AsObjectInFunctorCategory( G )</C>
#!  in the category of functors <C><A>H</A> := Hom( B, C )</C>, where
#!  <C>B := Source( F ) = Source( G )</C> and <C>C := Range( F ) = Range( G )</C>.
#! @Arguments H, eta
#! @Returns a morphism in a &CAP; category
#! @Group AsMorphismInFunctorCategory
DeclareOperation( "AsMorphismInFunctorCategory",
        [ IsCapCategory, IsCapNaturalTransformation ] );

#! @Arguments eta
#! @Group AsMorphismInFunctorCategory
DeclareAttribute( "AsMorphismInFunctorCategory",
        IsCapNaturalTransformation );

#! @Arguments U, e, V
#!  An alternative input is the triple (<A>U</A>, <A>e</A>, <A>V</A>),
#!  where <A>e</A> is a defining record of <A>eta</A>.
#! @Group AsMorphismInFunctorCategory
DeclareOperation( "AsMorphismInFunctorCategory",
        [ IsObjectInFunctorCategory, IsRecord, IsObjectInFunctorCategory ] );

#! @Arguments U, e, V
#!  Another alternative input is the triple (<A>U</A>, <A>e</A>, <A>V</A>),
#!  where <A>e</A> is a defining list of <A>eta</A>.
#! @Group AsMorphismInFunctorCategory
DeclareOperation( "AsMorphismInFunctorCategory",
        [ IsObjectInFunctorCategory, IsList, IsObjectInFunctorCategory ] );
