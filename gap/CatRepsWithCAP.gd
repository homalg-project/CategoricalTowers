# SPDX-License-Identifier: GPL-2.0-or-later
# CatReps: Representations and cohomology of finite categories
#
# Declarations
#

#! @Chapter Finite concrete categories

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

#! @Description
#!  Return the right quiver <A>q(n)</A> from the concrete category <A>C</A>
#!  with $n$ objects.
#! @Arguments C
#! @Returns a right quiver
DeclareAttribute( "RightQuiverFromConcreteCategory",
        IsCapCategory );

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

#! @Description
#!  Return the <A>k</A>-linear closure of the category <A>C</A>
#!  over the commutative ring <A>k</A>.
#! @Arguments k, C
#! @Returns a k-linear category
DeclareOperation( "Algebroid",
        [ IsHomalgRing, IsCapCategory ] );
#! @InsertChunk Algebroid

#! @Description
#!  Return the endomorphism relations of the
#!  category <A>C</A>.
#! @Arguments k, C
#! @Returns list of relations as generators of ideal.
DeclareOperation( "RelationsOfEndomorphisms",
        [ IsHomalgRing, IsCapCategory ] );
#! @InsertChunk Endomorphisms

#! @Description
#!  Concstruct the embedding of a subrepresentation $S$ of <A>F</A>
#!  by a list <A>eta</A> of morphisms, where the image embeddings thereof are
#!  the components of the natural monomorphism from $S$ into <A>F</A>.
#! @Arguments eta, F
#! @Returns an morphism in a Hom-category
DeclareOperation( "EmbeddingOfSubRepresentation",
        [ IsList, IsCapCategoryObjectInHomCategory ] );

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
