# SPDX-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Declarations
#

#! @Chapter Internal bimonoids

####################################
##
#! @Section GAP Categories
##
####################################

## categories

#! @Arguments BimonB
DeclareCategory( "IsCategoryOfBimonoids", IsCapCategory and IsMonoidalCategory );

#! @Arguments BimonB
DeclareCategory( "IsCategoryOfInternalBimonoids", IsCapCategory );

#! @Arguments bimonoid
DeclareCategory( "IsObjectInCategoryOfInternalBimonoids", IsCapCategoryObject );

#! @Arguments bimonoid_morphism
DeclareCategory( "IsMorphismInCategoryOfInternalBimonoids", IsCapCategoryMorphism );

####################################
##
#! @Section Properties
##
####################################

#! @Arguments bimonoid
DeclareProperty( "IsCommutative", IsObjectInCategoryOfInternalBimonoids );

#! @Arguments bimonoid
DeclareProperty( "IsCocommutative", IsObjectInCategoryOfInternalBimonoids );

####################################
##
#! @Section Attributes
##
####################################

#! @Arguments BimonB
DeclareAttribute( "UnderlyingCategory", IsCategoryOfInternalBimonoids );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsCategoryOfInternalBimonoids ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

#! @Arguments BimonB
DeclareAttribute( "AssociatedCategoryOfMonoids", IsCategoryOfInternalBimonoids );

CapJitAddTypeSignature( "AssociatedCategoryOfMonoids", [ IsCategoryOfInternalBimonoids ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( AssociatedCategoryOfMonoids( input_types[1].category ) );
    
end );

#! @Arguments BimonB
DeclareAttribute( "AssociatedCategoryOfComonoids", IsCategoryOfInternalBimonoids );

CapJitAddTypeSignature( "AssociatedCategoryOfComonoids", [ IsCategoryOfInternalBimonoids ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( AssociatedCategoryOfComonoids( input_types[1].category ) );
    
end );

#! @Arguments bimonoid
DeclareAttribute( "DefiningQuintupleOfInternalBimonoid",
        IsObjectInCategoryOfInternalBimonoids );

CapJitAddTypeSignature( "DefiningQuintupleOfInternalBimonoid", [ IsObjectInCategoryOfInternalBimonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalBimonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfNTupleOf( 5,
                   CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) ),
                   CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ),
                   CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ),
                   CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ),
                   CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ) );
    
end );

#! @Arguments bimonoid_morphism
DeclareAttribute( "UnderlyingMorphism",
        IsMorphismInCategoryOfInternalBimonoids );

