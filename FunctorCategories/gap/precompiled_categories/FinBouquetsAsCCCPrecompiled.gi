# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_FinBouquetsAsCCCPrecompiled", function ( cat )
    
    ##
    AddExponentialOnObjects( cat,
        
########
function ( cat_1, a_1, b_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1;
    deduped_34_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( a_1 );
    deduped_33_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( b_1 );
    deduped_32_1 := deduped_34_1[2];
    deduped_31_1 := deduped_33_1[2];
    deduped_30_1 := deduped_34_1[1];
    deduped_29_1 := deduped_33_1[1];
    deduped_28_1 := deduped_29_1 ^ deduped_32_1;
    deduped_27_1 := deduped_31_1 ^ deduped_32_1;
    deduped_26_1 := deduped_29_1 ^ deduped_30_1;
    deduped_25_1 := deduped_26_1 * deduped_27_1;
    deduped_24_1 := [ 0 .. deduped_26_1 - 1 ];
    deduped_23_1 := Filtered( deduped_24_1, function ( x_2 )
            return true;
        end );
    deduped_22_1 := Length( deduped_23_1 );
    hoisted_11_1 := deduped_33_1[3];
    hoisted_10_1 := deduped_31_1;
    hoisted_7_1 := [ 0 .. deduped_32_1 - 1 ];
    hoisted_3_1 := deduped_29_1;
    hoisted_13_1 := List( [ 0 .. deduped_27_1 - 1 ], function ( i_2 )
            return Sum( List( hoisted_7_1, function ( k_3 )
                      return hoisted_11_1[(1 + REM_INT( QUO_INT( i_2, hoisted_10_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), hoisted_10_1 ))] * hoisted_3_1 ^ k_3;
                  end ) );
        end );
    hoisted_12_1 := deduped_27_1;
    hoisted_6_1 := deduped_34_1[3];
    hoisted_5_1 := deduped_32_1;
    hoisted_4_1 := [ 0 .. deduped_30_1 - 1 ];
    hoisted_9_1 := List( deduped_24_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_4_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_3_1 ^ j_3 ), hoisted_3_1 );
                end );
            return Sum( List( hoisted_7_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_6_1[(1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( k_3 ), hoisted_5_1 ))])] * hoisted_3_1 ^ k_3;
                  end ) );
        end );
    hoisted_8_1 := deduped_26_1;
    hoisted_2_1 := deduped_28_1;
    hoisted_1_1 := deduped_25_1;
    deduped_21_1 := Filtered( [ 0 .. deduped_25_1 * deduped_28_1 - 1 ], function ( x_2 )
            local deduped_1_2, deduped_2_2;
            deduped_2_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            deduped_1_2 := REM_INT( QUO_INT( deduped_2_2, hoisted_1_1 ), hoisted_2_1 );
            return deduped_1_2 + deduped_1_2 * hoisted_2_1 = hoisted_9_1[1 + REM_INT( deduped_2_2, hoisted_8_1 )] + hoisted_13_1[(1 + REM_INT( QUO_INT( deduped_2_2, hoisted_8_1 ), hoisted_12_1 ))] * hoisted_2_1;
        end );
    deduped_20_1 := Length( deduped_21_1 );
    hoisted_14_1 := deduped_23_1;
    hoisted_19_1 := List( [ 0 .. deduped_22_1 - 1 ], function ( i_2 )
            return REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_14_1[1 + i_2] ), hoisted_8_1 );
        end );
    hoisted_15_1 := deduped_30_1;
    hoisted_16_1 := List( deduped_24_1, function ( i_2 )
            return Sum( List( hoisted_4_1, function ( k_3 )
                      return REM_INT( QUO_INT( i_2, hoisted_3_1 ^ CAP_JIT_INCOMPLETE_LOGIC( REM_INT( CAP_JIT_INCOMPLETE_LOGIC( k_3 ), hoisted_15_1 ) ) ), hoisted_3_1 ) * hoisted_3_1 ^ k_3;
                  end ) );
        end );
    hoisted_18_1 := List( [ 0 .. deduped_25_1 - 1 ], function ( logic_new_func_x_2 )
            return hoisted_16_1[1 + REM_INT( logic_new_func_x_2, hoisted_8_1 )];
        end );
    hoisted_17_1 := deduped_21_1;
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfBouquetEnrichedOverSkeletalFinSets, NTuple( 3, deduped_22_1, deduped_20_1, List( [ 0 .. deduped_20_1 - 1 ], function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_17_1[1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 )] );
                return -1 + SafePosition( hoisted_19_1, hoisted_18_1[(1 + (REM_INT( deduped_1_2, hoisted_8_1 ) + REM_INT( QUO_INT( deduped_1_2, hoisted_8_1 ), hoisted_12_1 ) * hoisted_8_1))] );
            end ) ) );
end
########
        
    , 100 );
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        #Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
end );

BindGlobal( "FinBouquetsAsCCCPrecompiled", function (  )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function (  )
    return CategoryOfBouquetsEnrichedOver( CategoryOfSkeletalFinSets(  : FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_FinBouquetsAsCCCPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
