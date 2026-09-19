# SPDX-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Declarations
#

#! @Chapter Internal Hopf monoids

####################################
##
#! @Section GAP Categories
##
####################################

## categories

#! @Arguments HmonB
DeclareCategory( "IsCategoryOfInternalHopfMonoids", IsCapCategory );

#! @Arguments hopf_monoid
DeclareCategory( "IsObjectInCategoryOfInternalHopfMonoids", IsCapCategoryObject );

#! @Arguments hopf_monoid_morphism
DeclareCategory( "IsMorphismInCategoryOfInternalHopfMonoids", IsCapCategoryMorphism );

####################################
##
#! @Section Properties
##
####################################

#! @Arguments hopf_monoid
DeclareProperty( "IsCommutative", IsObjectInCategoryOfInternalHopfMonoids );

#! @Arguments hopf_monoid
DeclareProperty( "IsCocommutative", IsObjectInCategoryOfInternalHopfMonoids );

####################################
##
#! @Section Attributes
##
####################################

#! @Arguments HmonB
DeclareAttribute( "UnderlyingCategory", IsCategoryOfInternalHopfMonoids );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsCategoryOfInternalHopfMonoids ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

#! @Arguments HmonB
DeclareAttribute( "AssociatedCategoryOfMonoids", IsCategoryOfInternalHopfMonoids );

CapJitAddTypeSignature( "AssociatedCategoryOfMonoids", [ IsCategoryOfInternalHopfMonoids ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( AssociatedCategoryOfMonoids( input_types[1].category ) );
    
end );

#! @Arguments HmonB
DeclareAttribute( "AssociatedCategoryOfComonoids", IsCategoryOfInternalHopfMonoids );

CapJitAddTypeSignature( "AssociatedCategoryOfComonoids", [ IsCategoryOfInternalHopfMonoids ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( AssociatedCategoryOfComonoids( input_types[1].category ) );
    
end );

#! @Arguments HmonB
DeclareAttribute( "AssociatedCategoryOfBimonoids", IsCategoryOfInternalHopfMonoids );

CapJitAddTypeSignature( "AssociatedCategoryOfBimonoids", [ IsCategoryOfInternalHopfMonoids ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( AssociatedCategoryOfBimonoids( input_types[1].category ) );
    
end );

#! @Arguments hopf_monoid
DeclareAttribute( "DefiningSextupleOfInternalHopfMonoid",
        IsObjectInCategoryOfInternalHopfMonoids );

CapJitAddTypeSignature( "DefiningSextupleOfInternalHopfMonoid", [ IsObjectInCategoryOfInternalHopfMonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalHopfMonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfNTupleOf( 6,
                   CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) ),
                   CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ),
                   CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ),
                   CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ),
                   CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ),
                   CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ) );
    
end );

#! @Arguments hopf_monoid_morphism
DeclareAttribute( "UnderlyingMorphism",
        IsMorphismInCategoryOfInternalHopfMonoids );

