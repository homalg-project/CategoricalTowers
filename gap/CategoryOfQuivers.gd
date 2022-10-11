# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

#! @Chapter The category of finite quivers

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
#! The quiver generating the category of quivers
DeclareGlobalVariable( "QuiverOfCategoryOfQuivers" );

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
DeclareAttribute( "YonedaEmbeddingOfUnderlyingCategory",
        IsCategoryOfQuivers );

DeclareAttribute( "DefiningTripleOfQuiver",
        IsObjectInCategoryOfQuivers );

CapJitAddTypeSignature( "DefiningTripleOfQuiver", [ IsObjectInCategoryOfQuivers ], function ( input_types )
    
    Assert( 0, IsCategoryOfQuivers( input_types[1].category ) );
    
    return rec( filter := IsNTuple,
                element_types := [
                        rec( filter := IsInt ),
                        rec( filter := IsInt ),
                        rec( filter := IsList,
                             element_type := rec(
                                     filter := IsNTuple,
                                     element_types := [ rec( filter := IsInt ), rec( filter := IsInt ) ] ) ) ] );
    
end );

DeclareAttribute( "DefiningPairOfQuiverMorphism",
        IsObjectInCategoryOfQuivers );

CapJitAddTypeSignature( "DefiningPairOfQuiverMorphism", [ IsMorphismInCategoryOfQuivers ], function ( input_types )
    
    Assert( 0, IsCategoryOfQuivers( input_types[1].category ) );
    
    return rec( filter := IsNTuple,
                element_types := [
                        rec( filter := IsList, element_type := rec( filter := IsInt ) ),
                        rec( filter := IsList, element_type := rec( filter := IsInt ) ) ] );
    
end );

#! @Arguments quiver
DeclareAttribute( "Arrows",
        IsObjectInCategoryOfQuivers );

#! @Arguments cell
DeclareAttribute( "SvgString",
        IsCellInCategoryOfQuivers );

#! @Arguments cell
DeclareOperation( "DotVertexLabelledDigraph",
        [ IsCellInCategoryOfQuivers ] );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct the category of quivers.
#! @Returns a &CAP; category
#! @Arguments B, C
#! @Group FunctorCategory
DeclareOperationWithCache( "CategoryOfQuiversEnrichedOver",
        [ IsCapCategory ] );

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
