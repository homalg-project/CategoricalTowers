#############################################################################
##
##  CategoriesWithAmbientObjects.gd                   CategoriesWithAmbientObjects package
##
##  Copyright 2016,      Mohamed Barakat, University of Siegen
##                       Kamal Saleh, University of Siegen
##
##  Declaration stuff for categories with ambient objects.
##
#############################################################################

#! @Chapter Intrinsic Categories

# our info class:
DeclareInfoClass( "InfoCategoriesWithAmbientObjects" );
SetInfoLevel( InfoCategoriesWithAmbientObjects, 1 );

####################################
#
#! @Section Categories
#
####################################

#! @Description
#!  The &GAP; category of objects with ambient objects in a &CAP; category.
DeclareCategory( "IsCapCategoryObjectWithAmbientObject",
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms between objects with ambient objects in a &CAP; category.
DeclareCategory( "IsCapCategoryMorphismWithAmbientObject",
        IsCapCategoryMorphism );

####################################
#
#! @Section Technical stuff
#
####################################

# a central place for configurations:
DeclareGlobalVariable( "PROPAGATION_LIST_FOR_MORPHISMS_BETWEEN_OBJECTS_WITH_AMBIENT_OBJECT" );

DeclareGlobalFunction( "INSTALL_TODO_LIST_FOR_MORPHISMS_BETWEEN_OBJECTS_WITH_AMBIENT_OBJECT" );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The generalized embedding of the object <A>M</A> into its ambient object.
#! @Arguments M
#! @Returns a &CAP; generalized monomorphism
DeclareAttribute( "GeneralizedEmbeddingInAmbientObject",
        IsCapCategoryObjectWithAmbientObject );

#! @Description
#!  The embedding of the object <A>M</A> into its ambient object modulo the aid, i.e.,
#!  the output is the associated (mono)morphism of the normalized 3-arrow formalism with domain = identity.
#! @Arguments M
#! @Returns a &CAP; monomorphism
DeclareAttribute( "EmbeddingInAmbientObject",
        IsCapCategoryObjectWithAmbientObject );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  
#! @Arguments iota, A
#! @Returns an object in the category <A>A</A> with ambient objects
DeclareOperation( "ObjectWithAmbientObject",
        [ IsGeneralizedMorphismByCospan, IsCapCategory ] );

#! @Description
#!  
#! @Arguments phi, A
#! @Returns a morphism in the category <A>A</A> with ambient objects
DeclareOperation( "MorphismWithAmbientObject",
        [ IsCapCategoryObjectWithAmbientObject, IsCapCategoryMorphism, IsCapCategoryObjectWithAmbientObject ] );

#! @Description
#!  
#! @Arguments A
#! @Returns a &CAP; category
DeclareAttribute( "CategoryWithAmbientObject",
        IsCapCategory );

#! @Description
#!  Display the embedding of the object <A>M</A> into its ambient object.
#! @Arguments M
#! @Returns nothing
DeclareOperation( "DisplayEmbeddingInAmbientObject",
        [ IsCapCategoryObjectWithAmbientObject ] );

DeclareGlobalFunction( "ADD_FUNCTIONS_FOR_CATEGORY_WITH_AMBIENT_OBJECTS" );

#! @Description
#!  Wrap the &CAP; functor <A>F</A>:<C>UnderlyingCategory</C>(<A>A</A>)<M>\to</M><C>UnderlyingCategory</C>(<A>B</A>),
#!  where <A>A</A> and <A>B</A> are categories with ambient objects.
#! @Arguments F, name, A, B
#! @Group WithAmbientObject_functor
#! @Returns a &CAP; functor
DeclareOperation( "WithAmbientObject",
        [ IsCapFunctor, IsString, IsCapCategory, IsCapCategory ] );

#! @Arguments F, A, B
#! @Group WithAmbientObject_functor
DeclareOperation( "WithAmbientObject",
        [ IsCapFunctor, IsCapCategory, IsCapCategory ] );

#! @Arguments F, name, A
#! @Group WithAmbientObject_functor
DeclareOperation( "WithAmbientObject",
        [ IsCapFunctor, IsString, IsCapCategory ] );

#! @Arguments F, A
#! @Group WithAmbientObject_functor
DeclareOperation( "WithAmbientObject",
        [ IsCapFunctor, IsCapCategory ] );

#! @Description
#!  Wrap the &CAP; natural transformation <A>eta</A>:<A>F</A><C>!.UnderlyingFunctor</C><M>\to</M><A>G</A><C>!.UnderlyingFunctor</C>,
#!  where <A>F</A> and <A>G</A> are functors between categories with ambient objects.
#! @Arguments eta, name, F, G
#! @Group WithAmbientObject_nattr
#! @Returns a &CAP; natural transformation
DeclareOperation( "WithAmbientObject",
        [ IsCapNaturalTransformation, IsString, IsCapFunctor, IsCapFunctor ] );

#! @Arguments eta, F, G
#! @Group WithAmbientObject_nattr
DeclareOperation( "WithAmbientObject",
        [ IsCapNaturalTransformation, IsCapFunctor, IsCapFunctor ] );
