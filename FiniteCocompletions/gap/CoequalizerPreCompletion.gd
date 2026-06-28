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
DeclareCategory( "IsCoequalizerPreCompletion",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in the coequalizer completion of a category.
DeclareCategory( "IsCellInCoequalizerPreCompletion",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in the coequalizer completion of a category.
DeclareCategory( "IsObjectInCoequalizerPreCompletion",
        FilterIntersection( IsCapCategoryObject, IsCellInCoequalizerPreCompletion ) );

#! @Description
#!  The &GAP; category of morphisms in the coequalizer completion of a category.
DeclareCategory( "IsMorphismInCoequalizerPreCompletion",
        FilterIntersection( IsCapCategoryMorphism, IsCellInCoequalizerPreCompletion ) );

####################################
#
#! @Section Attributes
#
####################################

#! @Arguments quiver
DeclareAttribute( "PairOfObjectsAndPairOfParallelMorphisms",
        IsObjectInCoequalizerPreCompletion );

#CapJitAddTypeSignature( "PairOfObjectsAndPairOfParallelMorphisms", [ IsObjectInCoequalizerPreCompletion ],
#  function ( input_types )
#    
#    Assert( 0, IsCoequalizerPreCompletion( input_types[1].category ) );
#    
#    return ObjectDatumType( input_types[1].category );
#    
#end );

#! @Arguments quiver_morphism
DeclareAttribute( "DefiningPairOfMorphismBetweenCoequalizerPairs",
        IsMorphismInCoequalizerPreCompletion );

#CapJitAddTypeSignature( "DefiningPairOfMorphismBetweenCoequalizerPairs", [ IsMorphismInCoequalizerPreCompletion ],
#  function ( input_types )
#    
#    Assert( 0, IsCoequalizerPreCompletion( input_types[1].category ) );
#    
#    return MorphismDatumType( input_types[1].category );
#    
#end );

#! @Description
#!  Return the category $C$ underlying the category
#!  <A>CoeqC</A> := <C>CoequalizerPreCompletion</C>( $C$ ).
#! @Arguments CoeqC
DeclareAttribute( "UnderlyingCategory",
        IsCoequalizerPreCompletion );

#CapJitAddTypeSignature( "UnderlyingCategory", [ IsCoequalizerPreCompletion ],
#  function ( input_types )
#    
#    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );
#    
#end );

DeclareAttribute( "EmbeddingOfUnderlyingCategoryData",
        IsCoequalizerPreCompletion );

#! @Description
#!  The full embedding functor from the category $C$ underlying
#!  the finite coproduct cocompletion <A>UC</A> into <A>UC</A>.
#! @Arguments UC
#! @Returns a &CAP; functor
DeclareAttribute( "EmbeddingOfUnderlyingCategory",
        IsCoequalizerPreCompletion );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Return the finite coequalizer completion of the coartesian category <A>cat</A>.
#! @Arguments cat
DeclareAttribute( "CoequalizerPreCompletion",
        IsCapCategory );
#! @InsertChunk CoequalizerPreCompletion
