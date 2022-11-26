#! @BeginChunk PrecompileCategoryFromNerveDataHomStructureOnMorphisms

#! @Example

LoadPackage( "Algebroids", false );
#! true
LoadPackage( "CompilerForCAP", false );
#! true
ReadPackage( "Algebroids", "gap/CompilerLogic.gi" );
#! true
ReadPackage( "FinSetsForCAP", "gap/CompilerLogic.gi" );
#! true

free_category_of_quiver := { quiver, sFinSets } -> FreeCategory( quiver : range_of_HomStructure := sFinSets, FinalizeCategory := true );;

category_constructor :=
  function( quiver )
    local sFinSets; sFinSets := CategoryOfSkeletalFinSets( : FinalizeCategory := true ); return CategoryFromNerveData( "CategoryFromNerveData", NerveTruncatedInDegree2Data( FreeCategory( quiver : range_of_HomStructure := sFinSets, FinalizeCategory := true ) ) ); end;;

given_arguments := [ RightQuiver( "q(2)[m:1->2]" ) ];;
compiled_category_name := "CategoryFromNerveDataHomStructureOnMorphismsPrecompiled";;
package_name := "Algebroids";;

CapJitPrecompileCategoryAndCompareResult(
    category_constructor,
    given_arguments,
    package_name,
    compiled_category_name
   : operations := [ "HomomorphismStructureOnMorphismsWithGivenObjects" ]
);;

CategoryFromNerveDataHomStructureOnMorphismsPrecompiled( given_arguments[1] );
#! CategoryFromNerveData

#! @EndExample

#! Check that the compiled code is loaded automatically
#! for this, we use the name of the first argument of `IsZeroForMorphisms`:
#! for non-compiled code it is "cat", while for compiled code it is "cat_1"

#! @Example

cat := CategoryFromNerveData( "CategoryFromNerveData", NerveTruncatedInDegree2Data( FreeCategory( given_arguments[1] ) ) );;
argument_name := NamesLocalVariablesFunction(
    Last( cat!.added_functions.PreCompose )[1] )[1];;

( ValueOption( "no_precompiled_code" ) = true and argument_name = "C" ) or
  ( ValueOption( "no_precompiled_code" ) = fail and argument_name = "cat_1" );
#! true

#! @EndExample

#! @EndChunk
