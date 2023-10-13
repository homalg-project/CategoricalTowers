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
    local hoisted_2_1, hoisted_5_1, hoisted_6_1, deduped_7_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_15_1, deduped_16_1, hoisted_18_1, hoisted_20_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1;
    deduped_35_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( b_1 );
    deduped_34_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( a_1 );
    deduped_33_1 := deduped_34_1[2];
    deduped_32_1 := deduped_35_1[1];
    deduped_31_1 := deduped_34_1[1];
    deduped_30_1 := ListWithIdenticalEntries( deduped_31_1, deduped_32_1 );
    deduped_29_1 := [ 0 .. deduped_31_1 - 1 ];
    deduped_28_1 := [ 0 .. deduped_33_1 - 1 ];
    deduped_27_1 := Concatenation( deduped_30_1, ListWithIdenticalEntries( deduped_33_1, deduped_35_1[2] ) );
    deduped_26_1 := [ 0 .. Product( deduped_30_1 ) - 1 ];
    deduped_25_1 := [ 0 .. Product( deduped_27_1 ) - 1 ];
    deduped_24_1 := Filtered( deduped_26_1, function ( x_2 )
            return true;
        end );
    hoisted_10_1 := deduped_35_1[3];
    hoisted_9_1 := [ deduped_31_1 .. deduped_31_1 + deduped_33_1 - 1 ];
    hoisted_11_1 := List( deduped_28_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := hoisted_9_1[1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 )];
            hoisted_2_2 := deduped_27_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_27_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_25_1, function ( i_3 )
                    return hoisted_10_1[1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 ) )];
                end );
        end );
    hoisted_6_1 := ListWithIdenticalEntries( deduped_33_1, deduped_32_1 );
    deduped_7_1 := List( deduped_28_1, function ( j_2 )
            return Product( hoisted_6_1{[ 1 .. j_2 ]} );
        end );
    hoisted_2_1 := deduped_34_1[3];
    hoisted_5_1 := List( deduped_28_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_2_1[1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), deduped_33_1 )] );
            hoisted_2_2 := deduped_27_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_27_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_25_1, function ( i_3 )
                    return CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 ) );
                end );
        end );
    deduped_23_1 := Filtered( deduped_25_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_28_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_5_1[deduped_1_3][deduped_1_2] * deduped_7_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_28_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_11_1[deduped_1_3][deduped_1_2] * deduped_7_1[deduped_1_3];
                    end ) );
        end );
    deduped_22_1 := Length( deduped_23_1 );
    deduped_16_1 := List( deduped_29_1, function ( j_2 )
            return Product( deduped_30_1{[ 1 .. j_2 ]} );
        end );
    hoisted_15_1 := List( [ 1 .. deduped_31_1 ], function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := Product( deduped_30_1{[ 1 .. i_2 - 1 ]} );
            return List( deduped_26_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), deduped_32_1 );
                end );
        end );
    hoisted_20_1 := List( deduped_26_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_29_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_15_1[deduped_1_3][hoisted_1_2] * deduped_16_1[deduped_1_3];
                end );
        end );
    hoisted_18_1 := List( deduped_29_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            hoisted_2_2 := deduped_27_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_27_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_25_1, function ( i_3 )
                    return CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 ) );
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfBouquetEnrichedOverSkeletalFinSets, NTuple( 3, Length( deduped_24_1 ), deduped_22_1, List( [ 0 .. deduped_22_1 - 1 ], function ( x_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_23_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))] );
                return -1 + BigInt( SafePosition( deduped_24_1, CAP_JIT_INCOMPLETE_LOGIC( hoisted_20_1[(1 + Sum( deduped_29_1, function ( j_3 )
                                   local deduped_1_3;
                                   deduped_1_3 := (1 + j_3);
                                   return hoisted_18_1[deduped_1_3][hoisted_1_2] * deduped_16_1[deduped_1_3];
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
    return CategoryOfBouquetsEnrichedOver( SkeletalCategoryOfFiniteSets(  : FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_FinBouquetsAsCCCPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
