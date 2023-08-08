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
    local deduped_1_1, deduped_2_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, hoisted_13_1, hoisted_14_1, deduped_15_1, hoisted_17_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_24_1, deduped_25_1, hoisted_27_1, hoisted_28_1, hoisted_30_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1;
    deduped_52_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( b_1 );
    deduped_51_1 := UnderlyingCategory( cat_1 );
    deduped_50_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( a_1 );
    deduped_49_1 := deduped_52_1[3];
    deduped_48_1 := deduped_52_1[2];
    deduped_47_1 := deduped_52_1[1];
    deduped_46_1 := CreateCapCategoryObjectWithAttributes( deduped_51_1, IndexOfObject, 1 );
    deduped_45_1 := deduped_50_1[2];
    deduped_44_1 := CreateCapCategoryObjectWithAttributes( deduped_51_1, IndexOfObject, 0 );
    deduped_43_1 := deduped_50_1[1];
    deduped_42_1 := ListWithIdenticalEntries( deduped_45_1, deduped_46_1 );
    deduped_41_1 := ListWithIdenticalEntries( deduped_43_1, deduped_44_1 );
    deduped_40_1 := [ 0 .. deduped_43_1 - 1 ];
    deduped_39_1 := [ 0 .. deduped_45_1 - 1 ];
    deduped_2_1 := [ deduped_47_1, deduped_48_1 ];
    deduped_1_1 := [ 0, 1 ];
    deduped_38_1 := List( deduped_41_1, function ( objB_2 )
            return deduped_2_1[SafeUniquePosition( deduped_1_1, IndexOfObject( objB_2 ) )];
        end );
    deduped_37_1 := Concatenation( deduped_38_1, List( deduped_42_1, function ( objB_2 )
              return deduped_2_1[SafeUniquePosition( deduped_1_1, IndexOfObject( objB_2 ) )];
          end ) );
    deduped_36_1 := [ 0 .. Product( deduped_38_1 ) - 1 ];
    deduped_35_1 := [ 0 .. Product( deduped_37_1 ) - 1 ];
    deduped_34_1 := Filtered( deduped_36_1, function ( x_2 )
            return true;
        end );
    deduped_10_1 := [ 0, 1, 2 ];
    deduped_9_1 := [ 0, 1, 1 ];
    deduped_8_1 := [ 0, 0, 1 ];
    deduped_7_1 := [ 0, 2 ];
    hoisted_17_1 := List( ListWithIdenticalEntries( deduped_45_1, CreateCapCategoryMorphismWithAttributes( deduped_51_1, deduped_44_1, deduped_46_1, IndexOfMorphism, 1 ) ), function ( morB_2 )
            local deduped_1_2, deduped_2_2;
            deduped_2_2 := IndexOfObject( Source( morB_2 ) );
            deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2)];
            if IdFunc( function (  )
                        if deduped_2_2 = deduped_8_1[deduped_1_2] and IndexOfObject( Range( morB_2 ) ) = deduped_9_1[deduped_1_2] then
                            return IndexOfMorphism( morB_2 ) = deduped_10_1[deduped_1_2];
                        else
                            return false;
                        fi;
                        return;
                    end )(  ) then
                return [ 0 .. deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_2_2 )] - 1 ];
            else
                return deduped_49_1;
            fi;
            return;
        end );
    hoisted_19_1 := List( deduped_39_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2;
            deduped_4_2 := 1 + (CAP_JIT_INCOMPLETE_LOGIC( i_2 ) + deduped_43_1);
            hoisted_3_2 := hoisted_17_1[1 + i_2];
            hoisted_2_2 := deduped_37_1[deduped_4_2];
            hoisted_1_2 := Product( deduped_37_1{[ 1 .. deduped_4_2 - 1 ]} );
            return List( deduped_35_1, function ( i_3 )
                    return hoisted_3_2[1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 ) )];
                end );
        end );
    deduped_6_1 := Concatenation( List( deduped_41_1, IndexOfObject ), List( deduped_42_1, IndexOfObject ) );
    hoisted_4_1 := deduped_50_1[3];
    deduped_5_1 := List( deduped_39_1, function ( i_2 )
            return hoisted_4_1[1 + REM_INT( i_2, deduped_45_1 )];
        end );
    hoisted_14_1 := List( deduped_39_1, function ( i_2 )
            return deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_6_1[1 + deduped_5_1[(1 + i_2)]] )];
        end );
    deduped_15_1 := List( deduped_39_1, function ( j_2 )
            return Product( hoisted_14_1{[ 1 .. j_2 ]} );
        end );
    hoisted_13_1 := List( deduped_39_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := 1 + deduped_5_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 ))];
            deduped_6_2 := 1 + deduped_7_1[(1 + deduped_6_1[deduped_7_2])];
            deduped_5_2 := deduped_8_1[deduped_6_2];
            deduped_4_2 := 1 + deduped_7_1[(1 + deduped_5_2)];
            hoisted_3_2 := CAP_JIT_INCOMPLETE_LOGIC( IdFunc( function (  )
                        if IdFunc( function (  )
                                    if deduped_5_2 = deduped_8_1[deduped_4_2] and deduped_9_1[deduped_6_2] = deduped_9_1[deduped_4_2] then
                                        return deduped_10_1[deduped_6_2] = deduped_10_1[deduped_4_2];
                                    else
                                        return false;
                                    fi;
                                    return;
                                end )(  ) then
                            return [ 0 .. deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_5_2 )] - 1 ];
                        else
                            return deduped_49_1;
                        fi;
                        return;
                    end )(  ) );
            hoisted_2_2 := deduped_37_1[deduped_7_2];
            hoisted_1_2 := Product( deduped_37_1{[ 1 .. deduped_7_2 - 1 ]} );
            return List( deduped_35_1, function ( i_3 )
                    return hoisted_3_2[1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 ) )];
                end );
        end );
    deduped_33_1 := Filtered( deduped_35_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_39_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_13_1[deduped_1_3][deduped_1_2] * deduped_15_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_39_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_19_1[deduped_1_3][deduped_1_2] * deduped_15_1[deduped_1_3];
                    end ) );
        end );
    deduped_32_1 := Length( deduped_33_1 );
    deduped_25_1 := List( deduped_40_1, function ( j_2 )
            return Product( deduped_38_1{[ 1 .. j_2 ]} );
        end );
    hoisted_20_1 := [ [ 0 .. deduped_47_1 - 1 ], [ 0 .. deduped_48_1 - 1 ] ];
    hoisted_21_1 := List( deduped_41_1, function ( objB_2 )
            return hoisted_20_1[SafeUniquePosition( deduped_1_1, IndexOfObject( objB_2 ) )];
        end );
    hoisted_24_1 := List( [ 1 .. deduped_43_1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_21_1[i_2];
            hoisted_2_2 := deduped_38_1[i_2];
            hoisted_1_2 := Product( deduped_38_1{[ 1 .. i_2 - 1 ]} );
            return List( deduped_36_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    hoisted_30_1 := List( deduped_36_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_40_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_24_1[deduped_1_3][hoisted_1_2] * deduped_25_1[deduped_1_3];
                end );
        end );
    hoisted_27_1 := List( deduped_41_1, function ( objB_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := 1 + deduped_7_1[(1 + IndexOfObject( objB_2 ))];
            deduped_2_2 := deduped_8_1[deduped_3_2];
            deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2)];
            if IdFunc( function (  )
                        if deduped_2_2 = deduped_8_1[deduped_1_2] and deduped_9_1[deduped_3_2] = deduped_9_1[deduped_1_2] then
                            return deduped_10_1[deduped_3_2] = deduped_10_1[deduped_1_2];
                        else
                            return false;
                        fi;
                        return;
                    end )(  ) then
                return [ 0 .. deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_2_2 )] - 1 ];
            else
                return deduped_49_1;
            fi;
            return;
        end );
    hoisted_28_1 := List( [ 0 .. Length( deduped_40_1 ) - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2;
            deduped_4_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            hoisted_3_2 := hoisted_27_1[1 + i_2];
            hoisted_2_2 := deduped_37_1[deduped_4_2];
            hoisted_1_2 := Product( deduped_37_1{[ 1 .. deduped_4_2 - 1 ]} );
            return List( deduped_35_1, function ( i_3 )
                    return hoisted_3_2[1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 ) )];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfBouquetEnrichedOverSkeletalFinSets, NTuple( 3, Length( deduped_34_1 ), deduped_32_1, List( [ 0 .. deduped_32_1 - 1 ], function ( x_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_33_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))] );
                return -1 + BigInt( SafePosition( deduped_34_1, CAP_JIT_INCOMPLETE_LOGIC( hoisted_30_1[(1 + Sum( deduped_40_1, function ( j_3 )
                                   local deduped_1_3;
                                   deduped_1_3 := (1 + j_3);
                                   return hoisted_28_1[deduped_1_3][hoisted_1_2] * deduped_25_1[deduped_1_3];
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
