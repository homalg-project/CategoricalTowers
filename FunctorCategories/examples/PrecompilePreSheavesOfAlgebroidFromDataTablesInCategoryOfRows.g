#! @Chapter Precompilation

#! @Section Precompiling the presheaf category of an algebroid from data tables with values in a category of rows

#! @Example

#! #@if ValueOption( "no_precompiled_code" ) <> true

LoadPackage( "FunctorCategories", false );
#! true

LoadPackage( "CompilerForCAP", ">= 2022.09-20", false );
#! true

ReadPackageOnce( "FreydCategoriesForCAP", "gap/CategoryOfRows_as_AdditiveClosure_RingAsCategory_CompilerLogic.gi" );
#! true

ReadPackageOnce( "FinSetsForCAP", "gap/CompilerLogic.gi" );
#! true

ReadPackageOnce( "Algebroids", "gap/CompilerLogic.gi" );
#! true

ReadPackageOnce( "FunctorCategories", "gap/CompilerLogic.gi" );
#! true

k := HomalgFieldOfRationalsInSingular( );;
quiver := RightQuiver( "q(3)[a:1->2,b:2->3]" );;
kF := k[FreeCategory( quiver )];;
A := AlgebroidFromDataTables( kF / [ kF.ab ] );;

category_constructor := A -> PreSheaves( A, CategoryOfRows( CommutativeRingOfLinearCategory( A ) : FinalizeCategory := true, no_precompiled_code := false ) );;

precompile_PreSheavesOfAlgebroidFromDataTablesInCategoryOfRows :=
  function( A, compiled_category_name )
    CapJitPrecompileCategoryAndCompareResult(
            category_constructor,
            [ A ],
            "FunctorCategories",
            compiled_category_name
            : operations :=
            Difference( Concatenation(
                    ListPrimitivelyInstalledOperationsOfCategory( category_constructor( A : no_precompiled_code := true ) ),
                    [ "InverseForMorphisms" ] ),
                    [ "IsZeroForObjects",
                      "IsZeroForMorphisms",
                      "IsEpimorphism",
                      "IsMonomorphism",
                      "IsIsomorphism",
                      "IsEqualForMorphisms",
                      "IsWellDefinedForObjects",
                      "IsProjective",
                      "IsInjective",
                      "EpimorphismFromSomeProjectiveObject",
                      "MonomorphismIntoSomeInjectiveObject",
                      "ProjectiveLift",
                      "InjectiveColift",
                      "EpimorphismFromProjectiveCoverObject",
                      "MonomorphismIntoInjectiveEnvelopeObject",
                      "IndecomposableProjectiveObjects",
                      "IndecomposableInjectiveObjects",
                      "IsReflexive",
                      ] ) ); end;;

precompile_PreSheavesOfAlgebroidFromDataTablesInCategoryOfRows( A, "PreSheavesOfAlgebroidFromDataTablesInCategoryOfRowsPrecompiled" );

cat := PreSheavesOfAlgebroidFromDataTablesInCategoryOfRowsPrecompiled( A );;
cat!.precompiled_functions_added;
#! true

#! #@fi

#! @EndExample
