# @Chapter Precompilation

# @Section Precompiling the category of finite quivers

# @Example

LoadPackage( "FunctorCategories", false );
#! true

LoadPackage( "CompilerForCAP", ">= 2022.09-02", false );
#! true

ReadPackageOnce( "FinSetsForCAP", "gap/CompilerLogic.gi" );
#! true

ReadPackageOnce( "Algebroids", "gap/CompilerLogic.gi" );
#! true

ReadPackageOnce( "FunctorCategories", "gap/CompilerLogic.gi" );
#! true

category_constructor := { } -> CategoryOfBouquetsEnrichedOver( SkeletalCategoryOfFiniteSets( : FinalizeCategory := true ) );;

given_arguments := [ ];;
compiled_category_name := "FinBouquetsAsCCCPrecompiled";;
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
