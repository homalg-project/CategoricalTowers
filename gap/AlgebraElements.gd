############################################################################
##
##                                InternalModules package
##
##  Copyright 2019, Mohamed Barakat,   University of Siegen
##
#! @Chapter Internal algebra elements
##
#############################################################################

####################################
##
#! @Section GAP Categories
##
####################################

## categories

#!
DeclareCategory( "IsInternalAlgebra", IsCapCategory );

#!
DeclareCategory( "IsElementInInternalAlgebraOrModule",
        IsAttributeStoringRep and
        IsAdditivelyCommutativeElement and
        IsAdditiveElementWithZero and
        IsAdditiveElementWithInverse );

#!
DeclareCategory( "IsElementInInternalAlgebra", IsElementInInternalAlgebraOrModule and IsRingElement );

BindGlobal( "TheFamilyOfInternalAlgebraElements",
        NewFamily( "TheFamilyOfInternalAlgebraElements" ) );

BindGlobal( "TheTypeInternalAlgebraElement",
        NewType( TheFamilyOfInternalAlgebraElements,
                IsElementInInternalAlgebra ) );

####################################
##
#! @Section Constructors
##
####################################

#! @Arguments M, phi
#! @Returns a &CAP; morphism
#! @Group InternalElement
DeclareOperation( "InternalElement",
        [ IsMorphismInPositivelyZGradedCategory ] );

#! @Arguments SV, chi, degree, i
#! @Group InternalElement
DeclareOperation( "InternalElement",
        [ IsInternalAlgebra and IsObjectInPositivelyZGradedCategory, IsObject, IsInt, IsInt ] );

#! @Arguments SV, chi, i
#! @Group InternalElement
DeclareOperation( "InternalElement",
        [ IsInternalAlgebra and IsObjectInPositivelyZGradedCategory, IsObject, IsInt ] );

####################################
##
#! @Section Attributes
##
####################################

#! @Arguments p
#! @Returns a CAP; category morphism in the filter <C>IsMorphismInPositivelyZGradedCategory</C>
DeclareAttribute( "UnderlyingEmbedding", IsElementInInternalAlgebraOrModule );

#! @Arguments e
#! @Returns a list
DeclareAttribute( "SupportDegrees",
        IsElementInInternalAlgebraOrModule );

#! @Arguments e
#! @Returns a list
DeclareAttribute( "SupportHullDegrees",
        IsElementInInternalAlgebraOrModule, "mutable" );

#! @Arguments e
#! @Returns a list
DeclareAttribute( "Support",
        IsElementInInternalAlgebraOrModule );

#! @Arguments e
#! @Returns a list
DeclareAttribute( "SupportWithDegrees",
        IsElementInInternalAlgebraOrModule );

#! @Arguments e
#! @Returns a list
DeclareAttribute( "DecomposedSupportWithDegrees",
        IsElementInInternalAlgebraOrModule );

if false then
#! @Arguments e
#! @Returns an element of an internal algebra or module
DeclareAttribute( "AdditiveInverse",
        IsElementInInternalAlgebraOrModule );
fi;

#! @Arguments e
#! @Returns a &CAP; morphism
DeclareAttribute( "UniversalMorphismFromFreeModule",
        IsElementInInternalAlgebraOrModule );

####################################
##
#! @Section Operations
##
####################################

#! @Arguments e1, e2
#! @Returns a morphism in a positively Z-graded category
DeclareOperation( "InternalPreAddition",
        [ IsElementInInternalAlgebraOrModule, IsElementInInternalAlgebraOrModule ] );

if false then
#! @Arguments e1, e2
#! @Returns an element of an internal algebra or module
DeclareOperation( "+",
        [ IsElementInInternalAlgebraOrModule, IsElementInInternalAlgebraOrModule ] );
fi;

#! @Arguments e1, e2
#! @Returns an element of an internal algebra or module
DeclareOperation( "-",
        [ IsElementInInternalAlgebraOrModule, IsElementInInternalAlgebraOrModule ] );

#! @Arguments a, m
#! @Returns a morphism in a positively Z-graded category
DeclareOperation( "InternalPreMultiplication",
        [ IsRingElement, IsElementInInternalAlgebraOrModule ] );

#! @Arguments a, m
#! @Returns a ring element and an element of an internal algebra or module
DeclareOperation( "*",
        [ IsRingElement, IsElementInInternalAlgebraOrModule ] );

#! @Arguments a, b
#! @Returns an element of an internal algebra
DeclareOperation( "BraidedMultiplication",
        [ IsElementInInternalAlgebra, IsElementInInternalAlgebra ] );

#! @Arguments e
#! @Returns an element of an internal algebra or module
DeclareOperation( "[]",
        [ IsElementInInternalAlgebraOrModule, IsInt ] );