CapJitAddTypeSignature( "UnderlyingMorphism", [ IsMorphismInCategoryOfInternalHopfMonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalHopfMonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

#! @Arguments hopf_monoid
DeclareAttribute( "UnderlyingObject", IsObjectInCategoryOfInternalHopfMonoids );

CapJitAddTypeSignature( "UnderlyingObject", [ IsObjectInCategoryOfInternalHopfMonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalHopfMonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

#! @Arguments hopf_monoid
DeclareAttribute( "UnderlyingMonoid", IsObjectInCategoryOfInternalHopfMonoids );

CapJitAddTypeSignature( "UnderlyingMonoid", [ IsObjectInCategoryOfInternalHopfMonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalHopfMonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfObjectOfCategory( AssociatedCategoryOfMonoids( input_types[1].category ) );
    
end );

#! @Arguments hopf_monoid
DeclareAttribute( "UnderlyingComonoid", IsObjectInCategoryOfInternalHopfMonoids );

CapJitAddTypeSignature( "UnderlyingComonoid", [ IsObjectInCategoryOfInternalHopfMonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalHopfMonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfObjectOfCategory( AssociatedCategoryOfComonoids( input_types[1].category ) );
    
end );

#! @Arguments hopf_monoid
DeclareAttribute( "UnderlyingBimonoid", IsObjectInCategoryOfInternalHopfMonoids );

CapJitAddTypeSignature( "UnderlyingBimonoid", [ IsObjectInCategoryOfInternalHopfMonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalHopfMonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfObjectOfCategory( AssociatedCategoryOfBimonoids( input_types[1].category ) );
    
end );

#! @Arguments hopf_monoid_morphism
DeclareAttribute( "UnderlyingMonoidMorphism", IsMorphismInCategoryOfInternalHopfMonoids );

CapJitAddTypeSignature( "UnderlyingMonoidMorphism", [ IsMorphismInCategoryOfInternalHopfMonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalHopfMonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfMorphismOfCategory( AssociatedCategoryOfMonoids( input_types[1].category ) );
    
end );

#! @Arguments hopf_monoid_morphism
DeclareAttribute( "UnderlyingComonoidMorphism", IsMorphismInCategoryOfInternalHopfMonoids );

CapJitAddTypeSignature( "UnderlyingComonoidMorphism", [ IsMorphismInCategoryOfInternalHopfMonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalHopfMonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfMorphismOfCategory( AssociatedCategoryOfComonoids( input_types[1].category ) );
    
end );

#! @Arguments hopf_monoid_morphism
DeclareAttribute( "UnderlyingBimonoidMorphism", IsMorphismInCategoryOfInternalHopfMonoids );

CapJitAddTypeSignature( "UnderlyingBimonoidMorphism", [ IsMorphismInCategoryOfInternalHopfMonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalHopfMonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfMorphismOfCategory( AssociatedCategoryOfBimonoids( input_types[1].category ) );
    
end );

#! @Arguments monoid
DeclareAttribute( "HopfMonoid",
        IsObjectInCategoryOfInternalMonoids );

#! @Arguments monoid
DeclareAttribute( "AffineVarietyOfHopfMonoids", IsObjectInCategoryOfInternalMonoids );

#! @Arguments comonoid
DeclareAttribute( "AffineVarietyOfHopfMonoids", IsObjectInCategoryOfInternalComonoids );

#! @Arguments bimonoid
DeclareAttribute( "AffineVarietyOfHopfMonoids", IsObjectInCategoryOfInternalBimonoids );

####################################
##
#! @Section Constructors
##
####################################

DeclareOperation( "CATEGORY_OF_HOPF_MONOIDS", [ IsCapCategory and IsMonoidalCategory ] );

#! @Arguments mon_cat
DeclareAttribute( "CategoryOfHopfMonoids", IsCapCategory and IsMonoidalCategory );

#! @Arguments lin_mon_cat, hopf_monoid
DeclareOperation( "LinearizeInternalHopfMonoid",
        [ IsCapCategory and IsLinearCategoryOverCommutativeRing and IsMonoidalCategory, IsObjectInCategoryOfInternalHopfMonoids ] );

if false then
#! @Arguments lin_mon_cat, lin_mon_cat
DeclareOperation( "/",
        [ IsObjectInCategoryOfInternalHopfMonoids, IsCapCategory and IsLinearCategoryOverCommutativeRing and IsMonoidalCategory ] );
fi;

#! @Arguments mon_cat, set_group
DeclareOperation( "GroupAsInternalHopfMonoid",
        [ IsCapCategory and IsMonoidalCategory, IsGroup ] );

if false then
#! @Arguments set_group, mon_cat
DeclareOperation( "/",
        [ IsGroup, IsCapCategory and IsMonoidalCategory ] );
fi;

#! @Arguments hopf_monoid
DeclareAttribute( "OppositeHopfMonoid", IsObjectInCategoryOfInternalHopfMonoids );

#! @Arguments hopf_monoid
DeclareAttribute( "CoOppositeHopfMonoid", IsObjectInCategoryOfInternalHopfMonoids );

#! @Arguments hopf_monoid
DeclareAttribute( "OppositeCoOppositeHopfMonoid", IsObjectInCategoryOfInternalHopfMonoids );

#! @Arguments hopf_monoid
DeclareAttribute( "DualHopfMonoid", IsObjectInCategoryOfInternalHopfMonoids );

#! @Arguments iso, hopf_monoid
DeclareOperation( "TransformedHopfMonoid",
        [ IsCapCategoryMorphism, IsObjectInCategoryOfInternalHopfMonoids ] );

#! @Arguments ring_map, hopf_monoid
DeclareOperation( "Pullback",
        [ IsHomalgRingMap, IsObjectInCategoryOfInternalHopfMonoids ] );

if false then
#! @Arguments hopf_monoid, HmonB
DeclareOperation( "/",
        [ IsObjectInCategoryOfInternalHopfMonoids, IsCategoryOfInternalHopfMonoids ] );
fi;

if false then
#! @Arguments hopf_monoid, B
DeclareOperation( "/",
        [ IsObjectInCategoryOfInternalHopfMonoids, IsCapCategory ] );
fi;

#! @Arguments R, hopf_monoid,
DeclareOperation( "*",
        [ IsHomalgRing, IsObjectInCategoryOfInternalHopfMonoids ] );

#! @Arguments HmonB, bimonoid, antipode
DeclareOperation( "HopfMonoid",
        [ IsCategoryOfInternalHopfMonoids, IsObjectInCategoryOfInternalBimonoids, IsCapCategoryMorphism ] );

#! @Arguments HmonB, bimonoid, antipode_on_generators
DeclareOperation( "HopfMonoid",
        [ IsCategoryOfInternalHopfMonoids, IsObjectInCategoryOfInternalBimonoids, IsList ] );

#! @Arguments bimonoid, antipode_on_generators
DeclareOperation( "HopfMonoid",
        [ IsObjectInCategoryOfInternalBimonoids, IsList ] );

#! @Arguments bimonoid, antipode_record
DeclareOperation( "HopfMonoid",
        [ IsObjectInCategoryOfInternalBimonoids, IsRecord ] );

#! @Arguments bimonoid, counit_on_generators, comult_on_generators, antipode_on_generators
DeclareOperation( "HopfMonoid",
        [ IsObjectInCategoryOfInternalMonoids, IsList, IsList, IsList ] );

#! @Arguments monoid, counit_record, comult_record, antipode_record
DeclareOperation( "HopfMonoid",
        [ IsObjectInCategoryOfInternalMonoids, IsRecord, IsRecord, IsRecord ] );

#! @Arguments monoid, counit_record, comult_record, antipode_record
DeclareOperation( "AffineVarietyOfHopfMonoids",
        [ IsObjectInCategoryOfInternalMonoids, IsRecord, IsRecord, IsRecord ] );
