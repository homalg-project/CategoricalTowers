# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_PreSheavesOfCategoryFromDataTablesInSkeletalFinSetsSubobjectClassifierPrecompiled", function ( cat )
    
    ##
    AddSubobjectClassifier( cat,
        
########
function ( cat_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1;
    deduped_36_1 := Range( cat_1 );
    deduped_35_1 := Source( cat_1 );
    deduped_34_1 := IndicesOfGeneratingMorphisms( deduped_35_1 );
    deduped_33_1 := DataTables( deduped_35_1 );
    deduped_32_1 := deduped_33_1[2];
    deduped_31_1 := deduped_33_1[1];
    deduped_30_1 := [ 0 .. deduped_31_1[2] - 1 ];
    deduped_29_1 := [ 0 .. deduped_31_1[1] - 1 ];
    deduped_28_1 := Length( deduped_29_1 );
    deduped_27_1 := [ 1 .. deduped_28_1 ];
    hoisted_11_1 := deduped_36_1;
    hoisted_10_1 := deduped_32_1[7];
    hoisted_9_1 := deduped_32_1[4];
    hoisted_8_1 := List( deduped_30_1, function ( logic_new_func_x_2 )
            return [ logic_new_func_x_2 ];
        end );
    hoisted_7_1 := deduped_32_1[8];
    hoisted_6_1 := List( deduped_29_1, function ( logic_new_func_x_2 )
            return [ logic_new_func_x_2 ];
        end );
    hoisted_5_1 := deduped_28_1;
    hoisted_4_1 := deduped_27_1;
    hoisted_2_1 := deduped_29_1;
    hoisted_1_1 := deduped_32_1[5];
    hoisted_3_1 := List( deduped_29_1, function ( logic_new_func_x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + logic_new_func_x_2;
            return List( hoisted_2_1, function ( logic_new_func_x_3 )
                    return hoisted_1_1[1 + logic_new_func_x_3][hoisted_1_2];
                end );
        end );
    deduped_26_1 := List( deduped_27_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, hoisted_16_2, hoisted_17_2, hoisted_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2, deduped_23_2, deduped_24_2, deduped_25_2;
            deduped_25_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 );
            hoisted_1_2 := hoisted_3_1[deduped_25_2];
            deduped_24_2 := List( hoisted_4_1, function ( logic_new_func_x_3 )
                    return hoisted_1_2[logic_new_func_x_3];
                end );
            deduped_23_2 := Sum( deduped_24_2 );
            deduped_22_2 := 2 ^ deduped_23_2;
            deduped_21_2 := [ 0 .. deduped_23_2 - 1 ];
            deduped_20_2 := List( hoisted_4_1, function ( logic_new_func_x_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_3 );
                    return List( hoisted_4_1, function ( logic_new_func_x_4 )
                            local deduped_1_4;
                            deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_4 );
                            return hoisted_3_1[deduped_1_4][hoisted_1_3] * hoisted_1_2[deduped_1_4];
                        end );
                end );
            deduped_19_2 := Sum( Concatenation( deduped_20_2 ) );
            hoisted_17_2 := 1 + hoisted_6_1[deduped_25_2][1];
            hoisted_10_2 := deduped_24_2;
            hoisted_18_2 := Concatenation( List( hoisted_4_1, function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, deduped_5_3, deduped_6_3;
                      deduped_6_3 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_3 );
                      deduped_5_3 := Sum( hoisted_10_2{[ 1 .. logic_new_func_x_3 - 1 ]} );
                      hoisted_4_3 := [ deduped_5_3 .. deduped_5_3 + hoisted_1_2[deduped_6_3] - 1 ];
                      hoisted_2_3 := hoisted_7_1[1 + hoisted_6_1[deduped_6_3][1]];
                      hoisted_1_3 := deduped_6_3;
                      hoisted_3_3 := Concatenation( List( hoisted_4_1, function ( logic_new_func_x_4 )
                                local hoisted_1_4, hoisted_2_4, hoisted_3_4, hoisted_4_4, deduped_5_4, deduped_6_4, deduped_7_4, deduped_8_4, deduped_9_4;
                                deduped_9_4 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_4 );
                                deduped_8_4 := hoisted_1_2[deduped_9_4];
                                deduped_7_4 := 1 + hoisted_6_1[logic_new_func_x_4][1];
                                deduped_6_4 := hoisted_3_1[deduped_9_4][hoisted_1_3];
                                deduped_5_4 := [ deduped_6_4, deduped_8_4 ];
                                hoisted_4_4 := hoisted_7_1[deduped_7_4][hoisted_17_2];
                                hoisted_3_4 := deduped_5_4[2];
                                hoisted_2_4 := hoisted_2_3[deduped_7_4];
                                hoisted_1_4 := deduped_5_4[1];
                                return List( [ 0 .. deduped_6_4 * deduped_8_4 - 1 ], function ( i_5 )
                                        local deduped_1_5;
                                        deduped_1_5 := CAP_JIT_INCOMPLETE_LOGIC( i_5 );
                                        return hoisted_10_1[1 + hoisted_8_1[(1 + hoisted_9_1[(1 + hoisted_8_1[(1 + hoisted_2_4[(1 + REM_INT( deduped_1_5, hoisted_1_4 ))])][1])][(1 + hoisted_8_1[(1 + hoisted_4_4[(1 + REM_INT( QUO_INT( deduped_1_5, hoisted_1_4 ), hoisted_3_4 ))])][1])])][1]][1];
                                    end );
                            end ) );
                      return List( [ 0 .. Sum( List( hoisted_4_1, function ( logic_new_func_x_4 )
                                        local deduped_1_4;
                                        deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_4 );
                                        return hoisted_3_1[deduped_1_4][hoisted_1_3] * hoisted_1_2[deduped_1_4];
                                    end ) ) - 1 ], function ( i_4 )
                              return hoisted_4_3[1 + hoisted_3_3[(1 + i_4)]];
                          end );
                  end ) );
            hoisted_12_2 := List( hoisted_4_1, function ( logic_new_func_x_3 )
                    return List( hoisted_4_1, function ( logic_new_func_x_4 )
                            return [ hoisted_3_1[logic_new_func_x_4][logic_new_func_x_3], hoisted_1_2[logic_new_func_x_4] ];
                        end );
                end );
            hoisted_11_2 := List( hoisted_4_1, function ( logic_new_func_x_3 )
                    return List( hoisted_4_1, function ( logic_new_func_x_4 )
                            return hoisted_3_1[logic_new_func_x_4][logic_new_func_x_3] * hoisted_1_2[logic_new_func_x_4];
                        end );
                end );
            hoisted_9_2 := deduped_20_2;
            hoisted_15_2 := Concatenation( List( hoisted_4_1, function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3, deduped_4_3, deduped_5_3;
                      deduped_5_3 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_3 );
                      deduped_4_3 := Sum( hoisted_10_2{[ 1 .. logic_new_func_x_3 - 1 ]} );
                      hoisted_3_3 := [ deduped_4_3 .. deduped_4_3 + hoisted_1_2[deduped_5_3] - 1 ];
                      hoisted_1_3 := deduped_5_3;
                      hoisted_2_3 := Concatenation( List( hoisted_4_1, function ( logic_new_func_x_4 )
                                local hoisted_1_4, hoisted_2_4, deduped_3_4;
                                deduped_3_4 := hoisted_12_2[logic_new_func_x_4][hoisted_1_3];
                                hoisted_2_4 := deduped_3_4[2];
                                hoisted_1_4 := deduped_3_4[1];
                                return List( [ 0 .. hoisted_11_2[logic_new_func_x_4][hoisted_1_3] - 1 ], function ( i_5 )
                                        return REM_INT( QUO_INT( i_5, hoisted_1_4 ), hoisted_2_4 );
                                    end );
                            end ) );
                      return List( [ 0 .. Sum( List( hoisted_4_1, function ( logic_new_func_x_4 )
                                        return hoisted_9_2[logic_new_func_x_4][hoisted_1_3];
                                    end ) ) - 1 ], function ( i_4 )
                              return hoisted_3_3[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                  end ) );
            hoisted_13_2 := Concatenation( List( hoisted_4_1, function ( logic_new_func_x_3 )
                      return List( hoisted_4_1, function ( logic_new_func_x_4 )
                              return hoisted_9_2[logic_new_func_x_4][logic_new_func_x_3];
                          end );
                  end ) );
            hoisted_14_2 := Concatenation( Concatenation( List( hoisted_4_1, function ( logic_new_func_x_3 )
                        return List( hoisted_4_1, function ( logic_new_func_x_4 )
                                local deduped_1_4, deduped_2_4;
                                deduped_2_4 := hoisted_5_1 * (logic_new_func_x_4 - 1) + logic_new_func_x_3;
                                deduped_1_4 := Sum( hoisted_13_2{[ 1 .. deduped_2_4 - 1 ]} );
                                return [ deduped_1_4 .. deduped_1_4 + hoisted_13_2[deduped_2_4] - 1 ];
                            end );
                    end ) ) );
            hoisted_16_2 := List( [ 0 .. deduped_19_2 - 1 ], function ( i_3 )
                    return hoisted_15_2[1 + hoisted_14_2[(1 + i_3)]];
                end );
            hoisted_8_2 := deduped_19_2;
            hoisted_7_2 := deduped_21_2;
            hoisted_4_2 := deduped_22_2;
            hoisted_6_2 := List( [ 0 .. deduped_22_2 * deduped_23_2 - 1 ], function ( i_3 )
                    return REM_INT( QUO_INT( i_3, 2 ^ QUO_INT( i_3, hoisted_4_2 ) ), 2 );
                end );
            hoisted_2_2 := deduped_23_2;
            hoisted_5_2 := List( deduped_21_2, function ( logic_new_func_x_3 )
                    return REM_INT( logic_new_func_x_3, hoisted_2_2 );
                end );
            hoisted_3_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_23_2 * GeometricSumDiff1( deduped_23_2, deduped_23_2 ) );
            return CreateCapCategoryObjectWithAttributes( hoisted_11_1, Length, Length( Filtered( [ 0 .. deduped_22_2 - 1 ], function ( x_3 )
                        local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, hoisted_5_3, hoisted_6_3, deduped_7_3, deduped_8_3, deduped_9_3;
                        hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( x_3 );
                        deduped_9_3 := Filtered( hoisted_7_2, function ( x_4 )
                                return hoisted_6_2[1 + (hoisted_1_3 + hoisted_5_2[(1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( CAP_JIT_INCOMPLETE_LOGIC( x_4 ), hoisted_2_2 ) ))] * hoisted_4_2)] = 1;
                            end );
                        deduped_8_3 := Length( deduped_9_3 );
                        hoisted_2_3 := deduped_9_3;
                        hoisted_4_3 := List( [ 0 .. deduped_8_3 - 1 ], function ( i_4 )
                                return hoisted_5_2[1 + hoisted_2_3[(1 + i_4)]];
                            end );
                        hoisted_3_3 := deduped_8_3;
                        deduped_7_3 := Filtered( [ 0 .. hoisted_8_2 * deduped_8_3 - 1 ], function ( x_4 )
                                local deduped_1_4;
                                deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( x_4 );
                                return hoisted_16_2[1 + REM_INT( deduped_1_4, hoisted_8_2 )] = hoisted_4_3[1 + REM_INT( QUO_INT( deduped_1_4, hoisted_8_2 ), hoisted_3_3 )];
                            end );
                        hoisted_5_3 := deduped_7_3;
                        hoisted_6_3 := List( [ 0 .. Length( deduped_7_3 ) - 1 ], function ( logic_new_func_x_4 )
                                return hoisted_18_2[1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_5_3[(1 + logic_new_func_x_4)] ), hoisted_8_2 )];
                            end );
                        return Sum( List( hoisted_7_2, function ( k_4 )
                                    return IdFunc( function (  )
                                                if (CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( hoisted_3_2, hoisted_2_2 ^ CAP_JIT_INCOMPLETE_LOGIC( k_4 ) ), hoisted_2_2 ) ) in hoisted_6_3) then
                                                    return 1;
                                                else
                                                    return 0;
                                                fi;
                                                return;
                                            end )(  ) * 2 ^ k_4;
                                end ) ) = x_3;
                    end ) ) );
        end );
    hoisted_25_1 := [ 0, 1 ];
    hoisted_23_1 := deduped_32_1[6];
    hoisted_19_1 := deduped_32_1[3];
    hoisted_20_1 := List( deduped_30_1, function ( logic_new_func_x_2 )
            return [ hoisted_19_1[1 + logic_new_func_x_2] ];
        end );
    hoisted_16_1 := deduped_32_1[2];
    hoisted_18_1 := List( deduped_30_1, function ( logic_new_func_x_2 )
            return [ hoisted_16_1[1 + logic_new_func_x_2] ];
        end );
    hoisted_17_1 := deduped_32_1[1];
    hoisted_24_1 := List( deduped_34_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2;
            deduped_7_2 := 1 + logic_new_func_x_2;
            hoisted_5_2 := 1 + hoisted_8_1[deduped_7_2][1];
            hoisted_6_2 := List( hoisted_2_1, function ( logic_new_func_x_3 )
                    return hoisted_23_1[1 + hoisted_8_1[(1 + hoisted_17_1[(1 + logic_new_func_x_3)])][1]][hoisted_5_2];
                end );
            hoisted_3_2 := 1 + hoisted_20_1[deduped_7_2][1];
            hoisted_4_2 := List( hoisted_2_1, function ( logic_new_func_x_3 )
                    return hoisted_1_1[1 + hoisted_18_1[(1 + hoisted_17_1[(1 + logic_new_func_x_3)])][1]][hoisted_3_2];
                end );
            hoisted_1_2 := 1 + hoisted_18_1[deduped_7_2][1];
            hoisted_2_2 := List( hoisted_2_1, function ( logic_new_func_x_3 )
                    return hoisted_1_1[1 + hoisted_20_1[(1 + hoisted_17_1[(1 + logic_new_func_x_3)])][1]][hoisted_1_2];
                end );
            return Concatenation( List( hoisted_4_1, function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := Sum( hoisted_4_2{[ 1 .. logic_new_func_x_3 - 1 ]} );
                      hoisted_2_3 := [ deduped_3_3 .. deduped_3_3 + hoisted_4_2[logic_new_func_x_3] - 1 ];
                      hoisted_1_3 := hoisted_6_2[logic_new_func_x_3];
                      return List( [ 0 .. hoisted_2_2[logic_new_func_x_3] - 1 ], function ( i_4 )
                              return hoisted_2_3[1 + hoisted_1_3[(1 + i_4)]];
                          end );
                  end ) );
        end );
    hoisted_22_1 := List( deduped_34_1, function ( logic_new_func_x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + hoisted_18_1[(1 + logic_new_func_x_2)][1];
            return Sum( List( hoisted_2_1, function ( logic_new_func_x_3 )
                      return hoisted_1_1[1 + hoisted_20_1[(1 + hoisted_17_1[(1 + logic_new_func_x_3)])][1]][hoisted_1_2];
                  end ) );
        end );
    hoisted_21_1 := List( deduped_34_1, function ( logic_new_func_x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + hoisted_20_1[(1 + logic_new_func_x_2)][1];
            return Sum( List( hoisted_2_1, function ( logic_new_func_x_3 )
                      return hoisted_1_1[1 + hoisted_18_1[(1 + hoisted_17_1[(1 + logic_new_func_x_3)])][1]][hoisted_1_2];
                  end ) );
        end );
    hoisted_15_1 := List( deduped_27_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, hoisted_16_2, hoisted_17_2, hoisted_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2, deduped_23_2, deduped_24_2, deduped_25_2;
            deduped_25_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 );
            hoisted_1_2 := hoisted_3_1[deduped_25_2];
            deduped_24_2 := List( hoisted_4_1, function ( logic_new_func_x_3 )
                    return hoisted_1_2[logic_new_func_x_3];
                end );
            deduped_23_2 := Sum( deduped_24_2 );
            deduped_22_2 := 2 ^ deduped_23_2;
            deduped_21_2 := [ 0 .. deduped_23_2 - 1 ];
            deduped_20_2 := List( hoisted_4_1, function ( logic_new_func_x_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_3 );
                    return List( hoisted_4_1, function ( logic_new_func_x_4 )
                            local deduped_1_4;
                            deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_4 );
                            return hoisted_3_1[deduped_1_4][hoisted_1_3] * hoisted_1_2[deduped_1_4];
                        end );
                end );
            deduped_19_2 := Sum( Concatenation( deduped_20_2 ) );
            hoisted_17_2 := 1 + hoisted_6_1[deduped_25_2][1];
            hoisted_10_2 := deduped_24_2;
            hoisted_18_2 := Concatenation( List( hoisted_4_1, function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, deduped_5_3, deduped_6_3;
                      deduped_6_3 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_3 );
                      deduped_5_3 := Sum( hoisted_10_2{[ 1 .. logic_new_func_x_3 - 1 ]} );
                      hoisted_4_3 := [ deduped_5_3 .. deduped_5_3 + hoisted_1_2[deduped_6_3] - 1 ];
                      hoisted_2_3 := hoisted_7_1[1 + hoisted_6_1[deduped_6_3][1]];
                      hoisted_1_3 := deduped_6_3;
                      hoisted_3_3 := Concatenation( List( hoisted_4_1, function ( logic_new_func_x_4 )
                                local hoisted_1_4, hoisted_2_4, hoisted_3_4, hoisted_4_4, deduped_5_4, deduped_6_4, deduped_7_4, deduped_8_4, deduped_9_4;
                                deduped_9_4 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_4 );
                                deduped_8_4 := hoisted_1_2[deduped_9_4];
                                deduped_7_4 := 1 + hoisted_6_1[logic_new_func_x_4][1];
                                deduped_6_4 := hoisted_3_1[deduped_9_4][hoisted_1_3];
                                deduped_5_4 := [ deduped_6_4, deduped_8_4 ];
                                hoisted_4_4 := hoisted_7_1[deduped_7_4][hoisted_17_2];
                                hoisted_3_4 := deduped_5_4[2];
                                hoisted_2_4 := hoisted_2_3[deduped_7_4];
                                hoisted_1_4 := deduped_5_4[1];
                                return List( [ 0 .. deduped_6_4 * deduped_8_4 - 1 ], function ( i_5 )
                                        local deduped_1_5;
                                        deduped_1_5 := CAP_JIT_INCOMPLETE_LOGIC( i_5 );
                                        return hoisted_10_1[1 + hoisted_8_1[(1 + hoisted_9_1[(1 + hoisted_8_1[(1 + hoisted_2_4[(1 + REM_INT( deduped_1_5, hoisted_1_4 ))])][1])][(1 + hoisted_8_1[(1 + hoisted_4_4[(1 + REM_INT( QUO_INT( deduped_1_5, hoisted_1_4 ), hoisted_3_4 ))])][1])])][1]][1];
                                    end );
                            end ) );
                      return List( [ 0 .. Sum( List( hoisted_4_1, function ( logic_new_func_x_4 )
                                        local deduped_1_4;
                                        deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_4 );
                                        return hoisted_3_1[deduped_1_4][hoisted_1_3] * hoisted_1_2[deduped_1_4];
                                    end ) ) - 1 ], function ( i_4 )
                              return hoisted_4_3[1 + hoisted_3_3[(1 + i_4)]];
                          end );
                  end ) );
            hoisted_12_2 := List( hoisted_4_1, function ( logic_new_func_x_3 )
                    return List( hoisted_4_1, function ( logic_new_func_x_4 )
                            return [ hoisted_3_1[logic_new_func_x_4][logic_new_func_x_3], hoisted_1_2[logic_new_func_x_4] ];
                        end );
                end );
            hoisted_11_2 := List( hoisted_4_1, function ( logic_new_func_x_3 )
                    return List( hoisted_4_1, function ( logic_new_func_x_4 )
                            return hoisted_3_1[logic_new_func_x_4][logic_new_func_x_3] * hoisted_1_2[logic_new_func_x_4];
                        end );
                end );
            hoisted_9_2 := deduped_20_2;
            hoisted_15_2 := Concatenation( List( hoisted_4_1, function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3, deduped_4_3, deduped_5_3;
                      deduped_5_3 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_3 );
                      deduped_4_3 := Sum( hoisted_10_2{[ 1 .. logic_new_func_x_3 - 1 ]} );
                      hoisted_3_3 := [ deduped_4_3 .. deduped_4_3 + hoisted_1_2[deduped_5_3] - 1 ];
                      hoisted_1_3 := deduped_5_3;
                      hoisted_2_3 := Concatenation( List( hoisted_4_1, function ( logic_new_func_x_4 )
                                local hoisted_1_4, hoisted_2_4, deduped_3_4;
                                deduped_3_4 := hoisted_12_2[logic_new_func_x_4][hoisted_1_3];
                                hoisted_2_4 := deduped_3_4[2];
                                hoisted_1_4 := deduped_3_4[1];
                                return List( [ 0 .. hoisted_11_2[logic_new_func_x_4][hoisted_1_3] - 1 ], function ( i_5 )
                                        return REM_INT( QUO_INT( i_5, hoisted_1_4 ), hoisted_2_4 );
                                    end );
                            end ) );
                      return List( [ 0 .. Sum( List( hoisted_4_1, function ( logic_new_func_x_4 )
                                        return hoisted_9_2[logic_new_func_x_4][hoisted_1_3];
                                    end ) ) - 1 ], function ( i_4 )
                              return hoisted_3_3[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                  end ) );
            hoisted_13_2 := Concatenation( List( hoisted_4_1, function ( logic_new_func_x_3 )
                      return List( hoisted_4_1, function ( logic_new_func_x_4 )
                              return hoisted_9_2[logic_new_func_x_4][logic_new_func_x_3];
                          end );
                  end ) );
            hoisted_14_2 := Concatenation( Concatenation( List( hoisted_4_1, function ( logic_new_func_x_3 )
                        return List( hoisted_4_1, function ( logic_new_func_x_4 )
                                local deduped_1_4, deduped_2_4;
                                deduped_2_4 := hoisted_5_1 * (logic_new_func_x_4 - 1) + logic_new_func_x_3;
                                deduped_1_4 := Sum( hoisted_13_2{[ 1 .. deduped_2_4 - 1 ]} );
                                return [ deduped_1_4 .. deduped_1_4 + hoisted_13_2[deduped_2_4] - 1 ];
                            end );
                    end ) ) );
            hoisted_16_2 := List( [ 0 .. deduped_19_2 - 1 ], function ( i_3 )
                    return hoisted_15_2[1 + hoisted_14_2[(1 + i_3)]];
                end );
            hoisted_8_2 := deduped_19_2;
            hoisted_7_2 := deduped_21_2;
            hoisted_4_2 := deduped_22_2;
            hoisted_6_2 := List( [ 0 .. deduped_22_2 * deduped_23_2 - 1 ], function ( i_3 )
                    return REM_INT( QUO_INT( i_3, 2 ^ QUO_INT( i_3, hoisted_4_2 ) ), 2 );
                end );
            hoisted_2_2 := deduped_23_2;
            hoisted_5_2 := List( deduped_21_2, function ( logic_new_func_x_3 )
                    return REM_INT( logic_new_func_x_3, hoisted_2_2 );
                end );
            hoisted_3_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_23_2 * GeometricSumDiff1( deduped_23_2, deduped_23_2 ) );
            return Filtered( [ 0 .. deduped_22_2 - 1 ], function ( x_3 )
                    local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, hoisted_5_3, hoisted_6_3, deduped_7_3, deduped_8_3, deduped_9_3;
                    hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( x_3 );
                    deduped_9_3 := Filtered( hoisted_7_2, function ( x_4 )
                            return hoisted_6_2[1 + (hoisted_1_3 + hoisted_5_2[(1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( CAP_JIT_INCOMPLETE_LOGIC( x_4 ), hoisted_2_2 ) ))] * hoisted_4_2)] = 1;
                        end );
                    deduped_8_3 := Length( deduped_9_3 );
                    hoisted_2_3 := deduped_9_3;
                    hoisted_4_3 := List( [ 0 .. deduped_8_3 - 1 ], function ( i_4 )
                            return hoisted_5_2[1 + hoisted_2_3[(1 + i_4)]];
                        end );
                    hoisted_3_3 := deduped_8_3;
                    deduped_7_3 := Filtered( [ 0 .. hoisted_8_2 * deduped_8_3 - 1 ], function ( x_4 )
                            local deduped_1_4;
                            deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( x_4 );
                            return hoisted_16_2[1 + REM_INT( deduped_1_4, hoisted_8_2 )] = hoisted_4_3[1 + REM_INT( QUO_INT( deduped_1_4, hoisted_8_2 ), hoisted_3_3 )];
                        end );
                    hoisted_5_3 := deduped_7_3;
                    hoisted_6_3 := List( [ 0 .. Length( deduped_7_3 ) - 1 ], function ( logic_new_func_x_4 )
                            return hoisted_18_2[1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_5_3[(1 + logic_new_func_x_4)] ), hoisted_8_2 )];
                        end );
                    return Sum( List( hoisted_7_2, function ( k_4 )
                                return IdFunc( function (  )
                                            if (CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( hoisted_3_2, hoisted_2_2 ^ CAP_JIT_INCOMPLETE_LOGIC( k_4 ) ), hoisted_2_2 ) ) in hoisted_6_3) then
                                                return 1;
                                            else
                                                return 0;
                                            fi;
                                            return;
                                        end )(  ) * 2 ^ k_4;
                            end ) ) = x_3;
                end );
        end );
    hoisted_14_1 := List( deduped_27_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, hoisted_16_2, hoisted_17_2, hoisted_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2, deduped_23_2, deduped_24_2, deduped_25_2;
            deduped_25_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 );
            hoisted_1_2 := hoisted_3_1[deduped_25_2];
            deduped_24_2 := List( hoisted_4_1, function ( logic_new_func_x_3 )
                    return hoisted_1_2[logic_new_func_x_3];
                end );
            deduped_23_2 := Sum( deduped_24_2 );
            deduped_22_2 := 2 ^ deduped_23_2;
            deduped_21_2 := [ 0 .. deduped_23_2 - 1 ];
            deduped_20_2 := List( hoisted_4_1, function ( logic_new_func_x_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_3 );
                    return List( hoisted_4_1, function ( logic_new_func_x_4 )
                            local deduped_1_4;
                            deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_4 );
                            return hoisted_3_1[deduped_1_4][hoisted_1_3] * hoisted_1_2[deduped_1_4];
                        end );
                end );
            deduped_19_2 := Sum( Concatenation( deduped_20_2 ) );
            hoisted_17_2 := 1 + hoisted_6_1[deduped_25_2][1];
            hoisted_10_2 := deduped_24_2;
            hoisted_18_2 := Concatenation( List( hoisted_4_1, function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, deduped_5_3, deduped_6_3;
                      deduped_6_3 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_3 );
                      deduped_5_3 := Sum( hoisted_10_2{[ 1 .. logic_new_func_x_3 - 1 ]} );
                      hoisted_4_3 := [ deduped_5_3 .. deduped_5_3 + hoisted_1_2[deduped_6_3] - 1 ];
                      hoisted_2_3 := hoisted_7_1[1 + hoisted_6_1[deduped_6_3][1]];
                      hoisted_1_3 := deduped_6_3;
                      hoisted_3_3 := Concatenation( List( hoisted_4_1, function ( logic_new_func_x_4 )
                                local hoisted_1_4, hoisted_2_4, hoisted_3_4, hoisted_4_4, deduped_5_4, deduped_6_4, deduped_7_4, deduped_8_4, deduped_9_4;
                                deduped_9_4 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_4 );
                                deduped_8_4 := hoisted_1_2[deduped_9_4];
                                deduped_7_4 := 1 + hoisted_6_1[logic_new_func_x_4][1];
                                deduped_6_4 := hoisted_3_1[deduped_9_4][hoisted_1_3];
                                deduped_5_4 := [ deduped_6_4, deduped_8_4 ];
                                hoisted_4_4 := hoisted_7_1[deduped_7_4][hoisted_17_2];
                                hoisted_3_4 := deduped_5_4[2];
                                hoisted_2_4 := hoisted_2_3[deduped_7_4];
                                hoisted_1_4 := deduped_5_4[1];
                                return List( [ 0 .. deduped_6_4 * deduped_8_4 - 1 ], function ( i_5 )
                                        local deduped_1_5;
                                        deduped_1_5 := CAP_JIT_INCOMPLETE_LOGIC( i_5 );
                                        return hoisted_10_1[1 + hoisted_8_1[(1 + hoisted_9_1[(1 + hoisted_8_1[(1 + hoisted_2_4[(1 + REM_INT( deduped_1_5, hoisted_1_4 ))])][1])][(1 + hoisted_8_1[(1 + hoisted_4_4[(1 + REM_INT( QUO_INT( deduped_1_5, hoisted_1_4 ), hoisted_3_4 ))])][1])])][1]][1];
                                    end );
                            end ) );
                      return List( [ 0 .. Sum( List( hoisted_4_1, function ( logic_new_func_x_4 )
                                        local deduped_1_4;
                                        deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_4 );
                                        return hoisted_3_1[deduped_1_4][hoisted_1_3] * hoisted_1_2[deduped_1_4];
                                    end ) ) - 1 ], function ( i_4 )
                              return hoisted_4_3[1 + hoisted_3_3[(1 + i_4)]];
                          end );
                  end ) );
            hoisted_12_2 := List( hoisted_4_1, function ( logic_new_func_x_3 )
                    return List( hoisted_4_1, function ( logic_new_func_x_4 )
                            return [ hoisted_3_1[logic_new_func_x_4][logic_new_func_x_3], hoisted_1_2[logic_new_func_x_4] ];
                        end );
                end );
            hoisted_11_2 := List( hoisted_4_1, function ( logic_new_func_x_3 )
                    return List( hoisted_4_1, function ( logic_new_func_x_4 )
                            return hoisted_3_1[logic_new_func_x_4][logic_new_func_x_3] * hoisted_1_2[logic_new_func_x_4];
                        end );
                end );
            hoisted_9_2 := deduped_20_2;
            hoisted_15_2 := Concatenation( List( hoisted_4_1, function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3, deduped_4_3, deduped_5_3;
                      deduped_5_3 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_3 );
                      deduped_4_3 := Sum( hoisted_10_2{[ 1 .. logic_new_func_x_3 - 1 ]} );
                      hoisted_3_3 := [ deduped_4_3 .. deduped_4_3 + hoisted_1_2[deduped_5_3] - 1 ];
                      hoisted_1_3 := deduped_5_3;
                      hoisted_2_3 := Concatenation( List( hoisted_4_1, function ( logic_new_func_x_4 )
                                local hoisted_1_4, hoisted_2_4, deduped_3_4;
                                deduped_3_4 := hoisted_12_2[logic_new_func_x_4][hoisted_1_3];
                                hoisted_2_4 := deduped_3_4[2];
                                hoisted_1_4 := deduped_3_4[1];
                                return List( [ 0 .. hoisted_11_2[logic_new_func_x_4][hoisted_1_3] - 1 ], function ( i_5 )
                                        return REM_INT( QUO_INT( i_5, hoisted_1_4 ), hoisted_2_4 );
                                    end );
                            end ) );
                      return List( [ 0 .. Sum( List( hoisted_4_1, function ( logic_new_func_x_4 )
                                        return hoisted_9_2[logic_new_func_x_4][hoisted_1_3];
                                    end ) ) - 1 ], function ( i_4 )
                              return hoisted_3_3[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                  end ) );
            hoisted_13_2 := Concatenation( List( hoisted_4_1, function ( logic_new_func_x_3 )
                      return List( hoisted_4_1, function ( logic_new_func_x_4 )
                              return hoisted_9_2[logic_new_func_x_4][logic_new_func_x_3];
                          end );
                  end ) );
            hoisted_14_2 := Concatenation( Concatenation( List( hoisted_4_1, function ( logic_new_func_x_3 )
                        return List( hoisted_4_1, function ( logic_new_func_x_4 )
                                local deduped_1_4, deduped_2_4;
                                deduped_2_4 := hoisted_5_1 * (logic_new_func_x_4 - 1) + logic_new_func_x_3;
                                deduped_1_4 := Sum( hoisted_13_2{[ 1 .. deduped_2_4 - 1 ]} );
                                return [ deduped_1_4 .. deduped_1_4 + hoisted_13_2[deduped_2_4] - 1 ];
                            end );
                    end ) ) );
            hoisted_16_2 := List( [ 0 .. deduped_19_2 - 1 ], function ( i_3 )
                    return hoisted_15_2[1 + hoisted_14_2[(1 + i_3)]];
                end );
            hoisted_8_2 := deduped_19_2;
            hoisted_7_2 := deduped_21_2;
            hoisted_4_2 := deduped_22_2;
            hoisted_6_2 := List( [ 0 .. deduped_22_2 * deduped_23_2 - 1 ], function ( i_3 )
                    return REM_INT( QUO_INT( i_3, 2 ^ QUO_INT( i_3, hoisted_4_2 ) ), 2 );
                end );
            hoisted_2_2 := deduped_23_2;
            hoisted_5_2 := List( deduped_21_2, function ( logic_new_func_x_3 )
                    return REM_INT( logic_new_func_x_3, hoisted_2_2 );
                end );
            hoisted_3_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_23_2 * GeometricSumDiff1( deduped_23_2, deduped_23_2 ) );
            return Length( Filtered( [ 0 .. deduped_22_2 - 1 ], function ( x_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, hoisted_5_3, hoisted_6_3, deduped_7_3, deduped_8_3, deduped_9_3;
                      hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( x_3 );
                      deduped_9_3 := Filtered( hoisted_7_2, function ( x_4 )
                              return hoisted_6_2[1 + (hoisted_1_3 + hoisted_5_2[(1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( CAP_JIT_INCOMPLETE_LOGIC( x_4 ), hoisted_2_2 ) ))] * hoisted_4_2)] = 1;
                          end );
                      deduped_8_3 := Length( deduped_9_3 );
                      hoisted_2_3 := deduped_9_3;
                      hoisted_4_3 := List( [ 0 .. deduped_8_3 - 1 ], function ( i_4 )
                              return hoisted_5_2[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                      hoisted_3_3 := deduped_8_3;
                      deduped_7_3 := Filtered( [ 0 .. hoisted_8_2 * deduped_8_3 - 1 ], function ( x_4 )
                              local deduped_1_4;
                              deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( x_4 );
                              return hoisted_16_2[1 + REM_INT( deduped_1_4, hoisted_8_2 )] = hoisted_4_3[1 + REM_INT( QUO_INT( deduped_1_4, hoisted_8_2 ), hoisted_3_3 )];
                          end );
                      hoisted_5_3 := deduped_7_3;
                      hoisted_6_3 := List( [ 0 .. Length( deduped_7_3 ) - 1 ], function ( logic_new_func_x_4 )
                              return hoisted_18_2[1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_5_3[(1 + logic_new_func_x_4)] ), hoisted_8_2 )];
                          end );
                      return Sum( List( hoisted_7_2, function ( k_4 )
                                  return IdFunc( function (  )
                                              if (CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( hoisted_3_2, hoisted_2_2 ^ CAP_JIT_INCOMPLETE_LOGIC( k_4 ) ), hoisted_2_2 ) ) in hoisted_6_3) then
                                                  return 1;
                                              else
                                                  return 0;
                                              fi;
                                              return;
                                          end )(  ) * 2 ^ k_4;
                              end ) ) = x_3;
                  end ) );
        end );
    hoisted_13_1 := deduped_26_1;
    hoisted_12_1 := DefiningPairOfUnderlyingQuiver( deduped_35_1 )[2];
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, deduped_35_1, Range, deduped_36_1, ValuesOfPreSheaf, NTuple( 2, deduped_26_1, List( [ 1 .. Length( deduped_34_1 ) ], function ( m_2 )
                local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2, deduped_11_2;
                deduped_11_2 := CAP_JIT_INCOMPLETE_LOGIC( m_2 );
                deduped_10_2 := hoisted_12_1[m_2];
                deduped_9_2 := hoisted_21_1[deduped_11_2];
                deduped_8_2 := 1 + deduped_10_2[1];
                deduped_7_2 := 1 + deduped_10_2[2];
                hoisted_6_2 := hoisted_15_1[deduped_8_2];
                hoisted_3_2 := [ 0 .. hoisted_22_1[deduped_11_2] - 1 ];
                hoisted_2_2 := hoisted_24_1[deduped_11_2];
                hoisted_1_2 := [ 0 .. deduped_9_2 - 1 ];
                hoisted_5_2 := List( [ 0 .. 2 ^ deduped_9_2 - 1 ], function ( i_3 )
                        local hoisted_1_3;
                        hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                                return REM_INT( QUO_INT( i_3, 2 ^ j_4 ), 2 );
                            end );
                        return Sum( List( hoisted_3_2, function ( k_4 )
                                  return hoisted_25_1[(1 + hoisted_1_3[(1 + hoisted_2_2[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_4 ))])])] * 2 ^ k_4;
                              end ) );
                    end );
                hoisted_4_2 := hoisted_15_1[deduped_7_2];
                return CreateCapCategoryMorphismWithAttributes( hoisted_11_1, hoisted_13_1[deduped_7_2], hoisted_13_1[deduped_8_2], AsList, List( [ 0 .. hoisted_14_1[deduped_7_2] - 1 ], function ( x_3 )
                          return -1 + SafePosition( hoisted_6_2, hoisted_5_2[(1 + hoisted_4_2[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_3 ))])] );
                      end ) );
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

BindGlobal( "PreSheavesOfCategoryFromDataTablesInSkeletalFinSetsSubobjectClassifierPrecompiled", function ( quiver )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function ( quiver )
    local sFinSets;
    sFinSets := CategoryOfSkeletalFinSets(  : FinalizeCategory := true );
    return PreSheaves( CategoryFromDataTables( FreeCategory( quiver : range_of_HomStructure := sFinSets,
            FinalizeCategory := true ) : FinalizeCategory := true ), sFinSets );
end;
        
        
    
    cat := category_constructor( quiver : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_PreSheavesOfCategoryFromDataTablesInSkeletalFinSetsSubobjectClassifierPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
