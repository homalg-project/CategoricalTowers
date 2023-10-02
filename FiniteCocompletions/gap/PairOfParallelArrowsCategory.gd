# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Declarations
#

#! @Chapter The pair of parallel arrows category of a category

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of pair of parallel arrows categories.
DeclareCategory( "IsPairOfParallelArrowsCategory",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in the pair of parallel arrows category of a category.
DeclareCategory( "IsCellInPairOfParallelArrowsCategory",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in the pair of parallel arrows category of a category.
DeclareCategory( "IsObjectInPairOfParallelArrowsCategory",
        IsCellInPairOfParallelArrowsCategory and IsCapCategoryObject  );

#! @Description
#!  The &GAP; category of morphisms in the pair of parallel arrows category of a category.
DeclareCategory( "IsMorphismInPairOfParallelArrowsCategory",
        IsCellInPairOfParallelArrowsCategory and IsCapCategoryMorphism );

####################################
#
#! @Section Global variables
#
####################################

if false then
#! @Description
#!  The quiver generating the category of quivers.
DeclareGlobalVariable( "QuiverOfCategoryOfQuivers" );
fi;

####################################
#
#! @Section Attributes
#
####################################

#! @Arguments quiver
DeclareAttribute( "PairOfObjectsAndPairOfParallelMorphisms",
        IsObjectInPairOfParallelArrowsCategory );

CapJitAddTypeSignature( "PairOfObjectsAndPairOfParallelMorphisms", [ IsObjectInPairOfParallelArrowsCategory ],
 function ( input_types )
    local C;
    
    Assert( 0, IsPairOfParallelArrowsCategory( input_types[1].category ) );
    
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
DeclareAttribute( "DefiningPairOfMorphismBetweenParallelPairs",
        IsMorphismInPairOfParallelArrowsCategory );

CapJitAddTypeSignature( "DefiningPairOfMorphismBetweenParallelPairs", [ IsMorphismInPairOfParallelArrowsCategory ],
 function ( input_types )
    local C;
    
    Assert( 0, IsPairOfParallelArrowsCategory( input_types[1].category ) );
    
    C := UnderlyingCategory( input_types[1].category );
    
    return CapJitDataTypeOfNTupleOf( 2,
                   CapJitDataTypeOfMorphismOfCategory( C ),
                   CapJitDataTypeOfMorphismOfCategory( C ) );
    
end );

#! @Description
#!  Return the category $C$ underlying the category
#!  <A>PPAC</A> := <C>PairOfParallelArrowsCategory</C>( $C$ ).
#! @Arguments PPAC
DeclareAttribute( "UnderlyingCategory",
        IsPairOfParallelArrowsCategory );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsPairOfParallelArrowsCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Return the finite coequalizer closure of the coartesian category <A>cat</A>.
#! @Arguments cat
DeclareAttribute( "PairOfParallelArrowsCategory",
        IsCapCategory );
#! @InsertChunk FinBouquetsAsFiniteColimitCompletion
#! @InsertChunk FinReflexiveQuiversAsFiniteColimitCompletion
