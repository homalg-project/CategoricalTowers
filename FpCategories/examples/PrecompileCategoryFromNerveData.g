#! @BeginChunk PrecompileCategoryFromNerveData

#! @Example

#! #@if ValueOption( "no_precompiled_code" ) <> true and String({}->1-[1-1]) = "function (  ) return 1 - [ (1 - 1) ]; end"

LoadPackage( "FpCategories", false );
#! true
LoadPackage( "CompilerForCAP", ">= 2024.07-09", false );
#! true
ReadPackageOnce( "FpCategories", "gap/CompilerLogic.gi" );
#! true
ReadPackageOnce( "FinSetsForCAP", "gap/CompilerLogic.gi" );
#! true

category_constructor :=
  function( quiver )
    local sFinSets; sFinSets := SkeletalCategoryOfFiniteSets( : FinalizeCategory := true ); return CategoryFromNerveData( PathCategory( quiver : range_of_HomStructure := sFinSets, FinalizeCategory := true ) ); end;;

given_arguments := [ FinQuiver( "q(a,b)[m:a->b]" ) ];;
compiled_category_name := "CategoryFromNerveDataPrecompiled";;
package_name := "FpCategories";;

CapJitPrecompileCategoryAndCompareResult(
    category_constructor,
    given_arguments,
    package_name,
    compiled_category_name
        : operations := Difference( ListPrimitivelyInstalledOperationsOfCategory( category_constructor( given_arguments[1] : no_precompiled_code := true ) ),
                                [ "HomomorphismStructureOnMorphismsWithGivenObjects" ] ) );;

CategoryFromNerveDataPrecompiled( given_arguments[1] );
#! PathCategory( FinQuiver( "q(a,b)[m:a→b]" ) )

CategoryFromNerveData( PathCategory( given_arguments[1] ) )!.precompiled_functions_added;
#! true

#! #@fi

#! @EndExample

#! @EndChunk
