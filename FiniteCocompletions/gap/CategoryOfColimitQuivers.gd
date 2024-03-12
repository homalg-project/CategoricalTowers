# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Declarations
#

#! @Chapter The category of colimit quivers in a category

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of categories of colimit quivers in a category.
#! @Arguments category
DeclareCategory( "IsCategoryOfColimitQuivers",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in the category of colimit quivers in a category.
#! @Arguments cell
DeclareCategory( "IsCellInCategoryOfColimitQuivers",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in the category of colimit quivers in a category.
#! @Arguments obj
DeclareCategory( "IsObjectInCategoryOfColimitQuivers",
        IsCellInCategoryOfColimitQuivers and
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in the category of colimit quivers in a category.
#! @Arguments mor
DeclareCategory( "IsMorphismInCategoryOfColimitQuivers",
        IsCellInCategoryOfColimitQuivers and
        IsCapCategoryMorphism );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  Return the category $C$ underlying the category of colimit quivers
#!  <A>ColimitQuivers</A> := <C>CategoryOfColimitQuivers</C>( $C$ ).
#! @Arguments ColimitQuivers
DeclareAttribute( "UnderlyingCategory",
        IsCategoryOfColimitQuivers );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsCategoryOfColimitQuivers ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

#! @Description
#!  The full embedding functor from the category $C$ underlying
#!  the category of colimit quivers
#!  <A>ColimitQuivers</A> into <A>ColimitQuivers</A>.
#! @Arguments ColimitQuivers
#! @Returns a &CAP; functor
DeclareAttribute( "EmbeddingOfUnderlyingCategory",
        IsCategoryOfColimitQuivers );

#! @Arguments colimit_quiver
DeclareAttribute( "DefiningPairOfColimitQuiver",
        IsObjectInCategoryOfColimitQuivers );

CapJitAddTypeSignature( "DefiningPairOfColimitQuiver", [ IsObjectInCategoryOfColimitQuivers ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfColimitQuivers( input_types[1].category ) );
    
    return CapJitDataTypeOfNTupleOf( 2,
                   CapJitDataTypeOfListOf( CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) ) ),
                   CapJitDataTypeOfListOf(
                           CapJitDataTypeOfNTupleOf( 3,
                                   IsInt,
                                   CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ),
                                   IsInt ) ) );
    
end );

#! @Arguments colimit_quiver_morphism
DeclareAttribute( "DefiningPairOfColimitQuiverMorphism",
        IsMorphismInCategoryOfColimitQuivers );

CapJitAddTypeSignature( "DefiningPairOfColimitQuiverMorphism", [ IsMorphismInCategoryOfColimitQuivers ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfColimitQuivers( input_types[1].category ) );
    
    return CapJitDataTypeOfNTupleOf( 2,
                   CapJitDataTypeOfNTupleOf( 2,
                           CapJitDataTypeOfListOf( IsInt ),
                           CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ) ) ),
                   CapJitDataTypeOfListOf( IsInt ) );
    
end );

#! @Description
#!  Given the presheaf category <A>PSh</A>=<C>PreSheaves</C>( $C$, $V$ ), return
#!  the ambient category <C>CoequalizerCompletion</C>( <C>AssociatedFiniteStrictCoproductCompletionOfSourceCategory</C>( <A>PSh</A> ) ).
#! @Arguments PSh
#! @Returns a &CAP; category
DeclareAttribute( "FiniteColimitCompletionWithStrictCoproductsOfUnderlyingCategory",
        IsCategoryOfColimitQuivers );

CapJitAddTypeSignature( "FiniteColimitCompletionWithStrictCoproductsOfUnderlyingCategory", [ IsCategoryOfColimitQuivers ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( FiniteColimitCompletionWithStrictCoproductsOfUnderlyingCategory( input_types[1].category ) );
    
end );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct the category colimit quivers in the category <A>C</A>.
#! @Returns a &CAP; category
#! @Arguments C
DeclareAttribute( "CategoryOfColimitQuivers",
        IsCapCategory );
#! @InsertChunk CategoryOfColimitQuivers

CapJitAddTypeSignature( "CategoryOfColimitQuivers", [ IsCapCategory ], function ( input_types )
    
    return CapJitDataTypeOfCategory( CategoryOfColimitQuivers( input_types[1].category ) );
    
end );

#! @Arguments ColimitQuivers, list
#! @Returns a colimit quiver
DeclareOperation( "CreateColimitQuiver",
        [ IsCategoryOfColimitQuivers, IsList ] );

#! @Arguments source, list_of_images, target
#! @Returns a colimit quiver morphism
DeclareOperation( "CreateMorphismOfColimitQuivers",
        [ IsObjectInCategoryOfColimitQuivers, IsList, IsObjectInCategoryOfColimitQuivers ] );

#! @Description
#!  Given the category <A>ColimitQuiversC</A>=<C>CategoryOfColimitQuivers</C>( $C$ ) of colimit quivers
#!  in a $V$-enriched category $C$, return the associated category <C>PreSheaves</C>( $C$, $V$ ) of presheaves.
#! @Arguments ColimitQuiversC
#! @Returns a &CAP; category
DeclareAttribute( "CategoryOfPreSheavesOfUnderlyingCategory",
        IsCategoryOfColimitQuivers );

CapJitAddTypeSignature( "CategoryOfPreSheavesOfUnderlyingCategory", [ IsCategoryOfColimitQuivers ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( CategoryOfPreSheavesOfUnderlyingCategory( input_types[1].category ) );
    
end );
