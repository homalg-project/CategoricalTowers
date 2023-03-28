# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_FinReflexiveQuiversAsCCCPrecompiled", function ( cat )
    
    ##
    AddExponentialOnObjects( cat,
        
########
function ( cat_1, a_1, b_1 )
    local hoisted_1_1, hoisted_3_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1, deduped_12_1, hoisted_16_1, deduped_18_1, hoisted_19_1, deduped_21_1, hoisted_22_1, deduped_23_1, hoisted_24_1, deduped_25_1, hoisted_26_1, deduped_27_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, hoisted_32_1, hoisted_34_1, hoisted_35_1, deduped_36_1, hoisted_39_1, hoisted_40_1, hoisted_44_1, hoisted_45_1, hoisted_46_1, hoisted_47_1, hoisted_48_1, hoisted_49_1, hoisted_50_1, hoisted_51_1, hoisted_52_1, hoisted_53_1, hoisted_54_1, hoisted_55_1, hoisted_56_1, deduped_58_1, deduped_59_1, hoisted_60_1, hoisted_61_1, hoisted_62_1, hoisted_63_1, hoisted_64_1, deduped_66_1, deduped_67_1, hoisted_68_1, hoisted_69_1, deduped_70_1, hoisted_71_1, deduped_72_1, hoisted_73_1, hoisted_74_1, deduped_75_1, hoisted_76_1, hoisted_77_1, hoisted_78_1, deduped_79_1, deduped_80_1, deduped_81_1, deduped_82_1, deduped_83_1, deduped_84_1, deduped_85_1, deduped_86_1, deduped_87_1, deduped_88_1, deduped_89_1, deduped_90_1, deduped_91_1, deduped_92_1, deduped_93_1, deduped_94_1, deduped_95_1, deduped_96_1, deduped_97_1, deduped_98_1, deduped_99_1, deduped_100_1, deduped_101_1, deduped_102_1, deduped_103_1, deduped_104_1, deduped_105_1, deduped_106_1, deduped_107_1, deduped_108_1, deduped_109_1, deduped_110_1, deduped_111_1, deduped_112_1, deduped_113_1, deduped_114_1, deduped_115_1, deduped_116_1, deduped_117_1, deduped_118_1, deduped_119_1, deduped_120_1, deduped_121_1, deduped_122_1, deduped_123_1, deduped_124_1, deduped_125_1, deduped_126_1, deduped_127_1;
    deduped_127_1 := [ 1, 2, 3, 4, 5 ];
    deduped_126_1 := [ 1, 2, 3, 4 ];
    deduped_125_1 := [ 1, 2, 3 ];
    deduped_124_1 := [ 1, 2 ];
    deduped_123_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( a_1 );
    deduped_122_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( b_1 );
    deduped_121_1 := deduped_122_1[4];
    deduped_120_1 := deduped_123_1[4];
    deduped_119_1 := deduped_123_1[2];
    deduped_118_1 := deduped_122_1[2];
    deduped_117_1 := deduped_123_1[1];
    deduped_116_1 := deduped_122_1[1];
    deduped_115_1 := 3 * deduped_119_1;
    deduped_114_1 := 2 * deduped_117_1;
    deduped_113_1 := deduped_116_1 ^ deduped_119_1;
    deduped_112_1 := deduped_118_1 ^ deduped_117_1;
    deduped_111_1 := deduped_118_1 ^ deduped_119_1;
    deduped_110_1 := deduped_116_1 ^ deduped_117_1;
    deduped_109_1 := [ 0 .. deduped_117_1 - 1 ];
    deduped_108_1 := [ 0 .. deduped_119_1 - 1 ];
    deduped_107_1 := [ deduped_112_1, deduped_112_1, deduped_113_1, deduped_113_1, deduped_113_1, deduped_113_1 ];
    deduped_106_1 := [ deduped_110_1, deduped_111_1, deduped_112_1, deduped_113_1, deduped_113_1 ];
    deduped_105_1 := deduped_116_1 ^ deduped_115_1;
    deduped_104_1 := deduped_118_1 ^ deduped_114_1;
    deduped_103_1 := deduped_118_1 ^ deduped_115_1;
    deduped_102_1 := deduped_116_1 ^ deduped_114_1;
    deduped_101_1 := [ 0 .. deduped_114_1 - 1 ];
    deduped_100_1 := [ 0 .. deduped_115_1 - 1 ];
    deduped_99_1 := [ 0 .. deduped_110_1 - 1 ];
    deduped_98_1 := [ 0 .. deduped_111_1 - 1 ];
    deduped_97_1 := [ deduped_104_1, deduped_104_1, deduped_105_1, deduped_105_1, deduped_105_1, deduped_105_1 ];
    deduped_96_1 := [ deduped_102_1, deduped_103_1, deduped_104_1, deduped_105_1, deduped_105_1 ];
    deduped_95_1 := [ 0 .. deduped_102_1 - 1 ];
    deduped_94_1 := [ 0 .. deduped_103_1 - 1 ];
    deduped_93_1 := [ 0 .. deduped_102_1 * deduped_103_1 - 1 ];
    deduped_92_1 := [ 0 .. Product( deduped_106_1 ) - 1 ];
    deduped_91_1 := [ 0 .. Product( deduped_96_1 ) - 1 ];
    hoisted_5_1 := Product( deduped_106_1{deduped_126_1} );
    deduped_90_1 := List( deduped_92_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_5_1 ), deduped_113_1 );
        end );
    hoisted_3_1 := Product( deduped_106_1{deduped_125_1} );
    deduped_89_1 := List( deduped_92_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_3_1 ), deduped_113_1 );
        end );
    hoisted_1_1 := Product( deduped_106_1{deduped_124_1} );
    deduped_88_1 := List( deduped_92_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_1_1 ), deduped_112_1 );
        end );
    hoisted_34_1 := Product( deduped_96_1{deduped_126_1} );
    deduped_87_1 := List( deduped_91_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_34_1 ), deduped_105_1 );
        end );
    hoisted_32_1 := Product( deduped_96_1{deduped_125_1} );
    deduped_86_1 := List( deduped_91_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_32_1 ), deduped_105_1 );
        end );
    hoisted_30_1 := Product( deduped_96_1{deduped_124_1} );
    deduped_85_1 := List( deduped_91_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_30_1 ), deduped_104_1 );
        end );
    deduped_27_1 := List( deduped_121_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_55_1 := List( deduped_94_1, function ( i_2 )
            return Sum( List( deduped_100_1, function ( k_3 )
                      return deduped_27_1[(1 + REM_INT( QUO_INT( i_2, deduped_118_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_118_1 ))] * deduped_116_1 ^ k_3;
                  end ) );
        end );
    deduped_25_1 := List( deduped_120_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_53_1 := List( deduped_100_1, function ( logic_new_func_x_2 )
            return deduped_25_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, 3 ), deduped_119_1 )];
        end );
    hoisted_51_1 := [ 1, 0, 1 ];
    hoisted_52_1 := List( deduped_100_1, function ( logic_new_func_x_2 )
            return hoisted_51_1[1 + REM_INT( logic_new_func_x_2, 3 )];
        end );
    hoisted_54_1 := List( deduped_95_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_101_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_116_1 ^ j_3 ), deduped_116_1 );
                end );
            return Sum( List( deduped_100_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 );
                      return hoisted_1_2[(1 + (hoisted_52_1[deduped_1_3] + hoisted_53_1[deduped_1_3] * 2))] * deduped_116_1 ^ k_3;
                  end ) );
        end );
    deduped_23_1 := List( deduped_121_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_50_1 := List( deduped_94_1, function ( i_2 )
            return Sum( List( deduped_100_1, function ( k_3 )
                      return deduped_23_1[(1 + REM_INT( QUO_INT( i_2, deduped_118_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_118_1 ))] * deduped_116_1 ^ k_3;
                  end ) );
        end );
    deduped_21_1 := List( deduped_120_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_48_1 := List( deduped_100_1, function ( logic_new_func_x_2 )
            return deduped_21_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, 3 ), deduped_119_1 )];
        end );
    hoisted_46_1 := [ 0, 0, 1 ];
    hoisted_47_1 := List( deduped_100_1, function ( logic_new_func_x_2 )
            return hoisted_46_1[1 + REM_INT( logic_new_func_x_2, 3 )];
        end );
    hoisted_49_1 := List( deduped_95_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_101_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_116_1 ^ j_3 ), deduped_116_1 );
                end );
            return Sum( List( deduped_100_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 );
                      return hoisted_1_2[(1 + (hoisted_47_1[deduped_1_3] + hoisted_48_1[deduped_1_3] * 2))] * deduped_116_1 ^ k_3;
                  end ) );
        end );
    deduped_18_1 := deduped_122_1[3];
    hoisted_45_1 := List( deduped_95_1, function ( i_2 )
            return Sum( List( deduped_101_1, function ( k_3 )
                      return deduped_18_1[(1 + REM_INT( QUO_INT( i_2, deduped_116_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_116_1 ))] * deduped_118_1 ^ k_3;
                  end ) );
        end );
    deduped_12_1 := deduped_123_1[3];
    hoisted_40_1 := List( deduped_101_1, function ( logic_new_func_x_2 )
            return deduped_12_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, 2 ), deduped_117_1 )];
        end );
    hoisted_39_1 := List( deduped_101_1, function ( logic_new_func_x_2 )
            return deduped_124_1[1 + REM_INT( logic_new_func_x_2, 2 )];
        end );
    hoisted_44_1 := List( deduped_94_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_100_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_118_1 ^ j_3 ), deduped_118_1 );
                end );
            return Sum( List( deduped_101_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 );
                      return hoisted_1_2[(1 + (hoisted_39_1[deduped_1_3] + hoisted_40_1[deduped_1_3] * 3))] * deduped_118_1 ^ k_3;
                  end ) );
        end );
    hoisted_56_1 := [ List( deduped_91_1, function ( logic_new_func_x_2 )
                return hoisted_44_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_102_1 ), deduped_103_1 )];
            end ), List( deduped_91_1, function ( logic_new_func_x_2 )
                return hoisted_45_1[1 + REM_INT( logic_new_func_x_2, deduped_102_1 )];
            end ), List( deduped_91_1, function ( logic_new_func_x_2 )
                return hoisted_49_1[1 + REM_INT( logic_new_func_x_2, deduped_102_1 )];
            end ), List( deduped_91_1, function ( logic_new_func_x_2 )
                return hoisted_50_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_102_1 ), deduped_103_1 )];
            end ), List( deduped_91_1, function ( logic_new_func_x_2 )
                return hoisted_54_1[1 + REM_INT( logic_new_func_x_2, deduped_102_1 )];
            end ), List( deduped_91_1, function ( logic_new_func_x_2 )
                return hoisted_55_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_102_1 ), deduped_103_1 )];
            end ) ];
    deduped_36_1 := [ 1, deduped_104_1, Product( deduped_97_1{deduped_124_1} ), Product( deduped_97_1{deduped_125_1} ), Product( deduped_97_1{deduped_126_1} ), Product( deduped_97_1{deduped_127_1} ) ];
    hoisted_35_1 := [ deduped_85_1, deduped_85_1, deduped_86_1, deduped_86_1, deduped_87_1, deduped_87_1 ];
    deduped_8_1 := [ 0, 1, 2, 3, 4, 5 ];
    deduped_84_1 := Filtered( deduped_91_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return Sum( deduped_8_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_35_1[deduped_1_3][deduped_1_2] * deduped_36_1[deduped_1_3];
                  end ) = Sum( deduped_8_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_56_1[deduped_1_3][deduped_1_2] * deduped_36_1[deduped_1_3];
                  end );
        end );
    hoisted_28_1 := List( deduped_98_1, function ( i_2 )
            return Sum( List( deduped_108_1, function ( k_3 )
                      return deduped_27_1[(1 + REM_INT( QUO_INT( i_2, deduped_118_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_118_1 ))] * deduped_116_1 ^ k_3;
                  end ) );
        end );
    hoisted_26_1 := List( deduped_99_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_109_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_116_1 ^ j_3 ), deduped_116_1 );
                end );
            return Sum( List( deduped_108_1, function ( k_3 )
                      return hoisted_1_2[(1 + deduped_25_1[(1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( k_3 ), deduped_119_1 ))])] * deduped_116_1 ^ k_3;
                  end ) );
        end );
    hoisted_24_1 := List( deduped_98_1, function ( i_2 )
            return Sum( List( deduped_108_1, function ( k_3 )
                      return deduped_23_1[(1 + REM_INT( QUO_INT( i_2, deduped_118_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_118_1 ))] * deduped_116_1 ^ k_3;
                  end ) );
        end );
    hoisted_22_1 := List( deduped_99_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_109_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_116_1 ^ j_3 ), deduped_116_1 );
                end );
            return Sum( List( deduped_108_1, function ( k_3 )
                      return hoisted_1_2[(1 + deduped_21_1[(1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( k_3 ), deduped_119_1 ))])] * deduped_116_1 ^ k_3;
                  end ) );
        end );
    hoisted_19_1 := List( deduped_99_1, function ( i_2 )
            return Sum( List( deduped_109_1, function ( k_3 )
                      return deduped_18_1[(1 + REM_INT( QUO_INT( i_2, deduped_116_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_116_1 ))] * deduped_118_1 ^ k_3;
                  end ) );
        end );
    hoisted_16_1 := List( deduped_98_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_108_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_118_1 ^ j_3 ), deduped_118_1 );
                end );
            return Sum( List( deduped_109_1, function ( k_3 )
                      return hoisted_1_2[(1 + deduped_12_1[(1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( k_3 ), deduped_117_1 ))])] * deduped_118_1 ^ k_3;
                  end ) );
        end );
    hoisted_29_1 := [ List( deduped_92_1, function ( logic_new_func_x_2 )
                return hoisted_16_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_110_1 ), deduped_111_1 )];
            end ), List( deduped_92_1, function ( logic_new_func_x_2 )
                return hoisted_19_1[1 + REM_INT( logic_new_func_x_2, deduped_110_1 )];
            end ), List( deduped_92_1, function ( logic_new_func_x_2 )
                return hoisted_22_1[1 + REM_INT( logic_new_func_x_2, deduped_110_1 )];
            end ), List( deduped_92_1, function ( logic_new_func_x_2 )
                return hoisted_24_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_110_1 ), deduped_111_1 )];
            end ), List( deduped_92_1, function ( logic_new_func_x_2 )
                return hoisted_26_1[1 + REM_INT( logic_new_func_x_2, deduped_110_1 )];
            end ), List( deduped_92_1, function ( logic_new_func_x_2 )
                return hoisted_28_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_110_1 ), deduped_111_1 )];
            end ) ];
    deduped_7_1 := [ 1, deduped_112_1, Product( deduped_107_1{deduped_124_1} ), Product( deduped_107_1{deduped_125_1} ), Product( deduped_107_1{deduped_126_1} ), Product( deduped_107_1{deduped_127_1} ) ];
    hoisted_6_1 := [ deduped_88_1, deduped_88_1, deduped_89_1, deduped_89_1, deduped_90_1, deduped_90_1 ];
    deduped_83_1 := Filtered( deduped_92_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return Sum( deduped_8_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_6_1[deduped_1_3][deduped_1_2] * deduped_7_1[deduped_1_3];
                  end ) = Sum( deduped_8_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_29_1[deduped_1_3][deduped_1_2] * deduped_7_1[deduped_1_3];
                  end );
        end );
    deduped_82_1 := Length( deduped_84_1 );
    deduped_81_1 := Length( deduped_83_1 );
    deduped_80_1 := [ 0 .. deduped_82_1 - 1 ];
    deduped_79_1 := [ 0 .. deduped_81_1 - 1 ];
    deduped_72_1 := List( deduped_108_1, function ( logic_new_func_x_2 )
            return REM_INT( logic_new_func_x_2, deduped_119_1 );
        end );
    hoisted_77_1 := List( deduped_94_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_100_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_118_1 ^ j_3 ), deduped_118_1 );
                end );
            return Sum( List( deduped_108_1, function ( k_3 )
                      return hoisted_1_2[(1 + (2 + deduped_72_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))] * 3))] * deduped_118_1 ^ k_3;
                  end ) );
        end );
    deduped_70_1 := List( deduped_109_1, function ( logic_new_func_x_2 )
            return REM_INT( logic_new_func_x_2, deduped_117_1 );
        end );
    hoisted_76_1 := List( deduped_95_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_101_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_116_1 ^ j_3 ), deduped_116_1 );
                end );
            return Sum( List( deduped_109_1, function ( k_3 )
                      return hoisted_1_2[(1 + (1 + deduped_70_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))] * 2))] * deduped_116_1 ^ k_3;
                  end ) );
        end );
    hoisted_78_1 := List( deduped_93_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return hoisted_76_1[1 + REM_INT( deduped_1_2, deduped_102_1 )] + hoisted_77_1[(1 + REM_INT( QUO_INT( deduped_1_2, deduped_102_1 ), deduped_103_1 ))] * deduped_110_1;
        end );
    deduped_67_1 := List( deduped_79_1, function ( i_2 )
            return REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_83_1[1 + i_2] ), deduped_110_1 ), deduped_111_1 );
        end );
    deduped_66_1 := List( deduped_79_1, function ( i_2 )
            return REM_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_83_1[1 + i_2] ), deduped_110_1 );
        end );
    deduped_75_1 := List( deduped_79_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return deduped_66_1[deduped_1_2] + deduped_67_1[deduped_1_2] * deduped_110_1;
        end );
    hoisted_73_1 := List( deduped_94_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_100_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_118_1 ^ j_3 ), deduped_118_1 );
                end );
            return Sum( List( deduped_108_1, function ( k_3 )
                      return hoisted_1_2[(1 + (1 + deduped_72_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))] * 3))] * deduped_118_1 ^ k_3;
                  end ) );
        end );
    hoisted_71_1 := List( deduped_95_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_101_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_116_1 ^ j_3 ), deduped_116_1 );
                end );
            return Sum( List( deduped_109_1, function ( k_3 )
                      return hoisted_1_2[(1 + deduped_70_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))] * 2)] * deduped_116_1 ^ k_3;
                  end ) );
        end );
    hoisted_74_1 := List( deduped_93_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return hoisted_71_1[1 + REM_INT( deduped_1_2, deduped_102_1 )] + hoisted_73_1[(1 + REM_INT( QUO_INT( deduped_1_2, deduped_102_1 ), deduped_103_1 ))] * deduped_110_1;
        end );
    deduped_59_1 := List( deduped_80_1, function ( i_2 )
            return REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_84_1[1 + i_2] ), deduped_102_1 ), deduped_103_1 );
        end );
    deduped_58_1 := List( deduped_80_1, function ( i_2 )
            return REM_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_84_1[1 + i_2] ), deduped_102_1 );
        end );
    hoisted_69_1 := List( deduped_80_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return deduped_58_1[deduped_1_2] + deduped_59_1[deduped_1_2] * deduped_102_1;
        end );
    hoisted_63_1 := List( deduped_100_1, function ( logic_new_func_x_2 )
            return REM_INT( QUO_INT( logic_new_func_x_2, 3 ), deduped_119_1 );
        end );
    hoisted_61_1 := [ 0, 0, 0 ];
    hoisted_62_1 := List( deduped_100_1, function ( logic_new_func_x_2 )
            return hoisted_61_1[1 + REM_INT( logic_new_func_x_2, 3 )];
        end );
    hoisted_64_1 := List( deduped_98_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_108_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_118_1 ^ j_3 ), deduped_118_1 );
                end );
            return Sum( List( deduped_100_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 );
                      return hoisted_1_2[(1 + (hoisted_62_1[deduped_1_3] + hoisted_63_1[deduped_1_3]))] * deduped_118_1 ^ k_3;
                  end ) );
        end );
    hoisted_60_1 := List( deduped_99_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_109_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_116_1 ^ j_3 ), deduped_116_1 );
                end );
            return Sum( List( deduped_101_1, function ( k_3 )
                      return hoisted_1_2[(1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( k_3 ), 2 ), deduped_117_1 ))] * deduped_116_1 ^ k_3;
                  end ) );
        end );
    hoisted_68_1 := List( [ 0 .. deduped_110_1 * deduped_111_1 - 1 ], function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return hoisted_60_1[1 + REM_INT( deduped_1_2, deduped_110_1 )] + hoisted_64_1[(1 + REM_INT( QUO_INT( deduped_1_2, deduped_110_1 ), deduped_111_1 ))] * deduped_102_1;
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets, NTuple( 4, deduped_81_1, deduped_82_1, List( deduped_79_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return -1 + SafePosition( hoisted_69_1, hoisted_68_1[(1 + (deduped_66_1[deduped_1_2] + deduped_67_1[deduped_1_2] * deduped_110_1))] );
            end ), List( deduped_80_1, function ( logic_new_func_x_2 )
                local deduped_1_2, deduped_2_2;
                deduped_2_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 );
                deduped_1_2 := 1 + (deduped_58_1[deduped_2_2] + deduped_59_1[deduped_2_2] * deduped_102_1);
                return NTuple( 2, -1 + SafePosition( deduped_75_1, hoisted_74_1[deduped_1_2] ), -1 + SafePosition( deduped_75_1, hoisted_78_1[deduped_1_2] ) );
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

BindGlobal( "FinReflexiveQuiversAsCCCPrecompiled", function (  )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function (  )
    return CategoryOfReflexiveQuiversEnrichedOver( CategoryOfSkeletalFinSets(  : FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_FinReflexiveQuiversAsCCCPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
