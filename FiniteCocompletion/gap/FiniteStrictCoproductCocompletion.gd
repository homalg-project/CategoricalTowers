# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletion: Finite (co)product/(co)limit (co)completions
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
#!  The &GAP; category of a finite coproduct cocompletion category.
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
#! @InsertChunk TerminalCategory_as_FiniteStrictCoproductCocompletion

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
    
    return rec( filter := IsNTuple,
                element_types :=
                [ rec( filter := IsInt ),
                  rec( filter := IsList,
                       element_type := CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) ) ) ] );
    
end );

#!
DeclareAttribute( "PairOfLists",
        IsMorphismInFiniteStrictCoproductCocompletion );

CapJitAddTypeSignature( "PairOfLists", [ IsMorphismInFiniteStrictCoproductCocompletion ],
 function ( input_types )

    Assert( 0, IsFiniteStrictCoproductCocompletion( input_types[1].category ) );
    
    return rec( filter := IsNTuple,
                element_types :=
                [ rec( filter := IsList,
                       element_type := rec( filter := IsInt ) ),
                  rec( filter := IsList,
                       element_type := CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ) ) ] );
    
end );

#! @Description
#!  Return the category $C$ underlying the finite coproduct cocompletion
#!  category <A>UC</A><C> := FiniteStrictCoproductCocompletion(</C> $C$ <C>)</C>).
#! @Arguments UC
DeclareAttribute( "UnderlyingCategory",
        IsFiniteStrictCoproductCocompletion );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsFiniteStrictCoproductCocompletion ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );
    
end );

#! @Description
#!  The full embedding functor from the category $C$ underlying
#!  the finite coproduct cocompletion <A>UC</A> into <A>UC</A>.
#! @Arguments UC
#! @Returns a &CAP; functor
DeclareAttribute( "YonedaEmbeddingOfUnderlyingCategory",
        IsFiniteStrictCoproductCocompletion );

#! @Description
#!  The full embedding functor from the category $C$ underlying
#!  the finite coproduct cocompletion <A>UC</A> into <A>UC</A>.
#! @Arguments UC
#! @Returns a &CAP; functor
DeclareAttribute( "ExtendFunctorToFiniteStrictCoproductCocompletion",
        IsCapFunctor );
