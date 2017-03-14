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
DeclareAttribute( "GeneralizedEmbeddingInAmbientObject",
        IsCapCategoryObjectWithAmbientObject );

#! @Description
#!  The embedding of the object <A>M</A> into its ambient object modulo the aid, i.e.,
#!  the output is the associated (mono)morphism of the normalized 3-arrow formalism with domain = identity.
#! @Arguments M
DeclareAttribute( "EmbeddingInAmbientObject",
        IsCapCategoryObjectWithAmbientObject );

#! @Description
#!  The object underlying the object <A>M</A> with an ambient object.
#! @Arguments M
DeclareAttribute( "ObjectWithoutAmbientObject",
        IsCapCategoryObjectWithAmbientObject );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  
#! @Arguments iota, A
DeclareOperation( "ObjectWithAmbientObject",
        [ IsGeneralizedMorphismByCospan, IsCapCategory ] );

#! @Description
#!  
#! @Arguments phi, A
DeclareOperation( "MorphismWithAmbientObject",
        [ IsCapCategoryObjectWithAmbientObject, IsCapCategoryMorphism, IsCapCategoryObjectWithAmbientObject ] );

#! @Description
#!  
#! @Arguments A
DeclareOperation( "CategoryWithAmbientObject",
        [ IsCapCategory ] );

#! @Description
#!  Display the embedding of the object <A>M</A> into its ambient object.
#! @Arguments M
DeclareOperation( "DisplayEmbeddingInAmbientObject",
        [ IsCapCategoryObjectWithAmbientObject ] );

DeclareGlobalFunction( "ADD_FUNCTIONS_FOR_CATEGORY_WITH_AMBIENT_OBJECTS" );

#! @Description
#!  WithAmbientObject a functor ...
#! @Arguments F, name, A, B
DeclareOperation( "WithAmbientObject",
        [ IsCapFunctor, IsString, IsCapCategory, IsCapCategory ] );

#! @Description
#!  WithAmbientObject a functor ...
#! @Arguments F, A, B
#! @Group WithAmbientObject
DeclareOperation( "WithAmbientObject",
        [ IsCapFunctor, IsCapCategory, IsCapCategory ] );

#! @Description
#!  WithAmbientObject an endofunctor ...
#! @Arguments F, name, A
#! @Group WithAmbientObject
DeclareOperation( "WithAmbientObject",
        [ IsCapFunctor, IsString, IsCapCategory ] );

#! @Description
#!  WithAmbientObject an endofunctor ...
#! @Arguments F, A
#! @Group WithAmbientObject
DeclareOperation( "WithAmbientObject",
        [ IsCapFunctor, IsCapCategory ] );

#! @Description
#!  WithAmbientObject a natural transformation
#! @Arguments eta, name, A, B
#! @Group WithAmbientObject
DeclareOperation( "WithAmbientObject",
        [ IsCapNaturalTransformation, IsString, IsCapFunctor, IsCapFunctor ] );

#! @Description
#!  WithAmbientObject a natural transformation
#! @Arguments eta, A, B
#! @Group WithAmbientObject
DeclareOperation( "WithAmbientObject",
        [ IsCapNaturalTransformation, IsCapFunctor, IsCapFunctor ] );
