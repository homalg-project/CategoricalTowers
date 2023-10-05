# SPDX-License-Identifier: GPL-2.0-or-later
# QuotientCategories: Quotient categories
#
# Declarations
#
#  The &GAP; category of a quotient CAP category.
DeclareCategory( "IsQuotientCapCategory",
        IsCapCategory );

# @Description
#  The &GAP; category of objects in a quotient CAP category.
DeclareCategory( "IsQuotientCapCategoryObject",
        IsCapCategoryObject );

# @Description
#  The &GAP; category of morphisms in a quotient CAP category.
DeclareCategory( "IsQuotientCapCategoryMorphism",
        IsCapCategoryMorphism );

DeclareOperation( "QuotientCategory", [ IsRecord ] );

DeclareAttribute( "UnderlyingCategory", IsQuotientCapCategory );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsQuotientCapCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

DeclareAttribute( "QuotientCategoryCongruenceFunction", IsQuotientCapCategory );

DeclareAttribute( "UnderlyingCell", IsQuotientCapCategoryObject );

CapJitAddTypeSignature( "UnderlyingCell", [ IsQuotientCapCategoryObject ],
 function ( input_types )
    
    Assert( 0, IsQuotientCapCategory( input_types[1].category ) );
    
    return CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

DeclareAttribute( "UnderlyingCell", IsQuotientCapCategoryMorphism );

CapJitAddTypeSignature( "UnderlyingCell", [ IsQuotientCapCategoryMorphism ],
 function ( input_types )
    
    Assert( 0, IsQuotientCapCategory( input_types[1].category ) );
    
    return CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

DeclareGlobalVariable( "CAP_INTERNAL_METHOD_NAME_LIST_FOR_QUOTIENT_CATEGORY" );
DeclareGlobalFunction( "ADD_FUNCTIONS_OF_RANDOM_METHODS_TO_QUOTIENT_CATEGORY" );
