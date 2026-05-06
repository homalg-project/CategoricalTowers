# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Declarations
#

#! @Chapter Finite strict coproduct completion of an object-finite category

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of finite coproduct completions of object-finite categories.
DeclareCategory( "IsFiniteStrictCoproductCompletionOfObjectFiniteCategory",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a finite coproduct completion of an object-finite category.
DeclareCategory( "IsCellInFiniteStrictCoproductCompletionOfObjectFiniteCategory",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a finite coproduct completion of an object-finite category.
DeclareCategory( "IsObjectInFiniteStrictCoproductCompletionOfObjectFiniteCategory",
        IsCellInFiniteStrictCoproductCompletionOfObjectFiniteCategory and IsCapCategoryObject  );

#! @Description
#!  The &GAP; category of morphisms in a finite coproduct completion of an object-finite category.
DeclareCategory( "IsMorphismInFiniteStrictCoproductCompletionOfObjectFiniteCategory",
        IsCellInFiniteStrictCoproductCompletionOfObjectFiniteCategory and IsCapCategoryMorphism );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Return the finite coproduct completion of the object-finite category <A>cat</A>
#!  in which the cocartesian associators are given by identities.
#! @Arguments cat
DeclareAttribute( "FiniteStrictCoproductCompletionOfObjectFiniteCategory",
        IsCapCategory );
#! @InsertChunk FiniteStrictCoproductCompletionOfObjectFiniteCategory
#! @InsertChunk FiniteStrictCoproductCompletionOfObjectFiniteCategory_poset

#CapJitAddTypeSignature( "FiniteStrictCoproductCompletionOfObjectFiniteCategory", [ IsCapCategory ], function ( input_types )
#    
#    return CapJitDataTypeOfCategory( FiniteStrictCoproductCompletionOfObjectFiniteCategory( input_types[1].category ) );
#    
#end );

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
    
    return ObjectDatumType( input_types[1].category );
    
end );

#!
DeclareAttribute( "TripleOfLists",
        IsMorphismInFiniteStrictCoproductCompletionOfObjectFiniteCategory );

CapJitAddTypeSignature( "TripleOfLists", [ IsMorphismInFiniteStrictCoproductCompletionOfObjectFiniteCategory ],
  function ( input_types )
    
    Assert( 0, IsFiniteStrictCoproductCompletionOfObjectFiniteCategory( input_types[1].category ) );
    
    return MorphismDatumType( input_types[1].category );
    
end );

#! @Description
#!  Return the object-finite category $C$ underlying the finite coproduct completion
#!  category <A>UC</A><C> := FiniteStrictCoproductCompletionOfObjectFiniteCategory(</C> $C$ <C>)</C>).
#! @Arguments UC
DeclareAttribute( "UnderlyingCategory",
        IsFiniteStrictCoproductCompletionOfObjectFiniteCategory );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsFiniteStrictCoproductCompletionOfObjectFiniteCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

#! @Description
#!  Return the set of objects in the object-finite category $C$ underlying the finite coproduct completion
#!  category <A>UC</A><C> := FiniteStrictCoproductCompletionOfObjectFiniteCategory(</C> $C$ <C>)</C>).
#! @Arguments UC
DeclareAttribute( "SetOfObjectsOfUnderlyingCategory",
        IsFiniteStrictCoproductCompletionOfObjectFiniteCategory );

CapJitAddTypeSignature( "SetOfObjectsOfUnderlyingCategory", [ IsFiniteStrictCoproductCompletionOfObjectFiniteCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfListOf( CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) ) );
    
end );

#! @Description
#!  Return the number of objects in the object-finite category $C$ underlying the finite coproduct completion
#!  category <A>UC</A><C> := FiniteStrictCoproductCompletionOfObjectFiniteCategory(</C> $C$ <C>)</C>).
#! @Arguments UC
DeclareAttribute( "NumberOfObjectsOfUnderlyingCategory",
        IsFiniteStrictCoproductCompletionOfObjectFiniteCategory );

CapJitAddTypeSignature( "NumberOfObjectsOfUnderlyingCategory", [ IsFiniteStrictCoproductCompletionOfObjectFiniteCategory ], IsBigInt );

DeclareAttribute( "EmbeddingOfUnderlyingCategoryData",
        IsFiniteStrictCoproductCompletionOfObjectFiniteCategory );

#! @Description
#!  The full embedding functor from the object-finite category $C$ underlying
#!  the finite coproduct completion <A>PC</A> into <A>PC</A>.
#! @Arguments PC
#! @Returns a &CAP; functor
DeclareAttribute( "EmbeddingOfUnderlyingCategory",
        IsFiniteStrictCoproductCompletionOfObjectFiniteCategory );

DeclareOperation( "ExtendFunctorToFiniteStrictCoproductCompletionOfObjectFiniteCategoryData",
        [ IsFiniteStrictCoproductCompletionOfObjectFiniteCategory, IsList, IsCocartesianCategory ] );

#! @Description
#!  The full embedding functor from the object-finite category $C$ underlying
#!  the finite coproduct completion <A>UC</A> into <A>UC</A>.
#! @Arguments PC
#! @Returns a &CAP; functor
DeclareAttribute( "ExtendFunctorToFiniteStrictCoproductCompletionOfObjectFiniteCategory",
        IsCapFunctor );
