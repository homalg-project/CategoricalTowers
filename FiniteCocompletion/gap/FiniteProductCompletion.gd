# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletion: Finite (co)product/(co)limit (co)completions
#
# Declarations
#

#! @Chapter Finite product completion

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of a finite product completion category.
DeclareCategory( "IsFiniteProductCompletion",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a finite product completion category.
DeclareCategory( "IsCellInFiniteProductCompletion",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a finite product completion category.
DeclareCategory( "IsObjectInFiniteProductCompletion",
        IsCellInFiniteProductCompletion and IsCapCategoryObject  );

#! @Description
#!  The &GAP; category of morphisms in a finite product completion category.
DeclareCategory( "IsMorphismInFiniteProductCompletion",
        IsCellInFiniteProductCompletion and IsCapCategoryMorphism );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  Return the finite product completion of the category <A>cat</A>
#!  in which the cartesian associators are given by identities.
#! @Arguments cat
DeclareAttribute( "FiniteProductCompletion",
        IsCapCategory );
#! @InsertChunk TerminalCategory_as_FiniteProductCompletion

#!
DeclareAttribute( "AsList",
        IsObjectInFiniteProductCompletion );

CapJitAddTypeSignature( "AsList", [ IsObjectInFiniteProductCompletion ],
 function ( input_types )

    Assert( 0, IsFiniteProductCompletion( input_types[1].category ) );
    
    return rec( filter := IsList, element_type := CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) ) );
    
end );

#!
DeclareAttribute( "PairOfLists",
        IsMorphismInFiniteProductCompletion );

CapJitAddTypeSignature( "PairOfLists", [ IsMorphismInFiniteProductCompletion ],
 function ( input_types )

    Assert( 0, IsFiniteProductCompletion( input_types[1].category ) );
    
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
#!  Return the category $C$ underlying the finite product completion
#!  category <A>UC</A><C> := FiniteProductCompletion(</C> $C$ <C>)</C>).
#! @Arguments UC
DeclareAttribute( "UnderlyingCategory",
        IsFiniteProductCompletion );

CapJitAddTypeSignature( "UnderlyingCategory", [ IsFiniteProductCompletion ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( UnderlyingCategory( input_types[1].category ) );

end );
