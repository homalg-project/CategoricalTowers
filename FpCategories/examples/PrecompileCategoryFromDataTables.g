#! @BeginChunk PrecompileCategoryFromDataTables

#! @Example

#! #@if ValueOption( "no_precompiled_code" ) <> true

LoadPackage( "FpCategories", false );
#! true
LoadPackage( "CompilerForCAP", ">= 2025.11-01", false );
#! true
ReadPackageOnce( "FpCategories", "gap/CompilerLogic.gi" );
#! true

category_constructor :=
  function( quiver )
    local sFinSets; sFinSets := SkeletalCategoryOfFiniteSets( : FinalizeCategory := true ); return CategoryFromDataTables( PathCategory( quiver : range_of_HomStructure := sFinSets, FinalizeCategory := true ) ); end;;

given_arguments := [ FinQuiver( "q(a,b)[m:a->b]" ) ];;
compiled_category_name := "CategoryFromDataTablesPrecompiled";;
package_name := "FpCategories";;

CapJitPrecompileCategoryAndCompareResult(
    category_constructor,
    given_arguments,
    package_name,
    compiled_category_name
        : operations := "primitive" );;

CategoryFromDataTablesPrecompiled( given_arguments[1] );
#! PathCategory( FinQuiver( "q(a,b)[m:a→b]" ) )

CategoryFromDataTables( PathCategory( given_arguments[1] ) )!.precompiled_functions_added;
#! true

#! #@fi
# @drop_example_in_Julia
#! @EndExample

#! @EndChunk
