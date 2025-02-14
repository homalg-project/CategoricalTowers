#! @BeginChunk PrecompileCategoryFromDataTables

#! @Example

#! #@if ValueOption( "no_precompiled_code" ) <> true and String({}->1-[1-1]) = "function (  ) return 1 - [ (1 - 1) ]; end"

LoadPackage( "Algebroids", false );
#! true
LoadPackage( "CompilerForCAP", ">= 2024.07-09", false );
#! true
ReadPackageOnce( "Algebroids", "gap/CompilerLogic.gi" );
#! true

category_constructor :=
  function( quiver )
    local sFinSets; sFinSets := SkeletalCategoryOfFiniteSets( : FinalizeCategory := true ); return CategoryFromDataTables( FreeCategory( quiver : range_of_HomStructure := sFinSets, FinalizeCategory := true ) ); end;;

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
#! FreeCategory( RightQuiver( "q(a,b)[m:a->b]" ) )

CategoryFromDataTables( FreeCategory( given_arguments[1] ) )!.precompiled_functions_added;
#! true

#! #@fi

#! @EndExample

#! @EndChunk
