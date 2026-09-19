# SPDX-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Declarations
#

#! @Chapter Internal monoids

####################################
##
#! @Section GAP Categories
##
####################################

## categories

#! @Arguments MonB
DeclareCategory( "IsCategoryOfInternalMonoids", IsCapCategory );

#! @Arguments monoid
DeclareCategory( "IsObjectInCategoryOfInternalMonoids", IsCapCategoryObject );

#! @Arguments monoid_morphism
DeclareCategory( "IsMorphismInCategoryOfInternalMonoids", IsCapCategoryMorphism );

####################################
##
#! @Section Properties
##
####################################

#! @Arguments monoid
DeclareProperty( "IsCommutative", IsObjectInCategoryOfInternalMonoids );

####################################
##
#! @Section Attributes
##
####################################

#! @Arguments MonB
DeclareAttribute( "UnderlyingCategory", IsCategoryOfInternalMonoids );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsCategoryOfInternalMonoids ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

#! @Arguments MonB
DeclareAttribute( "AssociatedCategoryOfComonoids", IsCategoryOfInternalMonoids );

CapJitAddTypeSignature( "AssociatedCategoryOfComonoids", [ IsCategoryOfInternalMonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalMonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfObjectOfCategory( AssociatedCategoryOfComonoids( input_types[1].category ) );
    
end );

#! @Arguments monoid
DeclareAttribute( "DefiningTripleOfInternalMonoid",
        IsObjectInCategoryOfInternalMonoids );

CapJitAddTypeSignature( "DefiningTripleOfInternalMonoid", [ IsObjectInCategoryOfInternalMonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalMonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfNTupleOf( 3,
                   CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) ),
                   CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ),
                   CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ) );
    
end );

#! @Arguments monoid
DeclareAttribute( "UnderlyingAlgebra", IsObjectInCategoryOfInternalMonoids );

#! @Arguments monoid_morphism
DeclareAttribute( "UnderlyingMorphism",
        IsMorphismInCategoryOfInternalMonoids );

