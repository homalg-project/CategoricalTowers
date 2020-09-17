#
# FunctorCategories: Categories of functors
#
# Declarations
#

DeclareProperty( "IsQuiverVertexWithLoop", IsQuiverVertex );

DeclareOperation( "AuxiliaryMorphism",
    [ IsCapCategoryObjectInHomCategory, IsCapCategoryObjectInHomCategory ] );

DeclareGlobalFunction( "ADD_FUNCTIONS_FOR_HOMOMORPHISM_STRUCTURE_TO_FUNCTORS_CATEGORY" );
