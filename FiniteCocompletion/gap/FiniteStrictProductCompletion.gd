# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletion: Finite (co)product/(co)limit (co)completions
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
DeclareCategory( "IsFiniteStrictProductCompletion",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a finite product completion category.
DeclareCategory( "IsCellInFiniteStrictProductCompletion",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a finite product completion category.
DeclareCategory( "IsObjectInFiniteStrictProductCompletion",
        IsCellInFiniteStrictProductCompletion and IsCapCategoryObject  );

#! @Description
#!  The &GAP; category of morphisms in a finite product completion category.
DeclareCategory( "IsMorphismInFiniteStrictProductCompletion",
        IsCellInFiniteStrictProductCompletion and IsCapCategoryMorphism );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Return the finite product completion of the category <A>cat</A>
#!  in which the cartesian associators are given by identities.
#! @Arguments cat
DeclareAttribute( "FiniteStrictProductCompletion",
        IsCapCategory );
#! @InsertChunk TerminalCategory_as_FiniteStrictProductCompletion

CapJitAddTypeSignature( "FiniteStrictProductCompletion", [ IsCapCategory ], function ( input_types )
    
    return CapJitDataTypeOfCategory( FiniteStrictProductCompletion( input_types[1].category ) );
    
end );

####################################
#
#! @Section Attributes
#
####################################

#!
DeclareAttribute( "PairOfIntAndList",
        IsObjectInFiniteStrictProductCompletion );

CapJitAddTypeSignature( "PairOfIntAndList", [ IsObjectInFiniteStrictProductCompletion ],
 function ( input_types )
    
    Assert( 0, IsFiniteStrictProductCompletion( input_types[1].category ) );
    
    return rec( filter := IsNTuple,
                element_types :=
                [ rec( filter := IsInt ),
                  rec( filter := IsList,
                       element_type := CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ) ) ] );
    
end );

#!
DeclareAttribute( "PairOfLists",
        IsMorphismInFiniteStrictProductCompletion );

CapJitAddTypeSignature( "PairOfLists", [ IsMorphismInFiniteStrictProductCompletion ],
 function ( input_types )

    Assert( 0, IsFiniteStrictProductCompletion( input_types[1].category ) );
    
    return rec( filter := IsNTuple,
                element_types :=
                [ rec( filter := IsList,
                       element_type := rec( filter := IsInt ) ),
                  rec( filter := IsList,
                       element_type := CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ) ) ] );
    
end );

#! @Description
#!  Return the category $C$ underlying the finite product completion
#!  category <A>UC</A><C> := FiniteStrictProductCompletion(</C> $C$ <C>)</C>).
#! @Arguments UC
DeclareAttribute( "UnderlyingCategory",
        IsFiniteStrictProductCompletion );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsFiniteStrictProductCompletion ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );

end );

#! @Description
#!  The full embedding functor from the category $C$ underlying
#!  the finite product completion <A>PC</A> into <A>PC</A>.
#! @Arguments PC
#! @Returns a &CAP; functor
DeclareAttribute( "CoYonedaEmbeddingOfUnderlyingCategory",
        IsFiniteStrictProductCompletion );

#! @Description
#!  The full embedding functor from the category $C$ underlying
#!  the finite product completion <A>UC</A> into <A>UC</A>.
#! @Arguments PC
#! @Returns a &CAP; functor
DeclareAttribute( "ExtendFunctorToFiniteStrictProductCompletion",
        IsCapFunctor );
