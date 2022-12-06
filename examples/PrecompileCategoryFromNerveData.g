#! @BeginChunk PrecompileCategoryFromNerveData

#! @Example

#! #@if ValueOption( "no_precompiled_code" ) <> true

LoadPackage( "Algebroids", false );
#! true
LoadPackage( "CompilerForCAP", false );
#! true
ReadPackageOnce( "Algebroids", "gap/CompilerLogic.gi" );
#! true
ReadPackageOnce( "FinSetsForCAP", "gap/CompilerLogic.gi" );
#! true

free_category_of_quiver := { quiver, sFinSets } -> FreeCategory( quiver : range_of_HomStructure := sFinSets, FinalizeCategory := true );;

category_constructor :=
  function( quiver )
    local sFinSets; sFinSets := CategoryOfSkeletalFinSets( : FinalizeCategory := true ); return CategoryFromNerveData( "CategoryFromNerveData", NerveTruncatedInDegree2Data( FreeCategory( quiver : range_of_HomStructure := sFinSets, FinalizeCategory := true ) ), [ 0 ], [ [ "a", "b" ], [ "m" ] ] ); end;;

given_arguments := [ RightQuiver( "q(a,b)[m:a->b]" ) ];;
compiled_category_name := "CategoryFromNerveDataPrecompiled";;
package_name := "Algebroids";;

CapJitPrecompileCategoryAndCompareResult(
    category_constructor,
    given_arguments,
    package_name,
    compiled_category_name
        : operations := Difference( ListPrimitivelyInstalledOperationsOfCategory( category_constructor( given_arguments[1] : no_precompiled_code := true ) ),
                                [ "HomomorphismStructureOnMorphismsWithGivenObjects" ] ) );;

CategoryFromNerveDataPrecompiled( given_arguments[1] );
#! CategoryFromNerveData

CategoryFromNerveData( "CategoryFromNerveData", NerveTruncatedInDegree2Data( FreeCategory( given_arguments[1] ) ), [ 0 ], [ [ "a", "b" ], [ "m" ] ] )!.precompiled_functions_added;
#! true

#! #@fi

#! @EndExample

#! @EndChunk
