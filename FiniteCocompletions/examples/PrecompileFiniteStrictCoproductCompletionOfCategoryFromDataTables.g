#! @Chapter Precompilation

#! @Section Precompiling the finite strict coproduct completion

#! @Example

#! #@if ValueOption( "no_precompiled_code" ) <> true

LoadPackage( "FiniteCocompletions", false );
#! true

LoadPackage( "CompilerForCAP", ">= 2025.11-01", false );
#! true

ReadPackageOnce( "FinSetsForCAP", "gap/CompilerLogic.gi" );
#! true

ReadPackageOnce( "Algebroids", "gap/CompilerLogic.gi" );
#! true

ReadPackageOnce( "FunctorCategories", "gap/CompilerLogic.gi" );
#! true

free_category_of_quiver := { quiver, sFinSets } -> CategoryFromDataTables( PathCategory( quiver : range_of_HomStructure := sFinSets, FinalizeCategory := true ) );;

category_constructor :=
  function( quiver )
    local sFinSets; sFinSets := SkeletalCategoryOfFiniteSets( : FinalizeCategory := true, overhead := true ); return FiniteStrictCoproductCompletion( CategoryFromDataTables( PathCategory( quiver : range_of_HomStructure := sFinSets, FinalizeCategory := true ) : FinalizeCategory := true ) ); end;;

given_arguments := [ FinQuiver( "q(2)[m:1->2]" ) ];;
compiled_category_name := "FiniteStrictCoproductCompletionOfCategoryFromDataTablesPrecompiled";;
package_name := "FiniteCocompletions";;

CapJitPrecompileCategoryAndCompareResult(
    category_constructor,
    given_arguments,
    package_name,
    compiled_category_name
   : operations := [ #"CoproductOnMorphismsWithGivenCoproducts", # <- derived and leads to an error
                     #"CoproductFunctorialWithGivenCoproducts", # <- derived
                     "HomomorphismStructureOnObjects",
                     "HomomorphismStructureOnMorphismsWithGivenObjects",
                     "InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism",
                     "MorphismsOfExternalHom",
                     #"ExponentialOnObjects",
                     ]
);;

FiniteStrictCoproductCompletionOfCategoryFromDataTablesPrecompiled( given_arguments[1] );
#! FiniteStrictCoproductCompletion( PathCategory( FinQuiver( "q(1,2)[m:1→2]" ) ) )

cat := FiniteStrictCoproductCompletion( free_category_of_quiver( given_arguments[1], SkeletalFinSets ) );
#! FiniteStrictCoproductCompletion( PathCategory( FinQuiver( "q(1,2)[m:1→2]" ) ) )

cat!.precompiled_functions_added;
#! true

#! #@fi

#! @EndExample
