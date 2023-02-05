# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

#! @Chapter The elementary topos of finite bouquets

####################################
#
#! @Section &GAP; Categories
#
####################################

#! @Description
#!  The &GAP; category of the category of bouquets.
#! @Arguments category
DeclareCategory( "IsCategoryOfBouquets",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in the category of bouquets.
#! @Arguments cell
DeclareCategory( "IsCellInCategoryOfBouquets",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in the category of bouquets.
#! @Arguments obj
DeclareCategory( "IsObjectInCategoryOfBouquets",
        IsCellInCategoryOfBouquets and
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in the category of bouquets.
#! @Arguments mor
DeclareCategory( "IsMorphismInCategoryOfBouquets",
        IsCellInCategoryOfBouquets and
        IsCapCategoryMorphism );

####################################
#
#! @Section Global variables
#
####################################

if false then
#! The quiver generating the category of bouquets
DeclareGlobalVariable( "QuiverOfCategoryOfBouquets" );

#! The category of bouquets as a category of presheaves with values in <C>SkeletalFinSets</C>.
DeclareGlobalVariable( "FinBouquets" );
fi;

####################################
#
#! @Section Attributes
#
####################################

#! @Arguments fin_bouquets
DeclareAttribute( "UnderlyingCategory",
        IsCategoryOfBouquets );

#! @Arguments fin_bouquets
DeclareAttribute( "YonedaEmbeddingOfUnderlyingCategory",
        IsCategoryOfBouquets );

DeclareAttribute( "DefiningTripleOfBouquet",
        IsObjectInCategoryOfBouquets );

CapJitAddTypeSignature( "DefiningTripleOfBouquet", [ IsObjectInCategoryOfBouquets ], function ( input_types )
    
    Assert( 0, IsCategoryOfBouquets( input_types[1].category ) );
    
    return rec( filter := IsNTuple,
                element_types := [
                        rec( filter := IsInt ),
                        rec( filter := IsInt ),
                        rec( filter := IsList,
                             element_type := rec( filter := IsInt ) ) ] );
    
end );

DeclareAttribute( "DefiningPairOfBouquetMorphism",
        IsObjectInCategoryOfBouquets );

CapJitAddTypeSignature( "DefiningPairOfBouquetMorphism", [ IsMorphismInCategoryOfBouquets ], function ( input_types )
    
    Assert( 0, IsCategoryOfBouquets( input_types[1].category ) );
    
    return rec( filter := IsNTuple,
                element_types := [
                        rec( filter := IsList, element_type := rec( filter := IsInt ) ),
                        rec( filter := IsList, element_type := rec( filter := IsInt ) ) ] );
    
end );

#! @Arguments bouquet
DeclareAttribute( "Loops",
        IsObjectInCategoryOfBouquets );

#! @Arguments cell
DeclareAttribute( "SvgString",
        IsCellInCategoryOfBouquets );

#! @Arguments cell
DeclareOperation( "DotVertexLabelledDigraph",
        [ IsCellInCategoryOfBouquets ] );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct the category of bouquets  enriched over the category <A>V</A>.
#! @Returns a &CAP; category
#! @Arguments V
DeclareOperationWithCache( "CategoryOfBouquetsEnrichedOver",
        [ IsCapCategory ] );

#!
DeclareOperation( "CreateBouquet",
        [ IsCategoryOfBouquets, IsInt, IsList ] );

#!
DeclareOperation( "CreateBouquet",
        [ IsInt, IsList ] );

#!
DeclareOperation( "CreateBouquetMorphism",
        [ IsObjectInCategoryOfBouquets, IsList, IsList, IsObjectInCategoryOfBouquets ] );

#!
DeclareOperation( "Subobject",
        [ IsObjectInCategoryOfBouquets, IsList, IsList ] );

#!
DeclareOperation( "Subobject",
        [ IsObjectInCategoryOfBouquets, IsList ] );
