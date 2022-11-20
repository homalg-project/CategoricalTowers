# @Chapter Precompilation

# @Section Precompiling the category of presheaves with values in SkeletalFinSets

# @Example

LoadPackage( "FunctorCategories", false );
#! true

LoadPackage( "CompilerForCAP", ">= 2022.09-02", false );
#! true

ReadPackage( "FinSetsForCAP", "gap/CompilerLogic.gi" );
#! true

ReadPackage( "FunctorCategories", "gap/CompilerLogic.gi" );
#! true

free_category_of_quiver := { quiver, sFinSets } -> FreeCategory( quiver : range_of_HomStructure := sFinSets, FinalizeCategory := true );;

category_constructor :=
  function( quiver )
    local sFinSets; sFinSets := CategoryOfSkeletalFinSets( : FinalizeCategory := true ); return PreSheaves( FreeCategory( quiver : range_of_HomStructure := sFinSets, FinalizeCategory := true ), sFinSets ); end;;

given_arguments := [ RightQuiver( "q(2)[m:1->2]" ) ];;
compiled_category_name := "PreSheavesInSkeletalFinSetsPrecompiled";;
package_name := "FunctorCategories";;

CapJitPrecompileCategoryAndCompareResult(
    category_constructor,
    given_arguments,
    package_name,
    compiled_category_name
   : operations := [ "InitialObject",
                     "Coproduct",
                     "InjectionOfCofactorOfCoproductWithGivenCoproduct",
                     "UniversalMorphismFromCoproductWithGivenCoproduct",
                     #"CoproductOnMorphismsWithGivenCoproducts", # <- derived and leads to an error
                     #"CoproductFunctorialWithGivenCoproducts", # <- derived
                     "HomomorphismStructureOnObjects",
                     "HomomorphismStructureOnMorphismsWithGivenObjects",
                     "InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism",
                     "MorphismsOfExternalHom",
                     #"ExponentialOnObjects",
                     ]
);;

PreSheavesInSkeletalFinSetsPrecompiled( given_arguments[1] );
#! PreSheaves( FreeCategory( RightQuiver( "q(2)[m:1->2]" ) ), SkeletalFinSets )

cat := PreSheaves( free_category_of_quiver( given_arguments[1], SkeletalFinSets ) );
#! PreSheaves( FreeCategory( RightQuiver( "q(2)[m:1->2]" ) ), SkeletalFinSets )

# Now we check whether the compiled code is loaded automatically.
# For this we use the name of the argument of `InitialObject`;
# for non-compiled code it is "cat", while for compiled code it is "cat_1":
argument_name := NamesLocalVariablesFunction(
    Last( cat!.added_functions.InitialObject )[1] )[1];;

(ValueOption( "no_precompiled_code" ) = true and argument_name = "cat") or
    (ValueOption( "no_precompiled_code" ) = fail and argument_name = "cat_1");
#! true

# @EndExample
