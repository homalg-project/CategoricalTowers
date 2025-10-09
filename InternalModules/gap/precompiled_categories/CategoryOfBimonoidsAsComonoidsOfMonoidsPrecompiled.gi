# SPDX-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_CategoryOfBimonoidsAsComonoidsOfMonoidsPrecompiled", function ( cat )
    
    ##
    AddTensorUnit( cat,
        
########
function ( cat_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := UnderlyingCategory( cat_1 );
    deduped_2_1 := TensorUnit( deduped_3_1 );
    deduped_1_1 := IdentityMorphism( deduped_3_1, deduped_2_1 );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningQuintupleOfInternalBimonoid, NTuple( 5, deduped_2_1, deduped_1_1, LeftUnitor( deduped_3_1, deduped_2_1 ), deduped_1_1, LeftUnitorInverse( deduped_3_1, deduped_2_1 ) ) );
end
########
        
    , 100 );
    
    ##
    AddTensorProductOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1;
    deduped_12_1 := DefiningQuintupleOfInternalBimonoid( arg3_1 );
    deduped_11_1 := DefiningQuintupleOfInternalBimonoid( arg2_1 );
    deduped_10_1 := UnderlyingCategory( cat_1 );
    deduped_9_1 := TensorUnit( deduped_10_1 );
    deduped_8_1 := deduped_12_1[1];
    deduped_7_1 := deduped_11_1[1];
    deduped_6_1 := TensorProductOnObjects( deduped_10_1, deduped_7_1, deduped_7_1 );
    deduped_5_1 := IdentityMorphism( deduped_10_1, deduped_7_1 );
    deduped_4_1 := IdentityMorphism( deduped_10_1, deduped_8_1 );
    deduped_3_1 := TensorProductOnObjects( deduped_10_1, deduped_7_1, deduped_8_1 );
    deduped_2_1 := IdentityMorphism( deduped_10_1, deduped_3_1 );
    deduped_1_1 := IdentityMorphism( deduped_10_1, TensorProductOnObjects( deduped_10_1, deduped_3_1, deduped_3_1 ) );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningQuintupleOfInternalBimonoid, NTuple( 5, deduped_3_1, PreCompose( deduped_10_1, LeftUnitorInverse( deduped_10_1, deduped_9_1 ), TensorProductOnMorphisms( deduped_10_1, deduped_11_1[2], deduped_12_1[2] ) ), PreCompose( deduped_10_1, PreCompose( deduped_10_1, PreCompose( deduped_10_1, PreCompose( deduped_10_1, PreCompose( deduped_10_1, PreCompose( deduped_10_1, PreCompose( deduped_10_1, deduped_1_1, AssociatorRightToLeft( deduped_10_1, deduped_3_1, deduped_7_1, deduped_8_1 ) ), TensorProductOnMorphisms( deduped_10_1, AssociatorLeftToRight( deduped_10_1, deduped_7_1, deduped_8_1, deduped_7_1 ), deduped_4_1 ) ), TensorProductOnMorphisms( deduped_10_1, TensorProductOnMorphisms( deduped_10_1, deduped_5_1, Braiding( deduped_10_1, deduped_8_1, deduped_7_1 ) ), deduped_4_1 ) ), TensorProductOnMorphisms( deduped_10_1, AssociatorRightToLeft( deduped_10_1, deduped_7_1, deduped_7_1, deduped_8_1 ), deduped_4_1 ) ), AssociatorLeftToRight( deduped_10_1, deduped_6_1, deduped_8_1, deduped_8_1 ) ), TensorProductOnMorphisms( deduped_10_1, deduped_11_1[3], deduped_12_1[3] ) ), deduped_2_1 ), PreCompose( deduped_10_1, TensorProductOnMorphisms( deduped_10_1, deduped_11_1[4], deduped_12_1[4] ), LeftUnitor( deduped_10_1, deduped_9_1 ) ), PreCompose( deduped_10_1, deduped_2_1, PreCompose( deduped_10_1, TensorProductOnMorphisms( deduped_10_1, deduped_11_1[5], deduped_12_1[5] ), PreCompose( deduped_10_1, AssociatorRightToLeft( deduped_10_1, deduped_6_1, deduped_8_1, deduped_8_1 ), PreCompose( deduped_10_1, TensorProductOnMorphisms( deduped_10_1, AssociatorLeftToRight( deduped_10_1, deduped_7_1, deduped_7_1, deduped_8_1 ), deduped_4_1 ), PreCompose( deduped_10_1, TensorProductOnMorphisms( deduped_10_1, TensorProductOnMorphisms( deduped_10_1, deduped_5_1, BraidingInverse( deduped_10_1, deduped_8_1, deduped_7_1 ) ), deduped_4_1 ), PreCompose( deduped_10_1, TensorProductOnMorphisms( deduped_10_1, AssociatorRightToLeft( deduped_10_1, deduped_7_1, deduped_8_1, deduped_7_1 ), deduped_4_1 ), PreCompose( deduped_10_1, AssociatorLeftToRight( deduped_10_1, deduped_3_1, deduped_7_1, deduped_8_1 ), deduped_1_1 ) ) ) ) ) ) ) ) );
end
########
        
    , 100 );
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
end );

BindGlobal( "CategoryOfBimonoidsAsComonoidsOfMonoidsPrecompiled", function ( symmoncat )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function ( symmoncat )
    return CATEGORY_OF_BIMONOIDS_AS_COMONOIDS_OF_MONOIDS( symmoncat );
end;
        
        
    
    cat := category_constructor( symmoncat : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_CategoryOfBimonoidsAsComonoidsOfMonoidsPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
