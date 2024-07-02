LoadPackage( "FunctorCategories" );



q := FinQuiver( "q(\
E00,E10,E20,E30,E40,\
E01,E11,E21,E31,E41,\
E02,E12,E22,E32,E42,\
E03,E13,E23,E33,E43)[\
v00:E00->E01,v10:E10->E11,v20:E20->E21,v30:E30->E31,v40:E40->E41,\
v01:E01->E02,v11:E11->E12,v21:E21->E22,v31:E31->E32,v41:E41->E42,\
v02:E02->E03,v12:E12->E13,v22:E22->E23,v32:E32->E33,v42:E42->E43,\
h00:E00->E10,h10:E10->E20,h20:E20->E30,h30:E30->E40,\
h01:E01->E11,h11:E11->E21,h21:E21->E31,h31:E31->E41,\
h02:E02->E12,h12:E12->E22,h22:E22->E32,h32:E32->E42,\
h03:E03->E13,h13:E13->E23,h23:E23->E33,h33:E33->E43]" : name := "q(E0..4,0..3)[v..,h..]" );

F := PathCategory( q );

k := HomalgFieldOfRationals( );

kF := LinearClosure( k, F );

rel := [ kF.v00 * kF.v01, kF.v10 * kF.v11, kF.v20 * kF.v21, kF.v30 * kF.v31, kF.v40 * kF.v41,
         kF.v01 * kF.v02, kF.v11 * kF.v12, kF.v21 * kF.v22, kF.v31 * kF.v32, kF.v41 * kF.v42,
         
         kF.h00 * kF.h10, kF.h10 * kF.h20, kF.h20 * kF.h30,
         kF.h01 * kF.h11, kF.h11 * kF.h21, kF.h21 * kF.h31,
         kF.h02 * kF.h12, kF.h12 * kF.h22, kF.h22 * kF.h32,
         kF.h03 * kF.h13, kF.h13 * kF.h23, kF.h23 * kF.h33,
         
         kF.h00 * kF.v10 + kF.v00 * kF.h01,
         kF.h10 * kF.v20 + kF.v10 * kF.h11,
         kF.h20 * kF.v30 + kF.v20 * kF.h21,
         kF.h30 * kF.v40 + kF.v30 * kF.h31,
         
         kF.h01 * kF.v11 + kF.v01 * kF.h02,
         kF.h11 * kF.v21 + kF.v11 * kF.h12,
         kF.h21 * kF.v31 + kF.v21 * kF.h22,
         kF.h31 * kF.v41 + kF.v31 * kF.h32,
         
         kF.h02 * kF.v12 + kF.v02 * kF.h03,
         kF.h12 * kF.v22 + kF.v12 * kF.h13,
         kF.h22 * kF.v32 + kF.v22 * kF.h23,
         kF.h32 * kF.v42 + kF.v32 * kF.h33 ];

Assert( 0, ForAll( rel, IsWellDefined ) );

L := QuotientCategory( kF, rel );






# compile hom structure of L
StopCompilationAtCategory( kF );

category_constructor := { kF, rel } -> QuotientCategory( kF, rel );;
given_arguments := [ kF, rel ];;
compiled_category_name := "QuotientCategory_LinearClosure_precompiled";;
package_name := "Algebroids";;

CapJitPrecompileCategoryAndCompareResult(
    category_constructor,
    given_arguments,
    package_name,
    compiled_category_name :
    operations := [
        "DistinguishedObjectOfHomomorphismStructure",
        "HomomorphismStructureOnObjects",
        "HomomorphismStructureOnMorphisms",
        "HomomorphismStructureOnMorphismsWithGivenObjects",
        "InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure",
        "InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism",
    ]
);;




# compile hom structure of AdditiveClosure( L )

# UnionOfColumns( HomalgMatrixListList )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "ring", "nr_rows", "list", "listlist", "nr_rows2", "nr_cols" ],
        src_template := "UnionOfColumns( ring, nr_rows, List( list, l -> HomalgMatrixListList( listlist, nr_rows2, nr_cols, ring ) ) )",
        dst_template := "HomalgMatrixListList( UnionOfColumnsListList( nr_rows, List( list, l -> listlist ) ), nr_rows, Sum( list, l -> nr_cols ), ring )",
    )
);

