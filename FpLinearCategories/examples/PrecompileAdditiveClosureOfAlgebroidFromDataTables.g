#! @BeginChunk PrecompileAdditiveClosureOfAlgebroidFromDataTables

#! @Example

#! #@if ValueOption( "no_precompiled_code" ) <> true and String({}->1-[1-1]) = "function (  ) return 1 - [ (1 - 1) ]; end"

LoadPackage( "FpLinearCategories", false );
#! true
LoadPackage( "CompilerForCAP", ">= 2024.07-09", false );
#! true

ReadPackageOnce( "FpLinearCategories", "gap/CompilerLogic.gi" );
#! true

CapJitAddTypeSignature( "\*", [ IsHomalgRingElement, IsInt ], input_types -> input_types[1] );;

category_constructor :=
  data_tables -> AdditiveClosure( AlgebroidFromDataTables( ShallowCopy( data_tables ) : range_of_HomStructure := CategoryOfRows_as_AdditiveClosure_RingAsCategory( data_tables[1] : FinalizeCategory := true ), FinalizeCategory := true ) );;

Q := HomalgFieldOfRationalsInSingular();;
q := FinQuiver( "q(*)[x:*->*]" );;

given_arguments :=
  [ NTuple( 5,
      # coefficients_ring
      Q,
      # quiver
      q,
      # decomposition_indices_of_bases_elements
      [ [ [ [ ], [ 1 ], [ 1, 1 ] ] ] ],
      # hom_structure_gmors_objs
      [ [ [ [ 0, 1, 0 ], [ 0, 0, 1 ], [ 0, 0, 0 ] ] ] ],
      # hom_structure_objs_gmors
      [ [ [ [ 0, 1, 0 ], [ 0, 0, 1 ], [ 0, 0, 0 ] ] ] ] ) ];;

compiled_category_name := "AdditiveClosureOfAlgebroidFromDataTablesPrecompiled";;

package_name := "FpLinearCategories";;

CapJitPrecompileCategoryAndCompareResult(
    category_constructor,
    given_arguments,
    package_name,
    compiled_category_name
    : operations := "primitive"
    );;

A := AdditiveClosureOfAlgebroidFromDataTablesPrecompiled( given_arguments[1] );;
A!.precompiled_functions_added;
#! true
#! #@fi

# @drop_example_in_Julia
#! @EndExample
#! @EndChunk
