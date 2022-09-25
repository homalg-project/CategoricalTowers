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

#!
DeclareGlobalVariable( "CAP_INTERNAL_METHOD_NAME_LIST_FOR_MONOIDAL_FUNCTOR_CATEGORY" );

#!
DeclareGlobalVariable( "CAP_INTERNAL_METHOD_NAME_LIST_FOR_MONOIDAL_FUNCTOR_CATEGORY_WITH_DUALS" );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The source category of the functor category <A>cat</A>.
#! @Arguments cat
#! @Returns a &CAP; category
DeclareAttribute( "Source",
        IsFunctorCategory );

CapJitAddTypeSignature( "Source", [ IsFunctorCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( Source( input_types[1].category ) );
    
end );

#! @Description
#!  The source of the functor underlying functor object <A>F</A>.
#! @Arguments F
#! @Returns a &CAP; category
DeclareAttribute( "Source",
        IsObjectInFunctorCategory );

CapJitAddTypeSignature( "Source", [ IsObjectInFunctorCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( Source( input_types[1].category ) );
    
end );

#! @Description
#!  The range category of the functor category <A>cat</A>.
#! @Arguments cat
#! @Returns a &CAP; category
DeclareAttribute( "Range",
        IsFunctorCategory );

CapJitAddTypeSignature( "Range", [ IsFunctorCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( Range( input_types[1].category ) );
    
end );

#! @Description
#!  The target of the functor underlying the functor object <A>F</A>.
#! @Arguments F
#! @Returns a &CAP; category
DeclareAttribute( "Range",
        IsObjectInFunctorCategory );

CapJitAddTypeSignature( "Range", [ IsObjectInFunctorCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( Range( input_types[1].category ) );
    
end );

#! @Description
#!  The opposite of the source category of the functor category <A>Hom</A>.
#! @Arguments Hom
#! @Returns a &CAP; category
DeclareAttribute( "OppositeOfSource",
        IsFunctorCategory );

#!  The 2-cell underlying the functor object <A>F_or_eta</A>.
#! @Arguments F_or_eta
#! @Returns a &CAP; functor or natural transformation
DeclareAttribute( "UnderlyingCapTwoCategoryCell",
        IsCellInFunctorCategory );

CapJitAddTypeSignature( "UnderlyingCapTwoCategoryCell", [ IsCapCategory, IsObjectInFunctorCategory ],
  function ( input_types )
    
    return rec( filter := IsCapFunctor,
                source_category := Source( input_types[1].category ),
                range_category := Range( input_types[1].category ) );
    
end );

CapJitAddTypeSignature( "UnderlyingCapTwoCategoryCell", [ IsCapCategory, IsMorphismInFunctorCategory ],
  function ( input_types )
    
    return rec( filter := IsCapNaturalTransformation,
                source_category := Source( input_types[1].category ),
                range_category := Range( input_types[1].category ) );
    
end );

##
DeclareAttribute( "FunctorOnObjects",
        IsObjectInFunctorCategory );

CapJitAddTypeSignature( "FunctorOnObjects", [ IsObjectInFunctorCategory ],
  function ( input_types )
    
    Assert( 0, IsFunctorCategory( input_types[1].category ) );
    
    return rec( filter := IsFunction,
                signature :=
                [ [ CapJitDataTypeOfObjectOfCategory( Source( input_types[1].category ) ) ],
                  CapJitDataTypeOfObjectOfCategory( Range( input_types[1].category ) ) ] );
    
end );

##
DeclareAttribute( "FunctorOnMorphisms",
        IsObjectInFunctorCategory );

CapJitAddTypeSignature( "FunctorOnMorphisms", [ IsObjectInFunctorCategory ],
  function ( input_types )
    
    Assert( 0, IsFunctorCategory( input_types[1].category ) );
    
    return rec( filter := IsFunction,
                signature :=
                [ [ CapJitDataTypeOfObjectOfCategory( Range( input_types[1].category ) ),
                    CapJitDataTypeOfMorphismOfCategory( Source( input_types[1].category ) ),
                    CapJitDataTypeOfObjectOfCategory( Range( input_types[1].category ) ) ],
                  CapJitDataTypeOfMorphismOfCategory( Range( input_types[1].category ) ) ] );
    
end );

##
DeclareAttribute( "NaturalTransformationOnObjects",
        IsMorphismInFunctorCategory );

CapJitAddTypeSignature( "NaturalTransformationOnObjects", [ IsMorphismInFunctorCategory ],
  function ( input_types )
    
    Assert( 0, IsFunctorCategory( input_types[1].category ) );
    
    return rec( filter := IsFunction,
                signature :=
                [ [ CapJitDataTypeOfObjectOfCategory( Range( input_types[1].category ) ),
                    CapJitDataTypeOfObjectOfCategory( Source( input_types[1].category ) ),
                    CapJitDataTypeOfObjectOfCategory( Range( input_types[1].category ) ) ],
                  CapJitDataTypeOfMorphismOfCategory( Range( input_types[1].category ) ) ] );
    
end );

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
DeclareOperation( "ApplyObjectInFunctorCategoryToObject",
        [ IsFunctorCategory, IsObjectInFunctorCategory, IsCapCategoryObject ] );

DeclareOperation( "ApplyObjectInFunctorCategoryToMorphism",
        [ IsFunctorCategory, IsObjectInFunctorCategory, IsCapCategoryMorphism ] );

#! @Description
#!  Apply the natural transformation <A>eta</A> (as an object in the corresponding Hom-category) to the object <A>o</A>.
#!  The shorthand is <A>eta</A>(<A>o</A>).
#! @Arguments eta, o
DeclareOperation( "ApplyMorphismInFunctorCategoryToObject",
        [ IsFunctorCategory, IsMorphismInFunctorCategory, IsCapCategoryObject ] );

#! @Description
#!  The input is functor <A>F</A> in a functor category <A>Hom</A>.
#!  The output is pair of lists.
#!  The first is the list of values of the functor <A>F</A> on all objects of the source category of <A>Hom</A>.
#!  The second is the list of values of the functor <A>F</A> on all *generating* morphisms of the source category of <A>Hom</A>.
#! @Arguments F
#! @Returns a pair of lists
DeclareAttribute( "ValuesOfFunctor",
        IsObjectInFunctorCategory );

CapJitAddTypeSignature( "ValuesOfFunctor", [ IsObjectInFunctorCategory ],
  function ( input_types )
    
    Assert( 0, IsFunctorCategory( input_types[1].category ) );
    
    return rec( filter := IsNTuple,
                element_types :=
                [ rec( filter := IsList, element_type := CapJitDataTypeOfObjectOfCategory( Range( input_types[1].category ) ) ),
                  rec( filter := IsList, element_type := CapJitDataTypeOfMorphismOfCategory( Range( input_types[1].category ) ) ) ] );
    
end );

#! @Description
#!  Returns the values of the natural transformation <A>eta</A> in a functor category <A>Hom</A>
#!  on all objects of the source category of <A>Hom</A>.
#! @Arguments eta
#! @Returns a list
DeclareAttribute( "ValuesOnAllObjects",
        IsMorphismInFunctorCategory );

CapJitAddTypeSignature( "ValuesOnAllObjects", [ IsMorphismInFunctorCategory ],
  function ( input_types )
    
    Assert( 0, IsFunctorCategory( input_types[1].category ) );
    
    return rec( filter := IsList,
                element_type := CapJitDataTypeOfMorphismOfCategory( Range( input_types[1].category ) ) );
    
end );

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

CapJitAddTypeSignature( "PreSheaves", [ IsCapCategory ], IsFunctorCategory );

#! @Description
#!  Construct the category of categories internal to the monoidal or cartesian category <A>C</A>.
#!  The output the full subcategory of the subcategory of functors from the
#!  <C>SimplicialCategoryTruncatedInDegree</C>(2) into <A>C</A>
#!  for which each such functor is the nerve truncated in degree $2$ of a category internal to <A>C</A>.
#! @Arguments C
DeclareAttribute( "CategoryOfInternalCategories",
        IsCapCategory );

DeclareOperation( "AsObjectInFunctorCategoryByValues", [ IsFunctorCategory, IsList, IsList ] );

DeclareOperation( "AsObjectInFunctorCategoryByFunctions", [ IsFunctorCategory, IsFunction, IsFunction ] );

#! @Description
#!  Turn the functor <C><A>F</A>:<A>B</A></C> $\to$ <C>C</C> into an object in the category of functors <C><A>Hom</A> := Hom( <A>B</A>, C )</C>.
#! @Arguments Hom, values_of_all_objects, values_of_all_generating_morphisms
#! @Returns an object in a &CAP; category
#! @Group AsObjectInFunctorCategory

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

DeclareOperation( "AsObjectInFunctorCategory",
        [ IsCapCategory, IsFunction, IsFunction ] );

#! @Description
#! @Returns a morphism in a &CAP; category
#! @Group AsMorphismInFunctorCategory
DeclareOperation( "AsMorphismInFunctorCategoryByValues",
        [ IsFunctorCategory, IsObjectInFunctorCategory, IsList, IsObjectInFunctorCategory ] );

#! @Description
#!  Turn the natrual transformation <A>eta</A>:$F \to G$ into a morphism
#!  <C><A>U</A> := AsObjectInFunctorCategory( F )</C> $\to$ <C><A>V</A> := AsObjectInFunctorCategory( G )</C>
#!  in the category of functors <C><A>Hom</A> := Hom( B, C )</C>, where
#!  <C>B := Source( F ) = Source( G )</C> and <C>C := Range( F ) = Range( G )</C>.
#! @Arguments eta
#! @Group AsMorphismInFunctorCategory
DeclareAttribute( "AsMorphismInFunctorCategory",
        IsCapNaturalTransformation );

#!  Another alternative input is the triple (<A>U</A>, <A>e</A>, <A>V</A>),
#!  where <A>e</A> is a defining list of <A>eta</A>.
#! @Arguments U, e, V
#! @Group AsMorphismInFunctorCategory
DeclareOperation( "AsMorphismInFunctorCategory",
        [ IsObjectInFunctorCategory, IsList, IsObjectInFunctorCategory ] );

#! @Arguments U, e, V
#!  An alternative input is the triple (<A>U</A>, <A>e</A>, <A>V</A>),
#!  where <A>e</A> is a defining record of <A>eta</A>.
#! @Group AsMorphismInFunctorCategory
DeclareOperation( "AsMorphismInFunctorCategory",
        [ IsObjectInFunctorCategory, IsRecord, IsObjectInFunctorCategory ] );

#! @Group AsMorphismInFunctorCategory
DeclareOperation( "AsMorphismInFunctorCategory",
        [ IsObjectInFunctorCategory, IsFunction, IsObjectInFunctorCategory ] );
