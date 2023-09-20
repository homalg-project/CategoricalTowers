#! @Chunk SliceCategoryOfCategoryOfRowsOfFieldOverTensorUnitPrecompiled

#! @Example

LoadPackage( "SubcategoriesForCAP" );
#! true
LoadPackage( "FreydCategoriesForCAP" );
#! true

QQ := HomalgFieldOfRationals( );;

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

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "matrix", "dimension", "ring" ],
        src_template := "HomalgIdentityMatrix( dimension, ring ) * matrix",
        dst_template := "matrix",
    )
);

# Iterated: function always choosing first value
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list" ],
        src_template := "Iterated( list, { x, y } -> x )",
        dst_template := "list[1]",
    )
);

# Length( [ 1 .. n ] ) -> n
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "n" ],
        src_template := "Length( [ 1 .. n ] )",
        dst_template := "n"
    )
);

# we do not use SliceCategoryOverTensorUnit because that installs more operations
# which we are not interested in for this simple test
category_constructor := field ->
    SliceCategory(
        TensorUnit(
            CategoryOfRows( field : FinalizeCategory := true )
        )
    );;

given_arguments := [ QQ ];;
compiled_category_name := "SliceCategoryOfCategoryOfRowsOfFieldOverTensorUnitPrecompiled";;
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