CapJitAddTypeSignature( "UnderlyingMorphism", [ IsMorphismInCategoryOfInternalMonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalMonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

#! @Arguments monoid
DeclareAttribute( "UnderlyingObject", IsObjectInCategoryOfInternalMonoids );

CapJitAddTypeSignature( "UnderlyingObject", [ IsObjectInCategoryOfInternalMonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalMonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

####################################
##
#! @Section Operations
##
####################################

#! @Arguments B, object, unit, mult
DeclareOperation( "LeftUnitLawOfMonoid",
        [ IsMonoidalCategory, IsCapCategoryObject, IsCapCategoryMorphism, IsCapCategoryMorphism ] );

CapJitAddTypeSignature( "LeftUnitLawOfMonoid", [ IsCapCategory, IsCapCategoryObject, IsCapCategoryMorphism, IsCapCategoryMorphism ],
  function ( input_types )
    local cat;
    
    cat := input_types[1].category;
    
    Assert( 0, IsMonoidalCategory( cat ) );
    Assert( 0, IsIdenticalObj( input_types[2].category, cat ) );
    Assert( 0, IsIdenticalObj( input_types[3].category, cat ) );
    Assert( 0, IsIdenticalObj( input_types[4].category, cat ) );
    
    return rec( filter := IsBool );
    
end );

#! @Arguments B, object, unit, mult
DeclareOperation( "RightUnitLawOfMonoid",
        [ IsMonoidalCategory, IsCapCategoryObject, IsCapCategoryMorphism, IsCapCategoryMorphism ] );

CapJitAddTypeSignature( "RightUnitLawOfMonoid", [ IsCapCategory, IsCapCategoryObject, IsCapCategoryMorphism, IsCapCategoryMorphism ],
  function ( input_types )
    local cat;
    
    cat := input_types[1].category;
    
    Assert( 0, IsMonoidalCategory( cat ) );
    Assert( 0, IsIdenticalObj( input_types[2].category, cat ) );
    Assert( 0, IsIdenticalObj( input_types[3].category, cat ) );
    Assert( 0, IsIdenticalObj( input_types[4].category, cat ) );
    
    return rec( filter := IsBool );
    
end );

#! @Arguments B, object, mult
DeclareOperation( "AssociativitiyLawOfMonoid",
        [ IsMonoidalCategory, IsCapCategoryObject, IsCapCategoryMorphism ] );

CapJitAddTypeSignature( "AssociativitiyLawOfMonoid", [ IsCapCategory, IsCapCategoryObject, IsCapCategoryMorphism ],
  function ( input_types )
    local cat;
    
    cat := input_types[1].category;
    
    Assert( 0, IsMonoidalCategory( cat ) );
    Assert( 0, IsIdenticalObj( input_types[2].category, cat ) );
    Assert( 0, IsIdenticalObj( input_types[3].category, cat ) );
    
    return rec( filter := IsBool );
    
end );

#! @Arguments B, unit_of_source, unit_of_target, morphism
DeclareOperation( "UnitLawOfMonoidMorphism",
        [ IsMonoidalCategory, IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ] );

CapJitAddTypeSignature( "UnitLawOfMonoidMorphism", [ IsCapCategory, IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ],
  function ( input_types )
    local cat;
    
    cat := input_types[1].category;
    
    Assert( 0, IsMonoidalCategory( cat ) );
    Assert( 0, IsIdenticalObj( input_types[2].category, cat ) );
    Assert( 0, IsIdenticalObj( input_types[3].category, cat ) );
    Assert( 0, IsIdenticalObj( input_types[4].category, cat ) );
    
    return rec( filter := IsBool );
    
end );

#! @Arguments B, mult_of_source, mult_of_target, morphism
DeclareOperation( "MultiplicativelyLawOfMonoidMorphism",
        [ IsMonoidalCategory, IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ] );

CapJitAddTypeSignature( "MultiplicativelyLawOfMonoidMorphism", [ IsCapCategory, IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ],
  function ( input_types )
    local cat;
    
    cat := input_types[1].category;
    
    Assert( 0, IsMonoidalCategory( cat ) );
    Assert( 0, IsIdenticalObj( input_types[2].category, cat ) );
    Assert( 0, IsIdenticalObj( input_types[3].category, cat ) );
    Assert( 0, IsIdenticalObj( input_types[4].category, cat ) );
    
    return rec( filter := IsBool );
    
end );

#! @Arguments monoid, counit_on_generators
DeclareOperation( "Counit",
        [ IsObjectInCategoryOfInternalMonoids, IsList ] );

#! @Arguments monoid, comult_on_generators
DeclareOperation( "Comultiplication",
        [ IsObjectInCategoryOfInternalMonoids, IsList ] );

#! @Arguments monoid, antipode_on_generators
DeclareOperation( "Antipode",
        [ IsObjectInCategoryOfInternalMonoids, IsList ] );

DeclareOperation( "Counit",
        [ IsCapCategory, IsRecord ] );

DeclareOperation( "Comultiplication",
        [ IsCapCategory, IsRecord ] );

DeclareOperation( "Antipode",
        [ IsCapCategory, IsRecord ] );

####################################
##
#! @Section Constructors
##
####################################

DeclareOperation( "CATEGORY_OF_MONOIDS", [ IsCapCategory and IsMonoidalCategory ] );

#! @Arguments mon_cat
DeclareAttribute( "CategoryOfMonoids", IsCapCategory and IsMonoidalCategory );

#! @Arguments n, MonB
DeclareOperation( "FullMatrixAlgebraAsInternalMonoid",
        [ IsInt, IsCategoryOfInternalMonoids ] );

#! @Arguments n, B
DeclareOperation( "FullMatrixAlgebraAsInternalMonoid",
        [ IsInt, IsCapCategory and IsLinearCategoryOverCommutativeRing ] );

#! @Arguments n, R
DeclareOperation( "FullMatrixAlgebraAsInternalMonoid",
        [ IsInt, IsHomalgRing ] );

#! @Arguments lin_cat
DeclareAttribute( "LinearCategoryOnOneObjectAsInternalMonoid",
        IsCapCategory and IsObjectFiniteCategory and IsLinearCategoryOverCommutativeRingWithFinitelyGeneratedFreeExternalHoms );

#! @Arguments monoid
DeclareAttribute( "OppositeMonoid", IsObjectInCategoryOfInternalMonoids );

#! @Arguments monoid
DeclareAttribute( "DualComonoid", IsObjectInCategoryOfInternalMonoids );

#! @Arguments monoid_morphism
DeclareAttribute( "DualComonoid", IsMorphismInCategoryOfInternalMonoids );

#! @Arguments iso, monoid
DeclareOperation( "TransformedMonoid",
        [ IsCapCategoryMorphism, IsObjectInCategoryOfInternalMonoids ] );
