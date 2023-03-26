# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletion: Finite (co)product/(co)limit (co)completions
#
# Declarations
#

#! @Chapter The finite colimit cocompletion (with strict coproducts) of a category

####################################
#
#! @Section &GAP; Categories
#
####################################

#! @Description
#!  The &GAP; category of finite colimit cocompletions (with strict coproducts) of categories.
#! @Arguments category
DeclareCategory( "IsFiniteColimitCocompletionWithStrictCoproducts",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in the finite colimit cocompletion (with strict coproducts) of a category.
#! @Arguments cell
DeclareCategory( "IsCellInFiniteColimitCocompletionWithStrictCoproducts",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in the finite colimit cocompletion (with strict coproducts) of a category.
#! @Arguments obj
DeclareCategory( "IsObjectInFiniteColimitCocompletionWithStrictCoproducts",
        IsCellInFiniteColimitCocompletionWithStrictCoproducts and
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in the finite colimit cocompletion (with strict coproducts) of a category.
#! @Arguments mor
DeclareCategory( "IsMorphismInFiniteColimitCocompletionWithStrictCoproducts",
        IsCellInFiniteColimitCocompletionWithStrictCoproducts and
        IsCapCategoryMorphism );

####################################
#
#! @Section Attributes
#
####################################

#! @Arguments colimit_quiver
DeclareAttribute( "DefiningPairOfColimitQuiver",
        IsObjectInFiniteColimitCocompletionWithStrictCoproducts );

CapJitAddTypeSignature( "DefiningPairOfColimitQuiver", [ IsObjectInFiniteColimitCocompletionWithStrictCoproducts ],
  function ( input_types )
    
    Assert( 0, IsFiniteColimitCocompletionWithStrictCoproducts( input_types[1].category ) );
    
    return rec( filter := IsNTuple,
                element_types :=
                [ rec( filter := IsList,
                       element_type := CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) ) ),
                  rec( filter := IsList,
                       element_type :=
                       rec( filter := IsNTuple,
                            element_types :=
                            [ rec( filter := IsInt ),
                              CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( input_types[1].category ) ),
                              rec( filter := IsInt ) ] ) ) ] );
    
end );

#! @Arguments colimit_quiver_morphism
DeclareAttribute( "DefiningPairOfColimitQuiverMorphism",
        IsMorphismInFiniteColimitCocompletionWithStrictCoproducts );

CapJitAddTypeSignature( "DefiningPairOfColimitQuiverMorphism", [ IsMorphismInFiniteColimitCocompletionWithStrictCoproducts ],
  function ( input_types )
    
    Assert( 0, IsFiniteColimitCocompletionWithStrictCoproducts( input_types[1].category ) );
    
    return rec( filter := IsNTuple,
                element_types :=
                [ rec( filter := IsNTuple,
                       element_types :=
                       [ rec( filter := IsList,
                              element_type := rec( filter := IsInt ) ),
                         rec( filter := IsList,
                              element_type := CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) ) ) ] ),
                  rec( filter := IsList,
                       element_type := rec( filter := IsInt ) ) ] );
    
end );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct the finite colimit cocompletion (with strict coproducts) of the category <A>C</A>.
#! @Returns a &CAP; category
#! @Arguments C
DeclareAttribute( "FiniteColimitCocompletionWithStrictCoproducts",
        IsCapCategory );
#! @InsertChunk FinBouquetsAsFiniteColimitCocompletion
#! @InsertChunk FinReflexiveQuiversAsFiniteColimitCocompletion

CapJitAddTypeSignature( "FiniteColimitCocompletionWithStrictCoproducts", [ IsCapCategory ], function ( input_types )
    
    return CapJitDataTypeOfCategory( FiniteColimitCocompletionWithStrictCoproducts( input_types[1].category ) );
    
end );

#!
DeclareOperation( "CreateColimitQuiver",
        [ IsFiniteColimitCocompletionWithStrictCoproducts, IsList ] );

#!
DeclareOperation( "CreateMorphismOfColimitQuivers",
        [ IsObjectInFiniteColimitCocompletionWithStrictCoproducts, IsList ] );

#! @Description
#!  Given the presheaf category <A>PSh</A>=<C>PSh</C>($C,V$) return
#!  the equivalent category <C>FiniteColimitCocompletionWithStrictCoproducts</C>( $C$ ).
#! @Arguments PSh
#! @Returns a &CAP; category
DeclareAttribute( "AssociatedFiniteColimitCocompletionWithStrictCoproductsOfSourceCategory",
        IsPreSheafCategory );

CapJitAddTypeSignature( "AssociatedFiniteColimitCocompletionWithStrictCoproductsOfSourceCategory", [ IsPreSheafCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( FiniteColimitCocompletionWithStrictCoproducts( Source( input_types[1].category ) ) );
    
end );
