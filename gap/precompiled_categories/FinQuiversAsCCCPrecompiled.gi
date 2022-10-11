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
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, hoisted_34_1, hoisted_35_1, hoisted_36_1, hoisted_37_1, hoisted_38_1, hoisted_39_1, hoisted_40_1, hoisted_41_1, hoisted_42_1, hoisted_43_1, hoisted_44_1, hoisted_45_1, hoisted_46_1, hoisted_47_1, hoisted_48_1, hoisted_49_1, hoisted_50_1, hoisted_51_1, hoisted_52_1, hoisted_53_1, hoisted_54_1, hoisted_55_1, hoisted_56_1, hoisted_57_1, hoisted_58_1, hoisted_59_1, hoisted_60_1, hoisted_61_1, hoisted_62_1, hoisted_63_1, hoisted_64_1, hoisted_65_1, hoisted_66_1, hoisted_67_1, hoisted_68_1, hoisted_69_1, hoisted_70_1, hoisted_71_1, hoisted_72_1, hoisted_73_1, hoisted_74_1, hoisted_75_1, hoisted_76_1, hoisted_77_1, hoisted_78_1, hoisted_79_1, hoisted_80_1, hoisted_81_1, hoisted_82_1, hoisted_83_1, hoisted_84_1, hoisted_85_1, hoisted_86_1, hoisted_87_1, hoisted_88_1, hoisted_89_1, hoisted_90_1, hoisted_91_1, hoisted_92_1, hoisted_93_1, hoisted_94_1, hoisted_95_1, hoisted_96_1, hoisted_97_1, hoisted_98_1, hoisted_99_1, hoisted_100_1, hoisted_101_1, hoisted_102_1, hoisted_103_1, hoisted_104_1, hoisted_105_1, hoisted_106_1, hoisted_107_1, hoisted_108_1, hoisted_109_1, hoisted_110_1, hoisted_111_1, hoisted_112_1, hoisted_113_1, hoisted_114_1, hoisted_115_1, hoisted_116_1, hoisted_117_1, hoisted_118_1, hoisted_119_1, hoisted_120_1, hoisted_121_1, hoisted_122_1, hoisted_123_1, hoisted_124_1, hoisted_125_1, hoisted_126_1, hoisted_127_1, hoisted_128_1, hoisted_129_1, hoisted_130_1, hoisted_131_1, hoisted_132_1, hoisted_133_1, hoisted_134_1, hoisted_135_1, hoisted_136_1, hoisted_137_1, hoisted_138_1, hoisted_139_1, hoisted_140_1, hoisted_141_1, hoisted_142_1, hoisted_143_1, deduped_144_1, deduped_145_1, deduped_146_1, deduped_147_1, deduped_148_1, deduped_149_1, deduped_150_1, deduped_151_1, deduped_152_1, deduped_153_1, deduped_154_1, deduped_155_1, deduped_156_1, deduped_157_1, deduped_158_1, deduped_159_1, deduped_160_1, deduped_161_1, deduped_162_1, deduped_163_1, deduped_164_1, deduped_165_1, deduped_166_1, deduped_167_1, deduped_168_1, deduped_169_1, deduped_170_1, deduped_171_1, deduped_172_1, deduped_173_1, deduped_174_1, deduped_175_1, deduped_176_1, deduped_177_1, deduped_178_1, deduped_179_1, deduped_180_1, deduped_181_1, deduped_182_1, deduped_183_1, deduped_184_1, deduped_185_1, deduped_186_1, deduped_187_1, deduped_188_1, deduped_189_1, deduped_190_1, deduped_191_1, deduped_192_1, deduped_193_1, deduped_194_1, deduped_195_1, deduped_196_1, deduped_197_1, deduped_198_1, deduped_199_1, deduped_200_1, deduped_201_1, deduped_202_1, deduped_203_1, deduped_204_1, deduped_205_1, deduped_206_1, deduped_207_1, deduped_208_1;
    deduped_208_1 := DefiningTripleOfQuiver( a_1 );
    deduped_207_1 := DefiningTripleOfQuiver( b_1 );
    deduped_206_1 := deduped_207_1[3];
    deduped_205_1 := deduped_208_1[3];
    deduped_204_1 := deduped_208_1[2];
    deduped_203_1 := deduped_207_1[2];
    deduped_202_1 := deduped_207_1[1];
    deduped_201_1 := ModelingCategory( ModelingCategory( cat_1 ) );
    deduped_200_1 := SetOfObjects( deduped_201_1 );
    deduped_199_1 := SetOfGeneratingMorphisms( deduped_201_1 );
    deduped_198_1 := Source( deduped_201_1 );
    deduped_197_1 := DefiningPairOfUnderlyingQuiver( deduped_201_1 );
    deduped_196_1 := List( deduped_199_1, function ( logic_new_func_x_2 )
            return BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) );
        end );
    deduped_195_1 := Length( deduped_200_1 );
    deduped_194_1 := UnderlyingQuiverAlgebra( deduped_198_1 );
    deduped_193_1 := BasisPathsByVertexIndex( deduped_198_1 );
    deduped_192_1 := deduped_197_1[2];
    deduped_191_1 := deduped_197_1[1];
    deduped_190_1 := [ 1 .. deduped_195_1 ];
    deduped_189_1 := [ 1 .. deduped_191_1 ];
    deduped_188_1 := List( deduped_199_1, function ( logic_new_func_x_2 )
            return QuiverVertexAsIdentityPath( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
        end );
    deduped_187_1 := List( deduped_199_1, function ( logic_new_func_x_2 )
            return VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
        end );
    deduped_186_1 := List( deduped_199_1, function ( logic_new_func_x_2 )
            return QuiverVertexAsIdentityPath( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
        end );
    deduped_185_1 := List( deduped_199_1, function ( logic_new_func_x_2 )
            return VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
        end );
    deduped_184_1 := Length( deduped_192_1 );
    deduped_183_1 := [ 0 .. deduped_195_1 - 1 ];
    deduped_182_1 := [ 1 .. deduped_184_1 ];
    deduped_178_1 := deduped_185_1[1];
    hoisted_43_1 := deduped_178_1;
    hoisted_2_1 := List( deduped_193_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, Length );
        end );
    hoisted_44_1 := List( deduped_200_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_43_1];
        end );
    hoisted_10_1 := [ deduped_208_1[1], deduped_204_1 ];
    hoisted_1_1 := [ deduped_202_1, deduped_203_1 ];
    deduped_181_1 := List( deduped_190_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_44_1[logic_new_func_x_2] * hoisted_10_1[logic_new_func_x_2]);
        end );
    deduped_176_1 := deduped_185_1[2];
    hoisted_94_1 := deduped_176_1;
    hoisted_95_1 := List( deduped_200_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_94_1];
        end );
    deduped_180_1 := List( deduped_190_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_95_1[logic_new_func_x_2] * hoisted_10_1[logic_new_func_x_2]);
        end );
    deduped_179_1 := deduped_187_1[1];
    deduped_177_1 := deduped_187_1[2];
    deduped_175_1 := deduped_184_1 * 2;
    deduped_174_1 := [ 1 .. deduped_191_1 + deduped_184_1 ];
    deduped_173_1 := deduped_193_1[deduped_179_1];
    deduped_172_1 := deduped_193_1[deduped_177_1];
    deduped_171_1 := [ 0 .. deduped_175_1 - 1 ];
    deduped_170_1 := [ 0 .. Product( deduped_181_1 ) - 1 ];
    deduped_169_1 := [ 0 .. Product( deduped_180_1 ) - 1 ];
    hoisted_57_1 := deduped_179_1;
    hoisted_58_1 := List( deduped_200_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_57_1];
        end );
    hoisted_12_1 := deduped_202_1;
    hoisted_11_1 := deduped_192_1;
    deduped_168_1 := Concatenation( List( deduped_189_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_58_1[logic_new_func_x_2] * hoisted_10_1[logic_new_func_x_2]);
          end ), List( deduped_182_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_11_1[logic_new_func_x_2][2];
              return hoisted_12_1 ^ (hoisted_58_1[deduped_1_2] * hoisted_10_1[deduped_1_2]);
          end ) );
    hoisted_108_1 := deduped_177_1;
    hoisted_109_1 := List( deduped_200_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_108_1];
        end );
    deduped_167_1 := Concatenation( List( deduped_189_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_109_1[logic_new_func_x_2] * hoisted_10_1[logic_new_func_x_2]);
          end ), List( deduped_182_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_11_1[logic_new_func_x_2][2];
              return hoisted_12_1 ^ (hoisted_109_1[deduped_1_2] * hoisted_10_1[deduped_1_2]);
          end ) );
    deduped_166_1 := Concatenation( List( deduped_189_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_95_1[logic_new_func_x_2] * hoisted_10_1[logic_new_func_x_2]);
          end ), List( deduped_182_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_11_1[logic_new_func_x_2][2];
              return hoisted_12_1 ^ (hoisted_95_1[deduped_1_2] * hoisted_10_1[deduped_1_2]);
          end ) );
    deduped_165_1 := Concatenation( List( deduped_189_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_44_1[logic_new_func_x_2] * hoisted_10_1[logic_new_func_x_2]);
          end ), List( deduped_182_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_11_1[logic_new_func_x_2][2];
              return hoisted_12_1 ^ (hoisted_44_1[deduped_1_2] * hoisted_10_1[deduped_1_2]);
          end ) );
    hoisted_8_1 := deduped_199_1;
    hoisted_7_1 := deduped_194_1;
    hoisted_6_1 := deduped_193_1;
    hoisted_5_1 := HomStructureOnBasisPaths( deduped_198_1 );
    hoisted_4_1 := deduped_200_1;
    hoisted_3_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_148_1 := List( deduped_200_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
            deduped_4_2 := UnderlyingVertex( logic_new_func_x_2 );
            deduped_3_2 := VertexIndex( deduped_4_2 );
            hoisted_2_2 := SafePosition( hoisted_6_1[deduped_3_2][deduped_3_2], BasisPathOfPathAlgebraBasisElement( PathAsAlgebraElement( hoisted_7_1, QuiverVertexAsIdentityPath( deduped_4_2 ) ) ) );
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
    deduped_147_1 := deduped_148_1[2];
    hoisted_31_1 := List( deduped_147_1[1], Length );
    deduped_164_1 := Concatenation( List( deduped_189_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_31_1[logic_new_func_x_2] * hoisted_10_1[logic_new_func_x_2]);
          end ), List( deduped_182_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_11_1[logic_new_func_x_2][2];
              return hoisted_12_1 ^ (hoisted_31_1[deduped_1_2] * hoisted_10_1[deduped_1_2]);
          end ) );
    deduped_146_1 := deduped_148_1[1];
    hoisted_9_1 := List( deduped_146_1[1], Length );
    deduped_163_1 := Concatenation( List( deduped_189_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_9_1[logic_new_func_x_2] * hoisted_10_1[logic_new_func_x_2]);
          end ), List( deduped_182_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_11_1[logic_new_func_x_2][2];
              return hoisted_12_1 ^ (hoisted_9_1[deduped_1_2] * hoisted_10_1[deduped_1_2]);
          end ) );
    deduped_162_1 := [ 0 .. Product( deduped_168_1 ) - 1 ];
    deduped_161_1 := [ 0 .. Product( deduped_167_1 ) - 1 ];
    deduped_160_1 := [ 0 .. Product( deduped_166_1 ) - 1 ];
    deduped_159_1 := [ 0 .. Product( deduped_165_1 ) - 1 ];
    deduped_158_1 := [ 0 .. Product( deduped_164_1 ) - 1 ];
    deduped_157_1 := [ 0 .. Product( deduped_163_1 ) - 1 ];
    hoisted_68_1 := List( deduped_199_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_57_1];
        end );
    hoisted_67_1 := List( deduped_199_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_57_1];
        end );
    hoisted_65_1 := SafePosition( deduped_173_1[deduped_179_1], BasisPathOfPathAlgebraBasisElement( PathAsAlgebraElement( deduped_194_1, deduped_188_1[1] ) ) );
    hoisted_66_1 := List( deduped_199_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_57_1][deduped_3_2][hoisted_57_1][SafePosition( hoisted_6_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_65_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_57_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_60_1 := deduped_162_1;
    hoisted_59_1 := deduped_168_1;
    hoisted_61_1 := List( deduped_174_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_59_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_59_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_60_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_27_1 := [ List( deduped_206_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_206_1, function ( a_2 )
                return a_2[2];
            end ) ];
    hoisted_26_1 := deduped_203_1;
    hoisted_24_1 := deduped_204_1;
    hoisted_23_1 := [ List( deduped_205_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_205_1, function ( a_2 )
                return a_2[2];
            end ) ];
    hoisted_69_1 := Concatenation( List( deduped_182_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, hoisted_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2;
              deduped_22_2 := hoisted_11_1[logic_new_func_x_2];
              deduped_21_2 := deduped_22_2[2];
              deduped_20_2 := deduped_22_2[1];
              deduped_19_2 := hoisted_58_1[deduped_21_2] * hoisted_10_1[deduped_21_2];
              deduped_18_2 := hoisted_58_1[deduped_20_2] * hoisted_10_1[deduped_20_2];
              deduped_17_2 := [ 0 .. deduped_19_2 - 1 ];
              hoisted_14_2 := hoisted_27_1[logic_new_func_x_2];
              hoisted_11_2 := deduped_17_2;
              hoisted_16_2 := List( [ 0 .. hoisted_26_1 ^ deduped_19_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_11_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_26_1 ^ j_4 ), hoisted_26_1 );
                          end );
                      hoisted_2_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_1_3[1 + i_4];
                          end );
                      hoisted_3_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_14_2[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                      return Sum( List( hoisted_11_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_15_2 := hoisted_61_1[deduped_21_2];
              hoisted_9_2 := hoisted_68_1[logic_new_func_x_2];
              hoisted_7_2 := hoisted_23_1[logic_new_func_x_2];
              hoisted_2_2 := hoisted_67_1[logic_new_func_x_2];
              hoisted_6_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_2_2 ), hoisted_24_1 );
                  end );
              hoisted_8_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_7_2[1 + hoisted_6_2[(1 + i_3)]];
                  end );
              hoisted_4_2 := hoisted_66_1[logic_new_func_x_2];
              hoisted_3_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( i_3, hoisted_2_2 );
                  end );
              hoisted_5_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                  end );
              hoisted_10_2 := List( deduped_17_2, function ( i_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + i_3;
                      return hoisted_5_2[deduped_1_3] + hoisted_8_2[deduped_1_3] * hoisted_9_2;
                  end );
              hoisted_1_2 := [ 0 .. deduped_18_2 - 1 ];
              hoisted_13_2 := List( [ 0 .. hoisted_12_1 ^ deduped_18_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_12_1 ^ j_4 ), hoisted_12_1 );
                          end );
                      hoisted_2_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_10_2[(1 + i_4)]];
                          end );
                      hoisted_3_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_2_3[1 + i_4];
                          end );
                      return Sum( List( hoisted_11_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_12_2 := hoisted_61_1[deduped_20_2];
              return [ List( hoisted_60_1, function ( i_3 )
                          return hoisted_13_2[1 + hoisted_12_2[(1 + i_3)]];
                      end ), List( hoisted_60_1, function ( i_3 )
                          return hoisted_16_2[1 + hoisted_15_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_15_1 := deduped_191_1;
    hoisted_63_1 := Concatenation( List( deduped_182_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_59_1[hoisted_15_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_64_1 := List( deduped_171_1, function ( j_2 )
            return Product( hoisted_63_1{[ 1 .. j_2 ]} );
        end );
    hoisted_62_1 := Concatenation( List( deduped_182_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_61_1[hoisted_15_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_20_1 := [ 1 .. deduped_175_1 ];
    hoisted_70_1 := [ List( deduped_162_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_20_1, function ( j_3 )
                        return hoisted_62_1[j_3][hoisted_1_2] * hoisted_64_1[j_3];
                    end );
            end ), List( deduped_162_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_20_1, function ( j_3 )
                        return hoisted_69_1[j_3][hoisted_1_2] * hoisted_64_1[j_3];
                    end );
            end ) ];
    hoisted_30_1 := [ 1 ];
    deduped_156_1 := Filtered( deduped_162_1, function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + x_2;
            return ForAll( hoisted_30_1, function ( j_3 )
                    return hoisted_70_1[j_3][hoisted_1_2] = hoisted_70_1[j_3 + 1][hoisted_1_2];
                end );
        end );
    hoisted_119_1 := List( deduped_199_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_108_1];
        end );
    hoisted_118_1 := List( deduped_199_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_108_1];
        end );
    hoisted_116_1 := SafePosition( deduped_172_1[deduped_177_1], BasisPathOfPathAlgebraBasisElement( PathAsAlgebraElement( deduped_194_1, deduped_188_1[2] ) ) );
    hoisted_117_1 := List( deduped_199_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_108_1][deduped_3_2][hoisted_108_1][SafePosition( hoisted_6_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_116_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_108_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_111_1 := deduped_161_1;
    hoisted_110_1 := deduped_167_1;
    hoisted_112_1 := List( deduped_174_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_110_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_110_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_111_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_120_1 := Concatenation( List( deduped_182_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, hoisted_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2;
              deduped_22_2 := hoisted_11_1[logic_new_func_x_2];
              deduped_21_2 := deduped_22_2[2];
              deduped_20_2 := deduped_22_2[1];
              deduped_19_2 := hoisted_109_1[deduped_21_2] * hoisted_10_1[deduped_21_2];
              deduped_18_2 := hoisted_109_1[deduped_20_2] * hoisted_10_1[deduped_20_2];
              deduped_17_2 := [ 0 .. deduped_19_2 - 1 ];
              hoisted_14_2 := hoisted_27_1[logic_new_func_x_2];
              hoisted_11_2 := deduped_17_2;
              hoisted_16_2 := List( [ 0 .. hoisted_26_1 ^ deduped_19_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_11_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_26_1 ^ j_4 ), hoisted_26_1 );
                          end );
                      hoisted_2_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_1_3[1 + i_4];
                          end );
                      hoisted_3_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_14_2[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                      return Sum( List( hoisted_11_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_15_2 := hoisted_112_1[deduped_21_2];
              hoisted_9_2 := hoisted_119_1[logic_new_func_x_2];
              hoisted_7_2 := hoisted_23_1[logic_new_func_x_2];
              hoisted_2_2 := hoisted_118_1[logic_new_func_x_2];
              hoisted_6_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_2_2 ), hoisted_24_1 );
                  end );
              hoisted_8_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_7_2[1 + hoisted_6_2[(1 + i_3)]];
                  end );
              hoisted_4_2 := hoisted_117_1[logic_new_func_x_2];
              hoisted_3_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( i_3, hoisted_2_2 );
                  end );
              hoisted_5_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                  end );
              hoisted_10_2 := List( deduped_17_2, function ( i_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + i_3;
                      return hoisted_5_2[deduped_1_3] + hoisted_8_2[deduped_1_3] * hoisted_9_2;
                  end );
              hoisted_1_2 := [ 0 .. deduped_18_2 - 1 ];
              hoisted_13_2 := List( [ 0 .. hoisted_12_1 ^ deduped_18_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_12_1 ^ j_4 ), hoisted_12_1 );
                          end );
                      hoisted_2_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_10_2[(1 + i_4)]];
                          end );
                      hoisted_3_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_2_3[1 + i_4];
                          end );
                      return Sum( List( hoisted_11_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_12_2 := hoisted_112_1[deduped_20_2];
              return [ List( hoisted_111_1, function ( i_3 )
                          return hoisted_13_2[1 + hoisted_12_2[(1 + i_3)]];
                      end ), List( hoisted_111_1, function ( i_3 )
                          return hoisted_16_2[1 + hoisted_15_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_114_1 := Concatenation( List( deduped_182_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_110_1[hoisted_15_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_115_1 := List( deduped_171_1, function ( j_2 )
            return Product( hoisted_114_1{[ 1 .. j_2 ]} );
        end );
    hoisted_113_1 := Concatenation( List( deduped_182_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_112_1[hoisted_15_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_121_1 := [ List( deduped_161_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_20_1, function ( j_3 )
                        return hoisted_113_1[j_3][hoisted_1_2] * hoisted_115_1[j_3];
                    end );
            end ), List( deduped_161_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_20_1, function ( j_3 )
                        return hoisted_120_1[j_3][hoisted_1_2] * hoisted_115_1[j_3];
                    end );
            end ) ];
    deduped_155_1 := Filtered( deduped_161_1, function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + x_2;
            return ForAll( hoisted_30_1, function ( j_3 )
                    return hoisted_121_1[j_3][hoisted_1_2] = hoisted_121_1[j_3 + 1][hoisted_1_2];
                end );
        end );
    hoisted_105_1 := List( deduped_199_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_94_1];
        end );
    hoisted_104_1 := List( deduped_199_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_94_1];
        end );
    hoisted_102_1 := SafePosition( deduped_193_1[deduped_176_1][deduped_176_1], BasisPathOfPathAlgebraBasisElement( PathAsAlgebraElement( deduped_194_1, deduped_186_1[2] ) ) );
    hoisted_103_1 := List( deduped_199_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_94_1][deduped_3_2][hoisted_94_1][SafePosition( hoisted_6_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_102_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_94_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_97_1 := deduped_160_1;
    hoisted_96_1 := deduped_166_1;
    hoisted_98_1 := List( deduped_174_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_96_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_96_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_97_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_106_1 := Concatenation( List( deduped_182_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, hoisted_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2;
              deduped_22_2 := hoisted_11_1[logic_new_func_x_2];
              deduped_21_2 := deduped_22_2[2];
              deduped_20_2 := deduped_22_2[1];
              deduped_19_2 := hoisted_95_1[deduped_21_2] * hoisted_10_1[deduped_21_2];
              deduped_18_2 := hoisted_95_1[deduped_20_2] * hoisted_10_1[deduped_20_2];
              deduped_17_2 := [ 0 .. deduped_19_2 - 1 ];
              hoisted_14_2 := hoisted_27_1[logic_new_func_x_2];
              hoisted_11_2 := deduped_17_2;
              hoisted_16_2 := List( [ 0 .. hoisted_26_1 ^ deduped_19_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_11_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_26_1 ^ j_4 ), hoisted_26_1 );
                          end );
                      hoisted_2_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_1_3[1 + i_4];
                          end );
                      hoisted_3_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_14_2[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                      return Sum( List( hoisted_11_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_15_2 := hoisted_98_1[deduped_21_2];
              hoisted_9_2 := hoisted_105_1[logic_new_func_x_2];
              hoisted_7_2 := hoisted_23_1[logic_new_func_x_2];
              hoisted_2_2 := hoisted_104_1[logic_new_func_x_2];
              hoisted_6_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_2_2 ), hoisted_24_1 );
                  end );
              hoisted_8_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_7_2[1 + hoisted_6_2[(1 + i_3)]];
                  end );
              hoisted_4_2 := hoisted_103_1[logic_new_func_x_2];
              hoisted_3_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( i_3, hoisted_2_2 );
                  end );
              hoisted_5_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                  end );
              hoisted_10_2 := List( deduped_17_2, function ( i_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + i_3;
                      return hoisted_5_2[deduped_1_3] + hoisted_8_2[deduped_1_3] * hoisted_9_2;
                  end );
              hoisted_1_2 := [ 0 .. deduped_18_2 - 1 ];
              hoisted_13_2 := List( [ 0 .. hoisted_12_1 ^ deduped_18_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_12_1 ^ j_4 ), hoisted_12_1 );
                          end );
                      hoisted_2_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_10_2[(1 + i_4)]];
                          end );
                      hoisted_3_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_2_3[1 + i_4];
                          end );
                      return Sum( List( hoisted_11_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_12_2 := hoisted_98_1[deduped_20_2];
              return [ List( hoisted_97_1, function ( i_3 )
                          return hoisted_13_2[1 + hoisted_12_2[(1 + i_3)]];
                      end ), List( hoisted_97_1, function ( i_3 )
                          return hoisted_16_2[1 + hoisted_15_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_100_1 := Concatenation( List( deduped_182_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_96_1[hoisted_15_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_101_1 := List( deduped_171_1, function ( j_2 )
            return Product( hoisted_100_1{[ 1 .. j_2 ]} );
        end );
    hoisted_99_1 := Concatenation( List( deduped_182_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_98_1[hoisted_15_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_107_1 := [ List( deduped_160_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_20_1, function ( j_3 )
                        return hoisted_99_1[j_3][hoisted_1_2] * hoisted_101_1[j_3];
                    end );
            end ), List( deduped_160_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_20_1, function ( j_3 )
                        return hoisted_106_1[j_3][hoisted_1_2] * hoisted_101_1[j_3];
                    end );
            end ) ];
    deduped_154_1 := Filtered( deduped_160_1, function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + x_2;
            return ForAll( hoisted_30_1, function ( j_3 )
                    return hoisted_107_1[j_3][hoisted_1_2] = hoisted_107_1[j_3 + 1][hoisted_1_2];
                end );
        end );
    hoisted_54_1 := List( deduped_199_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_43_1];
        end );
    hoisted_53_1 := List( deduped_199_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_43_1];
        end );
    hoisted_51_1 := SafePosition( deduped_193_1[deduped_178_1][deduped_178_1], BasisPathOfPathAlgebraBasisElement( PathAsAlgebraElement( deduped_194_1, deduped_186_1[1] ) ) );
    hoisted_52_1 := List( deduped_199_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_43_1][deduped_3_2][hoisted_43_1][SafePosition( hoisted_6_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_51_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_43_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_46_1 := deduped_159_1;
    hoisted_45_1 := deduped_165_1;
    hoisted_47_1 := List( deduped_174_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_45_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_45_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_46_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_55_1 := Concatenation( List( deduped_182_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, hoisted_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2;
              deduped_22_2 := hoisted_11_1[logic_new_func_x_2];
              deduped_21_2 := deduped_22_2[2];
              deduped_20_2 := deduped_22_2[1];
              deduped_19_2 := hoisted_44_1[deduped_21_2] * hoisted_10_1[deduped_21_2];
              deduped_18_2 := hoisted_44_1[deduped_20_2] * hoisted_10_1[deduped_20_2];
              deduped_17_2 := [ 0 .. deduped_19_2 - 1 ];
              hoisted_14_2 := hoisted_27_1[logic_new_func_x_2];
              hoisted_11_2 := deduped_17_2;
              hoisted_16_2 := List( [ 0 .. hoisted_26_1 ^ deduped_19_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_11_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_26_1 ^ j_4 ), hoisted_26_1 );
                          end );
                      hoisted_2_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_1_3[1 + i_4];
                          end );
                      hoisted_3_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_14_2[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                      return Sum( List( hoisted_11_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_15_2 := hoisted_47_1[deduped_21_2];
              hoisted_9_2 := hoisted_54_1[logic_new_func_x_2];
              hoisted_7_2 := hoisted_23_1[logic_new_func_x_2];
              hoisted_2_2 := hoisted_53_1[logic_new_func_x_2];
              hoisted_6_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_2_2 ), hoisted_24_1 );
                  end );
              hoisted_8_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_7_2[1 + hoisted_6_2[(1 + i_3)]];
                  end );
              hoisted_4_2 := hoisted_52_1[logic_new_func_x_2];
              hoisted_3_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( i_3, hoisted_2_2 );
                  end );
              hoisted_5_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                  end );
              hoisted_10_2 := List( deduped_17_2, function ( i_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + i_3;
                      return hoisted_5_2[deduped_1_3] + hoisted_8_2[deduped_1_3] * hoisted_9_2;
                  end );
              hoisted_1_2 := [ 0 .. deduped_18_2 - 1 ];
              hoisted_13_2 := List( [ 0 .. hoisted_12_1 ^ deduped_18_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_12_1 ^ j_4 ), hoisted_12_1 );
                          end );
                      hoisted_2_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_10_2[(1 + i_4)]];
                          end );
                      hoisted_3_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_2_3[1 + i_4];
                          end );
                      return Sum( List( hoisted_11_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_12_2 := hoisted_47_1[deduped_20_2];
              return [ List( hoisted_46_1, function ( i_3 )
                          return hoisted_13_2[1 + hoisted_12_2[(1 + i_3)]];
                      end ), List( hoisted_46_1, function ( i_3 )
                          return hoisted_16_2[1 + hoisted_15_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_49_1 := Concatenation( List( deduped_182_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_45_1[hoisted_15_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_50_1 := List( deduped_171_1, function ( j_2 )
            return Product( hoisted_49_1{[ 1 .. j_2 ]} );
        end );
    hoisted_48_1 := Concatenation( List( deduped_182_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_47_1[hoisted_15_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_56_1 := [ List( deduped_159_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_20_1, function ( j_3 )
                        return hoisted_48_1[j_3][hoisted_1_2] * hoisted_50_1[j_3];
                    end );
            end ), List( deduped_159_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_20_1, function ( j_3 )
                        return hoisted_55_1[j_3][hoisted_1_2] * hoisted_50_1[j_3];
                    end );
            end ) ];
    deduped_153_1 := Filtered( deduped_159_1, function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + x_2;
            return ForAll( hoisted_30_1, function ( j_3 )
                    return hoisted_56_1[j_3][hoisted_1_2] = hoisted_56_1[j_3 + 1][hoisted_1_2];
                end );
        end );
    deduped_152_1 := [ 0 .. Length( deduped_156_1 ) - 1 ];
    deduped_151_1 := [ 0 .. Length( deduped_155_1 ) - 1 ];
    deduped_150_1 := [ 0 .. Length( deduped_154_1 ) - 1 ];
    deduped_149_1 := [ 0 .. Length( deduped_153_1 ) - 1 ];
    deduped_145_1 := deduped_147_1[2];
    deduped_144_1 := deduped_146_1[2];
    hoisted_125_1 := List( deduped_190_1, function ( logic_new_func_x_2 )
            return hoisted_110_1[logic_new_func_x_2];
        end );
    hoisted_126_1 := List( deduped_183_1, function ( j_2 )
            return Product( hoisted_125_1{[ 1 .. j_2 ]} );
        end );
    hoisted_123_1 := deduped_151_1;
    hoisted_122_1 := deduped_155_1;
    hoisted_124_1 := List( deduped_190_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_2_2 := hoisted_110_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_110_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_111_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_123_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_122_1[(1 + i_3)]];
                end );
        end );
    hoisted_76_1 := deduped_190_1;
    hoisted_143_1 := List( deduped_151_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_76_1, function ( j_3 )
                    return hoisted_124_1[j_3][hoisted_1_2] * hoisted_126_1[j_3];
                end );
        end );
    hoisted_133_1 := List( deduped_190_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_109_1[logic_new_func_x_2] * hoisted_10_1[logic_new_func_x_2]);
        end );
    hoisted_134_1 := List( deduped_183_1, function ( j_2 )
            return Product( hoisted_133_1{[ 1 .. j_2 ]} );
        end );
    hoisted_131_1 := deduped_169_1;
    hoisted_130_1 := deduped_180_1;
    hoisted_127_1 := SafePosition( deduped_172_1[deduped_176_1], deduped_196_1[2] );
    hoisted_128_1 := List( deduped_200_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := UnderlyingVertex( logic_new_func_x_2 );
            deduped_2_2 := VertexIndex( deduped_3_2 );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_108_1][deduped_2_2][hoisted_94_1][SafePosition( hoisted_6_1[deduped_2_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( PathAsAlgebraElement( hoisted_7_1, QuiverVertexAsIdentityPath( deduped_3_2 ) ) ) )][hoisted_127_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_108_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_129_1 := List( deduped_190_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, deduped_13_2, deduped_14_2, deduped_15_2, deduped_16_2, deduped_17_2, deduped_18_2;
            deduped_18_2 := hoisted_109_1[logic_new_func_x_2];
            deduped_17_2 := hoisted_10_1[logic_new_func_x_2];
            deduped_16_2 := hoisted_95_1[logic_new_func_x_2];
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
            hoisted_5_2 := hoisted_128_1[logic_new_func_x_2];
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
    hoisted_132_1 := List( deduped_190_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2;
            hoisted_4_2 := hoisted_129_1[logic_new_func_x_2];
            hoisted_2_2 := hoisted_130_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_130_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_131_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_131_1, function ( i_3 )
                    return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                end );
        end );
    hoisted_141_1 := List( deduped_169_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_76_1, function ( j_3 )
                    return hoisted_132_1[j_3][hoisted_1_2] * hoisted_134_1[j_3];
                end );
        end );
    hoisted_138_1 := List( deduped_190_1, function ( logic_new_func_x_2 )
            return hoisted_96_1[logic_new_func_x_2];
        end );
    hoisted_139_1 := List( deduped_183_1, function ( j_2 )
            return Product( hoisted_138_1{[ 1 .. j_2 ]} );
        end );
    hoisted_136_1 := deduped_150_1;
    hoisted_135_1 := deduped_154_1;
    hoisted_137_1 := List( deduped_190_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_2_2 := hoisted_96_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_96_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_97_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_136_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_135_1[(1 + i_3)]];
                end );
        end );
    hoisted_140_1 := List( deduped_150_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_76_1, function ( j_3 )
                    return hoisted_137_1[j_3][hoisted_1_2] * hoisted_139_1[j_3];
                end );
        end );
    hoisted_142_1 := List( deduped_150_1, function ( i_2 )
            return hoisted_141_1[1 + hoisted_140_1[(1 + i_2)]];
        end );
    hoisted_74_1 := List( deduped_190_1, function ( logic_new_func_x_2 )
            return hoisted_59_1[logic_new_func_x_2];
        end );
    hoisted_75_1 := List( deduped_183_1, function ( j_2 )
            return Product( hoisted_74_1{[ 1 .. j_2 ]} );
        end );
    hoisted_72_1 := deduped_152_1;
    hoisted_71_1 := deduped_156_1;
    hoisted_73_1 := List( deduped_190_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_2_2 := hoisted_59_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_59_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_60_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_72_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_71_1[(1 + i_3)]];
                end );
        end );
    hoisted_93_1 := List( deduped_152_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_76_1, function ( j_3 )
                    return hoisted_73_1[j_3][hoisted_1_2] * hoisted_75_1[j_3];
                end );
        end );
    hoisted_83_1 := List( deduped_190_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_58_1[logic_new_func_x_2] * hoisted_10_1[logic_new_func_x_2]);
        end );
    hoisted_84_1 := List( deduped_183_1, function ( j_2 )
            return Product( hoisted_83_1{[ 1 .. j_2 ]} );
        end );
    hoisted_81_1 := deduped_170_1;
    hoisted_80_1 := deduped_181_1;
    hoisted_77_1 := SafePosition( deduped_173_1[deduped_178_1], deduped_196_1[1] );
    hoisted_78_1 := List( deduped_200_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := UnderlyingVertex( logic_new_func_x_2 );
            deduped_2_2 := VertexIndex( deduped_3_2 );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_57_1][deduped_2_2][hoisted_43_1][SafePosition( hoisted_6_1[deduped_2_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( PathAsAlgebraElement( hoisted_7_1, QuiverVertexAsIdentityPath( deduped_3_2 ) ) ) )][hoisted_77_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_57_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_79_1 := List( deduped_190_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, deduped_13_2, deduped_14_2, deduped_15_2, deduped_16_2, deduped_17_2, deduped_18_2;
            deduped_18_2 := hoisted_58_1[logic_new_func_x_2];
            deduped_17_2 := hoisted_10_1[logic_new_func_x_2];
            deduped_16_2 := hoisted_44_1[logic_new_func_x_2];
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
            hoisted_5_2 := hoisted_78_1[logic_new_func_x_2];
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
    hoisted_82_1 := List( deduped_190_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2;
            hoisted_4_2 := hoisted_79_1[logic_new_func_x_2];
            hoisted_2_2 := hoisted_80_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_80_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_81_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_81_1, function ( i_3 )
                    return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                end );
        end );
    hoisted_91_1 := List( deduped_170_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_76_1, function ( j_3 )
                    return hoisted_82_1[j_3][hoisted_1_2] * hoisted_84_1[j_3];
                end );
        end );
    hoisted_88_1 := List( deduped_190_1, function ( logic_new_func_x_2 )
            return hoisted_45_1[logic_new_func_x_2];
        end );
    hoisted_89_1 := List( deduped_183_1, function ( j_2 )
            return Product( hoisted_88_1{[ 1 .. j_2 ]} );
        end );
    hoisted_86_1 := deduped_149_1;
    hoisted_85_1 := deduped_153_1;
    hoisted_87_1 := List( deduped_190_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_2_2 := hoisted_45_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_45_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_46_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_86_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_85_1[(1 + i_3)]];
                end );
        end );
    hoisted_90_1 := List( deduped_149_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_76_1, function ( j_3 )
                    return hoisted_87_1[j_3][hoisted_1_2] * hoisted_89_1[j_3];
                end );
        end );
    hoisted_92_1 := List( deduped_149_1, function ( i_2 )
            return hoisted_91_1[1 + hoisted_90_1[(1 + i_2)]];
        end );
    hoisted_40_1 := List( deduped_145_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    hoisted_39_1 := List( deduped_145_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_38_1 := List( deduped_145_1, AsList );
    hoisted_33_1 := deduped_158_1;
    hoisted_32_1 := deduped_164_1;
    hoisted_34_1 := List( deduped_174_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_32_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_32_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_33_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_41_1 := Concatenation( List( deduped_182_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, hoisted_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2;
              deduped_22_2 := hoisted_11_1[logic_new_func_x_2];
              deduped_21_2 := deduped_22_2[2];
              deduped_20_2 := deduped_22_2[1];
              deduped_19_2 := hoisted_31_1[deduped_21_2] * hoisted_10_1[deduped_21_2];
              deduped_18_2 := hoisted_31_1[deduped_20_2] * hoisted_10_1[deduped_20_2];
              deduped_17_2 := [ 0 .. deduped_19_2 - 1 ];
              hoisted_14_2 := hoisted_27_1[logic_new_func_x_2];
              hoisted_11_2 := deduped_17_2;
              hoisted_16_2 := List( [ 0 .. hoisted_26_1 ^ deduped_19_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_11_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_26_1 ^ j_4 ), hoisted_26_1 );
                          end );
                      hoisted_2_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_1_3[1 + i_4];
                          end );
                      hoisted_3_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_14_2[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                      return Sum( List( hoisted_11_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_15_2 := hoisted_34_1[deduped_21_2];
              hoisted_9_2 := hoisted_40_1[logic_new_func_x_2];
              hoisted_7_2 := hoisted_23_1[logic_new_func_x_2];
              hoisted_2_2 := hoisted_39_1[logic_new_func_x_2];
              hoisted_6_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_2_2 ), hoisted_24_1 );
                  end );
              hoisted_8_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_7_2[1 + hoisted_6_2[(1 + i_3)]];
                  end );
              hoisted_4_2 := hoisted_38_1[logic_new_func_x_2];
              hoisted_3_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( i_3, hoisted_2_2 );
                  end );
              hoisted_5_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                  end );
              hoisted_10_2 := List( deduped_17_2, function ( i_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + i_3;
                      return hoisted_5_2[deduped_1_3] + hoisted_8_2[deduped_1_3] * hoisted_9_2;
                  end );
              hoisted_1_2 := [ 0 .. deduped_18_2 - 1 ];
              hoisted_13_2 := List( [ 0 .. hoisted_12_1 ^ deduped_18_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_12_1 ^ j_4 ), hoisted_12_1 );
                          end );
                      hoisted_2_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_10_2[(1 + i_4)]];
                          end );
                      hoisted_3_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_2_3[1 + i_4];
                          end );
                      return Sum( List( hoisted_11_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_12_2 := hoisted_34_1[deduped_20_2];
              return [ List( hoisted_33_1, function ( i_3 )
                          return hoisted_13_2[1 + hoisted_12_2[(1 + i_3)]];
                      end ), List( hoisted_33_1, function ( i_3 )
                          return hoisted_16_2[1 + hoisted_15_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_36_1 := Concatenation( List( deduped_182_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_32_1[hoisted_15_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_37_1 := List( deduped_171_1, function ( j_2 )
            return Product( hoisted_36_1{[ 1 .. j_2 ]} );
        end );
    hoisted_35_1 := Concatenation( List( deduped_182_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_34_1[hoisted_15_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_42_1 := [ List( deduped_158_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_20_1, function ( j_3 )
                        return hoisted_35_1[j_3][hoisted_1_2] * hoisted_37_1[j_3];
                    end );
            end ), List( deduped_158_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_20_1, function ( j_3 )
                        return hoisted_41_1[j_3][hoisted_1_2] * hoisted_37_1[j_3];
                    end );
            end ) ];
    hoisted_25_1 := List( deduped_144_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    hoisted_22_1 := List( deduped_144_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_21_1 := List( deduped_144_1, AsList );
    hoisted_14_1 := deduped_157_1;
    hoisted_13_1 := deduped_163_1;
    hoisted_16_1 := List( deduped_174_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_13_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_13_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_14_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_28_1 := Concatenation( List( deduped_182_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, hoisted_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2;
              deduped_22_2 := hoisted_11_1[logic_new_func_x_2];
              deduped_21_2 := deduped_22_2[2];
              deduped_20_2 := deduped_22_2[1];
              deduped_19_2 := hoisted_9_1[deduped_21_2] * hoisted_10_1[deduped_21_2];
              deduped_18_2 := hoisted_9_1[deduped_20_2] * hoisted_10_1[deduped_20_2];
              deduped_17_2 := [ 0 .. deduped_19_2 - 1 ];
              hoisted_14_2 := hoisted_27_1[logic_new_func_x_2];
              hoisted_11_2 := deduped_17_2;
              hoisted_16_2 := List( [ 0 .. hoisted_26_1 ^ deduped_19_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_11_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_26_1 ^ j_4 ), hoisted_26_1 );
                          end );
                      hoisted_2_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_1_3[1 + i_4];
                          end );
                      hoisted_3_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_14_2[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                      return Sum( List( hoisted_11_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_15_2 := hoisted_16_1[deduped_21_2];
              hoisted_9_2 := hoisted_25_1[logic_new_func_x_2];
              hoisted_7_2 := hoisted_23_1[logic_new_func_x_2];
              hoisted_2_2 := hoisted_22_1[logic_new_func_x_2];
              hoisted_6_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_2_2 ), hoisted_24_1 );
                  end );
              hoisted_8_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_7_2[1 + hoisted_6_2[(1 + i_3)]];
                  end );
              hoisted_4_2 := hoisted_21_1[logic_new_func_x_2];
              hoisted_3_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( i_3, hoisted_2_2 );
                  end );
              hoisted_5_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                  end );
              hoisted_10_2 := List( deduped_17_2, function ( i_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + i_3;
                      return hoisted_5_2[deduped_1_3] + hoisted_8_2[deduped_1_3] * hoisted_9_2;
                  end );
              hoisted_1_2 := [ 0 .. deduped_18_2 - 1 ];
              hoisted_13_2 := List( [ 0 .. hoisted_12_1 ^ deduped_18_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_12_1 ^ j_4 ), hoisted_12_1 );
                          end );
                      hoisted_2_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_10_2[(1 + i_4)]];
                          end );
                      hoisted_3_3 := List( hoisted_11_2, function ( i_4 )
                              return hoisted_2_3[1 + i_4];
                          end );
                      return Sum( List( hoisted_11_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_12_1 ^ k_4;
                            end ) );
                  end );
              hoisted_12_2 := hoisted_16_1[deduped_20_2];
              return [ List( hoisted_14_1, function ( i_3 )
                          return hoisted_13_2[1 + hoisted_12_2[(1 + i_3)]];
                      end ), List( hoisted_14_1, function ( i_3 )
                          return hoisted_16_2[1 + hoisted_15_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_18_1 := Concatenation( List( deduped_182_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_13_1[hoisted_15_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_19_1 := List( deduped_171_1, function ( j_2 )
            return Product( hoisted_18_1{[ 1 .. j_2 ]} );
        end );
    hoisted_17_1 := Concatenation( List( deduped_182_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_16_1[hoisted_15_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_29_1 := [ List( deduped_157_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_20_1, function ( j_3 )
                        return hoisted_17_1[j_3][hoisted_1_2] * hoisted_19_1[j_3];
                    end );
            end ), List( deduped_157_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_20_1, function ( j_3 )
                        return hoisted_28_1[j_3][hoisted_1_2] * hoisted_19_1[j_3];
                    end );
            end ) ];
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfQuiver, NTuple( 3, Length( Filtered( deduped_157_1, function ( x_2 )
                  local hoisted_1_2;
                  hoisted_1_2 := 1 + x_2;
                  return ForAll( hoisted_30_1, function ( j_3 )
                          return hoisted_29_1[j_3][hoisted_1_2] = hoisted_29_1[j_3 + 1][hoisted_1_2];
                      end );
              end ) ), Length( Filtered( deduped_158_1, function ( x_2 )
                  local hoisted_1_2;
                  hoisted_1_2 := 1 + x_2;
                  return ForAll( hoisted_30_1, function ( j_3 )
                          return hoisted_42_1[j_3][hoisted_1_2] = hoisted_42_1[j_3 + 1][hoisted_1_2];
                      end );
              end ) ), ListN( List( deduped_149_1, function ( x_2 )
                  return -1 + SafePosition( hoisted_93_1, hoisted_92_1[(1 + x_2)] );
              end ), List( deduped_150_1, function ( x_2 )
                  return -1 + SafePosition( hoisted_143_1, hoisted_142_1[(1 + x_2)] );
              end ), function ( s_2, t_2 )
                return NTuple( 2, s_2, t_2 );
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
