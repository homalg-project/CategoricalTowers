# SPDX-License-Identifier: GPL-2.0-or-later
# QuotientCategories: Quotient categories
#
# Declarations
#
#  The &GAP; category of a quotient CAP category.
DeclareCategory( "IsQuotientCategory",
        IsCapCategory );

# @Description
#  The &GAP; category of objects in a quotient CAP category.
DeclareCategory( "IsQuotientCategoryObject",
        IsCapCategoryObject );

# @Description
#  The &GAP; category of morphisms in a quotient CAP category.
DeclareCategory( "IsQuotientCategoryMorphism",
        IsCapCategoryMorphism );

DeclareOperation( "QuotientCategory", [ IsRecord ] );

DeclareAttribute( "UnderlyingCategory", IsQuotientCategory );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsQuotientCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

DeclareAttribute( "QuotientCategoryCongruenceFunction", IsQuotientCategory );

DeclareAttribute( "UnderlyingCell", IsQuotientCategoryObject );

CapJitAddTypeSignature( "UnderlyingCell", [ IsQuotientCategoryObject ],
 function ( input_types )
    
    Assert( 0, IsQuotientCategory( input_types[1].category ) );
    
    return CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

DeclareAttribute( "UnderlyingCell", IsQuotientCategoryMorphism );

CapJitAddTypeSignature( "UnderlyingCell", [ IsQuotientCategoryMorphism ],
 function ( input_types )
    
    Assert( 0, IsQuotientCategory( input_types[1].category ) );
    
    return CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

DeclareGlobalVariable( "CAP_INTERNAL_METHOD_NAME_LIST_FOR_QUOTIENT_CATEGORY" );
DeclareGlobalFunction( "ADD_FUNCTIONS_OF_RANDOM_METHODS_TO_QUOTIENT_CATEGORY" );

DeclareOperation( "ExtendFunctorToQuotientCategoryData",
        [ IsQuotientCategory, IsList, IsCapCategory ] );
