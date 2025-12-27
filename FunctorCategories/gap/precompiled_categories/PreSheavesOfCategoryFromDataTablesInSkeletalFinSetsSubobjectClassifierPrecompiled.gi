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
    local deduped_1_1, deduped_3_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_14_1, deduped_15_1, hoisted_16_1, hoisted_17_1, deduped_18_1, hoisted_20_1, hoisted_22_1, deduped_23_1, hoisted_24_1, deduped_25_1, deduped_26_1, hoisted_27_1, deduped_28_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1;
    deduped_46_1 := BigInt( 0 );
    deduped_45_1 := Target( cat_1 );
    deduped_44_1 := Source( cat_1 );
    deduped_43_1 := IndicesOfGeneratingMorphisms( deduped_44_1 );
    deduped_42_1 := DataTables( deduped_44_1 );
    deduped_41_1 := DefiningTripleOfUnderlyingQuiver( deduped_44_1 );
    deduped_40_1 := deduped_42_1[1];
    deduped_39_1 := deduped_42_1[2];
    deduped_38_1 := [ 1 .. deduped_41_1[1] ];
    deduped_37_1 := deduped_40_1[1];
    deduped_36_1 := [ 1 .. deduped_37_1 ];
    deduped_35_1 := [ 0 .. deduped_40_1[2] - 1 ];
    deduped_34_1 := [ 0 .. deduped_37_1 - 1 ];
    hoisted_17_1 := deduped_39_1[7];
    hoisted_16_1 := deduped_39_1[4];
    deduped_15_1 := deduped_39_1[8];
    deduped_1_1 := deduped_39_1[5];
    deduped_3_1 := List( deduped_34_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return List( deduped_34_1, function ( i_3 )
                    return deduped_1_1[1 + i_3][hoisted_1_2];
                end );
        end );
    deduped_12_1 := List( deduped_36_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_3_1[c_2];
            return List( deduped_36_1, function ( a_3 )
                    return List( deduped_36_1, function ( b_4 )
                            return [ deduped_3_1[b_4][a_3], hoisted_1_2[b_4] ];
                        end );
                end );
        end );
    deduped_7_1 := List( deduped_36_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_3_1[c_2];
            return List( deduped_36_1, function ( a_3 )
                    return List( deduped_36_1, function ( b_4 )
                            return deduped_3_1[b_4][a_3] * hoisted_1_2[b_4];
                        end );
                end );
        end );
    deduped_11_1 := List( deduped_36_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_7_1[c_2];
            return List( deduped_36_1, function ( a_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := hoisted_1_2[a_3];
                    return List( deduped_36_1, function ( b_4 )
                            return hoisted_1_3[b_4];
                        end );
                end );
        end );
    deduped_18_1 := List( deduped_36_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2;
            hoisted_7_2 := 1 + deduped_34_1[c_2];
            hoisted_6_2 := deduped_12_1[c_2];
            hoisted_5_2 := deduped_7_1[c_2];
            hoisted_4_2 := deduped_7_1[CAP_JIT_INCOMPLETE_LOGIC( c_2 )];
            hoisted_2_2 := deduped_3_1[c_2];
            deduped_3_2 := List( deduped_36_1, function ( a_3 )
                    return hoisted_2_2[a_3];
                end );
            hoisted_1_2 := deduped_11_1[c_2];
            return Concatenation( List( deduped_36_1, function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, hoisted_5_3, hoisted_6_3, hoisted_7_3, deduped_8_3, deduped_9_3;
                      deduped_9_3 := CAP_JIT_INCOMPLETE_LOGIC( i_3 );
                      deduped_8_3 := Sum( deduped_3_2{[ 1 .. i_3 - 1 ]} );
                      hoisted_7_3 := [ deduped_8_3 .. deduped_8_3 + deduped_3_2[i_3] - 1 ];
                      hoisted_5_3 := hoisted_6_2[deduped_9_3];
                      hoisted_4_3 := hoisted_5_2[deduped_9_3];
                      hoisted_3_3 := deduped_15_1[1 + deduped_34_1[deduped_9_3]];
                      hoisted_2_3 := hoisted_4_2[deduped_9_3];
                      hoisted_6_3 := CAP_JIT_INCOMPLETE_LOGIC( Concatenation( List( deduped_36_1, function ( b_4 )
                                  local deduped_1_4, hoisted_3_4, hoisted_4_4, hoisted_5_4, hoisted_6_4, deduped_7_4, deduped_8_4, deduped_9_4;
                                  deduped_9_4 := hoisted_4_3[b_4];
                                  deduped_8_4 := 1 + deduped_34_1[b_4];
                                  deduped_7_4 := [ 0 .. deduped_9_4 - 1 ];
                                  hoisted_6_4 := deduped_15_1[deduped_8_4][hoisted_7_2];
                                  deduped_1_4 := hoisted_5_3[b_4][1];
                                  hoisted_5_4 := List( deduped_7_4, function ( i_5 )
                                          return QuoIntWithDomain( i_5, deduped_1_4, deduped_9_4 );
                                      end );
                                  hoisted_4_4 := hoisted_3_3[deduped_8_4];
                                  hoisted_3_4 := List( deduped_7_4, function ( i_5 )
                                          return RemIntWithDomain( i_5, deduped_1_4, deduped_9_4 );
                                      end );
                                  return CAP_JIT_INCOMPLETE_LOGIC( List( [ 0 .. hoisted_2_3[CAP_JIT_INCOMPLETE_LOGIC( b_4 )] - 1 ], function ( i_5 )
                                            local deduped_1_5;
                                            deduped_1_5 := 1 + i_5;
                                            return hoisted_17_1[1 + hoisted_16_1[(1 + hoisted_4_4[(1 + hoisted_3_4[deduped_1_5])])][(1 + hoisted_6_4[(1 + hoisted_5_4[deduped_1_5])])]][1];
                                        end ) );
                              end ) ) );
                      hoisted_1_3 := hoisted_1_2[deduped_9_3];
                      return List( [ 0 .. CAP_JIT_INCOMPLETE_LOGIC( Sum( List( deduped_36_1, function ( b_4 )
                                          return hoisted_1_3[b_4];
                                      end ) ) ) - 1 ], function ( i_4 )
                              return hoisted_7_3[1 + hoisted_6_3[(1 + i_4)]];
                          end );
                  end ) );
        end );
    deduped_8_1 := List( deduped_36_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_7_1[CAP_JIT_INCOMPLETE_LOGIC( c_2 )];
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( Concatenation( List( deduped_36_1, function ( a_3 )
                          local hoisted_1_3;
                          hoisted_1_3 := hoisted_1_2[a_3];
                          return List( deduped_36_1, function ( b_4 )
                                  return hoisted_1_3[b_4];
                              end );
                      end ) ) ) );
        end );
    deduped_14_1 := List( deduped_36_1, function ( c_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2, hoisted_8_2, hoisted_9_2;
            hoisted_5_2 := deduped_12_1[c_2];
            hoisted_4_2 := deduped_7_1[c_2];
            hoisted_2_2 := deduped_3_1[c_2];
            deduped_3_2 := List( deduped_36_1, function ( b_3 )
                    return hoisted_2_2[b_3];
                end );
            hoisted_1_2 := deduped_11_1[c_2];
            hoisted_9_2 := Concatenation( List( deduped_36_1, function ( i_3 )
                      local deduped_1_3, hoisted_2_3, hoisted_3_3, deduped_4_3;
                      deduped_4_3 := Sum( deduped_3_2{[ 1 .. i_3 - 1 ]} );
                      hoisted_3_3 := [ deduped_4_3 .. deduped_4_3 + deduped_3_2[i_3] - 1 ];
                      deduped_1_3 := CAP_JIT_INCOMPLETE_LOGIC( i_3 );
                      hoisted_2_3 := CAP_JIT_INCOMPLETE_LOGIC( Concatenation( List( deduped_36_1, function ( a_4 )
                                  local hoisted_1_4, deduped_3_4;
                                  deduped_3_4 := hoisted_4_2[a_4][deduped_1_3];
                                  hoisted_1_4 := hoisted_5_2[a_4][deduped_1_3][1];
                                  return List( [ 0 .. deduped_3_4 - 1 ], function ( i_5 )
                                          return QuoIntWithDomain( i_5, hoisted_1_4, deduped_3_4 );
                                      end );
                              end ) ) );
                      return List( [ 0 .. CAP_JIT_INCOMPLETE_LOGIC( Sum( List( deduped_36_1, function ( a_4 )
                                          return hoisted_1_2[a_4][deduped_1_3];
                                      end ) ) ) - 1 ], function ( i_4 )
                              return hoisted_3_3[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                  end ) );
            hoisted_6_2 := deduped_11_1[CAP_JIT_INCOMPLETE_LOGIC( c_2 )];
            deduped_7_2 := CAP_JIT_INCOMPLETE_LOGIC( Concatenation( List( deduped_36_1, function ( b_3 )
                        return List( deduped_36_1, function ( a_4 )
                                return hoisted_6_2[a_4][b_3];
                            end );
                    end ) ) );
            hoisted_8_2 := CAP_JIT_INCOMPLETE_LOGIC( Concatenation( Concatenation( List( deduped_36_1, function ( a_3 )
                          return List( deduped_36_1, function ( b_4 )
                                  local deduped_1_4, deduped_2_4;
                                  deduped_2_4 := deduped_37_1 * (b_4 - 1) + a_3;
                                  deduped_1_4 := Sum( deduped_7_2{[ 1 .. deduped_2_4 - 1 ]} );
                                  return [ deduped_1_4 .. deduped_1_4 + deduped_7_2[deduped_2_4] - 1 ];
                              end );
                      end ) ) ) );
            return List( [ 0 .. deduped_8_1[c_2] - 1 ], function ( i_3 )
                    return hoisted_9_2[1 + hoisted_8_2[(1 + i_3)]];
                end );
        end );
    deduped_10_1 := BigInt( 1 );
    deduped_9_1 := List( deduped_36_1, function ( c_2 )
            return deduped_8_1[c_2];
        end );
    deduped_6_1 := BigInt( 2 );
    deduped_5_1 := List( deduped_36_1, function ( c_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_3_1[c_2];
            return Sum( List( deduped_36_1, function ( a_3 )
                      return hoisted_1_2[a_3];
                  end ) );
        end );
    deduped_33_1 := List( deduped_38_1, function ( c_2 )
            local deduped_2_2, deduped_3_2, hoisted_4_2, hoisted_5_2, deduped_6_2;
            deduped_6_2 := deduped_5_1[c_2];
            hoisted_5_2 := deduped_18_1[c_2];
            hoisted_4_2 := deduped_14_1[c_2];
            deduped_3_2 := deduped_9_1[c_2];
            deduped_2_2 := [ 0 .. deduped_6_2 - 1 ];
            return CreateCapCategoryObjectWithAttributes( deduped_45_1, Cardinality, Length( Filtered( [ 0 .. deduped_6_1 ^ deduped_6_2 - 1 ], function ( x_3 )
                        local hoisted_1_3, hoisted_5_3, deduped_6_3, deduped_7_3, deduped_8_3;
                        hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( x_3 );
                        deduped_8_3 := Filtered( deduped_2_2, function ( x_4 )
                                return CAP_JIT_INCOMPLETE_LOGIC( DigitInPositionalNotation( hoisted_1_3, CAP_JIT_INCOMPLETE_LOGIC( x_4 ), deduped_6_2, deduped_6_1 ) ) = deduped_10_1;
                            end );
                        deduped_7_3 := deduped_3_2 * Length( deduped_8_3 );
                        deduped_6_3 := Filtered( [ 0 .. deduped_7_3 - 1 ], function ( x_4 )
                                local deduped_1_4;
                                deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( x_4 );
                                return CAP_JIT_INCOMPLETE_LOGIC( hoisted_4_2[1 + RemIntWithDomain( deduped_1_4, deduped_3_2, deduped_7_3 )] ) = CAP_JIT_INCOMPLETE_LOGIC( deduped_8_3[1 + QuoIntWithDomain( deduped_1_4, deduped_3_2, deduped_7_3 )] );
                            end );
                        hoisted_5_3 := List( [ 0 .. Length( deduped_6_3 ) - 1 ], function ( i_4 )
                                return hoisted_5_2[1 + CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( CAP_JIT_INCOMPLETE_LOGIC( deduped_6_3[(1 + i_4)] ), deduped_3_2, deduped_7_3 ) )];
                            end );
                        return CAP_JIT_INCOMPLETE_LOGIC( Sum( List( deduped_2_2, function ( k_4 )
                                      return CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_EXPR_CASE_WRAPPER( function (  )
                                                    if (CAP_JIT_INCOMPLETE_LOGIC( k_4 ) in hoisted_5_3) then
                                                        return deduped_10_1;
                                                    else
                                                        return deduped_46_1;
                                                    fi;
                                                    return;
                                                end )(  ) ) * deduped_6_1 ^ k_4;
                                  end ) ) ) = x_3;
                    end ) ) );
        end );
    hoisted_31_1 := deduped_39_1[6];
    hoisted_27_1 := deduped_39_1[3];
    deduped_28_1 := List( deduped_35_1, function ( i_2 )
            return hoisted_27_1[1 + i_2];
        end );
    hoisted_24_1 := deduped_39_1[2];
    deduped_26_1 := List( deduped_35_1, function ( i_2 )
            return hoisted_24_1[1 + i_2];
        end );
    deduped_25_1 := deduped_39_1[1];
    hoisted_32_1 := List( deduped_43_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2, hoisted_6_2, deduped_7_2;
            deduped_7_2 := 1 + i_2;
            hoisted_6_2 := List( deduped_34_1, function ( i_3 )
                    return hoisted_31_1[1 + deduped_25_1[(1 + i_3)]][deduped_7_2];
                end );
            hoisted_3_2 := 1 + deduped_28_1[deduped_7_2];
            deduped_4_2 := List( deduped_34_1, function ( i_3 )
                    return deduped_1_1[1 + deduped_26_1[(1 + deduped_25_1[(1 + i_3)])]][hoisted_3_2];
                end );
            hoisted_1_2 := 1 + deduped_26_1[deduped_7_2];
            hoisted_2_2 := List( deduped_34_1, function ( i_3 )
                    return deduped_1_1[1 + deduped_28_1[(1 + deduped_25_1[(1 + i_3)])]][hoisted_1_2];
                end );
            return Concatenation( List( deduped_36_1, function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := Sum( deduped_4_2{[ 1 .. i_3 - 1 ]} );
                      hoisted_2_3 := [ deduped_3_3 .. deduped_3_3 + deduped_4_2[i_3] - 1 ];
                      hoisted_1_3 := hoisted_6_2[i_3];
                      return List( [ 0 .. hoisted_2_2[i_3] - 1 ], function ( i_4 )
                              return hoisted_2_3[1 + hoisted_1_3[(1 + i_4)]];
                          end );
                  end ) );
        end );
    hoisted_30_1 := List( deduped_43_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + deduped_26_1[(1 + i_2)];
            return Sum( List( deduped_34_1, function ( i_3 )
                      return deduped_1_1[1 + deduped_28_1[(1 + deduped_25_1[(1 + i_3)])]][hoisted_1_2];
                  end ) );
        end );
    hoisted_29_1 := List( deduped_43_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + deduped_28_1[(1 + i_2)];
            return Sum( List( deduped_34_1, function ( i_3 )
                      return deduped_1_1[1 + deduped_26_1[(1 + deduped_25_1[(1 + i_3)])]][hoisted_1_2];
                  end ) );
        end );
    deduped_23_1 := List( deduped_38_1, function ( c_2 )
            local deduped_2_2, deduped_3_2, hoisted_4_2, hoisted_5_2, deduped_6_2;
            deduped_6_2 := deduped_5_1[c_2];
            hoisted_5_2 := deduped_18_1[c_2];
            hoisted_4_2 := deduped_14_1[c_2];
            deduped_3_2 := deduped_9_1[c_2];
            deduped_2_2 := [ 0 .. deduped_6_2 - 1 ];
            return Filtered( [ 0 .. deduped_6_1 ^ deduped_6_2 - 1 ], function ( x_3 )
                    local hoisted_1_3, hoisted_5_3, deduped_6_3, deduped_7_3, deduped_8_3;
                    hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( x_3 );
                    deduped_8_3 := Filtered( deduped_2_2, function ( x_4 )
                            return CAP_JIT_INCOMPLETE_LOGIC( DigitInPositionalNotation( hoisted_1_3, CAP_JIT_INCOMPLETE_LOGIC( x_4 ), deduped_6_2, deduped_6_1 ) ) = deduped_10_1;
                        end );
                    deduped_7_3 := deduped_3_2 * Length( deduped_8_3 );
                    deduped_6_3 := Filtered( [ 0 .. deduped_7_3 - 1 ], function ( x_4 )
                            local deduped_1_4;
                            deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( x_4 );
                            return CAP_JIT_INCOMPLETE_LOGIC( hoisted_4_2[1 + RemIntWithDomain( deduped_1_4, deduped_3_2, deduped_7_3 )] ) = CAP_JIT_INCOMPLETE_LOGIC( deduped_8_3[1 + QuoIntWithDomain( deduped_1_4, deduped_3_2, deduped_7_3 )] );
                        end );
                    hoisted_5_3 := List( [ 0 .. Length( deduped_6_3 ) - 1 ], function ( i_4 )
                            return hoisted_5_2[1 + CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( CAP_JIT_INCOMPLETE_LOGIC( deduped_6_3[(1 + i_4)] ), deduped_3_2, deduped_7_3 ) )];
                        end );
                    return CAP_JIT_INCOMPLETE_LOGIC( Sum( List( deduped_2_2, function ( k_4 )
                                  return CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_EXPR_CASE_WRAPPER( function (  )
                                                if (CAP_JIT_INCOMPLETE_LOGIC( k_4 ) in hoisted_5_3) then
                                                    return deduped_10_1;
                                                else
                                                    return deduped_46_1;
                                                fi;
                                                return;
                                            end )(  ) ) * deduped_6_1 ^ k_4;
                              end ) ) ) = x_3;
                end );
        end );
    hoisted_22_1 := List( deduped_38_1, function ( c_2 )
            local deduped_2_2, deduped_3_2, hoisted_4_2, hoisted_5_2, deduped_6_2;
            deduped_6_2 := deduped_5_1[c_2];
            hoisted_5_2 := deduped_18_1[c_2];
            hoisted_4_2 := deduped_14_1[c_2];
            deduped_3_2 := deduped_9_1[c_2];
            deduped_2_2 := [ 0 .. deduped_6_2 - 1 ];
            return Length( Filtered( [ 0 .. deduped_6_1 ^ deduped_6_2 - 1 ], function ( x_3 )
                      local hoisted_1_3, hoisted_5_3, deduped_6_3, deduped_7_3, deduped_8_3;
                      hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( x_3 );
                      deduped_8_3 := Filtered( deduped_2_2, function ( x_4 )
                              return CAP_JIT_INCOMPLETE_LOGIC( DigitInPositionalNotation( hoisted_1_3, CAP_JIT_INCOMPLETE_LOGIC( x_4 ), deduped_6_2, deduped_6_1 ) ) = deduped_10_1;
                          end );
                      deduped_7_3 := deduped_3_2 * Length( deduped_8_3 );
                      deduped_6_3 := Filtered( [ 0 .. deduped_7_3 - 1 ], function ( x_4 )
                              local deduped_1_4;
                              deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( x_4 );
                              return CAP_JIT_INCOMPLETE_LOGIC( hoisted_4_2[1 + RemIntWithDomain( deduped_1_4, deduped_3_2, deduped_7_3 )] ) = CAP_JIT_INCOMPLETE_LOGIC( deduped_8_3[1 + QuoIntWithDomain( deduped_1_4, deduped_3_2, deduped_7_3 )] );
                          end );
                      hoisted_5_3 := List( [ 0 .. Length( deduped_6_3 ) - 1 ], function ( i_4 )
                              return hoisted_5_2[1 + CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( CAP_JIT_INCOMPLETE_LOGIC( deduped_6_3[(1 + i_4)] ), deduped_3_2, deduped_7_3 ) )];
                          end );
                      return CAP_JIT_INCOMPLETE_LOGIC( Sum( List( deduped_2_2, function ( k_4 )
                                    return CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_EXPR_CASE_WRAPPER( function (  )
                                                  if (CAP_JIT_INCOMPLETE_LOGIC( k_4 ) in hoisted_5_3) then
                                                      return deduped_10_1;
                                                  else
                                                      return deduped_46_1;
                                                  fi;
                                                  return;
                                              end )(  ) ) * deduped_6_1 ^ k_4;
                                end ) ) ) = x_3;
                  end ) );
        end );
    hoisted_20_1 := deduped_41_1[3];
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, deduped_44_1, Target, deduped_45_1, ValuesOfPreSheaf, NTuple( 2, deduped_33_1, List( [ 1 .. deduped_41_1[2] ], function ( m_2 )
                local hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, deduped_8_2, deduped_9_2, deduped_10_2, deduped_11_2, deduped_12_2;
                deduped_12_2 := CAP_JIT_INCOMPLETE_LOGIC( m_2 );
                deduped_11_2 := hoisted_20_1[m_2];
                deduped_10_2 := hoisted_29_1[deduped_12_2];
                deduped_9_2 := 1 + deduped_11_2[1];
                deduped_8_2 := 1 + deduped_11_2[2];
                hoisted_7_2 := deduped_23_1[deduped_9_2];
                hoisted_4_2 := [ 0 .. hoisted_30_1[deduped_12_2] - 1 ];
                hoisted_3_2 := hoisted_32_1[deduped_12_2];
                hoisted_2_2 := [ 0 .. deduped_10_2 - 1 ];
                hoisted_6_2 := CAP_JIT_INCOMPLETE_LOGIC( List( [ 0 .. deduped_6_1 ^ deduped_10_2 - 1 ], function ( i_3 )
                          local hoisted_1_3;
                          hoisted_1_3 := List( hoisted_2_2, function ( i_4 )
                                  return DigitInPositionalNotation( i_3, i_4, deduped_10_2, deduped_6_1 );
                              end );
                          return Sum( List( hoisted_4_2, function ( k_4 )
                                    return CAP_JIT_INCOMPLETE_LOGIC( hoisted_1_3[(1 + hoisted_3_2[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_4 ))])] ) * deduped_6_1 ^ k_4;
                                end ) );
                      end ) );
                hoisted_5_2 := deduped_23_1[deduped_8_2];
                return CreateCapCategoryMorphismWithAttributes( deduped_45_1, deduped_33_1[deduped_8_2], deduped_33_1[deduped_9_2], AsList, List( [ 0 .. hoisted_22_1[deduped_8_2] - 1 ], function ( x_3 )
                          return -1 + BigInt( SafePosition( hoisted_7_2, CAP_JIT_INCOMPLETE_LOGIC( hoisted_6_2[(1 + hoisted_5_2[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_3 ))])] ) ) );
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
