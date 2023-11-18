#! @BeginChunk PrecompileCategoryFromNerveDataHomStructureOnMorphisms

#! @Example

#! #@if ValueOption( "no_precompiled_code" ) <> true

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
compiled_category_name := "CategoryFromNerveDataHomStructureOnMorphismsPrecompiled";;
package_name := "FpCategories";;

CapJitPrecompileCategoryAndCompareResult(
    category_constructor,
    given_arguments,
    package_name,
    compiled_category_name
   : operations := [ "HomomorphismStructureOnMorphismsWithGivenObjects" ]
);;

CategoryFromNerveDataHomStructureOnMorphismsPrecompiled( given_arguments[1] );
#! PathCategory( FinQuiver( "q(a,b)[m:a->b]" ) )

CategoryFromNerveData( PathCategory( given_arguments[1] ) )!.precompiled_functions_added;
#! true

#! #@fi

#! @EndExample

#! @EndChunk
