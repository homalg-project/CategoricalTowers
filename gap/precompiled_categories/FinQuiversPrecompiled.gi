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
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1;
    deduped_39_1 := DefiningTripleOfQuiver( arg2_1 );
    deduped_38_1 := DefiningTripleOfQuiver( arg3_1 );
    deduped_37_1 := deduped_38_1[3];
    deduped_36_1 := deduped_39_1[3];
    deduped_35_1 := deduped_39_1[2];
    deduped_34_1 := deduped_38_1[2];
    deduped_33_1 := deduped_39_1[1];
    deduped_32_1 := deduped_38_1[1];
    deduped_31_1 := deduped_32_1 ^ deduped_35_1;
    deduped_30_1 := deduped_34_1 ^ deduped_35_1;
    deduped_29_1 := deduped_32_1 ^ deduped_33_1;
    deduped_28_1 := [ 0 .. deduped_30_1 - 1 ];
    deduped_27_1 := [ 0 .. deduped_29_1 - 1 ];
    deduped_26_1 := [ 0 .. Product( [ deduped_29_1, deduped_30_1, deduped_31_1, deduped_31_1 ] ) - 1 ];
    hoisted_23_1 := List( deduped_37_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_15_1 := deduped_34_1;
    hoisted_11_1 := [ 0 .. deduped_35_1 - 1 ];
    hoisted_8_1 := deduped_32_1;
    hoisted_24_1 := List( deduped_28_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_11_1, function ( logic_new_func_x_3 )
                    return hoisted_23_1[1 + REM_INT( QUO_INT( i_2, hoisted_15_1 ^ logic_new_func_x_3 ), hoisted_15_1 )];
                end );
            return Sum( List( hoisted_11_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_8_1 ^ k_3;
                  end ) );
        end );
    hoisted_17_1 := deduped_30_1;
    hoisted_12_1 := deduped_29_1;
    hoisted_25_1 := List( deduped_26_1, function ( logic_new_func_x_2 )
            return hoisted_24_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_12_1 ), hoisted_17_1 )];
        end );
    hoisted_20_1 := List( deduped_36_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_9_1 := [ 0 .. deduped_33_1 - 1 ];
    hoisted_21_1 := List( deduped_27_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_9_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_8_1 ^ j_3 ), hoisted_8_1 );
                end );
            hoisted_2_2 := List( hoisted_11_1, function ( logic_new_func_x_3 )
                    return hoisted_1_2[1 + hoisted_20_1[(1 + logic_new_func_x_3)]];
                end );
            return Sum( List( hoisted_11_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_8_1 ^ k_3;
                  end ) );
        end );
    hoisted_22_1 := List( deduped_26_1, function ( logic_new_func_x_2 )
            return hoisted_21_1[1 + REM_INT( logic_new_func_x_2, hoisted_12_1 )];
        end );
    hoisted_16_1 := List( deduped_37_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_18_1 := List( deduped_28_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_11_1, function ( logic_new_func_x_3 )
                    return hoisted_16_1[1 + REM_INT( QUO_INT( i_2, hoisted_15_1 ^ logic_new_func_x_3 ), hoisted_15_1 )];
                end );
            return Sum( List( hoisted_11_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_8_1 ^ k_3;
                  end ) );
        end );
    hoisted_19_1 := List( deduped_26_1, function ( logic_new_func_x_2 )
            return hoisted_18_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_12_1 ), hoisted_17_1 )];
        end );
    hoisted_10_1 := List( deduped_36_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_13_1 := List( deduped_27_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_9_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_8_1 ^ j_3 ), hoisted_8_1 );
                end );
            hoisted_2_2 := List( hoisted_11_1, function ( logic_new_func_x_3 )
                    return hoisted_1_2[1 + hoisted_10_1[(1 + logic_new_func_x_3)]];
                end );
            return Sum( List( hoisted_11_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_8_1 ^ k_3;
                  end ) );
        end );
    hoisted_14_1 := List( deduped_26_1, function ( logic_new_func_x_2 )
            return hoisted_13_1[1 + REM_INT( logic_new_func_x_2, hoisted_12_1 )];
        end );
    hoisted_7_1 := Product( [ deduped_31_1, deduped_31_1, deduped_31_1 ] );
    hoisted_6_1 := deduped_31_1 * deduped_31_1;
    hoisted_4_1 := Product( [ deduped_29_1, deduped_30_1, deduped_31_1 ] );
    hoisted_2_1 := deduped_31_1;
    hoisted_5_1 := List( deduped_26_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_4_1 ), hoisted_2_1 );
        end );
    hoisted_1_1 := deduped_29_1 * deduped_30_1;
    hoisted_3_1 := List( deduped_26_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_1_1 ), hoisted_2_1 );
        end );
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, Length( Filtered( deduped_26_1, function ( x_2 )
                local deduped_1_2, deduped_2_2, deduped_3_2;
                deduped_3_2 := 1 + x_2;
                deduped_2_2 := hoisted_5_1[deduped_3_2];
                deduped_1_2 := hoisted_3_1[deduped_3_2];
                return deduped_1_2 + deduped_1_2 * hoisted_2_1 + deduped_2_2 * hoisted_6_1 + deduped_2_2 * hoisted_7_1 = hoisted_14_1[deduped_3_2] + hoisted_19_1[deduped_3_2] * hoisted_2_1 + hoisted_22_1[deduped_3_2] * hoisted_6_1 + hoisted_25_1[deduped_3_2] * hoisted_7_1;
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, hoisted_34_1, hoisted_35_1, hoisted_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1;
    deduped_56_1 := DefiningTripleOfQuiver( arg3_1 );
    deduped_55_1 := DefiningTripleOfQuiver( arg2_1 );
    deduped_54_1 := deduped_56_1[3];
    deduped_53_1 := deduped_55_1[3];
    deduped_52_1 := deduped_56_1[2];
    deduped_51_1 := deduped_56_1[1];
    deduped_50_1 := Length( Source( arg4_1 ) );
    deduped_49_1 := deduped_55_1[2];
    deduped_48_1 := deduped_55_1[1];
    deduped_47_1 := deduped_51_1 ^ deduped_49_1;
    deduped_46_1 := deduped_52_1 ^ deduped_49_1;
    deduped_45_1 := deduped_51_1 ^ deduped_48_1;
    deduped_44_1 := [ deduped_45_1, deduped_46_1, deduped_47_1, deduped_47_1 ];
    deduped_43_1 := Length( SetOfObjects( ModelingCategory( ModelingCategory( cat_1 ) ) ) );
    deduped_42_1 := [ 0 .. deduped_46_1 - 1 ];
    deduped_41_1 := [ 0 .. deduped_45_1 - 1 ];
    deduped_40_1 := [ 0 .. deduped_43_1 - 1 ];
    deduped_39_1 := [ 0 .. Product( deduped_44_1 ) - 1 ];
    hoisted_26_1 := List( deduped_54_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_18_1 := deduped_52_1;
    hoisted_14_1 := [ 0 .. deduped_49_1 - 1 ];
    hoisted_11_1 := deduped_51_1;
    hoisted_27_1 := List( deduped_42_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_14_1, function ( logic_new_func_x_3 )
                    return hoisted_26_1[1 + REM_INT( QUO_INT( i_2, hoisted_18_1 ^ logic_new_func_x_3 ), hoisted_18_1 )];
                end );
            return Sum( List( hoisted_14_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_11_1 ^ k_3;
                  end ) );
        end );
    hoisted_20_1 := deduped_46_1;
    hoisted_15_1 := deduped_45_1;
    hoisted_28_1 := List( deduped_39_1, function ( logic_new_func_x_2 )
            return hoisted_27_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_15_1 ), hoisted_20_1 )];
        end );
    hoisted_23_1 := List( deduped_53_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_12_1 := [ 0 .. deduped_48_1 - 1 ];
    hoisted_24_1 := List( deduped_41_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_12_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_11_1 ^ j_3 ), hoisted_11_1 );
                end );
            hoisted_2_2 := List( hoisted_14_1, function ( logic_new_func_x_3 )
                    return hoisted_1_2[1 + hoisted_23_1[(1 + logic_new_func_x_3)]];
                end );
            return Sum( List( hoisted_14_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_11_1 ^ k_3;
                  end ) );
        end );
    hoisted_25_1 := List( deduped_39_1, function ( logic_new_func_x_2 )
            return hoisted_24_1[1 + REM_INT( logic_new_func_x_2, hoisted_15_1 )];
        end );
    hoisted_19_1 := List( deduped_54_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_21_1 := List( deduped_42_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_14_1, function ( logic_new_func_x_3 )
                    return hoisted_19_1[1 + REM_INT( QUO_INT( i_2, hoisted_18_1 ^ logic_new_func_x_3 ), hoisted_18_1 )];
                end );
            return Sum( List( hoisted_14_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_11_1 ^ k_3;
                  end ) );
        end );
    hoisted_22_1 := List( deduped_39_1, function ( logic_new_func_x_2 )
            return hoisted_21_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_15_1 ), hoisted_20_1 )];
        end );
    hoisted_13_1 := List( deduped_53_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_16_1 := List( deduped_41_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_12_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_11_1 ^ j_3 ), hoisted_11_1 );
                end );
            hoisted_2_2 := List( hoisted_14_1, function ( logic_new_func_x_3 )
                    return hoisted_1_2[1 + hoisted_13_1[(1 + logic_new_func_x_3)]];
                end );
            return Sum( List( hoisted_14_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_11_1 ^ k_3;
                  end ) );
        end );
    hoisted_17_1 := List( deduped_39_1, function ( logic_new_func_x_2 )
            return hoisted_16_1[1 + REM_INT( logic_new_func_x_2, hoisted_15_1 )];
        end );
    hoisted_10_1 := Product( [ deduped_47_1, deduped_47_1, deduped_47_1 ] );
    hoisted_9_1 := deduped_47_1 * deduped_47_1;
    hoisted_7_1 := Product( [ deduped_45_1, deduped_46_1, deduped_47_1 ] );
    hoisted_5_1 := deduped_47_1;
    hoisted_8_1 := List( deduped_39_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_7_1 ), hoisted_5_1 );
        end );
    hoisted_4_1 := deduped_45_1 * deduped_46_1;
    hoisted_6_1 := List( deduped_39_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_4_1 ), hoisted_5_1 );
        end );
    deduped_38_1 := Filtered( deduped_39_1, function ( x_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := 1 + x_2;
            deduped_2_2 := hoisted_8_1[deduped_3_2];
            deduped_1_2 := hoisted_6_1[deduped_3_2];
            return deduped_1_2 + deduped_1_2 * hoisted_5_1 + deduped_2_2 * hoisted_9_1 + deduped_2_2 * hoisted_10_1 = hoisted_17_1[deduped_3_2] + hoisted_22_1[deduped_3_2] * hoisted_5_1 + hoisted_25_1[deduped_3_2] * hoisted_9_1 + hoisted_28_1[deduped_3_2] * hoisted_10_1;
        end );
    hoisted_29_1 := deduped_44_1;
    hoisted_36_1 := List( deduped_40_1, function ( logic_new_func_x_2 )
            return hoisted_29_1[1 + logic_new_func_x_2];
        end );
    hoisted_34_1 := [ 0 .. deduped_50_1 - 1 ];
    hoisted_33_1 := AsList( arg4_1 );
    hoisted_32_1 := [ 0 .. Length( deduped_38_1 ) - 1 ];
    hoisted_31_1 := deduped_38_1;
    hoisted_30_1 := deduped_39_1;
    hoisted_35_1 := List( deduped_40_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2;
            hoisted_2_2 := hoisted_29_1[1 + logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_29_1{[ 1 .. logic_new_func_x_2 ]} );
            hoisted_3_2 := List( hoisted_30_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            hoisted_4_2 := List( hoisted_32_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_31_1[(1 + i_3)]];
                end );
            return List( hoisted_34_1, function ( i_3 )
                    return hoisted_4_2[1 + hoisted_33_1[(1 + i_3)]];
                end );
        end );
    hoisted_3_1 := [ deduped_51_1, deduped_52_1 ];
    hoisted_2_1 := deduped_50_1;
    hoisted_1_1 := [ deduped_48_1, deduped_49_1 ];
    deduped_37_1 := List( [ 1 .. deduped_43_1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, deduped_10_2, deduped_11_2, deduped_12_2, deduped_13_2;
            deduped_13_2 := hoisted_3_1[logic_new_func_x_2];
            deduped_12_2 := hoisted_1_1[logic_new_func_x_2];
            deduped_11_2 := deduped_13_2 ^ deduped_12_2;
            deduped_10_2 := [ 0 .. hoisted_2_1 * deduped_12_2 - 1 ];
            hoisted_2_2 := deduped_13_2;
            hoisted_1_2 := deduped_11_2;
            hoisted_8_2 := List( [ 0 .. deduped_11_2 * deduped_12_2 - 1 ], function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_2_2 ^ QUO_INT( i_3, hoisted_1_2 ) ), hoisted_2_2 );
                end );
            hoisted_7_2 := hoisted_36_1[logic_new_func_x_2];
            hoisted_5_2 := deduped_12_2;
            hoisted_6_2 := List( deduped_10_2, function ( logic_new_func_x_3 )
                    return REM_INT( QUO_INT( logic_new_func_x_3, hoisted_2_1 ), hoisted_5_2 );
                end );
            hoisted_3_2 := hoisted_35_1[logic_new_func_x_2];
            hoisted_4_2 := List( deduped_10_2, function ( logic_new_func_x_3 )
                    return hoisted_3_2[1 + REM_INT( logic_new_func_x_3, hoisted_2_1 )];
                end );
            hoisted_9_2 := List( deduped_10_2, function ( logic_new_func_x_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + logic_new_func_x_3;
                    return hoisted_8_2[1 + (hoisted_4_2[deduped_1_3] + hoisted_6_2[deduped_1_3] * hoisted_7_2)];
                end );
            return List( [ 0 .. deduped_12_2 - 1 ], function ( i_3 )
                    return hoisted_9_2[1 + i_3];
                end );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfQuiverMorphism, NTuple( 2, deduped_37_1[1], deduped_37_1[2] ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, hoisted_34_1, hoisted_35_1, hoisted_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1;
    deduped_56_1 := DefiningTripleOfQuiver( arg2_1 );
    deduped_55_1 := DefiningTripleOfQuiver( arg3_1 );
    deduped_54_1 := deduped_55_1[3];
    deduped_53_1 := deduped_56_1[3];
    deduped_52_1 := deduped_56_1[2];
    deduped_51_1 := deduped_55_1[2];
    deduped_50_1 := deduped_56_1[1];
    deduped_49_1 := deduped_55_1[1];
    deduped_48_1 := deduped_49_1 ^ deduped_52_1;
    deduped_47_1 := deduped_51_1 ^ deduped_52_1;
    deduped_46_1 := deduped_49_1 ^ deduped_50_1;
    deduped_45_1 := [ deduped_46_1, deduped_47_1, deduped_48_1, deduped_48_1 ];
    deduped_44_1 := Length( SetOfObjects( ModelingCategory( ModelingCategory( cat_1 ) ) ) );
    deduped_43_1 := [ 0 .. deduped_47_1 - 1 ];
    deduped_42_1 := [ 0 .. deduped_46_1 - 1 ];
    deduped_41_1 := [ 0 .. deduped_44_1 - 1 ];
    deduped_40_1 := [ 0 .. Product( deduped_45_1 ) - 1 ];
    hoisted_23_1 := List( deduped_54_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_15_1 := deduped_51_1;
    hoisted_11_1 := [ 0 .. deduped_52_1 - 1 ];
    hoisted_8_1 := deduped_49_1;
    hoisted_24_1 := List( deduped_43_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_11_1, function ( logic_new_func_x_3 )
                    return hoisted_23_1[1 + REM_INT( QUO_INT( i_2, hoisted_15_1 ^ logic_new_func_x_3 ), hoisted_15_1 )];
                end );
            return Sum( List( hoisted_11_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_8_1 ^ k_3;
                  end ) );
        end );
    hoisted_17_1 := deduped_47_1;
    hoisted_12_1 := deduped_46_1;
    hoisted_25_1 := List( deduped_40_1, function ( logic_new_func_x_2 )
            return hoisted_24_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_12_1 ), hoisted_17_1 )];
        end );
    hoisted_20_1 := List( deduped_53_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_9_1 := [ 0 .. deduped_50_1 - 1 ];
    hoisted_21_1 := List( deduped_42_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_9_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_8_1 ^ j_3 ), hoisted_8_1 );
                end );
            hoisted_2_2 := List( hoisted_11_1, function ( logic_new_func_x_3 )
                    return hoisted_1_2[1 + hoisted_20_1[(1 + logic_new_func_x_3)]];
                end );
            return Sum( List( hoisted_11_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_8_1 ^ k_3;
                  end ) );
        end );
    hoisted_22_1 := List( deduped_40_1, function ( logic_new_func_x_2 )
            return hoisted_21_1[1 + REM_INT( logic_new_func_x_2, hoisted_12_1 )];
        end );
    hoisted_16_1 := List( deduped_54_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_18_1 := List( deduped_43_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_11_1, function ( logic_new_func_x_3 )
                    return hoisted_16_1[1 + REM_INT( QUO_INT( i_2, hoisted_15_1 ^ logic_new_func_x_3 ), hoisted_15_1 )];
                end );
            return Sum( List( hoisted_11_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_8_1 ^ k_3;
                  end ) );
        end );
    hoisted_19_1 := List( deduped_40_1, function ( logic_new_func_x_2 )
            return hoisted_18_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_12_1 ), hoisted_17_1 )];
        end );
    hoisted_10_1 := List( deduped_53_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_13_1 := List( deduped_42_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_9_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_8_1 ^ j_3 ), hoisted_8_1 );
                end );
            hoisted_2_2 := List( hoisted_11_1, function ( logic_new_func_x_3 )
                    return hoisted_1_2[1 + hoisted_10_1[(1 + logic_new_func_x_3)]];
                end );
            return Sum( List( hoisted_11_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_8_1 ^ k_3;
                  end ) );
        end );
    hoisted_14_1 := List( deduped_40_1, function ( logic_new_func_x_2 )
            return hoisted_13_1[1 + REM_INT( logic_new_func_x_2, hoisted_12_1 )];
        end );
    hoisted_7_1 := Product( [ deduped_48_1, deduped_48_1, deduped_48_1 ] );
    hoisted_6_1 := deduped_48_1 * deduped_48_1;
    hoisted_4_1 := Product( [ deduped_46_1, deduped_47_1, deduped_48_1 ] );
    hoisted_2_1 := deduped_48_1;
    hoisted_5_1 := List( deduped_40_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_4_1 ), hoisted_2_1 );
        end );
    hoisted_1_1 := deduped_46_1 * deduped_47_1;
    hoisted_3_1 := List( deduped_40_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_1_1 ), hoisted_2_1 );
        end );
    deduped_39_1 := Filtered( deduped_40_1, function ( x_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := 1 + x_2;
            deduped_2_2 := hoisted_5_1[deduped_3_2];
            deduped_1_2 := hoisted_3_1[deduped_3_2];
            return deduped_1_2 + deduped_1_2 * hoisted_2_1 + deduped_2_2 * hoisted_6_1 + deduped_2_2 * hoisted_7_1 = hoisted_14_1[deduped_3_2] + hoisted_19_1[deduped_3_2] * hoisted_2_1 + hoisted_22_1[deduped_3_2] * hoisted_6_1 + hoisted_25_1[deduped_3_2] * hoisted_7_1;
        end );
    deduped_38_1 := Length( deduped_39_1 );
    deduped_37_1 := [ 0 .. deduped_38_1 - 1 ];
    hoisted_36_1 := [ 1 .. deduped_44_1 ];
    hoisted_33_1 := deduped_45_1;
    hoisted_35_1 := List( deduped_41_1, function ( logic_new_func_x_2 )
            return hoisted_33_1[1 + logic_new_func_x_2];
        end );
    hoisted_34_1 := deduped_41_1;
    hoisted_32_1 := deduped_40_1;
    hoisted_31_1 := deduped_39_1;
    hoisted_30_1 := deduped_37_1;
    hoisted_28_1 := deduped_38_1;
    hoisted_29_1 := List( deduped_37_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_28_1 ^ QUO_INT( i_2, hoisted_28_1 ) ), hoisted_28_1 );
        end );
    hoisted_27_1 := [ deduped_49_1, deduped_51_1 ];
    hoisted_26_1 := [ deduped_50_1, deduped_52_1 ];
    return List( deduped_37_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_32_1[1 + hoisted_31_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_30_1[(1 + hoisted_29_1[(1 + logic_new_func_x_2)])] ))]] );
            hoisted_2_2 := List( hoisted_34_1, function ( logic_new_func_x_3 )
                    return ListWithIdenticalEntries( 1, REM_INT( QUO_INT( hoisted_1_2, Product( hoisted_33_1{[ 1 .. logic_new_func_x_3 ]} ) ), hoisted_33_1[1 + logic_new_func_x_3] ) );
                end );
            deduped_3_2 := List( hoisted_36_1, function ( logic_new_func_x_3 )
                    local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, hoisted_5_3, hoisted_6_3, hoisted_7_3, deduped_8_3, deduped_9_3, deduped_10_3, deduped_11_3;
                    deduped_11_3 := hoisted_27_1[logic_new_func_x_3];
                    deduped_10_3 := hoisted_26_1[logic_new_func_x_3];
                    deduped_9_3 := deduped_11_3 ^ deduped_10_3;
                    deduped_8_3 := [ 0 .. deduped_10_3 - 1 ];
                    hoisted_2_3 := deduped_11_3;
                    hoisted_1_3 := deduped_9_3;
                    hoisted_7_3 := List( [ 0 .. deduped_9_3 * deduped_10_3 - 1 ], function ( i_4 )
                            return REM_INT( QUO_INT( i_4, hoisted_2_3 ^ QUO_INT( i_4, hoisted_1_3 ) ), hoisted_2_3 );
                        end );
                    hoisted_6_3 := hoisted_2_2[logic_new_func_x_3][1];
                    hoisted_5_3 := hoisted_35_1[logic_new_func_x_3];
                    hoisted_3_3 := deduped_10_3;
                    hoisted_4_3 := List( deduped_8_3, function ( logic_new_func_x_4 )
                            return REM_INT( logic_new_func_x_4, hoisted_3_3 );
                        end );
                    return List( deduped_8_3, function ( logic_new_func_x_4 )
                            return hoisted_7_3[1 + (hoisted_6_3 + hoisted_4_3[(1 + logic_new_func_x_4)] * hoisted_5_3)];
                        end );
                end );
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfQuiverMorphism, NTuple( 2, deduped_3_2[1], deduped_3_2[2] ) );
        end );
end
########
        
    , 501 : IsPrecompiledDerivation := true );
    
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
