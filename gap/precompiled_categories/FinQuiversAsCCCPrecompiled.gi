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
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, hoisted_34_1, hoisted_35_1, hoisted_36_1, hoisted_37_1, hoisted_38_1, hoisted_39_1, hoisted_40_1, hoisted_41_1, hoisted_42_1, hoisted_43_1, hoisted_44_1, hoisted_45_1, hoisted_46_1, hoisted_47_1, hoisted_48_1, hoisted_49_1, hoisted_50_1, hoisted_51_1, hoisted_52_1, hoisted_53_1, hoisted_54_1, hoisted_55_1, hoisted_56_1, hoisted_57_1, hoisted_58_1, hoisted_59_1, hoisted_60_1, hoisted_61_1, hoisted_62_1, hoisted_63_1, hoisted_64_1, hoisted_65_1, hoisted_66_1, hoisted_67_1, hoisted_68_1, hoisted_69_1, hoisted_70_1, hoisted_71_1, hoisted_72_1, hoisted_73_1, hoisted_74_1, hoisted_75_1, hoisted_76_1, hoisted_77_1, hoisted_78_1, hoisted_79_1, hoisted_80_1, hoisted_81_1, hoisted_82_1, hoisted_83_1, hoisted_84_1, hoisted_85_1, hoisted_86_1, hoisted_87_1, hoisted_88_1, hoisted_89_1, hoisted_90_1, hoisted_91_1, hoisted_92_1, hoisted_93_1, hoisted_94_1, hoisted_95_1, hoisted_96_1, hoisted_97_1, hoisted_98_1, hoisted_99_1, hoisted_100_1, hoisted_101_1, hoisted_102_1, hoisted_103_1, hoisted_104_1, hoisted_105_1, hoisted_106_1, hoisted_107_1, hoisted_108_1, hoisted_109_1, hoisted_110_1, hoisted_111_1, hoisted_112_1, hoisted_113_1, hoisted_114_1, hoisted_115_1, hoisted_116_1, hoisted_117_1, hoisted_118_1, hoisted_119_1, hoisted_120_1, hoisted_121_1, hoisted_122_1, hoisted_123_1, hoisted_124_1, hoisted_125_1, hoisted_126_1, hoisted_127_1, hoisted_128_1, hoisted_129_1, hoisted_130_1, hoisted_131_1, hoisted_132_1, hoisted_133_1, deduped_134_1, deduped_135_1, deduped_136_1, deduped_137_1, deduped_138_1, deduped_139_1, deduped_140_1, deduped_141_1, deduped_142_1, deduped_143_1, deduped_144_1, deduped_145_1, deduped_146_1, deduped_147_1, deduped_148_1, deduped_149_1, deduped_150_1, deduped_151_1, deduped_152_1, deduped_153_1, deduped_154_1, deduped_155_1, deduped_156_1, deduped_157_1, deduped_158_1, deduped_159_1, deduped_160_1, deduped_161_1, deduped_162_1, deduped_163_1, deduped_164_1, deduped_165_1, deduped_166_1, deduped_167_1, deduped_168_1, deduped_169_1, deduped_170_1, deduped_171_1, deduped_172_1, deduped_173_1, deduped_174_1, deduped_175_1, deduped_176_1, deduped_177_1, deduped_178_1, deduped_179_1, deduped_180_1, deduped_181_1, deduped_182_1, deduped_183_1, deduped_184_1, deduped_185_1, deduped_186_1, deduped_187_1, deduped_188_1, deduped_189_1, deduped_190_1, deduped_191_1, deduped_192_1, deduped_193_1, deduped_194_1, deduped_195_1, deduped_196_1, deduped_197_1;
    deduped_197_1 := DefiningTripleOfQuiver( a_1 );
    deduped_196_1 := DefiningTripleOfQuiver( b_1 );
    deduped_195_1 := deduped_196_1[3];
    deduped_194_1 := deduped_197_1[2];
    deduped_193_1 := deduped_197_1[3];
    deduped_192_1 := deduped_196_1[2];
    deduped_191_1 := deduped_196_1[1];
    deduped_190_1 := ModelingCategory( ModelingCategory( cat_1 ) );
    deduped_189_1 := Source( deduped_190_1 );
    deduped_188_1 := SetOfObjects( deduped_190_1 );
    deduped_187_1 := SetOfGeneratingMorphisms( deduped_190_1 );
    deduped_186_1 := DefiningPairOfUnderlyingQuiver( deduped_190_1 );
    deduped_185_1 := List( deduped_187_1, function ( logic_new_func_x_2 )
            return BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) );
        end );
    deduped_184_1 := Length( deduped_188_1 );
    deduped_183_1 := BasisPathsByVertexIndex( deduped_189_1 );
    deduped_182_1 := deduped_186_1[2];
    deduped_181_1 := deduped_186_1[1];
    deduped_180_1 := [ 1 .. deduped_184_1 ];
    deduped_179_1 := [ 1 .. deduped_181_1 ];
    deduped_178_1 := List( deduped_187_1, function ( logic_new_func_x_2 )
            return QuiverVertexAsIdentityPath( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
        end );
    deduped_177_1 := List( deduped_187_1, function ( logic_new_func_x_2 )
            return VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
        end );
    deduped_176_1 := List( deduped_187_1, function ( logic_new_func_x_2 )
            return QuiverVertexAsIdentityPath( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
        end );
    deduped_175_1 := List( deduped_187_1, function ( logic_new_func_x_2 )
            return VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
        end );
    deduped_174_1 := Length( deduped_182_1 );
    deduped_173_1 := [ 0 .. deduped_184_1 - 1 ];
    deduped_172_1 := [ 1 .. deduped_174_1 ];
    deduped_168_1 := deduped_177_1[1];
    hoisted_39_1 := deduped_168_1;
    hoisted_2_1 := List( deduped_183_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, Length );
        end );
    hoisted_40_1 := List( deduped_188_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_39_1];
        end );
    hoisted_9_1 := [ deduped_197_1[1], deduped_194_1 ];
    hoisted_1_1 := [ deduped_191_1, deduped_192_1 ];
    deduped_171_1 := List( deduped_180_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_40_1[logic_new_func_x_2] * hoisted_9_1[logic_new_func_x_2]);
        end );
    deduped_167_1 := deduped_177_1[2];
    hoisted_87_1 := deduped_167_1;
    hoisted_88_1 := List( deduped_188_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_87_1];
        end );
    deduped_170_1 := List( deduped_180_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_88_1[logic_new_func_x_2] * hoisted_9_1[logic_new_func_x_2]);
        end );
    deduped_169_1 := deduped_175_1[1];
    deduped_166_1 := deduped_174_1 * 2;
    deduped_165_1 := deduped_175_1[2];
    deduped_164_1 := [ 1 .. deduped_181_1 + deduped_174_1 ];
    deduped_163_1 := deduped_183_1[deduped_169_1];
    deduped_162_1 := deduped_183_1[deduped_165_1];
    deduped_161_1 := [ 0 .. deduped_166_1 - 1 ];
    deduped_160_1 := [ 0 .. Product( deduped_171_1 ) - 1 ];
    deduped_159_1 := [ 0 .. Product( deduped_170_1 ) - 1 ];
    hoisted_52_1 := deduped_169_1;
    hoisted_53_1 := List( deduped_188_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_52_1];
        end );
    hoisted_11_1 := deduped_191_1;
    hoisted_10_1 := deduped_182_1;
    deduped_158_1 := Concatenation( List( deduped_179_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_53_1[logic_new_func_x_2] * hoisted_9_1[logic_new_func_x_2]);
          end ), List( deduped_172_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + hoisted_10_1[logic_new_func_x_2][2];
              return hoisted_11_1 ^ (hoisted_53_1[deduped_1_2] * hoisted_9_1[deduped_1_2]);
          end ) );
    hoisted_100_1 := deduped_165_1;
    hoisted_101_1 := List( deduped_188_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_100_1];
        end );
    deduped_157_1 := Concatenation( List( deduped_179_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_101_1[logic_new_func_x_2] * hoisted_9_1[logic_new_func_x_2]);
          end ), List( deduped_172_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + hoisted_10_1[logic_new_func_x_2][2];
              return hoisted_11_1 ^ (hoisted_101_1[deduped_1_2] * hoisted_9_1[deduped_1_2]);
          end ) );
    deduped_156_1 := Concatenation( List( deduped_179_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_88_1[logic_new_func_x_2] * hoisted_9_1[logic_new_func_x_2]);
          end ), List( deduped_172_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + hoisted_10_1[logic_new_func_x_2][2];
              return hoisted_11_1 ^ (hoisted_88_1[deduped_1_2] * hoisted_9_1[deduped_1_2]);
          end ) );
    deduped_155_1 := Concatenation( List( deduped_179_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_40_1[logic_new_func_x_2] * hoisted_9_1[logic_new_func_x_2]);
          end ), List( deduped_172_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + hoisted_10_1[logic_new_func_x_2][2];
              return hoisted_11_1 ^ (hoisted_40_1[deduped_1_2] * hoisted_9_1[deduped_1_2]);
          end ) );
    hoisted_7_1 := deduped_187_1;
    hoisted_6_1 := deduped_183_1;
    hoisted_5_1 := HomStructureOnBasisPaths( deduped_189_1 );
    hoisted_4_1 := deduped_188_1;
    hoisted_3_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_142_1 := List( deduped_188_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
            deduped_4_2 := UnderlyingVertex( logic_new_func_x_2 );
            deduped_3_2 := VertexIndex( deduped_4_2 );
            hoisted_2_2 := SafePosition( hoisted_6_1[deduped_3_2][deduped_3_2], QuiverVertexAsIdentityPath( deduped_4_2 ) );
            hoisted_1_2 := deduped_3_2;
            return NTuple( 2, List( hoisted_4_1, function ( o_3 )
                      return CreateCapCategoryObjectWithAttributes( hoisted_3_1, Length, hoisted_2_1[VertexIndex( UnderlyingVertex( o_3 ) )][hoisted_1_2] );
                  end ), List( hoisted_7_1, function ( m_3 )
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
    deduped_137_1 := deduped_142_1[2];
    hoisted_28_1 := List( deduped_137_1[1], Length );
    deduped_154_1 := Concatenation( List( deduped_179_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_28_1[logic_new_func_x_2] * hoisted_9_1[logic_new_func_x_2]);
          end ), List( deduped_172_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + hoisted_10_1[logic_new_func_x_2][2];
              return hoisted_11_1 ^ (hoisted_28_1[deduped_1_2] * hoisted_9_1[deduped_1_2]);
          end ) );
    deduped_136_1 := deduped_142_1[1];
    hoisted_8_1 := List( deduped_136_1[1], Length );
    deduped_153_1 := Concatenation( List( deduped_179_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_8_1[logic_new_func_x_2] * hoisted_9_1[logic_new_func_x_2]);
          end ), List( deduped_172_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + hoisted_10_1[logic_new_func_x_2][2];
              return hoisted_11_1 ^ (hoisted_8_1[deduped_1_2] * hoisted_9_1[deduped_1_2]);
          end ) );
    deduped_152_1 := [ 0 .. Product( deduped_158_1 ) - 1 ];
    deduped_151_1 := [ 0 .. Product( deduped_157_1 ) - 1 ];
    deduped_150_1 := [ 0 .. Product( deduped_156_1 ) - 1 ];
    deduped_149_1 := [ 0 .. Product( deduped_155_1 ) - 1 ];
    deduped_148_1 := [ 0 .. Product( deduped_154_1 ) - 1 ];
    deduped_147_1 := [ 0 .. Product( deduped_153_1 ) - 1 ];
    hoisted_63_1 := List( deduped_187_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_52_1];
        end );
    hoisted_62_1 := List( deduped_187_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_52_1];
        end );
    hoisted_60_1 := SafePosition( deduped_163_1[deduped_169_1], deduped_176_1[1] );
    hoisted_61_1 := List( deduped_187_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_52_1][deduped_3_2][hoisted_52_1][SafePosition( hoisted_6_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_60_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_52_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_55_1 := deduped_152_1;
    hoisted_54_1 := deduped_158_1;
    hoisted_56_1 := List( deduped_164_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_54_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_54_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_55_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_26_1 := [ List( deduped_195_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_195_1, function ( a_2 )
                return a_2[2];
            end ) ];
    hoisted_25_1 := deduped_192_1;
    hoisted_23_1 := deduped_194_1;
    hoisted_22_1 := [ List( deduped_193_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_193_1, function ( a_2 )
                return a_2[2];
            end ) ];
    hoisted_64_1 := Concatenation( List( deduped_172_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, deduped_14_2, deduped_15_2, deduped_16_2, deduped_17_2, deduped_18_2, deduped_19_2;
              deduped_19_2 := hoisted_10_1[logic_new_func_x_2];
              deduped_18_2 := 1 + deduped_19_2[2];
              deduped_17_2 := 1 + deduped_19_2[1];
              deduped_16_2 := hoisted_53_1[deduped_18_2] * hoisted_9_1[deduped_18_2];
              deduped_15_2 := hoisted_53_1[deduped_17_2] * hoisted_9_1[deduped_17_2];
              deduped_14_2 := [ 0 .. deduped_16_2 - 1 ];
              hoisted_11_2 := hoisted_26_1[logic_new_func_x_2];
              hoisted_8_2 := deduped_14_2;
              hoisted_13_2 := List( [ 0 .. hoisted_25_1 ^ deduped_16_2 - 1 ], function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := List( hoisted_8_2, function ( logic_new_func_x_4 )
                              return hoisted_11_2[1 + REM_INT( QUO_INT( i_3, hoisted_25_1 ^ logic_new_func_x_4 ), hoisted_25_1 )];
                          end );
                      return Sum( List( hoisted_8_2, function ( k_4 )
                                return hoisted_1_3[(1 + k_4)] * hoisted_11_1 ^ k_4;
                            end ) );
                  end );
              hoisted_12_2 := hoisted_56_1[deduped_18_2];
              hoisted_7_2 := hoisted_63_1[logic_new_func_x_2];
              hoisted_5_2 := hoisted_22_1[logic_new_func_x_2];
              hoisted_2_2 := hoisted_62_1[logic_new_func_x_2];
              hoisted_6_2 := List( deduped_14_2, function ( logic_new_func_x_3 )
                      return hoisted_5_2[1 + REM_INT( QUO_INT( logic_new_func_x_3, hoisted_2_2 ), hoisted_23_1 )];
                  end );
              hoisted_3_2 := hoisted_61_1[logic_new_func_x_2];
              hoisted_4_2 := List( deduped_14_2, function ( logic_new_func_x_3 )
                      return hoisted_3_2[1 + REM_INT( logic_new_func_x_3, hoisted_2_2 )];
                  end );
              hoisted_1_2 := [ 0 .. deduped_15_2 - 1 ];
              hoisted_10_2 := List( [ 0 .. hoisted_11_1 ^ deduped_15_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3;
                      hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_11_1 ^ j_4 ), hoisted_11_1 );
                          end );
                      hoisted_2_3 := List( hoisted_8_2, function ( logic_new_func_x_4 )
                              local deduped_1_4;
                              deduped_1_4 := 1 + logic_new_func_x_4;
                              return hoisted_1_3[1 + (hoisted_4_2[deduped_1_4] + hoisted_6_2[deduped_1_4] * hoisted_7_2)];
                          end );
                      return Sum( List( hoisted_8_2, function ( k_4 )
                                return hoisted_2_3[(1 + k_4)] * hoisted_11_1 ^ k_4;
                            end ) );
                  end );
              hoisted_9_2 := hoisted_56_1[deduped_17_2];
              return [ List( hoisted_55_1, function ( i_3 )
                          return hoisted_10_2[1 + hoisted_9_2[(1 + i_3)]];
                      end ), List( hoisted_55_1, function ( i_3 )
                          return hoisted_13_2[1 + hoisted_12_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_14_1 := deduped_181_1;
    hoisted_58_1 := Concatenation( List( deduped_172_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_54_1[hoisted_14_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_59_1 := List( deduped_161_1, function ( j_2 )
            return Product( hoisted_58_1{[ 1 .. j_2 ]} );
        end );
    hoisted_57_1 := Concatenation( List( deduped_172_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_56_1[hoisted_14_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_19_1 := [ 1 .. deduped_166_1 ];
    deduped_146_1 := Filtered( deduped_152_1, function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + x_2;
            return Sum( hoisted_19_1, function ( j_3 )
                      return hoisted_57_1[j_3][hoisted_1_2] * hoisted_59_1[j_3];
                  end ) = Sum( hoisted_19_1, function ( j_3 )
                      return hoisted_64_1[j_3][hoisted_1_2] * hoisted_59_1[j_3];
                  end );
        end );
    hoisted_111_1 := List( deduped_187_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_100_1];
        end );
    hoisted_110_1 := List( deduped_187_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_100_1];
        end );
    hoisted_108_1 := SafePosition( deduped_162_1[deduped_165_1], deduped_176_1[2] );
    hoisted_109_1 := List( deduped_187_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_100_1][deduped_3_2][hoisted_100_1][SafePosition( hoisted_6_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_108_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_100_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_103_1 := deduped_151_1;
    hoisted_102_1 := deduped_157_1;
    hoisted_104_1 := List( deduped_164_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_102_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_102_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_103_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_112_1 := Concatenation( List( deduped_172_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, deduped_14_2, deduped_15_2, deduped_16_2, deduped_17_2, deduped_18_2, deduped_19_2;
              deduped_19_2 := hoisted_10_1[logic_new_func_x_2];
              deduped_18_2 := 1 + deduped_19_2[2];
              deduped_17_2 := 1 + deduped_19_2[1];
              deduped_16_2 := hoisted_101_1[deduped_18_2] * hoisted_9_1[deduped_18_2];
              deduped_15_2 := hoisted_101_1[deduped_17_2] * hoisted_9_1[deduped_17_2];
              deduped_14_2 := [ 0 .. deduped_16_2 - 1 ];
              hoisted_11_2 := hoisted_26_1[logic_new_func_x_2];
              hoisted_8_2 := deduped_14_2;
              hoisted_13_2 := List( [ 0 .. hoisted_25_1 ^ deduped_16_2 - 1 ], function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := List( hoisted_8_2, function ( logic_new_func_x_4 )
                              return hoisted_11_2[1 + REM_INT( QUO_INT( i_3, hoisted_25_1 ^ logic_new_func_x_4 ), hoisted_25_1 )];
                          end );
                      return Sum( List( hoisted_8_2, function ( k_4 )
                                return hoisted_1_3[(1 + k_4)] * hoisted_11_1 ^ k_4;
                            end ) );
                  end );
              hoisted_12_2 := hoisted_104_1[deduped_18_2];
              hoisted_7_2 := hoisted_111_1[logic_new_func_x_2];
              hoisted_5_2 := hoisted_22_1[logic_new_func_x_2];
              hoisted_2_2 := hoisted_110_1[logic_new_func_x_2];
              hoisted_6_2 := List( deduped_14_2, function ( logic_new_func_x_3 )
                      return hoisted_5_2[1 + REM_INT( QUO_INT( logic_new_func_x_3, hoisted_2_2 ), hoisted_23_1 )];
                  end );
              hoisted_3_2 := hoisted_109_1[logic_new_func_x_2];
              hoisted_4_2 := List( deduped_14_2, function ( logic_new_func_x_3 )
                      return hoisted_3_2[1 + REM_INT( logic_new_func_x_3, hoisted_2_2 )];
                  end );
              hoisted_1_2 := [ 0 .. deduped_15_2 - 1 ];
              hoisted_10_2 := List( [ 0 .. hoisted_11_1 ^ deduped_15_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3;
                      hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_11_1 ^ j_4 ), hoisted_11_1 );
                          end );
                      hoisted_2_3 := List( hoisted_8_2, function ( logic_new_func_x_4 )
                              local deduped_1_4;
                              deduped_1_4 := 1 + logic_new_func_x_4;
                              return hoisted_1_3[1 + (hoisted_4_2[deduped_1_4] + hoisted_6_2[deduped_1_4] * hoisted_7_2)];
                          end );
                      return Sum( List( hoisted_8_2, function ( k_4 )
                                return hoisted_2_3[(1 + k_4)] * hoisted_11_1 ^ k_4;
                            end ) );
                  end );
              hoisted_9_2 := hoisted_104_1[deduped_17_2];
              return [ List( hoisted_103_1, function ( i_3 )
                          return hoisted_10_2[1 + hoisted_9_2[(1 + i_3)]];
                      end ), List( hoisted_103_1, function ( i_3 )
                          return hoisted_13_2[1 + hoisted_12_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_106_1 := Concatenation( List( deduped_172_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_102_1[hoisted_14_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_107_1 := List( deduped_161_1, function ( j_2 )
            return Product( hoisted_106_1{[ 1 .. j_2 ]} );
        end );
    hoisted_105_1 := Concatenation( List( deduped_172_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_104_1[hoisted_14_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    deduped_145_1 := Filtered( deduped_151_1, function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + x_2;
            return Sum( hoisted_19_1, function ( j_3 )
                      return hoisted_105_1[j_3][hoisted_1_2] * hoisted_107_1[j_3];
                  end ) = Sum( hoisted_19_1, function ( j_3 )
                      return hoisted_112_1[j_3][hoisted_1_2] * hoisted_107_1[j_3];
                  end );
        end );
    hoisted_98_1 := List( deduped_187_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_87_1];
        end );
    hoisted_97_1 := List( deduped_187_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_87_1];
        end );
    hoisted_95_1 := SafePosition( deduped_183_1[deduped_167_1][deduped_167_1], deduped_178_1[2] );
    hoisted_96_1 := List( deduped_187_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_87_1][deduped_3_2][hoisted_87_1][SafePosition( hoisted_6_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_95_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_87_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_90_1 := deduped_150_1;
    hoisted_89_1 := deduped_156_1;
    hoisted_91_1 := List( deduped_164_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_89_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_89_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_90_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_99_1 := Concatenation( List( deduped_172_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, deduped_14_2, deduped_15_2, deduped_16_2, deduped_17_2, deduped_18_2, deduped_19_2;
              deduped_19_2 := hoisted_10_1[logic_new_func_x_2];
              deduped_18_2 := 1 + deduped_19_2[2];
              deduped_17_2 := 1 + deduped_19_2[1];
              deduped_16_2 := hoisted_88_1[deduped_18_2] * hoisted_9_1[deduped_18_2];
              deduped_15_2 := hoisted_88_1[deduped_17_2] * hoisted_9_1[deduped_17_2];
              deduped_14_2 := [ 0 .. deduped_16_2 - 1 ];
              hoisted_11_2 := hoisted_26_1[logic_new_func_x_2];
              hoisted_8_2 := deduped_14_2;
              hoisted_13_2 := List( [ 0 .. hoisted_25_1 ^ deduped_16_2 - 1 ], function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := List( hoisted_8_2, function ( logic_new_func_x_4 )
                              return hoisted_11_2[1 + REM_INT( QUO_INT( i_3, hoisted_25_1 ^ logic_new_func_x_4 ), hoisted_25_1 )];
                          end );
                      return Sum( List( hoisted_8_2, function ( k_4 )
                                return hoisted_1_3[(1 + k_4)] * hoisted_11_1 ^ k_4;
                            end ) );
                  end );
              hoisted_12_2 := hoisted_91_1[deduped_18_2];
              hoisted_7_2 := hoisted_98_1[logic_new_func_x_2];
              hoisted_5_2 := hoisted_22_1[logic_new_func_x_2];
              hoisted_2_2 := hoisted_97_1[logic_new_func_x_2];
              hoisted_6_2 := List( deduped_14_2, function ( logic_new_func_x_3 )
                      return hoisted_5_2[1 + REM_INT( QUO_INT( logic_new_func_x_3, hoisted_2_2 ), hoisted_23_1 )];
                  end );
              hoisted_3_2 := hoisted_96_1[logic_new_func_x_2];
              hoisted_4_2 := List( deduped_14_2, function ( logic_new_func_x_3 )
                      return hoisted_3_2[1 + REM_INT( logic_new_func_x_3, hoisted_2_2 )];
                  end );
              hoisted_1_2 := [ 0 .. deduped_15_2 - 1 ];
              hoisted_10_2 := List( [ 0 .. hoisted_11_1 ^ deduped_15_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3;
                      hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_11_1 ^ j_4 ), hoisted_11_1 );
                          end );
                      hoisted_2_3 := List( hoisted_8_2, function ( logic_new_func_x_4 )
                              local deduped_1_4;
                              deduped_1_4 := 1 + logic_new_func_x_4;
                              return hoisted_1_3[1 + (hoisted_4_2[deduped_1_4] + hoisted_6_2[deduped_1_4] * hoisted_7_2)];
                          end );
                      return Sum( List( hoisted_8_2, function ( k_4 )
                                return hoisted_2_3[(1 + k_4)] * hoisted_11_1 ^ k_4;
                            end ) );
                  end );
              hoisted_9_2 := hoisted_91_1[deduped_17_2];
              return [ List( hoisted_90_1, function ( i_3 )
                          return hoisted_10_2[1 + hoisted_9_2[(1 + i_3)]];
                      end ), List( hoisted_90_1, function ( i_3 )
                          return hoisted_13_2[1 + hoisted_12_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_93_1 := Concatenation( List( deduped_172_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_89_1[hoisted_14_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_94_1 := List( deduped_161_1, function ( j_2 )
            return Product( hoisted_93_1{[ 1 .. j_2 ]} );
        end );
    hoisted_92_1 := Concatenation( List( deduped_172_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_91_1[hoisted_14_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    deduped_144_1 := Filtered( deduped_150_1, function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + x_2;
            return Sum( hoisted_19_1, function ( j_3 )
                      return hoisted_92_1[j_3][hoisted_1_2] * hoisted_94_1[j_3];
                  end ) = Sum( hoisted_19_1, function ( j_3 )
                      return hoisted_99_1[j_3][hoisted_1_2] * hoisted_94_1[j_3];
                  end );
        end );
    hoisted_50_1 := List( deduped_187_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_39_1];
        end );
    hoisted_49_1 := List( deduped_187_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_39_1];
        end );
    hoisted_47_1 := SafePosition( deduped_183_1[deduped_168_1][deduped_168_1], deduped_178_1[1] );
    hoisted_48_1 := List( deduped_187_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_39_1][deduped_3_2][hoisted_39_1][SafePosition( hoisted_6_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_47_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_39_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_42_1 := deduped_149_1;
    hoisted_41_1 := deduped_155_1;
    hoisted_43_1 := List( deduped_164_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_41_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_41_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_42_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_51_1 := Concatenation( List( deduped_172_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, deduped_14_2, deduped_15_2, deduped_16_2, deduped_17_2, deduped_18_2, deduped_19_2;
              deduped_19_2 := hoisted_10_1[logic_new_func_x_2];
              deduped_18_2 := 1 + deduped_19_2[2];
              deduped_17_2 := 1 + deduped_19_2[1];
              deduped_16_2 := hoisted_40_1[deduped_18_2] * hoisted_9_1[deduped_18_2];
              deduped_15_2 := hoisted_40_1[deduped_17_2] * hoisted_9_1[deduped_17_2];
              deduped_14_2 := [ 0 .. deduped_16_2 - 1 ];
              hoisted_11_2 := hoisted_26_1[logic_new_func_x_2];
              hoisted_8_2 := deduped_14_2;
              hoisted_13_2 := List( [ 0 .. hoisted_25_1 ^ deduped_16_2 - 1 ], function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := List( hoisted_8_2, function ( logic_new_func_x_4 )
                              return hoisted_11_2[1 + REM_INT( QUO_INT( i_3, hoisted_25_1 ^ logic_new_func_x_4 ), hoisted_25_1 )];
                          end );
                      return Sum( List( hoisted_8_2, function ( k_4 )
                                return hoisted_1_3[(1 + k_4)] * hoisted_11_1 ^ k_4;
                            end ) );
                  end );
              hoisted_12_2 := hoisted_43_1[deduped_18_2];
              hoisted_7_2 := hoisted_50_1[logic_new_func_x_2];
              hoisted_5_2 := hoisted_22_1[logic_new_func_x_2];
              hoisted_2_2 := hoisted_49_1[logic_new_func_x_2];
              hoisted_6_2 := List( deduped_14_2, function ( logic_new_func_x_3 )
                      return hoisted_5_2[1 + REM_INT( QUO_INT( logic_new_func_x_3, hoisted_2_2 ), hoisted_23_1 )];
                  end );
              hoisted_3_2 := hoisted_48_1[logic_new_func_x_2];
              hoisted_4_2 := List( deduped_14_2, function ( logic_new_func_x_3 )
                      return hoisted_3_2[1 + REM_INT( logic_new_func_x_3, hoisted_2_2 )];
                  end );
              hoisted_1_2 := [ 0 .. deduped_15_2 - 1 ];
              hoisted_10_2 := List( [ 0 .. hoisted_11_1 ^ deduped_15_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3;
                      hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_11_1 ^ j_4 ), hoisted_11_1 );
                          end );
                      hoisted_2_3 := List( hoisted_8_2, function ( logic_new_func_x_4 )
                              local deduped_1_4;
                              deduped_1_4 := 1 + logic_new_func_x_4;
                              return hoisted_1_3[1 + (hoisted_4_2[deduped_1_4] + hoisted_6_2[deduped_1_4] * hoisted_7_2)];
                          end );
                      return Sum( List( hoisted_8_2, function ( k_4 )
                                return hoisted_2_3[(1 + k_4)] * hoisted_11_1 ^ k_4;
                            end ) );
                  end );
              hoisted_9_2 := hoisted_43_1[deduped_17_2];
              return [ List( hoisted_42_1, function ( i_3 )
                          return hoisted_10_2[1 + hoisted_9_2[(1 + i_3)]];
                      end ), List( hoisted_42_1, function ( i_3 )
                          return hoisted_13_2[1 + hoisted_12_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_45_1 := Concatenation( List( deduped_172_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_41_1[hoisted_14_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_46_1 := List( deduped_161_1, function ( j_2 )
            return Product( hoisted_45_1{[ 1 .. j_2 ]} );
        end );
    hoisted_44_1 := Concatenation( List( deduped_172_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_43_1[hoisted_14_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    deduped_143_1 := Filtered( deduped_149_1, function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + x_2;
            return Sum( hoisted_19_1, function ( j_3 )
                      return hoisted_44_1[j_3][hoisted_1_2] * hoisted_46_1[j_3];
                  end ) = Sum( hoisted_19_1, function ( j_3 )
                      return hoisted_51_1[j_3][hoisted_1_2] * hoisted_46_1[j_3];
                  end );
        end );
    deduped_141_1 := [ 0 .. Length( deduped_146_1 ) - 1 ];
    deduped_140_1 := [ 0 .. Length( deduped_145_1 ) - 1 ];
    deduped_139_1 := [ 0 .. Length( deduped_144_1 ) - 1 ];
    deduped_138_1 := [ 0 .. Length( deduped_143_1 ) - 1 ];
    deduped_135_1 := deduped_137_1[2];
    deduped_134_1 := deduped_136_1[2];
    hoisted_116_1 := List( deduped_180_1, function ( logic_new_func_x_2 )
            return hoisted_102_1[logic_new_func_x_2];
        end );
    hoisted_117_1 := List( deduped_173_1, function ( j_2 )
            return Product( hoisted_116_1{[ 1 .. j_2 ]} );
        end );
    hoisted_114_1 := deduped_140_1;
    hoisted_113_1 := deduped_145_1;
    hoisted_115_1 := List( deduped_180_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_2_2 := hoisted_102_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_102_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_103_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_114_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_113_1[(1 + i_3)]];
                end );
        end );
    hoisted_70_1 := deduped_180_1;
    hoisted_133_1 := List( deduped_140_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_70_1, function ( j_3 )
                    return hoisted_115_1[j_3][hoisted_1_2] * hoisted_117_1[j_3];
                end );
        end );
    hoisted_124_1 := List( deduped_180_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_101_1[logic_new_func_x_2] * hoisted_9_1[logic_new_func_x_2]);
        end );
    hoisted_125_1 := List( deduped_173_1, function ( j_2 )
            return Product( hoisted_124_1{[ 1 .. j_2 ]} );
        end );
    hoisted_122_1 := deduped_159_1;
    hoisted_121_1 := deduped_170_1;
    hoisted_118_1 := SafePosition( deduped_162_1[deduped_167_1], deduped_185_1[2] );
    hoisted_119_1 := List( deduped_188_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := UnderlyingVertex( logic_new_func_x_2 );
            deduped_2_2 := VertexIndex( deduped_3_2 );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_100_1][deduped_2_2][hoisted_87_1][SafePosition( hoisted_6_1[deduped_2_2][deduped_2_2], QuiverVertexAsIdentityPath( deduped_3_2 ) )][hoisted_118_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_100_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_120_1 := List( deduped_180_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, deduped_10_2, deduped_11_2, deduped_12_2, deduped_13_2, deduped_14_2, deduped_15_2;
            deduped_15_2 := hoisted_101_1[logic_new_func_x_2];
            deduped_14_2 := hoisted_9_1[logic_new_func_x_2];
            deduped_13_2 := hoisted_88_1[logic_new_func_x_2];
            deduped_12_2 := hoisted_1_1[logic_new_func_x_2];
            deduped_11_2 := deduped_13_2 * deduped_14_2;
            deduped_10_2 := [ 0 .. deduped_15_2 * deduped_14_2 - 1 ];
            hoisted_9_2 := deduped_10_2;
            hoisted_8_2 := deduped_13_2;
            hoisted_6_2 := deduped_14_2;
            hoisted_3_2 := deduped_15_2;
            hoisted_7_2 := List( deduped_10_2, function ( logic_new_func_x_3 )
                    return REM_INT( QUO_INT( logic_new_func_x_3, hoisted_3_2 ), hoisted_6_2 );
                end );
            hoisted_4_2 := hoisted_119_1[logic_new_func_x_2];
            hoisted_5_2 := List( deduped_10_2, function ( logic_new_func_x_3 )
                    return hoisted_4_2[1 + REM_INT( logic_new_func_x_3, hoisted_3_2 )];
                end );
            hoisted_2_2 := [ 0 .. deduped_11_2 - 1 ];
            hoisted_1_2 := deduped_12_2;
            return List( [ 0 .. deduped_12_2 ^ deduped_11_2 - 1 ], function ( i_3 )
                    local hoisted_1_3, hoisted_2_3;
                    hoisted_1_3 := List( hoisted_2_2, function ( j_4 )
                            return REM_INT( QUO_INT( i_3, hoisted_1_2 ^ j_4 ), hoisted_1_2 );
                        end );
                    hoisted_2_3 := List( hoisted_9_2, function ( logic_new_func_x_4 )
                            local deduped_1_4;
                            deduped_1_4 := 1 + logic_new_func_x_4;
                            return hoisted_1_3[1 + (hoisted_5_2[deduped_1_4] + hoisted_7_2[deduped_1_4] * hoisted_8_2)];
                        end );
                    return Sum( List( hoisted_9_2, function ( k_4 )
                              return hoisted_2_3[(1 + k_4)] * hoisted_1_2 ^ k_4;
                          end ) );
                end );
        end );
    hoisted_123_1 := List( deduped_180_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_120_1[logic_new_func_x_2];
            hoisted_2_2 := hoisted_121_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_121_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_122_1, function ( logic_new_func_x_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( logic_new_func_x_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    hoisted_131_1 := List( deduped_159_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_70_1, function ( j_3 )
                    return hoisted_123_1[j_3][hoisted_1_2] * hoisted_125_1[j_3];
                end );
        end );
    hoisted_129_1 := List( deduped_180_1, function ( logic_new_func_x_2 )
            return hoisted_89_1[logic_new_func_x_2];
        end );
    hoisted_130_1 := List( deduped_173_1, function ( j_2 )
            return Product( hoisted_129_1{[ 1 .. j_2 ]} );
        end );
    hoisted_127_1 := deduped_139_1;
    hoisted_126_1 := deduped_144_1;
    hoisted_128_1 := List( deduped_180_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_2_2 := hoisted_89_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_89_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_90_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_127_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_126_1[(1 + i_3)]];
                end );
        end );
    hoisted_132_1 := List( deduped_139_1, function ( logic_new_func_x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + logic_new_func_x_2;
            return hoisted_131_1[1 + Sum( hoisted_70_1, function ( j_3 )
                       return hoisted_128_1[j_3][hoisted_1_2] * hoisted_130_1[j_3];
                   end )];
        end );
    hoisted_68_1 := List( deduped_180_1, function ( logic_new_func_x_2 )
            return hoisted_54_1[logic_new_func_x_2];
        end );
    hoisted_69_1 := List( deduped_173_1, function ( j_2 )
            return Product( hoisted_68_1{[ 1 .. j_2 ]} );
        end );
    hoisted_66_1 := deduped_141_1;
    hoisted_65_1 := deduped_146_1;
    hoisted_67_1 := List( deduped_180_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_2_2 := hoisted_54_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_54_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_55_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_66_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_65_1[(1 + i_3)]];
                end );
        end );
    hoisted_86_1 := List( deduped_141_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_70_1, function ( j_3 )
                    return hoisted_67_1[j_3][hoisted_1_2] * hoisted_69_1[j_3];
                end );
        end );
    hoisted_77_1 := List( deduped_180_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_53_1[logic_new_func_x_2] * hoisted_9_1[logic_new_func_x_2]);
        end );
    hoisted_78_1 := List( deduped_173_1, function ( j_2 )
            return Product( hoisted_77_1{[ 1 .. j_2 ]} );
        end );
    hoisted_75_1 := deduped_160_1;
    hoisted_74_1 := deduped_171_1;
    hoisted_71_1 := SafePosition( deduped_163_1[deduped_168_1], deduped_185_1[1] );
    hoisted_72_1 := List( deduped_188_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := UnderlyingVertex( logic_new_func_x_2 );
            deduped_2_2 := VertexIndex( deduped_3_2 );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_52_1][deduped_2_2][hoisted_39_1][SafePosition( hoisted_6_1[deduped_2_2][deduped_2_2], QuiverVertexAsIdentityPath( deduped_3_2 ) )][hoisted_71_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_52_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_73_1 := List( deduped_180_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, deduped_10_2, deduped_11_2, deduped_12_2, deduped_13_2, deduped_14_2, deduped_15_2;
            deduped_15_2 := hoisted_53_1[logic_new_func_x_2];
            deduped_14_2 := hoisted_9_1[logic_new_func_x_2];
            deduped_13_2 := hoisted_40_1[logic_new_func_x_2];
            deduped_12_2 := hoisted_1_1[logic_new_func_x_2];
            deduped_11_2 := deduped_13_2 * deduped_14_2;
            deduped_10_2 := [ 0 .. deduped_15_2 * deduped_14_2 - 1 ];
            hoisted_9_2 := deduped_10_2;
            hoisted_8_2 := deduped_13_2;
            hoisted_6_2 := deduped_14_2;
            hoisted_3_2 := deduped_15_2;
            hoisted_7_2 := List( deduped_10_2, function ( logic_new_func_x_3 )
                    return REM_INT( QUO_INT( logic_new_func_x_3, hoisted_3_2 ), hoisted_6_2 );
                end );
            hoisted_4_2 := hoisted_72_1[logic_new_func_x_2];
            hoisted_5_2 := List( deduped_10_2, function ( logic_new_func_x_3 )
                    return hoisted_4_2[1 + REM_INT( logic_new_func_x_3, hoisted_3_2 )];
                end );
            hoisted_2_2 := [ 0 .. deduped_11_2 - 1 ];
            hoisted_1_2 := deduped_12_2;
            return List( [ 0 .. deduped_12_2 ^ deduped_11_2 - 1 ], function ( i_3 )
                    local hoisted_1_3, hoisted_2_3;
                    hoisted_1_3 := List( hoisted_2_2, function ( j_4 )
                            return REM_INT( QUO_INT( i_3, hoisted_1_2 ^ j_4 ), hoisted_1_2 );
                        end );
                    hoisted_2_3 := List( hoisted_9_2, function ( logic_new_func_x_4 )
                            local deduped_1_4;
                            deduped_1_4 := 1 + logic_new_func_x_4;
                            return hoisted_1_3[1 + (hoisted_5_2[deduped_1_4] + hoisted_7_2[deduped_1_4] * hoisted_8_2)];
                        end );
                    return Sum( List( hoisted_9_2, function ( k_4 )
                              return hoisted_2_3[(1 + k_4)] * hoisted_1_2 ^ k_4;
                          end ) );
                end );
        end );
    hoisted_76_1 := List( deduped_180_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_73_1[logic_new_func_x_2];
            hoisted_2_2 := hoisted_74_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_74_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_75_1, function ( logic_new_func_x_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( logic_new_func_x_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    hoisted_84_1 := List( deduped_160_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_70_1, function ( j_3 )
                    return hoisted_76_1[j_3][hoisted_1_2] * hoisted_78_1[j_3];
                end );
        end );
    hoisted_82_1 := List( deduped_180_1, function ( logic_new_func_x_2 )
            return hoisted_41_1[logic_new_func_x_2];
        end );
    hoisted_83_1 := List( deduped_173_1, function ( j_2 )
            return Product( hoisted_82_1{[ 1 .. j_2 ]} );
        end );
    hoisted_80_1 := deduped_138_1;
    hoisted_79_1 := deduped_143_1;
    hoisted_81_1 := List( deduped_180_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_2_2 := hoisted_41_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_41_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_42_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_80_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_79_1[(1 + i_3)]];
                end );
        end );
    hoisted_85_1 := List( deduped_138_1, function ( logic_new_func_x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + logic_new_func_x_2;
            return hoisted_84_1[1 + Sum( hoisted_70_1, function ( j_3 )
                       return hoisted_81_1[j_3][hoisted_1_2] * hoisted_83_1[j_3];
                   end )];
        end );
    hoisted_37_1 := List( deduped_135_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    hoisted_36_1 := List( deduped_135_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_35_1 := List( deduped_135_1, AsList );
    hoisted_30_1 := deduped_148_1;
    hoisted_29_1 := deduped_154_1;
    hoisted_31_1 := List( deduped_164_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_29_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_29_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_30_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_38_1 := Concatenation( List( deduped_172_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, deduped_15_2, deduped_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2;
              deduped_20_2 := hoisted_10_1[logic_new_func_x_2];
              deduped_19_2 := 1 + deduped_20_2[2];
              deduped_18_2 := 1 + deduped_20_2[1];
              deduped_17_2 := hoisted_28_1[deduped_19_2] * hoisted_9_1[deduped_19_2];
              deduped_16_2 := hoisted_28_1[deduped_18_2] * hoisted_9_1[deduped_18_2];
              deduped_15_2 := [ 0 .. deduped_17_2 - 1 ];
              hoisted_12_2 := hoisted_26_1[logic_new_func_x_2];
              hoisted_9_2 := deduped_15_2;
              hoisted_14_2 := List( [ 0 .. hoisted_25_1 ^ deduped_17_2 - 1 ], function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := List( hoisted_9_2, function ( logic_new_func_x_4 )
                              return hoisted_12_2[1 + REM_INT( QUO_INT( i_3, hoisted_25_1 ^ logic_new_func_x_4 ), hoisted_25_1 )];
                          end );
                      return Sum( List( hoisted_9_2, function ( k_4 )
                                return hoisted_1_3[(1 + k_4)] * hoisted_11_1 ^ k_4;
                            end ) );
                  end );
              hoisted_13_2 := hoisted_31_1[deduped_19_2];
              hoisted_7_2 := hoisted_37_1[logic_new_func_x_2];
              hoisted_5_2 := hoisted_22_1[logic_new_func_x_2];
              hoisted_2_2 := hoisted_36_1[logic_new_func_x_2];
              hoisted_6_2 := List( deduped_15_2, function ( logic_new_func_x_3 )
                      return hoisted_5_2[1 + REM_INT( QUO_INT( logic_new_func_x_3, hoisted_2_2 ), hoisted_23_1 )];
                  end );
              hoisted_3_2 := hoisted_35_1[logic_new_func_x_2];
              hoisted_4_2 := List( deduped_15_2, function ( logic_new_func_x_3 )
                      return hoisted_3_2[1 + REM_INT( logic_new_func_x_3, hoisted_2_2 )];
                  end );
              hoisted_8_2 := List( deduped_15_2, function ( i_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + i_3;
                      return hoisted_4_2[deduped_1_3] + hoisted_6_2[deduped_1_3] * hoisted_7_2;
                  end );
              hoisted_1_2 := [ 0 .. deduped_16_2 - 1 ];
              hoisted_11_2 := List( [ 0 .. hoisted_11_1 ^ deduped_16_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3;
                      hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_11_1 ^ j_4 ), hoisted_11_1 );
                          end );
                      hoisted_2_3 := List( hoisted_9_2, function ( logic_new_func_x_4 )
                              return hoisted_1_3[1 + hoisted_8_2[(1 + logic_new_func_x_4)]];
                          end );
                      return Sum( List( hoisted_9_2, function ( k_4 )
                                return hoisted_2_3[(1 + k_4)] * hoisted_11_1 ^ k_4;
                            end ) );
                  end );
              hoisted_10_2 := hoisted_31_1[deduped_18_2];
              return [ List( hoisted_30_1, function ( i_3 )
                          return hoisted_11_2[1 + hoisted_10_2[(1 + i_3)]];
                      end ), List( hoisted_30_1, function ( i_3 )
                          return hoisted_14_2[1 + hoisted_13_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_33_1 := Concatenation( List( deduped_172_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_29_1[hoisted_14_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_34_1 := List( deduped_161_1, function ( j_2 )
            return Product( hoisted_33_1{[ 1 .. j_2 ]} );
        end );
    hoisted_32_1 := Concatenation( List( deduped_172_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_31_1[hoisted_14_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_24_1 := List( deduped_134_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    hoisted_21_1 := List( deduped_134_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_20_1 := List( deduped_134_1, AsList );
    hoisted_13_1 := deduped_147_1;
    hoisted_12_1 := deduped_153_1;
    hoisted_15_1 := List( deduped_164_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_12_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_12_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_13_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_27_1 := Concatenation( List( deduped_172_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, deduped_15_2, deduped_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2;
              deduped_20_2 := hoisted_10_1[logic_new_func_x_2];
              deduped_19_2 := 1 + deduped_20_2[2];
              deduped_18_2 := 1 + deduped_20_2[1];
              deduped_17_2 := hoisted_8_1[deduped_19_2] * hoisted_9_1[deduped_19_2];
              deduped_16_2 := hoisted_8_1[deduped_18_2] * hoisted_9_1[deduped_18_2];
              deduped_15_2 := [ 0 .. deduped_17_2 - 1 ];
              hoisted_12_2 := hoisted_26_1[logic_new_func_x_2];
              hoisted_9_2 := deduped_15_2;
              hoisted_14_2 := List( [ 0 .. hoisted_25_1 ^ deduped_17_2 - 1 ], function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := List( hoisted_9_2, function ( logic_new_func_x_4 )
                              return hoisted_12_2[1 + REM_INT( QUO_INT( i_3, hoisted_25_1 ^ logic_new_func_x_4 ), hoisted_25_1 )];
                          end );
                      return Sum( List( hoisted_9_2, function ( k_4 )
                                return hoisted_1_3[(1 + k_4)] * hoisted_11_1 ^ k_4;
                            end ) );
                  end );
              hoisted_13_2 := hoisted_15_1[deduped_19_2];
              hoisted_7_2 := hoisted_24_1[logic_new_func_x_2];
              hoisted_5_2 := hoisted_22_1[logic_new_func_x_2];
              hoisted_2_2 := hoisted_21_1[logic_new_func_x_2];
              hoisted_6_2 := List( deduped_15_2, function ( logic_new_func_x_3 )
                      return hoisted_5_2[1 + REM_INT( QUO_INT( logic_new_func_x_3, hoisted_2_2 ), hoisted_23_1 )];
                  end );
              hoisted_3_2 := hoisted_20_1[logic_new_func_x_2];
              hoisted_4_2 := List( deduped_15_2, function ( logic_new_func_x_3 )
                      return hoisted_3_2[1 + REM_INT( logic_new_func_x_3, hoisted_2_2 )];
                  end );
              hoisted_8_2 := List( deduped_15_2, function ( i_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + i_3;
                      return hoisted_4_2[deduped_1_3] + hoisted_6_2[deduped_1_3] * hoisted_7_2;
                  end );
              hoisted_1_2 := [ 0 .. deduped_16_2 - 1 ];
              hoisted_11_2 := List( [ 0 .. hoisted_11_1 ^ deduped_16_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3;
                      hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_11_1 ^ j_4 ), hoisted_11_1 );
                          end );
                      hoisted_2_3 := List( hoisted_9_2, function ( logic_new_func_x_4 )
                              return hoisted_1_3[1 + hoisted_8_2[(1 + logic_new_func_x_4)]];
                          end );
                      return Sum( List( hoisted_9_2, function ( k_4 )
                                return hoisted_2_3[(1 + k_4)] * hoisted_11_1 ^ k_4;
                            end ) );
                  end );
              hoisted_10_2 := hoisted_15_1[deduped_18_2];
              return [ List( hoisted_13_1, function ( i_3 )
                          return hoisted_11_2[1 + hoisted_10_2[(1 + i_3)]];
                      end ), List( hoisted_13_1, function ( i_3 )
                          return hoisted_14_2[1 + hoisted_13_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_17_1 := Concatenation( List( deduped_172_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_12_1[hoisted_14_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_18_1 := List( deduped_161_1, function ( j_2 )
            return Product( hoisted_17_1{[ 1 .. j_2 ]} );
        end );
    hoisted_16_1 := Concatenation( List( deduped_172_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_15_1[hoisted_14_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfQuiver, NTuple( 3, Length( Filtered( deduped_147_1, function ( x_2 )
                  local hoisted_1_2;
                  hoisted_1_2 := 1 + x_2;
                  return Sum( hoisted_19_1, function ( j_3 )
                            return hoisted_16_1[j_3][hoisted_1_2] * hoisted_18_1[j_3];
                        end ) = Sum( hoisted_19_1, function ( j_3 )
                            return hoisted_27_1[j_3][hoisted_1_2] * hoisted_18_1[j_3];
                        end );
              end ) ), Length( Filtered( deduped_148_1, function ( x_2 )
                  local hoisted_1_2;
                  hoisted_1_2 := 1 + x_2;
                  return Sum( hoisted_19_1, function ( j_3 )
                            return hoisted_32_1[j_3][hoisted_1_2] * hoisted_34_1[j_3];
                        end ) = Sum( hoisted_19_1, function ( j_3 )
                            return hoisted_38_1[j_3][hoisted_1_2] * hoisted_34_1[j_3];
                        end );
              end ) ), ListN( List( deduped_138_1, function ( x_2 )
                  return -1 + SafePosition( hoisted_86_1, hoisted_85_1[(1 + x_2)] );
              end ), List( deduped_139_1, function ( x_2 )
                  return -1 + SafePosition( hoisted_133_1, hoisted_132_1[(1 + x_2)] );
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
