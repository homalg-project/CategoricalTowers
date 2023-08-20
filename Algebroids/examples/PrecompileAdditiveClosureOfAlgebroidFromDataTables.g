#! @BeginChunk PrecompileAdditiveClosureOfAlgebroidFromDataTables

#! @Example

#! #@if ValueOption( "no_precompiled_code" ) <> true

LoadPackage( "Algebroids", false );
#! true
LoadPackage( "CompilerForCAP", false );
#! true

ReadPackageOnce( "Algebroids", "gap/CompilerLogic.gi" );
#! true

CapJitAddTypeSignature( "\*", [ IsHomalgRingElement, IsInt ], IsHomalgRingElement );;

category_constructor :=
  data_tables -> AdditiveClosure( AlgebroidFromDataTables( ShallowCopy( data_tables ) : range_of_HomStructure := CategoryOfRowsAsAdditiveClosureOfRingAsCategory( data_tables.coefficients_ring : FinalizeCategory := true ), FinalizeCategory := true ) );;

Q := HomalgFieldOfRationals();;

given_arguments :=
  [ rec( coefficients_ring := Q,
         nr_objs := 1,
         labels_objs := [ "*" ],
         indices_objs := [ 1 ],
         nr_gmors := 1,
         labels_gmors := [ "x" ],
         ranges_gmors := [ 1 ],
         sources_gmors := [ 1 ],
         indices_gmors := [ 2 ],
         nr_bases_elms := 3,
         bases_elms_comps := [ [ -1 ], [ 1 ], [ 1, 1 ] ],
         indices_of_bases_elms := [ [ [ 1, 2, 3 ] ] ],
         hom_structure_gmors_objs := [ [ [ [ 0, 1, 0 ], [ 0, 0, 1 ], [ 0, 0, 0 ] ] ] ],
         hom_structure_objs_gmors := [ [ [ [ 0, 1, 0 ], [ 0, 0, 1 ], [ 0, 0, 0 ] ] ] ] ) ];;

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
