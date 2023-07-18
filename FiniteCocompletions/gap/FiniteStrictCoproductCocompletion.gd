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
DeclareCategory( "IsFiniteStrictCoproductCocompletion",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a finite coproduct cocompletion category.
DeclareCategory( "IsCellInFiniteStrictCoproductCocompletion",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a finite coproduct cocompletion category.
DeclareCategory( "IsObjectInFiniteStrictCoproductCocompletion",
        IsCellInFiniteStrictCoproductCocompletion and IsCapCategoryObject  );

#! @Description
#!  The &GAP; category of morphisms in a finite coproduct cocompletion category.
DeclareCategory( "IsMorphismInFiniteStrictCoproductCocompletion",
        IsCellInFiniteStrictCoproductCocompletion and IsCapCategoryMorphism );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Return the finite coproduct cocompletion of the category <A>cat</A>
#!  in which the cocartesian associators are given by identities.
#! @Arguments cat
DeclareAttribute( "FiniteStrictCoproductCocompletion",
        IsCapCategory );
#! @InsertChunk LeftCartesianDistributivityExpanding
#! @InsertChunk TerminalCategory_as_FiniteStrictCoproductCocompletion

CapJitAddTypeSignature( "FiniteStrictCoproductCocompletion", [ IsCapCategory ], IsFiniteStrictCoproductCocompletion );

####################################
#
#! @Section Attributes
#
####################################

#!
DeclareAttribute( "PairOfIntAndList",
        IsObjectInFiniteStrictCoproductCocompletion );

CapJitAddTypeSignature( "PairOfIntAndList", [ IsObjectInFiniteStrictCoproductCocompletion ],
 function ( input_types )

    Assert( 0, IsFiniteStrictCoproductCocompletion( input_types[1].category ) );
    
    return CapJitDataTypeOfNTupleOf( 2,
                   rec( filter := IsInt ),
                   CapJitDataTypeOfListOf( CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) ) ) );
    
end );

#!
DeclareAttribute( "PairOfLists",
        IsMorphismInFiniteStrictCoproductCocompletion );

CapJitAddTypeSignature( "PairOfLists", [ IsMorphismInFiniteStrictCoproductCocompletion ],
 function ( input_types )

    Assert( 0, IsFiniteStrictCoproductCocompletion( input_types[1].category ) );
    
    return CapJitDataTypeOfNTupleOf( 2,
                   CapJitDataTypeOfListOf( rec( filter := IsInt ) ),
                   CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ) ) );
    
end );

#! @Description
#!  Return the category $C$ underlying the finite coproduct cocompletion
#!  category <A>UC</A> := <C>FiniteStrictCoproductCocompletion</C>( $C$ ).
#! @Arguments UC
DeclareAttribute( "UnderlyingCategory",
        IsFiniteStrictCoproductCocompletion );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsFiniteStrictCoproductCocompletion ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

DeclareAttribute( "YonedaEmbeddingOfUnderlyingCategoryData",
        IsFiniteStrictCoproductCocompletion );

#! @Description
#!  The full embedding functor from the category $C$ underlying
#!  the finite coproduct cocompletion <A>UC</A> into <A>UC</A>.
#! @Arguments UC
#! @Returns a &CAP; functor
DeclareAttribute( "YonedaEmbeddingOfUnderlyingCategory",
        IsFiniteStrictCoproductCocompletion );

DeclareOperation( "ExtendFunctorToFiniteStrictCoproductCocompletionData",
        [ IsCapCategory, IsList, IsCapCategory ] );

#! @Description
#!  The full embedding functor from the category $C$ underlying
#!  the finite coproduct cocompletion <A>UC</A> into <A>UC</A>.
#! @Arguments UC
#! @Returns a &CAP; functor
DeclareAttribute( "ExtendFunctorToFiniteStrictCoproductCocompletion",
        IsCapFunctor );

#! @Description
#!  Extend (i.e., lift) the (full) Yoneda embedding the category <A>C</A> into <C>PreSheaves</C>( <A>C</A> ) to
#!  the full embedding of <C>FiniteStrictCoproductCocompletion</C>( <A>C</A> ) into <C>PreSheaves</C>( <A>C</A> ).
#! @Arguments C
#! @Returns a &CAP; functor
DeclareAttribute( "ExtendYonedaEmbeddingToFiniteStrictCoproductCocompletion",
        IsCapCategory );
