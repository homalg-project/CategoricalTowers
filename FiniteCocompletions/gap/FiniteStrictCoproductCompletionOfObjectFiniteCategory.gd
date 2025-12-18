# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Declarations
#

#! @Chapter Finite strict product completion

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of finite product completion categories.
DeclareCategory( "IsFiniteStrictCoproductCompletionOfObjectFiniteCategory",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a finite product completion category.
DeclareCategory( "IsCellInFiniteStrictCoproductCompletionOfObjectFiniteCategory",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a finite product completion category.
DeclareCategory( "IsObjectInFiniteStrictCoproductCompletionOfObjectFiniteCategory",
        IsCellInFiniteStrictCoproductCompletionOfObjectFiniteCategory and IsCapCategoryObject  );

#! @Description
#!  The &GAP; category of morphisms in a finite product completion category.
DeclareCategory( "IsMorphismInFiniteStrictCoproductCompletionOfObjectFiniteCategory",
        IsCellInFiniteStrictCoproductCompletionOfObjectFiniteCategory and IsCapCategoryMorphism );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Return the finite product completion of the category <A>cat</A>
#!  in which the cartesian associators are given by identities.
#! @Arguments cat
DeclareAttribute( "FiniteStrictCoproductCompletionOfObjectFiniteCategory",
        IsCapCategory );
#! @InsertChunk FiniteStrictCoproductCompletionOfObjectFiniteCategory

CapJitAddTypeSignature( "FiniteStrictCoproductCompletionOfObjectFiniteCategory", [ IsCapCategory ], function ( input_types )
    
    return CapJitDataTypeOfCategory( FiniteStrictCoproductCompletionOfObjectFiniteCategory( input_types[1].category ) );
    
end );

####################################
#
#! @Section Attributes
#
####################################

#!
DeclareAttribute( "PairOfIntAndList",
        IsObjectInFiniteStrictCoproductCompletionOfObjectFiniteCategory );

CapJitAddTypeSignature( "PairOfIntAndList", [ IsObjectInFiniteStrictCoproductCompletionOfObjectFiniteCategory ],
 function ( input_types )
    
    Assert( 0, IsFiniteStrictCoproductCompletionOfObjectFiniteCategory( input_types[1].category ) );
    
    return CapJitDataTypeOfNTupleOf( 2,
                   IsBigInt,
                   CapJitDataTypeOfListOf( IsBigInt ) );
    
end );

#!
DeclareAttribute( "PairOfLists",
        IsMorphismInFiniteStrictCoproductCompletionOfObjectFiniteCategory );

CapJitAddTypeSignature( "PairOfLists", [ IsMorphismInFiniteStrictCoproductCompletionOfObjectFiniteCategory ],
 function ( input_types )
    
    Assert( 0, IsFiniteStrictCoproductCompletionOfObjectFiniteCategory( input_types[1].category ) );
    
    return CapJitDataTypeOfNTupleOf( 2,
                   CapJitDataTypeOfListOf( IsBigInt ),
                   CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ) ) );
    
end );

#! @Description
#!  Return the category $C$ underlying the finite product completion
#!  category <A>UC</A><C> := FiniteStrictCoproductCompletionOfObjectFiniteCategory(</C> $C$ <C>)</C>).
#! @Arguments UC
DeclareAttribute( "UnderlyingCategory",
        IsFiniteStrictCoproductCompletionOfObjectFiniteCategory );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsFiniteStrictCoproductCompletionOfObjectFiniteCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );

end );

#! @Description
#!  Return the number of objects in the category $C$ underlying the finite product completion
#!  category <A>UC</A><C> := FiniteStrictCoproductCompletionOfObjectFiniteCategory(</C> $C$ <C>)</C>).
#! @Arguments UC
DeclareAttribute( "NumberOfObjectsOfUnderlyingCategory",
        IsFiniteStrictCoproductCompletionOfObjectFiniteCategory );

CapJitAddTypeSignature( "NumberOfObjectsOfUnderlyingCategory", [ IsFiniteStrictCoproductCompletionOfObjectFiniteCategory ],
  function ( input_types )
    
    return IsBigInt;

end );

DeclareAttribute( "EmbeddingOfUnderlyingCategoryData",
        IsFiniteStrictCoproductCompletionOfObjectFiniteCategory );

#! @Description
#!  The full embedding functor from the category $C$ underlying
#!  the finite product completion <A>PC</A> into <A>PC</A>.
#! @Arguments PC
#! @Returns a &CAP; functor
DeclareAttribute( "EmbeddingOfUnderlyingCategory",
        IsFiniteStrictCoproductCompletionOfObjectFiniteCategory );

DeclareOperation( "ExtendFunctorToFiniteStrictCoproductCompletionOfObjectFiniteCategoryData",
        [ IsFiniteStrictCoproductCompletionOfObjectFiniteCategory, IsList, IsCocartesianCategory ] );

#! @Description
#!  The full embedding functor from the category $C$ underlying
#!  the finite product completion <A>UC</A> into <A>UC</A>.
#! @Arguments PC
#! @Returns a &CAP; functor
DeclareAttribute( "ExtendFunctorToFiniteStrictCoproductCompletionOfObjectFiniteCategory",
        IsCapFunctor );
