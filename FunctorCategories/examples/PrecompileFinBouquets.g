#! @Chapter Precompilation

#! @Section Precompiling the category of finite quivers

#! @Example

LoadPackage( "FunctorCategories", false );
#! true

LoadPackage( "CompilerForCAP", ">= 2022.09-02", false );
#! true

ReadPackageOnce( "FinSetsForCAP", "gap/CompilerLogic.gi" );
#! true

ReadPackageOnce( "Algebroids", "gap/CompilerLogic.gi" );
#! true

ReadPackageOnce( "FunctorCategories", "gap/CompilerLogic.gi" );
#! true

category_constructor := { } -> CategoryOfBouquetsEnrichedOver( CategoryOfSkeletalFinSets( : FinalizeCategory := true ) );;

given_arguments := [ ];;
compiled_category_name := "FinBouquetsPrecompiled";;
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
                     "DistinguishedObjectOfHomomorphismStructure",
                     "HomomorphismStructureOnObjects",
                     #"HomomorphismStructureOnMorphismsWithGivenObjects",
                     "InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism",
                     "MorphismsOfExternalHom",
                     ]
);;

FinBouquetsPrecompiled( );
#! CategoryOfBouquetsEnrichedOver( SkeletalFinSets )

cat := CategoryOfBouquetsEnrichedOver( SkeletalFinSets );
#! FinBouquets

# Now we check whether the compiled code is loaded automatically.
# For this we use the name of the argument of `InitialObject`;
# for non-compiled code it is "cat", while for compiled code it is "cat_1":
argument_name := NamesLocalVariablesFunction(
    Last( cat!.added_functions.InitialObject )[1] )[1];;

(ValueOption( "no_precompiled_code" ) = true and argument_name = "cat") or
    (ValueOption( "no_precompiled_code" ) = fail and argument_name = "cat_1");
#! true

#! @EndExample
