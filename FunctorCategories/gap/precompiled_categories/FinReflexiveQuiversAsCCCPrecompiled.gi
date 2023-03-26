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
    local hoisted_1_1, hoisted_3_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1, deduped_11_1, hoisted_12_1, hoisted_13_1, deduped_15_1, hoisted_16_1, hoisted_17_1, hoisted_21_1, deduped_23_1, hoisted_24_1, deduped_25_1, hoisted_26_1, hoisted_27_1, deduped_29_1, hoisted_30_1, deduped_31_1, hoisted_32_1, deduped_33_1, hoisted_34_1, hoisted_35_1, hoisted_36_1, deduped_37_1, hoisted_38_1, hoisted_39_1, deduped_40_1, hoisted_41_1, hoisted_42_1, hoisted_43_1, hoisted_45_1, hoisted_47_1, hoisted_48_1, deduped_49_1, deduped_51_1, hoisted_52_1, hoisted_53_1, hoisted_54_1, hoisted_55_1, hoisted_59_1, hoisted_60_1, deduped_61_1, hoisted_62_1, hoisted_63_1, hoisted_64_1, deduped_65_1, hoisted_66_1, hoisted_67_1, hoisted_68_1, hoisted_69_1, hoisted_70_1, hoisted_71_1, hoisted_72_1, hoisted_73_1, deduped_75_1, deduped_76_1, hoisted_77_1, hoisted_78_1, hoisted_79_1, hoisted_80_1, hoisted_81_1, hoisted_82_1, hoisted_83_1, hoisted_84_1, deduped_86_1, deduped_87_1, hoisted_88_1, hoisted_89_1, deduped_90_1, hoisted_91_1, hoisted_92_1, deduped_93_1, hoisted_94_1, hoisted_95_1, hoisted_96_1, deduped_97_1, hoisted_98_1, hoisted_99_1, hoisted_100_1, hoisted_101_1, hoisted_102_1, deduped_103_1, deduped_104_1, deduped_105_1, deduped_106_1, deduped_107_1, deduped_108_1, deduped_109_1, deduped_110_1, deduped_111_1, deduped_112_1, deduped_113_1, deduped_114_1, deduped_115_1, deduped_116_1, deduped_117_1, deduped_118_1, deduped_119_1, deduped_120_1, deduped_121_1, deduped_122_1, deduped_123_1, deduped_124_1, deduped_125_1, deduped_126_1, deduped_127_1, deduped_128_1, deduped_129_1, deduped_130_1, deduped_131_1, deduped_132_1, deduped_133_1, deduped_134_1, deduped_135_1, deduped_136_1, deduped_137_1, deduped_138_1, deduped_139_1, deduped_140_1, deduped_141_1, deduped_142_1, deduped_143_1, deduped_144_1, deduped_145_1, deduped_146_1, deduped_147_1, deduped_148_1, deduped_149_1, deduped_150_1, deduped_151_1, deduped_152_1, deduped_153_1, deduped_154_1, deduped_155_1, deduped_156_1, deduped_157_1, deduped_158_1, deduped_159_1, deduped_160_1, deduped_161_1, deduped_162_1, deduped_163_1, deduped_164_1, deduped_165_1, deduped_166_1, deduped_167_1, deduped_168_1, deduped_169_1, deduped_170_1, deduped_171_1, deduped_172_1, deduped_173_1, deduped_174_1;
    deduped_174_1 := [ 2, 2, 2 ];
    deduped_173_1 := [ 1, 1, 1 ];
    deduped_172_1 := [ 0, 0, 0 ];
    deduped_171_1 := [ 0, 0, 1, 1, 1, 1, 1 ];
    deduped_170_1 := [ 1, 3 ];
    deduped_169_1 := [ 1, 1 ];
    deduped_168_1 := [ 2 ];
    deduped_167_1 := [ 1 ];
    deduped_166_1 := [ 0, 0 ];
    deduped_165_1 := [ 0 ];
    deduped_164_1 := [ 0, 1, 0, 0, 1, 1, 1 ];
    deduped_163_1 := [ 1, 2, 3, 4, 5 ];
    deduped_162_1 := [ 1, 2, 3, 4 ];
    deduped_161_1 := [ 1, 2, 3 ];
    deduped_160_1 := [ 1, 2 ];
    deduped_159_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( a_1 );
    deduped_158_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( b_1 );
    deduped_157_1 := [ deduped_165_1, deduped_172_1, deduped_165_1, deduped_167_1, [ 1, 0, 1 ], deduped_172_1, deduped_173_1 ];
    deduped_156_1 := [ deduped_165_1, deduped_172_1, deduped_165_1, deduped_167_1, [ 0, 0, 1 ], deduped_172_1, deduped_173_1 ];
    deduped_155_1 := [ deduped_165_1, deduped_166_1, deduped_167_1, deduped_168_1, deduped_160_1, deduped_169_1, [ 2, 2 ] ];
    deduped_154_1 := 1 + CAP_JIT_INCOMPLETE_LOGIC( 4 );
    deduped_153_1 := deduped_158_1[4];
    deduped_152_1 := deduped_159_1[4];
    deduped_151_1 := 1 + CAP_JIT_INCOMPLETE_LOGIC( 0 );
    deduped_150_1 := deduped_159_1[2];
    deduped_149_1 := deduped_158_1[2];
    deduped_148_1 := deduped_159_1[1];
    deduped_147_1 := deduped_158_1[1];
    deduped_146_1 := [ [ deduped_165_1, deduped_166_1, deduped_165_1, deduped_167_1, [ 0, 1 ], deduped_166_1, deduped_169_1 ], deduped_155_1, deduped_156_1, deduped_157_1, [ deduped_165_1, deduped_172_1, deduped_167_1, deduped_168_1, [ 0, 1, 2 ], deduped_173_1, deduped_174_1 ], [ deduped_165_1, deduped_172_1, deduped_167_1, deduped_168_1, [ 1, 1, 2 ], deduped_173_1, deduped_174_1 ], [ deduped_165_1, deduped_172_1, deduped_167_1, deduped_168_1, [ 2, 1, 2 ], deduped_173_1, deduped_174_1 ] ];
    deduped_145_1 := 3 * deduped_150_1;
    deduped_144_1 := 2 * deduped_148_1;
    deduped_143_1 := deduped_147_1 ^ deduped_150_1;
    deduped_142_1 := deduped_149_1 ^ deduped_148_1;
    deduped_141_1 := deduped_149_1 ^ deduped_150_1;
    deduped_140_1 := deduped_147_1 ^ deduped_148_1;
    deduped_139_1 := [ 0 .. deduped_148_1 - 1 ];
    deduped_138_1 := [ 0 .. deduped_150_1 - 1 ];
    deduped_137_1 := [ deduped_142_1, deduped_142_1, deduped_143_1, deduped_143_1, deduped_143_1, deduped_143_1 ];
    deduped_136_1 := [ deduped_140_1, deduped_141_1, deduped_142_1, deduped_143_1, deduped_143_1 ];
    deduped_135_1 := deduped_146_1[deduped_154_1];
    deduped_134_1 := deduped_146_1[deduped_151_1];
    deduped_133_1 := 1 + deduped_171_1[deduped_154_1];
    deduped_132_1 := 1 + deduped_164_1[deduped_154_1];
    deduped_131_1 := 1 + deduped_171_1[deduped_151_1];
    deduped_130_1 := 1 + deduped_164_1[deduped_151_1];
    deduped_129_1 := deduped_147_1 ^ deduped_145_1;
    deduped_128_1 := deduped_149_1 ^ deduped_144_1;
    deduped_127_1 := deduped_149_1 ^ deduped_145_1;
    deduped_126_1 := deduped_147_1 ^ deduped_144_1;
    deduped_125_1 := [ 0 .. deduped_144_1 - 1 ];
    deduped_124_1 := [ 0 .. deduped_145_1 - 1 ];
    deduped_123_1 := [ 0 .. deduped_140_1 - 1 ];
    deduped_122_1 := [ 0 .. deduped_141_1 - 1 ];
    deduped_121_1 := [ deduped_128_1, deduped_128_1, deduped_129_1, deduped_129_1, deduped_129_1, deduped_129_1 ];
    deduped_120_1 := [ deduped_126_1, deduped_127_1, deduped_128_1, deduped_129_1, deduped_129_1 ];
    deduped_119_1 := [ 0 .. deduped_126_1 - 1 ];
    deduped_118_1 := [ 0 .. deduped_127_1 - 1 ];
    deduped_117_1 := [ 0 .. deduped_126_1 * deduped_127_1 - 1 ];
    deduped_116_1 := [ 0 .. Product( deduped_136_1 ) - 1 ];
    deduped_115_1 := [ 0 .. Product( deduped_120_1 ) - 1 ];
    hoisted_5_1 := Product( deduped_136_1{deduped_162_1} );
    deduped_114_1 := List( deduped_116_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_5_1 ), deduped_143_1 );
        end );
    hoisted_3_1 := Product( deduped_136_1{deduped_161_1} );
    deduped_113_1 := List( deduped_116_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_3_1 ), deduped_143_1 );
        end );
    hoisted_1_1 := Product( deduped_136_1{deduped_160_1} );
    deduped_112_1 := List( deduped_116_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_1_1 ), deduped_142_1 );
        end );
    hoisted_47_1 := Product( deduped_120_1{deduped_162_1} );
    deduped_111_1 := List( deduped_115_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_47_1 ), deduped_129_1 );
        end );
    hoisted_45_1 := Product( deduped_120_1{deduped_161_1} );
    deduped_110_1 := List( deduped_115_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_45_1 ), deduped_129_1 );
        end );
    hoisted_43_1 := Product( deduped_120_1{deduped_160_1} );
    deduped_109_1 := List( deduped_115_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_43_1 ), deduped_128_1 );
        end );
    deduped_40_1 := List( deduped_153_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_72_1 := List( deduped_118_1, function ( i_2 )
            return Sum( List( deduped_124_1, function ( k_3 )
                      return deduped_40_1[(1 + REM_INT( QUO_INT( i_2, deduped_149_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_149_1 ))] * deduped_147_1 ^ k_3;
                  end ) );
        end );
    deduped_61_1 := deduped_170_1[deduped_132_1];
    deduped_37_1 := List( deduped_152_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_70_1 := List( deduped_124_1, function ( logic_new_func_x_2 )
            return deduped_37_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_61_1 ), deduped_150_1 )];
        end );
    hoisted_68_1 := deduped_157_1[deduped_154_1];
    hoisted_69_1 := List( deduped_124_1, function ( logic_new_func_x_2 )
            return hoisted_68_1[1 + REM_INT( logic_new_func_x_2, deduped_61_1 )];
        end );
    deduped_65_1 := deduped_160_1[deduped_133_1];
    hoisted_71_1 := List( deduped_119_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_125_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_147_1 ^ j_3 ), deduped_147_1 );
                end );
            return Sum( List( deduped_124_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 );
                      return hoisted_1_2[(1 + (hoisted_69_1[deduped_1_3] + hoisted_70_1[deduped_1_3] * deduped_65_1))] * deduped_147_1 ^ k_3;
                  end ) );
        end );
    deduped_33_1 := List( deduped_153_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_67_1 := List( deduped_118_1, function ( i_2 )
            return Sum( List( deduped_124_1, function ( k_3 )
                      return deduped_33_1[(1 + REM_INT( QUO_INT( i_2, deduped_149_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_149_1 ))] * deduped_147_1 ^ k_3;
                  end ) );
        end );
    deduped_29_1 := List( deduped_152_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_64_1 := List( deduped_124_1, function ( logic_new_func_x_2 )
            return deduped_29_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_61_1 ), deduped_150_1 )];
        end );
    hoisted_62_1 := deduped_156_1[deduped_154_1];
    hoisted_63_1 := List( deduped_124_1, function ( logic_new_func_x_2 )
            return hoisted_62_1[1 + REM_INT( logic_new_func_x_2, deduped_61_1 )];
        end );
    hoisted_66_1 := List( deduped_119_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_125_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_147_1 ^ j_3 ), deduped_147_1 );
                end );
            return Sum( List( deduped_124_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 );
                      return hoisted_1_2[(1 + (hoisted_63_1[deduped_1_3] + hoisted_64_1[deduped_1_3] * deduped_65_1))] * deduped_147_1 ^ k_3;
                  end ) );
        end );
    deduped_23_1 := deduped_158_1[3];
    hoisted_60_1 := List( deduped_119_1, function ( i_2 )
            return Sum( List( deduped_125_1, function ( k_3 )
                      return deduped_23_1[(1 + REM_INT( QUO_INT( i_2, deduped_147_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_147_1 ))] * deduped_149_1 ^ k_3;
                  end ) );
        end );
    hoisted_55_1 := deduped_170_1[deduped_133_1];
    deduped_51_1 := deduped_160_1[deduped_132_1];
    deduped_15_1 := deduped_159_1[3];
    hoisted_54_1 := List( deduped_125_1, function ( logic_new_func_x_2 )
            return deduped_15_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_51_1 ), deduped_148_1 )];
        end );
    hoisted_52_1 := deduped_155_1[deduped_154_1];
    hoisted_53_1 := List( deduped_125_1, function ( logic_new_func_x_2 )
            return hoisted_52_1[1 + REM_INT( logic_new_func_x_2, deduped_51_1 )];
        end );
    hoisted_59_1 := List( deduped_118_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_124_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_149_1 ^ j_3 ), deduped_149_1 );
                end );
            return Sum( List( deduped_125_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 );
                      return hoisted_1_2[(1 + (hoisted_53_1[deduped_1_3] + hoisted_54_1[deduped_1_3] * hoisted_55_1))] * deduped_149_1 ^ k_3;
                  end ) );
        end );
    hoisted_73_1 := [ List( deduped_115_1, function ( logic_new_func_x_2 )
                return hoisted_59_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_126_1 ), deduped_127_1 )];
            end ), List( deduped_115_1, function ( logic_new_func_x_2 )
                return hoisted_60_1[1 + REM_INT( logic_new_func_x_2, deduped_126_1 )];
            end ), List( deduped_115_1, function ( logic_new_func_x_2 )
                return hoisted_66_1[1 + REM_INT( logic_new_func_x_2, deduped_126_1 )];
            end ), List( deduped_115_1, function ( logic_new_func_x_2 )
                return hoisted_67_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_126_1 ), deduped_127_1 )];
            end ), List( deduped_115_1, function ( logic_new_func_x_2 )
                return hoisted_71_1[1 + REM_INT( logic_new_func_x_2, deduped_126_1 )];
            end ), List( deduped_115_1, function ( logic_new_func_x_2 )
                return hoisted_72_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_126_1 ), deduped_127_1 )];
            end ) ];
    deduped_49_1 := [ 1, deduped_128_1, Product( deduped_121_1{deduped_160_1} ), Product( deduped_121_1{deduped_161_1} ), Product( deduped_121_1{deduped_162_1} ), Product( deduped_121_1{deduped_163_1} ) ];
    hoisted_48_1 := [ deduped_109_1, deduped_109_1, deduped_110_1, deduped_110_1, deduped_111_1, deduped_111_1 ];
    deduped_8_1 := [ 0, 1, 2, 3, 4, 5 ];
    deduped_108_1 := Filtered( deduped_115_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return Sum( deduped_8_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_48_1[deduped_1_3][deduped_1_2] * deduped_49_1[deduped_1_3];
                  end ) = Sum( deduped_8_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_73_1[deduped_1_3][deduped_1_2] * deduped_49_1[deduped_1_3];
                  end );
        end );
    hoisted_41_1 := List( deduped_122_1, function ( i_2 )
            return Sum( List( deduped_138_1, function ( k_3 )
                      return deduped_40_1[(1 + REM_INT( QUO_INT( i_2, deduped_149_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_149_1 ))] * deduped_147_1 ^ k_3;
                  end ) );
        end );
    deduped_25_1 := deduped_170_1[deduped_130_1];
    hoisted_38_1 := List( deduped_138_1, function ( logic_new_func_x_2 )
            return deduped_37_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_25_1 ), deduped_150_1 )];
        end );
    hoisted_35_1 := deduped_157_1[deduped_151_1];
    hoisted_36_1 := List( deduped_138_1, function ( logic_new_func_x_2 )
            return hoisted_35_1[1 + REM_INT( logic_new_func_x_2, deduped_25_1 )];
        end );
    deduped_31_1 := deduped_160_1[deduped_131_1];
    hoisted_39_1 := List( deduped_123_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_139_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_147_1 ^ j_3 ), deduped_147_1 );
                end );
            return Sum( List( deduped_138_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 );
                      return hoisted_1_2[(1 + (hoisted_36_1[deduped_1_3] + hoisted_38_1[deduped_1_3] * deduped_31_1))] * deduped_147_1 ^ k_3;
                  end ) );
        end );
    hoisted_34_1 := List( deduped_122_1, function ( i_2 )
            return Sum( List( deduped_138_1, function ( k_3 )
                      return deduped_33_1[(1 + REM_INT( QUO_INT( i_2, deduped_149_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_149_1 ))] * deduped_147_1 ^ k_3;
                  end ) );
        end );
    hoisted_30_1 := List( deduped_138_1, function ( logic_new_func_x_2 )
            return deduped_29_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_25_1 ), deduped_150_1 )];
        end );
    hoisted_26_1 := deduped_156_1[deduped_151_1];
    hoisted_27_1 := List( deduped_138_1, function ( logic_new_func_x_2 )
            return hoisted_26_1[1 + REM_INT( logic_new_func_x_2, deduped_25_1 )];
        end );
    hoisted_32_1 := List( deduped_123_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_139_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_147_1 ^ j_3 ), deduped_147_1 );
                end );
            return Sum( List( deduped_138_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 );
                      return hoisted_1_2[(1 + (hoisted_27_1[deduped_1_3] + hoisted_30_1[deduped_1_3] * deduped_31_1))] * deduped_147_1 ^ k_3;
                  end ) );
        end );
    hoisted_24_1 := List( deduped_123_1, function ( i_2 )
            return Sum( List( deduped_139_1, function ( k_3 )
                      return deduped_23_1[(1 + REM_INT( QUO_INT( i_2, deduped_147_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_147_1 ))] * deduped_149_1 ^ k_3;
                  end ) );
        end );
    hoisted_17_1 := deduped_170_1[deduped_131_1];
    deduped_11_1 := deduped_160_1[deduped_130_1];
    hoisted_16_1 := List( deduped_139_1, function ( logic_new_func_x_2 )
            return deduped_15_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_11_1 ), deduped_148_1 )];
        end );
    hoisted_12_1 := deduped_155_1[deduped_151_1];
    hoisted_13_1 := List( deduped_139_1, function ( logic_new_func_x_2 )
            return hoisted_12_1[1 + REM_INT( logic_new_func_x_2, deduped_11_1 )];
        end );
    hoisted_21_1 := List( deduped_122_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_138_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_149_1 ^ j_3 ), deduped_149_1 );
                end );
            return Sum( List( deduped_139_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 );
                      return hoisted_1_2[(1 + (hoisted_13_1[deduped_1_3] + hoisted_16_1[deduped_1_3] * hoisted_17_1))] * deduped_149_1 ^ k_3;
                  end ) );
        end );
    hoisted_42_1 := [ List( deduped_116_1, function ( logic_new_func_x_2 )
                return hoisted_21_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_140_1 ), deduped_141_1 )];
            end ), List( deduped_116_1, function ( logic_new_func_x_2 )
                return hoisted_24_1[1 + REM_INT( logic_new_func_x_2, deduped_140_1 )];
            end ), List( deduped_116_1, function ( logic_new_func_x_2 )
                return hoisted_32_1[1 + REM_INT( logic_new_func_x_2, deduped_140_1 )];
            end ), List( deduped_116_1, function ( logic_new_func_x_2 )
                return hoisted_34_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_140_1 ), deduped_141_1 )];
            end ), List( deduped_116_1, function ( logic_new_func_x_2 )
                return hoisted_39_1[1 + REM_INT( logic_new_func_x_2, deduped_140_1 )];
            end ), List( deduped_116_1, function ( logic_new_func_x_2 )
                return hoisted_41_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_140_1 ), deduped_141_1 )];
            end ) ];
    deduped_7_1 := [ 1, deduped_142_1, Product( deduped_137_1{deduped_160_1} ), Product( deduped_137_1{deduped_161_1} ), Product( deduped_137_1{deduped_162_1} ), Product( deduped_137_1{deduped_163_1} ) ];
    hoisted_6_1 := [ deduped_112_1, deduped_112_1, deduped_113_1, deduped_113_1, deduped_114_1, deduped_114_1 ];
    deduped_107_1 := Filtered( deduped_116_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return Sum( deduped_8_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_6_1[deduped_1_3][deduped_1_2] * deduped_7_1[deduped_1_3];
                  end ) = Sum( deduped_8_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_42_1[deduped_1_3][deduped_1_2] * deduped_7_1[deduped_1_3];
                  end );
        end );
    deduped_106_1 := Length( deduped_108_1 );
    deduped_105_1 := Length( deduped_107_1 );
    deduped_104_1 := [ 0 .. deduped_106_1 - 1 ];
    deduped_103_1 := [ 0 .. deduped_105_1 - 1 ];
    hoisted_100_1 := deduped_135_1[4][1];
    deduped_93_1 := List( deduped_138_1, function ( logic_new_func_x_2 )
            return REM_INT( logic_new_func_x_2, deduped_150_1 );
        end );
    hoisted_101_1 := List( deduped_118_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_124_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_149_1 ^ j_3 ), deduped_149_1 );
                end );
            return Sum( List( deduped_138_1, function ( k_3 )
                      return hoisted_1_2[(1 + (hoisted_100_1 + deduped_93_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))] * 3))] * deduped_149_1 ^ k_3;
                  end ) );
        end );
    hoisted_98_1 := deduped_134_1[4][1];
    deduped_90_1 := List( deduped_139_1, function ( logic_new_func_x_2 )
            return REM_INT( logic_new_func_x_2, deduped_148_1 );
        end );
    hoisted_99_1 := List( deduped_119_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_125_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_147_1 ^ j_3 ), deduped_147_1 );
                end );
            return Sum( List( deduped_139_1, function ( k_3 )
                      return hoisted_1_2[(1 + (hoisted_98_1 + deduped_90_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))] * 2))] * deduped_147_1 ^ k_3;
                  end ) );
        end );
    hoisted_102_1 := List( deduped_117_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return hoisted_99_1[1 + REM_INT( deduped_1_2, deduped_126_1 )] + hoisted_101_1[(1 + REM_INT( QUO_INT( deduped_1_2, deduped_126_1 ), deduped_127_1 ))] * deduped_140_1;
        end );
    deduped_87_1 := List( deduped_103_1, function ( i_2 )
            return REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_107_1[1 + i_2] ), deduped_140_1 ), deduped_141_1 );
        end );
    deduped_86_1 := List( deduped_103_1, function ( i_2 )
            return REM_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_107_1[1 + i_2] ), deduped_140_1 );
        end );
    deduped_97_1 := List( deduped_103_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return deduped_86_1[deduped_1_2] + deduped_87_1[deduped_1_2] * deduped_140_1;
        end );
    hoisted_94_1 := deduped_135_1[3][1];
    hoisted_95_1 := List( deduped_118_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_124_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_149_1 ^ j_3 ), deduped_149_1 );
                end );
            return Sum( List( deduped_138_1, function ( k_3 )
                      return hoisted_1_2[(1 + (hoisted_94_1 + deduped_93_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))] * 3))] * deduped_149_1 ^ k_3;
                  end ) );
        end );
    hoisted_91_1 := deduped_134_1[3][1];
    hoisted_92_1 := List( deduped_119_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_125_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_147_1 ^ j_3 ), deduped_147_1 );
                end );
            return Sum( List( deduped_139_1, function ( k_3 )
                      return hoisted_1_2[(1 + (hoisted_91_1 + deduped_90_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))] * 2))] * deduped_147_1 ^ k_3;
                  end ) );
        end );
    hoisted_96_1 := List( deduped_117_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return hoisted_92_1[1 + REM_INT( deduped_1_2, deduped_126_1 )] + hoisted_95_1[(1 + REM_INT( QUO_INT( deduped_1_2, deduped_126_1 ), deduped_127_1 ))] * deduped_140_1;
        end );
    deduped_76_1 := List( deduped_104_1, function ( i_2 )
            return REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_108_1[1 + i_2] ), deduped_126_1 ), deduped_127_1 );
        end );
    deduped_75_1 := List( deduped_104_1, function ( i_2 )
            return REM_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_108_1[1 + i_2] ), deduped_126_1 );
        end );
    hoisted_89_1 := List( deduped_104_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return deduped_75_1[deduped_1_2] + deduped_76_1[deduped_1_2] * deduped_126_1;
        end );
    hoisted_83_1 := List( deduped_124_1, function ( logic_new_func_x_2 )
            return REM_INT( QUO_INT( logic_new_func_x_2, 3 ), deduped_150_1 );
        end );
    hoisted_81_1 := deduped_135_1[2];
    hoisted_82_1 := List( deduped_124_1, function ( logic_new_func_x_2 )
            return hoisted_81_1[1 + REM_INT( logic_new_func_x_2, 3 )];
        end );
    hoisted_84_1 := List( deduped_122_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_138_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_149_1 ^ j_3 ), deduped_149_1 );
                end );
            return Sum( List( deduped_124_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 );
                      return hoisted_1_2[(1 + (hoisted_82_1[deduped_1_3] + hoisted_83_1[deduped_1_3]))] * deduped_149_1 ^ k_3;
                  end ) );
        end );
    hoisted_79_1 := List( deduped_125_1, function ( logic_new_func_x_2 )
            return REM_INT( QUO_INT( logic_new_func_x_2, 2 ), deduped_148_1 );
        end );
    hoisted_77_1 := deduped_134_1[2];
    hoisted_78_1 := List( deduped_125_1, function ( logic_new_func_x_2 )
            return hoisted_77_1[1 + REM_INT( logic_new_func_x_2, 2 )];
        end );
    hoisted_80_1 := List( deduped_123_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_139_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_147_1 ^ j_3 ), deduped_147_1 );
                end );
            return Sum( List( deduped_125_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 );
                      return hoisted_1_2[(1 + (hoisted_78_1[deduped_1_3] + hoisted_79_1[deduped_1_3]))] * deduped_147_1 ^ k_3;
                  end ) );
        end );
    hoisted_88_1 := List( [ 0 .. deduped_140_1 * deduped_141_1 - 1 ], function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return hoisted_80_1[1 + REM_INT( deduped_1_2, deduped_140_1 )] + hoisted_84_1[(1 + REM_INT( QUO_INT( deduped_1_2, deduped_140_1 ), deduped_141_1 ))] * deduped_126_1;
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets, NTuple( 4, deduped_105_1, deduped_106_1, List( deduped_103_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return -1 + SafePosition( hoisted_89_1, hoisted_88_1[(1 + (deduped_86_1[deduped_1_2] + deduped_87_1[deduped_1_2] * deduped_140_1))] );
            end ), List( deduped_104_1, function ( logic_new_func_x_2 )
                local deduped_1_2, deduped_2_2;
                deduped_2_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 );
                deduped_1_2 := 1 + (deduped_75_1[deduped_2_2] + deduped_76_1[deduped_2_2] * deduped_126_1);
                return NTuple( 2, -1 + SafePosition( deduped_97_1, hoisted_96_1[deduped_1_2] ), -1 + SafePosition( deduped_97_1, hoisted_102_1[deduped_1_2] ) );
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
