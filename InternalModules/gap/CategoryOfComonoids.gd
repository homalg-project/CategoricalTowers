# SPDX-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Declarations
#

#! @Chapter Internal comonoids

####################################
##
#! @Section GAP Categories
##
####################################

## categories

#! @Arguments ComonB
DeclareCategory( "IsCategoryOfInternalComonoids", IsCapCategory );

#! @Arguments comonoid
DeclareCategory( "IsObjectInCategoryOfInternalComonoids", IsCapCategoryObject );

#! @Arguments comonoid_morphism
DeclareCategory( "IsMorphismInCategoryOfInternalComonoids", IsCapCategoryMorphism );

####################################
##
#! @Section Properties
##
####################################

#! @Arguments comonoid
DeclareProperty( "IsCocommutative", IsObjectInCategoryOfInternalComonoids );

####################################
##
#! @Section Attributes
##
####################################

#! @Arguments ComonB
DeclareAttribute( "UnderlyingCategory", IsCategoryOfInternalComonoids );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsCategoryOfInternalComonoids ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

#! @Arguments ComonB
DeclareAttribute( "AssociatedCategoryOfMonoids", IsCategoryOfInternalComonoids );

CapJitAddTypeSignature( "AssociatedCategoryOfMonoids", [ IsCategoryOfInternalComonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalComonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfObjectOfCategory( AssociatedCategoryOfMonoids( input_types[1].category ) );
    
end );

#! @Arguments comonoid
DeclareAttribute( "DefiningTripleOfInternalComonoid",
        IsObjectInCategoryOfInternalComonoids );

CapJitAddTypeSignature( "DefiningTripleOfInternalComonoid", [ IsObjectInCategoryOfInternalComonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalComonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfNTupleOf( 3,
                   CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) ),
                   CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ),
                   CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ) );
    
end );

#! @Arguments comonoid_morphism
DeclareAttribute( "UnderlyingMorphism",
        IsMorphismInCategoryOfInternalComonoids );

CapJitAddTypeSignature( "UnderlyingMorphism", [ IsMorphismInCategoryOfInternalComonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalComonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

#! @Arguments comonoid
DeclareAttribute( "UnderlyingObject", IsObjectInCategoryOfInternalComonoids );

CapJitAddTypeSignature( "UnderlyingObject", [ IsObjectInCategoryOfInternalComonoids ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfInternalComonoids( input_types[1].category ) );
    
    return CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

####################################
##
#! @Section Constructors
##
####################################

DeclareOperation( "CATEGORY_OF_COMONOIDS", [ IsCapCategory and IsMonoidalCategory ] );

#! @Arguments mon_cat
DeclareAttribute( "CategoryOfComonoids", IsCapCategory and IsMonoidalCategory );

#! @Arguments comonoid
DeclareAttribute( "CoOppositeComonoid", IsObjectInCategoryOfInternalComonoids );

#! @Arguments comonoid
DeclareAttribute( "DualMonoid", IsObjectInCategoryOfInternalComonoids );

#! @Arguments comonoid_morphism
DeclareAttribute( "DualMonoid", IsMorphismInCategoryOfInternalComonoids );

#! @Arguments iso, comonoid
DeclareOperation( "TransformedComonoid",
        [ IsCapCategoryMorphism, IsObjectInCategoryOfInternalComonoids ] );
