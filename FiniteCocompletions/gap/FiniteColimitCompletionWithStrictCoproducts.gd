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

#! @Description
#!  Given the presheaf category <A>PSh</A>=<C>PreSheaves</C>( $C$, $V$ ) return
#!  the ambient category <C>CategoryOfColimitQuivers</C>( $C$ ), provided
#!  $C$ is enriched over <C>SkeletalFinSets</C>.
#! @Arguments PSh
#! @Returns a &CAP; category
DeclareAttribute( "CategoryOfColimitQuiversOfUnderlyingCategory",
        IsFiniteColimitCompletionWithStrictCoproducts );

CapJitAddTypeSignature( "CategoryOfColimitQuiversOfUnderlyingCategory", [ IsFiniteColimitCompletionWithStrictCoproducts ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( CategoryOfColimitQuiversOfUnderlyingCategory( input_types[1].category ) );
    
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
#!  Given the finite colimit completion category <A>C_hat</A>=<C>FiniteColimitCompletionWithStrictCoproducts</C>( $C$ )
#!  of a $V$-enriched category $C$, return the associated category <C>PreSheaves</C>( $C$, $V$ ) of presheaves.
#! @Arguments C_hat
#! @Returns a &CAP; category
DeclareAttribute( "CategoryOfPreSheavesOfUnderlyingCategory",
        IsFiniteColimitCompletionWithStrictCoproducts );

CapJitAddTypeSignature( "CategoryOfPreSheavesOfUnderlyingCategory", [ IsFiniteColimitCompletionWithStrictCoproducts ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( CategoryOfPreSheavesOfUnderlyingCategory( input_types[1].category ) );
    
end );

#! @Description
#!  The input is an object <A>coequalizer_object</A> in the category of finite colimit completion of a category.
#!  The output is the corresponding colimit quiver.
#! @Arguments coequalizer_object
#! @Returns a colimit quiver
DeclareAttribute( "AssociatedColimitQuiver",
        IsObjectInFiniteColimitCompletionWithStrictCoproducts );
