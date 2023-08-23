# SPDX-License-Identifier: GPL-2.0-or-later
# GradedCategories: Graded closures of categories
#
# Declarations
#

#! @Chapter The bounded Z-graded closure of a category

####################################
#
#! @Section GAP Categories
#
####################################

#! @Description
#!  The &GAP; category of Z-graded categories with bounds.
#! @Arguments object
DeclareCategory( "IsZGradedClosureCategoryWithBounds",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a Z-graded category with bounds.
#! @Arguments object
DeclareCategory( "IsCellInZGradedClosureCategoryWithBounds",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a Z-graded category with bounds.
#! @Arguments object
DeclareCategory( "IsObjectInZGradedClosureCategoryWithBounds",
        IsCellInZGradedClosureCategoryWithBounds and
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a Z-graded category with bounds.
#! @Arguments morphism
DeclareCategory( "IsMorphismInZGradedClosureCategoryWithBounds",
        IsCellInZGradedClosureCategoryWithBounds and
        IsCapCategoryMorphism );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  Return the category $C$ underlying the Z-graded category with bounds
#!  category <A>ZC</A><C> := BoundedZGradedCategory(</C> $C$ <C>)</C>).
#! @Arguments UC
DeclareAttribute( "UnderlyingCategory",
        IsZGradedClosureCategoryWithBounds );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsZGradedClosureCategoryWithBounds ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

#! @Description
#!  The $\mathbb{Z}$-function underlying the object <A>obj</A>.
#! @Arguments obj
#! @Returns a pair including a Z-function and a pair of integers
DeclareAttribute( "UnderlyingZFunctionAndBounds",
        IsObjectInZGradedClosureCategoryWithBounds );

#! @Description
#!  The $\mathbb{Z}$-function underlying the morphism <A>mor</A>.
#! @Arguments mor
#! @Returns a Z-function
DeclareAttribute( "UnderlyingZFunction",
        IsMorphismInZGradedClosureCategoryWithBounds );

#! @Description
#!  The support of the object <A>c</A>.
#! @Arguments object
#! @Returns a list
DeclareAttribute( "NonZeroParts",
        IsObjectInZGradedClosureCategoryWithBounds );

#! @Description
#!  The list of degrees of the support of the object <A>c</A>.
#! @Arguments object
#! @Returns a list
DeclareAttribute( "NonZeroDegrees",
        IsObjectInZGradedClosureCategoryWithBounds );

#! @Description
#!  A list of integers containing the list of degrees of the support of the object <A>c</A>.
#! @Arguments object
#! @Returns a list
DeclareAttribute( "NonZeroDegreesHull",
        IsObjectInZGradedClosureCategoryWithBounds, "mutable" );

#! @Arguments object
#! @Returns a list
DeclareAttribute( "NonZeroPartsWithDegrees",
        IsObjectInZGradedClosureCategoryWithBounds );

#! @Arguments object
#! @Returns a list
DeclareAttribute( "SupportWithDegrees",
        IsObjectInZGradedClosureCategoryWithBounds );

#! @Description
#!  Like SupportWithDegrees
#!  but only considers the degrees in the given list <A>L</A>.
#! @Arguments object, L
DeclareOperation( "SupportWithDegreesWithGivenDegrees",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsList ] );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct the $\mathbb{Z}$-graded closure of the category <A>C</A> with bounds.
#!  The string <A>str</A> can be either "lower", "upper", or "both", implementing
#!  the three constructors:
#!  * <C>PositivelyZGradedClosureCategory</C>,
#!  * <C>NegativelyZGradedClosureCategory</C>,
#!  * <C>FinitelyZGradedClosureCategory</C>,
#!
#!  respectively.
#! @Arguments C, str
#! @Returns a &CAP; category
DeclareOperation( "ZGradedClosureCategoryWithBounds",
        [ IsCapCategory, IsStringRep ] );

#! @Description
#!  Construct an object in the bounded $\mathbb{Z}$-graded category <A>ZC</A> using the Z-function <A>L</A>.
#! @Arguments ZC, L
#! @Returns a &CAP; object
#! @Group ObjectInZGradedClosureCategoryWithBounds
DeclareOperation( "ObjectInZGradedClosureCategoryWithBounds",
        [ IsZGradedClosureCategoryWithBounds, IsZFunction, IsAdditiveElement, IsAdditiveElement ] );

#! @Arguments ZC, f, lower_bound, upper_bound
#! @Group ObjectInZGradedClosureCategoryWithBounds
DeclareOperation( "ObjectInZGradedClosureCategoryWithBounds",
        [ IsZGradedClosureCategoryWithBounds, IsFunction, IsAdditiveElement, IsAdditiveElement ] );

#! @Arguments ZC, M, degree
#! @Group ObjectInZGradedClosureCategoryWithBounds
DeclareOperation( "ObjectInZGradedClosureCategoryWithBounds",
        [ IsZGradedClosureCategoryWithBounds, IsCapCategoryObject, IsInt ] );

#! @Arguments ZC, M
#! @Group ObjectInZGradedClosureCategoryWithBounds
DeclareOperation( "ObjectInZGradedClosureCategoryWithBounds",
        [ IsZGradedClosureCategoryWithBounds, IsSemisimpleCategoryObject ] );

#! @Arguments L
#! @Group ObjectInZGradedClosureCategoryWithBounds
DeclareOperation( "ObjectInZGradedClosureCategoryWithBounds",
        [ IsZGradedClosureCategoryWithBounds, IsList ] );

#! @Description
#!  Construct a morphism in a bounded $\mathbb{Z}$-graded category.
#! @Arguments S, L, T
#! @Returns a &CAP; morphism
#! @Group MorphismInZGradedClosureCategoryWithBounds
DeclareOperation( "MorphismInZGradedClosureCategoryWithBounds",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsZFunction, IsObjectInZGradedClosureCategoryWithBounds ] );

#! @Arguments S, f, T
#! @Group MorphismInZGradedClosureCategoryWithBounds
DeclareOperation( "MorphismInZGradedClosureCategoryWithBounds",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsFunction, IsObjectInZGradedClosureCategoryWithBounds ] );

