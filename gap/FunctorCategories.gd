#
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
DeclareCategory( "IsCapHomCategory",
        IsCapCategory and
        IsAttributeStoringRep );

#! @Description
#!  The &GAP; category of cells in a Hom-category of functors between two fixed categories.
#! @Arguments cell
DeclareCategory( "IsCapCategoryCellInHomCategory",
        IsCapCategoryCell and
        IsAttributeStoringRep );

#! @Description
#!  The &GAP; category of objects in a Hom-category of functors between two fixed categories.
#! @Arguments obj
DeclareCategory( "IsCapCategoryObjectInHomCategory",
        IsCapCategoryCellInHomCategory and
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a Hom-category of functors between two fixed categories.
#! @Arguments mor
DeclareCategory( "IsCapCategoryMorphismInHomCategory",
        IsCapCategoryCellInHomCategory and
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
#! @Section Technical stuff
#
####################################

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
        IsCapCategoryObjectInHomCategory );

#! @Description
#!  The target of the functor underlying the functor object <A>F</A>.
#! @Arguments F
#! @Returns a &CAP; category
DeclareAttribute( "Range",
        IsCapCategoryObjectInHomCategory );

#! @Description
#!  The functor underlying the functor object <A>F</A>.
#! @Arguments F
#! @Returns a &CAP; functor
DeclareAttribute( "UnderlyingCapTwoCategoryCell",
        IsObject );

####################################
#
#! @Section Operations
#
####################################

#! @Description
#!  Apply the functor <A>F</A> to the cell <A>c</A>.
#! @Arguments F, c
#! @Returns a &CAP; cell
DeclareOperation( "ApplyCell",
        [ IsCapFunctor, IsCapCategoryCell ] );

#! @Description
#!  Apply the natural transformation <A>eta</A> to the object <A>o</A>
#! @Arguments eta, o
DeclareOperation( "ApplyCell",
        [ IsCapNaturalTransformation, IsCapCategoryObject ] );

#! @Description
#! @Returns Four morphisms that form a commutative square that appears in the definition of natural transformations (the compatibility of a natural transformation <A>eta</A> with morphisms <A>mor</A>)
#! @Arguments eta, mor
DeclareOperation( "ApplyCell",
        [ IsCapNaturalTransformation, IsCapCategoryMorphism ] );

#! @Description
#!  Apply every element of the List <A>L</A> to the cell <A>c</A> and return the obtained list.
#! @Arguments L, c
#! @Returns a list of &CAP; cells
DeclareOperation( "ApplyCell",
        [ IsList, IsCapCategoryCell ] );

#! @Description
#!  Given a natural number <A>n</A> and a cell <A>c</A> return <A>n</A>.
#! @Arguments n, c
#! @Returns a natural number
DeclareOperation( "ApplyCell",
        [ IsInt, IsCapCategoryCell ] );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct the category <C>Hom( <A>B</A>, <A>C</A> )</C> of
#!  functors from the small category <A>B</A> to the category <A>C</A> as objects
#!  and their natural transformations as morphisms.
#! @Arguments B, C
#! @Returns a &CAP; category
DeclareOperationWithCache( "Hom",
        [ IsCapCategory, IsCapCategory ] );

#! @Description
#!  Turn the functor <C><A>F</A>:<A>B</A></C> $\to$ <C>C</C> into an object in the category of functors <C><A>H</A> := Hom( <A>B</A>, C )</C>.
#! @Arguments H, F
#! @Returns an object in a &CAP; category
#! @Group AsObjectInHomCategory
DeclareOperation( "AsObjectInHomCategory",
        [ IsCapCategory, IsCapFunctor ] );

#! @Arguments F
#! @Group AsObjectInHomCategory
DeclareAttribute( "AsObjectInHomCategory",
        IsCapFunctor );

#! @Description
#! @Arguments B, rec_images_of_objects, rec_images_of_morphisms
#!  An alternative input is the source category <A>B</A> and two defining records <A>rec_images_of_objects</A> and <A>rec_images_of_morphisms</A> of <A>F</A>.
#! @Group AsObjectInHomCategory
DeclareOperation( "AsObjectInHomCategory",
        [ IsCapCategory, IsRecord, IsRecord ] );

#! @Description
#! @Arguments B, images_of_objects, images_of_morphisms
#!  Another alternative input is the source category <A>B</A> and two defining lists <A>images_of_objects</A> and <A>images_of_morphisms</A> of <A>F</A>.
#!  The order of their entries must correspond to that of the vertices and arrows of the underlying quiver.
#! @Group AsObjectInHomCategory
DeclareOperation( "AsObjectInHomCategory",
        [ IsCapCategory, IsList, IsList ] );

#! @Description
#!  Turn the natrual transformation <A>eta</A>:$F \to G$ into a morphism
#!  <C><A>U</A> := AsObjectInHomCategory( F )</C> $\to$ <C><A>V</A> := AsObjectInHomCategory( G )</C>
#!  in the category of functors <C><A>H</A> := Hom( B, C )</C>, where
#!  <C>B := Source( F ) = Source( G )</C> and <C>C := Range( F ) = Range( G )</C>.
#! @Arguments H, eta
#! @Returns a morphism in a &CAP; category
#! @Group AsMorphismInHomCategory
DeclareOperation( "AsMorphismInHomCategory",
        [ IsCapCategory, IsCapNaturalTransformation ] );

#! @Arguments eta
#! @Group AsMorphismInHomCategory
DeclareAttribute( "AsMorphismInHomCategory",
        IsCapNaturalTransformation );

#! @Arguments U, e, V
#!  An alternative input is the triple (<A>U</A>, <A>e</A>, <A>V</A>),
#!  where <A>e</A> is a defining record of <A>eta</A>.
#! @Group AsMorphismInHomCategory
DeclareOperation( "AsMorphismInHomCategory",
        [ IsCapCategoryObjectInHomCategory, IsRecord, IsCapCategoryObjectInHomCategory ] );

#! @Arguments U, e, V
#!  Another alternative input is the triple (<A>U</A>, <A>e</A>, <A>V</A>),
#!  where <A>e</A> is a defining list of <A>eta</A>.
#! @Group AsMorphismInHomCategory
DeclareOperation( "AsMorphismInHomCategory",
        [ IsCapCategoryObjectInHomCategory, IsList, IsCapCategoryObjectInHomCategory ] );

#! @Description
#!  The argument is a category of functors <A>Hom</A> into some matrix category of a homalg field.
#!  The output is the list of indecomposable projective objects in <A>Hom</A> up to isomorphism.
#! @Arguments Hom
#! @Returns a list
DeclareAttribute( "IndecProjectiveObjects",
        IsCapHomCategory );

#! @Description
#!  The argument is a category of functors <A>Hom</A> into some matrix category of a homalg field.
#!  The output is the list of indecomposable injective objects in <A>Hom</A> up to isomorphism.
#! @Arguments Hom
#! @Returns a list
DeclareAttribute( "IndecInjectiveObjects",
        IsCapHomCategory );

#! @Description
#!  The argument is a category of functors <A>Hom</A> into some matrix category of a homalg field.
#!  The output is the list of simple objects in <A>Hom</A>.
#! @Arguments Hom
#! @Returns a list
DeclareAttribute( "SimpleObjects",
        IsCapHomCategory );

#! @Description
#!  Returns the values of the cell <A>c</A> (which is either a functor or a natural transformation)
#!  on all objects of the source category.
#! @Arguments c
#! @Returns a list
DeclareAttribute( "ValuesOnAllObjects",
        IsCapCategoryCellInHomCategory );

#! @Description
#!  Returns the values of the functor <A>F</A>
#!  on all morphisms of the source category.
#! @Arguments F
#! @Returns a list
DeclareAttribute( "ValuesOnAllGeneratingMorphisms",
        IsCapCategoryObjectInHomCategory );