CapJitAddTypeSignature( "UnderlyingMorphism", [ IsMorphismInCategoryOfInternalBimonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalBimonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

#! @Arguments bimonoid
DeclareAttribute( "UnderlyingObject", IsObjectInCategoryOfInternalBimonoids );

CapJitAddTypeSignature( "UnderlyingObject", [ IsObjectInCategoryOfInternalBimonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalBimonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

#! @Arguments bimonoid
DeclareAttribute( "Unit", IsObjectInCategoryOfInternalBimonoids );

#! @Arguments bimonoid
DeclareAttribute( "Multiplication", IsObjectInCategoryOfInternalBimonoids );

#! @Arguments bimonoid
DeclareAttribute( "Counit", IsObjectInCategoryOfInternalBimonoids );

#! @Arguments bimonoid
DeclareAttribute( "Comultiplication", IsObjectInCategoryOfInternalBimonoids );

#! @Arguments bimonoid
DeclareAttribute( "UnderlyingMonoid", IsObjectInCategoryOfInternalBimonoids );

CapJitAddTypeSignature( "UnderlyingMonoid", [ IsObjectInCategoryOfInternalBimonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalBimonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfObjectOfCategory( AssociatedCategoryOfMonoids( input_types[1].category ) );
    
end );

#! @Arguments bimonoid
DeclareAttribute( "UnderlyingComonoid", IsObjectInCategoryOfInternalBimonoids );

CapJitAddTypeSignature( "UnderlyingComonoid", [ IsObjectInCategoryOfInternalBimonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalBimonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfObjectOfCategory( AssociatedCategoryOfComonoids( input_types[1].category ) );
    
end );

#! @Arguments bimonoid_morphism
DeclareAttribute( "UnderlyingMonoidMorphism", IsMorphismInCategoryOfInternalBimonoids );

CapJitAddTypeSignature( "UnderlyingMonoidMorphism", [ IsMorphismInCategoryOfInternalBimonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalBimonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfMorphismOfCategory( AssociatedCategoryOfMonoids( input_types[1].category ) );
    
end );

#! @Arguments bimonoid_morphism
DeclareAttribute( "UnderlyingComonoidMorphism", IsMorphismInCategoryOfInternalBimonoids );

CapJitAddTypeSignature( "UnderlyingComonoidMorphism", [ IsMorphismInCategoryOfInternalBimonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalBimonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfMorphismOfCategory( AssociatedCategoryOfComonoids( input_types[1].category ) );
    
end );

#! @Arguments monoid
DeclareAttribute( "Bimonoid",
        IsObjectInCategoryOfInternalMonoids );

#! @Arguments monoid
DeclareAttribute( "AffineVarietyOfBimonoids", IsObjectInCategoryOfInternalMonoids );

#! @Arguments comonoid
DeclareAttribute( "AffineVarietyOfBimonoids", IsObjectInCategoryOfInternalComonoids );

####################################
##
#! @Section Constructors
##
####################################

DeclareOperation( "CATEGORY_OF_BIMONOIDS_AS_COMONOIDS_OF_MONOIDS", [ IsCapCategory and IsMonoidalCategory ] );

DeclareOperation( "CATEGORY_OF_BIMONOIDS_AS_MONOIDS_OF_COMONOIDS", [ IsCapCategory and IsMonoidalCategory ] );

#! @Arguments mon_cat
DeclareAttribute( "CategoryOfBimonoids", IsCapCategory and IsMonoidalCategory );

#! @Arguments mon_cat
DeclareAttribute( "CategoryOfBimonoidsAsComonoidsOfMonoids", IsCapCategory and IsMonoidalCategory );

#! @Arguments mon_cat
DeclareAttribute( "CategoryOfBimonoidsAsMonoidsOfComonoids", IsCapCategory and IsMonoidalCategory );

#! @Arguments lin_mon_cat, bimonoid
DeclareOperation( "LinearizeInternalBimonoid",
        [ IsCapCategory and IsLinearCategoryOverCommutativeRing and IsMonoidalCategory, IsObjectInCategoryOfInternalBimonoids ] );

if false then
#! @Arguments bimonoid, lin_mon_cat
DeclareOperation( "/",
        [ IsObjectInCategoryOfInternalBimonoids, IsCapCategory and IsLinearCategoryOverCommutativeRing and IsMonoidalCategory ] );
fi;

#! @Arguments mon_cat, set_monoid
DeclareOperation( "MonoidAsInternalBimonoid",
        [ IsCapCategory and IsMonoidalCategory, IsMonoid ] );

if false then
#! @Arguments set_monoid, mon_cat
DeclareOperation( "/",
        [ IsMonoid, IsCapCategory and IsMonoidalCategory ] );
fi;

#! @Arguments bimonoid
DeclareAttribute( "OppositeBimonoid", IsObjectInCategoryOfInternalBimonoids );

#! @Arguments bimonoid
DeclareAttribute( "CoOppositeBimonoid", IsObjectInCategoryOfInternalBimonoids );

#! @Arguments bimonoid
DeclareAttribute( "OppositeCoOppositeBimonoid", IsObjectInCategoryOfInternalBimonoids );

#! @Arguments bimonoid
DeclareAttribute( "DualBimonoid", IsObjectInCategoryOfInternalBimonoids );

#! @Arguments iso, bimonoid
DeclareOperation( "TransformedBimonoid",
        [ IsCapCategoryMorphism, IsObjectInCategoryOfInternalBimonoids ] );

#! @Arguments ring_map, bimonoid
DeclareOperation( "Pullback",
        [ IsHomalgRingMap, IsObjectInCategoryOfInternalBimonoids ] );

if false then
#! @Arguments bimonoid, BimonB
DeclareOperation( "/",
        [ IsObjectInCategoryOfInternalBimonoids, IsCategoryOfInternalBimonoids ] );
fi;

if false then
#! @Arguments bimonoid, B
DeclareOperation( "/",
        [ IsObjectInCategoryOfInternalBimonoids, IsCapCategory ] );
fi;

#! @Arguments R, bimonoid,
DeclareOperation( "*",
        [ IsHomalgRing, IsObjectInCategoryOfInternalBimonoids ] );

#! @Arguments BimonB, monoid, counit, comult
DeclareOperation( "Bimonoid",
        [ IsCategoryOfInternalBimonoids, IsObjectInCategoryOfInternalMonoids, IsCapCategoryMorphism, IsCapCategoryMorphism ] );

if false then
#! @Arguments BimonB, monoid, counit, comult
DeclareOperation( "Bimonoid",
        [ IsCategoryOfInternalBimonoids, IsObjectInCategoryOfInternalMonoids, IsMorphismInCategoryOfInternalMonoids, IsMorphismInCategoryOfInternalMonoids ] );
fi;

#! @Arguments BimonB, monoid, counit_on_generators, comult_on_generators
DeclareOperation( "Bimonoid",
        [ IsCategoryOfInternalBimonoids, IsObjectInCategoryOfInternalMonoids, IsList, IsList ] );

#! @Arguments monoid, counit_on_generators, comult_on_generators
DeclareOperation( "Bimonoid",
        [ IsObjectInCategoryOfInternalMonoids, IsList, IsList ] );

#! @Arguments monoid, counit_record, comult_record
DeclareOperation( "Bimonoid",
        [ IsObjectInCategoryOfInternalMonoids, IsRecord, IsRecord ] );

#! @Arguments monoid, counit_record, comult_record
DeclareOperation( "AffineVarietyOfBimonoids",
        [ IsObjectInCategoryOfInternalMonoids, IsRecord, IsRecord ] );
