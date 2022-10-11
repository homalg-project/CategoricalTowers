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
    local hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := [ 1 .. Length( arg2_1 ) ];
    deduped_8_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return DefiningTripleOfQuiver( logic_new_func_x_2 )[2];
        end );
    deduped_7_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return DefiningTripleOfQuiver( logic_new_func_x_2 )[1];
        end );
    hoisted_6_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return List( DefiningTripleOfQuiver( logic_new_func_x_2 )[3], function ( a_3 )
                    return a_3[2];
                end );
        end );
    hoisted_5_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return List( DefiningTripleOfQuiver( logic_new_func_x_2 )[3], function ( a_3 )
                    return a_3[1];
                end );
        end );
    hoisted_4_1 := deduped_7_1;
    hoisted_3_1 := deduped_8_1;
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfQuiver, NTuple( 3, Sum( deduped_7_1 ), Sum( deduped_8_1 ), ListN( Concatenation( List( deduped_9_1, function ( logic_new_func_x_2 )
                    local hoisted_1_2, hoisted_2_2, deduped_3_2;
                    deduped_3_2 := Sum( hoisted_4_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
                    hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + hoisted_4_1[logic_new_func_x_2] - 1 ];
                    hoisted_1_2 := hoisted_5_1[logic_new_func_x_2];
                    return List( [ 0 .. hoisted_3_1[logic_new_func_x_2] - 1 ], function ( i_3 )
                            return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                        end );
                end ) ), Concatenation( List( deduped_9_1, function ( logic_new_func_x_2 )
                    local hoisted_1_2, hoisted_2_2, deduped_3_2;
                    deduped_3_2 := Sum( hoisted_4_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
                    hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + hoisted_4_1[logic_new_func_x_2] - 1 ];
                    hoisted_1_2 := hoisted_6_1[logic_new_func_x_2];
                    return List( [ 0 .. hoisted_3_1[logic_new_func_x_2] - 1 ], function ( i_3 )
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
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1;
    deduped_38_1 := DefiningTripleOfQuiver( arg2_1 );
    deduped_37_1 := DefiningTripleOfQuiver( arg3_1 );
    deduped_36_1 := deduped_37_1[3];
    deduped_35_1 := deduped_38_1[3];
    deduped_34_1 := deduped_38_1[1];
    deduped_33_1 := deduped_37_1[2];
    deduped_32_1 := deduped_38_1[2];
    deduped_31_1 := deduped_37_1[1];
    deduped_30_1 := DefiningPairOfUnderlyingQuiver( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_29_1 := deduped_30_1[2];
    deduped_28_1 := deduped_30_1[1];
    deduped_27_1 := Length( deduped_29_1 );
    deduped_26_1 := [ 1 .. deduped_27_1 ];
    deduped_25_1 := deduped_27_1 * 2;
    hoisted_2_1 := [ deduped_34_1, deduped_32_1 ];
    hoisted_1_1 := [ deduped_31_1, deduped_33_1 ];
    deduped_24_1 := Concatenation( List( [ 1 .. deduped_28_1 ], function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ hoisted_2_1[logic_new_func_x_2];
          end ), ListWithIdenticalEntries( deduped_27_1, deduped_31_1 ^ deduped_32_1 ) );
    deduped_23_1 := [ 0 .. Product( deduped_24_1 ) - 1 ];
    hoisted_20_1 := [ 0 .. deduped_33_1 ^ deduped_32_1 - 1 ];
    hoisted_19_1 := deduped_33_1;
    hoisted_18_1 := [ List( deduped_36_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_36_1, function ( a_2 )
                return a_2[2];
            end ) ];
    hoisted_17_1 := deduped_29_1;
    hoisted_16_1 := [ 0 .. deduped_31_1 ^ deduped_34_1 - 1 ];
    hoisted_15_1 := [ 0 .. deduped_32_1 - 1 ];
    hoisted_14_1 := [ List( deduped_35_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_35_1, function ( a_2 )
                return a_2[2];
            end ) ];
    hoisted_13_1 := [ 0 .. deduped_34_1 - 1 ];
    hoisted_12_1 := deduped_31_1;
    hoisted_4_1 := deduped_23_1;
    hoisted_3_1 := deduped_24_1;
    hoisted_6_1 := List( [ 1 .. deduped_28_1 + deduped_27_1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_3_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_3_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_4_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_21_1 := Concatenation( List( deduped_26_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2;
              deduped_7_2 := hoisted_17_1[logic_new_func_x_2];
              hoisted_4_2 := hoisted_18_1[logic_new_func_x_2];
              hoisted_6_2 := List( hoisted_20_1, function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_15_1, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_19_1 ^ j_4 ), hoisted_19_1 );
                          end );
                      hoisted_2_3 := List( hoisted_15_1, function ( i_4 )
                              return hoisted_1_3[1 + i_4];
                          end );
                      hoisted_3_3 := List( hoisted_15_1, function ( i_4 )
                              return hoisted_4_2[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                      return Sum( List( hoisted_15_1, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_5_2 := hoisted_6_1[deduped_7_2[2]];
              hoisted_1_2 := hoisted_14_1[logic_new_func_x_2];
              hoisted_3_2 := List( hoisted_16_1, function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_13_1, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_12_1 ^ j_4 ), hoisted_12_1 );
                          end );
                      hoisted_2_3 := List( hoisted_15_1, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_1_2[(1 + i_4)]];
                          end );
                      hoisted_3_3 := List( hoisted_15_1, function ( i_4 )
                              return hoisted_2_3[1 + i_4];
                          end );
                      return Sum( List( hoisted_15_1, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_2_2 := hoisted_6_1[deduped_7_2[1]];
              return [ List( hoisted_4_1, function ( i_3 )
                          return hoisted_3_2[1 + hoisted_2_2[(1 + i_3)]];
                      end ), List( hoisted_4_1, function ( i_3 )
                          return hoisted_6_2[1 + hoisted_5_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_10_1 := [ 1 .. deduped_25_1 ];
    hoisted_5_1 := deduped_28_1;
    hoisted_8_1 := Concatenation( List( deduped_26_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_3_1[hoisted_5_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_9_1 := List( [ 0 .. deduped_25_1 - 1 ], function ( j_2 )
            return Product( hoisted_8_1{[ 1 .. j_2 ]} );
        end );
    hoisted_22_1 := List( deduped_23_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_10_1, function ( j_3 )
                    return hoisted_21_1[j_3][hoisted_1_2] * hoisted_9_1[j_3];
                end );
        end );
    hoisted_7_1 := Concatenation( List( deduped_26_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_6_1[hoisted_5_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_11_1 := List( deduped_23_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_10_1, function ( j_3 )
                    return hoisted_7_1[j_3][hoisted_1_2] * hoisted_9_1[j_3];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, Length( Filtered( deduped_23_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + x_2;
                return hoisted_11_1[deduped_1_2] = hoisted_22_1[deduped_1_2];
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1;
    deduped_50_1 := DefiningTripleOfQuiver( arg3_1 );
    deduped_49_1 := DefiningTripleOfQuiver( arg2_1 );
    deduped_48_1 := deduped_50_1[2];
    deduped_47_1 := Length( Source( arg4_1 ) );
    deduped_46_1 := deduped_50_1[3];
    deduped_45_1 := deduped_49_1[3];
    deduped_44_1 := deduped_50_1[1];
    deduped_43_1 := deduped_49_1[2];
    deduped_42_1 := deduped_49_1[1];
    deduped_41_1 := ModelingCategory( ModelingCategory( cat_1 ) );
    deduped_40_1 := DefiningPairOfUnderlyingQuiver( deduped_41_1 );
    deduped_39_1 := deduped_40_1[1];
    deduped_38_1 := deduped_40_1[2];
    deduped_37_1 := [ 1 .. Length( SetOfObjects( deduped_41_1 ) ) ];
    deduped_36_1 := Length( deduped_38_1 );
    deduped_35_1 := [ 1 .. deduped_36_1 ];
    deduped_34_1 := deduped_36_1 * 2;
    hoisted_3_1 := [ deduped_44_1, deduped_48_1 ];
    hoisted_1_1 := [ deduped_42_1, deduped_43_1 ];
    deduped_33_1 := Concatenation( List( [ 1 .. deduped_39_1 ], function ( logic_new_func_x_2 )
              return hoisted_3_1[logic_new_func_x_2] ^ hoisted_1_1[logic_new_func_x_2];
          end ), ListWithIdenticalEntries( deduped_36_1, deduped_44_1 ^ deduped_43_1 ) );
    deduped_31_1 := [ 0 .. Product( deduped_33_1 ) - 1 ];
    hoisted_21_1 := [ 0 .. deduped_48_1 ^ deduped_43_1 - 1 ];
    hoisted_20_1 := deduped_48_1;
    hoisted_19_1 := [ List( deduped_46_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_46_1, function ( a_2 )
                return a_2[2];
            end ) ];
    hoisted_18_1 := deduped_38_1;
    hoisted_17_1 := [ 0 .. deduped_44_1 ^ deduped_42_1 - 1 ];
    hoisted_16_1 := [ 0 .. deduped_43_1 - 1 ];
    hoisted_15_1 := [ List( deduped_45_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_45_1, function ( a_2 )
                return a_2[2];
            end ) ];
    hoisted_14_1 := [ 0 .. deduped_42_1 - 1 ];
    hoisted_13_1 := deduped_44_1;
    hoisted_5_1 := deduped_31_1;
    hoisted_4_1 := deduped_33_1;
    hoisted_7_1 := List( [ 1 .. deduped_39_1 + deduped_36_1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_4_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_4_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_5_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_22_1 := Concatenation( List( deduped_35_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2;
              deduped_7_2 := hoisted_18_1[logic_new_func_x_2];
              hoisted_4_2 := hoisted_19_1[logic_new_func_x_2];
              hoisted_6_2 := List( hoisted_21_1, function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_16_1, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_20_1 ^ j_4 ), hoisted_20_1 );
                          end );
                      hoisted_2_3 := List( hoisted_16_1, function ( i_4 )
                              return hoisted_1_3[1 + i_4];
                          end );
                      hoisted_3_3 := List( hoisted_16_1, function ( i_4 )
                              return hoisted_4_2[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                      return Sum( List( hoisted_16_1, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_13_1 ^ k_4;
                            end ) );
                  end );
              hoisted_5_2 := hoisted_7_1[deduped_7_2[2]];
              hoisted_1_2 := hoisted_15_1[logic_new_func_x_2];
              hoisted_3_2 := List( hoisted_17_1, function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_14_1, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_13_1 ^ j_4 ), hoisted_13_1 );
                          end );
                      hoisted_2_3 := List( hoisted_16_1, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_1_2[(1 + i_4)]];
                          end );
                      hoisted_3_3 := List( hoisted_16_1, function ( i_4 )
                              return hoisted_2_3[1 + i_4];
                          end );
                      return Sum( List( hoisted_16_1, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_13_1 ^ k_4;
                            end ) );
                  end );
              hoisted_2_2 := hoisted_7_1[deduped_7_2[1]];
              return [ List( hoisted_5_1, function ( i_3 )
                          return hoisted_3_2[1 + hoisted_2_2[(1 + i_3)]];
                      end ), List( hoisted_5_1, function ( i_3 )
                          return hoisted_6_2[1 + hoisted_5_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_11_1 := [ 1 .. deduped_34_1 ];
    hoisted_6_1 := deduped_39_1;
    hoisted_9_1 := Concatenation( List( deduped_35_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_4_1[hoisted_6_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_10_1 := List( [ 0 .. deduped_34_1 - 1 ], function ( j_2 )
            return Product( hoisted_9_1{[ 1 .. j_2 ]} );
        end );
    hoisted_23_1 := List( deduped_31_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_11_1, function ( j_3 )
                    return hoisted_22_1[j_3][hoisted_1_2] * hoisted_10_1[j_3];
                end );
        end );
    hoisted_8_1 := Concatenation( List( deduped_35_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_7_1[hoisted_6_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_12_1 := List( deduped_31_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_11_1, function ( j_3 )
                    return hoisted_8_1[j_3][hoisted_1_2] * hoisted_10_1[j_3];
                end );
        end );
    deduped_30_1 := Filtered( deduped_31_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + x_2;
            return hoisted_12_1[deduped_1_2] = hoisted_23_1[deduped_1_2];
        end );
    hoisted_29_1 := List( deduped_37_1, function ( logic_new_func_x_2 )
            return hoisted_4_1[logic_new_func_x_2];
        end );
    hoisted_27_1 := [ 0 .. deduped_47_1 - 1 ];
    hoisted_26_1 := AsList( arg4_1 );
    hoisted_25_1 := [ 0 .. Length( deduped_30_1 ) - 1 ];
    hoisted_24_1 := deduped_30_1;
    hoisted_28_1 := List( deduped_37_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2;
            hoisted_2_2 := hoisted_4_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_4_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_5_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            hoisted_4_2 := List( hoisted_25_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_24_1[(1 + i_3)]];
                end );
            return List( hoisted_27_1, function ( i_3 )
                    return hoisted_4_2[1 + hoisted_26_1[(1 + i_3)]];
                end );
        end );
    hoisted_2_1 := deduped_47_1;
    deduped_32_1 := List( deduped_37_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, deduped_13_2, deduped_14_2, deduped_15_2, deduped_16_2;
            deduped_16_2 := hoisted_3_1[logic_new_func_x_2];
            deduped_15_2 := hoisted_1_1[logic_new_func_x_2];
            deduped_14_2 := deduped_16_2 ^ deduped_15_2;
            deduped_13_2 := [ 0 .. hoisted_2_1 * deduped_15_2 - 1 ];
            hoisted_2_2 := deduped_16_2;
            hoisted_1_2 := deduped_14_2;
            hoisted_11_2 := List( [ 0 .. deduped_14_2 * deduped_15_2 - 1 ], function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_2_2 ^ QUO_INT( i_3, hoisted_1_2 ) ), hoisted_2_2 );
                end );
            hoisted_9_2 := hoisted_29_1[logic_new_func_x_2];
            hoisted_6_2 := deduped_15_2;
            hoisted_7_2 := List( deduped_13_2, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_2_1 ), hoisted_6_2 );
                end );
            hoisted_8_2 := List( deduped_13_2, function ( i_3 )
                    return hoisted_7_2[1 + i_3];
                end );
            hoisted_4_2 := hoisted_28_1[logic_new_func_x_2];
            hoisted_3_2 := List( deduped_13_2, function ( i_3 )
                    return REM_INT( i_3, hoisted_2_1 );
                end );
            hoisted_5_2 := List( deduped_13_2, function ( i_3 )
                    return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                end );
            hoisted_10_2 := List( deduped_13_2, function ( i_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + i_3;
                    return hoisted_5_2[deduped_1_3] + hoisted_8_2[deduped_1_3] * hoisted_9_2;
                end );
            hoisted_12_2 := List( deduped_13_2, function ( i_3 )
                    return hoisted_11_2[1 + hoisted_10_2[(1 + i_3)]];
                end );
            return List( [ 0 .. deduped_15_2 - 1 ], function ( i_3 )
                    return hoisted_12_2[1 + i_3];
                end );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfQuiverMorphism, NTuple( 2, deduped_32_1[1], deduped_32_1[2] ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1;
    deduped_49_1 := DefiningTripleOfQuiver( arg2_1 );
    deduped_48_1 := DefiningTripleOfQuiver( arg3_1 );
    deduped_47_1 := deduped_48_1[3];
    deduped_46_1 := deduped_49_1[3];
    deduped_45_1 := deduped_49_1[1];
    deduped_44_1 := deduped_48_1[2];
    deduped_43_1 := deduped_49_1[2];
    deduped_42_1 := deduped_48_1[1];
    deduped_41_1 := ModelingCategory( ModelingCategory( cat_1 ) );
    deduped_40_1 := DefiningPairOfUnderlyingQuiver( deduped_41_1 );
    deduped_39_1 := deduped_40_1[2];
    deduped_38_1 := deduped_40_1[1];
    deduped_37_1 := [ 1 .. Length( SetOfObjects( deduped_41_1 ) ) ];
    deduped_36_1 := Length( deduped_39_1 );
    deduped_35_1 := [ 1 .. deduped_36_1 ];
    deduped_34_1 := deduped_36_1 * 2;
    hoisted_2_1 := [ deduped_45_1, deduped_43_1 ];
    hoisted_1_1 := [ deduped_42_1, deduped_44_1 ];
    deduped_33_1 := Concatenation( List( [ 1 .. deduped_38_1 ], function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ hoisted_2_1[logic_new_func_x_2];
          end ), ListWithIdenticalEntries( deduped_36_1, deduped_42_1 ^ deduped_43_1 ) );
    deduped_32_1 := [ 0 .. Product( deduped_33_1 ) - 1 ];
    hoisted_20_1 := [ 0 .. deduped_44_1 ^ deduped_43_1 - 1 ];
    hoisted_19_1 := deduped_44_1;
    hoisted_18_1 := [ List( deduped_47_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_47_1, function ( a_2 )
                return a_2[2];
            end ) ];
    hoisted_17_1 := deduped_39_1;
    hoisted_16_1 := [ 0 .. deduped_42_1 ^ deduped_45_1 - 1 ];
    hoisted_15_1 := [ 0 .. deduped_43_1 - 1 ];
    hoisted_14_1 := [ List( deduped_46_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_46_1, function ( a_2 )
                return a_2[2];
            end ) ];
    hoisted_13_1 := [ 0 .. deduped_45_1 - 1 ];
    hoisted_12_1 := deduped_42_1;
    hoisted_4_1 := deduped_32_1;
    hoisted_3_1 := deduped_33_1;
    hoisted_6_1 := List( [ 1 .. deduped_38_1 + deduped_36_1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_3_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_3_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_4_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_21_1 := Concatenation( List( deduped_35_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2;
              deduped_7_2 := hoisted_17_1[logic_new_func_x_2];
              hoisted_4_2 := hoisted_18_1[logic_new_func_x_2];
              hoisted_6_2 := List( hoisted_20_1, function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_15_1, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_19_1 ^ j_4 ), hoisted_19_1 );
                          end );
                      hoisted_2_3 := List( hoisted_15_1, function ( i_4 )
                              return hoisted_1_3[1 + i_4];
                          end );
                      hoisted_3_3 := List( hoisted_15_1, function ( i_4 )
                              return hoisted_4_2[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                      return Sum( List( hoisted_15_1, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_5_2 := hoisted_6_1[deduped_7_2[2]];
              hoisted_1_2 := hoisted_14_1[logic_new_func_x_2];
              hoisted_3_2 := List( hoisted_16_1, function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_13_1, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_12_1 ^ j_4 ), hoisted_12_1 );
                          end );
                      hoisted_2_3 := List( hoisted_15_1, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_1_2[(1 + i_4)]];
                          end );
                      hoisted_3_3 := List( hoisted_15_1, function ( i_4 )
                              return hoisted_2_3[1 + i_4];
                          end );
                      return Sum( List( hoisted_15_1, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_2_2 := hoisted_6_1[deduped_7_2[1]];
              return [ List( hoisted_4_1, function ( i_3 )
                          return hoisted_3_2[1 + hoisted_2_2[(1 + i_3)]];
                      end ), List( hoisted_4_1, function ( i_3 )
                          return hoisted_6_2[1 + hoisted_5_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_10_1 := [ 1 .. deduped_34_1 ];
    hoisted_5_1 := deduped_38_1;
    hoisted_8_1 := Concatenation( List( deduped_35_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_3_1[hoisted_5_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_9_1 := List( [ 0 .. deduped_34_1 - 1 ], function ( j_2 )
            return Product( hoisted_8_1{[ 1 .. j_2 ]} );
        end );
    hoisted_22_1 := List( deduped_32_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_10_1, function ( j_3 )
                    return hoisted_21_1[j_3][hoisted_1_2] * hoisted_9_1[j_3];
                end );
        end );
    hoisted_7_1 := Concatenation( List( deduped_35_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_6_1[hoisted_5_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_11_1 := List( deduped_32_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_10_1, function ( j_3 )
                    return hoisted_7_1[j_3][hoisted_1_2] * hoisted_9_1[j_3];
                end );
        end );
    deduped_31_1 := Filtered( deduped_32_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + x_2;
            return hoisted_11_1[deduped_1_2] = hoisted_22_1[deduped_1_2];
        end );
    deduped_30_1 := Length( deduped_31_1 );
    deduped_29_1 := [ 0 .. deduped_30_1 - 1 ];
    hoisted_28_1 := List( deduped_37_1, function ( logic_new_func_x_2 )
            return hoisted_3_1[logic_new_func_x_2];
        end );
    hoisted_27_1 := deduped_37_1;
    hoisted_26_1 := deduped_31_1;
    hoisted_25_1 := deduped_29_1;
    hoisted_23_1 := deduped_30_1;
    hoisted_24_1 := List( deduped_29_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_23_1 ^ QUO_INT( i_2, hoisted_23_1 ) ), hoisted_23_1 );
        end );
    return List( deduped_29_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_4_1[1 + hoisted_26_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_25_1[(1 + hoisted_24_1[(1 + logic_new_func_x_2)])] ))]] );
            hoisted_2_2 := List( hoisted_27_1, function ( logic_new_func_x_3 )
                    return ListWithIdenticalEntries( 1, REM_INT( QUO_INT( hoisted_1_2, Product( hoisted_3_1{[ 1 .. logic_new_func_x_3 - 1 ]} ) ), hoisted_3_1[logic_new_func_x_3] ) );
                end );
            deduped_3_2 := List( hoisted_27_1, function ( logic_new_func_x_3 )
                    local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, hoisted_5_3, hoisted_6_3, hoisted_7_3, hoisted_8_3, hoisted_9_3, hoisted_10_3, deduped_11_3, deduped_12_3, deduped_13_3, deduped_14_3;
                    deduped_14_3 := hoisted_1_1[logic_new_func_x_3];
                    deduped_13_3 := hoisted_2_1[logic_new_func_x_3];
                    deduped_12_3 := deduped_14_3 ^ deduped_13_3;
                    deduped_11_3 := [ 0 .. deduped_13_3 - 1 ];
                    hoisted_2_3 := deduped_14_3;
                    hoisted_1_3 := deduped_12_3;
                    hoisted_9_3 := List( [ 0 .. deduped_12_3 * deduped_13_3 - 1 ], function ( i_4 )
                            return REM_INT( QUO_INT( i_4, hoisted_2_3 ^ QUO_INT( i_4, hoisted_1_3 ) ), hoisted_2_3 );
                        end );
                    hoisted_7_3 := hoisted_2_2[logic_new_func_x_3][1];
                    hoisted_6_3 := hoisted_28_1[logic_new_func_x_3];
                    hoisted_3_3 := deduped_13_3;
                    hoisted_4_3 := List( deduped_11_3, function ( i_4 )
                            return REM_INT( i_4, hoisted_3_3 );
                        end );
                    hoisted_5_3 := List( deduped_11_3, function ( i_4 )
                            return hoisted_4_3[1 + i_4];
                        end );
                    hoisted_8_3 := List( deduped_11_3, function ( i_4 )
                            return hoisted_7_3 + hoisted_5_3[(1 + i_4)] * hoisted_6_3;
                        end );
                    hoisted_10_3 := List( deduped_11_3, function ( i_4 )
                            return hoisted_9_3[1 + hoisted_8_3[(1 + i_4)]];
                        end );
                    return List( deduped_11_3, function ( i_4 )
                            return hoisted_10_3[1 + i_4];
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
