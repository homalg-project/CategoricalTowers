# SPDX-License-Identifier: GPL-2.0-or-later
# CategoriesWithAmbientObjects: Categories with objects having ambient objects
#
# Declarations
#

#! @Chapter Categories with ambient objects

# our info class:
DeclareInfoClass( "InfoCategoriesWithAmbientObjects" );
SetInfoLevel( InfoCategoriesWithAmbientObjects, 1 );

####################################
#
#! @Section Categories
#
####################################

#! @Description
#!  The &GAP; category of lazy evaluated generalized embeddings in ambient objects.
DeclareCategory( "IsLazyGeneralizedEmbeddingInAmbientObject",
        IsAttributeStoringRep );

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
#!  The evaluation of the lazy generalized embedding <A>gen</A>.
#! @Arguments gen
DeclareAttribute( "EvaluatedGeneralizedEmbeddingInAmbientObject",
        IsLazyGeneralizedEmbeddingInAmbientObject );

#! @Description
#!  The generalized embedding of the object <A>M</A> into its ambient object.
#! @Arguments M
#! @Returns a &CAP; generalized monomorphism
DeclareAttribute( "GeneralizedEmbeddingInAmbientObject",
        IsCapCategoryObjectWithAmbientObject );

#! @Description
#!  The embedding of the object <A>M</A> into its ambient object modulo the aid, i.e.,
#!  the output is the associated monomorphism of the lazy generalized monomorphism <A>gen</A>
#!  with domain = identity.
#! @Arguments gen
#! @Returns a &CAP; monomorphism
DeclareAttribute( "EmbeddingInAmbientObject",
        IsLazyGeneralizedEmbeddingInAmbientObject );

#! @Arguments M
#! @Group EmbeddingInAmbientObject
DeclareAttribute( "EmbeddingInAmbientObject",
        IsCapCategoryObjectWithAmbientObject );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct a lazy evaluated generalized embedding with source <A>M</A>
#!  using the procedure <A>f</A> and the list of <Q>pre-arguments</Q> <A>L</A>,
#!  which itself consists of pairs with first entry being a procedure
#!  and second its single argument. Use:
#!  <C>CallFuncList</C>( <A>f</A>, <C>List</C>( <A>L</A>, <C>a -> a[1]( a[2] )</C> ) ).
#!  The input <A>M</A> is recovered by applying <C>UnderlyingCell</C> to the output.
#!  The list <A>L</A> should not include procedures which depend on their code-context,
#!  since otherwise &GAP; is forced to attach the code-context to the output.
#! @Arguments M, f, L
DeclareOperation( "CreateLazyGeneralizedEmbeddingInAmbientObject",
        [ IsCapCategoryObject, IsFunction, IsList ] );

#! @Description
#!  The generalized embedding of the object <A>M</A> into its ambient object.
#! @Arguments M
DeclareOperation( "LazyGeneralizedEmbeddingInAmbientObject",
        [ IsCapCategoryObjectWithAmbientObject ] );

#! @Description
#!  Construct an object in the category <A>A</A> with ambient objects
#!  out of the generalized embedding <A>iota</A>.
#! @Arguments iota, A
#! @Returns an object in the category <A>A</A> with ambient objects
DeclareOperation( "ObjectWithAmbientObject",
        [ IsGeneralizedMorphismByCospan, IsCapCategory ] );

#! @Description
#!  Construct an object in the category <A>A</A> with ambient objects
#!  out of the identity morphism of <A>o</A>, view as a generalized embedding
#!  of <A>o</A> in itself.
#! @Arguments o, A
#! @Returns an object in the category <A>A</A> with ambient objects
DeclareOperation( "ObjectWithAmbientObject",
        [ IsCapCategoryObject, IsCapCategory ] );

#! @Description
#!  Construct an object in the category <A>A</A> with ambient objects
#!  out of the lazy generalized embedding <A>iota</A>.
#! @Arguments iota, A
#! @Returns an object in the category <A>A</A> with ambient objects
DeclareOperation( "ObjectWithAmbientObjectFromLazyGeneralizedEmbedding",
        [ IsLazyGeneralizedEmbeddingInAmbientObject, IsCapCategory ] );

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
