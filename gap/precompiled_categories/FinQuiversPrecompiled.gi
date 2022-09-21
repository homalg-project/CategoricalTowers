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
    local deduped_1_1;
    deduped_1_1 := [  ];
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningQuadrupleOfQuiver, NTuple( 4, 0, 0, deduped_1_1, deduped_1_1 ) );
end
########
        
    , 100 );
    
    ##
    AddCoproduct( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := [ 1 .. Length( arg2_1 ) ];
    deduped_8_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return DefiningQuadrupleOfQuiver( logic_new_func_x_2 )[2];
        end );
    deduped_7_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return DefiningQuadrupleOfQuiver( logic_new_func_x_2 )[1];
        end );
    hoisted_6_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return DefiningQuadrupleOfQuiver( logic_new_func_x_2 )[4];
        end );
    hoisted_5_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return DefiningQuadrupleOfQuiver( logic_new_func_x_2 )[3];
        end );
    hoisted_4_1 := deduped_7_1;
    hoisted_3_1 := deduped_8_1;
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningQuadrupleOfQuiver, NTuple( 4, Sum( deduped_7_1 ), Sum( deduped_8_1 ), Concatenation( List( deduped_9_1, function ( logic_new_func_x_2 )
                  local hoisted_1_2, hoisted_2_2, deduped_3_2;
                  deduped_3_2 := Sum( hoisted_4_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
                  hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + hoisted_4_1[logic_new_func_x_2] - 1 ];
                  hoisted_1_2 := hoisted_5_1[logic_new_func_x_2];
                  return List( [ 1 .. hoisted_3_1[logic_new_func_x_2] ], function ( i_3 )
                          return hoisted_2_2[1 + hoisted_1_2[i_3]];
                      end );
              end ) ), Concatenation( List( deduped_9_1, function ( logic_new_func_x_2 )
                  local hoisted_1_2, hoisted_2_2, deduped_3_2;
                  deduped_3_2 := Sum( hoisted_4_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
                  hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + hoisted_4_1[logic_new_func_x_2] - 1 ];
                  hoisted_1_2 := hoisted_6_1[logic_new_func_x_2];
                  return List( [ 1 .. hoisted_3_1[logic_new_func_x_2] ], function ( i_3 )
                          return hoisted_2_2[1 + hoisted_1_2[i_3]];
                      end );
              end ) ) ) );
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
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1;
    deduped_41_1 := DefiningQuadrupleOfQuiver( arg2_1 );
    deduped_40_1 := DefiningQuadrupleOfQuiver( arg3_1 );
    deduped_39_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_38_1 := deduped_41_1[1];
    deduped_37_1 := deduped_40_1[2];
    deduped_36_1 := deduped_41_1[2];
    deduped_35_1 := deduped_40_1[1];
    deduped_34_1 := deduped_39_1[2];
    deduped_33_1 := deduped_39_1[1];
    deduped_32_1 := Length( deduped_34_1 );
    deduped_31_1 := [ 1 .. deduped_32_1 ];
    deduped_30_1 := deduped_32_1 * 2;
    hoisted_2_1 := [ deduped_38_1, deduped_36_1 ];
    hoisted_1_1 := [ deduped_35_1, deduped_37_1 ];
    deduped_29_1 := Concatenation( List( [ 1 .. deduped_33_1 ], function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ hoisted_2_1[logic_new_func_x_2];
          end ), ListWithIdenticalEntries( deduped_32_1, deduped_35_1 ^ deduped_36_1 ) );
    deduped_28_1 := Product( deduped_29_1 );
    deduped_27_1 := [ 1 .. deduped_28_1 ];
    deduped_26_1 := [ 0 .. deduped_28_1 - 1 ];
    hoisted_23_1 := [ 0 .. deduped_35_1 ^ deduped_38_1 - 1 ];
    hoisted_22_1 := [ 0 .. deduped_35_1 - 1 ];
    hoisted_21_1 := [ deduped_41_1[3], deduped_41_1[4] ];
    hoisted_20_1 := [ 0 .. deduped_38_1 - 1 ];
    hoisted_19_1 := deduped_27_1;
    hoisted_18_1 := deduped_34_1;
    hoisted_17_1 := [ 0 .. deduped_37_1 ^ deduped_36_1 - 1 ];
    hoisted_16_1 := deduped_35_1;
    hoisted_15_1 := [ 1 .. deduped_36_1 ];
    hoisted_14_1 := [ 0 .. deduped_36_1 - 1 ];
    hoisted_13_1 := deduped_37_1;
    hoisted_12_1 := [ deduped_40_1[3], deduped_40_1[4] ];
    hoisted_4_1 := deduped_26_1;
    hoisted_3_1 := deduped_29_1;
    hoisted_6_1 := List( [ 1 .. deduped_33_1 + deduped_32_1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_3_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_3_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_4_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_24_1 := Concatenation( List( deduped_31_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2;
              deduped_7_2 := hoisted_18_1[logic_new_func_x_2];
              hoisted_4_2 := hoisted_21_1[logic_new_func_x_2];
              hoisted_6_2 := List( hoisted_23_1, function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_20_1, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_16_1 ^ j_4 ), hoisted_16_1 );
                          end );
                      hoisted_2_3 := List( hoisted_15_1, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_4_2[i_4]];
                          end );
                      hoisted_3_3 := List( hoisted_15_1, function ( i_4 )
                              return hoisted_22_1[1 + hoisted_2_3[i_4]];
                          end );
                      return Sum( List( hoisted_14_1, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_16_1 ^ k_4;
                            end ) );
                  end );
              hoisted_5_2 := hoisted_6_1[deduped_7_2[2]];
              hoisted_1_2 := hoisted_12_1[logic_new_func_x_2];
              hoisted_3_2 := List( hoisted_17_1, function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_14_1, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_13_1 ^ j_4 ), hoisted_13_1 );
                          end );
                      hoisted_2_3 := List( hoisted_15_1, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_14_1[i_4]];
                          end );
                      hoisted_3_3 := List( hoisted_15_1, function ( i_4 )
                              return hoisted_1_2[1 + hoisted_2_3[i_4]];
                          end );
                      return Sum( List( hoisted_14_1, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_16_1 ^ k_4;
                            end ) );
                  end );
              hoisted_2_2 := hoisted_6_1[deduped_7_2[1]];
              return [ List( hoisted_19_1, function ( i_3 )
                          return hoisted_3_2[1 + hoisted_2_2[i_3]];
                      end ), List( hoisted_19_1, function ( i_3 )
                          return hoisted_6_2[1 + hoisted_5_2[i_3]];
                      end ) ];
          end ) );
    hoisted_10_1 := [ 1 .. deduped_30_1 ];
    hoisted_5_1 := deduped_33_1;
    hoisted_8_1 := Concatenation( List( deduped_31_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_3_1[hoisted_5_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_9_1 := List( [ 0 .. deduped_30_1 - 1 ], function ( j_2 )
            return Product( hoisted_8_1{[ 1 .. j_2 ]} );
        end );
    hoisted_25_1 := List( deduped_27_1, function ( i_2 )
            return Sum( hoisted_10_1, function ( j_3 )
                    return hoisted_24_1[j_3][i_2] * hoisted_9_1[j_3];
                end );
        end );
    hoisted_7_1 := Concatenation( List( deduped_31_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_6_1[hoisted_5_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_11_1 := List( deduped_27_1, function ( i_2 )
            return Sum( hoisted_10_1, function ( j_3 )
                    return hoisted_7_1[j_3][i_2] * hoisted_9_1[j_3];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, Length( Filtered( deduped_26_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + x_2;
                return hoisted_11_1[deduped_1_2] = hoisted_25_1[deduped_1_2];
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1;
    deduped_52_1 := DefiningQuadrupleOfQuiver( arg3_1 );
    deduped_51_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_50_1 := DefiningQuadrupleOfQuiver( arg2_1 );
    deduped_49_1 := Length( Source( arg4_1 ) );
    deduped_48_1 := deduped_52_1[2];
    deduped_47_1 := deduped_52_1[1];
    deduped_46_1 := deduped_51_1[1];
    deduped_45_1 := deduped_51_1[2];
    deduped_44_1 := deduped_50_1[2];
    deduped_43_1 := deduped_50_1[1];
    deduped_42_1 := [ 1 .. Length( SetOfObjects( cat_1 ) ) ];
    deduped_41_1 := Length( deduped_45_1 );
    deduped_40_1 := [ 1 .. deduped_41_1 ];
    deduped_39_1 := deduped_41_1 * 2;
    hoisted_3_1 := [ deduped_47_1, deduped_48_1 ];
    hoisted_1_1 := [ deduped_43_1, deduped_44_1 ];
    deduped_38_1 := Concatenation( List( [ 1 .. deduped_46_1 ], function ( logic_new_func_x_2 )
              return hoisted_3_1[logic_new_func_x_2] ^ hoisted_1_1[logic_new_func_x_2];
          end ), ListWithIdenticalEntries( deduped_41_1, deduped_47_1 ^ deduped_44_1 ) );
    deduped_37_1 := Product( deduped_38_1 );
    deduped_36_1 := [ 1 .. deduped_37_1 ];
    deduped_35_1 := [ 0 .. deduped_37_1 - 1 ];
    hoisted_24_1 := [ 0 .. deduped_47_1 ^ deduped_43_1 - 1 ];
    hoisted_23_1 := [ 0 .. deduped_47_1 - 1 ];
    hoisted_22_1 := [ deduped_50_1[3], deduped_50_1[4] ];
    hoisted_21_1 := [ 0 .. deduped_43_1 - 1 ];
    hoisted_20_1 := deduped_36_1;
    hoisted_19_1 := deduped_45_1;
    hoisted_18_1 := [ 0 .. deduped_48_1 ^ deduped_44_1 - 1 ];
    hoisted_17_1 := deduped_47_1;
    hoisted_16_1 := [ 1 .. deduped_44_1 ];
    hoisted_15_1 := [ 0 .. deduped_44_1 - 1 ];
    hoisted_14_1 := deduped_48_1;
    hoisted_13_1 := [ deduped_52_1[3], deduped_52_1[4] ];
    hoisted_5_1 := deduped_35_1;
    hoisted_4_1 := deduped_38_1;
    hoisted_7_1 := List( [ 1 .. deduped_46_1 + deduped_41_1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_4_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_4_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_5_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_25_1 := Concatenation( List( deduped_40_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2;
              deduped_7_2 := hoisted_19_1[logic_new_func_x_2];
              hoisted_4_2 := hoisted_22_1[logic_new_func_x_2];
              hoisted_6_2 := List( hoisted_24_1, function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_21_1, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_17_1 ^ j_4 ), hoisted_17_1 );
                          end );
                      hoisted_2_3 := List( hoisted_16_1, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_4_2[i_4]];
                          end );
                      hoisted_3_3 := List( hoisted_16_1, function ( i_4 )
                              return hoisted_23_1[1 + hoisted_2_3[i_4]];
                          end );
                      return Sum( List( hoisted_15_1, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_17_1 ^ k_4;
                            end ) );
                  end );
              hoisted_5_2 := hoisted_7_1[deduped_7_2[2]];
              hoisted_1_2 := hoisted_13_1[logic_new_func_x_2];
              hoisted_3_2 := List( hoisted_18_1, function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_15_1, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_14_1 ^ j_4 ), hoisted_14_1 );
                          end );
                      hoisted_2_3 := List( hoisted_16_1, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_15_1[i_4]];
                          end );
                      hoisted_3_3 := List( hoisted_16_1, function ( i_4 )
                              return hoisted_1_2[1 + hoisted_2_3[i_4]];
                          end );
                      return Sum( List( hoisted_15_1, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_17_1 ^ k_4;
                            end ) );
                  end );
              hoisted_2_2 := hoisted_7_1[deduped_7_2[1]];
              return [ List( hoisted_20_1, function ( i_3 )
                          return hoisted_3_2[1 + hoisted_2_2[i_3]];
                      end ), List( hoisted_20_1, function ( i_3 )
                          return hoisted_6_2[1 + hoisted_5_2[i_3]];
                      end ) ];
          end ) );
    hoisted_11_1 := [ 1 .. deduped_39_1 ];
    hoisted_6_1 := deduped_46_1;
    hoisted_9_1 := Concatenation( List( deduped_40_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_4_1[hoisted_6_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_10_1 := List( [ 0 .. deduped_39_1 - 1 ], function ( j_2 )
            return Product( hoisted_9_1{[ 1 .. j_2 ]} );
        end );
    hoisted_26_1 := List( deduped_36_1, function ( i_2 )
            return Sum( hoisted_11_1, function ( j_3 )
                    return hoisted_25_1[j_3][i_2] * hoisted_10_1[j_3];
                end );
        end );
    hoisted_8_1 := Concatenation( List( deduped_40_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_7_1[hoisted_6_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_12_1 := List( deduped_36_1, function ( i_2 )
            return Sum( hoisted_11_1, function ( j_3 )
                    return hoisted_8_1[j_3][i_2] * hoisted_10_1[j_3];
                end );
        end );
    deduped_33_1 := Filtered( deduped_35_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + x_2;
            return hoisted_12_1[deduped_1_2] = hoisted_26_1[deduped_1_2];
        end );
    hoisted_32_1 := List( deduped_42_1, function ( logic_new_func_x_2 )
            return hoisted_4_1[logic_new_func_x_2];
        end );
    hoisted_30_1 := [ 1 .. deduped_49_1 ];
    hoisted_29_1 := AsList( arg4_1 );
    hoisted_28_1 := [ 1 .. Length( deduped_33_1 ) ];
    hoisted_27_1 := deduped_33_1;
    hoisted_31_1 := List( deduped_42_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2;
            hoisted_2_2 := hoisted_4_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_4_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_5_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            hoisted_4_2 := List( hoisted_28_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_27_1[i_3]];
                end );
            return List( hoisted_30_1, function ( i_3 )
                    return hoisted_4_2[1 + hoisted_29_1[i_3]];
                end );
        end );
    hoisted_2_1 := deduped_49_1;
    deduped_34_1 := List( deduped_42_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, deduped_14_2, deduped_15_2, deduped_16_2, deduped_17_2, deduped_18_2, deduped_19_2;
            deduped_19_2 := hoisted_3_1[logic_new_func_x_2];
            deduped_18_2 := hoisted_1_1[logic_new_func_x_2];
            deduped_17_2 := hoisted_2_1 * deduped_18_2;
            deduped_16_2 := deduped_19_2 ^ deduped_18_2;
            deduped_15_2 := [ 1 .. deduped_17_2 ];
            deduped_14_2 := [ 0 .. deduped_17_2 - 1 ];
            hoisted_2_2 := deduped_19_2;
            hoisted_1_2 := deduped_16_2;
            hoisted_12_2 := List( [ 0 .. deduped_16_2 * deduped_18_2 - 1 ], function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_2_2 ^ QUO_INT( i_3, hoisted_1_2 ) ), hoisted_2_2 );
                end );
            hoisted_10_2 := hoisted_32_1[logic_new_func_x_2];
            hoisted_8_2 := [ 0 .. deduped_18_2 - 1 ];
            hoisted_6_2 := deduped_18_2;
            hoisted_7_2 := List( deduped_14_2, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_2_1 ), hoisted_6_2 );
                end );
            hoisted_9_2 := List( deduped_15_2, function ( i_3 )
                    return hoisted_8_2[1 + hoisted_7_2[i_3]];
                end );
            hoisted_4_2 := hoisted_31_1[logic_new_func_x_2];
            hoisted_3_2 := List( deduped_14_2, function ( i_3 )
                    return REM_INT( i_3, hoisted_2_1 );
                end );
            hoisted_5_2 := List( deduped_15_2, function ( i_3 )
                    return hoisted_4_2[1 + hoisted_3_2[i_3]];
                end );
            hoisted_11_2 := List( deduped_15_2, function ( i_3 )
                    return hoisted_5_2[i_3] + hoisted_9_2[i_3] * hoisted_10_2;
                end );
            hoisted_13_2 := List( deduped_15_2, function ( i_3 )
                    return hoisted_12_2[1 + hoisted_11_2[i_3]];
                end );
            return List( [ 1 .. deduped_18_2 ], function ( i_3 )
                    return hoisted_13_2[1 + hoisted_8_2[i_3]];
                end );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfQuiverMorphism, NTuple( 2, deduped_34_1[1], deduped_34_1[2] ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1;
    deduped_51_1 := DefiningQuadrupleOfQuiver( arg2_1 );
    deduped_50_1 := DefiningQuadrupleOfQuiver( arg3_1 );
    deduped_49_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_48_1 := deduped_51_1[1];
    deduped_47_1 := deduped_50_1[2];
    deduped_46_1 := deduped_51_1[2];
    deduped_45_1 := deduped_50_1[1];
    deduped_44_1 := deduped_49_1[2];
    deduped_43_1 := deduped_49_1[1];
    deduped_42_1 := [ 1 .. Length( SetOfObjects( cat_1 ) ) ];
    deduped_41_1 := Length( deduped_44_1 );
    deduped_40_1 := [ 1 .. deduped_41_1 ];
    deduped_39_1 := deduped_41_1 * 2;
    hoisted_2_1 := [ deduped_48_1, deduped_46_1 ];
    hoisted_1_1 := [ deduped_45_1, deduped_47_1 ];
    deduped_38_1 := Concatenation( List( [ 1 .. deduped_43_1 ], function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ hoisted_2_1[logic_new_func_x_2];
          end ), ListWithIdenticalEntries( deduped_41_1, deduped_45_1 ^ deduped_46_1 ) );
    deduped_37_1 := Product( deduped_38_1 );
    deduped_36_1 := [ 1 .. deduped_37_1 ];
    deduped_35_1 := [ 0 .. deduped_37_1 - 1 ];
    hoisted_23_1 := [ 0 .. deduped_45_1 ^ deduped_48_1 - 1 ];
    hoisted_22_1 := [ 0 .. deduped_45_1 - 1 ];
    hoisted_21_1 := [ deduped_51_1[3], deduped_51_1[4] ];
    hoisted_20_1 := [ 0 .. deduped_48_1 - 1 ];
    hoisted_19_1 := deduped_36_1;
    hoisted_18_1 := deduped_44_1;
    hoisted_17_1 := [ 0 .. deduped_47_1 ^ deduped_46_1 - 1 ];
    hoisted_16_1 := deduped_45_1;
    hoisted_15_1 := [ 1 .. deduped_46_1 ];
    hoisted_14_1 := [ 0 .. deduped_46_1 - 1 ];
    hoisted_13_1 := deduped_47_1;
    hoisted_12_1 := [ deduped_50_1[3], deduped_50_1[4] ];
    hoisted_4_1 := deduped_35_1;
    hoisted_3_1 := deduped_38_1;
    hoisted_6_1 := List( [ 1 .. deduped_43_1 + deduped_41_1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_3_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_3_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_4_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_24_1 := Concatenation( List( deduped_40_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2;
              deduped_7_2 := hoisted_18_1[logic_new_func_x_2];
              hoisted_4_2 := hoisted_21_1[logic_new_func_x_2];
              hoisted_6_2 := List( hoisted_23_1, function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_20_1, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_16_1 ^ j_4 ), hoisted_16_1 );
                          end );
                      hoisted_2_3 := List( hoisted_15_1, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_4_2[i_4]];
                          end );
                      hoisted_3_3 := List( hoisted_15_1, function ( i_4 )
                              return hoisted_22_1[1 + hoisted_2_3[i_4]];
                          end );
                      return Sum( List( hoisted_14_1, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_16_1 ^ k_4;
                            end ) );
                  end );
              hoisted_5_2 := hoisted_6_1[deduped_7_2[2]];
              hoisted_1_2 := hoisted_12_1[logic_new_func_x_2];
              hoisted_3_2 := List( hoisted_17_1, function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_14_1, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_13_1 ^ j_4 ), hoisted_13_1 );
                          end );
                      hoisted_2_3 := List( hoisted_15_1, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_14_1[i_4]];
                          end );
                      hoisted_3_3 := List( hoisted_15_1, function ( i_4 )
                              return hoisted_1_2[1 + hoisted_2_3[i_4]];
                          end );
                      return Sum( List( hoisted_14_1, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_16_1 ^ k_4;
                            end ) );
                  end );
              hoisted_2_2 := hoisted_6_1[deduped_7_2[1]];
              return [ List( hoisted_19_1, function ( i_3 )
                          return hoisted_3_2[1 + hoisted_2_2[i_3]];
                      end ), List( hoisted_19_1, function ( i_3 )
                          return hoisted_6_2[1 + hoisted_5_2[i_3]];
                      end ) ];
          end ) );
    hoisted_10_1 := [ 1 .. deduped_39_1 ];
    hoisted_5_1 := deduped_43_1;
    hoisted_8_1 := Concatenation( List( deduped_40_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_3_1[hoisted_5_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_9_1 := List( [ 0 .. deduped_39_1 - 1 ], function ( j_2 )
            return Product( hoisted_8_1{[ 1 .. j_2 ]} );
        end );
    hoisted_25_1 := List( deduped_36_1, function ( i_2 )
            return Sum( hoisted_10_1, function ( j_3 )
                    return hoisted_24_1[j_3][i_2] * hoisted_9_1[j_3];
                end );
        end );
    hoisted_7_1 := Concatenation( List( deduped_40_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_6_1[hoisted_5_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_11_1 := List( deduped_36_1, function ( i_2 )
            return Sum( hoisted_10_1, function ( j_3 )
                    return hoisted_7_1[j_3][i_2] * hoisted_9_1[j_3];
                end );
        end );
    deduped_34_1 := Filtered( deduped_35_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + x_2;
            return hoisted_11_1[deduped_1_2] = hoisted_25_1[deduped_1_2];
        end );
    deduped_33_1 := Length( deduped_34_1 );
    deduped_32_1 := [ 0 .. deduped_33_1 - 1 ];
    hoisted_31_1 := List( deduped_42_1, function ( logic_new_func_x_2 )
            return hoisted_3_1[logic_new_func_x_2];
        end );
    hoisted_30_1 := deduped_42_1;
    hoisted_29_1 := deduped_34_1;
    hoisted_28_1 := [ 1 .. deduped_33_1 ];
    hoisted_26_1 := deduped_33_1;
    hoisted_27_1 := List( deduped_32_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_26_1 ^ QUO_INT( i_2, hoisted_26_1 ) ), hoisted_26_1 );
        end );
    return List( deduped_32_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            hoisted_1_2 := hoisted_4_1[1 + hoisted_29_1[hoisted_28_1[(1 + hoisted_27_1[(1 + logic_new_func_x_2)])]]];
            hoisted_2_2 := List( hoisted_30_1, function ( logic_new_func_x_3 )
                    return [ REM_INT( QUO_INT( hoisted_1_2, Product( hoisted_3_1{[ 1 .. logic_new_func_x_3 - 1 ]} ) ), hoisted_3_1[logic_new_func_x_3] ) ];
                end );
            deduped_3_2 := List( hoisted_30_1, function ( logic_new_func_x_3 )
                    local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, hoisted_5_3, hoisted_6_3, hoisted_7_3, hoisted_8_3, hoisted_9_3, hoisted_10_3, hoisted_11_3, deduped_12_3, deduped_13_3, deduped_14_3, deduped_15_3, deduped_16_3;
                    deduped_16_3 := hoisted_1_1[logic_new_func_x_3];
                    deduped_15_3 := hoisted_2_1[logic_new_func_x_3];
                    deduped_14_3 := [ 1 .. deduped_15_3 ];
                    deduped_13_3 := deduped_16_3 ^ deduped_15_3;
                    deduped_12_3 := [ 0 .. deduped_15_3 - 1 ];
                    hoisted_2_3 := deduped_16_3;
                    hoisted_1_3 := deduped_13_3;
                    hoisted_10_3 := List( [ 0 .. deduped_13_3 * deduped_15_3 - 1 ], function ( i_4 )
                            return REM_INT( QUO_INT( i_4, hoisted_2_3 ^ QUO_INT( i_4, hoisted_1_3 ) ), hoisted_2_3 );
                        end );
                    hoisted_8_3 := hoisted_2_2[logic_new_func_x_3][1];
                    hoisted_7_3 := hoisted_31_1[logic_new_func_x_3];
                    hoisted_5_3 := deduped_12_3;
                    hoisted_3_3 := deduped_15_3;
                    hoisted_4_3 := List( deduped_12_3, function ( i_4 )
                            return REM_INT( i_4, hoisted_3_3 );
                        end );
                    hoisted_6_3 := List( deduped_14_3, function ( i_4 )
                            return hoisted_5_3[1 + hoisted_4_3[i_4]];
                        end );
                    hoisted_9_3 := List( deduped_14_3, function ( i_4 )
                            return hoisted_8_3 + hoisted_6_3[i_4] * hoisted_7_3;
                        end );
                    hoisted_11_3 := List( deduped_14_3, function ( i_4 )
                            return hoisted_10_3[1 + hoisted_9_3[i_4]];
                        end );
                    return List( deduped_14_3, function ( i_4 )
                            return hoisted_11_3[1 + hoisted_5_3[i_4]];
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
