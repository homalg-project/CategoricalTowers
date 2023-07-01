# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#
# Declarations
#

#! @Chapter Category of relations

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of a category of relations
DeclareCategory( "IsCategoryOfRelations",
        IsCapCategory );

#! @Description
#!  The &GAP; category of objects in a category of relations.
DeclareCategory( "IsObjectInCategoryOfRelations",
        IsCapCategoryObject  );

#! @Description
#!  The &GAP; category of morphisms in a category of relations.
DeclareCategory( "IsMorphismInCategoryOfRelations",
        IsCapCategoryMorphism );

####################################
#
#! @Section Constructors
#
####################################

#!
DeclareAttribute( "CategoryOfRelations",
        IsCapCategory );

CapJitAddTypeSignature( "CategoryOfRelations", [ IsCapCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( CategoryOfRelations( input_types[1].category ) );
    
end );

#!
DeclareAttribute( "AsMorphismInCategoryOfRelations",
        IsCapCategoryMorphism );

CapJitAddTypeSignature( "AsMorphismInCategoryOfRelations", [ IsCategoryOfRelations, IsCapCategoryMorphism ],
  function ( input_types )
    
    return CapJitDataTypeOfMorphismOfCategory( input_types[1].category );
    
end );

####################################
#
#! @Section Attributes
#
####################################

#!
DeclareAttribute( "UnderlyingCategory",
        IsCategoryOfRelations );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsCategoryOfRelations ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

#!
DeclareAttribute( "UnitObjectInCategoryOfRelations",
        IsCategoryOfRelations );

#!
DeclareAttribute( "UnderlyingCell",
        IsObjectInCategoryOfRelations );

CapJitAddTypeSignature( "UnderlyingCell", [ IsObjectInCategoryOfRelations ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfRelations( input_types[1].category ) );
    
    return CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

#!
DeclareAttribute( "UnderlyingSpan",
        IsMorphismInCategoryOfRelations );

CapJitAddTypeSignature( "UnderlyingSpan", [ IsMorphismInCategoryOfRelations ],
  function ( input_types )
    local C;
    
    Assert( 0, IsCategoryOfRelations( input_types[1].category ) );
    
    C := UnderlyingCategory( input_types[1].category );
    
    return CapJitDataTypeOfNTupleOf( 2,
                   CapJitDataTypeOfObjectOfCategory( C ),
                   CapJitDataTypeOfNTupleOf( 2,
                           CapJitDataTypeOfMorphismOfCategory( C ),
                           CapJitDataTypeOfMorphismOfCategory( C ) ) );
    
end );

#!
DeclareAttribute( "MaximalRelationIntoTerminalObject",
        IsObjectInCategoryOfRelations );

CapJitAddTypeSignature( "MaximalRelationIntoTerminalObject", [ IsCategoryOfRelations, IsObjectInCategoryOfRelations ],
  function ( input_types )
    
    return CapJitDataTypeOfMorphismOfCategory( input_types[1].category );
    
end );

#!
DeclareAttribute( "PseudoInverse",
        IsMorphismInCategoryOfRelations );

CapJitAddTypeSignature( "PseudoInverse", [ IsCategoryOfRelations, IsMorphismInCategoryOfRelations ],
  function ( input_types )
    
    return CapJitDataTypeOfMorphismOfCategory( input_types[1].category );
    
end );

#!
DeclareAttribute( "PseudoInverseOfHonestMorphism",
        IsCapCategoryMorphism );

#!
DeclareAttribute( "EmbeddingOfRelationInDirectProduct",
        IsMorphismInCategoryOfRelations );

CapJitAddTypeSignature( "EmbeddingOfRelationInDirectProduct", [ IsCategoryOfRelations, IsMorphismInCategoryOfRelations ],
  function ( input_types )
    
    return CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

#!
DeclareAttribute( "SourceProjection",
        IsMorphismInCategoryOfRelations );

#!
DeclareAttribute( "RangeProjection",
        IsMorphismInCategoryOfRelations );

#!
DeclareAttribute( "StandardizedSpan",
        IsMorphismInCategoryOfRelations );

#!
DeclareAttribute( "MorphismByStandardizedSpan",
        IsMorphismInCategoryOfRelations );

#!
DeclareAttribute( "HonestRepresentative",
        IsMorphismInCategoryOfRelations );

####################################
#
#! @Section Properties
#
####################################

#! @Description
#!  The input is a morphsm $\rho$ in the category of relations.
#!  The output is <C>true</C> if the domain of $\rho$ is an isomorphism.
#! @Arguments rho
#! @Returns true or false
DeclareProperty( "IsHonest",
        IsMorphismInCategoryOfRelations );
