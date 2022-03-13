# @Chapter Precompilation

# @Section Precompiling the presheaf category with values in a category of rows

# @Example

LoadPackage( "FunctorCategories", false );
#! true

LoadPackage( "CompilerForCAP", ">= 2022.09-02", false );
#! true

ReadPackage( "FreydCategoriesForCAP", "gap/MatrixCategoryAsCategoryOfRows_CompilerLogic.gi" );
#! true

ReadPackage( "Algebroids", "gap/CompilerLogic.gi" );
#! true

ReadPackage( "FunctorCategories", "gap/CompilerLogic.gi" );
#! true

QQ := HomalgFieldOfRationals( );;
quiver := RightQuiver( "q(3)[a:1->2,b:2->3]" );;
A := QQ[FreeCategory( quiver )];;
A_bar := A / [ A.ab ];;

category_constructor := A -> PreSheaves( A, CategoryOfRows( CommutativeRingOfLinearCategory( A ) : FinalizeCategory := true, no_precompiled_code := false ) );;

precompile_PreSheavesInCategoryOfRows :=
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
                      ] ) ); end;;

precompile_PreSheavesInCategoryOfRows( A, "PreSheavesOfFreeAlgebroidInCategoryOfRowsPrecompiled" );

precompile_PreSheavesInCategoryOfRows( A_bar, "PreSheavesOfAlgebroidWithRelationsInCategoryOfRowsPrecompiled" );

PreSheavesOfFreeAlgebroidInCategoryOfRowsPrecompiled( A );
#! PreSheaves( Algebroid( Q, FreeCategory(
#! RightQuiver( "q(3)[a:1->2,b:2->3]" ) ) ),
#! Category of matrices over Q )

cat := PreSheavesOfAlgebroidWithRelationsInCategoryOfRowsPrecompiled( A_bar );
#! PreSheaves( Algebroid( Q, FreeCategory(
#! RightQuiver( "q(3)[a:1->2,b:2->3]" ) ) ) / relations,
#! Category of matrices over Q )

# Now we check whether the compiled code is loaded automatically.
# For this we use the name of the argument of `InitialObject`;
# for non-compiled code it is "cat", while for compiled code it is "cat_1":
argument_name := NamesLocalVariablesFunction(
    Last( cat!.added_functions.ZeroObject )[1] )[1];;

(ValueOption( "no_precompiled_code" ) = true and argument_name = "cat") or
    (ValueOption( "no_precompiled_code" ) = fail and argument_name = "cat_1");
#! true

# @EndExample
