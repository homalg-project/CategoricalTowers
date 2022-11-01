# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_FinQuiversPrecompiled", function ( cat )
    
    ##
    AddInitialObject( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfQuiver, NTuple( 3, 0, 0, [  ] ) );
end
########
        
    , 100 );
    
    ##
    AddCoproduct( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := [ 1 .. Length( arg2_1 ) ];
    deduped_6_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return DefiningTripleOfQuiver( logic_new_func_x_2 )[2];
        end );
    deduped_5_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return DefiningTripleOfQuiver( logic_new_func_x_2 )[1];
        end );
    hoisted_4_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return List( DefiningTripleOfQuiver( logic_new_func_x_2 )[3], function ( a_3 )
                    return a_3[2];
                end );
        end );
    hoisted_3_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return List( DefiningTripleOfQuiver( logic_new_func_x_2 )[3], function ( a_3 )
                    return a_3[1];
                end );
        end );
    hoisted_2_1 := deduped_5_1;
    hoisted_1_1 := deduped_6_1;
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfQuiver, NTuple( 3, Sum( deduped_5_1 ), Sum( deduped_6_1 ), ListN( Concatenation( List( deduped_7_1, function ( logic_new_func_x_2 )
                    local hoisted_1_2, hoisted_2_2, deduped_3_2;
                    deduped_3_2 := Sum( hoisted_2_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
                    hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + hoisted_2_1[logic_new_func_x_2] - 1 ];
                    hoisted_1_2 := hoisted_3_1[logic_new_func_x_2];
                    return List( [ 0 .. hoisted_1_1[logic_new_func_x_2] - 1 ], function ( i_3 )
                            return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                        end );
                end ) ), Concatenation( List( deduped_7_1, function ( logic_new_func_x_2 )
                    local hoisted_1_2, hoisted_2_2, deduped_3_2;
                    deduped_3_2 := Sum( hoisted_2_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
                    hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + hoisted_2_1[logic_new_func_x_2] - 1 ];
                    hoisted_1_2 := hoisted_4_1[logic_new_func_x_2];
                    return List( [ 0 .. hoisted_1_1[logic_new_func_x_2] - 1 ], function ( i_3 )
                            return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                        end );
                end ) ), function ( s_2, t_2 )
                return NTuple( 2, s_2, t_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddDistinguishedObjectOfHomomorphismStructure( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, 1 );
end
########
        
    , 100 );
    
    ##
    AddHomomorphismStructureOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1;
    deduped_34_1 := DefiningTripleOfQuiver( arg2_1 );
    deduped_33_1 := DefiningTripleOfQuiver( arg3_1 );
    deduped_32_1 := deduped_33_1[3];
    deduped_31_1 := deduped_34_1[3];
    deduped_30_1 := deduped_34_1[2];
    deduped_29_1 := deduped_33_1[2];
    deduped_28_1 := deduped_34_1[1];
    deduped_27_1 := deduped_33_1[1];
    deduped_26_1 := deduped_27_1 ^ deduped_30_1;
    deduped_25_1 := deduped_29_1 ^ deduped_30_1;
    deduped_24_1 := deduped_27_1 ^ deduped_28_1;
    deduped_23_1 := [ 0 .. deduped_25_1 - 1 ];
    deduped_22_1 := [ 0 .. deduped_24_1 - 1 ];
    deduped_21_1 := [ 0 .. Product( [ deduped_24_1, deduped_25_1, deduped_26_1, deduped_26_1 ] ) - 1 ];
    hoisted_19_1 := List( deduped_32_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_13_1 := deduped_29_1;
    hoisted_9_1 := [ 0 .. deduped_30_1 - 1 ];
    hoisted_7_1 := deduped_27_1;
    hoisted_20_1 := List( deduped_23_1, function ( i_2 )
            return Sum( List( hoisted_9_1, function ( k_3 )
                      return hoisted_19_1[(1 + REM_INT( QUO_INT( i_2, hoisted_13_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_9_1[(1 + k_3)] ) ), hoisted_13_1 ))] * hoisted_7_1 ^ k_3;
                  end ) );
        end );
    hoisted_17_1 := List( deduped_31_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_8_1 := [ 0 .. deduped_28_1 - 1 ];
    hoisted_18_1 := List( deduped_22_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_8_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_7_1 ^ j_3 ), hoisted_7_1 );
                end );
            return Sum( List( hoisted_9_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_17_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_9_1[(1 + k_3)] ))])] * hoisted_7_1 ^ k_3;
                  end ) );
        end );
    hoisted_14_1 := List( deduped_32_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_16_1 := List( deduped_23_1, function ( i_2 )
            return Sum( List( hoisted_9_1, function ( k_3 )
                      return hoisted_14_1[(1 + REM_INT( QUO_INT( i_2, hoisted_13_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_9_1[(1 + k_3)] ) ), hoisted_13_1 ))] * hoisted_7_1 ^ k_3;
                  end ) );
        end );
    hoisted_15_1 := deduped_25_1;
    hoisted_10_1 := List( deduped_31_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_12_1 := List( deduped_22_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_8_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_7_1 ^ j_3 ), hoisted_7_1 );
                end );
            return Sum( List( hoisted_9_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_10_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_9_1[(1 + k_3)] ))])] * hoisted_7_1 ^ k_3;
                  end ) );
        end );
    hoisted_11_1 := deduped_24_1;
    hoisted_6_1 := Product( [ deduped_26_1, deduped_26_1, deduped_26_1 ] );
    hoisted_5_1 := deduped_26_1 * deduped_26_1;
    hoisted_4_1 := Product( [ deduped_24_1, deduped_25_1, deduped_26_1 ] );
    hoisted_3_1 := deduped_26_1;
    hoisted_2_1 := deduped_24_1 * deduped_25_1;
    hoisted_1_1 := deduped_21_1;
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, Length( Filtered( deduped_21_1, function ( x_2 )
                local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2, deduped_5_2;
                deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_1_1[1 + x_2] );
                deduped_4_2 := 1 + REM_INT( deduped_5_2, hoisted_11_1 );
                deduped_3_2 := REM_INT( QUO_INT( deduped_5_2, hoisted_4_1 ), hoisted_3_1 );
                deduped_2_2 := REM_INT( QUO_INT( deduped_5_2, hoisted_2_1 ), hoisted_3_1 );
                deduped_1_2 := 1 + REM_INT( QUO_INT( deduped_5_2, hoisted_11_1 ), hoisted_15_1 );
                return deduped_2_2 + deduped_2_2 * hoisted_3_1 + deduped_3_2 * hoisted_5_1 + deduped_3_2 * hoisted_6_1 = hoisted_12_1[deduped_4_2] + hoisted_16_1[deduped_1_2] * hoisted_3_1 + hoisted_18_1[deduped_4_2] * hoisted_5_1 + hoisted_20_1[deduped_1_2] * hoisted_6_1;
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, hoisted_34_1, hoisted_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1;
    deduped_57_1 := DefiningTripleOfQuiver( arg3_1 );
    deduped_56_1 := DefiningTripleOfQuiver( arg2_1 );
    deduped_55_1 := Length( Source( arg4_1 ) );
    deduped_54_1 := deduped_57_1[3];
    deduped_53_1 := deduped_56_1[3];
    deduped_52_1 := deduped_57_1[2];
    deduped_51_1 := deduped_57_1[1];
    deduped_50_1 := deduped_56_1[2];
    deduped_49_1 := deduped_56_1[1];
    deduped_48_1 := deduped_51_1 ^ deduped_50_1;
    deduped_47_1 := deduped_52_1 ^ deduped_50_1;
    deduped_46_1 := deduped_51_1 ^ deduped_49_1;
    deduped_45_1 := [ 0 .. deduped_55_1 - 1 ];
    deduped_44_1 := [ 0 .. deduped_50_1 - 1 ];
    deduped_43_1 := [ 0 .. deduped_49_1 - 1 ];
    deduped_42_1 := [ 0 .. deduped_55_1 * deduped_50_1 - 1 ];
    deduped_41_1 := [ 0 .. deduped_55_1 * deduped_49_1 - 1 ];
    deduped_40_1 := [ 0 .. deduped_47_1 - 1 ];
    deduped_39_1 := [ 0 .. deduped_46_1 - 1 ];
    deduped_38_1 := [ 0 .. Product( [ deduped_46_1, deduped_47_1, deduped_48_1, deduped_48_1 ] ) - 1 ];
    hoisted_19_1 := List( deduped_54_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_13_1 := deduped_52_1;
    hoisted_10_1 := deduped_44_1;
    hoisted_2_1 := deduped_51_1;
    hoisted_20_1 := List( deduped_40_1, function ( i_2 )
            return Sum( List( hoisted_10_1, function ( k_3 )
                      return hoisted_19_1[(1 + REM_INT( QUO_INT( i_2, hoisted_13_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_10_1[(1 + k_3)] ) ), hoisted_13_1 ))] * hoisted_2_1 ^ k_3;
                  end ) );
        end );
    hoisted_17_1 := List( deduped_53_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_9_1 := deduped_43_1;
    hoisted_18_1 := List( deduped_39_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_9_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_2_1 ^ j_3 ), hoisted_2_1 );
                end );
            return Sum( List( hoisted_10_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_17_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_10_1[(1 + k_3)] ))])] * hoisted_2_1 ^ k_3;
                  end ) );
        end );
    hoisted_14_1 := List( deduped_54_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_16_1 := List( deduped_40_1, function ( i_2 )
            return Sum( List( hoisted_10_1, function ( k_3 )
                      return hoisted_14_1[(1 + REM_INT( QUO_INT( i_2, hoisted_13_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_10_1[(1 + k_3)] ) ), hoisted_13_1 ))] * hoisted_2_1 ^ k_3;
                  end ) );
        end );
    hoisted_15_1 := deduped_47_1;
    hoisted_11_1 := List( deduped_53_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_12_1 := List( deduped_39_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_9_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_2_1 ^ j_3 ), hoisted_2_1 );
                end );
            return Sum( List( hoisted_10_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_11_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_10_1[(1 + k_3)] ))])] * hoisted_2_1 ^ k_3;
                  end ) );
        end );
    hoisted_8_1 := Product( [ deduped_48_1, deduped_48_1, deduped_48_1 ] );
    hoisted_7_1 := deduped_48_1 * deduped_48_1;
    hoisted_6_1 := Product( [ deduped_46_1, deduped_47_1, deduped_48_1 ] );
    hoisted_5_1 := deduped_48_1;
    hoisted_4_1 := deduped_46_1 * deduped_47_1;
    hoisted_3_1 := deduped_38_1;
    hoisted_1_1 := deduped_46_1;
    deduped_37_1 := Filtered( deduped_38_1, function ( x_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2, deduped_5_2;
            deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[1 + x_2] );
            deduped_4_2 := 1 + REM_INT( deduped_5_2, hoisted_1_1 );
            deduped_3_2 := REM_INT( QUO_INT( deduped_5_2, hoisted_6_1 ), hoisted_5_1 );
            deduped_2_2 := REM_INT( QUO_INT( deduped_5_2, hoisted_4_1 ), hoisted_5_1 );
            deduped_1_2 := 1 + REM_INT( QUO_INT( deduped_5_2, hoisted_1_1 ), hoisted_15_1 );
            return deduped_2_2 + deduped_2_2 * hoisted_5_1 + deduped_3_2 * hoisted_7_1 + deduped_3_2 * hoisted_8_1 = hoisted_12_1[deduped_4_2] + hoisted_16_1[deduped_1_2] * hoisted_5_1 + hoisted_18_1[deduped_4_2] * hoisted_7_1 + hoisted_20_1[deduped_1_2] * hoisted_8_1;
        end );
    deduped_36_1 := [ 0 .. Length( deduped_37_1 ) - 1 ];
    hoisted_34_1 := List( [ 0 .. deduped_47_1 * deduped_50_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_13_1 ^ QUO_INT( i_2, hoisted_15_1 ) ), hoisted_13_1 );
        end );
    hoisted_33_1 := deduped_50_1;
    hoisted_21_1 := deduped_37_1;
    hoisted_30_1 := List( deduped_36_1, function ( i_2 )
            return REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[1 + hoisted_21_1[(1 + i_2)]] ), hoisted_1_1 ), hoisted_15_1 );
        end );
    hoisted_22_1 := AsList( arg4_1 );
    hoisted_32_1 := List( deduped_45_1, function ( i_2 )
            return hoisted_30_1[1 + hoisted_22_1[(1 + i_2)]];
        end );
    hoisted_31_1 := deduped_42_1;
    hoisted_25_1 := deduped_55_1;
    hoisted_35_1 := List( deduped_42_1, function ( logic_new_func_x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_31_1[1 + logic_new_func_x_2] );
            return hoisted_34_1[1 + (hoisted_32_1[1 + REM_INT( deduped_1_2, hoisted_25_1 )] + REM_INT( QUO_INT( deduped_1_2, hoisted_25_1 ), hoisted_33_1 ) * hoisted_15_1)];
        end );
    hoisted_28_1 := List( [ 0 .. deduped_46_1 * deduped_49_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_2_1 ^ QUO_INT( i_2, hoisted_1_1 ) ), hoisted_2_1 );
        end );
    hoisted_27_1 := deduped_49_1;
    hoisted_23_1 := List( deduped_36_1, function ( i_2 )
            return REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[1 + hoisted_21_1[(1 + i_2)]] ), hoisted_1_1 );
        end );
    hoisted_26_1 := List( deduped_45_1, function ( i_2 )
            return hoisted_23_1[1 + hoisted_22_1[(1 + i_2)]];
        end );
    hoisted_24_1 := deduped_41_1;
    hoisted_29_1 := List( deduped_41_1, function ( logic_new_func_x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_24_1[1 + logic_new_func_x_2] );
            return hoisted_28_1[1 + (hoisted_26_1[1 + REM_INT( deduped_1_2, hoisted_25_1 )] + REM_INT( QUO_INT( deduped_1_2, hoisted_25_1 ), hoisted_27_1 ) * hoisted_1_1)];
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfQuiverMorphism, NTuple( 2, List( deduped_43_1, function ( i_2 )
                return hoisted_29_1[1 + i_2];
            end ), List( deduped_44_1, function ( i_2 )
                return hoisted_35_1[1 + i_2];
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1;
    deduped_48_1 := DefiningTripleOfQuiver( arg2_1 );
    deduped_47_1 := DefiningTripleOfQuiver( arg3_1 );
    deduped_46_1 := deduped_47_1[3];
    deduped_45_1 := deduped_48_1[3];
    deduped_44_1 := deduped_48_1[2];
    deduped_43_1 := deduped_47_1[2];
    deduped_42_1 := deduped_48_1[1];
    deduped_41_1 := deduped_47_1[1];
    deduped_40_1 := deduped_41_1 ^ deduped_44_1;
    deduped_39_1 := deduped_43_1 ^ deduped_44_1;
    deduped_38_1 := deduped_41_1 ^ deduped_42_1;
    deduped_37_1 := [ 0 .. deduped_44_1 - 1 ];
    deduped_36_1 := [ 0 .. deduped_42_1 - 1 ];
    deduped_35_1 := [ 0 .. deduped_39_1 - 1 ];
    deduped_34_1 := [ 0 .. deduped_38_1 - 1 ];
    deduped_33_1 := [ 0 .. Product( [ deduped_38_1, deduped_39_1, deduped_40_1, deduped_40_1 ] ) - 1 ];
    hoisted_19_1 := List( deduped_46_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_13_1 := deduped_43_1;
    hoisted_9_1 := deduped_37_1;
    hoisted_7_1 := deduped_41_1;
    hoisted_20_1 := List( deduped_35_1, function ( i_2 )
            return Sum( List( hoisted_9_1, function ( k_3 )
                      return hoisted_19_1[(1 + REM_INT( QUO_INT( i_2, hoisted_13_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_9_1[(1 + k_3)] ) ), hoisted_13_1 ))] * hoisted_7_1 ^ k_3;
                  end ) );
        end );
    hoisted_17_1 := List( deduped_45_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_8_1 := deduped_36_1;
    hoisted_18_1 := List( deduped_34_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_8_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_7_1 ^ j_3 ), hoisted_7_1 );
                end );
            return Sum( List( hoisted_9_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_17_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_9_1[(1 + k_3)] ))])] * hoisted_7_1 ^ k_3;
                  end ) );
        end );
    hoisted_14_1 := List( deduped_46_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_16_1 := List( deduped_35_1, function ( i_2 )
            return Sum( List( hoisted_9_1, function ( k_3 )
                      return hoisted_14_1[(1 + REM_INT( QUO_INT( i_2, hoisted_13_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_9_1[(1 + k_3)] ) ), hoisted_13_1 ))] * hoisted_7_1 ^ k_3;
                  end ) );
        end );
    hoisted_15_1 := deduped_39_1;
    hoisted_10_1 := List( deduped_45_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_12_1 := List( deduped_34_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_8_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_7_1 ^ j_3 ), hoisted_7_1 );
                end );
            return Sum( List( hoisted_9_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_10_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_9_1[(1 + k_3)] ))])] * hoisted_7_1 ^ k_3;
                  end ) );
        end );
    hoisted_11_1 := deduped_38_1;
    hoisted_6_1 := Product( [ deduped_40_1, deduped_40_1, deduped_40_1 ] );
    hoisted_5_1 := deduped_40_1 * deduped_40_1;
    hoisted_4_1 := Product( [ deduped_38_1, deduped_39_1, deduped_40_1 ] );
    hoisted_3_1 := deduped_40_1;
    hoisted_2_1 := deduped_38_1 * deduped_39_1;
    hoisted_1_1 := deduped_33_1;
    deduped_32_1 := Filtered( deduped_33_1, function ( x_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2, deduped_5_2;
            deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_1_1[1 + x_2] );
            deduped_4_2 := 1 + REM_INT( deduped_5_2, hoisted_11_1 );
            deduped_3_2 := REM_INT( QUO_INT( deduped_5_2, hoisted_4_1 ), hoisted_3_1 );
            deduped_2_2 := REM_INT( QUO_INT( deduped_5_2, hoisted_2_1 ), hoisted_3_1 );
            deduped_1_2 := 1 + REM_INT( QUO_INT( deduped_5_2, hoisted_11_1 ), hoisted_15_1 );
            return deduped_2_2 + deduped_2_2 * hoisted_3_1 + deduped_3_2 * hoisted_5_1 + deduped_3_2 * hoisted_6_1 = hoisted_12_1[deduped_4_2] + hoisted_16_1[deduped_1_2] * hoisted_3_1 + hoisted_18_1[deduped_4_2] * hoisted_5_1 + hoisted_20_1[deduped_1_2] * hoisted_6_1;
        end );
    deduped_31_1 := Length( deduped_32_1 );
    deduped_30_1 := [ 0 .. deduped_31_1 - 1 ];
    hoisted_29_1 := List( [ 0 .. deduped_39_1 * deduped_44_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_13_1 ^ QUO_INT( i_2, hoisted_15_1 ) ), hoisted_13_1 );
        end );
    hoisted_27_1 := deduped_44_1;
    hoisted_28_1 := List( deduped_37_1, function ( logic_new_func_x_2 )
            return REM_INT( logic_new_func_x_2, hoisted_27_1 );
        end );
    hoisted_26_1 := List( [ 0 .. deduped_38_1 * deduped_42_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_7_1 ^ QUO_INT( i_2, hoisted_11_1 ) ), hoisted_7_1 );
        end );
    hoisted_24_1 := deduped_42_1;
    hoisted_25_1 := List( deduped_36_1, function ( logic_new_func_x_2 )
            return REM_INT( logic_new_func_x_2, hoisted_24_1 );
        end );
    hoisted_23_1 := deduped_32_1;
    hoisted_22_1 := deduped_31_1;
    hoisted_21_1 := deduped_30_1;
    return List( deduped_30_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
            deduped_4_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_21_1[1 + logic_new_func_x_2] );
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_1_1[1 + hoisted_23_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_21_1[(1 + REM_INT( QUO_INT( deduped_4_2, hoisted_22_1 ^ QUO_INT( deduped_4_2, hoisted_22_1 ) ), hoisted_22_1 ))] ))]] );
            hoisted_2_2 := REM_INT( QUO_INT( deduped_3_2, hoisted_11_1 ), hoisted_15_1 );
            hoisted_1_2 := REM_INT( deduped_3_2, hoisted_11_1 );
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfQuiverMorphism, NTuple( 2, List( hoisted_8_1, function ( logic_new_func_x_3 )
                        return hoisted_26_1[1 + (hoisted_1_2 + hoisted_25_1[(1 + logic_new_func_x_3)] * hoisted_11_1)];
                    end ), List( hoisted_9_1, function ( logic_new_func_x_3 )
                        return hoisted_29_1[1 + (hoisted_2_2 + hoisted_28_1[(1 + logic_new_func_x_3)] * hoisted_15_1)];
                    end ) ) );
        end );
end
########
        
    , 501 : IsPrecompiledDerivation := true );
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
end );

BindGlobal( "FinQuiversPrecompiled", function (  )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function (  )
    return CategoryOfQuiversEnrichedOver( CategoryOfSkeletalFinSets(  : FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_FinQuiversPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
