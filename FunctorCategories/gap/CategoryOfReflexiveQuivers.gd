# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

#! @Chapter The elementary topos of finite reflexive quivers

####################################
#
#! @Section &GAP; Categories
#
####################################

#! @Description
#!  The &GAP; category of the category of reflexive quivers.
#! @Arguments category
DeclareCategory( "IsCategoryOfReflexiveQuivers",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in the category of reflexive quivers.
#! @Arguments cell
DeclareCategory( "IsCellInCategoryOfReflexiveQuivers",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in the category of reflexive quivers.
#! @Arguments obj
DeclareCategory( "IsObjectInCategoryOfReflexiveQuivers",
        IsCellInCategoryOfReflexiveQuivers and
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in the category of reflexive quivers.
#! @Arguments mor
DeclareCategory( "IsMorphismInCategoryOfReflexiveQuivers",
        IsCellInCategoryOfReflexiveQuivers and
        IsCapCategoryMorphism );

####################################
#
#! @Section Global variables
#
####################################

if false then
#! The quiver generating the category of reflexive quivers
DeclareGlobalVariable( "QuiverOfCategoryOfReflexiveQuivers" );

#! The category of reflexive quivers as a category of presheaves with values in <C>SkeletalFinSets</C>.
DeclareGlobalVariable( "FinQuivers" );
fi;

####################################
#
#! @Section Attributes
#
####################################

#! @Arguments fin_reflexive_quivers
DeclareAttribute( "UnderlyingCategory",
        IsCategoryOfReflexiveQuivers );

#! @Arguments fin_reflexive_quivers
DeclareAttribute( "YonedaEmbeddingOfUnderlyingCategory",
        IsCategoryOfReflexiveQuivers );

DeclareAttribute( "DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets",
        IsObjectInCategoryOfReflexiveQuivers );

CapJitAddTypeSignature( "DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets", [ IsObjectInCategoryOfReflexiveQuivers ], function ( input_types )
    
    Assert( 0, IsCategoryOfReflexiveQuivers( input_types[1].category ) );
    
    return rec( filter := IsNTuple,
                element_types := [
                        rec( filter := IsInt ),
                        rec( filter := IsInt ),
                        rec( filter := IsList,
                             element_type := rec( filter := IsInt ) ),
                        rec( filter := IsList,
                             element_type := rec(
                                     filter := IsNTuple,
                                     element_types := [ rec( filter := IsInt ), rec( filter := IsInt ) ] ) ) ] );
    
end );

DeclareAttribute( "DefiningPairOfReflexiveQuiverMorphismEnrichedOverSkeletalFinSets",
        IsObjectInCategoryOfReflexiveQuivers );

CapJitAddTypeSignature( "DefiningPairOfReflexiveQuiverMorphismEnrichedOverSkeletalFinSets", [ IsMorphismInCategoryOfReflexiveQuivers ], function ( input_types )
    
    Assert( 0, IsCategoryOfReflexiveQuivers( input_types[1].category ) );
    
    return rec( filter := IsNTuple,
                element_types := [
                        rec( filter := IsList, element_type := rec( filter := IsInt ) ),
                        rec( filter := IsList, element_type := rec( filter := IsInt ) ) ] );
    
end );

#! @Arguments quiver
DeclareAttribute( "Loops",
        IsObjectInCategoryOfReflexiveQuivers );

#! @Arguments quiver
DeclareAttribute( "Arrows",
        IsObjectInCategoryOfReflexiveQuivers );

#! @Arguments cell
DeclareAttribute( "SvgString",
        IsCellInCategoryOfReflexiveQuivers );

#! @Arguments cell
DeclareOperation( "DotVertexLabelledDigraph",
        [ IsCellInCategoryOfReflexiveQuivers ] );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct the category of reflexive quivers enriched over the category <A>V</A>.
#! @Returns a &CAP; category
#! @Arguments V
DeclareAttribute( "CategoryOfReflexiveQuiversEnrichedOver",
        IsCapCategory );

#!
DeclareOperation( "CreateReflexiveQuiver",
        [ IsCategoryOfReflexiveQuivers, IsInt, IsList, IsList ] );

#!
DeclareOperation( "CreateReflexiveQuiver",
        [ IsInt, IsList, IsList ] );

#!
DeclareOperation( "CreateReflexiveQuiverMorphism",
        [ IsObjectInCategoryOfReflexiveQuivers, IsList, IsList, IsObjectInCategoryOfReflexiveQuivers ] );

#!
DeclareOperation( "Subobject",
        [ IsObjectInCategoryOfReflexiveQuivers, IsList, IsList ] );

#!
DeclareOperation( "Subobject",
        [ IsObjectInCategoryOfReflexiveQuivers, IsList ] );
