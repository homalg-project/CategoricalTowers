#! @Chapter Precompilation

#! @Section Precompiling SkeletalFinSets

#! @Example

#! #@if ValueOption( "no_precompiled_code" ) <> true and String({}->1-[1-1]) = "function (  ) return 1 - [ (1 - 1) ]; end"

LoadPackage( "FiniteCocompletions", false );
#! true

LoadPackage( "CompilerForCAP", ">= 2024.07-09", false );
#! true

ReadPackageOnce( "FiniteCocompletions", "gap/CompilerLogic.gi" );
#! true

category_constructor :=
  {} -> SkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategory( );;
given_arguments := [ ];;
compiled_category_name :=
  "SkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategoryPrecompiled";;
package_name := "FiniteCocompletions";;
primitive_operations :=
  ListPrimitivelyInstalledOperationsOfCategory( category_constructor() );;
list_of_operations :=
  SortedList( Concatenation( primitive_operations, [
          #"CartesianLambdaIntroduction",
          #"CartesianLambdaElimination",
          ] ) );;

CapJitPrecompileCategoryAndCompareResult(
        category_constructor,
        given_arguments,
        package_name,
        compiled_category_name
        : operations := list_of_operations,
        number_of_objectified_objects_in_data_structure_of_object := 1,
        number_of_objectified_morphisms_in_data_structure_of_object := 0,
        number_of_objectified_objects_in_data_structure_of_morphism := 2,
        number_of_objectified_morphisms_in_data_structure_of_morphism := 1
);;

SkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategoryPrecompiled( );
#! SkeletalFinSetsAsFiniteStrictCoproductCompletionOfTerminalCategory

cat := SkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategory( );
#! SkeletalFinSetsAsFiniteStrictCoproductCompletionOfTerminalCategory

cat!.precompiled_functions_added;
#! true

#! #@fi

#! @EndExample
