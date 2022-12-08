# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_PreSheavesInSkeletalFinSetsSubobjectClassifierPrecompiled", function ( cat )
    
    ##
    AddSubobjectClassifier( cat,
        
########
function ( cat_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1;
    deduped_29_1 := SetOfGeneratingMorphisms( cat_1 );
    deduped_28_1 := SetOfObjects( cat_1 );
    deduped_27_1 := Range( cat_1 );
    deduped_26_1 := Source( cat_1 );
    deduped_25_1 := BasisPathsByVertexIndex( deduped_26_1 );
    deduped_24_1 := Length( deduped_28_1 );
    deduped_23_1 := [ 1 .. Length( deduped_29_1 ) ];
    deduped_22_1 := [ 1 .. deduped_24_1 ];
    hoisted_10_1 := deduped_27_1;
    hoisted_9_1 := [ 1 ];
    hoisted_8_1 := UnderlyingQuiverAlgebra( deduped_26_1 );
    hoisted_7_1 := deduped_25_1;
    hoisted_6_1 := List( deduped_28_1, function ( logic_new_func_x_2 )
            return VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) );
        end );
    hoisted_5_1 := deduped_24_1;
    hoisted_2_1 := deduped_28_1;
    hoisted_1_1 := List( deduped_25_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, Length );
        end );
    hoisted_4_1 := List( deduped_28_1, function ( logic_new_func_x_2 )
            local hoisted_1_2;
            hoisted_1_2 := VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) );
            return List( hoisted_2_1, function ( logic_new_func_x_3 )
                    return hoisted_1_1[VertexIndex( UnderlyingVertex( logic_new_func_x_3 ) )][hoisted_1_2];
                end );
        end );
    hoisted_3_1 := deduped_22_1;
    deduped_21_1 := List( deduped_22_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, hoisted_16_2, hoisted_17_2, hoisted_18_2, hoisted_19_2, hoisted_20_2, hoisted_21_2, hoisted_22_2, hoisted_23_2, hoisted_24_2, deduped_25_2, deduped_26_2, deduped_27_2, deduped_28_2, deduped_29_2, deduped_30_2, deduped_31_2, deduped_32_2, deduped_33_2, deduped_34_2;
            deduped_34_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_2] );
            hoisted_1_2 := hoisted_4_1[deduped_34_2];
            deduped_33_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                    return hoisted_1_2[logic_new_func_x_3];
                end );
            deduped_32_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[deduped_34_2] );
            deduped_31_2 := Sum( deduped_33_2 );
            deduped_30_2 := 2 ^ deduped_31_2;
            deduped_29_2 := [ 0 .. deduped_31_2 - 1 ];
            deduped_28_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[deduped_32_2] );
            deduped_27_2 := [ 0 .. deduped_30_2 - 1 ];
            deduped_26_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[deduped_28_2] );
            hoisted_5_2 := hoisted_4_1[deduped_26_2];
            deduped_25_2 := Sum( Concatenation( List( hoisted_3_1, function ( logic_new_func_x_3 )
                        local hoisted_1_3;
                        hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_3] );
                        return List( hoisted_3_1, function ( logic_new_func_x_4 )
                                local deduped_1_4;
                                deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_4] );
                                return hoisted_4_1[deduped_1_4][hoisted_1_3] * hoisted_5_2[deduped_1_4];
                            end );
                    end ) ) );
            hoisted_23_2 := hoisted_6_1[deduped_34_2];
            hoisted_14_2 := hoisted_4_1[deduped_32_2];
            hoisted_13_2 := deduped_33_2;
            hoisted_11_2 := hoisted_4_1[deduped_28_2];
            hoisted_24_2 := Concatenation( List( hoisted_3_1, function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, hoisted_5_3, hoisted_6_3, deduped_7_3, deduped_8_3, deduped_9_3, deduped_10_3;
                      deduped_10_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_3] );
                      deduped_9_3 := Sum( hoisted_13_2{[ 1 .. logic_new_func_x_3 - 1 ]} );
                      deduped_8_3 := hoisted_7_1[hoisted_6_1[deduped_10_3]];
                      deduped_7_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[deduped_10_3] );
                      hoisted_6_3 := [ deduped_9_3 .. deduped_9_3 + hoisted_1_2[deduped_10_3] - 1 ];
                      hoisted_4_3 := deduped_8_3[hoisted_23_2];
                      hoisted_3_3 := deduped_7_3;
                      hoisted_2_3 := deduped_8_3;
                      hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[deduped_7_3] );
                      hoisted_5_3 := Concatenation( List( hoisted_3_1, function ( logic_new_func_x_4 )
                                local hoisted_1_4, hoisted_2_4, hoisted_3_4, hoisted_4_4, hoisted_5_4, hoisted_6_4, deduped_7_4, deduped_8_4, deduped_9_4, deduped_10_4, deduped_11_4, deduped_12_4, deduped_13_4;
                                deduped_13_4 := hoisted_6_1[logic_new_func_x_4];
                                deduped_12_4 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_4] );
                                deduped_11_4 := hoisted_14_2[deduped_12_4];
                                deduped_10_4 := hoisted_4_1[deduped_12_4][hoisted_3_3];
                                deduped_9_4 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[deduped_12_4] );
                                deduped_8_4 := [ deduped_10_4, deduped_11_4 ];
                                deduped_7_4 := [ 0 .. deduped_10_4 * deduped_11_4 - 1 ];
                                hoisted_6_4 := hoisted_7_1[deduped_13_4][hoisted_23_2];
                                hoisted_4_4 := deduped_8_4[2];
                                hoisted_1_4 := deduped_8_4[1];
                                hoisted_5_4 := List( deduped_7_4, function ( i_5 )
                                        return REM_INT( QUO_INT( i_5, hoisted_1_4 ), hoisted_4_4 );
                                    end );
                                hoisted_3_4 := hoisted_2_3[deduped_13_4];
                                hoisted_2_4 := List( deduped_7_4, function ( i_5 )
                                        return REM_INT( i_5, hoisted_1_4 );
                                    end );
                                return List( [ 0 .. hoisted_4_1[deduped_9_4][hoisted_1_3] * hoisted_11_2[deduped_9_4] - 1 ], function ( i_5 )
                                        local deduped_1_5;
                                        deduped_1_5 := 1 + i_5;
                                        return -1 + SafePosition( hoisted_4_3, BasisPathOfPathAlgebraBasisElement( QuiverAlgebraElement( hoisted_8_1, hoisted_9_1, hoisted_3_4{[ (1 + hoisted_2_4[deduped_1_5]) ]} ) * QuiverAlgebraElement( hoisted_8_1, hoisted_9_1, hoisted_6_4{[ (1 + hoisted_5_4[deduped_1_5]) ]} ) ) );
                                    end );
                            end ) );
                      return List( [ 0 .. Sum( List( hoisted_3_1, function ( logic_new_func_x_4 )
                                        local deduped_1_4;
                                        deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_4] )] );
                                        return hoisted_4_1[deduped_1_4][hoisted_1_3] * hoisted_11_2[deduped_1_4];
                                    end ) ) - 1 ], function ( i_4 )
                              return hoisted_6_3[1 + hoisted_5_3[(1 + i_4)]];
                          end );
                  end ) );
            hoisted_16_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                    return List( hoisted_3_1, function ( logic_new_func_x_4 )
                            return [ hoisted_4_1[logic_new_func_x_4][logic_new_func_x_3], hoisted_14_2[logic_new_func_x_4] ];
                        end );
                end );
            hoisted_15_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                    return List( hoisted_3_1, function ( logic_new_func_x_4 )
                            return hoisted_4_1[logic_new_func_x_4][logic_new_func_x_3] * hoisted_14_2[logic_new_func_x_4];
                        end );
                end );
            hoisted_12_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_3] );
                    return List( hoisted_3_1, function ( logic_new_func_x_4 )
                            local deduped_1_4;
                            deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_4] );
                            return hoisted_4_1[deduped_1_4][hoisted_1_3] * hoisted_11_2[deduped_1_4];
                        end );
                end );
            hoisted_21_2 := Concatenation( List( hoisted_3_1, function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3, deduped_4_3, deduped_5_3;
                      deduped_5_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_3] );
                      deduped_4_3 := Sum( hoisted_13_2{[ 1 .. logic_new_func_x_3 - 1 ]} );
                      hoisted_3_3 := [ deduped_4_3 .. deduped_4_3 + hoisted_1_2[deduped_5_3] - 1 ];
                      hoisted_1_3 := deduped_5_3;
                      hoisted_2_3 := Concatenation( List( hoisted_3_1, function ( logic_new_func_x_4 )
                                local hoisted_1_4, hoisted_2_4, deduped_3_4;
                                deduped_3_4 := hoisted_16_2[logic_new_func_x_4][hoisted_1_3];
                                hoisted_2_4 := deduped_3_4[2];
                                hoisted_1_4 := deduped_3_4[1];
                                return List( [ 0 .. hoisted_15_2[logic_new_func_x_4][hoisted_1_3] - 1 ], function ( i_5 )
                                        return REM_INT( QUO_INT( i_5, hoisted_1_4 ), hoisted_2_4 );
                                    end );
                            end ) );
                      return List( [ 0 .. Sum( List( hoisted_3_1, function ( logic_new_func_x_4 )
                                        return hoisted_12_2[logic_new_func_x_4][hoisted_1_3];
                                    end ) ) - 1 ], function ( i_4 )
                              return hoisted_3_3[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                  end ) );
            hoisted_17_2 := hoisted_4_1[CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[deduped_26_2] )] )];
            hoisted_18_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_3] );
                    return List( hoisted_3_1, function ( logic_new_func_x_4 )
                            local deduped_1_4;
                            deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_4] );
                            return hoisted_4_1[deduped_1_4][hoisted_1_3] * hoisted_17_2[deduped_1_4];
                        end );
                end );
            hoisted_19_2 := Concatenation( List( hoisted_3_1, function ( logic_new_func_x_3 )
                      return List( hoisted_3_1, function ( logic_new_func_x_4 )
                              return hoisted_18_2[logic_new_func_x_4][logic_new_func_x_3];
                          end );
                  end ) );
            hoisted_20_2 := Concatenation( Concatenation( List( hoisted_3_1, function ( logic_new_func_x_3 )
                        return List( hoisted_3_1, function ( logic_new_func_x_4 )
                                local deduped_1_4, deduped_2_4;
                                deduped_2_4 := hoisted_5_1 * (logic_new_func_x_4 - 1) + logic_new_func_x_3;
                                deduped_1_4 := Sum( hoisted_19_2{[ 1 .. deduped_2_4 - 1 ]} );
                                return [ deduped_1_4 .. deduped_1_4 + hoisted_19_2[deduped_2_4] - 1 ];
                            end );
                    end ) ) );
            hoisted_22_2 := List( [ 0 .. deduped_25_2 - 1 ], function ( i_3 )
                    return hoisted_21_2[1 + hoisted_20_2[(1 + i_3)]];
                end );
            hoisted_10_2 := deduped_25_2;
            hoisted_6_2 := deduped_30_2;
            hoisted_9_2 := List( [ 0 .. deduped_30_2 * deduped_31_2 - 1 ], function ( i_3 )
                    return REM_INT( QUO_INT( i_3, 2 ^ QUO_INT( i_3, hoisted_6_2 ) ), 2 );
                end );
            hoisted_3_2 := deduped_31_2;
            hoisted_8_2 := List( deduped_29_2, function ( logic_new_func_x_3 )
                    return REM_INT( logic_new_func_x_3, hoisted_3_2 );
                end );
            hoisted_7_2 := deduped_27_2;
            hoisted_4_2 := CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. deduped_31_2 ^ deduped_31_2 - 1 ][1 + deduped_31_2 * GeometricSumDiff1( deduped_31_2, deduped_31_2 )] );
            hoisted_2_2 := deduped_29_2;
            return CreateCapCategoryObjectWithAttributes( hoisted_10_1, Length, Length( Filtered( deduped_27_2, function ( x_3 )
                        local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, hoisted_5_3, hoisted_6_3, hoisted_7_3, deduped_8_3, deduped_9_3, deduped_10_3, deduped_11_3;
                        hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_7_2[1 + x_3] );
                        deduped_11_3 := Filtered( hoisted_2_2, function ( x_4 )
                                return hoisted_9_2[1 + (hoisted_1_3 + hoisted_8_2[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_2_2[(1 + REM_INT( x_4, hoisted_3_2 ))] ))] * hoisted_6_2)] = 1;
                            end );
                        deduped_10_3 := Length( deduped_11_3 );
                        deduped_9_3 := [ 0 .. hoisted_10_2 * deduped_10_3 - 1 ];
                        hoisted_2_3 := deduped_11_3;
                        hoisted_4_3 := List( [ 0 .. deduped_10_3 - 1 ], function ( i_4 )
                                return hoisted_8_2[1 + hoisted_2_3[(1 + i_4)]];
                            end );
                        hoisted_3_3 := deduped_10_3;
                        deduped_8_3 := Filtered( deduped_9_3, function ( x_4 )
                                return hoisted_22_2[1 + REM_INT( x_4, hoisted_10_2 )] = hoisted_4_3[1 + REM_INT( QUO_INT( x_4, hoisted_10_2 ), hoisted_3_3 )];
                            end );
                        hoisted_6_3 := deduped_9_3;
                        hoisted_5_3 := deduped_8_3;
                        hoisted_7_3 := List( [ 0 .. Length( deduped_8_3 ) - 1 ], function ( logic_new_func_x_4 )
                                return hoisted_24_2[1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_6_3[(1 + hoisted_5_3[(1 + logic_new_func_x_4)])] ), hoisted_10_2 )];
                            end );
                        return Sum( List( hoisted_2_2, function ( k_4 )
                                    return IdFunc( function (  )
                                                if (CAP_JIT_INCOMPLETE_LOGIC( hoisted_2_2[1 + REM_INT( QUO_INT( hoisted_4_2, hoisted_3_2 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_2_2[(1 + k_4)] ) ), hoisted_3_2 )] ) in hoisted_7_3) then
                                                    return 1;
                                                else
                                                    return 0;
                                                fi;
                                                return;
                                            end )(  ) * 2 ^ k_4;
                                end ) ) = x_3;
                    end ) ) );
        end );
    hoisted_20_1 := [ 0, 1 ];
    hoisted_18_1 := HomStructureOnBasisPaths( deduped_26_1 );
    hoisted_19_1 := List( deduped_29_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2, deduped_8_2;
            deduped_8_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            deduped_7_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            hoisted_5_2 := SafePosition( hoisted_7_1[deduped_7_2][deduped_8_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) );
            hoisted_3_2 := deduped_8_2;
            hoisted_1_2 := deduped_7_2;
            hoisted_6_2 := List( hoisted_2_1, function ( logic_new_func_x_3 )
                    local hoisted_1_3, deduped_2_3, deduped_3_3;
                    deduped_3_3 := UnderlyingVertex( logic_new_func_x_3 );
                    deduped_2_3 := VertexIndex( deduped_3_3 );
                    hoisted_1_3 := hoisted_18_1[deduped_2_3][hoisted_1_2][deduped_2_3][hoisted_3_2][SafePosition( hoisted_7_1[deduped_2_3][deduped_2_3], BasisPathOfPathAlgebraBasisElement( PathAsAlgebraElement( hoisted_8_1, QuiverVertexAsIdentityPath( deduped_3_3 ) ) ) )][hoisted_5_2];
                    return List( [ 1 .. hoisted_1_1[deduped_2_3][hoisted_1_2] ], function ( phi_index_4 )
                            return hoisted_1_3[phi_index_4];
                        end );
                end );
            hoisted_4_2 := List( hoisted_2_1, function ( logic_new_func_x_3 )
                    return hoisted_1_1[VertexIndex( UnderlyingVertex( logic_new_func_x_3 ) )][hoisted_3_2];
                end );
            hoisted_2_2 := List( hoisted_2_1, function ( logic_new_func_x_3 )
                    return hoisted_1_1[VertexIndex( UnderlyingVertex( logic_new_func_x_3 ) )][hoisted_1_2];
                end );
            return Concatenation( List( hoisted_3_1, function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := Sum( hoisted_4_2{[ 1 .. logic_new_func_x_3 - 1 ]} );
                      hoisted_2_3 := [ deduped_3_3 .. deduped_3_3 + hoisted_4_2[logic_new_func_x_3] - 1 ];
                      hoisted_1_3 := hoisted_6_2[logic_new_func_x_3];
                      return List( [ 0 .. hoisted_2_2[logic_new_func_x_3] - 1 ], function ( i_4 )
                              return hoisted_2_3[1 + hoisted_1_3[(1 + i_4)]];
                          end );
                  end ) );
        end );
    hoisted_17_1 := List( deduped_29_1, function ( logic_new_func_x_2 )
            local hoisted_1_2;
            hoisted_1_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            return Sum( List( hoisted_2_1, function ( logic_new_func_x_3 )
                      return hoisted_1_1[VertexIndex( UnderlyingVertex( logic_new_func_x_3 ) )][hoisted_1_2];
                  end ) );
        end );
    hoisted_16_1 := List( deduped_29_1, function ( logic_new_func_x_2 )
            local hoisted_1_2;
            hoisted_1_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            return Sum( List( hoisted_2_1, function ( logic_new_func_x_3 )
                      return hoisted_1_1[VertexIndex( UnderlyingVertex( logic_new_func_x_3 ) )][hoisted_1_2];
                  end ) );
        end );
    hoisted_15_1 := deduped_23_1;
    hoisted_14_1 := List( deduped_22_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, hoisted_16_2, hoisted_17_2, hoisted_18_2, hoisted_19_2, hoisted_20_2, hoisted_21_2, hoisted_22_2, hoisted_23_2, hoisted_24_2, deduped_25_2, deduped_26_2, deduped_27_2, deduped_28_2, deduped_29_2, deduped_30_2, deduped_31_2, deduped_32_2, deduped_33_2, deduped_34_2;
            deduped_34_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_2] );
            hoisted_1_2 := hoisted_4_1[deduped_34_2];
            deduped_33_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                    return hoisted_1_2[logic_new_func_x_3];
                end );
            deduped_32_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[deduped_34_2] );
            deduped_31_2 := Sum( deduped_33_2 );
            deduped_30_2 := 2 ^ deduped_31_2;
            deduped_29_2 := [ 0 .. deduped_31_2 - 1 ];
            deduped_28_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[deduped_32_2] );
            deduped_27_2 := [ 0 .. deduped_30_2 - 1 ];
            deduped_26_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[deduped_28_2] );
            hoisted_5_2 := hoisted_4_1[deduped_26_2];
            deduped_25_2 := Sum( Concatenation( List( hoisted_3_1, function ( logic_new_func_x_3 )
                        local hoisted_1_3;
                        hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_3] );
                        return List( hoisted_3_1, function ( logic_new_func_x_4 )
                                local deduped_1_4;
                                deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_4] );
                                return hoisted_4_1[deduped_1_4][hoisted_1_3] * hoisted_5_2[deduped_1_4];
                            end );
                    end ) ) );
            hoisted_23_2 := hoisted_6_1[deduped_34_2];
            hoisted_14_2 := hoisted_4_1[deduped_32_2];
            hoisted_13_2 := deduped_33_2;
            hoisted_11_2 := hoisted_4_1[deduped_28_2];
            hoisted_24_2 := Concatenation( List( hoisted_3_1, function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, hoisted_5_3, hoisted_6_3, deduped_7_3, deduped_8_3, deduped_9_3, deduped_10_3;
                      deduped_10_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_3] );
                      deduped_9_3 := Sum( hoisted_13_2{[ 1 .. logic_new_func_x_3 - 1 ]} );
                      deduped_8_3 := hoisted_7_1[hoisted_6_1[deduped_10_3]];
                      deduped_7_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[deduped_10_3] );
                      hoisted_6_3 := [ deduped_9_3 .. deduped_9_3 + hoisted_1_2[deduped_10_3] - 1 ];
                      hoisted_4_3 := deduped_8_3[hoisted_23_2];
                      hoisted_3_3 := deduped_7_3;
                      hoisted_2_3 := deduped_8_3;
                      hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[deduped_7_3] );
                      hoisted_5_3 := Concatenation( List( hoisted_3_1, function ( logic_new_func_x_4 )
                                local hoisted_1_4, hoisted_2_4, hoisted_3_4, hoisted_4_4, hoisted_5_4, hoisted_6_4, deduped_7_4, deduped_8_4, deduped_9_4, deduped_10_4, deduped_11_4, deduped_12_4, deduped_13_4;
                                deduped_13_4 := hoisted_6_1[logic_new_func_x_4];
                                deduped_12_4 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_4] );
                                deduped_11_4 := hoisted_14_2[deduped_12_4];
                                deduped_10_4 := hoisted_4_1[deduped_12_4][hoisted_3_3];
                                deduped_9_4 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[deduped_12_4] );
                                deduped_8_4 := [ deduped_10_4, deduped_11_4 ];
                                deduped_7_4 := [ 0 .. deduped_10_4 * deduped_11_4 - 1 ];
                                hoisted_6_4 := hoisted_7_1[deduped_13_4][hoisted_23_2];
                                hoisted_4_4 := deduped_8_4[2];
                                hoisted_1_4 := deduped_8_4[1];
                                hoisted_5_4 := List( deduped_7_4, function ( i_5 )
                                        return REM_INT( QUO_INT( i_5, hoisted_1_4 ), hoisted_4_4 );
                                    end );
                                hoisted_3_4 := hoisted_2_3[deduped_13_4];
                                hoisted_2_4 := List( deduped_7_4, function ( i_5 )
                                        return REM_INT( i_5, hoisted_1_4 );
                                    end );
                                return List( [ 0 .. hoisted_4_1[deduped_9_4][hoisted_1_3] * hoisted_11_2[deduped_9_4] - 1 ], function ( i_5 )
                                        local deduped_1_5;
                                        deduped_1_5 := 1 + i_5;
                                        return -1 + SafePosition( hoisted_4_3, BasisPathOfPathAlgebraBasisElement( QuiverAlgebraElement( hoisted_8_1, hoisted_9_1, hoisted_3_4{[ (1 + hoisted_2_4[deduped_1_5]) ]} ) * QuiverAlgebraElement( hoisted_8_1, hoisted_9_1, hoisted_6_4{[ (1 + hoisted_5_4[deduped_1_5]) ]} ) ) );
                                    end );
                            end ) );
                      return List( [ 0 .. Sum( List( hoisted_3_1, function ( logic_new_func_x_4 )
                                        local deduped_1_4;
                                        deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_4] )] );
                                        return hoisted_4_1[deduped_1_4][hoisted_1_3] * hoisted_11_2[deduped_1_4];
                                    end ) ) - 1 ], function ( i_4 )
                              return hoisted_6_3[1 + hoisted_5_3[(1 + i_4)]];
                          end );
                  end ) );
            hoisted_16_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                    return List( hoisted_3_1, function ( logic_new_func_x_4 )
                            return [ hoisted_4_1[logic_new_func_x_4][logic_new_func_x_3], hoisted_14_2[logic_new_func_x_4] ];
                        end );
                end );
            hoisted_15_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                    return List( hoisted_3_1, function ( logic_new_func_x_4 )
                            return hoisted_4_1[logic_new_func_x_4][logic_new_func_x_3] * hoisted_14_2[logic_new_func_x_4];
                        end );
                end );
            hoisted_12_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_3] );
                    return List( hoisted_3_1, function ( logic_new_func_x_4 )
                            local deduped_1_4;
                            deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_4] );
                            return hoisted_4_1[deduped_1_4][hoisted_1_3] * hoisted_11_2[deduped_1_4];
                        end );
                end );
            hoisted_21_2 := Concatenation( List( hoisted_3_1, function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3, deduped_4_3, deduped_5_3;
                      deduped_5_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_3] );
                      deduped_4_3 := Sum( hoisted_13_2{[ 1 .. logic_new_func_x_3 - 1 ]} );
                      hoisted_3_3 := [ deduped_4_3 .. deduped_4_3 + hoisted_1_2[deduped_5_3] - 1 ];
                      hoisted_1_3 := deduped_5_3;
                      hoisted_2_3 := Concatenation( List( hoisted_3_1, function ( logic_new_func_x_4 )
                                local hoisted_1_4, hoisted_2_4, deduped_3_4;
                                deduped_3_4 := hoisted_16_2[logic_new_func_x_4][hoisted_1_3];
                                hoisted_2_4 := deduped_3_4[2];
                                hoisted_1_4 := deduped_3_4[1];
                                return List( [ 0 .. hoisted_15_2[logic_new_func_x_4][hoisted_1_3] - 1 ], function ( i_5 )
                                        return REM_INT( QUO_INT( i_5, hoisted_1_4 ), hoisted_2_4 );
                                    end );
                            end ) );
                      return List( [ 0 .. Sum( List( hoisted_3_1, function ( logic_new_func_x_4 )
                                        return hoisted_12_2[logic_new_func_x_4][hoisted_1_3];
                                    end ) ) - 1 ], function ( i_4 )
                              return hoisted_3_3[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                  end ) );
            hoisted_17_2 := hoisted_4_1[CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[deduped_26_2] )] )];
            hoisted_18_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_3] );
                    return List( hoisted_3_1, function ( logic_new_func_x_4 )
                            local deduped_1_4;
                            deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_4] );
                            return hoisted_4_1[deduped_1_4][hoisted_1_3] * hoisted_17_2[deduped_1_4];
                        end );
                end );
            hoisted_19_2 := Concatenation( List( hoisted_3_1, function ( logic_new_func_x_3 )
                      return List( hoisted_3_1, function ( logic_new_func_x_4 )
                              return hoisted_18_2[logic_new_func_x_4][logic_new_func_x_3];
                          end );
                  end ) );
            hoisted_20_2 := Concatenation( Concatenation( List( hoisted_3_1, function ( logic_new_func_x_3 )
                        return List( hoisted_3_1, function ( logic_new_func_x_4 )
                                local deduped_1_4, deduped_2_4;
                                deduped_2_4 := hoisted_5_1 * (logic_new_func_x_4 - 1) + logic_new_func_x_3;
                                deduped_1_4 := Sum( hoisted_19_2{[ 1 .. deduped_2_4 - 1 ]} );
                                return [ deduped_1_4 .. deduped_1_4 + hoisted_19_2[deduped_2_4] - 1 ];
                            end );
                    end ) ) );
            hoisted_22_2 := List( [ 0 .. deduped_25_2 - 1 ], function ( i_3 )
                    return hoisted_21_2[1 + hoisted_20_2[(1 + i_3)]];
                end );
            hoisted_10_2 := deduped_25_2;
            hoisted_6_2 := deduped_30_2;
            hoisted_9_2 := List( [ 0 .. deduped_30_2 * deduped_31_2 - 1 ], function ( i_3 )
                    return REM_INT( QUO_INT( i_3, 2 ^ QUO_INT( i_3, hoisted_6_2 ) ), 2 );
                end );
            hoisted_3_2 := deduped_31_2;
            hoisted_8_2 := List( deduped_29_2, function ( logic_new_func_x_3 )
                    return REM_INT( logic_new_func_x_3, hoisted_3_2 );
                end );
            hoisted_7_2 := deduped_27_2;
            hoisted_4_2 := CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. deduped_31_2 ^ deduped_31_2 - 1 ][1 + deduped_31_2 * GeometricSumDiff1( deduped_31_2, deduped_31_2 )] );
            hoisted_2_2 := deduped_29_2;
            return Filtered( deduped_27_2, function ( x_3 )
                    local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, hoisted_5_3, hoisted_6_3, hoisted_7_3, deduped_8_3, deduped_9_3, deduped_10_3, deduped_11_3;
                    hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_7_2[1 + x_3] );
                    deduped_11_3 := Filtered( hoisted_2_2, function ( x_4 )
                            return hoisted_9_2[1 + (hoisted_1_3 + hoisted_8_2[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_2_2[(1 + REM_INT( x_4, hoisted_3_2 ))] ))] * hoisted_6_2)] = 1;
                        end );
                    deduped_10_3 := Length( deduped_11_3 );
                    deduped_9_3 := [ 0 .. hoisted_10_2 * deduped_10_3 - 1 ];
                    hoisted_2_3 := deduped_11_3;
                    hoisted_4_3 := List( [ 0 .. deduped_10_3 - 1 ], function ( i_4 )
                            return hoisted_8_2[1 + hoisted_2_3[(1 + i_4)]];
                        end );
                    hoisted_3_3 := deduped_10_3;
                    deduped_8_3 := Filtered( deduped_9_3, function ( x_4 )
                            return hoisted_22_2[1 + REM_INT( x_4, hoisted_10_2 )] = hoisted_4_3[1 + REM_INT( QUO_INT( x_4, hoisted_10_2 ), hoisted_3_3 )];
                        end );
                    hoisted_6_3 := deduped_9_3;
                    hoisted_5_3 := deduped_8_3;
                    hoisted_7_3 := List( [ 0 .. Length( deduped_8_3 ) - 1 ], function ( logic_new_func_x_4 )
                            return hoisted_24_2[1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_6_3[(1 + hoisted_5_3[(1 + logic_new_func_x_4)])] ), hoisted_10_2 )];
                        end );
                    return Sum( List( hoisted_2_2, function ( k_4 )
                                return IdFunc( function (  )
                                            if (CAP_JIT_INCOMPLETE_LOGIC( hoisted_2_2[1 + REM_INT( QUO_INT( hoisted_4_2, hoisted_3_2 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_2_2[(1 + k_4)] ) ), hoisted_3_2 )] ) in hoisted_7_3) then
                                                return 1;
                                            else
                                                return 0;
                                            fi;
                                            return;
                                        end )(  ) * 2 ^ k_4;
                            end ) ) = x_3;
                end );
        end );
    hoisted_13_1 := List( deduped_22_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, hoisted_16_2, hoisted_17_2, hoisted_18_2, hoisted_19_2, hoisted_20_2, hoisted_21_2, hoisted_22_2, hoisted_23_2, hoisted_24_2, deduped_25_2, deduped_26_2, deduped_27_2, deduped_28_2, deduped_29_2, deduped_30_2, deduped_31_2, deduped_32_2, deduped_33_2, deduped_34_2;
            deduped_34_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_2] );
            hoisted_1_2 := hoisted_4_1[deduped_34_2];
            deduped_33_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                    return hoisted_1_2[logic_new_func_x_3];
                end );
            deduped_32_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[deduped_34_2] );
            deduped_31_2 := Sum( deduped_33_2 );
            deduped_30_2 := 2 ^ deduped_31_2;
            deduped_29_2 := [ 0 .. deduped_31_2 - 1 ];
            deduped_28_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[deduped_32_2] );
            deduped_27_2 := [ 0 .. deduped_30_2 - 1 ];
            deduped_26_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[deduped_28_2] );
            hoisted_5_2 := hoisted_4_1[deduped_26_2];
            deduped_25_2 := Sum( Concatenation( List( hoisted_3_1, function ( logic_new_func_x_3 )
                        local hoisted_1_3;
                        hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_3] );
                        return List( hoisted_3_1, function ( logic_new_func_x_4 )
                                local deduped_1_4;
                                deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_4] );
                                return hoisted_4_1[deduped_1_4][hoisted_1_3] * hoisted_5_2[deduped_1_4];
                            end );
                    end ) ) );
            hoisted_23_2 := hoisted_6_1[deduped_34_2];
            hoisted_14_2 := hoisted_4_1[deduped_32_2];
            hoisted_13_2 := deduped_33_2;
            hoisted_11_2 := hoisted_4_1[deduped_28_2];
            hoisted_24_2 := Concatenation( List( hoisted_3_1, function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, hoisted_5_3, hoisted_6_3, deduped_7_3, deduped_8_3, deduped_9_3, deduped_10_3;
                      deduped_10_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_3] );
                      deduped_9_3 := Sum( hoisted_13_2{[ 1 .. logic_new_func_x_3 - 1 ]} );
                      deduped_8_3 := hoisted_7_1[hoisted_6_1[deduped_10_3]];
                      deduped_7_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[deduped_10_3] );
                      hoisted_6_3 := [ deduped_9_3 .. deduped_9_3 + hoisted_1_2[deduped_10_3] - 1 ];
                      hoisted_4_3 := deduped_8_3[hoisted_23_2];
                      hoisted_3_3 := deduped_7_3;
                      hoisted_2_3 := deduped_8_3;
                      hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[deduped_7_3] );
                      hoisted_5_3 := Concatenation( List( hoisted_3_1, function ( logic_new_func_x_4 )
                                local hoisted_1_4, hoisted_2_4, hoisted_3_4, hoisted_4_4, hoisted_5_4, hoisted_6_4, deduped_7_4, deduped_8_4, deduped_9_4, deduped_10_4, deduped_11_4, deduped_12_4, deduped_13_4;
                                deduped_13_4 := hoisted_6_1[logic_new_func_x_4];
                                deduped_12_4 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_4] );
                                deduped_11_4 := hoisted_14_2[deduped_12_4];
                                deduped_10_4 := hoisted_4_1[deduped_12_4][hoisted_3_3];
                                deduped_9_4 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[deduped_12_4] );
                                deduped_8_4 := [ deduped_10_4, deduped_11_4 ];
                                deduped_7_4 := [ 0 .. deduped_10_4 * deduped_11_4 - 1 ];
                                hoisted_6_4 := hoisted_7_1[deduped_13_4][hoisted_23_2];
                                hoisted_4_4 := deduped_8_4[2];
                                hoisted_1_4 := deduped_8_4[1];
                                hoisted_5_4 := List( deduped_7_4, function ( i_5 )
                                        return REM_INT( QUO_INT( i_5, hoisted_1_4 ), hoisted_4_4 );
                                    end );
                                hoisted_3_4 := hoisted_2_3[deduped_13_4];
                                hoisted_2_4 := List( deduped_7_4, function ( i_5 )
                                        return REM_INT( i_5, hoisted_1_4 );
                                    end );
                                return List( [ 0 .. hoisted_4_1[deduped_9_4][hoisted_1_3] * hoisted_11_2[deduped_9_4] - 1 ], function ( i_5 )
                                        local deduped_1_5;
                                        deduped_1_5 := 1 + i_5;
                                        return -1 + SafePosition( hoisted_4_3, BasisPathOfPathAlgebraBasisElement( QuiverAlgebraElement( hoisted_8_1, hoisted_9_1, hoisted_3_4{[ (1 + hoisted_2_4[deduped_1_5]) ]} ) * QuiverAlgebraElement( hoisted_8_1, hoisted_9_1, hoisted_6_4{[ (1 + hoisted_5_4[deduped_1_5]) ]} ) ) );
                                    end );
                            end ) );
                      return List( [ 0 .. Sum( List( hoisted_3_1, function ( logic_new_func_x_4 )
                                        local deduped_1_4;
                                        deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_4] )] );
                                        return hoisted_4_1[deduped_1_4][hoisted_1_3] * hoisted_11_2[deduped_1_4];
                                    end ) ) - 1 ], function ( i_4 )
                              return hoisted_6_3[1 + hoisted_5_3[(1 + i_4)]];
                          end );
                  end ) );
            hoisted_16_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                    return List( hoisted_3_1, function ( logic_new_func_x_4 )
                            return [ hoisted_4_1[logic_new_func_x_4][logic_new_func_x_3], hoisted_14_2[logic_new_func_x_4] ];
                        end );
                end );
            hoisted_15_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                    return List( hoisted_3_1, function ( logic_new_func_x_4 )
                            return hoisted_4_1[logic_new_func_x_4][logic_new_func_x_3] * hoisted_14_2[logic_new_func_x_4];
                        end );
                end );
            hoisted_12_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_3] );
                    return List( hoisted_3_1, function ( logic_new_func_x_4 )
                            local deduped_1_4;
                            deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_4] );
                            return hoisted_4_1[deduped_1_4][hoisted_1_3] * hoisted_11_2[deduped_1_4];
                        end );
                end );
            hoisted_21_2 := Concatenation( List( hoisted_3_1, function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3, deduped_4_3, deduped_5_3;
                      deduped_5_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_3] );
                      deduped_4_3 := Sum( hoisted_13_2{[ 1 .. logic_new_func_x_3 - 1 ]} );
                      hoisted_3_3 := [ deduped_4_3 .. deduped_4_3 + hoisted_1_2[deduped_5_3] - 1 ];
                      hoisted_1_3 := deduped_5_3;
                      hoisted_2_3 := Concatenation( List( hoisted_3_1, function ( logic_new_func_x_4 )
                                local hoisted_1_4, hoisted_2_4, deduped_3_4;
                                deduped_3_4 := hoisted_16_2[logic_new_func_x_4][hoisted_1_3];
                                hoisted_2_4 := deduped_3_4[2];
                                hoisted_1_4 := deduped_3_4[1];
                                return List( [ 0 .. hoisted_15_2[logic_new_func_x_4][hoisted_1_3] - 1 ], function ( i_5 )
                                        return REM_INT( QUO_INT( i_5, hoisted_1_4 ), hoisted_2_4 );
                                    end );
                            end ) );
                      return List( [ 0 .. Sum( List( hoisted_3_1, function ( logic_new_func_x_4 )
                                        return hoisted_12_2[logic_new_func_x_4][hoisted_1_3];
                                    end ) ) - 1 ], function ( i_4 )
                              return hoisted_3_3[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                  end ) );
            hoisted_17_2 := hoisted_4_1[CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[deduped_26_2] )] )];
            hoisted_18_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_3] );
                    return List( hoisted_3_1, function ( logic_new_func_x_4 )
                            local deduped_1_4;
                            deduped_1_4 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[logic_new_func_x_4] );
                            return hoisted_4_1[deduped_1_4][hoisted_1_3] * hoisted_17_2[deduped_1_4];
                        end );
                end );
            hoisted_19_2 := Concatenation( List( hoisted_3_1, function ( logic_new_func_x_3 )
                      return List( hoisted_3_1, function ( logic_new_func_x_4 )
                              return hoisted_18_2[logic_new_func_x_4][logic_new_func_x_3];
                          end );
                  end ) );
            hoisted_20_2 := Concatenation( Concatenation( List( hoisted_3_1, function ( logic_new_func_x_3 )
                        return List( hoisted_3_1, function ( logic_new_func_x_4 )
                                local deduped_1_4, deduped_2_4;
                                deduped_2_4 := hoisted_5_1 * (logic_new_func_x_4 - 1) + logic_new_func_x_3;
                                deduped_1_4 := Sum( hoisted_19_2{[ 1 .. deduped_2_4 - 1 ]} );
                                return [ deduped_1_4 .. deduped_1_4 + hoisted_19_2[deduped_2_4] - 1 ];
                            end );
                    end ) ) );
            hoisted_22_2 := List( [ 0 .. deduped_25_2 - 1 ], function ( i_3 )
                    return hoisted_21_2[1 + hoisted_20_2[(1 + i_3)]];
                end );
            hoisted_10_2 := deduped_25_2;
            hoisted_6_2 := deduped_30_2;
            hoisted_9_2 := List( [ 0 .. deduped_30_2 * deduped_31_2 - 1 ], function ( i_3 )
                    return REM_INT( QUO_INT( i_3, 2 ^ QUO_INT( i_3, hoisted_6_2 ) ), 2 );
                end );
            hoisted_3_2 := deduped_31_2;
            hoisted_8_2 := List( deduped_29_2, function ( logic_new_func_x_3 )
                    return REM_INT( logic_new_func_x_3, hoisted_3_2 );
                end );
            hoisted_7_2 := deduped_27_2;
            hoisted_4_2 := CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. deduped_31_2 ^ deduped_31_2 - 1 ][1 + deduped_31_2 * GeometricSumDiff1( deduped_31_2, deduped_31_2 )] );
            hoisted_2_2 := deduped_29_2;
            return Length( Filtered( deduped_27_2, function ( x_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, hoisted_5_3, hoisted_6_3, hoisted_7_3, deduped_8_3, deduped_9_3, deduped_10_3, deduped_11_3;
                      hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_7_2[1 + x_3] );
                      deduped_11_3 := Filtered( hoisted_2_2, function ( x_4 )
                              return hoisted_9_2[1 + (hoisted_1_3 + hoisted_8_2[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_2_2[(1 + REM_INT( x_4, hoisted_3_2 ))] ))] * hoisted_6_2)] = 1;
                          end );
                      deduped_10_3 := Length( deduped_11_3 );
                      deduped_9_3 := [ 0 .. hoisted_10_2 * deduped_10_3 - 1 ];
                      hoisted_2_3 := deduped_11_3;
                      hoisted_4_3 := List( [ 0 .. deduped_10_3 - 1 ], function ( i_4 )
                              return hoisted_8_2[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                      hoisted_3_3 := deduped_10_3;
                      deduped_8_3 := Filtered( deduped_9_3, function ( x_4 )
                              return hoisted_22_2[1 + REM_INT( x_4, hoisted_10_2 )] = hoisted_4_3[1 + REM_INT( QUO_INT( x_4, hoisted_10_2 ), hoisted_3_3 )];
                          end );
                      hoisted_6_3 := deduped_9_3;
                      hoisted_5_3 := deduped_8_3;
                      hoisted_7_3 := List( [ 0 .. Length( deduped_8_3 ) - 1 ], function ( logic_new_func_x_4 )
                              return hoisted_24_2[1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_6_3[(1 + hoisted_5_3[(1 + logic_new_func_x_4)])] ), hoisted_10_2 )];
                          end );
                      return Sum( List( hoisted_2_2, function ( k_4 )
                                  return IdFunc( function (  )
                                              if (CAP_JIT_INCOMPLETE_LOGIC( hoisted_2_2[1 + REM_INT( QUO_INT( hoisted_4_2, hoisted_3_2 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_2_2[(1 + k_4)] ) ), hoisted_3_2 )] ) in hoisted_7_3) then
                                                  return 1;
                                              else
                                                  return 0;
                                              fi;
                                              return;
                                          end )(  ) * 2 ^ k_4;
                              end ) ) = x_3;
                  end ) );
        end );
    hoisted_12_1 := deduped_21_1;
    hoisted_11_1 := DefiningPairOfUnderlyingQuiver( cat_1 )[2];
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, deduped_26_1, Range, deduped_27_1, ValuesOfPreSheaf, NTuple( 2, deduped_21_1, List( deduped_23_1, function ( m_2 )
                local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, deduped_8_2, deduped_9_2, deduped_10_2, deduped_11_2, deduped_12_2, deduped_13_2;
                deduped_13_2 := hoisted_11_1[m_2];
                deduped_12_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_15_1[m_2] );
                deduped_11_2 := hoisted_16_1[deduped_12_2];
                deduped_10_2 := 1 + deduped_13_2[1];
                deduped_9_2 := 1 + deduped_13_2[2];
                deduped_8_2 := [ 0 .. hoisted_13_1[deduped_9_2] - 1 ];
                hoisted_7_2 := hoisted_14_1[deduped_10_2];
                hoisted_3_2 := hoisted_19_1[deduped_12_2];
                hoisted_2_2 := [ 0 .. hoisted_17_1[deduped_12_2] - 1 ];
                hoisted_1_2 := [ 0 .. deduped_11_2 - 1 ];
                hoisted_6_2 := List( [ 0 .. 2 ^ deduped_11_2 - 1 ], function ( i_3 )
                        local hoisted_1_3;
                        hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                                return REM_INT( QUO_INT( i_3, 2 ^ j_4 ), 2 );
                            end );
                        return Sum( List( hoisted_2_2, function ( k_4 )
                                  return hoisted_20_1[(1 + hoisted_1_3[(1 + hoisted_3_2[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_2_2[(1 + k_4)] ))])])] * 2 ^ k_4;
                              end ) );
                    end );
                hoisted_5_2 := hoisted_14_1[deduped_9_2];
                hoisted_4_2 := deduped_8_2;
                return CreateCapCategoryMorphismWithAttributes( hoisted_10_1, hoisted_12_1[deduped_9_2], hoisted_12_1[deduped_10_2], AsList, List( deduped_8_2, function ( x_3 )
                          return -1 + SafePosition( hoisted_7_2, hoisted_6_2[(1 + hoisted_5_2[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_4_2[(1 + x_3)] ))])] );
                      end ) );
            end ) ) );
end
########
        
    , 100 );
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
end );

BindGlobal( "PreSheavesInSkeletalFinSetsSubobjectClassifierPrecompiled", function ( quiver )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function ( quiver )
    local sFinSets;
    sFinSets := CategoryOfSkeletalFinSets(  : FinalizeCategory := true );
    return PreSheaves( FreeCategory( quiver : range_of_HomStructure := sFinSets,
          FinalizeCategory := true ), sFinSets );
end;
        
        
    
    cat := category_constructor( quiver : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_PreSheavesInSkeletalFinSetsSubobjectClassifierPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
