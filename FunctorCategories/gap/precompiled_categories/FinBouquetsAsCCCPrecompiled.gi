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
    local hoisted_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, hoisted_13_1, hoisted_14_1, deduped_15_1, hoisted_19_1, hoisted_23_1, deduped_24_1, hoisted_26_1, hoisted_28_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1;
    deduped_45_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( b_1 );
    deduped_44_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( a_1 );
    deduped_43_1 := deduped_45_1[3];
    deduped_42_1 := deduped_45_1[2];
    deduped_41_1 := deduped_44_1[2];
    deduped_40_1 := deduped_45_1[1];
    deduped_39_1 := deduped_44_1[1];
    deduped_38_1 := ListWithIdenticalEntries( deduped_39_1, deduped_40_1 );
    deduped_37_1 := [ 0 .. deduped_39_1 - 1 ];
    deduped_36_1 := [ 0 .. deduped_41_1 - 1 ];
    deduped_35_1 := Concatenation( deduped_38_1, ListWithIdenticalEntries( deduped_41_1, deduped_42_1 ) );
    deduped_34_1 := [ 0 .. Product( deduped_38_1 ) - 1 ];
    deduped_33_1 := [ 0 .. Product( deduped_35_1 ) - 1 ];
    deduped_32_1 := Filtered( deduped_34_1, function ( x_2 )
            return true;
        end );
    hoisted_19_1 := List( deduped_36_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + (CAP_JIT_INCOMPLETE_LOGIC( i_2 ) + deduped_39_1);
            hoisted_2_2 := deduped_35_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_35_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_33_1, function ( i_3 )
                    return deduped_43_1[1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 ) )];
                end );
        end );
    deduped_10_1 := [ deduped_40_1, deduped_42_1 ];
    deduped_9_1 := [ 0, 1 ];
    deduped_4_1 := Concatenation( ListWithIdenticalEntries( deduped_39_1, 0 ), ListWithIdenticalEntries( deduped_41_1, 1 ) );
    hoisted_2_1 := deduped_44_1[3];
    deduped_3_1 := List( deduped_36_1, function ( i_2 )
            return hoisted_2_1[1 + REM_INT( i_2, deduped_41_1 )];
        end );
    hoisted_14_1 := List( deduped_36_1, function ( i_2 )
            return deduped_10_1[SafeUniquePosition( deduped_9_1, deduped_4_1[1 + deduped_3_1[(1 + i_2)]] )];
        end );
    deduped_15_1 := List( deduped_36_1, function ( j_2 )
            return Product( hoisted_14_1{[ 1 .. j_2 ]} );
        end );
    deduped_8_1 := [ 0, 1, 2 ];
    deduped_7_1 := [ 0, 1, 1 ];
    deduped_6_1 := [ 0, 0, 1 ];
    deduped_5_1 := [ 0, 2 ];
    hoisted_13_1 := List( deduped_36_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := 1 + deduped_3_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 ))];
            deduped_6_2 := 1 + deduped_5_1[(1 + deduped_4_1[deduped_7_2])];
            deduped_5_2 := deduped_6_1[deduped_6_2];
            deduped_4_2 := 1 + deduped_5_1[(1 + deduped_5_2)];
            hoisted_3_2 := CAP_JIT_INCOMPLETE_LOGIC( IdFunc( function (  )
                        if IdFunc( function (  )
                                    if deduped_5_2 = deduped_6_1[deduped_4_2] and deduped_7_1[deduped_6_2] = deduped_7_1[deduped_4_2] then
                                        return deduped_8_1[deduped_6_2] = deduped_8_1[deduped_4_2];
                                    else
                                        return false;
                                    fi;
                                    return;
                                end )(  ) then
                            return [ 0 .. deduped_10_1[SafeUniquePosition( deduped_9_1, deduped_5_2 )] - 1 ];
                        else
                            return deduped_43_1;
                        fi;
                        return;
                    end )(  ) );
            hoisted_2_2 := deduped_35_1[deduped_7_2];
            hoisted_1_2 := Product( deduped_35_1{[ 1 .. deduped_7_2 - 1 ]} );
            return List( deduped_33_1, function ( i_3 )
                    return hoisted_3_2[1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 ) )];
                end );
        end );
    deduped_31_1 := Filtered( deduped_33_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_36_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_13_1[deduped_1_3][deduped_1_2] * deduped_15_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_36_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_19_1[deduped_1_3][deduped_1_2] * deduped_15_1[deduped_1_3];
                    end ) );
        end );
    deduped_30_1 := Length( deduped_31_1 );
    deduped_24_1 := List( deduped_37_1, function ( j_2 )
            return Product( deduped_38_1{[ 1 .. j_2 ]} );
        end );
    hoisted_23_1 := List( [ 1 .. deduped_39_1 ], function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := Product( deduped_38_1{[ 1 .. i_2 - 1 ]} );
            return List( deduped_34_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), deduped_40_1 );
                end );
        end );
    hoisted_28_1 := List( deduped_34_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_37_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_23_1[deduped_1_3][hoisted_1_2] * deduped_24_1[deduped_1_3];
                end );
        end );
    hoisted_26_1 := List( [ 0 .. Length( deduped_37_1 ) - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            hoisted_2_2 := deduped_35_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_35_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_33_1, function ( i_3 )
                    return CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 ) );
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfBouquetEnrichedOverSkeletalFinSets, NTuple( 3, Length( deduped_32_1 ), deduped_30_1, List( [ 0 .. deduped_30_1 - 1 ], function ( x_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_31_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))] );
                return -1 + BigInt( SafePosition( deduped_32_1, CAP_JIT_INCOMPLETE_LOGIC( hoisted_28_1[(1 + Sum( deduped_37_1, function ( j_3 )
                                   local deduped_1_3;
                                   deduped_1_3 := (1 + j_3);
                                   return hoisted_26_1[deduped_1_3][hoisted_1_2] * deduped_24_1[deduped_1_3];
                               end ))] ) ) );
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
