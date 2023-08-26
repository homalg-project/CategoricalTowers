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
DeclareCategory( "IsPositivelyZGradedClosureCategory",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a positively Z-graded category.
#! @Arguments object
DeclareCategory( "IsCellInPositivelyZGradedClosureCategory",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a positively Z-graded category.
#! @Arguments object
DeclareCategory( "IsObjectInPositivelyZGradedClosureCategory",
        IsCellInPositivelyZGradedClosureCategory and
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a positively Z-graded category.
#! @Arguments morphism
DeclareCategory( "IsMorphismInPositivelyZGradedClosureCategory",
        IsCellInPositivelyZGradedClosureCategory and
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
#!  category <A>ZC</A><C> := PositivelyZGradedClosureCategory(</C> $C$ <C>)</C>).
#! @Arguments UC
DeclareAttribute( "UnderlyingCategory",
        IsPositivelyZGradedClosureCategory );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsPositivelyZGradedClosureCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

#! @Description
#!  The $\mathbb{Z}$-function underlying the cell (=object or morphism) <A>c</A>.
#! @Arguments c
#! @Returns a Z-function
DeclareAttribute( "UnderlyingZFunction",
        IsCellInPositivelyZGradedClosureCategory );

#! @Description
#!  The support of the object <A>c</A>.
#! @Arguments object
#! @Returns a list
DeclareAttribute( "NonZeroParts",
        IsObjectInPositivelyZGradedClosureCategory );

#! @Description
#!  The list of degrees of the support of the object <A>c</A>.
#! @Arguments object
#! @Returns a list
DeclareAttribute( "NonZeroDegrees",
        IsObjectInPositivelyZGradedClosureCategory );

#! @Description
#!  A list of integers containing the list of degrees of the support of the object <A>c</A>.
#! @Arguments object
#! @Returns a list
DeclareAttribute( "NonZeroDegreesHull",
        IsObjectInPositivelyZGradedClosureCategory, "mutable" );

#! @Arguments object
#! @Returns a list
DeclareAttribute( "NonZeroPartsWithDegrees",
        IsObjectInPositivelyZGradedClosureCategory );

#! @Arguments object
#! @Returns a list
DeclareAttribute( "SupportWithDegrees",
        IsObjectInPositivelyZGradedClosureCategory );

#! @Description
#!  Like SupportWithDegrees
#!  but only considers the degrees in the given list <A>L</A>.
#! @Arguments object, L
DeclareOperation( "SupportWithDegreesWithGivenDegrees",
        [ IsObjectInPositivelyZGradedClosureCategory, IsList ] );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct the positively $Z$-graded closure of the category <A>C</A>.
#! @Arguments C
#! @Returns a &CAP; category
DeclareAttribute( "PositivelyZGradedClosureCategory",
        IsCapCategory );

#! @Description
#!  Construct an object in the positively $\mathbb{Z}$-graded category <A>ZC</A> using the Z-function <A>L</A>.
#! @Arguments ZC, L
#! @Returns a &CAP; object
#! @Group ObjectInPositivelyZGradedClosureCategory
DeclareOperation( "ObjectInPositivelyZGradedClosureCategory",
        [ IsPositivelyZGradedClosureCategory, IsZFunction ] );

#! @Arguments f, lower_bound, upper_bound, C
#! @Group ObjectInPositivelyZGradedClosureCategory
DeclareOperation( "ObjectInPositivelyZGradedClosureCategory",
        [ IsPositivelyZGradedClosureCategory, IsFunction, IsInt, IsAdditiveElement ] );

#! @Arguments M, degree
#! @Group ObjectInPositivelyZGradedClosureCategory
DeclareOperation( "ObjectInPositivelyZGradedClosureCategory",
        [ IsCapCategoryObject, IsInt ] );

#! @Arguments M
#! @Group ObjectInPositivelyZGradedClosureCategory
DeclareAttribute( "ObjectInPositivelyZGradedClosureCategory",
        IsSemisimpleCategoryObject );

#! @Arguments L
#! @Group ObjectInPositivelyZGradedClosureCategory
DeclareAttribute( "ObjectInPositivelyZGradedClosureCategory",
        IsList );

#! @Description
#!  Construct a morphism in a positively $Z$-graded category.
#! @Arguments S, L, T
#! @Returns a &CAP; morphism
#! @Group MorphismInPositivelyZGradedClosureCategory
DeclareOperation( "MorphismInPositivelyZGradedClosureCategory",
        [ IsObjectInPositivelyZGradedClosureCategory, IsZFunction, IsObjectInPositivelyZGradedClosureCategory ] );

#! @Arguments S, f, T
#! @Group MorphismInPositivelyZGradedClosureCategory
DeclareOperation( "MorphismInPositivelyZGradedClosureCategory",
        [ IsObjectInPositivelyZGradedClosureCategory, IsFunction, IsObjectInPositivelyZGradedClosureCategory ] );

#! @Arguments S, phi, degree, T
#! @Group MorphismInPositivelyZGradedClosureCategory
DeclareOperation( "MorphismInPositivelyZGradedClosureCategory",
        [ IsObjectInPositivelyZGradedClosureCategory, IsCapCategoryMorphism, IsInt, IsObjectInPositivelyZGradedClosureCategory ] );

#! @Arguments M, chi, degree, i
#! @Returns a &CAP; morphism
#! @Group ComponentInclusionMorphism
DeclareOperation( "ComponentInclusionMorphism",
        [ IsObjectInPositivelyZGradedClosureCategory, IsObject, IsInt, IsInt ] );

#! @Arguments M, chi, i
#! @Group ComponentInclusionMorphism
DeclareOperation( "ComponentInclusionMorphism",
        [ IsObjectInPositivelyZGradedClosureCategory, IsObject, IsInt ] );

#! @Arguments M, degree
#! @Group ComponentInclusionMorphism
DeclareOperation( "ComponentInclusionMorphism",
        [ IsObjectInPositivelyZGradedClosureCategory, IsInt ] );

#! @Arguments M, degrees
DeclareOperation( "DiagonalEmbeddingWithGivenDegrees",
        [ IsObjectInPositivelyZGradedClosureCategory, IsList ] );

#! @Arguments M
#! @Group DiagonalEmbedding
DeclareOperation( "DiagonalEmbedding",
        [ IsObjectInPositivelyZGradedClosureCategory ] );

#! @Arguments S, M
#! @Group DiagonalEmbedding
DeclareOperation( "DiagonalEmbedding",
        [ IsObjectInPositivelyZGradedClosureCategory, IsObjectInPositivelyZGradedClosureCategory ] );

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
        [ IsCellInPositivelyZGradedClosureCategory ] );

#! @Description
#!  Set the active lower bound of the cell (=object or morphism) <A>c</A>
#!  to <A>lower_bound</A> if it is greater than the active lower bound,
#!  and return it.
#! @Arguments c, lower_bound
#! @Returns an integer or infinity
DeclareOperation( "SetActiveLowerBound",
        [ IsCellInPositivelyZGradedClosureCategory, IsAdditiveElement ] );

#! @Description
#!  The active upper bound of the cell (=object or morphism) <A>c</A>.
#! @Arguments c
#! @Returns an integer or infinity
DeclareOperation( "ActiveUpperBound",
        [ IsCellInPositivelyZGradedClosureCategory ] );

#! @Description
#!  Set the active upper bound of the cell (=object or morphism) <A>c</A>
#!  to <A>upper_bound</A> if it is less than the active upper bound,
#!  and return it.
#! @Arguments c, upper_bound
#! @Returns an integer or infinity
DeclareOperation( "SetActiveUpperBound",
        [ IsCellInPositivelyZGradedClosureCategory, IsAdditiveElement ] );

#! @Description
#!  Returns the function f: n |-> [ <C>ActiveLowerBound</C>( A ) .. n - <C>ActiveLowerBound</C>( B ) ]
#!  over which to run the tensor product summation  <A>A</A>[i] $\otimes$ <A>B</A>[n - i] ($i \in f(n)$)
#!  for (<A>A</A> $\otimes$ <A>B</A>)[n].
#! @Arguments A, B
#! @Returns a function
DeclareOperation( "TensorProductIndices",
        [ IsObjectInPositivelyZGradedClosureCategory, IsObjectInPositivelyZGradedClosureCategory ] );

#! @Description
#!  Returns two functions over which to run the tensor product summation
#!  for (<A>A</A> $\otimes$ (<A>B</A> $\otimes$ <A>C</A>))[n]
#!  resp. for ((<A>A</A> $\otimes$ <A>B</A>) $\otimes$ <A>C</A>)[n].
#! @Arguments A, B
#! @Returns a pair of functions
DeclareOperation( "TensorProductIndices",
        [ IsObjectInPositivelyZGradedClosureCategory, IsObjectInPositivelyZGradedClosureCategory, IsObjectInPositivelyZGradedClosureCategory ] );

#! @Description
#!  The <A>i</A>-th object of the infinite list underlying the cell (=object or morphism) <A>c</A>.
#! @Arguments c, n
#! @Returns a &CAP; category
DeclareOperation( "[]",
        [ IsCellInPositivelyZGradedClosureCategory, IsInt ] );

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
        [ IsCellInPositivelyZGradedClosureCategory, IsList ] );
