# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Declarations
#

#! @Chapter Finite strict coproduct cocompletion

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of finite coproduct cocompletion categories.
DeclareCategory( "IsFiniteStrictCoproductCompletion",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a finite coproduct cocompletion category.
DeclareCategory( "IsCellInFiniteStrictCoproductCompletion",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a finite coproduct cocompletion category.
DeclareCategory( "IsObjectInFiniteStrictCoproductCompletion",
        IsCellInFiniteStrictCoproductCompletion and IsCapCategoryObject  );

#! @Description
#!  The &GAP; category of morphisms in a finite coproduct cocompletion category.
DeclareCategory( "IsMorphismInFiniteStrictCoproductCompletion",
        IsCellInFiniteStrictCoproductCompletion and IsCapCategoryMorphism );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Return the finite coproduct cocompletion of the category <A>cat</A>
#!  in which the cocartesian associators are given by identities.
#! @Arguments cat
DeclareAttribute( "FiniteStrictCoproductCompletion",
        IsCapCategory );
#! @InsertChunk TerminalCategory_as_FiniteStrictCoproductCompletion

CapJitAddTypeSignature( "FiniteStrictCoproductCompletion", [ IsCapCategory ], function ( input_types )
    
    return CapJitDataTypeOfCategory( FiniteStrictCoproductCompletion( input_types[1].category ) );
    
end );

DeclareAttribute( "EnrichmentSpecificFiniteStrictCoproductCompletion",
        IsCapCategory );

CapJitAddTypeSignature( "EnrichmentSpecificFiniteStrictCoproductCompletion", [ IsCapCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( EnrichmentSpecificFiniteStrictCoproductCompletion( input_types[1].category ) );
    
end );

####################################
#
#! @Section Attributes
#
####################################

#!
DeclareAttribute( "PairOfIntAndList",
        IsObjectInFiniteStrictCoproductCompletion );

CapJitAddTypeSignature( "PairOfIntAndList", [ IsObjectInFiniteStrictCoproductCompletion ],
 function ( input_types )

    Assert( 0, IsFiniteStrictCoproductCompletion( input_types[1].category ) );
    
    return CapJitDataTypeOfNTupleOf( 2,
                   IsInt,
                   CapJitDataTypeOfListOf( CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) ) ) );
    
end );

#!
DeclareAttribute( "PairOfLists",
        IsMorphismInFiniteStrictCoproductCompletion );

CapJitAddTypeSignature( "PairOfLists", [ IsMorphismInFiniteStrictCoproductCompletion ],
 function ( input_types )

    Assert( 0, IsFiniteStrictCoproductCompletion( input_types[1].category ) );
    
    return CapJitDataTypeOfNTupleOf( 2,
                   CapJitDataTypeOfListOf( IsInt ),
                   CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ) ) );
    
end );

#! @Description
#!  Return the category $C$ underlying the finite coproduct cocompletion
#!  category <A>UC</A> := <C>FiniteStrictCoproductCompletion</C>( $C$ ).
#! @Arguments UC
DeclareAttribute( "UnderlyingCategory",
        IsFiniteStrictCoproductCompletion );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsFiniteStrictCoproductCompletion ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

DeclareAttribute( "EmbeddingOfUnderlyingCategoryData",
        IsFiniteStrictCoproductCompletion );

#! @Description
#!  The full embedding functor from the category $C$ underlying
#!  the finite coproduct cocompletion <A>UC</A> into <A>UC</A>.
#! @Arguments UC
#! @Returns a &CAP; functor
DeclareAttribute( "EmbeddingOfUnderlyingCategory",
        IsFiniteStrictCoproductCompletion );

DeclareOperation( "ExtendFunctorToFiniteStrictCoproductCompletionData",
        [ IsFiniteStrictCoproductCompletion, IsList, IsCocartesianCategory ] );

#! @Description
#!  The full embedding functor from the category $C$ underlying
#!  the finite coproduct cocompletion <A>UC</A> into <A>UC</A>.
#! @Arguments UC
#! @Returns a &CAP; functor
DeclareAttribute( "ExtendFunctorToFiniteStrictCoproductCompletion",
        IsCapFunctor );

#! @Description
#!  Extend (i.e., lift) the (full) embedding the category <A>C</A> into <C>PreSheaves</C>( <A>C</A> ) to
#!  the full embedding of <C>FiniteStrictCoproductCompletion</C>( <A>C</A> ) into <C>PreSheaves</C>( <A>C</A> ).
#! @Arguments C
#! @Returns a &CAP; functor
DeclareAttribute( "ExtendEmbeddingToFiniteStrictCoproductCompletion",
        IsCapCategory );