#! @Arguments S, phi, degree, T
#! @Group MorphismInZGradedClosureCategoryWithBounds
DeclareOperation( "MorphismInZGradedClosureCategoryWithBounds",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsCapCategoryMorphism, IsInt, IsObjectInZGradedClosureCategoryWithBounds ] );

#! @Arguments M, chi, degree, i
#! @Returns a &CAP; morphism
#! @Group ComponentInclusionMorphism
DeclareOperation( "ComponentInclusionMorphism",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsObject, IsInt, IsInt ] );

#! @Arguments M, chi, i
#! @Group ComponentInclusionMorphism
DeclareOperation( "ComponentInclusionMorphism",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsObject, IsInt ] );

#! @Arguments M, degree
#! @Group ComponentInclusionMorphism
DeclareOperation( "ComponentInclusionMorphism",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsInt ] );

#! @Arguments M, degrees
DeclareOperation( "DiagonalEmbeddingWithGivenDegrees",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsList ] );

#! @Arguments M
#! @Group DiagonalEmbedding
DeclareOperation( "DiagonalEmbedding",
        [ IsObjectInZGradedClosureCategoryWithBounds ] );

#! @Arguments S, M
#! @Group DiagonalEmbedding
DeclareOperation( "DiagonalEmbedding",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsObjectInZGradedClosureCategoryWithBounds ] );

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
        [ IsCellInZGradedClosureCategoryWithBounds ] );

#! @Description
#!  Set the active lower bound of the cell (=object or morphism) <A>c</A>
#!  to <A>lower_bound</A> if it is greater than the active lower bound,
#!  and return it.
#! @Arguments c, lower_bound
#! @Returns an integer or infinity
DeclareOperation( "SetActiveLowerBound",
        [ IsCellInZGradedClosureCategoryWithBounds, IsAdditiveElement ] );

#! @Description
#!  The active upper bound of the cell (=object or morphism) <A>c</A>.
#! @Arguments c
#! @Returns an integer or infinity
DeclareOperation( "ActiveUpperBound",
        [ IsCellInZGradedClosureCategoryWithBounds ] );

#! @Description
#!  Set the active upper bound of the cell (=object or morphism) <A>c</A>
#!  to <A>upper_bound</A> if it is less than the active upper bound,
#!  and return it.
#! @Arguments c, upper_bound
#! @Returns an integer or infinity
DeclareOperation( "SetActiveUpperBound",
        [ IsCellInZGradedClosureCategoryWithBounds, IsAdditiveElement ] );

#! @Description
#!  Returns the function f: n |-> [ <C>ActiveLowerBound</C>( A ) .. n - <C>ActiveLowerBound</C>( B ) ]
#!  over which to run the tensor product summation  <A>A</A>[i] $\otimes$ <A>B</A>[n - i] ($i \in f(n)$)
#!  for (<A>A</A> $\otimes$ <A>B</A>)[n].
#! @Arguments A, B
#! @Returns a function
DeclareOperation( "TensorProductIndices",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsObjectInZGradedClosureCategoryWithBounds ] );

#! @Description
#!  Returns two functions over which to run the tensor product summation
#!  for (<A>A</A> $\otimes$ (<A>B</A> $\otimes$ <A>C</A>))[n]
#!  resp. for ((<A>A</A> $\otimes$ <A>B</A>) $\otimes$ <A>C</A>)[n].
#! @Arguments A, B
#! @Returns a pair of functions
DeclareOperation( "TensorProductIndices",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsObjectInZGradedClosureCategoryWithBounds, IsObjectInZGradedClosureCategoryWithBounds ] );

#! @Description
#!  The <A>i</A>-th object of the infinite list underlying the cell (=object or morphism) <A>c</A>.
#! @Arguments c, n
#! @Returns a &CAP; category
DeclareOperation( "[]",
        [ IsCellInZGradedClosureCategoryWithBounds, IsInt ] );

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
        [ IsCellInZGradedClosureCategoryWithBounds, IsList ] );
