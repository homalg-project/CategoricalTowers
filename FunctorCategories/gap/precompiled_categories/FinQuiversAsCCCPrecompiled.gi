# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_FinQuiversAsCCCPrecompiled", function ( cat )
    
    ##
    AddExponentialOnObjects( cat,
        
########
function ( cat_1, a_1, b_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1;
    deduped_58_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( a_1 );
    deduped_57_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( b_1 );
    deduped_56_1 := deduped_57_1[3];
    deduped_55_1 := deduped_58_1[3];
    deduped_54_1 := deduped_58_1[2];
    deduped_53_1 := deduped_57_1[2];
    deduped_52_1 := deduped_58_1[1];
    deduped_51_1 := deduped_57_1[1];
    deduped_50_1 := deduped_51_1 ^ deduped_54_1;
    deduped_49_1 := deduped_53_1 ^ deduped_54_1;
    deduped_48_1 := 2 * deduped_52_1;
    deduped_47_1 := deduped_51_1 ^ deduped_52_1;
    deduped_46_1 := [ 0 .. deduped_52_1 - 1 ];
    deduped_45_1 := [ 0 .. deduped_54_1 - 1 ];
    deduped_44_1 := deduped_50_1 * deduped_50_1;
    deduped_43_1 := deduped_51_1 ^ deduped_48_1;
    deduped_42_1 := [ 0 .. deduped_49_1 - 1 ];
    deduped_41_1 := deduped_43_1 * deduped_49_1;
    deduped_40_1 := [ 0 .. deduped_43_1 - 1 ];
    deduped_39_1 := Filtered( [ 0 .. deduped_47_1 - 1 ], function ( x_2 )
            return true;
        end );
    deduped_38_1 := deduped_41_1 * deduped_50_1;
    deduped_37_1 := [ 0 .. deduped_41_1 - 1 ];
    deduped_36_1 := Length( deduped_39_1 );
    hoisted_21_1 := List( deduped_56_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_14_1 := deduped_53_1;
    hoisted_11_1 := deduped_45_1;
    hoisted_6_1 := deduped_51_1;
    hoisted_22_1 := List( deduped_42_1, function ( i_2 )
            return Sum( List( hoisted_11_1, function ( k_3 )
                      return hoisted_21_1[(1 + REM_INT( QUO_INT( i_2, hoisted_14_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), hoisted_14_1 ))] * hoisted_6_1 ^ k_3;
                  end ) );
        end );
    hoisted_18_1 := List( deduped_55_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_8_1 := deduped_54_1;
    hoisted_19_1 := List( deduped_45_1, function ( logic_new_func_x_2 )
            return hoisted_18_1[1 + REM_INT( logic_new_func_x_2, hoisted_8_1 )];
        end );
    hoisted_7_1 := [ 0 .. deduped_48_1 - 1 ];
    hoisted_20_1 := List( deduped_40_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_7_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_6_1 ^ j_3 ), hoisted_6_1 );
                end );
            return Sum( List( hoisted_11_1, function ( k_3 )
                      return hoisted_1_2[(1 + (1 + hoisted_19_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))] * 2))] * hoisted_6_1 ^ k_3;
                  end ) );
        end );
    hoisted_15_1 := List( deduped_56_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_17_1 := List( deduped_42_1, function ( i_2 )
            return Sum( List( hoisted_11_1, function ( k_3 )
                      return hoisted_15_1[(1 + REM_INT( QUO_INT( i_2, hoisted_14_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), hoisted_14_1 ))] * hoisted_6_1 ^ k_3;
                  end ) );
        end );
    hoisted_16_1 := deduped_49_1;
    hoisted_9_1 := List( deduped_55_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_10_1 := List( deduped_45_1, function ( logic_new_func_x_2 )
            return hoisted_9_1[1 + REM_INT( logic_new_func_x_2, hoisted_8_1 )];
        end );
    hoisted_13_1 := List( deduped_40_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_7_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_6_1 ^ j_3 ), hoisted_6_1 );
                end );
            return Sum( List( hoisted_11_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_10_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))] * 2)] * hoisted_6_1 ^ k_3;
                  end ) );
        end );
    hoisted_12_1 := deduped_43_1;
    hoisted_5_1 := deduped_44_1 * deduped_50_1;
    hoisted_4_1 := deduped_44_1;
    hoisted_3_1 := deduped_38_1;
    hoisted_2_1 := deduped_50_1;
    hoisted_1_1 := deduped_41_1;
    deduped_35_1 := Filtered( [ 0 .. deduped_38_1 * deduped_50_1 - 1 ], function ( x_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2, deduped_5_2;
            deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            deduped_4_2 := 1 + REM_INT( deduped_5_2, hoisted_12_1 );
            deduped_3_2 := REM_INT( QUO_INT( deduped_5_2, hoisted_3_1 ), hoisted_2_1 );
            deduped_2_2 := REM_INT( QUO_INT( deduped_5_2, hoisted_1_1 ), hoisted_2_1 );
            deduped_1_2 := 1 + REM_INT( QUO_INT( deduped_5_2, hoisted_12_1 ), hoisted_16_1 );
            return deduped_2_2 + deduped_2_2 * hoisted_2_1 + deduped_3_2 * hoisted_4_1 + deduped_3_2 * hoisted_5_1 = hoisted_13_1[deduped_4_2] + hoisted_17_1[deduped_1_2] * hoisted_2_1 + hoisted_20_1[deduped_4_2] * hoisted_4_1 + hoisted_22_1[deduped_1_2] * hoisted_5_1;
        end );
    deduped_34_1 := Length( deduped_35_1 );
    hoisted_27_1 := deduped_46_1;
    hoisted_25_1 := deduped_52_1;
    hoisted_26_1 := List( deduped_46_1, function ( logic_new_func_x_2 )
            return REM_INT( logic_new_func_x_2, hoisted_25_1 );
        end );
    hoisted_32_1 := List( deduped_40_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_7_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_6_1 ^ j_3 ), hoisted_6_1 );
                end );
            return Sum( List( hoisted_27_1, function ( k_3 )
                      return hoisted_1_2[(1 + (1 + hoisted_26_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))] * 2))] * hoisted_6_1 ^ k_3;
                  end ) );
        end );
    hoisted_33_1 := List( deduped_37_1, function ( logic_new_func_x_2 )
            return hoisted_32_1[1 + REM_INT( logic_new_func_x_2, hoisted_12_1 )];
        end );
    hoisted_24_1 := deduped_47_1;
    hoisted_23_1 := deduped_39_1;
    hoisted_31_1 := List( [ 0 .. deduped_36_1 - 1 ], function ( i_2 )
            return REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_23_1[1 + i_2] ), hoisted_24_1 );
        end );
    hoisted_28_1 := List( deduped_40_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_7_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_6_1 ^ j_3 ), hoisted_6_1 );
                end );
            return Sum( List( hoisted_27_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_26_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))] * 2)] * hoisted_6_1 ^ k_3;
                  end ) );
        end );
    hoisted_30_1 := List( deduped_37_1, function ( logic_new_func_x_2 )
            return hoisted_28_1[1 + REM_INT( logic_new_func_x_2, hoisted_12_1 )];
        end );
    hoisted_29_1 := deduped_35_1;
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfQuiverEnrichedOverSkeletalFinSets, NTuple( 3, deduped_36_1, deduped_34_1, List( [ 0 .. deduped_34_1 - 1 ], function ( logic_new_func_x_2 )
                local deduped_1_2, deduped_2_2;
                deduped_2_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_29_1[1 + CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 )] );
                deduped_1_2 := 1 + (REM_INT( deduped_2_2, hoisted_12_1 ) + REM_INT( QUO_INT( deduped_2_2, hoisted_12_1 ), hoisted_16_1 ) * hoisted_12_1);
                return NTuple( 2, -1 + SafePosition( hoisted_31_1, hoisted_30_1[deduped_1_2] ), -1 + SafePosition( hoisted_31_1, hoisted_33_1[deduped_1_2] ) );
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

BindGlobal( "FinQuiversAsCCCPrecompiled", function (  )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function (  )
    return CategoryOfQuiversEnrichedOver( CategoryOfSkeletalFinSets(  : FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_FinQuiversAsCCCPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
