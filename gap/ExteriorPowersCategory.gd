# SPDX-License-Identifier: GPL-2.0-or-later
# ExteriorPowersCategories: The graded category of exterior powers of objects of a given Ab-category
#
# Declarations
#

#! @Chapter The graded category of exterior powers of objects of a given Ab-category

####################################
#
#! @Section GAP Categories
#
####################################

#! @Description
#!  The &GAP; category of cells in an exterior powers category
#! @Arguments object
DeclareCategory( "IsExteriorPowersCategory",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in an exterior powers category
#! @Arguments object
DeclareCategory( "IsCellInExteriorPowersCategory",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in an exterior powers category
#! @Arguments object
DeclareCategory( "IsObjectInExteriorPowersCategory",
        IsCellInExteriorPowersCategory and
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in an exterior powers category
#! @Arguments morphism
DeclareCategory( "IsMorphismInExteriorPowersCategory",
        IsCellInExteriorPowersCategory and
        IsCapCategoryMorphism );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The CAP category object or listlist of CAP category morphisms
#!  underlying the cell (=object or morphism) <A>c</A>.
#! @Arguments c
#! @Returns a &CAP; category object or listlist
DeclareAttribute( "UnderlyingCell",
        IsCellInExteriorPowersCategory );

#! @Description
#!  The degree in which the underlying object of <A>M</A> is placed.
#! @Arguments M
#! @Returns an integer
DeclareAttribute( "DegreeOfObject",
        IsObjectInExteriorPowersCategory );

#! @Description
#!  The degree of the morphism <A>phi</A>.
#! @Arguments phi
#! @Returns a nonnegative integer
DeclareAttribute( "DegreeOfMorphism",
        IsMorphismInExteriorPowersCategory );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct the category of exterior powers of <A>l</A> copies of objects in the category <A>C</A>.
#! @Arguments l, C
#! @Returns a &CAP; category
DeclareOperation( "ExteriorPowersCategory",
        [ IsInt, IsCapCategory ] );

#! @Description
#!  Construct an object in an exterior powers category
#! @Arguments M, degree, EC
#! @Returns a &CAP; object
#! @Group ObjectInExteriorPowersCategory
DeclareOperation( "ObjectInExteriorPowersCategory",
        [ IsCapCategoryObject, IsInt, IsExteriorPowersCategory ] );


#! @Description
#!  Tensorize <A>cell</A> with the ring <A>R</A>.
#! @Arguments R, cell
#! @Returns a &CAP; cell
DeclareOperation( "*",
        [ IsHomalgRing, IsCellInExteriorPowersCategory ] );

#! @Description
#!  Construct a morphism in an exterior powers category
#! @Arguments S, L, T
#! @Returns a &CAP; morphism
#! @Group MorphismInExteriorPowersCategory
DeclareOperation( "MorphismInExteriorPowersCategory",
        [ IsObjectInExteriorPowersCategory, IsList, IsObjectInExteriorPowersCategory ] );

####################################
#
#! @Section Operations
#
####################################

##
DeclareOperation( "NumberOfDirectSummands",
        [ IsObjectInExteriorPowersCategory, IsObjectInExteriorPowersCategory ] );

##
DeclareOperation( "NumberOfDirectSummands",
        [ IsMorphismInExteriorPowersCategory ] );

##
DeclareOperation( "ByASmallerPresentation",
        [ IsCellInExteriorPowersCategory ] );

##
DeclareOperation( "RewriteMorphism",
        [ IsInt, IsMorphismInExteriorPowersCategory ] );
