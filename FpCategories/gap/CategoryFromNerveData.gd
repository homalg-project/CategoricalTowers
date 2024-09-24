# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Declarations
#

#! @Chapter Finite categories from nerve data

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of categories from nerve data.
DeclareCategory( "IsCategoryFromNerveData",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a category from nerve data.
DeclareCategory( "IsCellInCategoryFromNerveData",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a category from nerve data.
DeclareCategory( "IsObjectInCategoryFromNerveData",
        IsCellInCategoryFromNerveData and IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a category from nerve data.
DeclareCategory( "IsMorphismInCategoryFromNerveData",
        IsCellInCategoryFromNerveData and IsCapCategoryMorphism );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The nerve data used to create the category <A>C</A>.
#!  It might differ from the <Q>normalized</Q> output of
#!  <C>NerveTruncatedInDegree2Data</C>( <A>C</A> ).
#! @Arguments C
#! @Returns a pair consisting of a triple and an 8-tuple
DeclareAttribute( "NerveData",
        IsCategoryFromNerveData );

CapJitAddTypeSignature( "NerveData", [ IsCapCategory ],
  function ( input_types )
    local V, obj, mor;
    
    Assert( 0, HasIsFiniteCategory( input_types[1].category ) and IsFiniteCategory( input_types[1].category ) );
    
    V := RangeCategoryOfHomomorphismStructure( input_types[1].category );
    
    obj := CapJitDataTypeOfObjectOfCategory( V );
    mor := CapJitDataTypeOfMorphismOfCategory( V );
    
    return CapJitDataTypeOfNTupleOf( 2,
                   CapJitDataTypeOfNTupleOf( 3,
                           obj,     # C₀
                           obj,     # C₁
                           obj ),   # C₂
                   CapJitDataTypeOfNTupleOf( 8,
                           mor,     # id: C₀ → C₁
                           mor,     # s: C₁ → C₀
                           mor,     # t: C₁ → C₀
                           mor,     # ιₛ: C₁ → C₂
                           mor,     # ιₜ: C₁ → C₂
                           mor,     # pₛ: C₂ → C₁
                           mor,     # pₜ: C₂ → C₁
                           mor ) ); # μ: C₂ → C₁
    
end );

DeclareAttribute( "IndicesOfGeneratingMorphisms",
        IsCategoryFromNerveData );

CapJitAddTypeSignature( "IndicesOfGeneratingMorphisms", [ IsCategoryFromNerveData ],
  function ( input_types )
    
    return CapJitDataTypeOfListOf( IsInt );
    
end );

DeclareAttribute( "DecompositionIndicesOfAllMorphisms",
        IsCategoryFromNerveData );

#CapJitAddTypeSignature( "DecompositionIndicesOfAllMorphisms", [ IsCategoryFromNerveData ],
#  function ( input_types )
#    
#    return CapJitDataTypeOfListOf(
#                   CapJitDataTypeOfListOf( IsInt ) );
#    
#end );

DeclareAttribute( "RelationsAmongGeneratingMorphisms",
        IsCategoryFromNerveData );

#CapJitAddTypeSignature( "RelationsAmongGeneratingMorphisms", [ IsCategoryFromNerveData ],
#  function ( input_types )
#    
#    return CapJitDataTypeOfListOf(
#                   CapJitDataTypeOfNTupleOf( 2,
#                           CapJitDataTypeOfListOf( IsInt ),
#                           CapJitDataTypeOfListOf( IsInt ) ) );
#    
#end );

#! @Description
#!  The number of morphisms in the category <A>C</A> created from nerve data.
#! @Arguments C
#! @Returns a nonnegative integer
DeclareAttribute( "Size",
        IsCategoryFromNerveData );

##
DeclareAttribute( "MapOfObject",
        IsObjectInCategoryFromNerveData );

CapJitAddTypeSignature( "MapOfObject", [ IsObjectInCategoryFromNerveData ],
  function ( input_types )
    local V;
    
    Assert( 0, IsCategoryFromNerveData( input_types[1].category ) );
    
    V := RangeCategoryOfHomomorphismStructure( input_types[1].category );
    
    return CapJitDataTypeOfMorphismOfCategory( V );
    
end );

##
DeclareAttribute( "MapOfMorphism",
        IsMorphismInCategoryFromNerveData );

CapJitAddTypeSignature( "MapOfMorphism", [ IsMorphismInCategoryFromNerveData ],
  function ( input_types )
    local V;
    
    Assert( 0, IsCategoryFromNerveData( input_types[1].category ) );
    
    V := RangeCategoryOfHomomorphismStructure( input_types[1].category );
    
    return CapJitDataTypeOfMorphismOfCategory( V );
    
end );

##
DeclareAttribute( "OppositeNerveData",
        IsList );

#! @Description
#!  The opposite category of the category <A>C</A> defined by nerve data.
#! @Arguments C
#! @Returns a &CAP; category
DeclareAttribute( "OppositeCategoryFromNerveData",
        IsCategoryFromNerveData );

DeclareAttribute( "DecompositionIndicesOfAllMorphismsFromHomStructure",
        IsCapCategory );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct an enriched finite category out of the <A>input_record</A>
#!  consisting of values to the keys:
#!  * name
#!  * range_of_HomStructure
#!  * data_tables
#!  * indices_of_generating_morphisms
#!  * relations
#!  * labels
#!  * properties
#! @Arguments input_record
#! @Returns a &CAP; category
DeclareAttribute( "CategoryFromNerveData",
        IsRecord );
#! @InsertChunk CategoryFromNerveData

if false then
#! @Arguments C
DeclareAttribute( "CategoryFromNerveData",
        IsCategoryFromDataTables );
fi;

#! @Description
#!  Construct the <A>o</A>-th object in the category <A>C</A> created from nerve data.
#! @Arguments C, o
#! @Returns a &CAP; category
DeclareOperation( "CreateObject",
        [ IsCategoryFromNerveData, IsInt ] );

#! @Description
#!  Construct the <A>m</A>-th morphism <A>source</A>$\to$<A>range</A>
#!  in the category <A>C</A> created from nerve data.
#! @Arguments C, m
#! @Returns a &CAP; category
#! @Group CreateMorphism
DeclareOperation( "CreateMorphism",
        [ IsCategoryFromNerveData, IsInt ] );

#! @Arguments source, m, range
#! @Group CreateMorphism
DeclareOperation( "CreateMorphism",
        [ IsObjectInCategoryFromNerveData, IsInt, IsObjectInCategoryFromNerveData ] );