# UnionOfRows( HomalgMatrixListList )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "ring", "nr_cols", "list", "listlist", "nr_rows", "nr_cols2" ],
        src_template := "UnionOfRows( ring, nr_cols, List( list, l -> HomalgMatrixListList( listlist, nr_rows, nr_cols2, ring ) ) )",
        dst_template := "HomalgMatrixListList( UnionOfRowsListList( nr_cols, List( list, l -> listlist ) ), Sum( list, l -> nr_rows ), nr_cols, ring )",
    )
);


category_constructor := { kF, rel } -> AdditiveClosure( QuotientCategory( kF, rel : FinalizeCategory := true ) );;
given_arguments := [ kF, rel ];;
compiled_category_name := "AdditiveClosure_QuotientCategory_LinearClosure_precompiled";;
package_name := "Algebroids";;

CapJitPrecompileCategoryAndCompareResult(
    category_constructor,
    given_arguments,
    package_name,
    compiled_category_name :
    operations := [
        "DistinguishedObjectOfHomomorphismStructure",
        "HomomorphismStructureOnObjects",
        "HomomorphismStructureOnMorphisms",
        "HomomorphismStructureOnMorphismsWithGivenObjects",
        "InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure",
        "InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism",
    ]
);;

myL := L;

CapCategorySwitchLogicOff( L );
DeactivateCachingOfCategory( L );
DisableSanityChecks( L );

Display( L );

# add precompiled hom structure to AdditiveClosure( L )
AL := AdditiveClosure( L : FinalizeCategory := false );
ReadPackage( "Algebroids", "gap/precompiled_categories/AdditiveClosure_QuotientCategory_LinearClosure_precompiled.gi" );
ADD_FUNCTIONS_FOR_AdditiveClosure_QuotientCategory_LinearClosure_precompiled( AL );
Finalize( AL );

A := AbelianClosureWithStrictDirectSumsAsFreydOfCoFreydOfStrictAdditiveClosure( L );

CKAL := ModelingCategory( A );
KAL := UnderlyingCategory( CKAL );
AL := UnderlyingCategory( KAL );

CapCategorySwitchLogicOff( CKAL );
DeactivateCachingOfCategory( CKAL );
DisableSanityChecks( CKAL );

CapCategorySwitchLogicOff( KAL );
DeactivateCachingOfCategory( KAL );
DisableSanityChecks( KAL );

CapCategorySwitchLogicOff( AL );
DeactivateCachingOfCategory( AL );
DisableSanityChecks( AL );

#EnableTimingStatistics( kF );
#EnableTimingStatistics( RangeCategoryOfHomomorphismStructure( kF ) );
EnableTimingStatistics( myL );
EnableTimingStatistics( CKAL );
EnableTimingStatistics( KAL );
EnableTimingStatistics( AL );

h21 := HomologyObjectFunctorial( A.v20, A.v21, A.h21, A.v30, A.v31 );
h31 := HomologyObjectFunctorial( A.v30, A.v31, A.h31, A.v40, A.v41 );

h02 := HomologyObjectFunctorial( A.v01, A.v02, A.h02, A.v11, A.v12 );
h12 := HomologyObjectFunctorial( A.v11, A.v12, A.h12, A.v21, A.v22 );

E2_12 := HomologyObject( h02, h12 );
E2_31 := HomologyObject( h21, h31 );

Display( "start" );
StartTimer( "hom" );
HomStructure( E2_12, E2_31 );
StopTimer( "hom" );
DisplayTimer( "hom" );
#hom := BasisOfExternalHom( E2_12, E2_31 );
#Assert( 0, Length( hom ) = 1 );
#d2 := hom[1];

#d2_reconstructed := CellAsEvaluatableString( d2, [ "A", "CKAL", "KAL", "AL", "L", "kF", "F" ] );
