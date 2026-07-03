# @Chapter Precompilation

# @Section Precompiling the category of presheaves with values in SkeletalFinSets

# @Example

# #@if ValueOption( "no_precompiled_code" ) <> true

LoadPackage( "FunctorCategories", false );
#! true

LoadPackage( "CompilerForCAP", ">= 2025.11-01", false );
#! true

ReadPackageOnce( "FinSetsForCAP", "gap/CompilerLogic.gi" );
#! true

ReadPackageOnce( "FunctorCategories", "gap/CompilerLogic.gi" );
#! true

free_category_of_quiver := { quiver, sFinSets } -> CategoryFromDataTables( PathCategory( quiver : range_of_HomStructure := sFinSets, FinalizeCategory := true ) : FinalizeCategory := true );;

category_constructor :=
  function( quiver )
    local sFinSets; sFinSets := SkeletalCategoryOfFiniteSets( : FinalizeCategory := true ); return PreSheaves( CategoryFromDataTables( PathCategory( quiver : range_of_HomStructure := sFinSets, FinalizeCategory := true ) : FinalizeCategory := true ), sFinSets ); end;;

given_arguments := [ FinQuiver( "q(2)[m:1->2]" ) ];;
compiled_category_name := "PreSheavesOfCategoryFromDataTablesInSkeletalFinSetsSubobjectClassifierPrecompiled";;
package_name := "FunctorCategories";;

CapJitPrecompileCategoryAndCompareResult(
    category_constructor,
    given_arguments,
    package_name,
    compiled_category_name
   : operations := [ "SubobjectClassifier",
                     ]
);;

PreSheavesOfCategoryFromDataTablesInSkeletalFinSetsSubobjectClassifierPrecompiled( given_arguments[1] );
#! PreSheaves( PathCategory( FinQuiver( "q(1,2)[m:1→2]" ) ), SkeletalFinSets )

cat := PreSheaves( free_category_of_quiver( given_arguments[1], SkeletalFinSets ) );
#! PreSheaves( PathCategory( FinQuiver( "q(1,2)[m:1→2]" ) ), SkeletalFinSets )

cat!.precompiled_functions_added;
#! true

# #@fi

# @EndExample
