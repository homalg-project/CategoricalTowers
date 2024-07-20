#! @Chapter Precompilation

#! @Section Precompiling the category of finite quivers

#! @Example

#! #@if ValueOption( "no_precompiled_code" ) <> true

LoadPackage( "FunctorCategories", false );
#! true

LoadPackage( "CompilerForCAP", ">= 2024.07-09", false );
#! true

ReadPackageOnce( "FinSetsForCAP", "gap/CompilerLogic.gi" );
#! true

ReadPackageOnce( "Algebroids", "gap/CompilerLogic.gi" );
#! true

ReadPackageOnce( "FunctorCategories", "gap/CompilerLogic.gi" );
#! true

category_constructor := { } -> CategoryOfQuiversEnrichedOver( SkeletalCategoryOfFiniteSets( : FinalizeCategory := true ) );;

given_arguments := [ ];;
compiled_category_name := "FinQuiversPrecompiled";;
package_name := "FunctorCategories";;

CapJitPrecompileCategoryAndCompareResult(
    category_constructor,
    given_arguments,
    package_name,
    compiled_category_name
   : operations := [ "InitialObject",
                     "Coproduct",
                     #"InjectionOfCofactorOfCoproductWithGivenCoproduct",
                     #"UniversalMorphismFromCoproductWithGivenCoproduct",
                     #"CoproductOnMorphismsWithGivenCoproducts", # <- derived and leads to an error
                     #"CoproductFunctorialWithGivenCoproducts", # <- derived
                     "DistinguishedObjectOfHomomorphismStructure",
                     "HomomorphismStructureOnObjects",
                     #"HomomorphismStructureOnMorphismsWithGivenObjects",
                     "InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism",
                     "MorphismsOfExternalHom",
                     ]
);;

FinQuiversPrecompiled( );
#! CategoryOfQuiversEnrichedOver( SkeletalFinSets )

cat := CategoryOfQuiversEnrichedOver( SkeletalFinSets );
#! FinQuivers

cat!.precompiled_functions_added;
#! true

#! #@fi

#! @EndExample
