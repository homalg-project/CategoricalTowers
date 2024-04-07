# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

#! @Chapter Category of closed presheaves with respect to colimiting cocones

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of closed presheaves with respect to colimiting cocones.
DeclareCategory( "IsClosedPreSheavesWRTColimitingCocones",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in the category of closed presheaves with respect to colimiting cocones.
DeclareCategory( "IsCellInClosedPreSheavesWRTColimitingCocones",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in the category of closed presheaves with respect to colimiting cocones.
DeclareCategory( "IsObjectInClosedPreSheavesWRTColimitingCocones",
        IsCellInClosedPreSheavesWRTColimitingCocones and IsCapCategoryObject  );

#! @Description
#!  The &GAP; category of morphisms in the category of closed presheaves with respect to colimiting cocones.
DeclareCategory( "IsMorphismInClosedPreSheavesWRTColimitingCocones",
        IsCellInClosedPreSheavesWRTColimitingCocones and IsCapCategoryMorphism );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  The input is category <A>C</A> and a list <A>coproduct_cocones</A> of coproduct cocones in <A>C</A>.
#!  The output is the category of of closed presheaves with respect to <A>coproduct_cocones</A>.
#! @Arguments C, coproduct_cocones
DeclareOperation( "ClosedPreSheavesWRTCoproductCocones",
        [ IsCapCategory, IsList ] );

#CapJitAddTypeSignature( "ClosedPreSheavesWRTCoproductCocones", [ IsCapCategory, IsList ], function ( input_types )
#    
#    return CapJitDataTypeOfCategory( ClosedPreSheavesWRTCoproductCocones( input_types[1].category ) );
#    
#end );

#! @Description
#!  The input is category <A>C</A> and a list <A>lists_of_coproduct_cofactors</A> of lists of coproduct cofactors in <A>C</A>.
#!  The output is the category of of closed presheaves with respect to <A>lists_of_coproduct_cofactors</A>.
#! @Arguments C, lists_of_coproduct_cofactors
DeclareOperation( "ClosedPreSheavesWRTCoproducts",
        [ IsCapCategory, IsList ] );

#CapJitAddTypeSignature( "ClosedPreSheavesWRTCoproducts", [ IsCapCategory, IsList ], function ( input_types )
#    
#    return CapJitDataTypeOfCategory( ClosedPreSheavesWRTCoproducts( input_types[1].category ) );
#    
#end );

#! @Description
#!  The input is category <A>C</A> and a list <A>lists_of_coproduct_cofactors</A> of lists of coproduct cofactors in <A>C</A>.
#!  The output is the category of of closed presheaves with respect to <A>lists_of_coproduct_cofactors</A>.
#! @Arguments C, lists_of_coproduct_cofactors
DeclareOperation( "ClosedPreSheavesWRTCoproductsByIndices",
        [ IsCapCategory, IsList ] );

#CapJitAddTypeSignature( "ClosedPreSheavesWRTCoproductsByIndices", [ IsCapCategory, IsList ], function ( input_types )
#    
#    return CapJitDataTypeOfCategory( ClosedPreSheavesWRTCoproductsByIndices( input_types[1].category ) );
#    
#end );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The input is the category of closed presheaves on a category $C$ with respect to a list $L$ of colimiting cocones in $C$.
#!  The output is the list $L$.
#! @Arguments PSh_J
DeclareAttribute( "UnderlyingColimitingCocones",
        IsClosedPreSheavesWRTColimitingCocones );

#! @Description
#!  The input is the category of closed presheaves on a category $C$ with respect to colimiting cocones in $C$.
#!  The output is the category $C$.
#! @Arguments PSh_J
DeclareAttribute( "Source",
        IsClosedPreSheavesWRTColimitingCocones );

CapJitAddTypeSignature( "Source", [ IsClosedPreSheavesWRTColimitingCocones ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( Source( input_types[1].category ) );
    
end );

#! @Description
#!  The input is the category of closed presheaves on a category $C$ with respect to colimiting cocones in $C$.
#!  The output is the target category.
#! @Arguments PSh_J
DeclareAttribute( "Target",
        IsClosedPreSheavesWRTColimitingCocones );

CapJitAddTypeSignature( "Target", [ IsClosedPreSheavesWRTColimitingCocones ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( Target( input_types[1].category ) );
    
end );

DeclareAttribute( "YonedaEmbeddingDataOfSourceCategory",
        IsClosedPreSheavesWRTColimitingCocones );

#! @Arguments PSh_J
#! @Returns a &CAP; functor
DeclareAttribute( "YonedaEmbeddingOfSourceCategory",
        IsClosedPreSheavesWRTColimitingCocones );

####################################
#
#! @Section Operations
#
####################################

#! @Arguments PSh, presheaf, coproducts_cocones
DeclareOperation( "IsClosedPreSheafWRTCoproductCocones",
        [ IsObjectInPreSheafCategory, IsList ] );

#! @Arguments PSh, presheaf, lists_of_coproduct_cofactors
DeclareOperation( "IsClosedPreSheafWRTCoproducts",
        [ IsObjectInPreSheafCategory, IsList ] );

#! @Arguments presheaf, lists_of_indices
DeclareOperation( "IsClosedPreSheafWRTCoproductsByIndices",
        [ IsObjectInPreSheafCategory, IsList ] );

#! @Arguments presheaf, coproduct_cocone
DeclareOperation( "EmbeddingIntoClosureOfPreSheafWRTCoproductCocone",
        [ IsObjectInPreSheafCategory, IsList ] );

#! @Arguments presheaf, coproducts_cocones
DeclareOperation( "EmbeddingIntoClosureOfPreSheafWRTCoproductCocones",
        [ IsObjectInPreSheafCategory, IsList ] );

#! @Arguments presheaf, lists_of_coproduct_cofactors
DeclareOperation( "EmbeddingIntoClosureOfPreSheafWRTCoproducts",
        [ IsObjectInPreSheafCategory, IsList ] );

#! @Arguments PSh, coproducts_cocones
DeclareOperation( "ClosureOfPreSheavesWRTCoproductCocones",
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsList ] );

#! @Arguments PSh, lists_of_coproduct_cofactors
DeclareOperation( "ClosureOfPreSheavesWRTCoproducts",
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsList ] );
