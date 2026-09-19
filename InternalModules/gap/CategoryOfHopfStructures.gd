# SPDX-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Declarations
#

#! @Chapter Internal Hopf structures

####################################
##
#! @Section GAP Categories
##
####################################

## categories

#! @Arguments cat_of_bimons
DeclareCategory( "IsCategoryOfHopfStructures", IsCapCategory );

#! @Arguments hopf_structure
DeclareCategory( "IsObjectInCategoryOfHopfStructures", IsCapCategoryObject );

#! @Arguments hopf_structure_morphism
DeclareCategory( "IsMorphismInCategoryOfHopfStructures", IsCapCategoryMorphism );

####################################
##
#! @Section Attributes
##
####################################

#! @Arguments HBimon
DeclareAttribute( "UnderlyingCategory", IsCategoryOfHopfStructures );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsCategoryOfHopfStructures ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

#! @Arguments hopf_structure
DeclareAttribute( "DefiningPairOfHopfStructure",
        IsObjectInCategoryOfHopfStructures );

CapJitAddTypeSignature( "DefiningPairOfHopfStructure", [ IsObjectInCategoryOfHopfStructures ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfHopfStructures( input_types[1].category ) );
    
    return CapJitDataTypeOfNTupleOf( 2,
                   CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) ),
                   CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ) );
    
end );

#! @Arguments hopf_structure_morphism
DeclareAttribute( "UnderlyingMorphism",
        IsMorphismInCategoryOfHopfStructures );

CapJitAddTypeSignature( "UnderlyingMorphism", [ IsMorphismInCategoryOfHopfStructures ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfHopfStructures( input_types[1].category ) );
    
    return CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

####################################
##
#! @Section Operations
##
####################################

#! @Arguments Bimon, bimonoid, antipode
DeclareOperation( "LongMorphismOfLeftAntipodeLawOfHopfMonoid",
        [ IsMonoidalCategory, IsCapCategoryObject, IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ] );

#! @Arguments Bimon, bimonoid, antipode
DeclareOperation( "LongMorphismOfRightAntipodeLawOfHopfMonoid",
        [ IsMonoidalCategory, IsCapCategoryObject, IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ] );

#! @Arguments Bimon, bimonoid, antipode
DeclareOperation( "LeftAntipodeLawOfHopfMonoid",
        [ IsMonoidalCategory, IsCapCategoryObject, IsCapCategoryMorphism ] );

#! @Arguments Bimon, bimonoid, antipode
DeclareOperation( "RightAntipodeLawOfHopfMonoid",
        [ IsMonoidalCategory, IsCapCategoryObject, IsCapCategoryMorphism ] );

####################################
##
#! @Section Constructors
##
####################################

DeclareOperation( "CATEGORY_OF_HOPF_STRUCTURES", [ IsCapCategory and IsMonoidalCategory ] );

#! @Arguments Bimon
DeclareAttribute( "CategoryOfHopfStructures", IsCategoryOfBimonoids );
