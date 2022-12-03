#! @BeginChunk PrecompileCategoryFromDataTables

#! @Example

LoadPackage( "Algebroids", false );
#! true
LoadPackage( "CompilerForCAP", false );
#! true
ReadPackage( "Algebroids", "gap/CompilerLogic.gi" );
#! true

free_category_of_quiver := { quiver, sFinSets } -> FreeCategory( quiver : range_of_HomStructure := sFinSets, FinalizeCategory := true );;

category_constructor :=
  function( quiver )
    local sFinSets; sFinSets := CategoryOfSkeletalFinSets( : FinalizeCategory := true ); return CategoryFromDataTables( "CategoryFromDataTables", DataTablesOfCategory( FreeCategory( quiver : range_of_HomStructure := sFinSets, FinalizeCategory := true ) : FinalizeCategory := true ), [ 0 ], [ [ "a", "b" ], [ "m" ] ] ); end;;

given_arguments := [ RightQuiver( "q(a,b)[m:a->b]" ) ];;
compiled_category_name := "CategoryFromDataTablesPrecompiled";;
package_name := "Algebroids";;

CapJitPrecompileCategoryAndCompareResult(
    category_constructor,
    given_arguments,
    package_name,
    compiled_category_name
        : operations := "primitive" );;

CategoryFromDataTablesPrecompiled( given_arguments[1] );
#! CategoryFromDataTables

#! @EndExample

#! Check that the compiled code is loaded automatically
#! for this, we use the name of the first argument of `IsZeroForMorphisms`:
#! for non-compiled code it is "cat", while for compiled code it is "cat_1"

#! @Example

cat := CategoryFromDataTables( "CategoryFromDataTables", DataTablesOfCategory( FreeCategory( given_arguments[1] ) ), [ 0 ], [ [ "a", "b" ], [ "m" ] ] );;
argument_name := NamesLocalVariablesFunction(
    Last( cat!.added_functions.PreCompose )[1] )[1];;

( ValueOption( "no_precompiled_code" ) = true and argument_name = "C" ) or
  ( ValueOption( "no_precompiled_code" ) = fail and argument_name = "cat_1" );
#! true

#! @EndExample

#! @EndChunk
