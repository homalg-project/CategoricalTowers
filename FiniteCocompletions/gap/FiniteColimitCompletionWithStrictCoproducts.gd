# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Declarations
#

#! @Chapter The finite colimit completion of a category

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of colimit completions of categories.
DeclareCategory( "IsFiniteColimitCompletionWithStrictCoproducts",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in the colimit completion of a category.
DeclareCategory( "IsCellInFiniteColimitCompletionWithStrictCoproducts",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in the colimit completion of a category.
DeclareCategory( "IsObjectInFiniteColimitCompletionWithStrictCoproducts",
        IsCellInFiniteColimitCompletionWithStrictCoproducts and IsCapCategoryObject  );

#! @Description
#!  The &GAP; category of morphisms in the colimit completion of a category.
DeclareCategory( "IsMorphismInFiniteColimitCompletionWithStrictCoproducts",
        IsCellInFiniteColimitCompletionWithStrictCoproducts and IsCapCategoryMorphism );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  Return the category $C$ underlying the category
#!  <A>C_hat</A> := <C>FiniteColimitCompletionWithStrictCoproducts</C>( $C$ ).
#! @Arguments C_hat
DeclareAttribute( "UnderlyingCategory",
        IsFiniteColimitCompletionWithStrictCoproducts );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsFiniteColimitCompletionWithStrictCoproducts ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

#! @Description
#!  Return the coproduct completion $UC :=$ <C>FiniteStrictCoproductCompletion</C>( $C$ )
#!  of the underlying category $C$, where
#!  <A>C_hat</A> := <C>FiniteColimitCompletionWithStrictCoproducts</C>( $C$ ) $\simeq$
#!  <C>CoequalizerCompletion</C>( $UC$ ).
#! @Arguments C_hat
DeclareAttribute( "FiniteStrictCoproductCompletionOfUnderlyingCategory",
        IsFiniteColimitCompletionWithStrictCoproducts );

CapJitAddTypeSignature( "FiniteStrictCoproductCompletionOfUnderlyingCategory", [ IsFiniteColimitCompletionWithStrictCoproducts ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( FiniteStrictCoproductCompletionOfUnderlyingCategory( input_types[1].category ) );
    
end );

#! @Arguments quiver
DeclareAttribute( "PairOfObjectsAndPairOfParallelMorphisms",
        IsObjectInFiniteColimitCompletionWithStrictCoproducts );

CapJitAddTypeSignature( "PairOfObjectsAndPairOfParallelMorphisms", [ IsObjectInFiniteColimitCompletionWithStrictCoproducts ],
 function ( input_types )
    local UC;
    
    Assert( 0, IsFiniteColimitCompletionWithStrictCoproducts( input_types[1].category ) );
    
    UC := FiniteStrictCoproductCompletionOfUnderlyingCategory( input_types[1].category );
    
    return CapJitDataTypeOfNTupleOf( 2,
                   CapJitDataTypeOfNTupleOf( 2,
                           CapJitDataTypeOfObjectOfCategory( UC ),
                           CapJitDataTypeOfObjectOfCategory( UC ) ),
                   CapJitDataTypeOfNTupleOf( 2,
                           CapJitDataTypeOfMorphismOfCategory( UC ),
                           CapJitDataTypeOfMorphismOfCategory( UC ) ) );
    
end );

#! @Arguments quiver_morphism
DeclareAttribute( "DefiningPairOfMorphismBetweenCoequalizerPairs",
        IsMorphismInFiniteColimitCompletionWithStrictCoproducts );

CapJitAddTypeSignature( "DefiningPairOfMorphismBetweenCoequalizerPairs", [ IsMorphismInFiniteColimitCompletionWithStrictCoproducts ],
 function ( input_types )
    local UC;
    
    Assert( 0, IsFiniteColimitCompletionWithStrictCoproducts( input_types[1].category ) );
    
    UC := FiniteStrictCoproductCompletionOfUnderlyingCategory( input_types[1].category );
    
    return CapJitDataTypeOfNTupleOf( 2,
                   CapJitDataTypeOfMorphismOfCategory( UC ),
                   CapJitDataTypeOfMorphismOfCategory( UC ) );
    
end );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Return the finite colimit completion of the category <A>cat</A>.
#! @Arguments cat
DeclareAttribute( "FiniteColimitCompletionWithStrictCoproducts",
        IsCapCategory );
#! @InsertChunk FiniteColimitCompletionWithStrictCoproducts

DeclareOperation( "AsColimitCompletionObject",
        [ IsFiniteColimitCompletionWithStrictCoproducts, IsCapCategoryObject ] );

DeclareOperation( "AsColimitCompletionMorphism",
        [ IsFiniteColimitCompletionWithStrictCoproducts, IsCapCategoryMorphism ] );

#! @Description
#!  The input is an object <A>coequalizer_pair</A> in the category of finite colimit completion of a category.
#!  The output is the corresponding colimit quiver.
#! @Arguments coequalizer_pair
#! @Returns a colimit quiver
DeclareAttribute( "AssociatedColimitQuiver",
        IsObjectInFiniteColimitCompletionWithStrictCoproducts );
