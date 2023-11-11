# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Declarations
#

#! @Chapter The coequalizer completion of a category

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of coequalizer completions of categories.
DeclareCategory( "IsCoequalizerCompletion",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in the coequalizer completion of a category.
DeclareCategory( "IsCellInCoequalizerCompletion",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in the coequalizer completion of a category.
DeclareCategory( "IsObjectInCoequalizerCompletion",
        IsCellInCoequalizerCompletion and IsCapCategoryObject  );

#! @Description
#!  The &GAP; category of morphisms in the coequalizer completion of a category.
DeclareCategory( "IsMorphismInCoequalizerCompletion",
        IsCellInCoequalizerCompletion and IsCapCategoryMorphism );

####################################
#
#! @Section Attributes
#
####################################

#! @Arguments quiver
DeclareAttribute( "PairOfObjectsAndPairOfParallelMorphisms",
        IsObjectInCoequalizerCompletion );

CapJitAddTypeSignature( "PairOfObjectsAndPairOfParallelMorphisms", [ IsObjectInCoequalizerCompletion ],
 function ( input_types )
    local C;
    
    Assert( 0, IsCoequalizerCompletion( input_types[1].category ) );
    
    C := UnderlyingCategory( input_types[1].category );
    
    return CapJitDataTypeOfNTupleOf( 2,
                   CapJitDataTypeOfNTupleOf( 2,
                           CapJitDataTypeOfObjectOfCategory( C ),
                           CapJitDataTypeOfObjectOfCategory( C ) ),
                   CapJitDataTypeOfNTupleOf( 2,
                           CapJitDataTypeOfMorphismOfCategory( C ),
                           CapJitDataTypeOfMorphismOfCategory( C ) ) );
    
end );

#! @Arguments quiver_morphism
DeclareAttribute( "DefiningPairOfMorphismBetweenCoequalizerPairs",
        IsMorphismInCoequalizerCompletion );

CapJitAddTypeSignature( "DefiningPairOfMorphismBetweenCoequalizerPairs", [ IsMorphismInCoequalizerCompletion ],
 function ( input_types )
    local C;
    
    Assert( 0, IsCoequalizerCompletion( input_types[1].category ) );
    
    C := UnderlyingCategory( input_types[1].category );
    
    return CapJitDataTypeOfNTupleOf( 2,
                   CapJitDataTypeOfMorphismOfCategory( C ),
                   CapJitDataTypeOfMorphismOfCategory( C ) );
    
end );

#! @Description
#!  Return the category $C$ underlying the category
#!  <A>CoeqC</A> := <C>CoequalizerCompletion</C>( $C$ ).
#! @Arguments CoeqC
DeclareAttribute( "UnderlyingCategory",
        IsCoequalizerCompletion );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsCoequalizerCompletion ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Return the finite coequalizer completion of the coartesian category <A>cat</A>.
#! @Arguments cat
DeclareAttribute( "CoequalizerCompletion",
        IsCapCategory );
#! @InsertChunk CoequalizerCompletion

DeclareOperation( "AsCoequalizerCompletionObject",
        [ IsCoequalizerCompletion, IsCapCategoryObject ] );

DeclareOperation( "AsCoequalizerCompletionMorphism",
        [ IsCoequalizerCompletion, IsCapCategoryMorphism ] );
