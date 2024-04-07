# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

#! @Chapter Category of closed copresheaves with respect to limiting cones

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of closed copresheaves with respect to limiting cones.
DeclareCategory( "IsClosedCoPreSheavesWRTLimitingCones",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in the category of closed copresheaves with respect to limiting cones.
DeclareCategory( "IsCellInClosedCoPreSheavesWRTLimitingCones",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in the category of closed copresheaves with respect to limiting cones.
DeclareCategory( "IsObjectInClosedCoPreSheavesWRTLimitingCones",
        IsCellInClosedCoPreSheavesWRTLimitingCones and IsCapCategoryObject  );

#! @Description
#!  The &GAP; category of morphisms in the category of closed copresheaves with respect to limiting cones.
DeclareCategory( "IsMorphismInClosedCoPreSheavesWRTLimitingCones",
        IsCellInClosedCoPreSheavesWRTLimitingCones and IsCapCategoryMorphism );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  The input is category <A>C</A> and a list <A>product_cones</A> of product cones in <A>C</A>.
#!  The output is the category of of closed copresheaves with respect to <A>product_cones</A>.
#! @Arguments C, product_cones
DeclareOperation( "ClosedCoPreSheavesWRTProductCones",
        [ IsCapCategory, IsList ] );

#CapJitAddTypeSignature( "ClosedCoPreSheavesWRTProductCones", [ IsCapCategory, IsList ], function ( input_types )
#    
#    return CapJitDataTypeOfCategory( ClosedCoPreSheavesWRTProductCones( input_types[1].category ) );
#    
#end );

#! @Description
#!  The input is category <A>C</A> and a list <A>lists_of_product_cofactors</A> of lists of product cofactors in <A>C</A>.
#!  The output is the category of of closed copresheaves with respect to <A>lists_of_product_cofactors</A>.
#! @Arguments C, lists_of_product_cofactors
DeclareOperation( "ClosedCoPreSheavesWRTProducts",
        [ IsCapCategory, IsList ] );

#CapJitAddTypeSignature( "ClosedCoPreSheavesWRTProducts", [ IsCapCategory, IsList ], function ( input_types )
#    
#    return CapJitDataTypeOfCategory( ClosedCoPreSheavesWRTProducts( input_types[1].category ) );
#    
#end );

#! @Description
#!  The input is category <A>C</A> and a list <A>lists_of_product_cofactors</A> of lists of product cofactors in <A>C</A>.
#!  The output is the category of of closed copresheaves with respect to <A>lists_of_product_cofactors</A>.
#! @Arguments C, lists_of_product_cofactors
DeclareOperation( "ClosedCoPreSheavesWRTProductsByIndices",
        [ IsCapCategory, IsList ] );

#CapJitAddTypeSignature( "ClosedCoPreSheavesWRTProductsByIndices", [ IsCapCategory, IsList ], function ( input_types )
#    
#    return CapJitDataTypeOfCategory( ClosedCoPreSheavesWRTProductsByIndices( input_types[1].category ) );
#    
#end );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The input is the category of closed copresheaves on a category $C$ with respect to a list $L$ of limiting cones in $C$.
#!  The output is the list $L$.
#! @Arguments coPSh_J
DeclareAttribute( "UnderlyingLimitingCones",
        IsClosedCoPreSheavesWRTLimitingCones );

#! @Description
#!  The input is the category of closed copresheaves on a category $C$ with respect to limiting cones in $C$.
#!  The output is the category $C$.
#! @Arguments coPSh_J
DeclareAttribute( "Source",
        IsClosedCoPreSheavesWRTLimitingCones );

CapJitAddTypeSignature( "Source", [ IsClosedCoPreSheavesWRTLimitingCones ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( Source( input_types[1].category ) );
    
end );

#! @Description
#!  The input is the category of closed copresheaves on a category $C$ with respect to limiting cones in $C$.
#!  The output is the target category.
#! @Arguments coPSh_J
DeclareAttribute( "Target",
        IsClosedCoPreSheavesWRTLimitingCones );

CapJitAddTypeSignature( "Target", [ IsClosedCoPreSheavesWRTLimitingCones ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( Target( input_types[1].category ) );
    
end );

DeclareAttribute( "CoYonedaEmbeddingDataOfSourceCategory",
        IsClosedCoPreSheavesWRTLimitingCones );

#! @Arguments coPSh_J
#! @Returns a &CAP; functor
DeclareAttribute( "CoYonedaEmbeddingOfSourceCategory",
        IsClosedCoPreSheavesWRTLimitingCones );
