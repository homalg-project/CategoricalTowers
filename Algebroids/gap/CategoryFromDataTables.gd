# SPDX-License-Identifier: GPL-2.0-or-later
# Algebroids: Algebroids and bialgebroids as preadditive categories generated by enhanced quivers
#
# Declarations
#

#! @Chapter Finite categories from data tables

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of categories from data tables.
DeclareCategory( "IsCategoryFromDataTables",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a category from data tables.
DeclareCategory( "IsCellInCategoryFromDataTables",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a category from data tables.
DeclareCategory( "IsObjectInCategoryFromDataTables",
        IsCellInCategoryFromDataTables and IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a category from data tables.
DeclareCategory( "IsMorphismInCategoryFromDataTables",
        IsCellInCategoryFromDataTables and IsCapCategoryMorphism );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The data tables used to create the category <A>C</A>.
#!  It might differ from the <Q>normalized</Q> output of
#!  <C>DataTablesOfCategory</C>( <A>C</A> ).
#! @Arguments C
#! @Returns a pair of lists
DeclareAttribute( "DataTables",
        IsCapCategory );

CapJitAddTypeSignature( "DataTables", [ IsCapCategory ],
  function ( input_types )
    local integer, list_of_integers, list_list_of_integers, list_list_list_of_integers;
    
    Assert( 0, IsFinite( input_types[1].category ) );
    
    integer := IsInt;
    
    list_of_integers := CapJitDataTypeOfListOf( integer );
    
    list_list_of_integers := CapJitDataTypeOfListOf( list_of_integers );
    
    list_list_list_of_integers := CapJitDataTypeOfListOf( list_list_of_integers );
    
    return CapJitDataTypeOfNTupleOf( 2,
                   CapJitDataTypeOfNTupleOf( 2,
                           integer,   # C0
                           integer ), # C1
                   CapJitDataTypeOfNTupleOf( 8,
                           list_of_integers,               # identities
                           list_of_integers,               # sources
                           list_of_integers,               # targets
                           list_list_of_integers,          # precompose
                           list_list_of_integers,          # hom_on_objs
                           list_list_list_of_integers,     # hom_on_mors
                           list_list_of_integers,          # introduction
                           list_list_list_of_integers ) ); # elimination
    
end );

#! @Description
#!  The finite set of objects of the category <A>C</A> created from data tables.
#! @Arguments C
#! @Returns a list
DeclareAttribute( "SetOfObjects",
        IsCategoryFromDataTables );

#! @Description
#!  The finite set of morphisms of the category <A>C</A> created from data tables.
#! @Arguments C
#! @Returns a list
DeclareAttribute( "SetOfMorphisms",
        IsCategoryFromDataTables );

DeclareAttribute( "IndicesOfGeneratingMorphisms",
        IsCategoryFromDataTables );

CapJitAddTypeSignature( "IndicesOfGeneratingMorphisms", [ IsCategoryFromDataTables ],
  function ( input_types )
    
    return CapJitDataTypeOfListOf( IsInt );
    
end );

DeclareAttribute( "DecompositionOfAllMorphisms",
        IsCategoryFromDataTables );

CapJitAddTypeSignature( "DecompositionOfAllMorphisms", [ IsCategoryFromDataTables ],
  function ( input_types )
    
    return CapJitDataTypeOfListOf(
                   CapJitDataTypeOfListOf(
                           CapJitDataTypeOfListOf( IsInt ) ) );
    
end );

DeclareAttribute( "RelationsAmongGeneratingMorphisms",
        IsCategoryFromDataTables );

CapJitAddTypeSignature( "RelationsAmongGeneratingMorphisms", [ IsCategoryFromDataTables ],
  function ( input_types )
    
    return CapJitDataTypeOfListOf(
                   CapJitDataTypeOfNTupleOf( 2,
                           CapJitDataTypeOfListOf( IsInt ),
                           CapJitDataTypeOfListOf( IsInt ) ) );
    
end );

#! @Description
#!  The finite set of morphisms generating the category <A>C</A> created from data tables.
#! @Arguments C
#! @Returns a list
DeclareAttribute( "SetOfGeneratingMorphisms",
        IsCategoryFromDataTables );

#! @Description
#!  The number of morphisms in the category <A>C</A> created from data tables.
#! @Arguments C
#! @Returns a nonnegative integer
DeclareAttribute( "Size",
        IsCategoryFromDataTables );

##
DeclareAttribute( "IndexOfObject",
        IsObjectInCategoryFromDataTables );

CapJitAddTypeSignature( "IndexOfObject", [ IsObjectInCategoryFromDataTables ], IsBigInt );

##
DeclareAttribute( "IndexOfMorphism",
        IsMorphismInCategoryFromDataTables );

CapJitAddTypeSignature( "IndexOfMorphism", [ IsMorphismInCategoryFromDataTables ], IsBigInt );

#! @Description
#!  The opposite category of the category <A>C</A> defined by nerve data.
#! @Arguments C
#! @Returns a &CAP; category
DeclareAttribute( "OppositeCategoryFromDataTables",
        IsCategoryFromDataTables );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct an enriched finite category out of the <A>input_record</A>
#!  consisting of values to the keys:
#!  * name
#!  * nerve_data
#!  * indices_of_generating_morphisms
#!  * relations
#!  * labels
#!  * properties
#! @Arguments input_record
#! @Returns a &CAP; category
DeclareAttribute( "CategoryFromDataTables",
        IsRecord );
#! @InsertChunk CategoryFromDataTables

#! @Arguments C
DeclareAttribute( "CategoryFromDataTables",
        IsFpCategory );

#! @Arguments C
DeclareAttribute( "CategoryFromDataTables",
        IsCategoryFromNerveData );

#! @Description
#!  Construct the <A>o</A>-th object in the category <A>C</A> created from data tables.
#! @Arguments C, o
#! @Returns a &CAP; category
DeclareOperation( "CreateObject",
        [ IsCategoryFromDataTables, IsInt ] );

#! @Description
#!  Construct the <A>m</A>-th morphism <A>source</A>$\to$<A>range</A>
#!  in the category <A>C</A> created from data tables.
#! @Arguments C, m
#! @Returns a &CAP; category
#! @Group CreateMorphism
DeclareOperation( "CreateMorphism",
        [ IsCategoryFromDataTables, IsInt ] );

#! @Arguments source, m, range
#! @Group CreateMorphism
DeclareOperation( "CreateMorphism",
        [ IsObjectInCategoryFromDataTables, IsInt, IsObjectInCategoryFromDataTables ] );
