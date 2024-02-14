# @Chapter Precompilation

# @Section Precompiling the category of presheaves with values in SkeletalFinSets

# @Example

# #@if ValueOption( "no_precompiled_code" ) <> true

LoadPackage( "FunctorCategories", false );
#! true

LoadPackage( "CompilerForCAP", ">= 2022.09-02", false );
#! true

ReadPackageOnce( "FinSetsForCAP", "gap/CompilerLogic.gi" );
#! true

ReadPackageOnce( "FunctorCategories", "gap/CompilerLogic.gi" );
#! true

free_category_of_quiver := { quiver, sFinSets } -> FreeCategory( quiver : range_of_HomStructure := sFinSets, FinalizeCategory := true );;

category_constructor :=
  function( quiver )
    local sFinSets; sFinSets := SkeletalCategoryOfFiniteSets( : FinalizeCategory := true ); return PreSheaves( FreeCategory( quiver : range_of_HomStructure := sFinSets, FinalizeCategory := true ), sFinSets ); end;;

given_arguments := [ RightQuiver( "q(2)[m:1->2]" ) ];;
compiled_category_name := "PreSheavesOfFpCategoryInSkeletalFinSetsSubobjectClassifierPrecompiled";;
package_name := "FunctorCategories";;

CapJitPrecompileCategoryAndCompareResult(
    category_constructor,
    given_arguments,
    package_name,
    compiled_category_name
   : operations := [ "SubobjectClassifier",
                     ]
);;

PreSheavesOfFpCategoryInSkeletalFinSetsSubobjectClassifierPrecompiled( given_arguments[1] );
#! PreSheaves( FreeCategory( RightQuiver( "q(2)[m:1->2]" ) ), SkeletalFinSets )

cat := PreSheaves( free_category_of_quiver( given_arguments[1], SkeletalFinSets ) );
#! PreSheaves( FreeCategory( RightQuiver( "q(2)[m:1->2]" ) ), SkeletalFinSets )

cat!.precompiled_functions_added;
#! true

# #@fi

# @EndExample
