# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_PreSheavesInSkeletalFinSetsPrecompiled", function ( cat )
    
    ##
    AddInitialObject( cat,
        
########
function ( cat_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_4_1 := Range( cat_1 );
    deduped_3_1 := CreateCapCategoryObjectWithAttributes( deduped_4_1, Length, 0 );
    hoisted_2_1 := CreateCapCategoryMorphismWithAttributes( deduped_4_1, deduped_3_1, deduped_3_1, AsList, [  ] );
    hoisted_1_1 := deduped_3_1;
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, Source( cat_1 ), Range, deduped_4_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_5_1[1] ], function ( o_2 )
                return hoisted_1_1;
            end ), LazyHList( [ 1 .. Length( deduped_5_1[2] ) ], function ( m_2 )
                return hoisted_2_1;
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddCoproduct( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1, deduped_5_1, deduped_6_1;
    deduped_6_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_5_1 := Range( cat_1 );
    deduped_4_1 := deduped_6_1[2];
    hoisted_3_1 := [ 1 .. Length( arg2_1 ) ];
    hoisted_2_1 := deduped_4_1;
    hoisted_1_1 := deduped_5_1;
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, Source( cat_1 ), Range, deduped_5_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_6_1[1] ], function ( o_2 )
                return CreateCapCategoryObjectWithAttributes( hoisted_1_1, Length, Sum( List( arg2_1, function ( logic_new_func_x_3 )
                            return Length( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][o_2] ) );
                        end ) ) );
            end ), LazyHList( [ 1 .. Length( deduped_4_1 ) ], function ( m_2 )
                local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, deduped_6_2;
                deduped_6_2 := hoisted_2_1[m_2];
                hoisted_5_2 := List( arg2_1, function ( logic_new_func_x_3 )
                        return AsList( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[2][m_2] ) );
                    end );
                hoisted_4_2 := List( arg2_1, function ( logic_new_func_x_3 )
                        return Length( Range( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[2][m_2] ) ) );
                    end );
                hoisted_3_2 := List( arg2_1, function ( logic_new_func_x_3 )
                        return Length( Source( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[2][m_2] ) ) );
                    end );
                hoisted_2_2 := 1 + deduped_6_2[1];
                hoisted_1_2 := 1 + deduped_6_2[2];
                return CreateCapCategoryMorphismWithAttributes( hoisted_1_1, CreateCapCategoryObjectWithAttributes( hoisted_1_1, Length, Sum( List( arg2_1, function ( logic_new_func_x_3 )
                              return Length( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][hoisted_1_2] ) );
                          end ) ) ), CreateCapCategoryObjectWithAttributes( hoisted_1_1, Length, Sum( List( arg2_1, function ( logic_new_func_x_3 )
                              return Length( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][hoisted_2_2] ) );
                          end ) ) ), AsList, Concatenation( List( hoisted_3_1, function ( logic_new_func_x_3 )
                            local hoisted_1_3, hoisted_2_3, deduped_3_3;
                            deduped_3_3 := Sum( hoisted_4_2{[ 1 .. logic_new_func_x_3 - 1 ]} );
                            hoisted_2_3 := [ deduped_3_3 .. deduped_3_3 + hoisted_4_2[logic_new_func_x_3] - 1 ];
                            hoisted_1_3 := hoisted_5_2[logic_new_func_x_3];
                            return List( [ 0 .. hoisted_3_2[logic_new_func_x_3] - 1 ], function ( i_4 )
                                    return hoisted_2_3[1 + hoisted_1_3[(1 + i_4)]];
                                end );
                        end ) ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInjectionOfCofactorOfCoproductWithGivenCoproduct( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1;
    deduped_5_1 := objects_1[k_1];
    hoisted_4_1 := Range( cat_1 );
    hoisted_3_1 := [ 1 .. k_1 - 1 ];
    hoisted_2_1 := ValuesOfPreSheaf( P_1 )[1];
    hoisted_1_1 := ValuesOfPreSheaf( CAP_JIT_INCOMPLETE_LOGIC( deduped_5_1 ) )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_5_1, P_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local deduped_1_2, deduped_2_2;
              deduped_2_2 := List( objects_1, function ( logic_new_func_x_3 )
                      return Length( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][o_2] ) );
                  end );
              deduped_1_2 := Sum( deduped_2_2{hoisted_3_1} );
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, hoisted_1_1[o_2], hoisted_2_1[o_2], AsList, [ deduped_1_2 .. deduped_1_2 + deduped_2_2[k_1] - 1 ] );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromCoproductWithGivenCoproduct( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1;
    hoisted_3_1 := Range( cat_1 );
    hoisted_2_1 := ValuesOfPreSheaf( T_1 )[1];
    hoisted_1_1 := ValuesOfPreSheaf( P_1 )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_3_1, hoisted_1_1[o_2], hoisted_2_1[o_2], AsList, Concatenation( List( tau_1, function ( logic_new_func_x_3 )
                          return AsList( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                      end ) ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddHomomorphismStructureOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1;
    deduped_30_1 := ValuesOfPreSheaf( arg2_1 );
    deduped_29_1 := ValuesOfPreSheaf( arg3_1 );
    deduped_28_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_27_1 := deduped_30_1[2];
    deduped_26_1 := deduped_29_1[2];
    deduped_25_1 := deduped_28_1[2];
    deduped_24_1 := deduped_28_1[1];
    deduped_23_1 := Length( deduped_25_1 );
    deduped_22_1 := [ 1 .. deduped_23_1 ];
    deduped_21_1 := [ 0 .. deduped_23_1 * 2 - 1 ];
    hoisted_4_1 := List( deduped_27_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_3_1 := List( deduped_26_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    hoisted_2_1 := List( deduped_30_1[1], Length );
    hoisted_1_1 := List( deduped_29_1[1], Length );
    deduped_20_1 := Concatenation( List( [ 1 .. deduped_24_1 ], function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ hoisted_2_1[logic_new_func_x_2];
          end ), List( deduped_22_1, function ( logic_new_func_x_2 )
              return hoisted_3_1[logic_new_func_x_2] ^ hoisted_4_1[logic_new_func_x_2];
          end ) );
    deduped_19_1 := [ 0 .. Product( deduped_20_1 ) - 1 ];
    hoisted_17_1 := List( deduped_26_1, AsList );
    hoisted_16_1 := List( deduped_26_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_15_1 := deduped_25_1;
    hoisted_14_1 := List( deduped_27_1, AsList );
    hoisted_13_1 := List( deduped_27_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    hoisted_6_1 := deduped_19_1;
    hoisted_5_1 := deduped_20_1;
    hoisted_8_1 := List( [ 1 .. deduped_24_1 + deduped_23_1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_5_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_5_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_6_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_18_1 := Concatenation( List( deduped_22_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, deduped_11_2, deduped_12_2, deduped_13_2, deduped_14_2, deduped_15_2;
              deduped_15_2 := hoisted_16_1[logic_new_func_x_2];
              deduped_14_2 := hoisted_15_1[logic_new_func_x_2];
              deduped_13_2 := hoisted_4_1[logic_new_func_x_2];
              deduped_12_2 := hoisted_13_1[logic_new_func_x_2];
              deduped_11_2 := hoisted_3_1[logic_new_func_x_2];
              hoisted_8_2 := hoisted_17_1[logic_new_func_x_2];
              hoisted_7_2 := deduped_15_2;
              hoisted_3_2 := [ 0 .. deduped_13_2 - 1 ];
              hoisted_1_2 := deduped_11_2;
              hoisted_10_2 := List( [ 0 .. deduped_15_2 ^ deduped_13_2 - 1 ], function ( i_3 )
                      return Sum( List( hoisted_3_2, function ( k_4 )
                                return hoisted_8_2[(1 + REM_INT( QUO_INT( i_3, hoisted_7_2 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_2[(1 + k_4)] ) ), hoisted_7_2 ))] * hoisted_1_2 ^ k_4;
                            end ) );
                  end );
              hoisted_9_2 := hoisted_8_1[1 + deduped_14_2[2]];
              hoisted_4_2 := hoisted_14_1[logic_new_func_x_2];
              hoisted_2_2 := [ 0 .. deduped_12_2 - 1 ];
              hoisted_6_2 := List( [ 0 .. deduped_11_2 ^ deduped_12_2 - 1 ], function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := List( hoisted_2_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_1_2 ^ j_4 ), hoisted_1_2 );
                          end );
                      return Sum( List( hoisted_3_2, function ( k_4 )
                                return hoisted_1_3[(1 + hoisted_4_2[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_2[(1 + k_4)] ))])] * hoisted_1_2 ^ k_4;
                            end ) );
                  end );
              hoisted_5_2 := hoisted_8_1[1 + deduped_14_2[1]];
              return [ List( hoisted_6_1, function ( i_3 )
                          return hoisted_6_2[1 + hoisted_5_2[(1 + i_3)]];
                      end ), List( hoisted_6_1, function ( i_3 )
                          return hoisted_10_2[1 + hoisted_9_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_12_1 := deduped_21_1;
    hoisted_7_1 := deduped_24_1 - 1;
    hoisted_10_1 := Concatenation( List( deduped_22_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_5_1[1 + (hoisted_7_1 + logic_new_func_x_2)];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_11_1 := List( deduped_21_1, function ( j_2 )
            return Product( hoisted_10_1{[ 1 .. j_2 ]} );
        end );
    hoisted_9_1 := Concatenation( List( deduped_22_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_8_1[1 + (hoisted_7_1 + logic_new_func_x_2)];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    return CreateCapCategoryObjectWithAttributes( Range( cat_1 ), Length, Length( Filtered( deduped_19_1, function ( x_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + x_2;
                return Sum( hoisted_12_1, function ( j_3 )
                          local deduped_1_3;
                          deduped_1_3 := 1 + j_3;
                          return hoisted_9_1[deduped_1_3][hoisted_1_2] * hoisted_11_1[deduped_1_3];
                      end ) = Sum( hoisted_12_1, function ( j_3 )
                          local deduped_1_3;
                          deduped_1_3 := 1 + j_3;
                          return hoisted_18_1[deduped_1_3][hoisted_1_2] * hoisted_11_1[deduped_1_3];
                      end );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddHomomorphismStructureOnMorphismsWithGivenObjects( cat,
        
########
function ( cat_1, source_1, alpha_1, beta_1, range_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, hoisted_34_1, hoisted_35_1, hoisted_36_1, hoisted_37_1, hoisted_38_1, hoisted_39_1, hoisted_40_1, hoisted_41_1, hoisted_42_1, hoisted_43_1, hoisted_44_1, hoisted_45_1, hoisted_46_1, hoisted_47_1, hoisted_48_1, hoisted_49_1, hoisted_50_1, hoisted_51_1, hoisted_52_1, hoisted_53_1, hoisted_54_1, hoisted_55_1, hoisted_56_1, hoisted_57_1, hoisted_58_1, hoisted_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1, deduped_68_1, deduped_69_1, deduped_70_1, deduped_71_1, deduped_72_1, deduped_73_1, deduped_74_1, deduped_75_1, deduped_76_1, deduped_77_1, deduped_78_1, deduped_79_1, deduped_80_1, deduped_81_1, deduped_82_1, deduped_83_1, deduped_84_1, deduped_85_1, deduped_86_1, deduped_87_1, deduped_88_1, deduped_89_1, deduped_90_1, deduped_91_1, deduped_92_1, deduped_93_1;
    deduped_93_1 := ValuesOnAllObjects( alpha_1 );
    deduped_92_1 := ValuesOnAllObjects( beta_1 );
    deduped_91_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_90_1 := Range( cat_1 );
    deduped_89_1 := ValuesOfPreSheaf( Source( alpha_1 ) );
    deduped_88_1 := ValuesOfPreSheaf( Range( beta_1 ) );
    deduped_87_1 := ValuesOfPreSheaf( Range( alpha_1 ) );
    deduped_86_1 := ValuesOfPreSheaf( Source( beta_1 ) );
    deduped_85_1 := deduped_91_1[2];
    deduped_84_1 := deduped_91_1[1];
    deduped_83_1 := [ 1 .. deduped_84_1 ];
    deduped_82_1 := deduped_89_1[2];
    deduped_81_1 := deduped_88_1[2];
    deduped_80_1 := deduped_84_1 - 1;
    deduped_79_1 := deduped_87_1[2];
    deduped_78_1 := deduped_86_1[2];
    deduped_77_1 := Length( deduped_85_1 );
    deduped_76_1 := [ 0 .. deduped_80_1 ];
    deduped_75_1 := [ 1 .. deduped_77_1 ];
    hoisted_41_1 := List( deduped_93_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    hoisted_40_1 := List( deduped_92_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    deduped_74_1 := List( deduped_83_1, function ( logic_new_func_x_2 )
            return hoisted_40_1[logic_new_func_x_2] ^ hoisted_41_1[logic_new_func_x_2];
        end );
    deduped_73_1 := [ 1 .. deduped_84_1 + deduped_77_1 ];
    deduped_72_1 := [ 0 .. deduped_77_1 * 2 - 1 ];
    hoisted_22_1 := List( deduped_82_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_21_1 := List( deduped_81_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    hoisted_20_1 := List( deduped_89_1[1], Length );
    hoisted_19_1 := List( deduped_88_1[1], Length );
    deduped_71_1 := Concatenation( List( deduped_83_1, function ( logic_new_func_x_2 )
              return hoisted_19_1[logic_new_func_x_2] ^ hoisted_20_1[logic_new_func_x_2];
          end ), List( deduped_75_1, function ( logic_new_func_x_2 )
              return hoisted_21_1[logic_new_func_x_2] ^ hoisted_22_1[logic_new_func_x_2];
          end ) );
    hoisted_4_1 := List( deduped_79_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_3_1 := List( deduped_78_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    hoisted_2_1 := List( deduped_87_1[1], Length );
    hoisted_1_1 := List( deduped_86_1[1], Length );
    deduped_70_1 := Concatenation( List( deduped_83_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ hoisted_2_1[logic_new_func_x_2];
          end ), List( deduped_75_1, function ( logic_new_func_x_2 )
              return hoisted_3_1[logic_new_func_x_2] ^ hoisted_4_1[logic_new_func_x_2];
          end ) );
    deduped_69_1 := [ 0 .. Length( deduped_76_1 ) - 1 ];
    deduped_68_1 := [ 0 .. Product( deduped_74_1 ) - 1 ];
    deduped_67_1 := [ 0 .. Product( deduped_71_1 ) - 1 ];
    deduped_66_1 := [ 0 .. Product( deduped_70_1 ) - 1 ];
    hoisted_32_1 := List( deduped_81_1, AsList );
    hoisted_31_1 := List( deduped_81_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_30_1 := List( deduped_82_1, AsList );
    hoisted_29_1 := List( deduped_82_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    hoisted_24_1 := deduped_67_1;
    hoisted_23_1 := deduped_71_1;
    hoisted_25_1 := List( deduped_73_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_23_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_23_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_24_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_15_1 := deduped_85_1;
    hoisted_33_1 := Concatenation( List( deduped_75_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, deduped_11_2, deduped_12_2, deduped_13_2, deduped_14_2, deduped_15_2;
              deduped_15_2 := hoisted_31_1[logic_new_func_x_2];
              deduped_14_2 := hoisted_15_1[logic_new_func_x_2];
              deduped_13_2 := hoisted_22_1[logic_new_func_x_2];
              deduped_12_2 := hoisted_29_1[logic_new_func_x_2];
              deduped_11_2 := hoisted_21_1[logic_new_func_x_2];
              hoisted_8_2 := hoisted_32_1[logic_new_func_x_2];
              hoisted_7_2 := deduped_15_2;
              hoisted_3_2 := [ 0 .. deduped_13_2 - 1 ];
              hoisted_1_2 := deduped_11_2;
              hoisted_10_2 := List( [ 0 .. deduped_15_2 ^ deduped_13_2 - 1 ], function ( i_3 )
                      return Sum( List( hoisted_3_2, function ( k_4 )
                                return hoisted_8_2[(1 + REM_INT( QUO_INT( i_3, hoisted_7_2 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_2[(1 + k_4)] ) ), hoisted_7_2 ))] * hoisted_1_2 ^ k_4;
                            end ) );
                  end );
              hoisted_9_2 := hoisted_25_1[1 + deduped_14_2[2]];
              hoisted_4_2 := hoisted_30_1[logic_new_func_x_2];
              hoisted_2_2 := [ 0 .. deduped_12_2 - 1 ];
              hoisted_6_2 := List( [ 0 .. deduped_11_2 ^ deduped_12_2 - 1 ], function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := List( hoisted_2_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_1_2 ^ j_4 ), hoisted_1_2 );
                          end );
                      return Sum( List( hoisted_3_2, function ( k_4 )
                                return hoisted_1_3[(1 + hoisted_4_2[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_2[(1 + k_4)] ))])] * hoisted_1_2 ^ k_4;
                            end ) );
                  end );
              hoisted_5_2 := hoisted_25_1[1 + deduped_14_2[1]];
              return [ List( hoisted_24_1, function ( i_3 )
                          return hoisted_6_2[1 + hoisted_5_2[(1 + i_3)]];
                      end ), List( hoisted_24_1, function ( i_3 )
                          return hoisted_10_2[1 + hoisted_9_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_7_1 := deduped_80_1;
    hoisted_27_1 := Concatenation( List( deduped_75_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_23_1[1 + (hoisted_7_1 + logic_new_func_x_2)];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_28_1 := List( deduped_72_1, function ( j_2 )
            return Product( hoisted_27_1{[ 1 .. j_2 ]} );
        end );
    hoisted_26_1 := Concatenation( List( deduped_75_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_25_1[1 + (hoisted_7_1 + logic_new_func_x_2)];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_12_1 := deduped_72_1;
    deduped_65_1 := Filtered( deduped_67_1, function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + x_2;
            return Sum( hoisted_12_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_26_1[deduped_1_3][hoisted_1_2] * hoisted_28_1[deduped_1_3];
                  end ) = Sum( hoisted_12_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_33_1[deduped_1_3][hoisted_1_2] * hoisted_28_1[deduped_1_3];
                  end );
        end );
    hoisted_17_1 := List( deduped_78_1, AsList );
    hoisted_16_1 := List( deduped_78_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_14_1 := List( deduped_79_1, AsList );
    hoisted_13_1 := List( deduped_79_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    hoisted_6_1 := deduped_66_1;
    hoisted_5_1 := deduped_70_1;
    hoisted_8_1 := List( deduped_73_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_5_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_5_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_6_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_18_1 := Concatenation( List( deduped_75_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, deduped_11_2, deduped_12_2, deduped_13_2, deduped_14_2, deduped_15_2;
              deduped_15_2 := hoisted_16_1[logic_new_func_x_2];
              deduped_14_2 := hoisted_15_1[logic_new_func_x_2];
              deduped_13_2 := hoisted_4_1[logic_new_func_x_2];
              deduped_12_2 := hoisted_13_1[logic_new_func_x_2];
              deduped_11_2 := hoisted_3_1[logic_new_func_x_2];
              hoisted_8_2 := hoisted_17_1[logic_new_func_x_2];
              hoisted_7_2 := deduped_15_2;
              hoisted_3_2 := [ 0 .. deduped_13_2 - 1 ];
              hoisted_1_2 := deduped_11_2;
              hoisted_10_2 := List( [ 0 .. deduped_15_2 ^ deduped_13_2 - 1 ], function ( i_3 )
                      return Sum( List( hoisted_3_2, function ( k_4 )
                                return hoisted_8_2[(1 + REM_INT( QUO_INT( i_3, hoisted_7_2 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_2[(1 + k_4)] ) ), hoisted_7_2 ))] * hoisted_1_2 ^ k_4;
                            end ) );
                  end );
              hoisted_9_2 := hoisted_8_1[1 + deduped_14_2[2]];
              hoisted_4_2 := hoisted_14_1[logic_new_func_x_2];
              hoisted_2_2 := [ 0 .. deduped_12_2 - 1 ];
              hoisted_6_2 := List( [ 0 .. deduped_11_2 ^ deduped_12_2 - 1 ], function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := List( hoisted_2_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_1_2 ^ j_4 ), hoisted_1_2 );
                          end );
                      return Sum( List( hoisted_3_2, function ( k_4 )
                                return hoisted_1_3[(1 + hoisted_4_2[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_2[(1 + k_4)] ))])] * hoisted_1_2 ^ k_4;
                            end ) );
                  end );
              hoisted_5_2 := hoisted_8_1[1 + deduped_14_2[1]];
              return [ List( hoisted_6_1, function ( i_3 )
                          return hoisted_6_2[1 + hoisted_5_2[(1 + i_3)]];
                      end ), List( hoisted_6_1, function ( i_3 )
                          return hoisted_10_2[1 + hoisted_9_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_10_1 := Concatenation( List( deduped_75_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_5_1[1 + (hoisted_7_1 + logic_new_func_x_2)];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_11_1 := List( deduped_72_1, function ( j_2 )
            return Product( hoisted_10_1{[ 1 .. j_2 ]} );
        end );
    hoisted_9_1 := Concatenation( List( deduped_75_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_8_1[1 + (hoisted_7_1 + logic_new_func_x_2)];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    deduped_64_1 := Filtered( deduped_66_1, function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + x_2;
            return Sum( hoisted_12_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_9_1[deduped_1_3][hoisted_1_2] * hoisted_11_1[deduped_1_3];
                  end ) = Sum( hoisted_12_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_18_1[deduped_1_3][hoisted_1_2] * hoisted_11_1[deduped_1_3];
                  end );
        end );
    deduped_63_1 := Length( deduped_65_1 );
    deduped_62_1 := Length( deduped_64_1 );
    deduped_61_1 := [ 0 .. deduped_63_1 - 1 ];
    deduped_60_1 := [ 0 .. deduped_62_1 - 1 ];
    hoisted_39_1 := deduped_69_1;
    hoisted_37_1 := List( deduped_76_1, function ( logic_new_func_x_2 )
            return hoisted_23_1[1 + logic_new_func_x_2];
        end );
    hoisted_38_1 := List( deduped_69_1, function ( j_2 )
            return Product( hoisted_37_1{[ 1 .. j_2 ]} );
        end );
    hoisted_35_1 := deduped_61_1;
    hoisted_34_1 := deduped_65_1;
    hoisted_36_1 := List( deduped_76_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_23_1[1 + logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_23_1{[ 1 .. logic_new_func_x_2 ]} );
            return List( hoisted_35_1, function ( i_3 )
                    return REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_24_1[1 + hoisted_34_1[(1 + i_3)]] ), hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_59_1 := List( deduped_61_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_39_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_36_1[deduped_1_3][hoisted_1_2] * hoisted_38_1[deduped_1_3];
                end );
        end );
    hoisted_52_1 := deduped_76_1;
    hoisted_46_1 := List( deduped_92_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    hoisted_43_1 := List( deduped_93_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_50_1 := List( deduped_83_1, function ( logic_new_func_x_2 )
            return hoisted_46_1[logic_new_func_x_2] ^ hoisted_43_1[logic_new_func_x_2];
        end );
    hoisted_51_1 := List( deduped_76_1, function ( j_2 )
            return Product( hoisted_50_1{[ 1 .. j_2 ]} );
        end );
    hoisted_48_1 := deduped_68_1;
    hoisted_47_1 := deduped_74_1;
    hoisted_45_1 := List( deduped_93_1, AsList );
    hoisted_44_1 := List( deduped_92_1, AsList );
    hoisted_42_1 := deduped_83_1;
    hoisted_49_1 := List( deduped_83_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, deduped_10_2, deduped_11_2, deduped_12_2, deduped_13_2;
            deduped_13_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_42_1[logic_new_func_x_2] );
            deduped_12_2 := hoisted_41_1[deduped_13_2];
            deduped_11_2 := hoisted_40_1[deduped_13_2];
            deduped_10_2 := deduped_11_2 ^ deduped_12_2;
            hoisted_6_2 := hoisted_46_1[deduped_13_2];
            hoisted_5_2 := hoisted_44_1[deduped_13_2];
            hoisted_4_2 := hoisted_45_1[deduped_13_2];
            hoisted_3_2 := [ 0 .. hoisted_43_1[deduped_13_2] - 1 ];
            hoisted_2_2 := [ 0 .. deduped_12_2 - 1 ];
            hoisted_1_2 := deduped_11_2;
            hoisted_9_2 := List( [ 0 .. deduped_10_2 - 1 ], function ( i_3 )
                    local hoisted_1_3;
                    hoisted_1_3 := List( hoisted_2_2, function ( j_4 )
                            return REM_INT( QUO_INT( i_3, hoisted_1_2 ^ j_4 ), hoisted_1_2 );
                        end );
                    return Sum( List( hoisted_3_2, function ( k_4 )
                              return hoisted_5_2[(1 + hoisted_1_3[(1 + hoisted_4_2[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_2[(1 + k_4)] ))])])] * hoisted_6_2 ^ k_4;
                          end ) );
                end );
            hoisted_8_2 := deduped_10_2;
            hoisted_7_2 := Product( hoisted_47_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_48_1, function ( logic_new_func_x_3 )
                    return hoisted_9_2[1 + REM_INT( QUO_INT( logic_new_func_x_3, hoisted_7_2 ), hoisted_8_2 )];
                end );
        end );
    hoisted_58_1 := List( deduped_68_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_52_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_49_1[deduped_1_3][hoisted_1_2] * hoisted_51_1[deduped_1_3];
                end );
        end );
    hoisted_56_1 := List( deduped_76_1, function ( logic_new_func_x_2 )
            return hoisted_5_1[1 + logic_new_func_x_2];
        end );
    hoisted_57_1 := List( deduped_69_1, function ( j_2 )
            return Product( hoisted_56_1{[ 1 .. j_2 ]} );
        end );
    hoisted_54_1 := deduped_60_1;
    hoisted_53_1 := deduped_64_1;
    hoisted_55_1 := List( deduped_76_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_5_1[1 + logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_5_1{[ 1 .. logic_new_func_x_2 ]} );
            return List( hoisted_54_1, function ( i_3 )
                    return REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_6_1[1 + hoisted_53_1[(1 + i_3)]] ), hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    return CreateCapCategoryMorphismWithAttributes( deduped_90_1, CreateCapCategoryObjectWithAttributes( deduped_90_1, Length, deduped_62_1 ), CreateCapCategoryObjectWithAttributes( deduped_90_1, Length, deduped_63_1 ), AsList, List( deduped_60_1, function ( x_2 )
              local hoisted_1_2;
              hoisted_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_54_1[(1 + x_2)] );
              return -1 + SafePosition( hoisted_59_1, hoisted_58_1[(1 + Sum( hoisted_39_1, function ( j_3 )
                             local deduped_1_3;
                             deduped_1_3 := (1 + j_3);
                             return hoisted_55_1[deduped_1_3][hoisted_1_2] * hoisted_57_1[deduped_1_3];
                         end ))] );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1;
    deduped_47_1 := ValuesOfPreSheaf( arg3_1 );
    deduped_46_1 := ValuesOfPreSheaf( arg2_1 );
    deduped_45_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_44_1 := deduped_45_1[2];
    deduped_43_1 := deduped_46_1[2];
    deduped_42_1 := deduped_47_1[2];
    deduped_41_1 := Length( Source( arg4_1 ) );
    deduped_40_1 := deduped_47_1[1];
    deduped_39_1 := deduped_46_1[1];
    deduped_38_1 := deduped_45_1[1];
    deduped_37_1 := [ 1 .. deduped_38_1 ];
    deduped_36_1 := deduped_38_1 - 1;
    deduped_35_1 := Length( deduped_44_1 );
    deduped_34_1 := [ 0 .. deduped_36_1 ];
    deduped_33_1 := [ 1 .. deduped_35_1 ];
    deduped_32_1 := [ 0 .. deduped_35_1 * 2 - 1 ];
    hoisted_7_1 := List( deduped_43_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_6_1 := List( deduped_42_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    hoisted_5_1 := List( deduped_40_1, Length );
    hoisted_3_1 := List( deduped_39_1, Length );
    deduped_31_1 := Concatenation( List( deduped_37_1, function ( logic_new_func_x_2 )
              return hoisted_5_1[logic_new_func_x_2] ^ hoisted_3_1[logic_new_func_x_2];
          end ), List( deduped_33_1, function ( logic_new_func_x_2 )
              return hoisted_6_1[logic_new_func_x_2] ^ hoisted_7_1[logic_new_func_x_2];
          end ) );
    deduped_30_1 := [ 0 .. Product( deduped_31_1 ) - 1 ];
    hoisted_20_1 := List( deduped_42_1, AsList );
    hoisted_19_1 := List( deduped_42_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_18_1 := deduped_44_1;
    hoisted_17_1 := List( deduped_43_1, AsList );
    hoisted_16_1 := List( deduped_43_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    hoisted_9_1 := deduped_30_1;
    hoisted_8_1 := deduped_31_1;
    hoisted_11_1 := List( [ 1 .. deduped_38_1 + deduped_35_1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_8_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_8_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_9_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_21_1 := Concatenation( List( deduped_33_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, deduped_11_2, deduped_12_2, deduped_13_2, deduped_14_2, deduped_15_2;
              deduped_15_2 := hoisted_19_1[logic_new_func_x_2];
              deduped_14_2 := hoisted_18_1[logic_new_func_x_2];
              deduped_13_2 := hoisted_7_1[logic_new_func_x_2];
              deduped_12_2 := hoisted_16_1[logic_new_func_x_2];
              deduped_11_2 := hoisted_6_1[logic_new_func_x_2];
              hoisted_8_2 := hoisted_20_1[logic_new_func_x_2];
              hoisted_7_2 := deduped_15_2;
              hoisted_3_2 := [ 0 .. deduped_13_2 - 1 ];
              hoisted_1_2 := deduped_11_2;
              hoisted_10_2 := List( [ 0 .. deduped_15_2 ^ deduped_13_2 - 1 ], function ( i_3 )
                      return Sum( List( hoisted_3_2, function ( k_4 )
                                return hoisted_8_2[(1 + REM_INT( QUO_INT( i_3, hoisted_7_2 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_2[(1 + k_4)] ) ), hoisted_7_2 ))] * hoisted_1_2 ^ k_4;
                            end ) );
                  end );
              hoisted_9_2 := hoisted_11_1[1 + deduped_14_2[2]];
              hoisted_4_2 := hoisted_17_1[logic_new_func_x_2];
              hoisted_2_2 := [ 0 .. deduped_12_2 - 1 ];
              hoisted_6_2 := List( [ 0 .. deduped_11_2 ^ deduped_12_2 - 1 ], function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := List( hoisted_2_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_1_2 ^ j_4 ), hoisted_1_2 );
                          end );
                      return Sum( List( hoisted_3_2, function ( k_4 )
                                return hoisted_1_3[(1 + hoisted_4_2[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_2[(1 + k_4)] ))])] * hoisted_1_2 ^ k_4;
                            end ) );
                  end );
              hoisted_5_2 := hoisted_11_1[1 + deduped_14_2[1]];
              return [ List( hoisted_9_1, function ( i_3 )
                          return hoisted_6_2[1 + hoisted_5_2[(1 + i_3)]];
                      end ), List( hoisted_9_1, function ( i_3 )
                          return hoisted_10_2[1 + hoisted_9_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_15_1 := deduped_32_1;
    hoisted_10_1 := deduped_36_1;
    hoisted_13_1 := Concatenation( List( deduped_33_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_8_1[1 + (hoisted_10_1 + logic_new_func_x_2)];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_14_1 := List( deduped_32_1, function ( j_2 )
            return Product( hoisted_13_1{[ 1 .. j_2 ]} );
        end );
    hoisted_12_1 := Concatenation( List( deduped_33_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_11_1[1 + (hoisted_10_1 + logic_new_func_x_2)];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    deduped_29_1 := Filtered( deduped_30_1, function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + x_2;
            return Sum( hoisted_15_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_12_1[deduped_1_3][hoisted_1_2] * hoisted_14_1[deduped_1_3];
                  end ) = Sum( hoisted_15_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_21_1[deduped_1_3][hoisted_1_2] * hoisted_14_1[deduped_1_3];
                  end );
        end );
    hoisted_28_1 := Range( cat_1 );
    hoisted_27_1 := List( deduped_34_1, function ( logic_new_func_x_2 )
            return hoisted_8_1[1 + logic_new_func_x_2];
        end );
    hoisted_25_1 := [ 0 .. deduped_41_1 - 1 ];
    hoisted_24_1 := AsList( arg4_1 );
    hoisted_23_1 := [ 0 .. Length( deduped_29_1 ) - 1 ];
    hoisted_22_1 := deduped_29_1;
    hoisted_26_1 := List( deduped_34_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_2_2 := hoisted_8_1[1 + logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_8_1{[ 1 .. logic_new_func_x_2 ]} );
            hoisted_3_2 := List( hoisted_23_1, function ( i_3 )
                    return REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_9_1[1 + hoisted_22_1[(1 + i_3)]] ), hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_25_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_24_1[(1 + i_3)]];
                end );
        end );
    hoisted_4_1 := deduped_41_1;
    hoisted_2_1 := deduped_40_1;
    hoisted_1_1 := deduped_39_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, ValuesOnAllObjects, List( deduped_37_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, deduped_9_2, deduped_10_2, deduped_11_2, deduped_12_2;
              deduped_12_2 := hoisted_5_1[i_2];
              deduped_11_2 := hoisted_3_1[i_2];
              deduped_10_2 := deduped_12_2 ^ deduped_11_2;
              deduped_9_2 := [ 0 .. hoisted_4_1 * deduped_11_2 - 1 ];
              hoisted_2_2 := deduped_12_2;
              hoisted_1_2 := deduped_10_2;
              hoisted_7_2 := List( [ 0 .. deduped_10_2 * deduped_11_2 - 1 ], function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_2_2 ^ QUO_INT( i_3, hoisted_1_2 ) ), hoisted_2_2 );
                  end );
              hoisted_6_2 := hoisted_27_1[i_2];
              hoisted_5_2 := deduped_11_2;
              hoisted_4_2 := hoisted_26_1[i_2];
              hoisted_3_2 := deduped_9_2;
              hoisted_8_2 := List( deduped_9_2, function ( logic_new_func_x_3 )
                      local deduped_1_3;
                      deduped_1_3 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_2[1 + logic_new_func_x_3] );
                      return hoisted_7_2[1 + (hoisted_4_2[1 + REM_INT( deduped_1_3, hoisted_4_1 )] + REM_INT( QUO_INT( deduped_1_3, hoisted_4_1 ), hoisted_5_2 ) * hoisted_6_2)];
                  end );
              return CreateCapCategoryMorphismWithAttributes( hoisted_28_1, hoisted_1_1[i_2], hoisted_2_1[i_2], AsList, List( [ 0 .. deduped_11_2 - 1 ], function ( i_3 )
                        return hoisted_8_2[1 + i_3];
                    end ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1;
    deduped_47_1 := ValuesOfPreSheaf( arg2_1 );
    deduped_46_1 := ValuesOfPreSheaf( arg3_1 );
    deduped_45_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_44_1 := deduped_47_1[2];
    deduped_43_1 := deduped_46_1[2];
    deduped_42_1 := deduped_47_1[1];
    deduped_41_1 := deduped_46_1[1];
    deduped_40_1 := deduped_45_1[2];
    deduped_39_1 := deduped_45_1[1];
    deduped_38_1 := [ 1 .. deduped_39_1 ];
    deduped_37_1 := deduped_39_1 - 1;
    deduped_36_1 := Length( deduped_40_1 );
    deduped_35_1 := [ 0 .. deduped_37_1 ];
    deduped_34_1 := [ 1 .. deduped_36_1 ];
    deduped_33_1 := [ 0 .. deduped_36_1 * 2 - 1 ];
    hoisted_4_1 := List( deduped_44_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_3_1 := List( deduped_43_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    hoisted_2_1 := List( deduped_42_1, Length );
    hoisted_1_1 := List( deduped_41_1, Length );
    deduped_32_1 := Concatenation( List( deduped_38_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ hoisted_2_1[logic_new_func_x_2];
          end ), List( deduped_34_1, function ( logic_new_func_x_2 )
              return hoisted_3_1[logic_new_func_x_2] ^ hoisted_4_1[logic_new_func_x_2];
          end ) );
    deduped_31_1 := [ 0 .. Product( deduped_32_1 ) - 1 ];
    hoisted_17_1 := List( deduped_43_1, AsList );
    hoisted_16_1 := List( deduped_43_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_15_1 := deduped_40_1;
    hoisted_14_1 := List( deduped_44_1, AsList );
    hoisted_13_1 := List( deduped_44_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    hoisted_6_1 := deduped_31_1;
    hoisted_5_1 := deduped_32_1;
    hoisted_8_1 := List( [ 1 .. deduped_39_1 + deduped_36_1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_5_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_5_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_6_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_18_1 := Concatenation( List( deduped_34_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, deduped_11_2, deduped_12_2, deduped_13_2, deduped_14_2, deduped_15_2;
              deduped_15_2 := hoisted_16_1[logic_new_func_x_2];
              deduped_14_2 := hoisted_15_1[logic_new_func_x_2];
              deduped_13_2 := hoisted_4_1[logic_new_func_x_2];
              deduped_12_2 := hoisted_13_1[logic_new_func_x_2];
              deduped_11_2 := hoisted_3_1[logic_new_func_x_2];
              hoisted_8_2 := hoisted_17_1[logic_new_func_x_2];
              hoisted_7_2 := deduped_15_2;
              hoisted_3_2 := [ 0 .. deduped_13_2 - 1 ];
              hoisted_1_2 := deduped_11_2;
              hoisted_10_2 := List( [ 0 .. deduped_15_2 ^ deduped_13_2 - 1 ], function ( i_3 )
                      return Sum( List( hoisted_3_2, function ( k_4 )
                                return hoisted_8_2[(1 + REM_INT( QUO_INT( i_3, hoisted_7_2 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_2[(1 + k_4)] ) ), hoisted_7_2 ))] * hoisted_1_2 ^ k_4;
                            end ) );
                  end );
              hoisted_9_2 := hoisted_8_1[1 + deduped_14_2[2]];
              hoisted_4_2 := hoisted_14_1[logic_new_func_x_2];
              hoisted_2_2 := [ 0 .. deduped_12_2 - 1 ];
              hoisted_6_2 := List( [ 0 .. deduped_11_2 ^ deduped_12_2 - 1 ], function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := List( hoisted_2_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_1_2 ^ j_4 ), hoisted_1_2 );
                          end );
                      return Sum( List( hoisted_3_2, function ( k_4 )
                                return hoisted_1_3[(1 + hoisted_4_2[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_2[(1 + k_4)] ))])] * hoisted_1_2 ^ k_4;
                            end ) );
                  end );
              hoisted_5_2 := hoisted_8_1[1 + deduped_14_2[1]];
              return [ List( hoisted_6_1, function ( i_3 )
                          return hoisted_6_2[1 + hoisted_5_2[(1 + i_3)]];
                      end ), List( hoisted_6_1, function ( i_3 )
                          return hoisted_10_2[1 + hoisted_9_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_12_1 := deduped_33_1;
    hoisted_7_1 := deduped_37_1;
    hoisted_10_1 := Concatenation( List( deduped_34_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_5_1[1 + (hoisted_7_1 + logic_new_func_x_2)];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_11_1 := List( deduped_33_1, function ( j_2 )
            return Product( hoisted_10_1{[ 1 .. j_2 ]} );
        end );
    hoisted_9_1 := Concatenation( List( deduped_34_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_8_1[1 + (hoisted_7_1 + logic_new_func_x_2)];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    deduped_30_1 := Filtered( deduped_31_1, function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + x_2;
            return Sum( hoisted_12_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_9_1[deduped_1_3][hoisted_1_2] * hoisted_11_1[deduped_1_3];
                  end ) = Sum( hoisted_12_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_18_1[deduped_1_3][hoisted_1_2] * hoisted_11_1[deduped_1_3];
                  end );
        end );
    deduped_29_1 := Length( deduped_30_1 );
    deduped_28_1 := [ 0 .. deduped_29_1 - 1 ];
    hoisted_27_1 := deduped_38_1;
    hoisted_26_1 := Range( cat_1 );
    hoisted_25_1 := List( deduped_35_1, function ( logic_new_func_x_2 )
            return hoisted_5_1[1 + logic_new_func_x_2];
        end );
    hoisted_24_1 := deduped_35_1;
    hoisted_23_1 := deduped_30_1;
    hoisted_22_1 := deduped_29_1;
    hoisted_21_1 := deduped_28_1;
    hoisted_20_1 := deduped_41_1;
    hoisted_19_1 := deduped_42_1;
    return List( deduped_28_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_21_1[1 + logic_new_func_x_2] );
            hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_6_1[1 + hoisted_23_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_21_1[(1 + REM_INT( QUO_INT( deduped_3_2, hoisted_22_1 ^ QUO_INT( deduped_3_2, hoisted_22_1 ) ), hoisted_22_1 ))] ))]] );
            hoisted_2_2 := List( hoisted_24_1, function ( logic_new_func_x_3 )
                    return ListWithIdenticalEntries( 1, REM_INT( QUO_INT( hoisted_1_2, Product( hoisted_5_1{[ 1 .. logic_new_func_x_3 ]} ) ), hoisted_5_1[1 + logic_new_func_x_3] ) );
                end );
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, ValuesOnAllObjects, List( hoisted_27_1, function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, hoisted_5_3, hoisted_6_3, hoisted_7_3, deduped_8_3, deduped_9_3, deduped_10_3, deduped_11_3;
                      deduped_11_3 := hoisted_1_1[i_3];
                      deduped_10_3 := hoisted_2_1[i_3];
                      deduped_9_3 := deduped_11_3 ^ deduped_10_3;
                      deduped_8_3 := [ 0 .. deduped_10_3 - 1 ];
                      hoisted_2_3 := deduped_11_3;
                      hoisted_1_3 := deduped_9_3;
                      hoisted_7_3 := List( [ 0 .. deduped_9_3 * deduped_10_3 - 1 ], function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_2_3 ^ QUO_INT( i_4, hoisted_1_3 ) ), hoisted_2_3 );
                          end );
                      hoisted_6_3 := hoisted_2_2[i_3][1];
                      hoisted_5_3 := hoisted_25_1[i_3];
                      hoisted_4_3 := deduped_10_3;
                      hoisted_3_3 := deduped_8_3;
                      return CreateCapCategoryMorphismWithAttributes( hoisted_26_1, hoisted_19_1[i_3], hoisted_20_1[i_3], AsList, List( deduped_8_3, function ( logic_new_func_x_4 )
                                return hoisted_7_3[1 + (hoisted_6_3 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_3[(1 + logic_new_func_x_4)] ), hoisted_4_3 ) * hoisted_5_3)];
                            end ) );
                  end ) );
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

BindGlobal( "PreSheavesInSkeletalFinSetsPrecompiled", function ( quiver )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function ( quiver )
    local sFinSets;
    sFinSets := CategoryOfSkeletalFinSets(  : FinalizeCategory := true );
    return PreSheaves( FreeCategory( quiver : range_of_HomStructure := sFinSets,
          FinalizeCategory := true ), sFinSets );
end;
        
        
    
    cat := category_constructor( quiver : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_PreSheavesInSkeletalFinSetsPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
