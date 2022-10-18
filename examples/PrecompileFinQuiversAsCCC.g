# @Chapter Precompilation

# @Section Precompiling the category of finite quivers

# @Example

LoadPackage( "FunctorCategories", false );
#! true

LoadPackage( "CompilerForCAP", ">= 2022.09-02", false );
#! true

ReadPackage( "FinSetsForCAP", "gap/CompilerLogic.gi" );
#! true

ReadPackage( "Algebroids", "gap/CompilerLogic.gi" );
#! true

ReadPackage( "FunctorCategories", "gap/CompilerLogic.gi" );
#! true

category_constructor := { } -> CategoryOfQuiversEnrichedOver( CategoryOfSkeletalFinSets( : FinalizeCategory := true ) );;

given_arguments := [ ];;
compiled_category_name := "FinQuiversAsCCCPrecompiled";;
package_name := "FunctorCategories";;

CapJitPrecompileCategoryAndCompareResult(
    category_constructor,
    given_arguments,
    package_name,
    compiled_category_name
   : operations := [ "ExponentialOnObjects",
                     ]
);;

# @EndExample
