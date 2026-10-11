#! @Chapter Precompilation
#! @Section Precompiling the category of permutations

#! @Example

#! #@if ValueOption( "no_precompiled_code" ) <> true

LoadPackage( "SubcategoriesForCAP", false );
#! true
ReadPackageOnce( "FinSetsForCAP", "gap/CompilerLogic.gi" );
#! true
ReadPackageOnce( "FinSetsForCAP", "gap/CompilerLogicWithCountingStartingAt1.gi" );
#! true
ReadPackageOnce( "SubcategoriesForCAP", "gap/PermutationCategory_CompilerLogic.gi" );
#! true

category_constructor := { } -> PermutationCategory( : no_precompiled_code := true );;
given_arguments := [ ];;
compiled_category_name := "PermutationCategory_precompiled";;
package_name := "SubcategoriesForCAP";;
list_of_operations := SortedList( [
    "ObjectConstructor",
    "MorphismConstructor",
    "ObjectDatum",
    "MorphismDatum",
    "IsEqualForObjects",
    "IsEqualForMorphisms",
    "IsCongruentForMorphisms",
    "IsWellDefinedForObjects",
    "IsWellDefinedForMorphisms",
    "IdentityMorphism",
    "PreCompose",
    "InverseForMorphisms",
    "Coproduct",
    "CoproductFunctorialWithGivenCoproducts",
    "TensorUnit",
    "TensorProductOnObjects",
    "TensorProductOnMorphismsWithGivenTensorProducts",
    "TensorProductOnObjectAndMorphismWithGivenTensorProducts",
    "TensorProductOnMorphismAndObjectWithGivenTensorProducts",
] );;

# CapJitSetDebugLevel( 1 );

CapJitPrecompileCategoryAndCompareResult(
        category_constructor,
        given_arguments,
        package_name,
        compiled_category_name
        : operations := list_of_operations,
        number_of_objectified_objects_in_data_structure_of_object := 1,
        number_of_objectified_morphisms_in_data_structure_of_object := 0,
        number_of_objectified_objects_in_data_structure_of_morphism := 1,
        number_of_objectified_morphisms_in_data_structure_of_morphism := 1
);;

cat := PermutationCategory( );
#! PermutationCategory

cat!.precompiled_functions_added;
#! true

#! #@fi

#! @EndExample
