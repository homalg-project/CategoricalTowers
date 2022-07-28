# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletion: Finite (co)product/(co)limit (co)completions
#
# Declarations
#

#! @Chapter Finite coproduct cocompletion

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of a finite coproduct cocompletion category.
DeclareCategory( "IsFiniteCoproductCocompletion",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a finite coproduct cocompletion category.
DeclareCategory( "IsCellInFiniteCoproductCocompletion",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a finite coproduct cocompletion category.
DeclareCategory( "IsObjectInFiniteCoproductCocompletion",
        IsCellInFiniteCoproductCocompletion and IsCapCategoryObject  );

#! @Description
#!  The &GAP; category of morphisms in a finite coproduct cocompletion category.
DeclareCategory( "IsMorphismInFiniteCoproductCocompletion",
        IsCellInFiniteCoproductCocompletion and IsCapCategoryMorphism );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Return the finite coproduct cocompletion of the category <A>cat</A>.
#! @Arguments cat
DeclareAttribute( "FiniteCoproductCocompletion",
        IsCapCategory );
#! @InsertChunk TerminalCategory_as_FiniteCoproductCocompletion

#!
DeclareAttribute( "AsList",
        IsObjectInFiniteCoproductCocompletion );

CapJitAddTypeSignature( "AsList", [ IsObjectInFiniteCoproductCocompletion ],
 function ( input_types )

    Assert( 0, IsFiniteCoproductCocompletion( input_types[1].category ) );
    
    return rec( filter := IsList, element_type := CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) ) );
    
end );

#!
DeclareAttribute( "PairOfLists",
        IsMorphismInFiniteCoproductCocompletion );

CapJitAddTypeSignature( "PairOfLists", [ IsMorphismInFiniteCoproductCocompletion ],
 function ( input_types )

    Assert( 0, IsFiniteCoproductCocompletion( input_types[1].category ) );
    
    return rec( filter := IsNTuple,
                element_types :=
                [ rec( filter := IsList,
                       element_type := rec( filter := IsInt ) ),
                  rec( filter := IsList,
                       element_type := CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ) ) ] );
    
end );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  Return the category $C$ underlying the finite coproduct cocompletion
#!  category <A>UC</A><C> := FiniteCoproductCocompletion(</C> $C$ <C>)</C>).
#! @Arguments UC
DeclareAttribute( "UnderlyingCategory",
        IsFiniteCoproductCocompletion );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsFiniteCoproductCocompletion ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );

end );
