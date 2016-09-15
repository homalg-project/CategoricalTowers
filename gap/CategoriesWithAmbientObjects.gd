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
#! @Section Attributes
#
####################################

#! @Description
#!  The generalized embedding of the object <A>M</A> into its ambient object.
#! @Arguments M
DeclareAttribute( "GeneralizedEmbeddingInAmbientObject",
        IsCapCategoryObjectWithAmbientObject );

#! @Description
#!  The embedding of the object <A>M</A> into its ambient object modulo the aid.
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
#! @Arguments iota, A
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
