



# @Description
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
DeclareAttribute( "QuotientCategoryCongruenceFunction", IsQuotientCapCategory );

DeclareAttribute( "UnderlyingCell", IsQuotientCapCategoryObject );
DeclareAttribute( "UnderlyingCell", IsQuotientCapCategoryMorphism );


DeclareGlobalVariable( "CAP_INTERNAL_METHOD_NAME_LIST_FOR_QUOTIENT_CATEGORY" );
DeclareGlobalFunction( "ADD_FUNCTIONS_OF_RANDOM_METHODS_TO_QUOTIENT_CATEGORY" );
