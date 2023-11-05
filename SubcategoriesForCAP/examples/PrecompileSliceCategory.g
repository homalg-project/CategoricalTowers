#! @Chunk SliceCategoryOfCategoryOfRowsOfIntegersOverTensorUnitPrecompiled

#! @Example

LoadPackage( "SubcategoriesForCAP" );
#! true
LoadPackage( "FreydCategoriesForCAP" );
#! true

ZZZ := HomalgRingOfIntegers( );;

# HomalgIdentityMatrix( size, ring ) * matrix -> matrix
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "size", "ring", "matrix" ],
        src_template := "HomalgIdentityMatrix( size, ring ) * matrix",
        dst_template := "matrix",
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "matrix", "dimension", "ring" ],
        src_template := "matrix * HomalgIdentityMatrix( dimension, ring )",
        dst_template := "matrix",
    )
);

# we do not use SliceCategoryOverTensorUnit because that installs more operations
# which we are not interested in for this simple test
category_constructor := ring ->
    SliceCategory(
        TensorUnit(
            CategoryOfRows( ring : FinalizeCategory := true )
        )
    );;

given_arguments := [ ZZZ ];;
compiled_category_name := "SliceCategoryOfCategoryOfRowsOfRingOfIntegersOverTensorUnitPrecompiled";;
package_name := "SubcategoriesForCAP";;

CapJitPrecompileCategoryAndCompareResult(
    category_constructor,
    given_arguments,
    package_name,
    compiled_category_name
    : operations := "primitive",
    number_of_objectified_objects_in_data_structure_of_object := 3,
    number_of_objectified_morphisms_in_data_structure_of_object := 1,
    number_of_objectified_objects_in_data_structure_of_morphism := 6,
    number_of_objectified_morphisms_in_data_structure_of_morphism := 4
);

#! @EndExample
