# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_FinQuiversAsCCCPrecompiled", function ( cat )
    
    ##
    AddExponentialOnObjects( cat,
        
########
function ( cat_1, a_1, b_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, hoisted_34_1, hoisted_35_1, hoisted_36_1, hoisted_37_1, hoisted_38_1, hoisted_39_1, hoisted_40_1, hoisted_41_1, hoisted_42_1, hoisted_43_1, hoisted_44_1, hoisted_45_1, hoisted_46_1, hoisted_47_1, hoisted_48_1, hoisted_49_1, hoisted_50_1, hoisted_51_1, hoisted_52_1, hoisted_53_1, hoisted_54_1, hoisted_55_1, hoisted_56_1, hoisted_57_1, hoisted_58_1, hoisted_59_1, hoisted_60_1, hoisted_61_1, hoisted_62_1, hoisted_63_1, hoisted_64_1, hoisted_65_1, hoisted_66_1, hoisted_67_1, hoisted_68_1, hoisted_69_1, hoisted_70_1, hoisted_71_1, hoisted_72_1, hoisted_73_1, hoisted_74_1, hoisted_75_1, hoisted_76_1, hoisted_77_1, hoisted_78_1, hoisted_79_1, hoisted_80_1, hoisted_81_1, hoisted_82_1, hoisted_83_1, hoisted_84_1, hoisted_85_1, hoisted_86_1, hoisted_87_1, hoisted_88_1, hoisted_89_1, hoisted_90_1, hoisted_91_1, hoisted_92_1, hoisted_93_1, hoisted_94_1, hoisted_95_1, hoisted_96_1, hoisted_97_1, hoisted_98_1, hoisted_99_1, hoisted_100_1, hoisted_101_1, hoisted_102_1, hoisted_103_1, hoisted_104_1, hoisted_105_1, hoisted_106_1, hoisted_107_1, hoisted_108_1, hoisted_109_1, hoisted_110_1, hoisted_111_1, hoisted_112_1, hoisted_113_1, hoisted_114_1, hoisted_115_1, hoisted_116_1, hoisted_117_1, hoisted_118_1, hoisted_119_1, hoisted_120_1, hoisted_121_1, hoisted_122_1, hoisted_123_1, hoisted_124_1, hoisted_125_1, hoisted_126_1, hoisted_127_1, hoisted_128_1, hoisted_129_1, hoisted_130_1, hoisted_131_1, hoisted_132_1, hoisted_133_1, hoisted_134_1, hoisted_135_1, hoisted_136_1, hoisted_137_1, hoisted_138_1, hoisted_139_1, hoisted_140_1, hoisted_141_1, hoisted_142_1, hoisted_143_1, hoisted_144_1, hoisted_145_1, hoisted_146_1, hoisted_147_1, hoisted_148_1, deduped_149_1, deduped_150_1, deduped_151_1, deduped_152_1, deduped_153_1, deduped_154_1, deduped_155_1, deduped_156_1, deduped_157_1, deduped_158_1, deduped_159_1, deduped_160_1, deduped_161_1, deduped_162_1, deduped_163_1, deduped_164_1, deduped_165_1, deduped_166_1, deduped_167_1, deduped_168_1, deduped_169_1, deduped_170_1, deduped_171_1, deduped_172_1, deduped_173_1, deduped_174_1, deduped_175_1, deduped_176_1, deduped_177_1, deduped_178_1, deduped_179_1, deduped_180_1, deduped_181_1, deduped_182_1, deduped_183_1, deduped_184_1, deduped_185_1, deduped_186_1, deduped_187_1, deduped_188_1, deduped_189_1, deduped_190_1, deduped_191_1, deduped_192_1, deduped_193_1, deduped_194_1, deduped_195_1, deduped_196_1, deduped_197_1, deduped_198_1, deduped_199_1, deduped_200_1, deduped_201_1, deduped_202_1, deduped_203_1, deduped_204_1, deduped_205_1, deduped_206_1, deduped_207_1, deduped_208_1, deduped_209_1, deduped_210_1;
    deduped_210_1 := DefiningQuadrupleOfQuiver( a_1 );
    deduped_209_1 := DefiningQuadrupleOfQuiver( b_1 );
    deduped_208_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_207_1 := Length( SetOfObjects( cat_1 ) );
    deduped_206_1 := deduped_210_1[2];
    deduped_205_1 := deduped_209_1[2];
    deduped_204_1 := deduped_209_1[1];
    deduped_203_1 := deduped_208_1[2];
    deduped_202_1 := deduped_208_1[1];
    deduped_201_1 := [ 1 .. deduped_207_1 ];
    deduped_200_1 := [ 1 .. deduped_202_1 ];
    deduped_199_1 := OppositeOfSource( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_198_1 := Length( deduped_203_1 );
    deduped_197_1 := [ 0 .. deduped_207_1 - 1 ];
    deduped_196_1 := [ 1 .. deduped_198_1 ];
    deduped_195_1 := SetOfObjects( deduped_199_1 );
    deduped_194_1 := deduped_198_1 * 2;
    deduped_193_1 := UnderlyingQuiverAlgebra( deduped_199_1 );
    deduped_192_1 := SetOfGeneratingMorphisms( deduped_199_1 );
    deduped_191_1 := BasisPathsByVertexIndex( deduped_199_1 );
    deduped_190_1 := [ 1 .. deduped_202_1 + deduped_198_1 ];
    deduped_183_1 := List( deduped_192_1, function ( logic_new_func_x_2 )
            return VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
        end );
    deduped_180_1 := deduped_183_1[1];
    hoisted_44_1 := deduped_180_1;
    hoisted_2_1 := List( deduped_191_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, Length );
        end );
    hoisted_45_1 := List( deduped_195_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_44_1];
        end );
    hoisted_10_1 := [ deduped_210_1[1], deduped_206_1 ];
    hoisted_1_1 := [ deduped_204_1, deduped_205_1 ];
    deduped_189_1 := List( deduped_201_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_45_1[logic_new_func_x_2] * hoisted_10_1[logic_new_func_x_2]);
        end );
    deduped_178_1 := deduped_183_1[2];
    hoisted_97_1 := deduped_178_1;
    hoisted_98_1 := List( deduped_195_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_97_1];
        end );
    deduped_188_1 := List( deduped_201_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_98_1[logic_new_func_x_2] * hoisted_10_1[logic_new_func_x_2]);
        end );
    deduped_187_1 := List( deduped_192_1, function ( logic_new_func_x_2 )
            return BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) );
        end );
    deduped_186_1 := List( deduped_192_1, function ( logic_new_func_x_2 )
            return UnderlyingVertex( Source( logic_new_func_x_2 ) );
        end );
    deduped_185_1 := List( deduped_192_1, function ( logic_new_func_x_2 )
            return VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
        end );
    deduped_184_1 := List( deduped_192_1, function ( logic_new_func_x_2 )
            return UnderlyingVertex( Range( logic_new_func_x_2 ) );
        end );
    deduped_182_1 := [ 0 .. deduped_194_1 - 1 ];
    deduped_181_1 := deduped_185_1[1];
    deduped_179_1 := deduped_185_1[2];
    deduped_177_1 := deduped_191_1[deduped_181_1];
    deduped_176_1 := deduped_191_1[deduped_179_1];
    deduped_175_1 := [ 0 .. Product( deduped_189_1 ) - 1 ];
    deduped_174_1 := [ 0 .. Product( deduped_188_1 ) - 1 ];
    hoisted_59_1 := deduped_181_1;
    hoisted_60_1 := List( deduped_195_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_59_1];
        end );
    hoisted_12_1 := deduped_204_1;
    hoisted_11_1 := deduped_203_1;
    deduped_173_1 := Concatenation( List( deduped_200_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_60_1[logic_new_func_x_2] * hoisted_10_1[logic_new_func_x_2]);
          end ), List( deduped_196_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_11_1[logic_new_func_x_2][1];
              return hoisted_12_1 ^ (hoisted_60_1[deduped_1_2] * hoisted_10_1[deduped_1_2]);
          end ) );
    hoisted_112_1 := deduped_179_1;
    hoisted_113_1 := List( deduped_195_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_112_1];
        end );
    deduped_172_1 := Concatenation( List( deduped_200_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_113_1[logic_new_func_x_2] * hoisted_10_1[logic_new_func_x_2]);
          end ), List( deduped_196_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_11_1[logic_new_func_x_2][1];
              return hoisted_12_1 ^ (hoisted_113_1[deduped_1_2] * hoisted_10_1[deduped_1_2]);
          end ) );
    deduped_171_1 := Concatenation( List( deduped_200_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_98_1[logic_new_func_x_2] * hoisted_10_1[logic_new_func_x_2]);
          end ), List( deduped_196_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_11_1[logic_new_func_x_2][1];
              return hoisted_12_1 ^ (hoisted_98_1[deduped_1_2] * hoisted_10_1[deduped_1_2]);
          end ) );
    deduped_170_1 := Concatenation( List( deduped_200_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_45_1[logic_new_func_x_2] * hoisted_10_1[logic_new_func_x_2]);
          end ), List( deduped_196_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_11_1[logic_new_func_x_2][1];
              return hoisted_12_1 ^ (hoisted_45_1[deduped_1_2] * hoisted_10_1[deduped_1_2]);
          end ) );
    hoisted_8_1 := deduped_192_1;
    hoisted_7_1 := deduped_193_1;
    hoisted_6_1 := deduped_191_1;
    hoisted_5_1 := HomStructureOnBasisPaths( deduped_199_1 );
    hoisted_4_1 := deduped_195_1;
    hoisted_3_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_160_1 := List( deduped_195_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
            deduped_4_2 := UnderlyingVertex( logic_new_func_x_2 );
            deduped_3_2 := VertexIndex( deduped_4_2 );
            hoisted_2_2 := SafePosition( hoisted_6_1[deduped_3_2][deduped_3_2], BasisPathOfPathAlgebraBasisElement( PathAsAlgebraElement( hoisted_7_1, deduped_4_2 ) ) );
            hoisted_1_2 := deduped_3_2;
            return NTuple( 2, List( hoisted_4_1, function ( o_3 )
                      return CreateCapCategoryObjectWithAttributes( hoisted_3_1, Length, hoisted_2_1[VertexIndex( UnderlyingVertex( o_3 ) )][hoisted_1_2] );
                  end ), List( hoisted_8_1, function ( m_3 )
                      local hoisted_1_3, deduped_2_3, deduped_3_3, deduped_4_3;
                      deduped_4_3 := VertexIndex( UnderlyingVertex( Source( m_3 ) ) );
                      deduped_3_3 := VertexIndex( UnderlyingVertex( Range( m_3 ) ) );
                      deduped_2_3 := hoisted_2_1[deduped_3_3][hoisted_1_2];
                      hoisted_1_3 := hoisted_5_1[deduped_3_3][hoisted_1_2][deduped_4_3][hoisted_1_2][SafePosition( hoisted_6_1[deduped_4_3][deduped_3_3], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( m_3 ) ) )][hoisted_2_2];
                      return CreateCapCategoryMorphismWithAttributes( hoisted_3_1, CreateCapCategoryObjectWithAttributes( hoisted_3_1, Length, deduped_2_3 ), CreateCapCategoryObjectWithAttributes( hoisted_3_1, Length, hoisted_2_1[deduped_4_3][hoisted_1_2] ), AsList, List( [ 1 .. deduped_2_3 ], function ( phi_index_4 )
                                return hoisted_1_3[phi_index_4];
                            end ) );
                  end ) );
        end );
    deduped_156_1 := deduped_160_1[2];
    hoisted_31_1 := List( deduped_156_1[1], Length );
    deduped_169_1 := Concatenation( List( deduped_200_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_31_1[logic_new_func_x_2] * hoisted_10_1[logic_new_func_x_2]);
          end ), List( deduped_196_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_11_1[logic_new_func_x_2][1];
              return hoisted_12_1 ^ (hoisted_31_1[deduped_1_2] * hoisted_10_1[deduped_1_2]);
          end ) );
    deduped_155_1 := deduped_160_1[1];
    hoisted_9_1 := List( deduped_155_1[1], Length );
    deduped_168_1 := Concatenation( List( deduped_200_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_9_1[logic_new_func_x_2] * hoisted_10_1[logic_new_func_x_2]);
          end ), List( deduped_196_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_11_1[logic_new_func_x_2][1];
              return hoisted_12_1 ^ (hoisted_9_1[deduped_1_2] * hoisted_10_1[deduped_1_2]);
          end ) );
    deduped_167_1 := [ 0 .. Product( deduped_173_1 ) - 1 ];
    deduped_166_1 := [ 0 .. Product( deduped_172_1 ) - 1 ];
    deduped_165_1 := [ 0 .. Product( deduped_171_1 ) - 1 ];
    deduped_164_1 := [ 0 .. Product( deduped_170_1 ) - 1 ];
    deduped_163_1 := [ 0 .. Product( deduped_169_1 ) - 1 ];
    deduped_162_1 := [ 0 .. Product( deduped_168_1 ) - 1 ];
    hoisted_61_1 := deduped_173_1;
    hoisted_24_1 := deduped_202_1;
    hoisted_69_1 := Concatenation( List( deduped_196_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_61_1[hoisted_24_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_70_1 := List( deduped_182_1, function ( j_2 )
            return Product( hoisted_69_1{[ 1 .. j_2 ]} );
        end );
    hoisted_67_1 := List( deduped_192_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_59_1];
        end );
    hoisted_66_1 := List( deduped_192_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_59_1];
        end );
    hoisted_64_1 := SafePosition( deduped_177_1[deduped_181_1], BasisPathOfPathAlgebraBasisElement( PathAsAlgebraElement( deduped_193_1, deduped_186_1[1] ) ) );
    hoisted_65_1 := List( deduped_192_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_59_1][deduped_3_2][hoisted_59_1][SafePosition( hoisted_6_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_64_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_59_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_62_1 := deduped_167_1;
    hoisted_63_1 := List( deduped_190_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_61_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_61_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_62_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_21_1 := deduped_206_1;
    hoisted_20_1 := [ deduped_210_1[3], deduped_210_1[4] ];
    hoisted_14_1 := [ deduped_209_1[3], deduped_209_1[4] ];
    hoisted_13_1 := deduped_205_1;
    hoisted_68_1 := Concatenation( List( deduped_196_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, hoisted_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2;
              deduped_22_2 := hoisted_11_1[logic_new_func_x_2];
              deduped_21_2 := deduped_22_2[2];
              deduped_20_2 := deduped_22_2[1];
              deduped_19_2 := hoisted_60_1[deduped_21_2] * hoisted_10_1[deduped_21_2];
              deduped_18_2 := hoisted_60_1[deduped_20_2] * hoisted_10_1[deduped_20_2];
              deduped_17_2 := [ 0 .. deduped_18_2 - 1 ];
              hoisted_13_2 := hoisted_67_1[logic_new_func_x_2];
              hoisted_11_2 := hoisted_20_1[logic_new_func_x_2];
              hoisted_6_2 := hoisted_66_1[logic_new_func_x_2];
              hoisted_10_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_6_2 ), hoisted_21_1 );
                  end );
              hoisted_12_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_11_2[1 + hoisted_10_2[(1 + i_3)]];
                  end );
              hoisted_8_2 := hoisted_65_1[logic_new_func_x_2];
              hoisted_7_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( i_3, hoisted_6_2 );
                  end );
              hoisted_9_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_8_2[1 + hoisted_7_2[(1 + i_3)]];
                  end );
              hoisted_14_2 := List( deduped_17_2, function ( i_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + i_3;
                      return hoisted_9_2[deduped_1_3] + hoisted_12_2[deduped_1_3] * hoisted_13_2;
                  end );
              hoisted_5_2 := [ 0 .. deduped_19_2 - 1 ];
              hoisted_1_2 := deduped_17_2;
              hoisted_16_2 := List( [ 0 .. hoisted_12_1 ^ deduped_19_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_5_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_12_1 ^ j_4 ), hoisted_12_1 );
                          end );
                      hoisted_2_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_14_2[(1 + i_4)]];
                          end );
                      hoisted_3_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_2_3[1 + i_4];
                          end );
                      return Sum( List( hoisted_1_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_15_2 := hoisted_63_1[deduped_21_2];
              hoisted_2_2 := hoisted_14_1[logic_new_func_x_2];
              hoisted_4_2 := List( [ 0 .. hoisted_13_1 ^ deduped_18_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_13_1 ^ j_4 ), hoisted_13_1 );
                          end );
                      hoisted_2_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_1_3[1 + i_4];
                          end );
                      hoisted_3_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_2_2[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                      return Sum( List( hoisted_1_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_3_2 := hoisted_63_1[deduped_20_2];
              return [ List( hoisted_62_1, function ( i_3 )
                          return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                      end ), List( hoisted_62_1, function ( i_3 )
                          return hoisted_16_2[1 + hoisted_15_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_27_1 := [ 1 .. deduped_194_1 ];
    hoisted_73_1 := [ List( deduped_167_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_27_1, function ( j_3 )
                        return hoisted_68_1[j_3][hoisted_1_2] * hoisted_70_1[j_3];
                    end );
            end ) ];
    hoisted_71_1 := Concatenation( List( deduped_196_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_63_1[hoisted_24_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_72_1 := List( deduped_167_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_27_1, function ( j_3 )
                    return hoisted_71_1[j_3][hoisted_1_2] * hoisted_70_1[j_3];
                end );
        end );
    deduped_161_1 := Filtered( [ 0 .. Length( deduped_167_1 ) - 1 ], function ( x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + x_2;
            hoisted_2_2 := hoisted_72_1[deduped_3_2];
            hoisted_1_2 := deduped_3_2;
            return ForAll( hoisted_73_1, function ( fj_3 )
                    return hoisted_2_2 = fj_3[hoisted_1_2];
                end );
        end );
    hoisted_114_1 := deduped_172_1;
    hoisted_122_1 := Concatenation( List( deduped_196_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_114_1[hoisted_24_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_123_1 := List( deduped_182_1, function ( j_2 )
            return Product( hoisted_122_1{[ 1 .. j_2 ]} );
        end );
    hoisted_120_1 := List( deduped_192_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_112_1];
        end );
    hoisted_119_1 := List( deduped_192_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_112_1];
        end );
    hoisted_117_1 := SafePosition( deduped_176_1[deduped_179_1], BasisPathOfPathAlgebraBasisElement( PathAsAlgebraElement( deduped_193_1, deduped_186_1[2] ) ) );
    hoisted_118_1 := List( deduped_192_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_112_1][deduped_3_2][hoisted_112_1][SafePosition( hoisted_6_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_117_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_112_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_115_1 := deduped_166_1;
    hoisted_116_1 := List( deduped_190_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_114_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_114_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_115_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_121_1 := Concatenation( List( deduped_196_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, hoisted_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2;
              deduped_22_2 := hoisted_11_1[logic_new_func_x_2];
              deduped_21_2 := deduped_22_2[2];
              deduped_20_2 := deduped_22_2[1];
              deduped_19_2 := hoisted_113_1[deduped_21_2] * hoisted_10_1[deduped_21_2];
              deduped_18_2 := hoisted_113_1[deduped_20_2] * hoisted_10_1[deduped_20_2];
              deduped_17_2 := [ 0 .. deduped_18_2 - 1 ];
              hoisted_13_2 := hoisted_120_1[logic_new_func_x_2];
              hoisted_11_2 := hoisted_20_1[logic_new_func_x_2];
              hoisted_6_2 := hoisted_119_1[logic_new_func_x_2];
              hoisted_10_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_6_2 ), hoisted_21_1 );
                  end );
              hoisted_12_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_11_2[1 + hoisted_10_2[(1 + i_3)]];
                  end );
              hoisted_8_2 := hoisted_118_1[logic_new_func_x_2];
              hoisted_7_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( i_3, hoisted_6_2 );
                  end );
              hoisted_9_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_8_2[1 + hoisted_7_2[(1 + i_3)]];
                  end );
              hoisted_14_2 := List( deduped_17_2, function ( i_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + i_3;
                      return hoisted_9_2[deduped_1_3] + hoisted_12_2[deduped_1_3] * hoisted_13_2;
                  end );
              hoisted_5_2 := [ 0 .. deduped_19_2 - 1 ];
              hoisted_1_2 := deduped_17_2;
              hoisted_16_2 := List( [ 0 .. hoisted_12_1 ^ deduped_19_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_5_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_12_1 ^ j_4 ), hoisted_12_1 );
                          end );
                      hoisted_2_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_14_2[(1 + i_4)]];
                          end );
                      hoisted_3_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_2_3[1 + i_4];
                          end );
                      return Sum( List( hoisted_1_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_15_2 := hoisted_116_1[deduped_21_2];
              hoisted_2_2 := hoisted_14_1[logic_new_func_x_2];
              hoisted_4_2 := List( [ 0 .. hoisted_13_1 ^ deduped_18_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_13_1 ^ j_4 ), hoisted_13_1 );
                          end );
                      hoisted_2_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_1_3[1 + i_4];
                          end );
                      hoisted_3_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_2_2[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                      return Sum( List( hoisted_1_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_3_2 := hoisted_116_1[deduped_20_2];
              return [ List( hoisted_115_1, function ( i_3 )
                          return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                      end ), List( hoisted_115_1, function ( i_3 )
                          return hoisted_16_2[1 + hoisted_15_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_126_1 := [ List( deduped_166_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_27_1, function ( j_3 )
                        return hoisted_121_1[j_3][hoisted_1_2] * hoisted_123_1[j_3];
                    end );
            end ) ];
    hoisted_124_1 := Concatenation( List( deduped_196_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_116_1[hoisted_24_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_125_1 := List( deduped_166_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_27_1, function ( j_3 )
                    return hoisted_124_1[j_3][hoisted_1_2] * hoisted_123_1[j_3];
                end );
        end );
    deduped_159_1 := Filtered( [ 0 .. Length( deduped_166_1 ) - 1 ], function ( x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + x_2;
            hoisted_2_2 := hoisted_125_1[deduped_3_2];
            hoisted_1_2 := deduped_3_2;
            return ForAll( hoisted_126_1, function ( fj_3 )
                    return hoisted_2_2 = fj_3[hoisted_1_2];
                end );
        end );
    hoisted_99_1 := deduped_171_1;
    hoisted_107_1 := Concatenation( List( deduped_196_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_99_1[hoisted_24_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_108_1 := List( deduped_182_1, function ( j_2 )
            return Product( hoisted_107_1{[ 1 .. j_2 ]} );
        end );
    hoisted_105_1 := List( deduped_192_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_97_1];
        end );
    hoisted_104_1 := List( deduped_192_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_97_1];
        end );
    hoisted_102_1 := SafePosition( deduped_191_1[deduped_178_1][deduped_178_1], BasisPathOfPathAlgebraBasisElement( PathAsAlgebraElement( deduped_193_1, deduped_184_1[2] ) ) );
    hoisted_103_1 := List( deduped_192_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_97_1][deduped_3_2][hoisted_97_1][SafePosition( hoisted_6_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_102_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_97_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_100_1 := deduped_165_1;
    hoisted_101_1 := List( deduped_190_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_99_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_99_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_100_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_106_1 := Concatenation( List( deduped_196_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, hoisted_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2;
              deduped_22_2 := hoisted_11_1[logic_new_func_x_2];
              deduped_21_2 := deduped_22_2[2];
              deduped_20_2 := deduped_22_2[1];
              deduped_19_2 := hoisted_98_1[deduped_21_2] * hoisted_10_1[deduped_21_2];
              deduped_18_2 := hoisted_98_1[deduped_20_2] * hoisted_10_1[deduped_20_2];
              deduped_17_2 := [ 0 .. deduped_18_2 - 1 ];
              hoisted_13_2 := hoisted_105_1[logic_new_func_x_2];
              hoisted_11_2 := hoisted_20_1[logic_new_func_x_2];
              hoisted_6_2 := hoisted_104_1[logic_new_func_x_2];
              hoisted_10_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_6_2 ), hoisted_21_1 );
                  end );
              hoisted_12_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_11_2[1 + hoisted_10_2[(1 + i_3)]];
                  end );
              hoisted_8_2 := hoisted_103_1[logic_new_func_x_2];
              hoisted_7_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( i_3, hoisted_6_2 );
                  end );
              hoisted_9_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_8_2[1 + hoisted_7_2[(1 + i_3)]];
                  end );
              hoisted_14_2 := List( deduped_17_2, function ( i_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + i_3;
                      return hoisted_9_2[deduped_1_3] + hoisted_12_2[deduped_1_3] * hoisted_13_2;
                  end );
              hoisted_5_2 := [ 0 .. deduped_19_2 - 1 ];
              hoisted_1_2 := deduped_17_2;
              hoisted_16_2 := List( [ 0 .. hoisted_12_1 ^ deduped_19_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_5_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_12_1 ^ j_4 ), hoisted_12_1 );
                          end );
                      hoisted_2_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_14_2[(1 + i_4)]];
                          end );
                      hoisted_3_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_2_3[1 + i_4];
                          end );
                      return Sum( List( hoisted_1_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_15_2 := hoisted_101_1[deduped_21_2];
              hoisted_2_2 := hoisted_14_1[logic_new_func_x_2];
              hoisted_4_2 := List( [ 0 .. hoisted_13_1 ^ deduped_18_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_13_1 ^ j_4 ), hoisted_13_1 );
                          end );
                      hoisted_2_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_1_3[1 + i_4];
                          end );
                      hoisted_3_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_2_2[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                      return Sum( List( hoisted_1_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_3_2 := hoisted_101_1[deduped_20_2];
              return [ List( hoisted_100_1, function ( i_3 )
                          return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                      end ), List( hoisted_100_1, function ( i_3 )
                          return hoisted_16_2[1 + hoisted_15_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_111_1 := [ List( deduped_165_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_27_1, function ( j_3 )
                        return hoisted_106_1[j_3][hoisted_1_2] * hoisted_108_1[j_3];
                    end );
            end ) ];
    hoisted_109_1 := Concatenation( List( deduped_196_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_101_1[hoisted_24_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_110_1 := List( deduped_165_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_27_1, function ( j_3 )
                    return hoisted_109_1[j_3][hoisted_1_2] * hoisted_108_1[j_3];
                end );
        end );
    deduped_158_1 := Filtered( [ 0 .. Length( deduped_165_1 ) - 1 ], function ( x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + x_2;
            hoisted_2_2 := hoisted_110_1[deduped_3_2];
            hoisted_1_2 := deduped_3_2;
            return ForAll( hoisted_111_1, function ( fj_3 )
                    return hoisted_2_2 = fj_3[hoisted_1_2];
                end );
        end );
    hoisted_46_1 := deduped_170_1;
    hoisted_54_1 := Concatenation( List( deduped_196_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_46_1[hoisted_24_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_55_1 := List( deduped_182_1, function ( j_2 )
            return Product( hoisted_54_1{[ 1 .. j_2 ]} );
        end );
    hoisted_52_1 := List( deduped_192_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_44_1];
        end );
    hoisted_51_1 := List( deduped_192_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_44_1];
        end );
    hoisted_49_1 := SafePosition( deduped_191_1[deduped_180_1][deduped_180_1], BasisPathOfPathAlgebraBasisElement( PathAsAlgebraElement( deduped_193_1, deduped_184_1[1] ) ) );
    hoisted_50_1 := List( deduped_192_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_44_1][deduped_3_2][hoisted_44_1][SafePosition( hoisted_6_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_49_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_44_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_47_1 := deduped_164_1;
    hoisted_48_1 := List( deduped_190_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_46_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_46_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_47_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_53_1 := Concatenation( List( deduped_196_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, hoisted_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2;
              deduped_22_2 := hoisted_11_1[logic_new_func_x_2];
              deduped_21_2 := deduped_22_2[2];
              deduped_20_2 := deduped_22_2[1];
              deduped_19_2 := hoisted_45_1[deduped_21_2] * hoisted_10_1[deduped_21_2];
              deduped_18_2 := hoisted_45_1[deduped_20_2] * hoisted_10_1[deduped_20_2];
              deduped_17_2 := [ 0 .. deduped_18_2 - 1 ];
              hoisted_13_2 := hoisted_52_1[logic_new_func_x_2];
              hoisted_11_2 := hoisted_20_1[logic_new_func_x_2];
              hoisted_6_2 := hoisted_51_1[logic_new_func_x_2];
              hoisted_10_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_6_2 ), hoisted_21_1 );
                  end );
              hoisted_12_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_11_2[1 + hoisted_10_2[(1 + i_3)]];
                  end );
              hoisted_8_2 := hoisted_50_1[logic_new_func_x_2];
              hoisted_7_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( i_3, hoisted_6_2 );
                  end );
              hoisted_9_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_8_2[1 + hoisted_7_2[(1 + i_3)]];
                  end );
              hoisted_14_2 := List( deduped_17_2, function ( i_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + i_3;
                      return hoisted_9_2[deduped_1_3] + hoisted_12_2[deduped_1_3] * hoisted_13_2;
                  end );
              hoisted_5_2 := [ 0 .. deduped_19_2 - 1 ];
              hoisted_1_2 := deduped_17_2;
              hoisted_16_2 := List( [ 0 .. hoisted_12_1 ^ deduped_19_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_5_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_12_1 ^ j_4 ), hoisted_12_1 );
                          end );
                      hoisted_2_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_14_2[(1 + i_4)]];
                          end );
                      hoisted_3_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_2_3[1 + i_4];
                          end );
                      return Sum( List( hoisted_1_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_15_2 := hoisted_48_1[deduped_21_2];
              hoisted_2_2 := hoisted_14_1[logic_new_func_x_2];
              hoisted_4_2 := List( [ 0 .. hoisted_13_1 ^ deduped_18_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_13_1 ^ j_4 ), hoisted_13_1 );
                          end );
                      hoisted_2_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_1_3[1 + i_4];
                          end );
                      hoisted_3_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_2_2[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                      return Sum( List( hoisted_1_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_3_2 := hoisted_48_1[deduped_20_2];
              return [ List( hoisted_47_1, function ( i_3 )
                          return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                      end ), List( hoisted_47_1, function ( i_3 )
                          return hoisted_16_2[1 + hoisted_15_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_58_1 := [ List( deduped_164_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_27_1, function ( j_3 )
                        return hoisted_53_1[j_3][hoisted_1_2] * hoisted_55_1[j_3];
                    end );
            end ) ];
    hoisted_56_1 := Concatenation( List( deduped_196_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_48_1[hoisted_24_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_57_1 := List( deduped_164_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_27_1, function ( j_3 )
                    return hoisted_56_1[j_3][hoisted_1_2] * hoisted_55_1[j_3];
                end );
        end );
    deduped_157_1 := Filtered( [ 0 .. Length( deduped_164_1 ) - 1 ], function ( x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + x_2;
            hoisted_2_2 := hoisted_57_1[deduped_3_2];
            hoisted_1_2 := deduped_3_2;
            return ForAll( hoisted_58_1, function ( fj_3 )
                    return hoisted_2_2 = fj_3[hoisted_1_2];
                end );
        end );
    deduped_154_1 := deduped_156_1[2];
    deduped_153_1 := deduped_155_1[2];
    deduped_152_1 := [ 0 .. Length( deduped_161_1 ) - 1 ];
    deduped_151_1 := [ 0 .. Length( deduped_159_1 ) - 1 ];
    deduped_150_1 := [ 0 .. Length( deduped_158_1 ) - 1 ];
    deduped_149_1 := [ 0 .. Length( deduped_157_1 ) - 1 ];
    hoisted_130_1 := List( deduped_201_1, function ( logic_new_func_x_2 )
            return hoisted_114_1[logic_new_func_x_2];
        end );
    hoisted_131_1 := List( deduped_197_1, function ( j_2 )
            return Product( hoisted_130_1{[ 1 .. j_2 ]} );
        end );
    hoisted_128_1 := deduped_151_1;
    hoisted_127_1 := deduped_159_1;
    hoisted_129_1 := List( deduped_201_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_2_2 := hoisted_114_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_114_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_115_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_128_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_127_1[(1 + i_3)]];
                end );
        end );
    hoisted_79_1 := deduped_201_1;
    hoisted_148_1 := List( deduped_151_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_79_1, function ( j_3 )
                    return hoisted_129_1[j_3][hoisted_1_2] * hoisted_131_1[j_3];
                end );
        end );
    hoisted_138_1 := List( deduped_201_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_113_1[logic_new_func_x_2] * hoisted_10_1[logic_new_func_x_2]);
        end );
    hoisted_139_1 := List( deduped_197_1, function ( j_2 )
            return Product( hoisted_138_1{[ 1 .. j_2 ]} );
        end );
    hoisted_136_1 := deduped_174_1;
    hoisted_135_1 := deduped_188_1;
    hoisted_132_1 := SafePosition( deduped_176_1[deduped_178_1], deduped_187_1[2] );
    hoisted_133_1 := List( deduped_195_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := UnderlyingVertex( logic_new_func_x_2 );
            deduped_2_2 := VertexIndex( deduped_3_2 );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_112_1][deduped_2_2][hoisted_97_1][SafePosition( hoisted_6_1[deduped_2_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( PathAsAlgebraElement( hoisted_7_1, deduped_3_2 ) ) )][hoisted_132_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_112_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_134_1 := List( deduped_201_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, deduped_13_2, deduped_14_2, deduped_15_2, deduped_16_2, deduped_17_2, deduped_18_2;
            deduped_18_2 := hoisted_113_1[logic_new_func_x_2];
            deduped_17_2 := hoisted_10_1[logic_new_func_x_2];
            deduped_16_2 := hoisted_98_1[logic_new_func_x_2];
            deduped_15_2 := hoisted_1_1[logic_new_func_x_2];
            deduped_14_2 := deduped_16_2 * deduped_17_2;
            deduped_13_2 := [ 0 .. deduped_18_2 * deduped_17_2 - 1 ];
            hoisted_12_2 := deduped_13_2;
            hoisted_10_2 := deduped_16_2;
            hoisted_7_2 := deduped_17_2;
            hoisted_3_2 := deduped_18_2;
            hoisted_8_2 := List( deduped_13_2, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_3_2 ), hoisted_7_2 );
                end );
            hoisted_9_2 := List( deduped_13_2, function ( i_3 )
                    return hoisted_8_2[1 + i_3];
                end );
            hoisted_5_2 := hoisted_133_1[logic_new_func_x_2];
            hoisted_4_2 := List( deduped_13_2, function ( i_3 )
                    return REM_INT( i_3, hoisted_3_2 );
                end );
            hoisted_6_2 := List( deduped_13_2, function ( i_3 )
                    return hoisted_5_2[1 + hoisted_4_2[(1 + i_3)]];
                end );
            hoisted_11_2 := List( deduped_13_2, function ( i_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + i_3;
                    return hoisted_6_2[deduped_1_3] + hoisted_9_2[deduped_1_3] * hoisted_10_2;
                end );
            hoisted_2_2 := [ 0 .. deduped_14_2 - 1 ];
            hoisted_1_2 := deduped_15_2;
            return List( [ 0 .. deduped_15_2 ^ deduped_14_2 - 1 ], function ( i_3 )
                    local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                    hoisted_1_3 := List( hoisted_2_2, function ( j_4 )
                            return REM_INT( QUO_INT( i_3, hoisted_1_2 ^ j_4 ), hoisted_1_2 );
                        end );
                    hoisted_2_3 := List( hoisted_12_2, function ( i_4 )
                            return hoisted_1_3[1 + hoisted_11_2[(1 + i_4)]];
                        end );
                    hoisted_3_3 := List( hoisted_12_2, function ( i_4 )
                            return hoisted_2_3[1 + i_4];
                        end );
                    return Sum( List( hoisted_12_2, function ( k_4 )
                              return hoisted_3_3[(1 + k_4)] * hoisted_1_2 ^ k_4;
                          end ) );
                end );
        end );
    hoisted_137_1 := List( deduped_201_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2;
            hoisted_4_2 := hoisted_134_1[logic_new_func_x_2];
            hoisted_2_2 := hoisted_135_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_135_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_136_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_136_1, function ( i_3 )
                    return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                end );
        end );
    hoisted_146_1 := List( deduped_174_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_79_1, function ( j_3 )
                    return hoisted_137_1[j_3][hoisted_1_2] * hoisted_139_1[j_3];
                end );
        end );
    hoisted_143_1 := List( deduped_201_1, function ( logic_new_func_x_2 )
            return hoisted_99_1[logic_new_func_x_2];
        end );
    hoisted_144_1 := List( deduped_197_1, function ( j_2 )
            return Product( hoisted_143_1{[ 1 .. j_2 ]} );
        end );
    hoisted_141_1 := deduped_150_1;
    hoisted_140_1 := deduped_158_1;
    hoisted_142_1 := List( deduped_201_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_2_2 := hoisted_99_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_99_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_100_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_141_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_140_1[(1 + i_3)]];
                end );
        end );
    hoisted_145_1 := List( deduped_150_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_79_1, function ( j_3 )
                    return hoisted_142_1[j_3][hoisted_1_2] * hoisted_144_1[j_3];
                end );
        end );
    hoisted_147_1 := List( deduped_150_1, function ( i_2 )
            return hoisted_146_1[1 + hoisted_145_1[(1 + i_2)]];
        end );
    hoisted_77_1 := List( deduped_201_1, function ( logic_new_func_x_2 )
            return hoisted_61_1[logic_new_func_x_2];
        end );
    hoisted_78_1 := List( deduped_197_1, function ( j_2 )
            return Product( hoisted_77_1{[ 1 .. j_2 ]} );
        end );
    hoisted_75_1 := deduped_152_1;
    hoisted_74_1 := deduped_161_1;
    hoisted_76_1 := List( deduped_201_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_2_2 := hoisted_61_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_61_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_62_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_75_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_74_1[(1 + i_3)]];
                end );
        end );
    hoisted_96_1 := List( deduped_152_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_79_1, function ( j_3 )
                    return hoisted_76_1[j_3][hoisted_1_2] * hoisted_78_1[j_3];
                end );
        end );
    hoisted_86_1 := List( deduped_201_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_60_1[logic_new_func_x_2] * hoisted_10_1[logic_new_func_x_2]);
        end );
    hoisted_87_1 := List( deduped_197_1, function ( j_2 )
            return Product( hoisted_86_1{[ 1 .. j_2 ]} );
        end );
    hoisted_84_1 := deduped_175_1;
    hoisted_83_1 := deduped_189_1;
    hoisted_80_1 := SafePosition( deduped_177_1[deduped_180_1], deduped_187_1[1] );
    hoisted_81_1 := List( deduped_195_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := UnderlyingVertex( logic_new_func_x_2 );
            deduped_2_2 := VertexIndex( deduped_3_2 );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_59_1][deduped_2_2][hoisted_44_1][SafePosition( hoisted_6_1[deduped_2_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( PathAsAlgebraElement( hoisted_7_1, deduped_3_2 ) ) )][hoisted_80_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_59_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_82_1 := List( deduped_201_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, deduped_13_2, deduped_14_2, deduped_15_2, deduped_16_2, deduped_17_2, deduped_18_2;
            deduped_18_2 := hoisted_60_1[logic_new_func_x_2];
            deduped_17_2 := hoisted_10_1[logic_new_func_x_2];
            deduped_16_2 := hoisted_45_1[logic_new_func_x_2];
            deduped_15_2 := hoisted_1_1[logic_new_func_x_2];
            deduped_14_2 := deduped_16_2 * deduped_17_2;
            deduped_13_2 := [ 0 .. deduped_18_2 * deduped_17_2 - 1 ];
            hoisted_12_2 := deduped_13_2;
            hoisted_10_2 := deduped_16_2;
            hoisted_7_2 := deduped_17_2;
            hoisted_3_2 := deduped_18_2;
            hoisted_8_2 := List( deduped_13_2, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_3_2 ), hoisted_7_2 );
                end );
            hoisted_9_2 := List( deduped_13_2, function ( i_3 )
                    return hoisted_8_2[1 + i_3];
                end );
            hoisted_5_2 := hoisted_81_1[logic_new_func_x_2];
            hoisted_4_2 := List( deduped_13_2, function ( i_3 )
                    return REM_INT( i_3, hoisted_3_2 );
                end );
            hoisted_6_2 := List( deduped_13_2, function ( i_3 )
                    return hoisted_5_2[1 + hoisted_4_2[(1 + i_3)]];
                end );
            hoisted_11_2 := List( deduped_13_2, function ( i_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + i_3;
                    return hoisted_6_2[deduped_1_3] + hoisted_9_2[deduped_1_3] * hoisted_10_2;
                end );
            hoisted_2_2 := [ 0 .. deduped_14_2 - 1 ];
            hoisted_1_2 := deduped_15_2;
            return List( [ 0 .. deduped_15_2 ^ deduped_14_2 - 1 ], function ( i_3 )
                    local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                    hoisted_1_3 := List( hoisted_2_2, function ( j_4 )
                            return REM_INT( QUO_INT( i_3, hoisted_1_2 ^ j_4 ), hoisted_1_2 );
                        end );
                    hoisted_2_3 := List( hoisted_12_2, function ( i_4 )
                            return hoisted_1_3[1 + hoisted_11_2[(1 + i_4)]];
                        end );
                    hoisted_3_3 := List( hoisted_12_2, function ( i_4 )
                            return hoisted_2_3[1 + i_4];
                        end );
                    return Sum( List( hoisted_12_2, function ( k_4 )
                              return hoisted_3_3[(1 + k_4)] * hoisted_1_2 ^ k_4;
                          end ) );
                end );
        end );
    hoisted_85_1 := List( deduped_201_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2;
            hoisted_4_2 := hoisted_82_1[logic_new_func_x_2];
            hoisted_2_2 := hoisted_83_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_83_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_84_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_84_1, function ( i_3 )
                    return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                end );
        end );
    hoisted_94_1 := List( deduped_175_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_79_1, function ( j_3 )
                    return hoisted_85_1[j_3][hoisted_1_2] * hoisted_87_1[j_3];
                end );
        end );
    hoisted_91_1 := List( deduped_201_1, function ( logic_new_func_x_2 )
            return hoisted_46_1[logic_new_func_x_2];
        end );
    hoisted_92_1 := List( deduped_197_1, function ( j_2 )
            return Product( hoisted_91_1{[ 1 .. j_2 ]} );
        end );
    hoisted_89_1 := deduped_149_1;
    hoisted_88_1 := deduped_157_1;
    hoisted_90_1 := List( deduped_201_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_2_2 := hoisted_46_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_46_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_47_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_89_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_88_1[(1 + i_3)]];
                end );
        end );
    hoisted_93_1 := List( deduped_149_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_79_1, function ( j_3 )
                    return hoisted_90_1[j_3][hoisted_1_2] * hoisted_92_1[j_3];
                end );
        end );
    hoisted_95_1 := List( deduped_149_1, function ( i_2 )
            return hoisted_94_1[1 + hoisted_93_1[(1 + i_2)]];
        end );
    hoisted_32_1 := deduped_169_1;
    hoisted_39_1 := Concatenation( List( deduped_196_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_32_1[hoisted_24_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_40_1 := List( deduped_182_1, function ( j_2 )
            return Product( hoisted_39_1{[ 1 .. j_2 ]} );
        end );
    hoisted_37_1 := List( deduped_154_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    hoisted_36_1 := List( deduped_154_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_35_1 := List( deduped_154_1, AsList );
    hoisted_33_1 := deduped_163_1;
    hoisted_34_1 := List( deduped_190_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_32_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_32_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_33_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_38_1 := Concatenation( List( deduped_196_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, hoisted_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2;
              deduped_22_2 := hoisted_11_1[logic_new_func_x_2];
              deduped_21_2 := deduped_22_2[2];
              deduped_20_2 := deduped_22_2[1];
              deduped_19_2 := hoisted_31_1[deduped_21_2] * hoisted_10_1[deduped_21_2];
              deduped_18_2 := hoisted_31_1[deduped_20_2] * hoisted_10_1[deduped_20_2];
              deduped_17_2 := [ 0 .. deduped_18_2 - 1 ];
              hoisted_13_2 := hoisted_37_1[logic_new_func_x_2];
              hoisted_11_2 := hoisted_20_1[logic_new_func_x_2];
              hoisted_6_2 := hoisted_36_1[logic_new_func_x_2];
              hoisted_10_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_6_2 ), hoisted_21_1 );
                  end );
              hoisted_12_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_11_2[1 + hoisted_10_2[(1 + i_3)]];
                  end );
              hoisted_8_2 := hoisted_35_1[logic_new_func_x_2];
              hoisted_7_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( i_3, hoisted_6_2 );
                  end );
              hoisted_9_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_8_2[1 + hoisted_7_2[(1 + i_3)]];
                  end );
              hoisted_14_2 := List( deduped_17_2, function ( i_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + i_3;
                      return hoisted_9_2[deduped_1_3] + hoisted_12_2[deduped_1_3] * hoisted_13_2;
                  end );
              hoisted_5_2 := [ 0 .. deduped_19_2 - 1 ];
              hoisted_1_2 := deduped_17_2;
              hoisted_16_2 := List( [ 0 .. hoisted_12_1 ^ deduped_19_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_5_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_12_1 ^ j_4 ), hoisted_12_1 );
                          end );
                      hoisted_2_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_14_2[(1 + i_4)]];
                          end );
                      hoisted_3_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_2_3[1 + i_4];
                          end );
                      return Sum( List( hoisted_1_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_15_2 := hoisted_34_1[deduped_21_2];
              hoisted_2_2 := hoisted_14_1[logic_new_func_x_2];
              hoisted_4_2 := List( [ 0 .. hoisted_13_1 ^ deduped_18_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_13_1 ^ j_4 ), hoisted_13_1 );
                          end );
                      hoisted_2_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_1_3[1 + i_4];
                          end );
                      hoisted_3_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_2_2[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                      return Sum( List( hoisted_1_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_3_2 := hoisted_34_1[deduped_20_2];
              return [ List( hoisted_33_1, function ( i_3 )
                          return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                      end ), List( hoisted_33_1, function ( i_3 )
                          return hoisted_16_2[1 + hoisted_15_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_43_1 := [ List( deduped_163_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_27_1, function ( j_3 )
                        return hoisted_38_1[j_3][hoisted_1_2] * hoisted_40_1[j_3];
                    end );
            end ) ];
    hoisted_41_1 := Concatenation( List( deduped_196_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_34_1[hoisted_24_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_42_1 := List( deduped_163_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_27_1, function ( j_3 )
                    return hoisted_41_1[j_3][hoisted_1_2] * hoisted_40_1[j_3];
                end );
        end );
    hoisted_15_1 := deduped_168_1;
    hoisted_25_1 := Concatenation( List( deduped_196_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_15_1[hoisted_24_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_26_1 := List( deduped_182_1, function ( j_2 )
            return Product( hoisted_25_1{[ 1 .. j_2 ]} );
        end );
    hoisted_22_1 := List( deduped_153_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    hoisted_19_1 := List( deduped_153_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_18_1 := List( deduped_153_1, AsList );
    hoisted_16_1 := deduped_162_1;
    hoisted_17_1 := List( deduped_190_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_15_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_15_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_16_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_23_1 := Concatenation( List( deduped_196_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, hoisted_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2;
              deduped_22_2 := hoisted_11_1[logic_new_func_x_2];
              deduped_21_2 := deduped_22_2[2];
              deduped_20_2 := deduped_22_2[1];
              deduped_19_2 := hoisted_9_1[deduped_21_2] * hoisted_10_1[deduped_21_2];
              deduped_18_2 := hoisted_9_1[deduped_20_2] * hoisted_10_1[deduped_20_2];
              deduped_17_2 := [ 0 .. deduped_18_2 - 1 ];
              hoisted_13_2 := hoisted_22_1[logic_new_func_x_2];
              hoisted_11_2 := hoisted_20_1[logic_new_func_x_2];
              hoisted_6_2 := hoisted_19_1[logic_new_func_x_2];
              hoisted_10_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_6_2 ), hoisted_21_1 );
                  end );
              hoisted_12_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_11_2[1 + hoisted_10_2[(1 + i_3)]];
                  end );
              hoisted_8_2 := hoisted_18_1[logic_new_func_x_2];
              hoisted_7_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( i_3, hoisted_6_2 );
                  end );
              hoisted_9_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_8_2[1 + hoisted_7_2[(1 + i_3)]];
                  end );
              hoisted_14_2 := List( deduped_17_2, function ( i_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + i_3;
                      return hoisted_9_2[deduped_1_3] + hoisted_12_2[deduped_1_3] * hoisted_13_2;
                  end );
              hoisted_5_2 := [ 0 .. deduped_19_2 - 1 ];
              hoisted_1_2 := deduped_17_2;
              hoisted_16_2 := List( [ 0 .. hoisted_12_1 ^ deduped_19_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_5_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_12_1 ^ j_4 ), hoisted_12_1 );
                          end );
                      hoisted_2_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_14_2[(1 + i_4)]];
                          end );
                      hoisted_3_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_2_3[1 + i_4];
                          end );
                      return Sum( List( hoisted_1_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_15_2 := hoisted_17_1[deduped_21_2];
              hoisted_2_2 := hoisted_14_1[logic_new_func_x_2];
              hoisted_4_2 := List( [ 0 .. hoisted_13_1 ^ deduped_18_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_13_1 ^ j_4 ), hoisted_13_1 );
                          end );
                      hoisted_2_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_1_3[1 + i_4];
                          end );
                      hoisted_3_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_2_2[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                      return Sum( List( hoisted_1_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_3_2 := hoisted_17_1[deduped_20_2];
              return [ List( hoisted_16_1, function ( i_3 )
                          return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                      end ), List( hoisted_16_1, function ( i_3 )
                          return hoisted_16_2[1 + hoisted_15_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_30_1 := [ List( deduped_162_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_27_1, function ( j_3 )
                        return hoisted_23_1[j_3][hoisted_1_2] * hoisted_26_1[j_3];
                    end );
            end ) ];
    hoisted_28_1 := Concatenation( List( deduped_196_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_17_1[hoisted_24_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_29_1 := List( deduped_162_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_27_1, function ( j_3 )
                    return hoisted_28_1[j_3][hoisted_1_2] * hoisted_26_1[j_3];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningQuadrupleOfQuiver, NTuple( 4, Length( Filtered( [ 0 .. Length( deduped_162_1 ) - 1 ], function ( x_2 )
                  local hoisted_1_2, hoisted_2_2, deduped_3_2;
                  deduped_3_2 := 1 + x_2;
                  hoisted_2_2 := hoisted_29_1[deduped_3_2];
                  hoisted_1_2 := deduped_3_2;
                  return ForAll( hoisted_30_1, function ( fj_3 )
                          return hoisted_2_2 = fj_3[hoisted_1_2];
                      end );
              end ) ), Length( Filtered( [ 0 .. Length( deduped_163_1 ) - 1 ], function ( x_2 )
                  local hoisted_1_2, hoisted_2_2, deduped_3_2;
                  deduped_3_2 := 1 + x_2;
                  hoisted_2_2 := hoisted_42_1[deduped_3_2];
                  hoisted_1_2 := deduped_3_2;
                  return ForAll( hoisted_43_1, function ( fj_3 )
                          return hoisted_2_2 = fj_3[hoisted_1_2];
                      end );
              end ) ), List( deduped_149_1, function ( x_2 )
                return -1 + SafePosition( hoisted_96_1, hoisted_95_1[(1 + x_2)] );
            end ), List( deduped_150_1, function ( x_2 )
                return -1 + SafePosition( hoisted_148_1, hoisted_147_1[(1 + x_2)] );
            end ) ) );
end
########
        
    , 100 );
    
end );

BindGlobal( "FinQuiversAsCCCPrecompiled", function (  )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function (  )
    return CategoryOfQuiversEnrichedOver( CategoryOfSkeletalFinSets(  : FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_FinQuiversAsCCCPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
