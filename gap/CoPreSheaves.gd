# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

#! @Chapter Category of copresheaves of a finitely presented (linear) category

####################################
#
#! @Section &GAP; Categories
#
####################################

#! @Description
#!  The &GAP; category of copresheaf categories.
#! @Arguments category
DeclareCategory( "IsCoPreSheafCategory",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a copresheaf category.
#! @Arguments cell
DeclareCategory( "IsCellInCoPreSheafCategory",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a copresheaf category.
#! @Arguments obj
DeclareCategory( "IsObjectInCoPreSheafCategory",
        IsCellInCoPreSheafCategory and
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a copresheaf category.
#! @Arguments mor
DeclareCategory( "IsMorphismInCoPreSheafCategory",
        IsCellInCoPreSheafCategory and
        IsCapCategoryMorphism );

####################################
#
#! @Section Attributes
#
####################################

##
DeclareAttribute( "DefiningPairOfUnderlyingQuiver",
        IsCoPreSheafCategory );

CapJitAddTypeSignature( "DefiningPairOfUnderlyingQuiver", [ IsCoPreSheafCategory ],
  function ( input_types )
    
    Assert( 0, IsCoPreSheafCategory( input_types[1].category ) );
    
    return rec( filter := IsNTuple,
                element_types :=
                [ rec( filter := IsInt ),
                  rec( filter := IsList,
                       element_type :=
                       rec( filter := IsNTuple,
                            element_types :=
                            [ rec( filter := IsInt ),
                              rec( filter := IsInt ) ] ) ) ] );
    
end );

#! @Description
#!  The source category of the copresheaf category <A>cat</A>.
#! @Arguments cat
#! @Returns a &CAP; category
DeclareAttribute( "Source",
        IsCoPreSheafCategory );

CapJitAddTypeSignature( "Source", [ IsCoPreSheafCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( Source( input_types[1].category ) );
    
end );

#! @Description
#!  The range category of the copresheaf category <A>cat</A>.
#! @Arguments cat
#! @Returns a &CAP; category
DeclareAttribute( "Range",
        IsCoPreSheafCategory );

CapJitAddTypeSignature( "Range", [ IsCoPreSheafCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( Range( input_types[1].category ) );
    
end );

#! @Description
#!  The source of the functor underlying functor object <A>F</A>.
#! @Arguments F
#! @Returns a &CAP; category
DeclareAttribute( "Source",
        IsObjectInCoPreSheafCategory );

CapJitAddTypeSignature( "Source", [ IsObjectInCoPreSheafCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( Source( input_types[1].category ) );
    
end );

#! @Description
#!  The target of the functor underlying the functor object <A>F</A>.
#! @Arguments F
#! @Returns a &CAP; category
DeclareAttribute( "Range",
        IsObjectInCoPreSheafCategory );

CapJitAddTypeSignature( "Range", [ IsObjectInCoPreSheafCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( Range( input_types[1].category ) );
    
end );

#! @Description
#!  The opposite of the source category of the copresheaf category <A>coPSh</A>.
#! @Arguments coPSh
#! @Returns a &CAP; category
DeclareAttribute( "OppositeOfSource",
        IsCoPreSheafCategory );

#! @Description
#!  The input is functor <A>F</A> in a copresheaf category <A>coPSh</A>.
#!  The output is pair of lists.
#!  The first is the list of values of the functor <A>F</A> on all objects of the source category of <A>coPSh</A>.
#!  The second is the list of values of the functor <A>F</A> on all *generating* morphisms of the source category of <A>coPSh</A>.
#! @Arguments F
#! @Returns a pair of lists
DeclareAttribute( "ValuesOfCoPreSheaf",
        IsObjectInCoPreSheafCategory );

CapJitAddTypeSignature( "ValuesOfCoPreSheaf", [ IsObjectInCoPreSheafCategory ],
  function ( input_types )
    
    Assert( 0, IsCoPreSheafCategory( input_types[1].category ) );
    
    return rec( filter := IsNTuple,
                element_types :=
                [ rec( filter := IsList, element_type := CapJitDataTypeOfObjectOfCategory( Range( input_types[1].category ) ) ),
                  rec( filter := IsList, element_type := CapJitDataTypeOfMorphismOfCategory( Range( input_types[1].category ) ) ) ] );
    
end );

#! @Description
#!  Returns the values of the natural transformation <A>eta</A> in a copresheaf category <A>coPSh</A>
#!  on all objects of the source category of <A>coPSh</A>.
#! @Arguments eta
#! @Returns a list
DeclareAttribute( "ValuesOnAllObjects",
        IsMorphismInCoPreSheafCategory );

CapJitAddTypeSignature( "ValuesOnAllObjects", [ IsMorphismInCoPreSheafCategory ],
  function ( input_types )
    
    Assert( 0, IsCoPreSheafCategory( input_types[1].category ) );
    
    return rec( filter := IsList,
                element_type := CapJitDataTypeOfMorphismOfCategory( Range( input_types[1].category ) ) );
    
end );

#!  The 2-cell underlying the functor object <A>F_or_eta</A>.
#! @Arguments F_or_eta
#! @Returns a &CAP; functor or natural transformation
DeclareAttribute( "UnderlyingCapTwoCategoryCell",
        IsCellInCoPreSheafCategory );

#! @Arguments B
#! @Returns a &CAP; functor
DeclareAttribute( "CoYonedaEmbedding",
        IsCapCategory );

#! @Arguments coPSh
#! @Returns a &CAP; functor
DeclareAttribute( "CoYonedaEmbeddingOfSourceCategory",
        IsCoPreSheafCategory );

####################################
#
#! @Section Operations
#
####################################

#! @Description
#!  Apply the functor <A>F</A> (as an object in the corresponding copresheaf category) to the cell <A>c</A>.
#!  The shorthand is <A>F</A>(<A>c</A>).
#! @Arguments F, c
#! @Returns a &CAP; cell
DeclareOperation( "ApplyObjectInCoPreSheafCategoryToObject",
        [ IsCoPreSheafCategory, IsObjectInCoPreSheafCategory, IsCapCategoryObject ] );

DeclareOperation( "ApplyObjectInCoPreSheafCategoryToMorphism",
        [ IsCoPreSheafCategory, IsObjectInCoPreSheafCategory, IsCapCategoryMorphism ] );

#! @Description
#!  Apply the natural transformation <A>eta</A> (as an object in the corresponding copresheaf category) to the object <A>o</A>.
#!  The shorthand is <A>eta</A>(<A>o</A>).
#! @Arguments eta, o
DeclareOperation( "ApplyMorphismInCoPreSheafCategoryToObject",
        [ IsCoPreSheafCategory, IsMorphismInCoPreSheafCategory, IsCapCategoryObject ] );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct the category <C>CoPreSheaves(</C> <A>B</A>, <A>C</A> <C>)</C>=
#!  <C>FunctorCategory(</C> <A>B</A>, <A>C</A> <C>)^op</C> of copresheaves
#!  from the small category <A>B</A> to the category <A>C</A> as objects
#!  and their natural transformations as morphisms.
#! @Returns a &CAP; category
#! @Arguments B, C
#! @Group CoPreSheaves
DeclareOperationWithCache( "CoPreSheaves",
        [ IsCapCategory, IsCapCategory ] );

CapJitAddTypeSignature( "CoPreSheaves", [ IsCapCategory, IsCapCategory ], IsCoPreSheafCategory );

#! @Arguments B, k
#! @Group CoPreSheaves
DeclareOperationWithCache( "CoPreSheaves",
        [ IsCapCategory, IsHomalgRing ] );

#! @Arguments B
#! @Group CoPreSheaves
DeclareOperationWithCache( "CoPreSheaves",
        [ IsCapCategory ] );

CapJitAddTypeSignature( "CoPreSheaves", [ IsCapCategory ], IsCoPreSheafCategory );

DeclareOperation( "CreateCoPreSheafByValues", [ IsCoPreSheafCategory, IsList, IsList ] );

DeclareOperation( "CreateCoPreSheafByFunctions", [ IsCoPreSheafCategory, IsFunction, IsFunction ] );

#! @Description
#!  Turn the functor <C><A>F</A>:<A>B</A></C> $\to$ <C>C</C> into an object in the category of functors <C><A>coPSh</A> := CoPreSheaves( <A>B</A>, C )</C>.
#! @Arguments coPSh, values_of_all_objects, values_of_all_generating_morphisms
#! @Returns an object in a &CAP; category
#! @Group CreateCoPreSheaf

#! @Arguments F
#! @Group CreateCoPreSheaf
DeclareAttribute( "CreateCoPreSheaf",
        IsCapFunctor );

#! @Description
#!  An alternative input is the source category <A>B</A> and two defining records <A>rec_images_of_objects</A> and <A>rec_images_of_morphisms</A> of <A>F</A>.
#! @Arguments B, rec_images_of_objects, rec_images_of_morphisms
#! @Group CreateCoPreSheaf
DeclareOperation( "CreateCoPreSheaf",
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
#!  in a matrix category or a category of rows over $k$, respectively.
#! @Arguments B, images_of_objects, images_of_morphisms
#! @Group CreateCoPreSheaf
DeclareOperation( "CreateCoPreSheaf",
        [ IsCapCategory, IsList, IsList ] );

DeclareOperation( "CreateCoPreSheaf",
        [ IsCapCategory, IsFunction, IsFunction ] );

#! @Description
#! @Returns a morphism in a &CAP; category
#! @Group CreateCoPreSheafMorphism
DeclareOperation( "CreateCoPreSheafMorphismByValues",
        [ IsCoPreSheafCategory, IsObjectInCoPreSheafCategory, IsList, IsObjectInCoPreSheafCategory ] );

#! @Description
#!  Turn the natrual transformation <A>eta</A>:$F \to G$ into a morphism
#!  <C><A>U</A> := CreateCoPreSheaf( F )</C> $\to$ <C><A>V</A> := CreateCoPreSheaf( G )</C>
#!  in the category of functors <C><A>coPSh</A> := CoPreSheaves( B, C )</C>, where
#!  <C>B := Source( F ) = Source( G )</C> and <C>C := Range( F ) = Range( G )</C>.
#! @Arguments eta
#! @Group CreateCoPreSheafMorphism
DeclareAttribute( "CreateCoPreSheafMorphism",
        IsCapNaturalTransformation );

#!  Another alternative input is the triple (<A>U</A>, <A>e</A>, <A>V</A>),
#!  where <A>e</A> is a defining list of <A>eta</A>.
#! @Arguments U, e, V
#! @Group CreateCoPreSheafMorphism
DeclareOperation( "CreateCoPreSheafMorphism",
        [ IsObjectInCoPreSheafCategory, IsList, IsObjectInCoPreSheafCategory ] );

#! @Arguments U, e, V
#!  An alternative input is the triple (<A>U</A>, <A>e</A>, <A>V</A>),
#!  where <A>e</A> is a defining record of <A>eta</A>.
#! @Group CreateCoPreSheafMorphism
DeclareOperation( "CreateCoPreSheafMorphism",
        [ IsObjectInCoPreSheafCategory, IsRecord, IsObjectInCoPreSheafCategory ] );

#! @Group CreateCoPreSheafMorphism
DeclareOperation( "CreateCoPreSheafMorphism",
        [ IsObjectInCoPreSheafCategory, IsFunction, IsObjectInCoPreSheafCategory ] );
