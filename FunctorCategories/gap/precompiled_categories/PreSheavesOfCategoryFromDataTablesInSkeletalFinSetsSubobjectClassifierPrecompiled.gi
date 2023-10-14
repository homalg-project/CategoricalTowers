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
    local deduped_1_1, deduped_3_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, hoisted_16_1, hoisted_17_1, deduped_18_1, hoisted_20_1, hoisted_22_1, deduped_23_1, hoisted_24_1, deduped_25_1, deduped_26_1, hoisted_27_1, deduped_28_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1;
    deduped_46_1 := Target( cat_1 );
    deduped_45_1 := Source( cat_1 );
    deduped_44_1 := IndicesOfGeneratingMorphisms( deduped_45_1 );
    deduped_43_1 := DataTables( deduped_45_1 );
    deduped_42_1 := DefiningTripleOfUnderlyingQuiver( deduped_45_1 );
    deduped_41_1 := deduped_43_1[1];
    deduped_40_1 := deduped_43_1[2];
    deduped_39_1 := [ 1 .. deduped_42_1[1] ];
    deduped_38_1 := [ 0 .. deduped_41_1[2] - 1 ];
    deduped_37_1 := [ 0 .. deduped_41_1[1] - 1 ];
    deduped_36_1 := Length( deduped_37_1 );
    deduped_35_1 := [ 1 .. deduped_36_1 ];
    hoisted_17_1 := deduped_40_1[7];
    hoisted_16_1 := deduped_40_1[4];
    deduped_15_1 := List( deduped_38_1, function ( logic_new_func_x_2 )
            return [ logic_new_func_x_2 ];
        end );
    deduped_14_1 := deduped_40_1[8];
    deduped_13_1 := List( deduped_37_1, function ( logic_new_func_x_2 )
            return [ logic_new_func_x_2 ];
        end );
    deduped_1_1 := deduped_40_1[5];
    deduped_3_1 := List( deduped_37_1, function ( logic_new_func_x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + logic_new_func_x_2;
            return List( deduped_37_1, function ( logic_new_func_x_3 )
                    return deduped_1_1[1 + logic_new_func_x_3][hoisted_1_2];
                end );
        end );
    deduped_10_1 := List( deduped_35_1, function ( logic_new_func_x_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_3_1[logic_new_func_x_2];
            return List( deduped_35_1, function ( logic_new_func_x_3 )
                    return List( deduped_35_1, function ( logic_new_func_x_4 )
                            return [ deduped_3_1[logic_new_func_x_4][logic_new_func_x_3], hoisted_1_2[logic_new_func_x_4] ];
                        end );
                end );
        end );
    deduped_6_1 := List( deduped_35_1, function ( logic_new_func_x_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_3_1[logic_new_func_x_2];
            return List( deduped_35_1, function ( logic_new_func_x_3 )
                    return List( deduped_35_1, function ( logic_new_func_x_4 )
                            return deduped_3_1[logic_new_func_x_4][logic_new_func_x_3] * hoisted_1_2[logic_new_func_x_4];
                        end );
                end );
        end );
    deduped_9_1 := List( deduped_35_1, function ( logic_new_func_x_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_6_1[logic_new_func_x_2];
            return List( deduped_35_1, function ( logic_new_func_x_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := hoisted_1_2[logic_new_func_x_3];
                    return List( deduped_35_1, function ( logic_new_func_x_4 )
                            return hoisted_1_3[logic_new_func_x_4];
                        end );
                end );
        end );
    deduped_18_1 := List( deduped_35_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2;
            hoisted_7_2 := 1 + deduped_13_1[logic_new_func_x_2][1];
            hoisted_6_2 := deduped_10_1[logic_new_func_x_2];
            hoisted_5_2 := deduped_6_1[logic_new_func_x_2];
            hoisted_4_2 := deduped_6_1[CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 )];
            hoisted_2_2 := deduped_3_1[logic_new_func_x_2];
            deduped_3_2 := List( deduped_35_1, function ( logic_new_func_x_3 )
                    return hoisted_2_2[logic_new_func_x_3];
                end );
            hoisted_1_2 := deduped_9_1[logic_new_func_x_2];
            return Concatenation( List( deduped_35_1, function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, hoisted_5_3, hoisted_6_3, hoisted_7_3, deduped_8_3, deduped_9_3;
                      deduped_9_3 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_3 );
                      deduped_8_3 := Sum( deduped_3_2{[ 1 .. logic_new_func_x_3 - 1 ]} );
                      hoisted_7_3 := [ deduped_8_3 .. deduped_8_3 + deduped_3_2[logic_new_func_x_3] - 1 ];
                      hoisted_5_3 := hoisted_6_2[deduped_9_3];
                      hoisted_4_3 := hoisted_5_2[deduped_9_3];
                      hoisted_3_3 := deduped_14_1[1 + deduped_13_1[deduped_9_3][1]];
                      hoisted_2_3 := hoisted_4_2[deduped_9_3];
                      hoisted_6_3 := Concatenation( List( deduped_35_1, function ( logic_new_func_x_4 )
                                local deduped_1_4, hoisted_2_4, hoisted_3_4, hoisted_4_4, hoisted_5_4, hoisted_6_4, deduped_7_4, deduped_8_4, deduped_9_4;
                                deduped_9_4 := hoisted_5_3[logic_new_func_x_4];
                                deduped_8_4 := [ 0 .. hoisted_4_3[logic_new_func_x_4] - 1 ];
                                deduped_7_4 := 1 + deduped_13_1[logic_new_func_x_4][1];
                                hoisted_6_4 := deduped_14_1[deduped_7_4][hoisted_7_2];
                                hoisted_4_4 := deduped_9_4[2];
                                deduped_1_4 := deduped_9_4[1];
                                hoisted_5_4 := List( deduped_8_4, function ( i_5 )
                                        return REM_INT( QUO_INT( i_5, deduped_1_4 ), hoisted_4_4 );
                                    end );
                                hoisted_3_4 := hoisted_3_3[deduped_7_4];
                                hoisted_2_4 := List( deduped_8_4, function ( i_5 )
                                        return REM_INT( i_5, deduped_1_4 );
                                    end );
                                return List( [ 0 .. hoisted_2_3[CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_4 )] - 1 ], function ( i_5 )
                                        local deduped_1_5;
                                        deduped_1_5 := 1 + i_5;
                                        return hoisted_17_1[1 + deduped_15_1[(1 + hoisted_16_1[(1 + deduped_15_1[(1 + hoisted_3_4[(1 + hoisted_2_4[deduped_1_5])])][1])][(1 + deduped_15_1[(1 + hoisted_6_4[(1 + hoisted_5_4[deduped_1_5])])][1])])][1]][1];
                                    end );
                            end ) );
                      hoisted_1_3 := hoisted_1_2[deduped_9_3];
                      return List( [ 0 .. Sum( List( deduped_35_1, function ( logic_new_func_x_4 )
                                        return hoisted_1_3[logic_new_func_x_4];
                                    end ) ) - 1 ], function ( i_4 )
                              return hoisted_7_3[1 + hoisted_6_3[(1 + i_4)]];
                          end );
                  end ) );
        end );
    deduped_7_1 := List( deduped_35_1, function ( logic_new_func_x_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_6_1[CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 )];
            return Sum( Concatenation( List( deduped_35_1, function ( logic_new_func_x_3 )
                        local hoisted_1_3;
                        hoisted_1_3 := hoisted_1_2[logic_new_func_x_3];
                        return List( deduped_35_1, function ( logic_new_func_x_4 )
                                return hoisted_1_3[logic_new_func_x_4];
                            end );
                    end ) ) );
        end );
    deduped_12_1 := List( deduped_35_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2, hoisted_8_2, hoisted_9_2;
            hoisted_5_2 := deduped_10_1[logic_new_func_x_2];
            hoisted_4_2 := deduped_6_1[logic_new_func_x_2];
            hoisted_2_2 := deduped_3_1[logic_new_func_x_2];
            deduped_3_2 := List( deduped_35_1, function ( logic_new_func_x_3 )
                    return hoisted_2_2[logic_new_func_x_3];
                end );
            hoisted_1_2 := deduped_9_1[logic_new_func_x_2];
            hoisted_9_2 := Concatenation( List( deduped_35_1, function ( logic_new_func_x_3 )
                      local deduped_1_3, hoisted_2_3, hoisted_3_3, deduped_4_3;
                      deduped_4_3 := Sum( deduped_3_2{[ 1 .. logic_new_func_x_3 - 1 ]} );
                      hoisted_3_3 := [ deduped_4_3 .. deduped_4_3 + deduped_3_2[logic_new_func_x_3] - 1 ];
                      deduped_1_3 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_3 );
                      hoisted_2_3 := Concatenation( List( deduped_35_1, function ( logic_new_func_x_4 )
                                local hoisted_1_4, hoisted_2_4, deduped_3_4;
                                deduped_3_4 := hoisted_5_2[logic_new_func_x_4][deduped_1_3];
                                hoisted_2_4 := deduped_3_4[2];
                                hoisted_1_4 := deduped_3_4[1];
                                return List( [ 0 .. hoisted_4_2[logic_new_func_x_4][deduped_1_3] - 1 ], function ( i_5 )
                                        return REM_INT( QUO_INT( i_5, hoisted_1_4 ), hoisted_2_4 );
                                    end );
                            end ) );
                      return List( [ 0 .. Sum( List( deduped_35_1, function ( logic_new_func_x_4 )
                                        return hoisted_1_2[logic_new_func_x_4][deduped_1_3];
                                    end ) ) - 1 ], function ( i_4 )
                              return hoisted_3_3[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                  end ) );
            hoisted_6_2 := deduped_9_1[CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 )];
            deduped_7_2 := Concatenation( List( deduped_35_1, function ( logic_new_func_x_3 )
                      return List( deduped_35_1, function ( logic_new_func_x_4 )
                              return hoisted_6_2[logic_new_func_x_4][logic_new_func_x_3];
                          end );
                  end ) );
            hoisted_8_2 := Concatenation( Concatenation( List( deduped_35_1, function ( logic_new_func_x_3 )
                        return List( deduped_35_1, function ( logic_new_func_x_4 )
                                local deduped_1_4, deduped_2_4;
                                deduped_2_4 := deduped_36_1 * (logic_new_func_x_4 - 1) + logic_new_func_x_3;
                                deduped_1_4 := Sum( deduped_7_2{[ 1 .. deduped_2_4 - 1 ]} );
                                return [ deduped_1_4 .. deduped_1_4 + deduped_7_2[deduped_2_4] - 1 ];
                            end );
                    end ) ) );
            return List( [ 0 .. deduped_7_1[logic_new_func_x_2] - 1 ], function ( i_3 )
                    return hoisted_9_2[1 + hoisted_8_2[(1 + i_3)]];
                end );
        end );
    deduped_8_1 := List( deduped_35_1, function ( logic_new_func_x_2 )
            return deduped_7_1[logic_new_func_x_2];
        end );
    deduped_5_1 := List( deduped_35_1, function ( logic_new_func_x_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_3_1[logic_new_func_x_2];
            return Sum( List( deduped_35_1, function ( logic_new_func_x_3 )
                      return hoisted_1_2[logic_new_func_x_3];
                  end ) );
        end );
    deduped_34_1 := List( deduped_39_1, function ( logic_new_func_x_2 )
            local hoisted_2_2, deduped_4_2, hoisted_5_2, deduped_7_2, hoisted_8_2, hoisted_9_2, deduped_10_2, deduped_11_2, deduped_12_2;
            deduped_12_2 := deduped_5_1[logic_new_func_x_2];
            deduped_11_2 := 2 ^ deduped_12_2;
            deduped_10_2 := [ 0 .. deduped_12_2 - 1 ];
            hoisted_9_2 := deduped_18_1[logic_new_func_x_2];
            hoisted_8_2 := deduped_12_1[logic_new_func_x_2];
            deduped_7_2 := deduped_8_1[logic_new_func_x_2];
            hoisted_5_2 := List( [ 0 .. deduped_11_2 * deduped_12_2 - 1 ], function ( i_3 )
                    return REM_INT( QUO_INT( i_3, 2 ^ QUO_INT( i_3, deduped_11_2 ) ), 2 );
                end );
            deduped_4_2 := List( deduped_10_2, function ( logic_new_func_x_3 )
                    return REM_INT( logic_new_func_x_3, deduped_12_2 );
                end );
            hoisted_2_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_12_2 * GeometricSumDiff1( deduped_12_2, deduped_12_2 ) );
            return CreateCapCategoryObjectWithAttributes( deduped_46_1, Length, Length( Filtered( [ 0 .. deduped_11_2 - 1 ], function ( x_3 )
                        local hoisted_1_3, hoisted_4_3, hoisted_6_3, deduped_7_3, deduped_8_3, deduped_9_3;
                        hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( x_3 );
                        deduped_9_3 := Filtered( deduped_10_2, function ( x_4 )
                                return hoisted_5_2[1 + (hoisted_1_3 + deduped_4_2[(1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( CAP_JIT_INCOMPLETE_LOGIC( x_4 ), deduped_12_2 ) ))] * deduped_11_2)] = 1;
                            end );
                        deduped_8_3 := Length( deduped_9_3 );
                        hoisted_4_3 := List( [ 0 .. deduped_8_3 - 1 ], function ( i_4 )
                                return deduped_4_2[1 + deduped_9_3[(1 + i_4)]];
                            end );
                        deduped_7_3 := Filtered( [ 0 .. deduped_7_2 * deduped_8_3 - 1 ], function ( x_4 )
                                local deduped_1_4;
                                deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( x_4 );
                                return hoisted_8_2[1 + REM_INT( deduped_1_4, deduped_7_2 )] = hoisted_4_3[1 + REM_INT( QUO_INT( deduped_1_4, deduped_7_2 ), deduped_8_3 )];
                            end );
                        hoisted_6_3 := List( [ 0 .. Length( deduped_7_3 ) - 1 ], function ( logic_new_func_x_4 )
                                return hoisted_9_2[1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_7_3[(1 + logic_new_func_x_4)] ), deduped_7_2 )];
                            end );
                        return Sum( List( deduped_10_2, function ( k_4 )
                                    return IdFunc( function (  )
                                                if (CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( hoisted_2_2, deduped_12_2 ^ CAP_JIT_INCOMPLETE_LOGIC( k_4 ) ), deduped_12_2 ) ) in hoisted_6_3) then
                                                    return 1;
                                                else
                                                    return 0;
                                                fi;
                                                return;
                                            end )(  ) * 2 ^ k_4;
                                end ) ) = x_3;
                    end ) ) );
        end );
    hoisted_33_1 := [ 0, 1 ];
    hoisted_31_1 := deduped_40_1[6];
    hoisted_27_1 := deduped_40_1[3];
    deduped_28_1 := List( deduped_38_1, function ( logic_new_func_x_2 )
            return [ hoisted_27_1[1 + logic_new_func_x_2] ];
        end );
    hoisted_24_1 := deduped_40_1[2];
    deduped_26_1 := List( deduped_38_1, function ( logic_new_func_x_2 )
            return [ hoisted_24_1[1 + logic_new_func_x_2] ];
        end );
    deduped_25_1 := deduped_40_1[1];
    hoisted_32_1 := List( deduped_44_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2, hoisted_4_2, deduped_5_2;
            deduped_5_2 := 1 + logic_new_func_x_2;
            hoisted_4_2 := 1 + deduped_15_1[deduped_5_2][1];
            hoisted_2_2 := 1 + deduped_28_1[deduped_5_2][1];
            deduped_3_2 := List( deduped_37_1, function ( logic_new_func_x_3 )
                    return deduped_1_1[1 + deduped_26_1[(1 + deduped_25_1[(1 + logic_new_func_x_3)])][1]][hoisted_2_2];
                end );
            hoisted_1_2 := 1 + deduped_26_1[deduped_5_2][1];
            return Concatenation( List( deduped_35_1, function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3, deduped_4_3;
                      deduped_4_3 := Sum( deduped_3_2{[ 1 .. logic_new_func_x_3 - 1 ]} );
                      deduped_3_3 := 1 + deduped_25_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_37_1[logic_new_func_x_3] ))];
                      hoisted_2_3 := [ deduped_4_3 .. deduped_4_3 + deduped_3_2[logic_new_func_x_3] - 1 ];
                      hoisted_1_3 := hoisted_31_1[1 + deduped_15_1[deduped_3_3][1]][hoisted_4_2];
                      return List( [ 0 .. deduped_1_1[1 + deduped_28_1[deduped_3_3][1]][hoisted_1_2] - 1 ], function ( i_4 )
                              return hoisted_2_3[1 + hoisted_1_3[(1 + i_4)]];
                          end );
                  end ) );
        end );
    hoisted_30_1 := List( deduped_44_1, function ( logic_new_func_x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + deduped_26_1[(1 + logic_new_func_x_2)][1];
            return Sum( List( deduped_37_1, function ( logic_new_func_x_3 )
                      return deduped_1_1[1 + deduped_28_1[(1 + deduped_25_1[(1 + logic_new_func_x_3)])][1]][hoisted_1_2];
                  end ) );
        end );
    hoisted_29_1 := List( deduped_44_1, function ( logic_new_func_x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + deduped_28_1[(1 + logic_new_func_x_2)][1];
            return Sum( List( deduped_37_1, function ( logic_new_func_x_3 )
                      return deduped_1_1[1 + deduped_26_1[(1 + deduped_25_1[(1 + logic_new_func_x_3)])][1]][hoisted_1_2];
                  end ) );
        end );
    deduped_23_1 := List( deduped_39_1, function ( logic_new_func_x_2 )
            local hoisted_2_2, deduped_4_2, hoisted_5_2, deduped_7_2, hoisted_8_2, hoisted_9_2, deduped_10_2, deduped_11_2, deduped_12_2;
            deduped_12_2 := deduped_5_1[logic_new_func_x_2];
            deduped_11_2 := 2 ^ deduped_12_2;
            deduped_10_2 := [ 0 .. deduped_12_2 - 1 ];
            hoisted_9_2 := deduped_18_1[logic_new_func_x_2];
            hoisted_8_2 := deduped_12_1[logic_new_func_x_2];
            deduped_7_2 := deduped_8_1[logic_new_func_x_2];
            hoisted_5_2 := List( [ 0 .. deduped_11_2 * deduped_12_2 - 1 ], function ( i_3 )
                    return REM_INT( QUO_INT( i_3, 2 ^ QUO_INT( i_3, deduped_11_2 ) ), 2 );
                end );
            deduped_4_2 := List( deduped_10_2, function ( logic_new_func_x_3 )
                    return REM_INT( logic_new_func_x_3, deduped_12_2 );
                end );
            hoisted_2_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_12_2 * GeometricSumDiff1( deduped_12_2, deduped_12_2 ) );
            return Filtered( [ 0 .. deduped_11_2 - 1 ], function ( x_3 )
                    local hoisted_1_3, hoisted_4_3, hoisted_6_3, deduped_7_3, deduped_8_3, deduped_9_3;
                    hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( x_3 );
                    deduped_9_3 := Filtered( deduped_10_2, function ( x_4 )
                            return hoisted_5_2[1 + (hoisted_1_3 + deduped_4_2[(1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( CAP_JIT_INCOMPLETE_LOGIC( x_4 ), deduped_12_2 ) ))] * deduped_11_2)] = 1;
                        end );
                    deduped_8_3 := Length( deduped_9_3 );
                    hoisted_4_3 := List( [ 0 .. deduped_8_3 - 1 ], function ( i_4 )
                            return deduped_4_2[1 + deduped_9_3[(1 + i_4)]];
                        end );
                    deduped_7_3 := Filtered( [ 0 .. deduped_7_2 * deduped_8_3 - 1 ], function ( x_4 )
                            local deduped_1_4;
                            deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( x_4 );
                            return hoisted_8_2[1 + REM_INT( deduped_1_4, deduped_7_2 )] = hoisted_4_3[1 + REM_INT( QUO_INT( deduped_1_4, deduped_7_2 ), deduped_8_3 )];
                        end );
                    hoisted_6_3 := List( [ 0 .. Length( deduped_7_3 ) - 1 ], function ( logic_new_func_x_4 )
                            return hoisted_9_2[1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_7_3[(1 + logic_new_func_x_4)] ), deduped_7_2 )];
                        end );
                    return Sum( List( deduped_10_2, function ( k_4 )
                                return IdFunc( function (  )
                                            if (CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( hoisted_2_2, deduped_12_2 ^ CAP_JIT_INCOMPLETE_LOGIC( k_4 ) ), deduped_12_2 ) ) in hoisted_6_3) then
                                                return 1;
                                            else
                                                return 0;
                                            fi;
                                            return;
                                        end )(  ) * 2 ^ k_4;
                            end ) ) = x_3;
                end );
        end );
    hoisted_22_1 := List( deduped_39_1, function ( logic_new_func_x_2 )
            local hoisted_2_2, deduped_4_2, hoisted_5_2, deduped_7_2, hoisted_8_2, hoisted_9_2, deduped_10_2, deduped_11_2, deduped_12_2;
            deduped_12_2 := deduped_5_1[logic_new_func_x_2];
            deduped_11_2 := 2 ^ deduped_12_2;
            deduped_10_2 := [ 0 .. deduped_12_2 - 1 ];
            hoisted_9_2 := deduped_18_1[logic_new_func_x_2];
            hoisted_8_2 := deduped_12_1[logic_new_func_x_2];
            deduped_7_2 := deduped_8_1[logic_new_func_x_2];
            hoisted_5_2 := List( [ 0 .. deduped_11_2 * deduped_12_2 - 1 ], function ( i_3 )
                    return REM_INT( QUO_INT( i_3, 2 ^ QUO_INT( i_3, deduped_11_2 ) ), 2 );
                end );
            deduped_4_2 := List( deduped_10_2, function ( logic_new_func_x_3 )
                    return REM_INT( logic_new_func_x_3, deduped_12_2 );
                end );
            hoisted_2_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_12_2 * GeometricSumDiff1( deduped_12_2, deduped_12_2 ) );
            return Length( Filtered( [ 0 .. deduped_11_2 - 1 ], function ( x_3 )
                      local hoisted_1_3, hoisted_4_3, hoisted_6_3, deduped_7_3, deduped_8_3, deduped_9_3;
                      hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( x_3 );
                      deduped_9_3 := Filtered( deduped_10_2, function ( x_4 )
                              return hoisted_5_2[1 + (hoisted_1_3 + deduped_4_2[(1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( CAP_JIT_INCOMPLETE_LOGIC( x_4 ), deduped_12_2 ) ))] * deduped_11_2)] = 1;
                          end );
                      deduped_8_3 := Length( deduped_9_3 );
                      hoisted_4_3 := List( [ 0 .. deduped_8_3 - 1 ], function ( i_4 )
                              return deduped_4_2[1 + deduped_9_3[(1 + i_4)]];
                          end );
                      deduped_7_3 := Filtered( [ 0 .. deduped_7_2 * deduped_8_3 - 1 ], function ( x_4 )
                              local deduped_1_4;
                              deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( x_4 );
                              return hoisted_8_2[1 + REM_INT( deduped_1_4, deduped_7_2 )] = hoisted_4_3[1 + REM_INT( QUO_INT( deduped_1_4, deduped_7_2 ), deduped_8_3 )];
                          end );
                      hoisted_6_3 := List( [ 0 .. Length( deduped_7_3 ) - 1 ], function ( logic_new_func_x_4 )
                              return hoisted_9_2[1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_7_3[(1 + logic_new_func_x_4)] ), deduped_7_2 )];
                          end );
                      return Sum( List( deduped_10_2, function ( k_4 )
                                  return IdFunc( function (  )
                                              if (CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( hoisted_2_2, deduped_12_2 ^ CAP_JIT_INCOMPLETE_LOGIC( k_4 ) ), deduped_12_2 ) ) in hoisted_6_3) then
                                                  return 1;
                                              else
                                                  return 0;
                                              fi;
                                              return;
                                          end )(  ) * 2 ^ k_4;
                              end ) ) = x_3;
                  end ) );
        end );
    hoisted_20_1 := deduped_42_1[3];
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, deduped_45_1, Range, deduped_46_1, ValuesOfPreSheaf, NTuple( 2, deduped_34_1, List( [ 1 .. deduped_42_1[2] ], function ( m_2 )
                local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2, deduped_11_2;
                deduped_11_2 := CAP_JIT_INCOMPLETE_LOGIC( m_2 );
                deduped_10_2 := hoisted_20_1[m_2];
                deduped_9_2 := hoisted_29_1[deduped_11_2];
                deduped_8_2 := 1 + deduped_10_2[1];
                deduped_7_2 := 1 + deduped_10_2[2];
                hoisted_6_2 := deduped_23_1[deduped_8_2];
                hoisted_3_2 := [ 0 .. hoisted_30_1[deduped_11_2] - 1 ];
                hoisted_2_2 := hoisted_32_1[deduped_11_2];
                hoisted_1_2 := [ 0 .. deduped_9_2 - 1 ];
                hoisted_5_2 := List( [ 0 .. 2 ^ deduped_9_2 - 1 ], function ( i_3 )
                        local hoisted_1_3;
                        hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                                return REM_INT( QUO_INT( i_3, 2 ^ j_4 ), 2 );
                            end );
                        return Sum( List( hoisted_3_2, function ( k_4 )
                                  return hoisted_33_1[(1 + hoisted_1_3[(1 + hoisted_2_2[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_4 ))])])] * 2 ^ k_4;
                              end ) );
                    end );
                hoisted_4_2 := deduped_23_1[deduped_7_2];
                return CreateCapCategoryMorphismWithAttributes( deduped_46_1, deduped_34_1[deduped_7_2], deduped_34_1[deduped_8_2], AsList, List( [ 0 .. hoisted_22_1[deduped_7_2] - 1 ], function ( x_3 )
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
    sFinSets := SkeletalCategoryOfFiniteSets(  : FinalizeCategory := true );
    return PreSheaves( CategoryFromDataTables( FreeCategory( quiver : range_of_HomStructure := sFinSets,
            FinalizeCategory := true ) : FinalizeCategory := true ), sFinSets );
end;
        
        
    
    cat := category_constructor( quiver : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_PreSheavesOfCategoryFromDataTablesInSkeletalFinSetsSubobjectClassifierPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
