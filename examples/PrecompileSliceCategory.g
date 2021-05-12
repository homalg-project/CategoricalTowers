#! @Chunk SliceCategoryOfCategoryOfRowsOfFieldOverTensorUnitPrecompiled

#! @Example

LoadPackage( "SubcategoriesForCAP" );
#! true
LoadPackage( "FreydCategoriesForCAP" );
#! true

QQ := HomalgFieldOfRationals( );;

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

Add( CAP_JIT_NON_RESOLVABLE_GLOBAL_VARIABLE_NAMES, "HomalgIdentityMatrix" );;
Add( CAP_JIT_NON_RESOLVABLE_GLOBAL_VARIABLE_NAMES, "HomalgZeroMatrix" );;

CapJitPrecompileCategoryAndCompareResult(
    category_constructor,
    given_arguments,
    package_name,
    compiled_category_name
    : operations := "primitive"
);

#! @EndExample
