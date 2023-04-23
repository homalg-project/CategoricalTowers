# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletion: Finite (co)product/(co)limit (co)completions
#
# Declarations
#

#! @Chapter The category of colimit quivers in a category

####################################
#
#! @Section GAP Categories
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

#! @Arguments colimit_quiver
DeclareAttribute( "DefiningPairOfColimitQuiver",
        IsObjectInCategoryOfColimitQuivers );

CapJitAddTypeSignature( "DefiningPairOfColimitQuiver", [ IsObjectInCategoryOfColimitQuivers ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfColimitQuivers( input_types[1].category ) );
    
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
        IsMorphismInCategoryOfColimitQuivers );

CapJitAddTypeSignature( "DefiningPairOfColimitQuiverMorphism", [ IsMorphismInCategoryOfColimitQuivers ],
  function ( input_types )
    
    Assert( 0, IsCategoryOfColimitQuivers( input_types[1].category ) );
    
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
#!  Construct the category colimit quivers in the category <A>C</A>.
#! @Returns a &CAP; category
#! @Arguments C
DeclareAttribute( "CategoryOfColimitQuivers",
        IsCapCategory );
#! @InsertChunk FinBouquetsAsFiniteColimitCocompletion
#! @InsertChunk FinReflexiveQuiversAsFiniteColimitCocompletion

CapJitAddTypeSignature( "CategoryOfColimitQuivers", [ IsCapCategory ], function ( input_types )
    
    return CapJitDataTypeOfCategory( CategoryOfColimitQuivers( input_types[1].category ) );
    
end );

#!
DeclareOperation( "CreateColimitQuiver",
        [ IsCategoryOfColimitQuivers, IsList ] );

#!
DeclareOperation( "CreateMorphismOfColimitQuivers",
        [ IsObjectInCategoryOfColimitQuivers, IsList ] );

#! @Description
#!  Given the presheaf category <A>PSh</A>=<C>PSh</C>($C,V$) return
#!  the equivalent category <C>CategoryOfColimitQuivers</C>( $C$ ).
#! @Arguments PSh
#! @Returns a &CAP; category
DeclareAttribute( "AssociatedCategoryOfColimitQuiversOfSourceCategory",
        IsPreSheafCategory );

CapJitAddTypeSignature( "AssociatedCategoryOfColimitQuiversOfSourceCategory", [ IsPreSheafCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( CategoryOfColimitQuivers( Source( input_types[1].category ) ) );
    
end );

#! @Description
#!  Return the category $C$ underlying the category of colimit quivers
#!  <A>ColimitQuivers</A><C> := CategoryOfColimitQuivers(</C> $C$ <C>)</C>).
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
DeclareAttribute( "YonedaEmbeddingOfUnderlyingCategory",
        IsCategoryOfColimitQuivers );
