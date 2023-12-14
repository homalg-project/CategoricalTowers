#! @Chapter Precompilation

#! @Section Precompiling the presheaf category of an algebroid with values in a category of rows

#! @Example

#! #@if ValueOption( "no_precompiled_code" ) <> true

LoadPackage( "FunctorCategories", false );
#! true

LoadPackage( "CompilerForCAP", ">= 2023.12-20", false );
#! true

ReadPackageOnce( "FreydCategoriesForCAP", "gap/CategoryOfRowsAsAdditiveClosureOfRingAsCategory_CompilerLogic.gi" );
#! true

ReadPackageOnce( "FinSetsForCAP", "gap/CompilerLogic.gi" );
#! true

ReadPackageOnce( "Algebroids", "gap/CompilerLogic.gi" );
#! true

ReadPackageOnce( "FunctorCategories", "gap/CompilerLogic.gi" );
#! true

QQ := HomalgFieldOfRationals( );;
quiver := RightQuiver( "q(3)[a:1->2,b:2->3]" );;
A := QQ[FreeCategory( quiver )];;
A_bar := A / [ A.ab ];;

category_constructor := A -> PreSheaves( A, CategoryOfRows( CommutativeRingOfLinearCategory( A ) : FinalizeCategory := true, no_precompiled_code := false ) );;

precompile_PreSheavesOfAlgebroidInCategoryOfRows :=
  function( A, compiled_category_name )
    CapJitPrecompileCategoryAndCompareResult(
            category_constructor,
            [ A ],
            "FunctorCategories",
            compiled_category_name
            : operations :=
            Difference( ListPrimitivelyInstalledOperationsOfCategory( category_constructor( A : no_precompiled_code := true ) ),
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
                      "CoefficientsOfMorphism",
                      ] ) ); end;;

precompile_PreSheavesOfAlgebroidInCategoryOfRows( A, "PreSheavesOfFreeAlgebroidInCategoryOfRowsPrecompiled" );

precompile_PreSheavesOfAlgebroidInCategoryOfRows( A_bar, "PreSheavesOfAlgebroidWithRelationsInCategoryOfRowsPrecompiled" );

PreSheavesOfFreeAlgebroidInCategoryOfRowsPrecompiled( A );
#! PreSheaves( Algebroid( Q, FreeCategory(
#! RightQuiver( "q(3)[a:1->2,b:2->3]" ) ) ),
#! Rows( Q ) )

cat := PreSheavesOfAlgebroidWithRelationsInCategoryOfRowsPrecompiled( A_bar );
#! PreSheaves( Algebroid( Q, FreeCategory(
#! RightQuiver( "q(3)[a:1->2,b:2->3]" ) ) ) / relations,
#! Rows( Q ) )

cat!.precompiled_functions_added;
#! true

#! #@fi

#! @EndExample
