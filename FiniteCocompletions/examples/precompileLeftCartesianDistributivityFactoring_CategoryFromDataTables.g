#! @Chapter Precompilation

#! @Section Extracting LeftCartesianDistributivityFactoring from ur-algorithms using CategoryFromDataTables

#! @Example

#! #@if ValueOption( "no_precompiled_code" ) <> true

LoadPackage( "FiniteCocompletions", false );
#! true

LoadPackage( "CompilerForCAP", ">= 2025.11-01", false );
#! true

ReadPackageOnce( "FinSetsForCAP", "gap/CompilerLogic.gi" );
#! true

sFinSets := CategoryOfSkeletalFinSets( : no_precompiled_code := true );
#! SkeletalFinSets

q := RightQuiver( "Q(a,b,c)[]" );
#! Q(a,b,c)[]

C := FreeCategory( q : range_of_HomStructure := sFinSets );
#! FreeCategory( RightQuiver( "Q(a,b,c)[]" ) )

C := CategoryFromDataTables( C :
             set_category_attribute_resolving_functions := true,
             no_precompiled_code := true );
#! FreeCategory( RightQuiver( "Q(a,b,c)[]" ) )

DC := FreeDistributiveCategoryWithStrictProductAndCoproducts( C );
#! FreeDistributiveCategoryWithStrictProductAndCoproducts(
#! FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )

UPC := ModelingCategory( DC );
#! FiniteStrictCoproductCompletion( FiniteStrictProductCompletion(
#! FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) ) )

PC := UnderlyingCategory( UPC );
#! FiniteStrictProductCompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )

a := DC.a;
#! <An object in FreeDistributiveCategoryWithStrictProductAndCoproducts(
#!  FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
b := DC.b;
#! <An object in FreeDistributiveCategoryWithStrictProductAndCoproducts(
#!  FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
c := DC.c;
#! <An object in FreeDistributiveCategoryWithStrictProductAndCoproducts(
#!  FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>

axb_u_axc := Coproduct( DirectProduct( a, b ), DirectProduct( a, c ) );
#! <An object in FreeDistributiveCategoryWithStrictProductAndCoproducts(
#!  FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>

a_x_buc := DirectProduct( a, Coproduct( b, c ) );
#! <An object in FreeDistributiveCategoryWithStrictProductAndCoproducts(
#!  FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>

axb_u_axc = a_x_buc;
#! true
implemented_func :=
  function( T, source, a, b, c, target )
    return LeftCartesianDistributivityFactoringWithGivenObjects( T,
                   source,
                   a,
                   [ b, c ],
                   target ); end;
#! function( T, source, a, b, c, target ) ... end

lfactor_implemented := implemented_func( DC, axb_u_axc, a, b, c, a_x_buc );
#! <A morphism in FreeDistributiveCategoryWithStrictProductAndCoproducts(
#!  FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>

StartTimer( "LeftCartesianDistributivityFactoringWithGivenObjects" );
StopCompilationAtPrimitivelyInstalledOperationsOfCategory( DC );

ReadPackageOnce( "FiniteCocompletions",
    "examples/precompileLeftCartesianDistributivityFactoring_CompilerLogic.g" );

#! true
compiled_implemented_func :=
  CapJitCompiledFunction( implemented_func,
          DC,
          [ "category", "object", "object", "object", "object", "object" ],
          "morphism" );
#! function( T_1, source_1, a_1, b_1, c_1, target_1 ) ... end

StopTimer( "LeftCartesianDistributivityFactoringWithGivenObjects" );
#DisplayTimer( "LeftCartesianDistributivityFactoringWithGivenObjects" );

compiled_implemented_func( DC, axb_u_axc, a, b, c, a_x_buc ) =
  lfactor_implemented;
#! true

Display( compiled_implemented_func );
#! function ( T_1, source_1, a_1, b_1, c_1, target_1 )
#!     local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1,
#!           deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1;
#!     deduped_8_1 := [ b_1, c_1 ];
#!     deduped_7_1 := [ a_1, c_1 ];
#!     deduped_6_1 := [ a_1, b_1 ];
#!     deduped_5_1 := Coproduct( T_1, deduped_8_1 );
#!     deduped_4_1 := DirectProduct( T_1, deduped_7_1 );
#!     deduped_3_1 := DirectProduct( T_1, deduped_6_1 );
#!     deduped_2_1 := [ a_1, deduped_5_1 ];
#!     deduped_1_1 := DirectProduct( T_1, deduped_2_1 );
#!     return
#!       UniversalMorphismFromCoproductWithGivenCoproduct( T_1,
#!         [ deduped_3_1, deduped_4_1 ],
#!         target_1,
#!         [ UniversalMorphismIntoDirectProductWithGivenDirectProduct( T_1,
#!             deduped_2_1,
#!             deduped_3_1,
#!             [ ProjectionInFactorOfDirectProductWithGivenDirectProduct( T_1,
#!                     deduped_6_1, 1,
#!                     deduped_3_1 ),
#!               PreCompose( T_1,
#!                   ProjectionInFactorOfDirectProductWithGivenDirectProduct( T_1,
#!                           deduped_6_1,
#!                           2,
#!                           deduped_3_1 ),
#!                   InjectionOfCofactorOfCoproductWithGivenCoproduct( T_1,
#!                           deduped_8_1,
#!                           1,
#!                           deduped_5_1 ) ) ],
#!             deduped_1_1 ),
#!           UniversalMorphismIntoDirectProductWithGivenDirectProduct( T_1,
#!               deduped_2_1,
#!               deduped_4_1,
#!               [ ProjectionInFactorOfDirectProductWithGivenDirectProduct( T_1,
#!                   deduped_7_1,
#!                   1,
#!                   deduped_4_1 ),
#!                 PreCompose( T_1,
#!                     ProjectionInFactorOfDirectProductWithGivenDirectProduct( T_1,
#!                             deduped_7_1,
#!                             2,
#!                             deduped_4_1 ),
#!                     InjectionOfCofactorOfCoproductWithGivenCoproduct( T_1,
#!                             deduped_8_1,
#!                             2,
#!                             deduped_5_1 ) ) ],
#!               deduped_1_1 ) ],
#!         source_1 );
#! end

