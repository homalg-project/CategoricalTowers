# SPDX-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_CategoryOfBimonoidsAsComonoidsOfMonoidsPrecompiled_IsWellDefinedForObjects", function ( cat )
    
    ##
    AddIsWellDefinedForObjects( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1;
    deduped_36_1 := DefiningQuintupleOfInternalBimonoid( arg2_1 );
    deduped_35_1 := UnderlyingCategory( cat_1 );
    deduped_34_1 := deduped_36_1[5];
    deduped_33_1 := deduped_36_1[4];
    deduped_32_1 := TensorUnit( deduped_35_1 );
    deduped_31_1 := deduped_36_1[3];
    deduped_30_1 := deduped_36_1[2];
    deduped_29_1 := deduped_36_1[1];
    deduped_28_1 := Target( deduped_34_1 );
    deduped_27_1 := Source( deduped_34_1 );
    deduped_26_1 := TensorProductOnObjects( deduped_35_1, deduped_32_1, deduped_32_1 );
    deduped_25_1 := IdentityMorphism( deduped_35_1, deduped_32_1 );
    deduped_24_1 := Target( deduped_33_1 );
    deduped_23_1 := Source( deduped_33_1 );
    deduped_22_1 := TensorProductOnObjects( deduped_35_1, deduped_29_1, deduped_32_1 );
    deduped_21_1 := TensorProductOnObjects( deduped_35_1, deduped_32_1, deduped_29_1 );
    deduped_20_1 := IdentityMorphism( deduped_35_1, deduped_29_1 );
    deduped_19_1 := TensorProductOnObjects( deduped_35_1, deduped_29_1, deduped_29_1 );
    deduped_18_1 := Source( deduped_31_1 );
    deduped_17_1 := Target( deduped_31_1 );
    deduped_16_1 := Target( deduped_30_1 );
    deduped_15_1 := Source( deduped_30_1 );
    deduped_14_1 := BraidingWithGivenTensorProducts( deduped_35_1, deduped_19_1, deduped_29_1, deduped_29_1, deduped_19_1 );
    deduped_13_1 := TensorProductOnObjects( deduped_35_1, deduped_19_1, deduped_19_1 );
    deduped_12_1 := LeftUnitorWithGivenTensorProduct( deduped_35_1, deduped_32_1, deduped_26_1 );
    deduped_11_1 := TensorProductOnObjects( deduped_35_1, deduped_29_1, deduped_19_1 );
    deduped_10_1 := TensorProductOnObjects( deduped_35_1, deduped_19_1, deduped_29_1 );
    deduped_9_1 := Range( deduped_20_1 );
    deduped_8_1 := Source( deduped_20_1 );
    deduped_7_1 := IsEqualForObjects( deduped_35_1, deduped_29_1, deduped_29_1 ) and IsCongruentForMorphisms( deduped_35_1, deduped_30_1, deduped_30_1 ) and IsCongruentForMorphisms( deduped_35_1, deduped_31_1, deduped_31_1 );
    deduped_6_1 := AssociatorRightToLeftWithGivenTensorProducts( deduped_35_1, deduped_11_1, deduped_29_1, deduped_29_1, deduped_29_1, deduped_10_1 );
    deduped_5_1 := TensorProductOnObjects( deduped_35_1, deduped_10_1, deduped_29_1 );
    deduped_4_1 := AssociatorLeftToRightWithGivenTensorProducts( deduped_35_1, deduped_10_1, deduped_29_1, deduped_29_1, deduped_29_1, deduped_11_1 );
    deduped_3_1 := PreCompose( deduped_35_1, LeftUnitorInverseWithGivenTensorProduct( deduped_35_1, deduped_32_1, deduped_26_1 ), TensorProductOnMorphismsWithGivenTensorProducts( deduped_35_1, TensorProductOnObjects( deduped_35_1, deduped_15_1, deduped_15_1 ), deduped_30_1, deduped_30_1, TensorProductOnObjects( deduped_35_1, deduped_16_1, deduped_16_1 ) ) );
    deduped_2_1 := TensorProductOnMorphismsWithGivenTensorProducts( deduped_35_1, TensorProductOnObjects( deduped_35_1, deduped_8_1, Source( deduped_14_1 ) ), deduped_20_1, deduped_14_1, TensorProductOnObjects( deduped_35_1, deduped_9_1, Range( deduped_14_1 ) ) );
    deduped_1_1 := PreCompose( deduped_35_1, PreCompose( deduped_35_1, PreCompose( deduped_35_1, PreCompose( deduped_35_1, PreCompose( deduped_35_1, PreCompose( deduped_35_1, PreCompose( deduped_35_1, IdentityMorphism( deduped_35_1, deduped_13_1 ), AssociatorRightToLeftWithGivenTensorProducts( deduped_35_1, deduped_13_1, deduped_19_1, deduped_29_1, deduped_29_1, deduped_5_1 ) ), TensorProductOnMorphismsWithGivenTensorProducts( deduped_35_1, TensorProductOnObjects( deduped_35_1, Source( deduped_4_1 ), deduped_8_1 ), deduped_4_1, deduped_20_1, TensorProductOnObjects( deduped_35_1, Range( deduped_4_1 ), deduped_9_1 ) ) ), TensorProductOnMorphismsWithGivenTensorProducts( deduped_35_1, TensorProductOnObjects( deduped_35_1, Source( deduped_2_1 ), deduped_8_1 ), deduped_2_1, deduped_20_1, TensorProductOnObjects( deduped_35_1, Range( deduped_2_1 ), deduped_9_1 ) ) ), TensorProductOnMorphismsWithGivenTensorProducts( deduped_35_1, TensorProductOnObjects( deduped_35_1, Source( deduped_6_1 ), deduped_8_1 ), deduped_6_1, deduped_20_1, TensorProductOnObjects( deduped_35_1, Range( deduped_6_1 ), deduped_9_1 ) ) ), AssociatorLeftToRightWithGivenTensorProducts( deduped_35_1, deduped_5_1, deduped_19_1, deduped_29_1, deduped_29_1, deduped_13_1 ) ), TensorProductOnMorphismsWithGivenTensorProducts( deduped_35_1, TensorProductOnObjects( deduped_35_1, deduped_18_1, deduped_18_1 ), deduped_31_1, deduped_31_1, TensorProductOnObjects( deduped_35_1, deduped_17_1, deduped_17_1 ) ) ), IdentityMorphism( deduped_35_1, deduped_19_1 ) );
    return IsWellDefinedForObjects( deduped_35_1, deduped_29_1 ) and IsWellDefinedForMorphisms( deduped_35_1, deduped_30_1 ) and IsWellDefinedForMorphisms( deduped_35_1, deduped_31_1 ) and IsEqualForObjects( deduped_35_1, deduped_15_1, deduped_32_1 ) and IsEqualForObjects( deduped_35_1, deduped_16_1, deduped_29_1 ) and IsEqualForObjects( deduped_35_1, deduped_17_1, deduped_29_1 ) and IsEqualForObjects( deduped_35_1, deduped_18_1, deduped_19_1 ) and IsCongruentForMorphisms( deduped_35_1, PreCompose( deduped_35_1, TensorProductOnMorphismsWithGivenTensorProducts( deduped_35_1, TensorProductOnObjects( deduped_35_1, deduped_15_1, deduped_8_1 ), deduped_30_1, deduped_20_1, TensorProductOnObjects( deduped_35_1, deduped_16_1, deduped_9_1 ) ), deduped_31_1 ), LeftUnitorWithGivenTensorProduct( deduped_35_1, deduped_29_1, deduped_21_1 ) ) and IsCongruentForMorphisms( deduped_35_1, PreCompose( deduped_35_1, TensorProductOnMorphismsWithGivenTensorProducts( deduped_35_1, TensorProductOnObjects( deduped_35_1, deduped_8_1, deduped_15_1 ), deduped_20_1, deduped_30_1, TensorProductOnObjects( deduped_35_1, deduped_9_1, deduped_16_1 ) ), deduped_31_1 ), RightUnitorWithGivenTensorProduct( deduped_35_1, deduped_29_1, deduped_22_1 ) ) and IsCongruentForMorphisms( deduped_35_1, PreCompose( deduped_35_1, PreCompose( deduped_35_1, deduped_4_1, TensorProductOnMorphismsWithGivenTensorProducts( deduped_35_1, TensorProductOnObjects( deduped_35_1, deduped_8_1, deduped_18_1 ), deduped_20_1, deduped_31_1, TensorProductOnObjects( deduped_35_1, deduped_9_1, deduped_17_1 ) ) ), deduped_31_1 ), PreCompose( deduped_35_1, TensorProductOnMorphismsWithGivenTensorProducts( deduped_35_1, TensorProductOnObjects( deduped_35_1, deduped_18_1, deduped_8_1 ), deduped_31_1, deduped_20_1, TensorProductOnObjects( deduped_35_1, deduped_17_1, deduped_9_1 ) ), deduped_31_1 ) ) and (IsWellDefinedForMorphisms( deduped_35_1, deduped_33_1 ) and IsEqualForObjects( deduped_35_1, deduped_23_1, deduped_29_1 ) and IsEqualForObjects( deduped_35_1, deduped_24_1, deduped_32_1 ) and IsCongruentForMorphisms( deduped_35_1, PreCompose( deduped_35_1, deduped_30_1, deduped_33_1 ), deduped_25_1 ) and IsCongruentForMorphisms( deduped_35_1, PreCompose( deduped_35_1, TensorProductOnMorphismsWithGivenTensorProducts( deduped_35_1, TensorProductOnObjects( deduped_35_1, deduped_23_1, deduped_23_1 ), deduped_33_1, deduped_33_1, TensorProductOnObjects( deduped_35_1, deduped_24_1, deduped_24_1 ) ), deduped_12_1 ), PreCompose( deduped_35_1, deduped_31_1, deduped_33_1 ) )) and (IsWellDefinedForMorphisms( deduped_35_1, deduped_34_1 ) and IsEqualForObjects( deduped_35_1, deduped_27_1, deduped_29_1 ) and IsEqualForObjects( deduped_35_1, deduped_28_1, deduped_19_1 ) and IsCongruentForMorphisms( deduped_35_1, PreCompose( deduped_35_1, deduped_30_1, deduped_34_1 ), deduped_3_1 ) and IsCongruentForMorphisms( deduped_35_1, PreCompose( deduped_35_1, TensorProductOnMorphismsWithGivenTensorProducts( deduped_35_1, TensorProductOnObjects( deduped_35_1, deduped_27_1, deduped_27_1 ), deduped_34_1, deduped_34_1, TensorProductOnObjects( deduped_35_1, deduped_28_1, deduped_28_1 ) ), deduped_1_1 ), PreCompose( deduped_35_1, deduped_31_1, deduped_34_1 ) )) and (IsEqualForObjects( deduped_35_1, deduped_32_1, deduped_32_1 ) and IsCongruentForMorphisms( deduped_35_1, deduped_25_1, deduped_25_1 ) and IsCongruentForMorphisms( deduped_35_1, deduped_12_1, deduped_12_1 )) and deduped_7_1 and deduped_7_1 and (IsEqualForObjects( deduped_35_1, deduped_19_1, deduped_19_1 ) and IsCongruentForMorphisms( deduped_35_1, deduped_3_1, deduped_3_1 ) and IsCongruentForMorphisms( deduped_35_1, deduped_1_1, deduped_1_1 )) and IsCongruentForMorphisms( deduped_35_1, PreCompose( deduped_35_1, deduped_34_1, TensorProductOnMorphismsWithGivenTensorProducts( deduped_35_1, TensorProductOnObjects( deduped_35_1, deduped_23_1, deduped_8_1 ), deduped_33_1, deduped_20_1, TensorProductOnObjects( deduped_35_1, deduped_24_1, deduped_9_1 ) ) ), LeftUnitorInverseWithGivenTensorProduct( deduped_35_1, deduped_29_1, deduped_21_1 ) ) 
        and IsCongruentForMorphisms( deduped_35_1, PreCompose( deduped_35_1, deduped_34_1, TensorProductOnMorphismsWithGivenTensorProducts( deduped_35_1, TensorProductOnObjects( deduped_35_1, deduped_8_1, deduped_23_1 ), deduped_20_1, deduped_33_1, TensorProductOnObjects( deduped_35_1, deduped_9_1, deduped_24_1 ) ) ), RightUnitorInverseWithGivenTensorProduct( deduped_35_1, deduped_29_1, deduped_22_1 ) ) and IsCongruentForMorphisms( deduped_35_1, PreCompose( deduped_35_1, deduped_34_1, PreCompose( deduped_35_1, TensorProductOnMorphismsWithGivenTensorProducts( deduped_35_1, TensorProductOnObjects( deduped_35_1, deduped_8_1, deduped_27_1 ), deduped_20_1, deduped_34_1, TensorProductOnObjects( deduped_35_1, deduped_9_1, deduped_28_1 ) ), deduped_6_1 ) ), PreCompose( deduped_35_1, deduped_34_1, TensorProductOnMorphismsWithGivenTensorProducts( deduped_35_1, TensorProductOnObjects( deduped_35_1, deduped_27_1, deduped_8_1 ), deduped_34_1, deduped_20_1, TensorProductOnObjects( deduped_35_1, deduped_28_1, deduped_9_1 ) ) ) );
end
########
        
    , 100 );
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
end );

BindGlobal( "CategoryOfBimonoidsAsComonoidsOfMonoidsPrecompiled_IsWellDefinedForObjects", function ( symmoncat )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function ( symmoncat )
    return CATEGORY_OF_BIMONOIDS_AS_COMONOIDS_OF_MONOIDS( symmoncat );
end;
        
        
    
    cat := category_constructor( symmoncat : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_CategoryOfBimonoidsAsComonoidsOfMonoidsPrecompiled_IsWellDefinedForObjects( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
