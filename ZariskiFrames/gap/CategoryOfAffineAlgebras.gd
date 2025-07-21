# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Declarations
#

#! @Chapter Category of affine algebras

####################################
##
#! @Section GAP Categories
##
####################################

## categories

#! @Description
#!  The &GAP; category of categories of finitely presented associative commutative unital algebras.
#! @Arguments category
DeclareCategory( "IsCategoryOfAffineAlgebras", IsCapCategory );

#! @Description
#!  The &GAP; category of finitely presented associative commutative unital algebras.
#! @Arguments object
DeclareCategory( "IsObjectInCategoryOfAffineAlgebras", IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms of finitely presented associative commutative unital algebras.
#! @Arguments morphism
DeclareCategory( "IsMorphismInCategoryOfAffineAlgebras", IsCapCategoryMorphism );

####################################
##
#! @Section Attributes
##
####################################

#! @Description
#!  The input is a category of finitely presented associative commutative unital $k$-algebras.
#!  The output is the underlying commutative ring $k$ of coefficients.
#! @Arguments AffAlg_k
DeclareAttribute( "CoefficientsRing", IsCategoryOfAffineAlgebras );

CapJitAddTypeSignature( "CoefficientsRing", [ IsCategoryOfAffineAlgebras ],
  function ( input_types )
    
    return CapJitDataTypeOfRing( CoefficientsRing( input_types[1].category ) );
    
end );

#! @Arguments affine_algebra
DeclareAttribute( "DefiningSextupleOfAffineAlgebra",
        IsObjectInCategoryOfAffineAlgebras );

#! @Arguments affine_algebra_morphism
DeclareAttribute( "MatrixOfImages",
        IsMorphismInCategoryOfAffineAlgebras );

#! @Description
#!  The input is a finitely presented associative commutative unital algebra.
#!  The output is the corresponding ambient (free) polynomial algebra.
#! @Arguments affine_algebra
DeclareAttribute( "Dimension",
        IsObjectInCategoryOfAffineAlgebras );

#! @Description
#!  The input is a finitely presented associative commutative unital algebra.
#!  The output is the corresponding ambient (free) polynomial algebra.
#! @Arguments affine_algebra
DeclareAttribute( "AmbientAlgebra",
        IsObjectInCategoryOfAffineAlgebras );

DeclareAttribute( "AssociatedAmbientHomalgRing",
        IsObjectInCategoryOfAffineAlgebras );

DeclareAttribute( "AssociatedHomalgRing",
        IsObjectInCategoryOfAffineAlgebras );

DeclareAttribute( "AssociatedHomalgRingMap",
        IsMorphismInCategoryOfAffineAlgebras );

DeclareOperation( "AssociatedHomalgRingOfCoproduct",
        [ IsObjectInCategoryOfAffineAlgebras, IsObjectInCategoryOfAffineAlgebras ] );

DeclareAttribute( "CoordinateAlgebraOfGraph",
        IsMorphismInCategoryOfAffineAlgebras );

DeclareAttribute( "DecompositionByDegree2Polynomials",
        IsObjectInCategoryOfAffineAlgebras );

DeclareAttribute( "NaturalTransformationFromIdenitityFunctorToSimplificationOfAffineAlgebrasByLinearEquations",
        IsCategoryOfAffineAlgebras );

####################################
##
# @Section Operations
##
####################################

DeclareOperation( "IsomorphismsToStandardizedAlgebra",
        [ IsCategoryOfAffineAlgebras, IsObjectInCategoryOfAffineAlgebras, IsInt ] );

DeclareOperation( "IsomorphismsToStandardizedAlgebraMorphism",
        [ IsCategoryOfAffineAlgebras, IsMorphismInCategoryOfAffineAlgebras ] );

DeclareOperation( "NaturalTransformationFromIdenitityFunctorToSimplificationOfAffineAlgebrasByLinearEquationsData",
        [ IsCategoryOfAffineAlgebras, IsObjectInCategoryOfAffineAlgebras ] );

####################################
##
#! @Section Constructors
##
####################################

#! @Description
#!  The input is a commutative ring <A>k</A>.
#!  The output is the category of finitely presented associative commutative unital algebras over $k$.
#! @Arguments k
DeclareAttribute( "CategoryOfAffineAlgebras", IsHomalgRing );
#! @InsertChunk CategoryOfAffineAlgebras

CapJitAddTypeSignature( "CategoryOfAffineAlgebras", [ IsHomalgRing ], function ( input_types )
    
    return CapJitDataTypeOfCategory( CategoryOfAffineAlgebras( input_types[1].category ) );
    
end );

####################################
##
## Tools
##
####################################

DeclareOperation( "CreateAmbientPolynomialAlgebraOfAffineAlgebra",
        [ IsHomalgRing, IsList ] );