ContinueCompilationAtPrimitivelyInstalledOperationsOfCategory( DC );
ContinueCompilationAtPrimitivelyInstalledOperationsOfCategory( C );

hom_axb_u_axc_a_x_buc := MorphismsOfExternalHom( axb_u_axc, a_x_buc );;

Length( hom_axb_u_axc_a_x_buc ) = 1;
#! true

lfactor := hom_axb_u_axc_a_x_buc[1];
#! <A morphism in FreeDistributiveCategoryWithStrictProductAndCoproducts(
#!  FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>

IsOne( lfactor );
#! true

lfactor_reconstructed :=
  CellAsEvaluatableString( lfactor, [ "DC", "UPC", "PC", "C" ] );;

lfactor = EvalString( lfactor_reconstructed );
#! true

hom_a_x_buc_axb_u_axc := MorphismsOfExternalHom( a_x_buc, axb_u_axc );;

Length( hom_a_x_buc_axb_u_axc ) = 1;
#! true

lexpand := hom_a_x_buc_axb_u_axc[1];
#! <A morphism in FreeDistributiveCategoryWithStrictProductAndCoproducts(
#!  FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>

IsOne( lexpand );
#! true

Inverse( lfactor ) = lexpand;
#! true
lexpand_reconstructed :=
  CellAsEvaluatableString( lexpand, [ "DC", "UPC", "PC", "C" ] );;

lexpand_reconstructed = lfactor_reconstructed;
#! true

lexpand = EvalString( lexpand_reconstructed );
#! true

ReadPackage( "FiniteCocompletions",
        "examples/precompileLeftCartesianDistributivityFactoring_func.g" );
#! true

func( DC, a_x_buc, a, b, c, axb_u_axc ) = lfactor;
#! true

T := DummyCategory( rec( name := "A placeholder distributive category",
       properties := [ "IsDistributiveCategory" ],
       list_of_operations_to_install :=
       Concatenation( [ "ObjectConstructor", "MorphismConstructor" ],
       ListOfDefiningWithGivenOperations( "IsDistributiveCategory" ) ) ) );
#! A placeholder distributive category

StartTimer( "LeftCartesianDistributivityFactoringWithGivenObjects" );
StopCompilationAtPrimitivelyInstalledOperationsOfCategory( T );

compiled_func :=
  CapJitCompiledFunction( func,
          T,
          [ "category", "object", "object", "object", "object", "object" ],
          "morphism" );
#! function( T_1, source_1, a_1, b_1, c_1, target_1 ) ... end

StopTimer( "LeftCartesianDistributivityFactoringWithGivenObjects" );
#DisplayTimer( "LeftCartesianDistributivityFactoringWithGivenObjects" );

compiled_func( DC, axb_u_axc, a, b, c, a_x_buc ) = lfactor;
#! true

Display( compiled_func );
#! function ( T_1, source_1, a_1, b_1, c_1, target_1 )
#!     local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1;
#!     deduped_5_1 := [ a_1, c_1 ];
#!     deduped_4_1 := [ a_1, b_1 ];
#!     deduped_3_1 := DirectProduct( T_1, deduped_5_1 );
#!     deduped_2_1 := DirectProduct( T_1, deduped_4_1 );
#!     deduped_1_1 := [ deduped_2_1, deduped_3_1 ];
#!     return
#!       UniversalMorphismFromCoproductWithGivenCoproduct( T_1,
#!         deduped_1_1,
#!         target_1,
#!         [ PreCompose( T_1,
#!             UniversalMorphismIntoDirectProductWithGivenDirectProduct( T_1,
#!                 deduped_4_1,
#!                 deduped_2_1,
#!                 [ ProjectionInFactorOfDirectProductWithGivenDirectProduct( T_1,
#!                         deduped_4_1,
#!                         1,
#!                         deduped_2_1 ),
#!                   ProjectionInFactorOfDirectProductWithGivenDirectProduct( T_1,
#!                           deduped_4_1,
#!                           2, deduped_2_1 ) ],
#!                 deduped_2_1 ),
#!             InjectionOfCofactorOfCoproductWithGivenCoproduct( T_1,
#!                 deduped_1_1,
#!                 1,
#!                 target_1 ) ),
#!           PreCompose( T_1,
#!               UniversalMorphismIntoDirectProductWithGivenDirectProduct( T_1,
#!                   deduped_5_1,
#!                   deduped_3_1,
#!                   [ ProjectionInFactorOfDirectProductWithGivenDirectProduct( T_1,
#!                           deduped_5_1,
#!                           1,
#!                           deduped_3_1 ),
#!                     ProjectionInFactorOfDirectProductWithGivenDirectProduct( T_1,
#!                             deduped_5_1,
#!                             2,
#!                             deduped_3_1 ) ],
#!                   deduped_3_1 ),
#!               InjectionOfCofactorOfCoproductWithGivenCoproduct( T_1,
#!                   deduped_1_1,
#!                   2,
#!                   target_1 ) ) ],
#!         source_1 );
#! end

#! #@fi

#! @EndExample
