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
#!  The &GAP; category of cells in a Hom-category of functors between two fixed categories.
DeclareCategory( "IsCapCategoryCellInHomCategory",
        IsCapCategoryCell and
        IsAttributeStoringRep );

#! @Description
#!  The &GAP; category of objects in a Hom-category of functors between two fixed categories.
DeclareCategory( "IsCapCategoryObjectInHomCategory",
        IsCapCategoryCellInHomCategory and
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a Hom-category of functors between two fixed categories.
DeclareCategory( "IsCapCategoryMorphismInHomCategory",
        IsCapCategoryCellInHomCategory and
        IsCapCategoryMorphism );

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

DeclareOperation( "ApplyCell",
        [ IsList, IsCapCategoryCell ] );

DeclareOperation( "ApplyCell",
        [ IsInt, IsCapCategoryCell ] );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct the category <C>Hom( <A>C</A>, <A>D</A> )</C> of
#!  functors from the small category <A>C</A> to the category <A>D</A> as objects
#!  and their natural transformations as morphisms.
#! @Arguments C, D
#! @Returns a &CAP; category
DeclareOperationWithCache( "Hom",
        [ IsCapCategory, IsCapCategory ] );

#! @Description
#!  Turn the functor <A>F</A>:$C \to D$ into an object in the category of functors <C><A>H</A> := Hom( C, D )</C>.
#! @Arguments H, F
#! @Returns an object in a &CAP; category
#! @Group AsObjectInHomCategory
DeclareOperation( "AsObjectInHomCategory",
        [ IsCapCategory, IsCapFunctor ] );

#! @Arguments F
#! @Group AsObjectInHomCategory
DeclareOperation( "AsObjectInHomCategory",
        [ IsCapFunctor ] );

#! @Description
#!  Turn the natrual transformation <A>eta</A>:$F \to G$
#!  into a morphism in the category of functors <C><A>H</A> := Hom( C, D )</C>,
#!  where <C>C := Source( F ) = Source( G )</C> and <C>D := Range( F ) = Range( G )</C>.
#! @Arguments H, eta
#! @Returns a morphism in a &CAP; category
#! @Group AsMorphismInHomCategory
DeclareOperation( "AsMorphismInHomCategory",
        [ IsCapCategory, IsCapNaturalTransformation ] );

#! @Arguments eta
#! @Group AsMorphismInHomCategory
DeclareOperation( "AsMorphismInHomCategory",
        [ IsCapNaturalTransformation ] );
