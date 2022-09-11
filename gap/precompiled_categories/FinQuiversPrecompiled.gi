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
    local hoisted_1_1, hoisted_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_6_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_5_1 := ObjectifyObjectForCAPWithAttributes( rec(
           ), deduped_7_1, Length, 0 );
    hoisted_1_1 := deduped_5_1;
    deduped_4_1 := LazyHList( [ 1 .. deduped_6_1[1] ], function ( o_2 )
            return hoisted_1_1;
        end );
    hoisted_2_1 := ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), deduped_7_1, deduped_5_1, deduped_5_1, AsList, [  ] );
    deduped_3_1 := LazyHList( [ 1 .. Length( deduped_6_1[2] ) ], function ( m_2 )
            return hoisted_2_1;
        end );
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), cat_1, DefiningQuadrupleOfQuiver, NTuple( 4, Length( deduped_4_1[1] ), Length( deduped_4_1[2] ), AsList( deduped_3_1[1] ), AsList( deduped_3_1[2] ) ) );
end
########
        
    , 100 );
    
    ##
    AddCoproduct( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_8_1 := deduped_9_1[2];
    hoisted_3_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_7_1 := LazyHList( [ 1 .. deduped_9_1[1] ], function ( o_2 )
            return ObjectifyObjectForCAPWithAttributes( rec(
                   ), hoisted_3_1, Length, Sum( List( arg2_1, function ( logic_new_func_x_3 )
                        local deduped_1_3;
                        deduped_1_3 := DefiningQuadrupleOfQuiver( logic_new_func_x_3 );
                        return [ ObjectifyObjectForCAPWithAttributes( rec(
                                     ), hoisted_3_1, Length, deduped_1_3[1] ), ObjectifyObjectForCAPWithAttributes( rec(
                                     ), hoisted_3_1, Length, deduped_1_3[2] ) ][o_2];
                    end ), Length ) );
        end );
    hoisted_5_1 := [ 1 .. Length( arg2_1 ) ];
    hoisted_4_1 := deduped_8_1;
    deduped_6_1 := LazyHList( [ 1 .. Length( deduped_8_1 ) ], function ( m_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2;
            deduped_7_2 := hoisted_4_1[m_2];
            hoisted_6_2 := List( arg2_1, function ( logic_new_func_x_3 )
                    local deduped_1_3, deduped_2_3, deduped_3_3;
                    deduped_3_3 := DefiningQuadrupleOfQuiver( logic_new_func_x_3 );
                    deduped_2_3 := ObjectifyObjectForCAPWithAttributes( rec(
                           ), hoisted_3_1, Length, deduped_3_3[1] );
                    deduped_1_3 := ObjectifyObjectForCAPWithAttributes( rec(
                           ), hoisted_3_1, Length, deduped_3_3[2] );
                    return AsList( [ ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                                   ), hoisted_3_1, deduped_1_3, deduped_2_3, AsList, deduped_3_3[3] ), ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                                   ), hoisted_3_1, deduped_1_3, deduped_2_3, AsList, deduped_3_3[4] ) ][m_2] );
                end );
            hoisted_5_2 := List( arg2_1, function ( logic_new_func_x_3 )
                    local deduped_1_3, deduped_2_3, deduped_3_3;
                    deduped_3_3 := DefiningQuadrupleOfQuiver( logic_new_func_x_3 );
                    deduped_2_3 := ObjectifyObjectForCAPWithAttributes( rec(
                           ), hoisted_3_1, Length, deduped_3_3[1] );
                    deduped_1_3 := ObjectifyObjectForCAPWithAttributes( rec(
                           ), hoisted_3_1, Length, deduped_3_3[2] );
                    return Length( Range( [ ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                                     ), hoisted_3_1, deduped_1_3, deduped_2_3, AsList, deduped_3_3[3] ), ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                                     ), hoisted_3_1, deduped_1_3, deduped_2_3, AsList, deduped_3_3[4] ) ][m_2] ) );
                end );
            hoisted_4_2 := List( arg2_1, function ( logic_new_func_x_3 )
                    local deduped_1_3, deduped_2_3, deduped_3_3;
                    deduped_3_3 := DefiningQuadrupleOfQuiver( logic_new_func_x_3 );
                    deduped_2_3 := ObjectifyObjectForCAPWithAttributes( rec(
                           ), hoisted_3_1, Length, deduped_3_3[1] );
                    deduped_1_3 := ObjectifyObjectForCAPWithAttributes( rec(
                           ), hoisted_3_1, Length, deduped_3_3[2] );
                    return Range( [ ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                                   ), hoisted_3_1, deduped_1_3, deduped_2_3, AsList, deduped_3_3[3] ), ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                                   ), hoisted_3_1, deduped_1_3, deduped_2_3, AsList, deduped_3_3[4] ) ][m_2] );
                end );
            hoisted_3_2 := List( arg2_1, function ( logic_new_func_x_3 )
                    local deduped_1_3, deduped_2_3, deduped_3_3;
                    deduped_3_3 := DefiningQuadrupleOfQuiver( logic_new_func_x_3 );
                    deduped_2_3 := ObjectifyObjectForCAPWithAttributes( rec(
                           ), hoisted_3_1, Length, deduped_3_3[1] );
                    deduped_1_3 := ObjectifyObjectForCAPWithAttributes( rec(
                           ), hoisted_3_1, Length, deduped_3_3[2] );
                    return Length( Source( [ ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                                     ), hoisted_3_1, deduped_1_3, deduped_2_3, AsList, deduped_3_3[3] ), ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                                     ), hoisted_3_1, deduped_1_3, deduped_2_3, AsList, deduped_3_3[4] ) ][m_2] ) );
                end );
            hoisted_2_2 := deduped_7_2[2];
            hoisted_1_2 := deduped_7_2[1];
            return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                   ), hoisted_3_1, ObjectifyObjectForCAPWithAttributes( rec(
                     ), hoisted_3_1, Length, Sum( List( arg2_1, function ( logic_new_func_x_3 )
                          local deduped_1_3;
                          deduped_1_3 := DefiningQuadrupleOfQuiver( logic_new_func_x_3 );
                          return [ ObjectifyObjectForCAPWithAttributes( rec(
                                       ), hoisted_3_1, Length, deduped_1_3[1] ), ObjectifyObjectForCAPWithAttributes( rec(
                                       ), hoisted_3_1, Length, deduped_1_3[2] ) ][hoisted_1_2];
                      end ), Length ) ), ObjectifyObjectForCAPWithAttributes( rec(
                     ), hoisted_3_1, Length, Sum( List( arg2_1, function ( logic_new_func_x_3 )
                          local deduped_1_3;
                          deduped_1_3 := DefiningQuadrupleOfQuiver( logic_new_func_x_3 );
                          return [ ObjectifyObjectForCAPWithAttributes( rec(
                                       ), hoisted_3_1, Length, deduped_1_3[1] ), ObjectifyObjectForCAPWithAttributes( rec(
                                       ), hoisted_3_1, Length, deduped_1_3[2] ) ][hoisted_2_2];
                      end ), Length ) ), AsList, Concatenation( List( hoisted_5_1, function ( logic_new_func_x_3 )
                        local hoisted_1_3, hoisted_2_3, deduped_3_3;
                        deduped_3_3 := Sum( hoisted_4_2{[ 1 .. logic_new_func_x_3 - 1 ]}, Length );
                        hoisted_2_3 := [ deduped_3_3 .. deduped_3_3 + hoisted_5_2[logic_new_func_x_3] - 1 ];
                        hoisted_1_3 := hoisted_6_2[logic_new_func_x_3];
                        return List( [ 1 .. hoisted_3_2[logic_new_func_x_3] ], function ( i_4 )
                                return hoisted_2_3[1 + hoisted_1_3[i_4]];
                            end );
                    end ) ) );
        end );
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), cat_1, DefiningQuadrupleOfQuiver, NTuple( 4, Length( deduped_7_1[1] ), Length( deduped_7_1[2] ), AsList( deduped_6_1[1] ), AsList( deduped_6_1[2] ) ) );
end
########
        
    , 100 );
    
    ##
    AddHomomorphismStructureOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1;
    deduped_33_1 := DefiningQuadrupleOfQuiver( arg2_1 );
    deduped_32_1 := DefiningQuadrupleOfQuiver( arg3_1 );
    deduped_31_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_30_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_29_1 := deduped_31_1[2];
    deduped_28_1 := deduped_31_1[1];
    deduped_27_1 := [ 1 .. deduped_28_1 ];
    deduped_26_1 := ObjectifyObjectForCAPWithAttributes( rec(
           ), deduped_30_1, Length, deduped_33_1[2] );
    deduped_25_1 := ObjectifyObjectForCAPWithAttributes( rec(
           ), deduped_30_1, Length, deduped_33_1[1] );
    deduped_24_1 := ObjectifyObjectForCAPWithAttributes( rec(
           ), deduped_30_1, Length, deduped_32_1[2] );
    deduped_23_1 := ObjectifyObjectForCAPWithAttributes( rec(
           ), deduped_30_1, Length, deduped_32_1[1] );
    deduped_22_1 := Length( deduped_29_1 );
    deduped_21_1 := [ 1 .. deduped_22_1 ];
    deduped_20_1 := deduped_22_1 * 2;
    hoisted_4_1 := [ ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
               ), deduped_30_1, deduped_26_1, deduped_25_1, AsList, deduped_33_1[3] ), ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
               ), deduped_30_1, deduped_26_1, deduped_25_1, AsList, deduped_33_1[4] ) ];
    hoisted_3_1 := [ ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
               ), deduped_30_1, deduped_24_1, deduped_23_1, AsList, deduped_32_1[3] ), ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
               ), deduped_30_1, deduped_24_1, deduped_23_1, AsList, deduped_32_1[4] ) ];
    hoisted_2_1 := [ deduped_25_1, deduped_26_1 ];
    hoisted_1_1 := [ deduped_23_1, deduped_24_1 ];
    deduped_19_1 := Concatenation( List( deduped_27_1, function ( logic_new_func_x_2 )
              return Length( hoisted_1_1[logic_new_func_x_2] ) ^ Length( hoisted_2_1[logic_new_func_x_2] );
          end ), List( deduped_21_1, function ( logic_new_func_x_2 )
              return Length( Range( hoisted_3_1[logic_new_func_x_2] ) ) ^ Length( Source( hoisted_4_1[logic_new_func_x_2] ) );
          end ) );
    deduped_18_1 := Product( deduped_19_1 );
    deduped_17_1 := [ 0 .. deduped_18_1 - 1 ];
    hoisted_15_1 := [ 1 .. deduped_18_1 ];
    hoisted_14_1 := deduped_29_1;
    hoisted_7_1 := deduped_17_1;
    hoisted_6_1 := deduped_19_1;
    hoisted_16_1 := Concatenation( List( deduped_21_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, deduped_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2, deduped_23_2, deduped_24_2;
              deduped_24_2 := hoisted_14_1[logic_new_func_x_2];
              deduped_23_2 := hoisted_4_1[logic_new_func_x_2];
              deduped_22_2 := hoisted_3_1[logic_new_func_x_2];
              deduped_21_2 := deduped_24_2[1];
              deduped_20_2 := deduped_24_2[2];
              deduped_19_2 := Length( Source( deduped_23_2 ) );
              deduped_18_2 := Length( Range( deduped_23_2 ) );
              deduped_17_2 := Length( Range( deduped_22_2 ) );
              deduped_16_2 := Length( Source( deduped_22_2 ) );
              hoisted_11_2 := [ 0 .. deduped_17_2 - 1 ];
              hoisted_10_2 := AsList( deduped_23_2 );
              hoisted_9_2 := [ 0 .. deduped_18_2 - 1 ];
              hoisted_4_2 := deduped_17_2;
              hoisted_2_2 := [ 0 .. deduped_19_2 - 1 ];
              hoisted_15_2 := List( [ 0 .. deduped_17_2 ^ deduped_18_2 - 1 ], function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := List( hoisted_9_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_4_2 ^ j_4 ), hoisted_4_2 );
                          end );
                      return Sum( hoisted_2_2, function ( k_4 )
                              return hoisted_11_2[(1 + hoisted_1_3[(1 + hoisted_10_2[(1 + k_4)])])] * hoisted_4_2 ^ k_4;
                          end );
                  end );
              hoisted_13_2 := hoisted_6_1[deduped_20_2];
              hoisted_12_2 := Product( hoisted_6_1{[ 1 .. deduped_20_2 - 1 ]} );
              hoisted_14_2 := List( hoisted_7_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_12_2 ), hoisted_13_2 );
                  end );
              hoisted_3_2 := AsList( deduped_22_2 );
              hoisted_1_2 := deduped_16_2;
              hoisted_8_2 := List( [ 0 .. deduped_16_2 ^ deduped_19_2 - 1 ], function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := List( hoisted_2_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_1_2 ^ j_4 ), hoisted_1_2 );
                          end );
                      return Sum( hoisted_2_2, function ( k_4 )
                              return hoisted_3_2[(1 + hoisted_1_3[(1 + hoisted_2_2[(1 + k_4)])])] * hoisted_4_2 ^ k_4;
                          end );
                  end );
              hoisted_6_2 := hoisted_6_1[deduped_21_2];
              hoisted_5_2 := Product( hoisted_6_1{[ 1 .. deduped_21_2 - 1 ]} );
              hoisted_7_2 := List( hoisted_7_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_5_2 ), hoisted_6_2 );
                  end );
              return [ List( hoisted_15_1, function ( i_3 )
                          return hoisted_8_2[1 + hoisted_7_2[i_3]];
                      end ), List( hoisted_15_1, function ( i_3 )
                          return hoisted_15_2[1 + hoisted_14_2[i_3]];
                      end ) ];
          end ) );
    hoisted_13_1 := [ 1 .. deduped_20_1 ];
    hoisted_9_1 := deduped_30_1;
    hoisted_10_1 := Concatenation( List( deduped_27_1, function ( i_2 )
              return ObjectifyObjectForCAPWithAttributes( rec(
                     ), hoisted_9_1, Length, Length( hoisted_1_1[i_2] ) ^ Length( hoisted_2_1[i_2] ) );
          end ), List( deduped_21_1, function ( logic_new_func_x_2 )
              return ObjectifyObjectForCAPWithAttributes( rec(
                     ), hoisted_9_1, Length, Length( Range( hoisted_3_1[logic_new_func_x_2] ) ) ^ Length( Source( hoisted_4_1[logic_new_func_x_2] ) ) );
          end ) );
    hoisted_5_1 := deduped_28_1;
    hoisted_11_1 := Concatenation( List( deduped_21_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := Length( hoisted_10_1[hoisted_5_1 + logic_new_func_x_2] );
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_12_1 := List( [ 0 .. deduped_20_1 - 1 ], function ( j_2 )
            return Product( hoisted_11_1{[ 1 .. j_2 ]} );
        end );
    hoisted_8_1 := Concatenation( List( deduped_21_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
              deduped_4_2 := hoisted_5_1 + logic_new_func_x_2;
              hoisted_2_2 := hoisted_6_1[deduped_4_2];
              hoisted_1_2 := Product( hoisted_6_1{[ 1 .. deduped_4_2 - 1 ]} );
              deduped_3_2 := List( hoisted_7_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
              return [ deduped_3_2, deduped_3_2 ];
          end ) );
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), deduped_30_1, Length, Length( Filtered( deduped_17_1, function ( x_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + x_2;
                return Sum( hoisted_13_1, function ( j_3 )
                          return hoisted_8_1[j_3][hoisted_1_2] * hoisted_12_1[j_3];
                      end ) = Sum( hoisted_13_1, function ( j_3 )
                          return hoisted_16_1[j_3][hoisted_1_2] * hoisted_12_1[j_3];
                      end );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, hoisted_34_1, hoisted_35_1, hoisted_36_1, hoisted_37_1, hoisted_38_1, hoisted_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1;
    deduped_66_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_65_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_64_1 := DefiningQuadrupleOfQuiver( arg3_1 );
    deduped_63_1 := DefiningQuadrupleOfQuiver( arg2_1 );
    deduped_62_1 := deduped_64_1[2];
    deduped_61_1 := Length( Source( arg4_1 ) );
    deduped_60_1 := deduped_65_1[2];
    deduped_59_1 := deduped_65_1[1];
    deduped_58_1 := deduped_64_1[1];
    deduped_57_1 := deduped_63_1[2];
    deduped_56_1 := deduped_63_1[1];
    deduped_55_1 := [ 1 .. deduped_59_1 ];
    deduped_54_1 := ObjectifyObjectForCAPWithAttributes( rec(
           ), deduped_66_1, Length, deduped_57_1 );
    deduped_53_1 := ObjectifyObjectForCAPWithAttributes( rec(
           ), deduped_66_1, Length, deduped_56_1 );
    deduped_52_1 := deduped_62_1 ^ deduped_57_1;
    deduped_51_1 := ObjectifyObjectForCAPWithAttributes( rec(
           ), deduped_66_1, Length, deduped_62_1 );
    deduped_50_1 := ObjectifyObjectForCAPWithAttributes( rec(
           ), deduped_66_1, Length, deduped_58_1 );
    deduped_49_1 := Length( deduped_60_1 );
    deduped_48_1 := deduped_58_1 ^ deduped_56_1;
    deduped_47_1 := [ 1 .. deduped_49_1 ];
    deduped_46_1 := deduped_49_1 * 2;
    deduped_45_1 := [ 0 .. deduped_61_1 * deduped_57_1 - 1 ];
    deduped_44_1 := [ 0 .. deduped_61_1 * deduped_56_1 - 1 ];
    hoisted_6_1 := [ ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
               ), deduped_66_1, deduped_54_1, deduped_53_1, AsList, deduped_63_1[3] ), ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
               ), deduped_66_1, deduped_54_1, deduped_53_1, AsList, deduped_63_1[4] ) ];
    hoisted_5_1 := [ ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
               ), deduped_66_1, deduped_51_1, deduped_50_1, AsList, deduped_64_1[3] ), ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
               ), deduped_66_1, deduped_51_1, deduped_50_1, AsList, deduped_64_1[4] ) ];
    hoisted_4_1 := [ deduped_53_1, deduped_54_1 ];
    hoisted_3_1 := [ deduped_50_1, deduped_51_1 ];
    deduped_43_1 := Concatenation( List( deduped_55_1, function ( logic_new_func_x_2 )
              return Length( hoisted_3_1[logic_new_func_x_2] ) ^ Length( hoisted_4_1[logic_new_func_x_2] );
          end ), List( deduped_47_1, function ( logic_new_func_x_2 )
              return Length( Range( hoisted_5_1[logic_new_func_x_2] ) ) ^ Length( Source( hoisted_6_1[logic_new_func_x_2] ) );
          end ) );
    hoisted_12_1 := deduped_66_1;
    deduped_42_1 := Concatenation( List( deduped_55_1, function ( i_2 )
              return ObjectifyObjectForCAPWithAttributes( rec(
                     ), hoisted_12_1, Length, Length( hoisted_3_1[i_2] ) ^ Length( hoisted_4_1[i_2] ) );
          end ), List( deduped_47_1, function ( logic_new_func_x_2 )
              return ObjectifyObjectForCAPWithAttributes( rec(
                     ), hoisted_12_1, Length, Length( Range( hoisted_5_1[logic_new_func_x_2] ) ) ^ Length( Source( hoisted_6_1[logic_new_func_x_2] ) ) );
          end ) );
    deduped_41_1 := Product( deduped_43_1 );
    deduped_40_1 := [ 0 .. deduped_41_1 - 1 ];
    hoisted_31_1 := deduped_62_1;
    hoisted_30_1 := deduped_52_1;
    hoisted_39_1 := List( [ 0 .. deduped_52_1 * deduped_57_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_31_1 ^ QUO_INT( i_2, hoisted_30_1 ) ), hoisted_31_1 );
        end );
    hoisted_38_1 := Length( deduped_42_1[2] );
    hoisted_36_1 := deduped_57_1;
    hoisted_20_1 := deduped_61_1;
    hoisted_37_1 := List( deduped_45_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_20_1 ), hoisted_36_1 );
        end );
    hoisted_32_1 := deduped_43_1[2];
    hoisted_7_1 := deduped_43_1[1];
    hoisted_35_1 := List( deduped_40_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_7_1 ), hoisted_32_1 );
        end );
    hoisted_34_1 := List( deduped_45_1, function ( i_2 )
            return REM_INT( i_2, hoisted_20_1 );
        end );
    hoisted_33_1 := [ 0 .. deduped_57_1 - 1 ];
    hoisted_2_1 := deduped_58_1;
    hoisted_1_1 := deduped_48_1;
    hoisted_29_1 := List( [ 0 .. deduped_48_1 * deduped_56_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_2_1 ^ QUO_INT( i_2, hoisted_1_1 ) ), hoisted_2_1 );
        end );
    hoisted_28_1 := Length( deduped_42_1[1] );
    hoisted_26_1 := deduped_56_1;
    hoisted_27_1 := List( deduped_44_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_20_1 ), hoisted_26_1 );
        end );
    hoisted_25_1 := List( deduped_40_1, function ( i_2 )
            return REM_INT( i_2, hoisted_7_1 );
        end );
    hoisted_18_1 := [ 1 .. deduped_41_1 ];
    hoisted_17_1 := deduped_60_1;
    hoisted_10_1 := deduped_40_1;
    hoisted_9_1 := deduped_43_1;
    hoisted_19_1 := Concatenation( List( deduped_47_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, deduped_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2, deduped_23_2, deduped_24_2;
              deduped_24_2 := hoisted_17_1[logic_new_func_x_2];
              deduped_23_2 := hoisted_6_1[logic_new_func_x_2];
              deduped_22_2 := hoisted_5_1[logic_new_func_x_2];
              deduped_21_2 := deduped_24_2[1];
              deduped_20_2 := deduped_24_2[2];
              deduped_19_2 := Length( Source( deduped_23_2 ) );
              deduped_18_2 := Length( Range( deduped_23_2 ) );
              deduped_17_2 := Length( Range( deduped_22_2 ) );
              deduped_16_2 := Length( Source( deduped_22_2 ) );
              hoisted_11_2 := [ 0 .. deduped_17_2 - 1 ];
              hoisted_10_2 := AsList( deduped_23_2 );
              hoisted_9_2 := [ 0 .. deduped_18_2 - 1 ];
              hoisted_4_2 := deduped_17_2;
              hoisted_2_2 := [ 0 .. deduped_19_2 - 1 ];
              hoisted_15_2 := List( [ 0 .. deduped_17_2 ^ deduped_18_2 - 1 ], function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := List( hoisted_9_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_4_2 ^ j_4 ), hoisted_4_2 );
                          end );
                      return Sum( hoisted_2_2, function ( k_4 )
                              return hoisted_11_2[(1 + hoisted_1_3[(1 + hoisted_10_2[(1 + k_4)])])] * hoisted_4_2 ^ k_4;
                          end );
                  end );
              hoisted_13_2 := hoisted_9_1[deduped_20_2];
              hoisted_12_2 := Product( hoisted_9_1{[ 1 .. deduped_20_2 - 1 ]} );
              hoisted_14_2 := List( hoisted_10_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_12_2 ), hoisted_13_2 );
                  end );
              hoisted_3_2 := AsList( deduped_22_2 );
              hoisted_1_2 := deduped_16_2;
              hoisted_8_2 := List( [ 0 .. deduped_16_2 ^ deduped_19_2 - 1 ], function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := List( hoisted_2_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_1_2 ^ j_4 ), hoisted_1_2 );
                          end );
                      return Sum( hoisted_2_2, function ( k_4 )
                              return hoisted_3_2[(1 + hoisted_1_3[(1 + hoisted_2_2[(1 + k_4)])])] * hoisted_4_2 ^ k_4;
                          end );
                  end );
              hoisted_6_2 := hoisted_9_1[deduped_21_2];
              hoisted_5_2 := Product( hoisted_9_1{[ 1 .. deduped_21_2 - 1 ]} );
              hoisted_7_2 := List( hoisted_10_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_5_2 ), hoisted_6_2 );
                  end );
              return [ List( hoisted_18_1, function ( i_3 )
                          return hoisted_8_2[1 + hoisted_7_2[i_3]];
                      end ), List( hoisted_18_1, function ( i_3 )
                          return hoisted_15_2[1 + hoisted_14_2[i_3]];
                      end ) ];
          end ) );
    hoisted_16_1 := [ 1 .. deduped_46_1 ];
    hoisted_13_1 := deduped_42_1;
    hoisted_8_1 := deduped_59_1;
    hoisted_14_1 := Concatenation( List( deduped_47_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := Length( hoisted_13_1[hoisted_8_1 + logic_new_func_x_2] );
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_15_1 := List( [ 0 .. deduped_46_1 - 1 ], function ( j_2 )
            return Product( hoisted_14_1{[ 1 .. j_2 ]} );
        end );
    hoisted_11_1 := Concatenation( List( deduped_47_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
              deduped_4_2 := hoisted_8_1 + logic_new_func_x_2;
              hoisted_2_2 := hoisted_9_1[deduped_4_2];
              hoisted_1_2 := Product( hoisted_9_1{[ 1 .. deduped_4_2 - 1 ]} );
              deduped_3_2 := List( hoisted_10_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
              return [ deduped_3_2, deduped_3_2 ];
          end ) );
    hoisted_24_1 := Filtered( deduped_40_1, function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + x_2;
            return Sum( hoisted_16_1, function ( j_3 )
                      return hoisted_11_1[j_3][hoisted_1_2] * hoisted_15_1[j_3];
                  end ) = Sum( hoisted_16_1, function ( j_3 )
                      return hoisted_19_1[j_3][hoisted_1_2] * hoisted_15_1[j_3];
                  end );
        end );
    hoisted_23_1 := AsList( arg4_1 );
    hoisted_22_1 := List( deduped_44_1, function ( i_2 )
            return REM_INT( i_2, hoisted_20_1 );
        end );
    hoisted_21_1 := [ 0 .. deduped_56_1 - 1 ];
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, arg2_1, arg3_1, DefiningPairOfQuiverMorphism, NTuple( 2, List( [ 1 .. deduped_56_1 ], function ( i_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + hoisted_21_1[i_2];
                return hoisted_29_1[1 + (hoisted_25_1[1 + hoisted_24_1[(1 + hoisted_23_1[(1 + hoisted_22_1[deduped_1_2])])]] + hoisted_21_1[(1 + hoisted_27_1[deduped_1_2])] * hoisted_28_1)];
            end ), List( [ 1 .. deduped_57_1 ], function ( i_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + hoisted_33_1[i_2];
                return hoisted_39_1[1 + (hoisted_35_1[1 + hoisted_24_1[(1 + hoisted_23_1[(1 + hoisted_34_1[deduped_1_2])])]] + hoisted_33_1[(1 + hoisted_37_1[deduped_1_2])] * hoisted_38_1)];
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, hoisted_34_1, hoisted_35_1, hoisted_36_1, hoisted_37_1, hoisted_38_1, hoisted_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1, deduped_68_1;
    deduped_68_1 := DefiningQuadrupleOfQuiver( arg2_1 );
    deduped_67_1 := DefiningQuadrupleOfQuiver( arg3_1 );
    deduped_66_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_65_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_64_1 := deduped_68_1[2];
    deduped_63_1 := deduped_68_1[1];
    deduped_62_1 := deduped_67_1[2];
    deduped_61_1 := deduped_67_1[1];
    deduped_60_1 := deduped_65_1[2];
    deduped_59_1 := deduped_65_1[1];
    deduped_58_1 := [ 1 .. deduped_59_1 ];
    deduped_57_1 := deduped_62_1 ^ deduped_64_1;
    deduped_56_1 := ObjectifyObjectForCAPWithAttributes( rec(
           ), deduped_66_1, Length, deduped_64_1 );
    deduped_55_1 := ObjectifyObjectForCAPWithAttributes( rec(
           ), deduped_66_1, Length, deduped_63_1 );
    deduped_54_1 := deduped_61_1 ^ deduped_63_1;
    deduped_53_1 := ObjectifyObjectForCAPWithAttributes( rec(
           ), deduped_66_1, Length, deduped_62_1 );
    deduped_52_1 := ObjectifyObjectForCAPWithAttributes( rec(
           ), deduped_66_1, Length, deduped_61_1 );
    deduped_51_1 := Length( deduped_60_1 );
    deduped_50_1 := [ 0 .. deduped_64_1 - 1 ];
    deduped_49_1 := [ 0 .. deduped_63_1 - 1 ];
    deduped_48_1 := [ 1 .. deduped_51_1 ];
    deduped_47_1 := deduped_51_1 * 2;
    hoisted_4_1 := [ ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
               ), deduped_66_1, deduped_56_1, deduped_55_1, AsList, deduped_68_1[3] ), ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
               ), deduped_66_1, deduped_56_1, deduped_55_1, AsList, deduped_68_1[4] ) ];
    hoisted_3_1 := [ ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
               ), deduped_66_1, deduped_53_1, deduped_52_1, AsList, deduped_67_1[3] ), ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
               ), deduped_66_1, deduped_53_1, deduped_52_1, AsList, deduped_67_1[4] ) ];
    hoisted_2_1 := [ deduped_55_1, deduped_56_1 ];
    hoisted_1_1 := [ deduped_52_1, deduped_53_1 ];
    deduped_46_1 := Concatenation( List( deduped_58_1, function ( logic_new_func_x_2 )
              return Length( hoisted_1_1[logic_new_func_x_2] ) ^ Length( hoisted_2_1[logic_new_func_x_2] );
          end ), List( deduped_48_1, function ( logic_new_func_x_2 )
              return Length( Range( hoisted_3_1[logic_new_func_x_2] ) ) ^ Length( Source( hoisted_4_1[logic_new_func_x_2] ) );
          end ) );
    hoisted_9_1 := deduped_66_1;
    deduped_45_1 := Concatenation( List( deduped_58_1, function ( i_2 )
              return ObjectifyObjectForCAPWithAttributes( rec(
                     ), hoisted_9_1, Length, Length( hoisted_1_1[i_2] ) ^ Length( hoisted_2_1[i_2] ) );
          end ), List( deduped_48_1, function ( logic_new_func_x_2 )
              return ObjectifyObjectForCAPWithAttributes( rec(
                     ), hoisted_9_1, Length, Length( Range( hoisted_3_1[logic_new_func_x_2] ) ) ^ Length( Source( hoisted_4_1[logic_new_func_x_2] ) ) );
          end ) );
    deduped_44_1 := Product( deduped_46_1 );
    deduped_43_1 := [ 0 .. deduped_44_1 - 1 ];
    hoisted_15_1 := [ 1 .. deduped_44_1 ];
    hoisted_14_1 := deduped_60_1;
    hoisted_7_1 := deduped_43_1;
    hoisted_6_1 := deduped_46_1;
    hoisted_16_1 := Concatenation( List( deduped_48_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, deduped_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2, deduped_23_2, deduped_24_2;
              deduped_24_2 := hoisted_14_1[logic_new_func_x_2];
              deduped_23_2 := hoisted_4_1[logic_new_func_x_2];
              deduped_22_2 := hoisted_3_1[logic_new_func_x_2];
              deduped_21_2 := deduped_24_2[1];
              deduped_20_2 := deduped_24_2[2];
              deduped_19_2 := Length( Source( deduped_23_2 ) );
              deduped_18_2 := Length( Range( deduped_23_2 ) );
              deduped_17_2 := Length( Range( deduped_22_2 ) );
              deduped_16_2 := Length( Source( deduped_22_2 ) );
              hoisted_11_2 := [ 0 .. deduped_17_2 - 1 ];
              hoisted_10_2 := AsList( deduped_23_2 );
              hoisted_9_2 := [ 0 .. deduped_18_2 - 1 ];
              hoisted_4_2 := deduped_17_2;
              hoisted_2_2 := [ 0 .. deduped_19_2 - 1 ];
              hoisted_15_2 := List( [ 0 .. deduped_17_2 ^ deduped_18_2 - 1 ], function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := List( hoisted_9_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_4_2 ^ j_4 ), hoisted_4_2 );
                          end );
                      return Sum( hoisted_2_2, function ( k_4 )
                              return hoisted_11_2[(1 + hoisted_1_3[(1 + hoisted_10_2[(1 + k_4)])])] * hoisted_4_2 ^ k_4;
                          end );
                  end );
              hoisted_13_2 := hoisted_6_1[deduped_20_2];
              hoisted_12_2 := Product( hoisted_6_1{[ 1 .. deduped_20_2 - 1 ]} );
              hoisted_14_2 := List( hoisted_7_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_12_2 ), hoisted_13_2 );
                  end );
              hoisted_3_2 := AsList( deduped_22_2 );
              hoisted_1_2 := deduped_16_2;
              hoisted_8_2 := List( [ 0 .. deduped_16_2 ^ deduped_19_2 - 1 ], function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := List( hoisted_2_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_1_2 ^ j_4 ), hoisted_1_2 );
                          end );
                      return Sum( hoisted_2_2, function ( k_4 )
                              return hoisted_3_2[(1 + hoisted_1_3[(1 + hoisted_2_2[(1 + k_4)])])] * hoisted_4_2 ^ k_4;
                          end );
                  end );
              hoisted_6_2 := hoisted_6_1[deduped_21_2];
              hoisted_5_2 := Product( hoisted_6_1{[ 1 .. deduped_21_2 - 1 ]} );
              hoisted_7_2 := List( hoisted_7_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_5_2 ), hoisted_6_2 );
                  end );
              return [ List( hoisted_15_1, function ( i_3 )
                          return hoisted_8_2[1 + hoisted_7_2[i_3]];
                      end ), List( hoisted_15_1, function ( i_3 )
                          return hoisted_15_2[1 + hoisted_14_2[i_3]];
                      end ) ];
          end ) );
    hoisted_13_1 := [ 1 .. deduped_47_1 ];
    hoisted_10_1 := deduped_45_1;
    hoisted_5_1 := deduped_59_1;
    hoisted_11_1 := Concatenation( List( deduped_48_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := Length( hoisted_10_1[hoisted_5_1 + logic_new_func_x_2] );
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_12_1 := List( [ 0 .. deduped_47_1 - 1 ], function ( j_2 )
            return Product( hoisted_11_1{[ 1 .. j_2 ]} );
        end );
    hoisted_8_1 := Concatenation( List( deduped_48_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
              deduped_4_2 := hoisted_5_1 + logic_new_func_x_2;
              hoisted_2_2 := hoisted_6_1[deduped_4_2];
              hoisted_1_2 := Product( hoisted_6_1{[ 1 .. deduped_4_2 - 1 ]} );
              deduped_3_2 := List( hoisted_7_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
              return [ deduped_3_2, deduped_3_2 ];
          end ) );
    deduped_42_1 := Filtered( deduped_43_1, function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + x_2;
            return Sum( hoisted_13_1, function ( j_3 )
                      return hoisted_8_1[j_3][hoisted_1_2] * hoisted_12_1[j_3];
                  end ) = Sum( hoisted_13_1, function ( j_3 )
                      return hoisted_16_1[j_3][hoisted_1_2] * hoisted_12_1[j_3];
                  end );
        end );
    deduped_41_1 := Length( deduped_42_1 );
    deduped_40_1 := [ 0 .. deduped_41_1 - 1 ];
    hoisted_39_1 := [ 1 .. deduped_64_1 ];
    hoisted_31_1 := deduped_62_1;
    hoisted_30_1 := deduped_57_1;
    hoisted_38_1 := List( [ 0 .. deduped_57_1 * deduped_64_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_31_1 ^ QUO_INT( i_2, hoisted_30_1 ) ), hoisted_31_1 );
        end );
    hoisted_37_1 := Length( deduped_45_1[2] );
    hoisted_34_1 := deduped_64_1;
    hoisted_36_1 := List( deduped_50_1, function ( i_2 )
            return REM_INT( i_2, hoisted_34_1 );
        end );
    hoisted_35_1 := deduped_50_1;
    hoisted_32_1 := deduped_46_1[2];
    hoisted_19_1 := deduped_46_1[1];
    hoisted_33_1 := List( deduped_43_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_19_1 ), hoisted_32_1 );
        end );
    hoisted_29_1 := [ 1 .. deduped_63_1 ];
    hoisted_18_1 := deduped_61_1;
    hoisted_17_1 := deduped_54_1;
    hoisted_28_1 := List( [ 0 .. deduped_54_1 * deduped_63_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_18_1 ^ QUO_INT( i_2, hoisted_17_1 ) ), hoisted_18_1 );
        end );
    hoisted_27_1 := Length( deduped_45_1[1] );
    hoisted_24_1 := deduped_63_1;
    hoisted_26_1 := List( deduped_49_1, function ( i_2 )
            return REM_INT( i_2, hoisted_24_1 );
        end );
    hoisted_25_1 := deduped_49_1;
    hoisted_23_1 := List( deduped_43_1, function ( i_2 )
            return REM_INT( i_2, hoisted_19_1 );
        end );
    hoisted_22_1 := deduped_42_1;
    hoisted_20_1 := deduped_41_1;
    hoisted_21_1 := List( deduped_40_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_20_1 ^ QUO_INT( i_2, hoisted_20_1 ) ), hoisted_20_1 );
        end );
    return List( deduped_40_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + hoisted_22_1[(1 + hoisted_21_1[(1 + logic_new_func_x_2)])];
            hoisted_2_2 := hoisted_33_1[deduped_3_2];
            hoisted_1_2 := hoisted_23_1[deduped_3_2];
            return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                   ), cat_1, arg2_1, arg3_1, DefiningPairOfQuiverMorphism, NTuple( 2, List( hoisted_29_1, function ( i_3 )
                        return hoisted_28_1[1 + (hoisted_1_2 + hoisted_25_1[(1 + hoisted_26_1[(1 + hoisted_25_1[i_3])])] * hoisted_27_1)];
                    end ), List( hoisted_39_1, function ( i_3 )
                        return hoisted_38_1[1 + (hoisted_2_2 + hoisted_35_1[(1 + hoisted_36_1[(1 + hoisted_35_1[i_3])])] * hoisted_37_1)];
                    end ) ) );
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
