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
    local hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1;
    deduped_7_1 := [ 1 .. Length( arg2_1 ) ];
    hoisted_6_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return DefiningQuadrupleOfQuiver( logic_new_func_x_2 )[4];
        end );
    hoisted_5_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return DefiningQuadrupleOfQuiver( logic_new_func_x_2 )[3];
        end );
    hoisted_4_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return DefiningQuadrupleOfQuiver( logic_new_func_x_2 )[1];
        end );
    hoisted_3_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return DefiningQuadrupleOfQuiver( logic_new_func_x_2 )[2];
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningQuadrupleOfQuiver, NTuple( 4, Sum( arg2_1, function ( logic_new_func_x_2 )
                return DefiningQuadrupleOfQuiver( logic_new_func_x_2 )[1];
            end ), Sum( arg2_1, function ( logic_new_func_x_2 )
                return DefiningQuadrupleOfQuiver( logic_new_func_x_2 )[2];
            end ), Concatenation( List( deduped_7_1, function ( logic_new_func_x_2 )
                  local hoisted_1_2, hoisted_2_2, deduped_3_2;
                  deduped_3_2 := Sum( hoisted_4_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
                  hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + hoisted_4_1[logic_new_func_x_2] - 1 ];
                  hoisted_1_2 := hoisted_5_1[logic_new_func_x_2];
                  return List( [ 1 .. hoisted_3_1[logic_new_func_x_2] ], function ( i_3 )
                          return hoisted_2_2[1 + hoisted_1_2[i_3]];
                      end );
              end ) ), Concatenation( List( deduped_7_1, function ( logic_new_func_x_2 )
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
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1;
    deduped_36_1 := DefiningQuadrupleOfQuiver( arg2_1 );
    deduped_35_1 := DefiningQuadrupleOfQuiver( arg3_1 );
    deduped_34_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_33_1 := deduped_36_1[1];
    deduped_32_1 := deduped_35_1[2];
    deduped_31_1 := deduped_36_1[2];
    deduped_30_1 := deduped_35_1[1];
    deduped_29_1 := deduped_34_1[2];
    deduped_28_1 := deduped_34_1[1];
    deduped_27_1 := Length( deduped_29_1 );
    deduped_26_1 := [ 1 .. deduped_27_1 ];
    deduped_25_1 := deduped_27_1 * 2;
    hoisted_2_1 := [ deduped_33_1, deduped_31_1 ];
    hoisted_1_1 := [ deduped_30_1, deduped_32_1 ];
    deduped_24_1 := Concatenation( List( [ 1 .. deduped_28_1 ], function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ hoisted_2_1[logic_new_func_x_2];
          end ), ListWithIdenticalEntries( deduped_27_1, deduped_30_1 ^ deduped_31_1 ) );
    deduped_23_1 := Product( deduped_24_1 );
    deduped_22_1 := [ 0 .. deduped_23_1 - 1 ];
    hoisted_20_1 := [ 0 .. deduped_30_1 ^ deduped_33_1 - 1 ];
    hoisted_19_1 := [ 0 .. deduped_30_1 - 1 ];
    hoisted_18_1 := [ deduped_36_1[3], deduped_36_1[4] ];
    hoisted_17_1 := [ 0 .. deduped_33_1 - 1 ];
    hoisted_16_1 := [ 1 .. deduped_23_1 ];
    hoisted_15_1 := deduped_29_1;
    hoisted_14_1 := [ 0 .. deduped_32_1 ^ deduped_31_1 - 1 ];
    hoisted_13_1 := deduped_30_1;
    hoisted_12_1 := [ 0 .. deduped_31_1 - 1 ];
    hoisted_11_1 := deduped_32_1;
    hoisted_10_1 := [ deduped_35_1[3], deduped_35_1[4] ];
    hoisted_5_1 := deduped_22_1;
    hoisted_4_1 := deduped_24_1;
    hoisted_21_1 := Concatenation( List( deduped_26_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, deduped_11_2, deduped_12_2, deduped_13_2;
              deduped_13_2 := hoisted_15_1[logic_new_func_x_2];
              deduped_12_2 := deduped_13_2[2];
              deduped_11_2 := deduped_13_2[1];
              hoisted_6_2 := hoisted_18_1[logic_new_func_x_2];
              hoisted_10_2 := List( hoisted_20_1, function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := List( hoisted_17_1, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_13_1 ^ j_4 ), hoisted_13_1 );
                          end );
                      return Sum( hoisted_12_1, function ( k_4 )
                              return hoisted_19_1[(1 + hoisted_1_3[(1 + hoisted_6_2[(1 + k_4)])])] * hoisted_13_1 ^ k_4;
                          end );
                  end );
              hoisted_8_2 := hoisted_4_1[deduped_12_2];
              hoisted_7_2 := Product( hoisted_4_1{[ 1 .. deduped_12_2 - 1 ]} );
              hoisted_9_2 := List( hoisted_5_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_7_2 ), hoisted_8_2 );
                  end );
              hoisted_1_2 := hoisted_10_1[logic_new_func_x_2];
              hoisted_5_2 := List( hoisted_14_1, function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := List( hoisted_12_1, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_11_1 ^ j_4 ), hoisted_11_1 );
                          end );
                      return Sum( hoisted_12_1, function ( k_4 )
                              return hoisted_1_2[(1 + hoisted_1_3[(1 + hoisted_12_1[(1 + k_4)])])] * hoisted_13_1 ^ k_4;
                          end );
                  end );
              hoisted_3_2 := hoisted_4_1[deduped_11_2];
              hoisted_2_2 := Product( hoisted_4_1{[ 1 .. deduped_11_2 - 1 ]} );
              hoisted_4_2 := List( hoisted_5_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_2_2 ), hoisted_3_2 );
                  end );
              return [ List( hoisted_16_1, function ( i_3 )
                          return hoisted_5_2[1 + hoisted_4_2[i_3]];
                      end ), List( hoisted_16_1, function ( i_3 )
                          return hoisted_10_2[1 + hoisted_9_2[i_3]];
                      end ) ];
          end ) );
    hoisted_9_1 := [ 1 .. deduped_25_1 ];
    hoisted_3_1 := deduped_28_1;
    hoisted_7_1 := Concatenation( List( deduped_26_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_4_1[hoisted_3_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_8_1 := List( [ 0 .. deduped_25_1 - 1 ], function ( j_2 )
            return Product( hoisted_7_1{[ 1 .. j_2 ]} );
        end );
    hoisted_6_1 := Concatenation( List( deduped_26_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
              deduped_4_2 := hoisted_3_1 + logic_new_func_x_2;
              hoisted_2_2 := hoisted_4_1[deduped_4_2];
              hoisted_1_2 := Product( hoisted_4_1{[ 1 .. deduped_4_2 - 1 ]} );
              deduped_3_2 := List( hoisted_5_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
              return [ deduped_3_2, deduped_3_2 ];
          end ) );
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, Length( Filtered( deduped_22_1, function ( x_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + x_2;
                return Sum( hoisted_9_1, function ( j_3 )
                          return hoisted_6_1[j_3][hoisted_1_2] * hoisted_8_1[j_3];
                      end ) = Sum( hoisted_9_1, function ( j_3 )
                          return hoisted_21_1[j_3][hoisted_1_2] * hoisted_8_1[j_3];
                      end );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, hoisted_34_1, hoisted_35_1, hoisted_36_1, hoisted_37_1, hoisted_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1;
    deduped_58_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_57_1 := DefiningQuadrupleOfQuiver( arg3_1 );
    deduped_56_1 := DefiningQuadrupleOfQuiver( arg2_1 );
    deduped_55_1 := Length( Source( arg4_1 ) );
    deduped_54_1 := deduped_58_1[1];
    deduped_53_1 := deduped_57_1[2];
    deduped_52_1 := deduped_58_1[2];
    deduped_51_1 := deduped_57_1[1];
    deduped_50_1 := deduped_56_1[2];
    deduped_49_1 := deduped_56_1[1];
    deduped_48_1 := deduped_53_1 ^ deduped_50_1;
    deduped_47_1 := Length( deduped_52_1 );
    deduped_46_1 := deduped_51_1 ^ deduped_49_1;
    deduped_45_1 := [ 1 .. deduped_47_1 ];
    deduped_44_1 := deduped_47_1 * 2;
    deduped_43_1 := [ 0 .. deduped_55_1 * deduped_50_1 - 1 ];
    deduped_42_1 := [ 0 .. deduped_55_1 * deduped_49_1 - 1 ];
    hoisted_4_1 := [ deduped_49_1, deduped_50_1 ];
    hoisted_3_1 := [ deduped_51_1, deduped_53_1 ];
    deduped_41_1 := Concatenation( List( [ 1 .. deduped_54_1 ], function ( logic_new_func_x_2 )
              return hoisted_3_1[logic_new_func_x_2] ^ hoisted_4_1[logic_new_func_x_2];
          end ), ListWithIdenticalEntries( deduped_47_1, deduped_51_1 ^ deduped_50_1 ) );
    deduped_40_1 := Product( deduped_41_1 );
    deduped_39_1 := [ 0 .. deduped_40_1 - 1 ];
    hoisted_32_1 := deduped_48_1;
    hoisted_14_1 := deduped_53_1;
    hoisted_38_1 := List( [ 0 .. deduped_48_1 * deduped_50_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_14_1 ^ QUO_INT( i_2, hoisted_32_1 ) ), hoisted_14_1 );
        end );
    hoisted_36_1 := deduped_50_1;
    hoisted_24_1 := deduped_55_1;
    hoisted_37_1 := List( deduped_43_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_24_1 ), hoisted_36_1 );
        end );
    hoisted_33_1 := deduped_41_1[2];
    hoisted_5_1 := deduped_41_1[1];
    hoisted_35_1 := List( deduped_39_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_5_1 ), hoisted_33_1 );
        end );
    hoisted_34_1 := List( deduped_43_1, function ( i_2 )
            return REM_INT( i_2, hoisted_24_1 );
        end );
    hoisted_2_1 := deduped_51_1;
    hoisted_1_1 := deduped_46_1;
    hoisted_31_1 := List( [ 0 .. deduped_46_1 * deduped_49_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_2_1 ^ QUO_INT( i_2, hoisted_1_1 ) ), hoisted_2_1 );
        end );
    hoisted_29_1 := deduped_49_1;
    hoisted_30_1 := List( deduped_42_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_24_1 ), hoisted_29_1 );
        end );
    hoisted_28_1 := List( deduped_39_1, function ( i_2 )
            return REM_INT( i_2, hoisted_5_1 );
        end );
    hoisted_22_1 := [ 0 .. deduped_46_1 - 1 ];
    hoisted_21_1 := [ 0 .. deduped_51_1 - 1 ];
    hoisted_20_1 := [ deduped_56_1[3], deduped_56_1[4] ];
    hoisted_19_1 := [ 0 .. deduped_49_1 - 1 ];
    hoisted_18_1 := [ 1 .. deduped_40_1 ];
    hoisted_17_1 := deduped_52_1;
    hoisted_16_1 := [ 0 .. deduped_48_1 - 1 ];
    hoisted_15_1 := [ 0 .. deduped_50_1 - 1 ];
    hoisted_13_1 := [ deduped_57_1[3], deduped_57_1[4] ];
    hoisted_8_1 := deduped_39_1;
    hoisted_7_1 := deduped_41_1;
    hoisted_23_1 := Concatenation( List( deduped_45_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, deduped_11_2, deduped_12_2, deduped_13_2;
              deduped_13_2 := hoisted_17_1[logic_new_func_x_2];
              deduped_12_2 := deduped_13_2[2];
              deduped_11_2 := deduped_13_2[1];
              hoisted_6_2 := hoisted_20_1[logic_new_func_x_2];
              hoisted_10_2 := List( hoisted_22_1, function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := List( hoisted_19_1, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_2_1 ^ j_4 ), hoisted_2_1 );
                          end );
                      return Sum( hoisted_15_1, function ( k_4 )
                              return hoisted_21_1[(1 + hoisted_1_3[(1 + hoisted_6_2[(1 + k_4)])])] * hoisted_2_1 ^ k_4;
                          end );
                  end );
              hoisted_8_2 := hoisted_7_1[deduped_12_2];
              hoisted_7_2 := Product( hoisted_7_1{[ 1 .. deduped_12_2 - 1 ]} );
              hoisted_9_2 := List( hoisted_8_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_7_2 ), hoisted_8_2 );
                  end );
              hoisted_1_2 := hoisted_13_1[logic_new_func_x_2];
              hoisted_5_2 := List( hoisted_16_1, function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := List( hoisted_15_1, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_14_1 ^ j_4 ), hoisted_14_1 );
                          end );
                      return Sum( hoisted_15_1, function ( k_4 )
                              return hoisted_1_2[(1 + hoisted_1_3[(1 + hoisted_15_1[(1 + k_4)])])] * hoisted_2_1 ^ k_4;
                          end );
                  end );
              hoisted_3_2 := hoisted_7_1[deduped_11_2];
              hoisted_2_2 := Product( hoisted_7_1{[ 1 .. deduped_11_2 - 1 ]} );
              hoisted_4_2 := List( hoisted_8_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_2_2 ), hoisted_3_2 );
                  end );
              return [ List( hoisted_18_1, function ( i_3 )
                          return hoisted_5_2[1 + hoisted_4_2[i_3]];
                      end ), List( hoisted_18_1, function ( i_3 )
                          return hoisted_10_2[1 + hoisted_9_2[i_3]];
                      end ) ];
          end ) );
    hoisted_12_1 := [ 1 .. deduped_44_1 ];
    hoisted_6_1 := deduped_54_1;
    hoisted_10_1 := Concatenation( List( deduped_45_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_7_1[hoisted_6_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_11_1 := List( [ 0 .. deduped_44_1 - 1 ], function ( j_2 )
            return Product( hoisted_10_1{[ 1 .. j_2 ]} );
        end );
    hoisted_9_1 := Concatenation( List( deduped_45_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
              deduped_4_2 := hoisted_6_1 + logic_new_func_x_2;
              hoisted_2_2 := hoisted_7_1[deduped_4_2];
              hoisted_1_2 := Product( hoisted_7_1{[ 1 .. deduped_4_2 - 1 ]} );
              deduped_3_2 := List( hoisted_8_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
              return [ deduped_3_2, deduped_3_2 ];
          end ) );
    hoisted_27_1 := Filtered( deduped_39_1, function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + x_2;
            return Sum( hoisted_12_1, function ( j_3 )
                      return hoisted_9_1[j_3][hoisted_1_2] * hoisted_11_1[j_3];
                  end ) = Sum( hoisted_12_1, function ( j_3 )
                      return hoisted_23_1[j_3][hoisted_1_2] * hoisted_11_1[j_3];
                  end );
        end );
    hoisted_26_1 := AsList( arg4_1 );
    hoisted_25_1 := List( deduped_42_1, function ( i_2 )
            return REM_INT( i_2, hoisted_24_1 );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfQuiverMorphism, NTuple( 2, List( [ 1 .. deduped_49_1 ], function ( i_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + hoisted_19_1[i_2];
                return hoisted_31_1[1 + (hoisted_28_1[1 + hoisted_27_1[(1 + hoisted_26_1[(1 + hoisted_25_1[deduped_1_2])])]] + hoisted_19_1[(1 + hoisted_30_1[deduped_1_2])] * hoisted_5_1)];
            end ), List( [ 1 .. deduped_50_1 ], function ( i_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + hoisted_15_1[i_2];
                return hoisted_38_1[1 + (hoisted_35_1[1 + hoisted_27_1[(1 + hoisted_26_1[(1 + hoisted_34_1[deduped_1_2])])]] + hoisted_15_1[(1 + hoisted_37_1[deduped_1_2])] * hoisted_33_1)];
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, hoisted_34_1, hoisted_35_1, hoisted_36_1, hoisted_37_1, hoisted_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1;
    deduped_60_1 := DefiningQuadrupleOfQuiver( arg2_1 );
    deduped_59_1 := DefiningQuadrupleOfQuiver( arg3_1 );
    deduped_58_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_57_1 := deduped_60_1[1];
    deduped_56_1 := deduped_59_1[2];
    deduped_55_1 := deduped_60_1[2];
    deduped_54_1 := deduped_59_1[1];
    deduped_53_1 := deduped_58_1[2];
    deduped_52_1 := deduped_58_1[1];
    deduped_51_1 := deduped_54_1 ^ deduped_57_1;
    deduped_50_1 := deduped_56_1 ^ deduped_55_1;
    deduped_49_1 := Length( deduped_53_1 );
    deduped_48_1 := [ 1 .. deduped_49_1 ];
    deduped_47_1 := [ 0 .. deduped_57_1 - 1 ];
    deduped_46_1 := [ 0 .. deduped_55_1 - 1 ];
    deduped_45_1 := deduped_49_1 * 2;
    hoisted_2_1 := [ deduped_57_1, deduped_55_1 ];
    hoisted_1_1 := [ deduped_54_1, deduped_56_1 ];
    deduped_44_1 := Concatenation( List( [ 1 .. deduped_52_1 ], function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ hoisted_2_1[logic_new_func_x_2];
          end ), ListWithIdenticalEntries( deduped_49_1, deduped_54_1 ^ deduped_55_1 ) );
    deduped_43_1 := Product( deduped_44_1 );
    deduped_42_1 := [ 0 .. deduped_43_1 - 1 ];
    hoisted_20_1 := [ 0 .. deduped_51_1 - 1 ];
    hoisted_19_1 := [ 0 .. deduped_54_1 - 1 ];
    hoisted_18_1 := [ deduped_60_1[3], deduped_60_1[4] ];
    hoisted_17_1 := deduped_47_1;
    hoisted_16_1 := [ 1 .. deduped_43_1 ];
    hoisted_15_1 := deduped_53_1;
    hoisted_14_1 := [ 0 .. deduped_50_1 - 1 ];
    hoisted_13_1 := deduped_54_1;
    hoisted_12_1 := deduped_46_1;
    hoisted_11_1 := deduped_56_1;
    hoisted_10_1 := [ deduped_59_1[3], deduped_59_1[4] ];
    hoisted_5_1 := deduped_42_1;
    hoisted_4_1 := deduped_44_1;
    hoisted_21_1 := Concatenation( List( deduped_48_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, deduped_11_2, deduped_12_2, deduped_13_2;
              deduped_13_2 := hoisted_15_1[logic_new_func_x_2];
              deduped_12_2 := deduped_13_2[2];
              deduped_11_2 := deduped_13_2[1];
              hoisted_6_2 := hoisted_18_1[logic_new_func_x_2];
              hoisted_10_2 := List( hoisted_20_1, function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := List( hoisted_17_1, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_13_1 ^ j_4 ), hoisted_13_1 );
                          end );
                      return Sum( hoisted_12_1, function ( k_4 )
                              return hoisted_19_1[(1 + hoisted_1_3[(1 + hoisted_6_2[(1 + k_4)])])] * hoisted_13_1 ^ k_4;
                          end );
                  end );
              hoisted_8_2 := hoisted_4_1[deduped_12_2];
              hoisted_7_2 := Product( hoisted_4_1{[ 1 .. deduped_12_2 - 1 ]} );
              hoisted_9_2 := List( hoisted_5_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_7_2 ), hoisted_8_2 );
                  end );
              hoisted_1_2 := hoisted_10_1[logic_new_func_x_2];
              hoisted_5_2 := List( hoisted_14_1, function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := List( hoisted_12_1, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_11_1 ^ j_4 ), hoisted_11_1 );
                          end );
                      return Sum( hoisted_12_1, function ( k_4 )
                              return hoisted_1_2[(1 + hoisted_1_3[(1 + hoisted_12_1[(1 + k_4)])])] * hoisted_13_1 ^ k_4;
                          end );
                  end );
              hoisted_3_2 := hoisted_4_1[deduped_11_2];
              hoisted_2_2 := Product( hoisted_4_1{[ 1 .. deduped_11_2 - 1 ]} );
              hoisted_4_2 := List( hoisted_5_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_2_2 ), hoisted_3_2 );
                  end );
              return [ List( hoisted_16_1, function ( i_3 )
                          return hoisted_5_2[1 + hoisted_4_2[i_3]];
                      end ), List( hoisted_16_1, function ( i_3 )
                          return hoisted_10_2[1 + hoisted_9_2[i_3]];
                      end ) ];
          end ) );
    hoisted_9_1 := [ 1 .. deduped_45_1 ];
    hoisted_3_1 := deduped_52_1;
    hoisted_7_1 := Concatenation( List( deduped_48_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_4_1[hoisted_3_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_8_1 := List( [ 0 .. deduped_45_1 - 1 ], function ( j_2 )
            return Product( hoisted_7_1{[ 1 .. j_2 ]} );
        end );
    hoisted_6_1 := Concatenation( List( deduped_48_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
              deduped_4_2 := hoisted_3_1 + logic_new_func_x_2;
              hoisted_2_2 := hoisted_4_1[deduped_4_2];
              hoisted_1_2 := Product( hoisted_4_1{[ 1 .. deduped_4_2 - 1 ]} );
              deduped_3_2 := List( hoisted_5_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
              return [ deduped_3_2, deduped_3_2 ];
          end ) );
    deduped_41_1 := Filtered( deduped_42_1, function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + x_2;
            return Sum( hoisted_9_1, function ( j_3 )
                      return hoisted_6_1[j_3][hoisted_1_2] * hoisted_8_1[j_3];
                  end ) = Sum( hoisted_9_1, function ( j_3 )
                      return hoisted_21_1[j_3][hoisted_1_2] * hoisted_8_1[j_3];
                  end );
        end );
    deduped_40_1 := Length( deduped_41_1 );
    deduped_39_1 := [ 0 .. deduped_40_1 - 1 ];
    hoisted_38_1 := [ 1 .. deduped_55_1 ];
    hoisted_32_1 := deduped_50_1;
    hoisted_37_1 := List( [ 0 .. deduped_50_1 * deduped_55_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_11_1 ^ QUO_INT( i_2, hoisted_32_1 ) ), hoisted_11_1 );
        end );
    hoisted_35_1 := deduped_55_1;
    hoisted_36_1 := List( deduped_46_1, function ( i_2 )
            return REM_INT( i_2, hoisted_35_1 );
        end );
    hoisted_33_1 := deduped_44_1[2];
    hoisted_23_1 := deduped_44_1[1];
    hoisted_34_1 := List( deduped_42_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_23_1 ), hoisted_33_1 );
        end );
    hoisted_31_1 := [ 1 .. deduped_57_1 ];
    hoisted_22_1 := deduped_51_1;
    hoisted_30_1 := List( [ 0 .. deduped_51_1 * deduped_57_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_13_1 ^ QUO_INT( i_2, hoisted_22_1 ) ), hoisted_13_1 );
        end );
    hoisted_28_1 := deduped_57_1;
    hoisted_29_1 := List( deduped_47_1, function ( i_2 )
            return REM_INT( i_2, hoisted_28_1 );
        end );
    hoisted_27_1 := List( deduped_42_1, function ( i_2 )
            return REM_INT( i_2, hoisted_23_1 );
        end );
    hoisted_26_1 := deduped_41_1;
    hoisted_24_1 := deduped_40_1;
    hoisted_25_1 := List( deduped_39_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_24_1 ^ QUO_INT( i_2, hoisted_24_1 ) ), hoisted_24_1 );
        end );
    return List( deduped_39_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + hoisted_26_1[(1 + hoisted_25_1[(1 + logic_new_func_x_2)])];
            hoisted_2_2 := hoisted_34_1[deduped_3_2];
            hoisted_1_2 := hoisted_27_1[deduped_3_2];
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfQuiverMorphism, NTuple( 2, List( hoisted_31_1, function ( i_3 )
                        return hoisted_30_1[1 + (hoisted_1_2 + hoisted_17_1[(1 + hoisted_29_1[(1 + hoisted_17_1[i_3])])] * hoisted_23_1)];
                    end ), List( hoisted_38_1, function ( i_3 )
                        return hoisted_37_1[1 + (hoisted_2_2 + hoisted_12_1[(1 + hoisted_36_1[(1 + hoisted_12_1[i_3])])] * hoisted_33_1)];
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
