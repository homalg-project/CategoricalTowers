# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

#! @Chapter The elementary topos of finite quivers

####################################
#
#! @Section &GAP; Categories
#
####################################

#! @Description
#!  The &GAP; category of the category of quivers.
#! @Arguments category
DeclareCategory( "IsCategoryOfQuivers",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in the category of quivers.
#! @Arguments cell
DeclareCategory( "IsCellInCategoryOfQuivers",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in the category of quivers.
#! @Arguments obj
DeclareCategory( "IsObjectInCategoryOfQuivers",
        IsCellInCategoryOfQuivers and
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in the category of quivers.
#! @Arguments mor
DeclareCategory( "IsMorphismInCategoryOfQuivers",
        IsCellInCategoryOfQuivers and
        IsCapCategoryMorphism );

####################################
#
#! @Section Global variables
#
####################################

if false then
#! The category of quivers as a category of presheaves with values in <C>SkeletalFinSets</C>.
DeclareGlobalVariable( "FinQuivers" );
fi;

####################################
#
#! @Section Attributes
#
####################################

#! @Arguments fin_quivers
DeclareAttribute( "UnderlyingCategory",
        IsCategoryOfQuivers );

#! @Arguments fin_quivers
DeclareAttribute( "EmbeddingOfUnderlyingCategory",
        IsCategoryOfQuivers );

DeclareAttribute( "DefiningTripleOfQuiverEnrichedOverSkeletalFinSets",
        IsObjectInCategoryOfQuivers );

CapJitAddTypeSignature( "DefiningTripleOfQuiverEnrichedOverSkeletalFinSets", [ IsObjectInCategoryOfQuivers ], function ( input_types )
    
    Assert( 0, IsCategoryOfQuivers( input_types[1].category ) );
    
    return CapJitDataTypeOfNTupleOf( 3,
                   IsInt,
                   IsInt,
                   CapJitDataTypeOfListOf(
                           CapJitDataTypeOfNTupleOf( 2,
                                   IsInt,
                                   IsInt ) ) );
    
end );

DeclareAttribute( "DefiningPairOfQuiverMorphismEnrichedOverSkeletalFinSets",
        IsObjectInCategoryOfQuivers );

CapJitAddTypeSignature( "DefiningPairOfQuiverMorphismEnrichedOverSkeletalFinSets", [ IsMorphismInCategoryOfQuivers ], function ( input_types )
    
    Assert( 0, IsCategoryOfQuivers( input_types[1].category ) );
    
    return CapJitDataTypeOfNTupleOf( 2,
                   CapJitDataTypeOfListOf( IsInt ),
                   CapJitDataTypeOfListOf( IsInt ) );
    
end );

#! @Arguments quiver
DeclareAttribute( "Arrows",
        IsObjectInCategoryOfQuivers );

#! @Arguments cell
DeclareAttribute( "SvgString",
        IsCellInCategoryOfQuivers );

#! @Arguments cell
DeclareOperation( "DotVertexLabeledDigraph",
        [ IsCellInCategoryOfQuivers ] );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct the category of quivers enriched over the category <A>V</A>.
#! @Returns a &CAP; category
#! @Arguments V
DeclareAttribute( "CategoryOfQuiversEnrichedOver",
        IsCapCategory );

#!
DeclareOperation( "CreateQuiver",
        [ IsCategoryOfQuivers, IsInt, IsList ] );

#!
DeclareOperation( "CreateQuiver",
        [ IsInt, IsList ] );

#!
DeclareOperation( "CreateQuiverMorphism",
        [ IsObjectInCategoryOfQuivers, IsList, IsList, IsObjectInCategoryOfQuivers ] );

#!
DeclareOperation( "Subobject",
        [ IsObjectInCategoryOfQuivers, IsList, IsList ] );

#!
DeclareOperation( "Subobject",
        [ IsObjectInCategoryOfQuivers, IsList ] );
