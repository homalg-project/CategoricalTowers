#
# CatReps: Representations and cohomology of finite categories
#
# Declarations
#

#! @Chapter Full subcategories

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The GAP category of a finite concrete category
#! @Arguments object
DeclareCategory( "IsFiniteConcreteCategory",
                 IsCapCategory );

#! @Description
#!  The GAP category of cell in a finite concrete category
#! @Arguments object
DeclareCategory( "IsCellInAFiniteConcreteCategory",
                 IsCapCategoryCell );

#! @Description
#!  The GAP category of objects in a finite concrete category
#! @Arguments object
DeclareCategory( "IsObjectInAFiniteConcreteCategory",
                 IsCellInAFiniteConcreteCategory and IsCapCategoryObject );

#! @Description
#!  The GAP category of morphisms in a finite concrete category
#! @Arguments object
DeclareCategory( "IsMorphismInAFiniteConcreteCategory",
                 IsCellInAFiniteConcreteCategory and IsCapCategoryMorphism );

####################################
#
#! @Section Global variables
#
####################################

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The set of objects of the concrete category <A>C</A>.
#! @Arguments C
#! @Returns a list
DeclareAttribute( "SetOfObjects",
        IsCapSubcategory );

#! @Description
#!  The set of generating morphisms of the concrete category <A>C</A>.
#! @Arguments C
#! @Returns a list
DeclareAttribute( "SetOfGeneratingMorphisms",
        IsCapSubcategory );

#! @Description
#!  The set of morphisms of the concrete category <A>C</A>.
#! @Arguments C
#! @Returns a list
DeclareAttribute( "SetOfMorphisms",
        IsCapSubcategory );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct finite concrete category out of the list <A>L</A> of morphisms given by images.
#! @Arguments L
#! @Returns a &CAP; object
DeclareOperation( "ConcreteCategoryForCAP",
        [ IsList ] );
#! @InsertChunk ConcreteCategoryForCAP

####################################
#
#! @Section Tools
#
####################################

#! @Description
#!  Construct the map of finite sets corresponding to
#!  the list of images in the convention of catreps.
#! @Arguments objects_list, generator
#! @Returns a morphism of finite sets
DeclareGlobalFunction( "ConvertToMapOfFinSets" );
#! @InsertChunk ConvertToMapOfFinSets
