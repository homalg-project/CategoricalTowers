#! @BeginChunk PrecompileAdditiveClosureOfAlgebroidFromDataTables

#! @Example

#! #@if ValueOption( "no_precompiled_code" ) <> true

LoadPackage( "Algebroids", false );
#! true
LoadPackage( "CompilerForCAP", ">= 2023.12-20", false );
#! true

ReadPackageOnce( "Algebroids", "gap/CompilerLogic.gi" );
#! true

CapJitAddTypeSignature( "\*", [ IsHomalgRingElement, IsInt ], input_types -> input_types[1] );;

category_constructor :=
  data_tables -> AdditiveClosure( AlgebroidFromDataTables( ShallowCopy( data_tables ) : range_of_HomStructure := CategoryOfRowsAsAdditiveClosureOfRingAsCategory( data_tables[1] : FinalizeCategory := true ), FinalizeCategory := true ) );;

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

package_name := "Algebroids";;

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

#! @EndExample
#! @EndChunk
