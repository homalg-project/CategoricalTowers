# SPDX-License-Identifier: GPL-2.0-or-later
# GradedCategories: Graded closures of categories
#
# Declarations
#

#! @Chapter The positively Z-graded closure of a category

####################################
#
#! @Section GAP Categories
#
####################################

#! @Description
#!  The &GAP; category of positively Z-graded categories.
#! @Arguments object
DeclareCategory( "IsPositivelyZGradedCategory",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a positively Z-graded category.
#! @Arguments object
DeclareCategory( "IsCellInPositivelyZGradedCategory",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a positively Z-graded category.
#! @Arguments object
DeclareCategory( "IsObjectInPositivelyZGradedCategory",
        IsCellInPositivelyZGradedCategory and
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a positively Z-graded category.
#! @Arguments morphism
DeclareCategory( "IsMorphismInPositivelyZGradedCategory",
        IsCellInPositivelyZGradedCategory and
        IsCapCategoryMorphism );

####################################
#
#! @Section Global variables
#
####################################

#!
DeclareGlobalVariable( "CAP_INTERNAL_METHOD_NAME_LIST_FOR_GRADED_CATEGORY" );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  Return the category $C$ underlying the positively Z-graded category
#!  category <A>ZC</A><C> := PositivelyZGradedCategory(</C> $C$ <C>)</C>).
#! @Arguments UC
DeclareAttribute( "UnderlyingCategory",
        IsPositivelyZGradedCategory );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsPositivelyZGradedCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

#! @Description
#!  The $\mathbb{Z}$-function underlying the cell (=object or morphism) <A>c</A>.
#! @Arguments c
#! @Returns a Z-function
DeclareAttribute( "UnderlyingZFunction",
        IsCellInPositivelyZGradedCategory );

#! @Description
#!  The support of the object <A>c</A>.
#! @Arguments object
#! @Returns a list
DeclareAttribute( "NonZeroParts",
        IsObjectInPositivelyZGradedCategory );

#! @Description
#!  The list of degrees of the support of the object <A>c</A>.
#! @Arguments object
#! @Returns a list
DeclareAttribute( "NonZeroDegrees",
        IsObjectInPositivelyZGradedCategory );

#! @Description
#!  A list of integers containing the list of degrees of the support of the object <A>c</A>.
#! @Arguments object
#! @Returns a list
DeclareAttribute( "NonZeroDegreesHull",
        IsObjectInPositivelyZGradedCategory, "mutable" );

#! @Arguments object
#! @Returns a list
DeclareAttribute( "NonZeroPartsWithDegrees",
        IsObjectInPositivelyZGradedCategory );

#! @Arguments object
#! @Returns a list
DeclareAttribute( "SupportWithDegrees",
        IsObjectInPositivelyZGradedCategory );

#! @Description
#!  Like SupportWithDegrees
#!  but only considers the degrees in the given list <A>L</A>.
#! @Arguments object, L
DeclareOperation( "SupportWithDegreesWithGivenDegrees",
        [ IsObjectInPositivelyZGradedCategory, IsList ] );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct the positively $Z$-graded closure of the category <A>C</A>.
#! @Arguments C
#! @Returns a &CAP; category
DeclareAttribute( "PositivelyZGradedCategory",
        IsCapCategory );

#! @Description
#!  Construct an object in the positively $\mathbb{Z}$-graded category <A>ZC</A> using the Z-function <A>L</A>.
#! @Arguments ZC, L
#! @Returns a &CAP; object
#! @Group ObjectInPositivelyZGradedCategory
DeclareOperation( "ObjectInPositivelyZGradedCategory",
        [ IsPositivelyZGradedCategory, IsZFunction ] );

#! @Arguments f, lower_bound, upper_bound, C
#! @Group ObjectInPositivelyZGradedCategory
DeclareOperation( "ObjectInPositivelyZGradedCategory",
        [ IsPositivelyZGradedCategory, IsFunction, IsInt, IsAdditiveElement ] );

#! @Arguments M, degree
#! @Group ObjectInPositivelyZGradedCategory
DeclareOperation( "ObjectInPositivelyZGradedCategory",
        [ IsCapCategoryObject, IsInt ] );

#! @Arguments M
#! @Group ObjectInPositivelyZGradedCategory
DeclareAttribute( "ObjectInPositivelyZGradedCategory",
        IsSemisimpleCategoryObject );

#! @Arguments L
#! @Group ObjectInPositivelyZGradedCategory
DeclareAttribute( "ObjectInPositivelyZGradedCategory",
        IsList );

#! @Description
#!  Construct a morphism in a positively $Z$-graded category.
#! @Arguments S, L, T
#! @Returns a &CAP; morphism
#! @Group MorphismInPositivelyZGradedCategory
DeclareOperation( "MorphismInPositivelyZGradedCategory",
        [ IsObjectInPositivelyZGradedCategory, IsZFunction, IsObjectInPositivelyZGradedCategory ] );

#! @Arguments S, f, T
#! @Group MorphismInPositivelyZGradedCategory
DeclareOperation( "MorphismInPositivelyZGradedCategory",
        [ IsObjectInPositivelyZGradedCategory, IsFunction, IsObjectInPositivelyZGradedCategory ] );

#! @Arguments S, phi, degree, T
#! @Group MorphismInPositivelyZGradedCategory
DeclareOperation( "MorphismInPositivelyZGradedCategory",
        [ IsObjectInPositivelyZGradedCategory, IsCapCategoryMorphism, IsInt, IsObjectInPositivelyZGradedCategory ] );

#! @Arguments M, chi, degree, i
#! @Returns a &CAP; morphism
#! @Group ComponentInclusionMorphism
DeclareOperation( "ComponentInclusionMorphism",
        [ IsObjectInPositivelyZGradedCategory, IsObject, IsInt, IsInt ] );

#! @Arguments M, chi, i
#! @Group ComponentInclusionMorphism
DeclareOperation( "ComponentInclusionMorphism",
        [ IsObjectInPositivelyZGradedCategory, IsObject, IsInt ] );

#! @Arguments M, degree
#! @Group ComponentInclusionMorphism
DeclareOperation( "ComponentInclusionMorphism",
        [ IsObjectInPositivelyZGradedCategory, IsInt ] );

#! @Arguments M, degrees
DeclareOperation( "DiagonalEmbeddingWithGivenDegrees",
        [ IsObjectInPositivelyZGradedCategory, IsList ] );

#! @Arguments M
#! @Group DiagonalEmbedding
DeclareOperation( "DiagonalEmbedding",
        [ IsObjectInPositivelyZGradedCategory ] );

#! @Arguments S, M
#! @Group DiagonalEmbedding
DeclareOperation( "DiagonalEmbedding",
        [ IsObjectInPositivelyZGradedCategory, IsObjectInPositivelyZGradedCategory ] );

####################################
#
#! @Section Operations
#
####################################

#! @Description
#!  The active lower bound of the cell (=object or morphism) <A>c</A>.
#! @Arguments c
#! @Returns an integer or infinity
DeclareOperation( "ActiveLowerBound",
        [ IsCellInPositivelyZGradedCategory ] );

#! @Description
#!  Set the active lower bound of the cell (=object or morphism) <A>c</A>
#!  to <A>lower_bound</A> if it is greater than the active lower bound,
#!  and return it.
#! @Arguments c, lower_bound
#! @Returns an integer or infinity
DeclareOperation( "SetActiveLowerBound",
        [ IsCellInPositivelyZGradedCategory, IsAdditiveElement ] );

#! @Description
#!  The active upper bound of the cell (=object or morphism) <A>c</A>.
#! @Arguments c
#! @Returns an integer or infinity
DeclareOperation( "ActiveUpperBound",
        [ IsCellInPositivelyZGradedCategory ] );

#! @Description
#!  Set the active upper bound of the cell (=object or morphism) <A>c</A>
#!  to <A>upper_bound</A> if it is less than the active upper bound,
#!  and return it.
#! @Arguments c, upper_bound
#! @Returns an integer or infinity
DeclareOperation( "SetActiveUpperBound",
        [ IsCellInPositivelyZGradedCategory, IsAdditiveElement ] );

#! @Description
#!  Returns the function f: n |-> [ <C>ActiveLowerBound</C>( A ) .. n - <C>ActiveLowerBound</C>( B ) ]
#!  over which to run the tensor product summation  <A>A</A>[i] $\otimes$ <A>B</A>[n - i] ($i \in f(n)$)
#!  for (<A>A</A> $\otimes$ <A>B</A>)[n].
#! @Arguments A, B
#! @Returns a function
DeclareOperation( "TensorProductIndices",
        [ IsObjectInPositivelyZGradedCategory, IsObjectInPositivelyZGradedCategory ] );

#! @Description
#!  Returns two functions over which to run the tensor product summation
#!  for (<A>A</A> $\otimes$ (<A>B</A> $\otimes$ <A>C</A>))[n]
#!  resp. for ((<A>A</A> $\otimes$ <A>B</A>) $\otimes$ <A>C</A>)[n].
#! @Arguments A, B
#! @Returns a pair of functions
DeclareOperation( "TensorProductIndices",
        [ IsObjectInPositivelyZGradedCategory, IsObjectInPositivelyZGradedCategory, IsObjectInPositivelyZGradedCategory ] );

#! @Description
#!  The <A>i</A>-th object of the infinite list underlying the cell (=object or morphism) <A>c</A>.
#! @Arguments c, n
#! @Returns a &CAP; category
DeclareOperation( "[]",
        [ IsCellInPositivelyZGradedCategory, IsInt ] );

#! @Description
#!  The <A>i</A>-th object of the infinite list(s) underlying the cell resp. list  <A>c</A>.
#! @Arguments c, n
#! @Returns a &CAP; category
DeclareOperation( "CertainDegreePart",
        [ IsObject, IsInt ] );

#! @Description
#!  The <A>L</A>-th sublist of the infinite list underlying the cell (=object or morphism) <A>c</A>.
#! @Arguments c, L
#! @Returns a &CAP; category
DeclareOperation( "Sublist",
        [ IsCellInPositivelyZGradedCategory, IsList ] );
