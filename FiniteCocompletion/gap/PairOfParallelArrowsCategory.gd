# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletion: Finite (co)product/(co)limit (co)completions
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
DeclareAttribute( "DefiningParallelPair",
        IsObjectInPairOfParallelArrowsCategory );

CapJitAddTypeSignature( "DefiningParallelPair", [ IsObjectInPairOfParallelArrowsCategory ],
 function ( input_types )
    
    Assert( 0, IsPairOfParallelArrowsCategory( input_types[1].category ) );
    
    return rec( filter := IsNTuple,
                element_types :=
                [ CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ),
                  CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ) ] );
    
end );

#! @Arguments quiver_morphism
DeclareAttribute( "DefiningPairOfMorphismBetweenParallelPairs",
        IsMorphismInPairOfParallelArrowsCategory );

CapJitAddTypeSignature( "DefiningPairOfMorphismBetweenParallelPairs", [ IsMorphismInPairOfParallelArrowsCategory ],
 function ( input_types )
    
    Assert( 0, IsPairOfParallelArrowsCategory( input_types[1].category ) );
    
    return rec( filter := IsNTuple,
                element_types :=
                [ CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ),
                  CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ) ] );
    
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
