#! @BeginChunk PrecompileCategoryFromDataTables

#! @Example

#! #@if ValueOption( "no_precompiled_code" ) <> true

LoadPackage( "Algebroids", false );
#! true
LoadPackage( "CompilerForCAP", false );
#! true
ReadPackageOnce( "Algebroids", "gap/CompilerLogic.gi" );
#! true

free_category_of_quiver := { quiver, sFinSets } -> FreeCategory( quiver : range_of_HomStructure := sFinSets, FinalizeCategory := true );;

category_constructor :=
  function( quiver )
    local sFinSets; sFinSets := CategoryOfSkeletalFinSets( : FinalizeCategory := true ); return CategoryFromDataTables( "CategoryFromDataTables", sFinSets, DataTablesOfCategory( FreeCategory( quiver : range_of_HomStructure := sFinSets, FinalizeCategory := true ) : FinalizeCategory := true ), [ 0 ], [ [ "a", "b" ], [ "m" ] ] ); end;;

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

CategoryFromDataTables( "CategoryFromDataTables", SkeletalFinSets, DataTablesOfCategory( FreeCategory( given_arguments[1] ) ), [ 0 ], [ [ "a", "b" ], [ "m" ] ] )!.precompiled_functions_added;
#! true

#! #@fi

#! @EndExample

#! @EndChunk
