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
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, hoisted_34_1, hoisted_35_1, hoisted_36_1, hoisted_37_1, hoisted_38_1, hoisted_39_1, hoisted_40_1, hoisted_41_1, hoisted_42_1, hoisted_43_1, hoisted_44_1, hoisted_45_1, hoisted_46_1, hoisted_47_1, hoisted_48_1, hoisted_49_1, hoisted_50_1, hoisted_51_1, hoisted_52_1, hoisted_53_1, hoisted_54_1, hoisted_55_1, hoisted_56_1, hoisted_57_1, hoisted_58_1, hoisted_59_1, hoisted_60_1, hoisted_61_1, hoisted_62_1, hoisted_63_1, hoisted_64_1, hoisted_65_1, hoisted_66_1, hoisted_67_1, hoisted_68_1, hoisted_69_1, hoisted_70_1, hoisted_71_1, hoisted_72_1, hoisted_73_1, hoisted_74_1, hoisted_75_1, hoisted_76_1, hoisted_77_1, hoisted_78_1, hoisted_79_1, hoisted_80_1, hoisted_81_1, hoisted_82_1, hoisted_83_1, hoisted_84_1, hoisted_85_1, hoisted_86_1, hoisted_87_1, hoisted_88_1, hoisted_89_1, hoisted_90_1, hoisted_91_1, hoisted_92_1, hoisted_93_1, hoisted_94_1, hoisted_95_1, hoisted_96_1, hoisted_97_1, hoisted_98_1, hoisted_99_1, hoisted_100_1, hoisted_101_1, hoisted_102_1, hoisted_103_1, hoisted_104_1, hoisted_105_1, hoisted_106_1, hoisted_107_1, hoisted_108_1, hoisted_109_1, hoisted_110_1, hoisted_111_1, hoisted_112_1, hoisted_113_1, hoisted_114_1, hoisted_115_1, hoisted_116_1, hoisted_117_1, hoisted_118_1, hoisted_119_1, hoisted_120_1, hoisted_121_1, hoisted_122_1, hoisted_123_1, hoisted_124_1, hoisted_125_1, hoisted_126_1, hoisted_127_1, hoisted_128_1, hoisted_129_1, hoisted_130_1, hoisted_131_1, deduped_132_1, deduped_133_1, deduped_134_1, deduped_135_1, deduped_136_1, deduped_137_1, deduped_138_1, deduped_139_1, deduped_140_1, deduped_141_1, deduped_142_1, deduped_143_1, deduped_144_1, deduped_145_1, deduped_146_1, deduped_147_1, deduped_148_1, deduped_149_1, deduped_150_1, deduped_151_1, deduped_152_1, deduped_153_1, deduped_154_1, deduped_155_1, deduped_156_1, deduped_157_1, deduped_158_1, deduped_159_1, deduped_160_1, deduped_161_1, deduped_162_1, deduped_163_1, deduped_164_1, deduped_165_1, deduped_166_1, deduped_167_1, deduped_168_1, deduped_169_1, deduped_170_1, deduped_171_1, deduped_172_1, deduped_173_1, deduped_174_1, deduped_175_1, deduped_176_1, deduped_177_1, deduped_178_1, deduped_179_1, deduped_180_1, deduped_181_1, deduped_182_1, deduped_183_1, deduped_184_1, deduped_185_1, deduped_186_1, deduped_187_1, deduped_188_1, deduped_189_1, deduped_190_1, deduped_191_1, deduped_192_1;
    deduped_192_1 := DefiningPairOfQuiver( a_1 );
    deduped_191_1 := DefiningPairOfQuiver( b_1 );
    deduped_190_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_189_1 := deduped_192_1[2];
    deduped_188_1 := Length( SetOfObjects( cat_1 ) );
    deduped_187_1 := deduped_191_1[2];
    deduped_186_1 := deduped_191_1[1];
    deduped_185_1 := deduped_190_1[2];
    deduped_184_1 := deduped_190_1[1];
    deduped_183_1 := [ 1 .. deduped_188_1 ];
    deduped_182_1 := [ 1 .. deduped_184_1 ];
    deduped_181_1 := Length( deduped_189_1 );
    deduped_180_1 := OppositeOfSource( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_179_1 := Length( deduped_187_1 );
    deduped_178_1 := Length( deduped_185_1 );
    deduped_177_1 := [ 0 .. deduped_188_1 - 1 ];
    deduped_176_1 := [ 1 .. deduped_178_1 ];
    deduped_175_1 := SetOfObjects( deduped_180_1 );
    deduped_174_1 := UnderlyingQuiverAlgebra( deduped_180_1 );
    deduped_173_1 := SetOfGeneratingMorphisms( deduped_180_1 );
    deduped_172_1 := BasisPathsByVertexIndex( deduped_180_1 );
    deduped_171_1 := deduped_178_1 * 2;
    deduped_170_1 := [ 1 .. deduped_184_1 + deduped_178_1 ];
    deduped_165_1 := List( deduped_173_1, function ( logic_new_func_x_2 )
            return VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
        end );
    deduped_160_1 := deduped_165_1[1];
    hoisted_30_1 := deduped_160_1;
    hoisted_2_1 := List( deduped_172_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, Length );
        end );
    hoisted_31_1 := List( deduped_175_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_30_1];
        end );
    hoisted_9_1 := [ deduped_192_1[1], deduped_181_1 ];
    hoisted_1_1 := [ deduped_186_1, deduped_179_1 ];
    deduped_169_1 := List( deduped_183_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_31_1[logic_new_func_x_2] * hoisted_9_1[logic_new_func_x_2]);
        end );
    deduped_168_1 := List( deduped_173_1, function ( logic_new_func_x_2 )
            return QuiverVertexAsIdentityPath( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
        end );
    deduped_159_1 := deduped_165_1[2];
    hoisted_82_1 := deduped_159_1;
    hoisted_83_1 := List( deduped_175_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_82_1];
        end );
    deduped_167_1 := List( deduped_183_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_83_1[logic_new_func_x_2] * hoisted_9_1[logic_new_func_x_2]);
        end );
    deduped_166_1 := List( deduped_173_1, function ( logic_new_func_x_2 )
            return BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) );
        end );
    deduped_164_1 := List( deduped_173_1, function ( logic_new_func_x_2 )
            return QuiverVertexAsIdentityPath( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
        end );
    deduped_163_1 := List( deduped_173_1, function ( logic_new_func_x_2 )
            return VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
        end );
    deduped_162_1 := [ 0 .. deduped_171_1 - 1 ];
    deduped_161_1 := deduped_163_1[1];
    deduped_158_1 := deduped_163_1[2];
    deduped_157_1 := deduped_172_1[deduped_161_1];
    deduped_156_1 := UnderlyingVertex( CAP_JIT_INCOMPLETE_LOGIC( deduped_175_1[1] ) );
    deduped_155_1 := deduped_172_1[deduped_158_1];
    deduped_154_1 := [ 0 .. Product( deduped_169_1 ) - 1 ];
    deduped_153_1 := [ 0 .. Product( deduped_167_1 ) - 1 ];
    hoisted_44_1 := deduped_161_1;
    hoisted_45_1 := List( deduped_175_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_44_1];
        end );
    hoisted_11_1 := deduped_186_1;
    hoisted_10_1 := deduped_185_1;
    deduped_152_1 := Concatenation( List( deduped_182_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_45_1[logic_new_func_x_2] * hoisted_9_1[logic_new_func_x_2]);
          end ), List( deduped_176_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_10_1[logic_new_func_x_2][1];
              return hoisted_11_1 ^ (hoisted_45_1[deduped_1_2] * hoisted_9_1[deduped_1_2]);
          end ) );
    deduped_151_1 := VertexIndex( deduped_156_1 );
    hoisted_96_1 := deduped_158_1;
    hoisted_97_1 := List( deduped_175_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_96_1];
        end );
    deduped_150_1 := Concatenation( List( deduped_182_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_97_1[logic_new_func_x_2] * hoisted_9_1[logic_new_func_x_2]);
          end ), List( deduped_176_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_10_1[logic_new_func_x_2][1];
              return hoisted_11_1 ^ (hoisted_97_1[deduped_1_2] * hoisted_9_1[deduped_1_2]);
          end ) );
    deduped_149_1 := Concatenation( List( deduped_182_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_83_1[logic_new_func_x_2] * hoisted_9_1[logic_new_func_x_2]);
          end ), List( deduped_176_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_10_1[logic_new_func_x_2][1];
              return hoisted_11_1 ^ (hoisted_83_1[deduped_1_2] * hoisted_9_1[deduped_1_2]);
          end ) );
    deduped_148_1 := Concatenation( List( deduped_182_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_31_1[logic_new_func_x_2] * hoisted_9_1[logic_new_func_x_2]);
          end ), List( deduped_176_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_10_1[logic_new_func_x_2][1];
              return hoisted_11_1 ^ (hoisted_31_1[deduped_1_2] * hoisted_9_1[deduped_1_2]);
          end ) );
    hoisted_7_1 := SafePosition( deduped_172_1[deduped_151_1][deduped_151_1], BasisPathOfPathAlgebraBasisElement( PathAsAlgebraElement( deduped_174_1, QuiverVertexAsIdentityPath( deduped_156_1 ) ) ) );
    hoisted_6_1 := deduped_172_1;
    hoisted_5_1 := HomStructureOnBasisPaths( deduped_180_1 );
    hoisted_4_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    hoisted_3_1 := deduped_151_1;
    deduped_137_1 := NTuple( 2, List( deduped_175_1, function ( o_2 )
              return CreateCapCategoryObjectWithAttributes( hoisted_4_1, Length, hoisted_2_1[VertexIndex( UnderlyingVertex( o_2 ) )][hoisted_3_1] );
          end ), List( deduped_173_1, function ( m_2 )
              local hoisted_1_2, deduped_2_2, deduped_3_2, deduped_4_2;
              deduped_4_2 := VertexIndex( UnderlyingVertex( Source( m_2 ) ) );
              deduped_3_2 := VertexIndex( UnderlyingVertex( Range( m_2 ) ) );
              deduped_2_2 := hoisted_2_1[deduped_3_2][hoisted_3_1];
              hoisted_1_2 := hoisted_5_1[deduped_3_2][hoisted_3_1][deduped_4_2][hoisted_3_1][SafePosition( hoisted_6_1[deduped_4_2][deduped_3_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( m_2 ) ) )][hoisted_7_1];
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, CreateCapCategoryObjectWithAttributes( hoisted_4_1, Length, deduped_2_2 ), CreateCapCategoryObjectWithAttributes( hoisted_4_1, Length, hoisted_2_1[deduped_4_2][hoisted_3_1] ), AsList, List( [ 1 .. deduped_2_2 ], function ( phi_index_3 )
                        return hoisted_1_2[phi_index_3];
                    end ) );
          end ) );
    hoisted_8_1 := List( deduped_137_1[1], Length );
    deduped_147_1 := Concatenation( List( deduped_182_1, function ( logic_new_func_x_2 )
              return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_8_1[logic_new_func_x_2] * hoisted_9_1[logic_new_func_x_2]);
          end ), List( deduped_176_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_10_1[logic_new_func_x_2][1];
              return hoisted_11_1 ^ (hoisted_8_1[deduped_1_2] * hoisted_9_1[deduped_1_2]);
          end ) );
    deduped_146_1 := [ 0 .. Product( deduped_152_1 ) - 1 ];
    deduped_145_1 := [ 0 .. Product( deduped_150_1 ) - 1 ];
    deduped_144_1 := [ 0 .. Product( deduped_149_1 ) - 1 ];
    deduped_143_1 := [ 0 .. Product( deduped_148_1 ) - 1 ];
    deduped_142_1 := [ 0 .. Product( deduped_147_1 ) - 1 ];
    hoisted_55_1 := List( deduped_173_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_44_1];
        end );
    hoisted_54_1 := List( deduped_173_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_44_1];
        end );
    hoisted_52_1 := SafePosition( deduped_157_1[deduped_161_1], BasisPathOfPathAlgebraBasisElement( PathAsAlgebraElement( deduped_174_1, deduped_164_1[1] ) ) );
    hoisted_53_1 := List( deduped_173_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_44_1][deduped_3_2][hoisted_44_1][SafePosition( hoisted_6_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_52_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_44_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_47_1 := deduped_146_1;
    hoisted_46_1 := deduped_152_1;
    hoisted_48_1 := List( deduped_170_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_46_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_46_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_47_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_25_1 := deduped_181_1;
    hoisted_24_1 := [ List( deduped_189_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_189_1, function ( a_2 )
                return a_2[2];
            end ) ];
    hoisted_21_1 := [ List( deduped_187_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_187_1, function ( a_2 )
                return a_2[2];
            end ) ];
    hoisted_20_1 := deduped_179_1;
    hoisted_56_1 := Concatenation( List( deduped_176_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, hoisted_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2;
              deduped_22_2 := hoisted_10_1[logic_new_func_x_2];
              deduped_21_2 := deduped_22_2[2];
              deduped_20_2 := deduped_22_2[1];
              deduped_19_2 := hoisted_45_1[deduped_21_2] * hoisted_9_1[deduped_21_2];
              deduped_18_2 := hoisted_45_1[deduped_20_2] * hoisted_9_1[deduped_20_2];
              deduped_17_2 := [ 0 .. deduped_18_2 - 1 ];
              hoisted_13_2 := hoisted_55_1[logic_new_func_x_2];
              hoisted_11_2 := hoisted_24_1[logic_new_func_x_2];
              hoisted_6_2 := hoisted_54_1[logic_new_func_x_2];
              hoisted_10_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_6_2 ), hoisted_25_1 );
                  end );
              hoisted_12_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_11_2[1 + hoisted_10_2[(1 + i_3)]];
                  end );
              hoisted_8_2 := hoisted_53_1[logic_new_func_x_2];
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
              hoisted_16_2 := List( [ 0 .. hoisted_11_1 ^ deduped_19_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_5_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_11_1 ^ j_4 ), hoisted_11_1 );
                          end );
                      hoisted_2_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_14_2[(1 + i_4)]];
                          end );
                      hoisted_3_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_2_3[1 + i_4];
                          end );
                      return Sum( List( hoisted_1_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_11_1 ^ k_4;
                            end ) );
                  end );
              hoisted_15_2 := hoisted_48_1[deduped_21_2];
              hoisted_2_2 := hoisted_21_1[logic_new_func_x_2];
              hoisted_4_2 := List( [ 0 .. hoisted_20_1 ^ deduped_18_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_20_1 ^ j_4 ), hoisted_20_1 );
                          end );
                      hoisted_2_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_1_3[1 + i_4];
                          end );
                      hoisted_3_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_2_2[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                      return Sum( List( hoisted_1_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_11_1 ^ k_4;
                            end ) );
                  end );
              hoisted_3_2 := hoisted_48_1[deduped_20_2];
              return [ List( hoisted_47_1, function ( i_3 )
                          return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                      end ), List( hoisted_47_1, function ( i_3 )
                          return hoisted_16_2[1 + hoisted_15_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_14_1 := deduped_184_1;
    hoisted_50_1 := Concatenation( List( deduped_176_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_46_1[hoisted_14_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_51_1 := List( deduped_162_1, function ( j_2 )
            return Product( hoisted_50_1{[ 1 .. j_2 ]} );
        end );
    hoisted_49_1 := Concatenation( List( deduped_176_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_48_1[hoisted_14_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_19_1 := [ 1 .. deduped_171_1 ];
    hoisted_57_1 := [ List( deduped_146_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_19_1, function ( j_3 )
                        return hoisted_49_1[j_3][hoisted_1_2] * hoisted_51_1[j_3];
                    end );
            end ), List( deduped_146_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_19_1, function ( j_3 )
                        return hoisted_56_1[j_3][hoisted_1_2] * hoisted_51_1[j_3];
                    end );
            end ) ];
    hoisted_29_1 := [ 1 ];
    deduped_141_1 := Filtered( deduped_146_1, function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + x_2;
            return ForAll( hoisted_29_1, function ( j_3 )
                    return hoisted_57_1[j_3][hoisted_1_2] = hoisted_57_1[j_3 + 1][hoisted_1_2];
                end );
        end );
    hoisted_107_1 := List( deduped_173_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_96_1];
        end );
    hoisted_106_1 := List( deduped_173_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_96_1];
        end );
    hoisted_104_1 := SafePosition( deduped_155_1[deduped_158_1], BasisPathOfPathAlgebraBasisElement( PathAsAlgebraElement( deduped_174_1, deduped_164_1[2] ) ) );
    hoisted_105_1 := List( deduped_173_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_96_1][deduped_3_2][hoisted_96_1][SafePosition( hoisted_6_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_104_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_96_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_99_1 := deduped_145_1;
    hoisted_98_1 := deduped_150_1;
    hoisted_100_1 := List( deduped_170_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_98_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_98_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_99_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_108_1 := Concatenation( List( deduped_176_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, hoisted_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2;
              deduped_22_2 := hoisted_10_1[logic_new_func_x_2];
              deduped_21_2 := deduped_22_2[2];
              deduped_20_2 := deduped_22_2[1];
              deduped_19_2 := hoisted_97_1[deduped_21_2] * hoisted_9_1[deduped_21_2];
              deduped_18_2 := hoisted_97_1[deduped_20_2] * hoisted_9_1[deduped_20_2];
              deduped_17_2 := [ 0 .. deduped_18_2 - 1 ];
              hoisted_13_2 := hoisted_107_1[logic_new_func_x_2];
              hoisted_11_2 := hoisted_24_1[logic_new_func_x_2];
              hoisted_6_2 := hoisted_106_1[logic_new_func_x_2];
              hoisted_10_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_6_2 ), hoisted_25_1 );
                  end );
              hoisted_12_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_11_2[1 + hoisted_10_2[(1 + i_3)]];
                  end );
              hoisted_8_2 := hoisted_105_1[logic_new_func_x_2];
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
              hoisted_16_2 := List( [ 0 .. hoisted_11_1 ^ deduped_19_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_5_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_11_1 ^ j_4 ), hoisted_11_1 );
                          end );
                      hoisted_2_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_14_2[(1 + i_4)]];
                          end );
                      hoisted_3_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_2_3[1 + i_4];
                          end );
                      return Sum( List( hoisted_1_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_11_1 ^ k_4;
                            end ) );
                  end );
              hoisted_15_2 := hoisted_100_1[deduped_21_2];
              hoisted_2_2 := hoisted_21_1[logic_new_func_x_2];
              hoisted_4_2 := List( [ 0 .. hoisted_20_1 ^ deduped_18_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_20_1 ^ j_4 ), hoisted_20_1 );
                          end );
                      hoisted_2_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_1_3[1 + i_4];
                          end );
                      hoisted_3_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_2_2[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                      return Sum( List( hoisted_1_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_11_1 ^ k_4;
                            end ) );
                  end );
              hoisted_3_2 := hoisted_100_1[deduped_20_2];
              return [ List( hoisted_99_1, function ( i_3 )
                          return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                      end ), List( hoisted_99_1, function ( i_3 )
                          return hoisted_16_2[1 + hoisted_15_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_102_1 := Concatenation( List( deduped_176_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_98_1[hoisted_14_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_103_1 := List( deduped_162_1, function ( j_2 )
            return Product( hoisted_102_1{[ 1 .. j_2 ]} );
        end );
    hoisted_101_1 := Concatenation( List( deduped_176_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_100_1[hoisted_14_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_109_1 := [ List( deduped_145_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_19_1, function ( j_3 )
                        return hoisted_101_1[j_3][hoisted_1_2] * hoisted_103_1[j_3];
                    end );
            end ), List( deduped_145_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_19_1, function ( j_3 )
                        return hoisted_108_1[j_3][hoisted_1_2] * hoisted_103_1[j_3];
                    end );
            end ) ];
    deduped_140_1 := Filtered( deduped_145_1, function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + x_2;
            return ForAll( hoisted_29_1, function ( j_3 )
                    return hoisted_109_1[j_3][hoisted_1_2] = hoisted_109_1[j_3 + 1][hoisted_1_2];
                end );
        end );
    hoisted_93_1 := List( deduped_173_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_82_1];
        end );
    hoisted_92_1 := List( deduped_173_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_82_1];
        end );
    hoisted_90_1 := SafePosition( deduped_172_1[deduped_159_1][deduped_159_1], BasisPathOfPathAlgebraBasisElement( PathAsAlgebraElement( deduped_174_1, deduped_168_1[2] ) ) );
    hoisted_91_1 := List( deduped_173_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_82_1][deduped_3_2][hoisted_82_1][SafePosition( hoisted_6_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_90_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_82_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_85_1 := deduped_144_1;
    hoisted_84_1 := deduped_149_1;
    hoisted_86_1 := List( deduped_170_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_84_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_84_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_85_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_94_1 := Concatenation( List( deduped_176_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, hoisted_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2;
              deduped_22_2 := hoisted_10_1[logic_new_func_x_2];
              deduped_21_2 := deduped_22_2[2];
              deduped_20_2 := deduped_22_2[1];
              deduped_19_2 := hoisted_83_1[deduped_21_2] * hoisted_9_1[deduped_21_2];
              deduped_18_2 := hoisted_83_1[deduped_20_2] * hoisted_9_1[deduped_20_2];
              deduped_17_2 := [ 0 .. deduped_18_2 - 1 ];
              hoisted_13_2 := hoisted_93_1[logic_new_func_x_2];
              hoisted_11_2 := hoisted_24_1[logic_new_func_x_2];
              hoisted_6_2 := hoisted_92_1[logic_new_func_x_2];
              hoisted_10_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_6_2 ), hoisted_25_1 );
                  end );
              hoisted_12_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_11_2[1 + hoisted_10_2[(1 + i_3)]];
                  end );
              hoisted_8_2 := hoisted_91_1[logic_new_func_x_2];
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
              hoisted_16_2 := List( [ 0 .. hoisted_11_1 ^ deduped_19_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_5_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_11_1 ^ j_4 ), hoisted_11_1 );
                          end );
                      hoisted_2_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_14_2[(1 + i_4)]];
                          end );
                      hoisted_3_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_2_3[1 + i_4];
                          end );
                      return Sum( List( hoisted_1_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_11_1 ^ k_4;
                            end ) );
                  end );
              hoisted_15_2 := hoisted_86_1[deduped_21_2];
              hoisted_2_2 := hoisted_21_1[logic_new_func_x_2];
              hoisted_4_2 := List( [ 0 .. hoisted_20_1 ^ deduped_18_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_20_1 ^ j_4 ), hoisted_20_1 );
                          end );
                      hoisted_2_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_1_3[1 + i_4];
                          end );
                      hoisted_3_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_2_2[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                      return Sum( List( hoisted_1_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_11_1 ^ k_4;
                            end ) );
                  end );
              hoisted_3_2 := hoisted_86_1[deduped_20_2];
              return [ List( hoisted_85_1, function ( i_3 )
                          return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                      end ), List( hoisted_85_1, function ( i_3 )
                          return hoisted_16_2[1 + hoisted_15_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_88_1 := Concatenation( List( deduped_176_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_84_1[hoisted_14_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_89_1 := List( deduped_162_1, function ( j_2 )
            return Product( hoisted_88_1{[ 1 .. j_2 ]} );
        end );
    hoisted_87_1 := Concatenation( List( deduped_176_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_86_1[hoisted_14_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_95_1 := [ List( deduped_144_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_19_1, function ( j_3 )
                        return hoisted_87_1[j_3][hoisted_1_2] * hoisted_89_1[j_3];
                    end );
            end ), List( deduped_144_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_19_1, function ( j_3 )
                        return hoisted_94_1[j_3][hoisted_1_2] * hoisted_89_1[j_3];
                    end );
            end ) ];
    deduped_139_1 := Filtered( deduped_144_1, function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + x_2;
            return ForAll( hoisted_29_1, function ( j_3 )
                    return hoisted_95_1[j_3][hoisted_1_2] = hoisted_95_1[j_3 + 1][hoisted_1_2];
                end );
        end );
    hoisted_41_1 := List( deduped_173_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_30_1];
        end );
    hoisted_40_1 := List( deduped_173_1, function ( logic_new_func_x_2 )
            return hoisted_2_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_30_1];
        end );
    hoisted_38_1 := SafePosition( deduped_172_1[deduped_160_1][deduped_160_1], BasisPathOfPathAlgebraBasisElement( PathAsAlgebraElement( deduped_174_1, deduped_168_1[1] ) ) );
    hoisted_39_1 := List( deduped_173_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_30_1][deduped_3_2][hoisted_30_1][SafePosition( hoisted_6_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_38_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_30_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_33_1 := deduped_143_1;
    hoisted_32_1 := deduped_148_1;
    hoisted_34_1 := List( deduped_170_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_32_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_32_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_33_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_42_1 := Concatenation( List( deduped_176_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, hoisted_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2;
              deduped_22_2 := hoisted_10_1[logic_new_func_x_2];
              deduped_21_2 := deduped_22_2[2];
              deduped_20_2 := deduped_22_2[1];
              deduped_19_2 := hoisted_31_1[deduped_21_2] * hoisted_9_1[deduped_21_2];
              deduped_18_2 := hoisted_31_1[deduped_20_2] * hoisted_9_1[deduped_20_2];
              deduped_17_2 := [ 0 .. deduped_18_2 - 1 ];
              hoisted_13_2 := hoisted_41_1[logic_new_func_x_2];
              hoisted_11_2 := hoisted_24_1[logic_new_func_x_2];
              hoisted_6_2 := hoisted_40_1[logic_new_func_x_2];
              hoisted_10_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_6_2 ), hoisted_25_1 );
                  end );
              hoisted_12_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_11_2[1 + hoisted_10_2[(1 + i_3)]];
                  end );
              hoisted_8_2 := hoisted_39_1[logic_new_func_x_2];
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
              hoisted_16_2 := List( [ 0 .. hoisted_11_1 ^ deduped_19_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_5_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_11_1 ^ j_4 ), hoisted_11_1 );
                          end );
                      hoisted_2_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_14_2[(1 + i_4)]];
                          end );
                      hoisted_3_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_2_3[1 + i_4];
                          end );
                      return Sum( List( hoisted_1_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_11_1 ^ k_4;
                            end ) );
                  end );
              hoisted_15_2 := hoisted_34_1[deduped_21_2];
              hoisted_2_2 := hoisted_21_1[logic_new_func_x_2];
              hoisted_4_2 := List( [ 0 .. hoisted_20_1 ^ deduped_18_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_20_1 ^ j_4 ), hoisted_20_1 );
                          end );
                      hoisted_2_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_1_3[1 + i_4];
                          end );
                      hoisted_3_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_2_2[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                      return Sum( List( hoisted_1_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_11_1 ^ k_4;
                            end ) );
                  end );
              hoisted_3_2 := hoisted_34_1[deduped_20_2];
              return [ List( hoisted_33_1, function ( i_3 )
                          return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                      end ), List( hoisted_33_1, function ( i_3 )
                          return hoisted_16_2[1 + hoisted_15_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_36_1 := Concatenation( List( deduped_176_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_32_1[hoisted_14_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_37_1 := List( deduped_162_1, function ( j_2 )
            return Product( hoisted_36_1{[ 1 .. j_2 ]} );
        end );
    hoisted_35_1 := Concatenation( List( deduped_176_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_34_1[hoisted_14_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_43_1 := [ List( deduped_143_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_19_1, function ( j_3 )
                        return hoisted_35_1[j_3][hoisted_1_2] * hoisted_37_1[j_3];
                    end );
            end ), List( deduped_143_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_19_1, function ( j_3 )
                        return hoisted_42_1[j_3][hoisted_1_2] * hoisted_37_1[j_3];
                    end );
            end ) ];
    deduped_138_1 := Filtered( deduped_143_1, function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + x_2;
            return ForAll( hoisted_29_1, function ( j_3 )
                    return hoisted_43_1[j_3][hoisted_1_2] = hoisted_43_1[j_3 + 1][hoisted_1_2];
                end );
        end );
    deduped_136_1 := deduped_137_1[2];
    deduped_135_1 := [ 0 .. Length( deduped_141_1 ) - 1 ];
    deduped_134_1 := [ 0 .. Length( deduped_140_1 ) - 1 ];
    deduped_133_1 := [ 0 .. Length( deduped_139_1 ) - 1 ];
    deduped_132_1 := [ 0 .. Length( deduped_138_1 ) - 1 ];
    hoisted_113_1 := List( deduped_183_1, function ( logic_new_func_x_2 )
            return hoisted_98_1[logic_new_func_x_2];
        end );
    hoisted_114_1 := List( deduped_177_1, function ( j_2 )
            return Product( hoisted_113_1{[ 1 .. j_2 ]} );
        end );
    hoisted_111_1 := deduped_134_1;
    hoisted_110_1 := deduped_140_1;
    hoisted_112_1 := List( deduped_183_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_2_2 := hoisted_98_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_98_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_99_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_111_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_110_1[(1 + i_3)]];
                end );
        end );
    hoisted_63_1 := deduped_183_1;
    hoisted_131_1 := List( deduped_134_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_63_1, function ( j_3 )
                    return hoisted_112_1[j_3][hoisted_1_2] * hoisted_114_1[j_3];
                end );
        end );
    hoisted_121_1 := List( deduped_183_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_97_1[logic_new_func_x_2] * hoisted_9_1[logic_new_func_x_2]);
        end );
    hoisted_122_1 := List( deduped_177_1, function ( j_2 )
            return Product( hoisted_121_1{[ 1 .. j_2 ]} );
        end );
    hoisted_119_1 := deduped_153_1;
    hoisted_118_1 := deduped_167_1;
    hoisted_115_1 := SafePosition( deduped_155_1[deduped_159_1], deduped_166_1[2] );
    hoisted_64_1 := deduped_174_1;
    hoisted_116_1 := List( deduped_175_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := UnderlyingVertex( logic_new_func_x_2 );
            deduped_2_2 := VertexIndex( deduped_3_2 );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_96_1][deduped_2_2][hoisted_82_1][SafePosition( hoisted_6_1[deduped_2_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( PathAsAlgebraElement( hoisted_64_1, QuiverVertexAsIdentityPath( deduped_3_2 ) ) ) )][hoisted_115_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_96_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_117_1 := List( deduped_183_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, deduped_13_2, deduped_14_2, deduped_15_2, deduped_16_2, deduped_17_2, deduped_18_2;
            deduped_18_2 := hoisted_97_1[logic_new_func_x_2];
            deduped_17_2 := hoisted_9_1[logic_new_func_x_2];
            deduped_16_2 := hoisted_83_1[logic_new_func_x_2];
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
            hoisted_5_2 := hoisted_116_1[logic_new_func_x_2];
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
    hoisted_120_1 := List( deduped_183_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2;
            hoisted_4_2 := hoisted_117_1[logic_new_func_x_2];
            hoisted_2_2 := hoisted_118_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_118_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_119_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_119_1, function ( i_3 )
                    return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                end );
        end );
    hoisted_129_1 := List( deduped_153_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_63_1, function ( j_3 )
                    return hoisted_120_1[j_3][hoisted_1_2] * hoisted_122_1[j_3];
                end );
        end );
    hoisted_126_1 := List( deduped_183_1, function ( logic_new_func_x_2 )
            return hoisted_84_1[logic_new_func_x_2];
        end );
    hoisted_127_1 := List( deduped_177_1, function ( j_2 )
            return Product( hoisted_126_1{[ 1 .. j_2 ]} );
        end );
    hoisted_124_1 := deduped_133_1;
    hoisted_123_1 := deduped_139_1;
    hoisted_125_1 := List( deduped_183_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_2_2 := hoisted_84_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_84_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_85_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_124_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_123_1[(1 + i_3)]];
                end );
        end );
    hoisted_128_1 := List( deduped_133_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_63_1, function ( j_3 )
                    return hoisted_125_1[j_3][hoisted_1_2] * hoisted_127_1[j_3];
                end );
        end );
    hoisted_130_1 := List( deduped_133_1, function ( i_2 )
            return hoisted_129_1[1 + hoisted_128_1[(1 + i_2)]];
        end );
    hoisted_61_1 := List( deduped_183_1, function ( logic_new_func_x_2 )
            return hoisted_46_1[logic_new_func_x_2];
        end );
    hoisted_62_1 := List( deduped_177_1, function ( j_2 )
            return Product( hoisted_61_1{[ 1 .. j_2 ]} );
        end );
    hoisted_59_1 := deduped_135_1;
    hoisted_58_1 := deduped_141_1;
    hoisted_60_1 := List( deduped_183_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_2_2 := hoisted_46_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_46_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_47_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_59_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_58_1[(1 + i_3)]];
                end );
        end );
    hoisted_81_1 := List( deduped_135_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_63_1, function ( j_3 )
                    return hoisted_60_1[j_3][hoisted_1_2] * hoisted_62_1[j_3];
                end );
        end );
    hoisted_71_1 := List( deduped_183_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[logic_new_func_x_2] ^ (hoisted_45_1[logic_new_func_x_2] * hoisted_9_1[logic_new_func_x_2]);
        end );
    hoisted_72_1 := List( deduped_177_1, function ( j_2 )
            return Product( hoisted_71_1{[ 1 .. j_2 ]} );
        end );
    hoisted_69_1 := deduped_154_1;
    hoisted_68_1 := deduped_169_1;
    hoisted_65_1 := SafePosition( deduped_157_1[deduped_160_1], deduped_166_1[1] );
    hoisted_66_1 := List( deduped_175_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := UnderlyingVertex( logic_new_func_x_2 );
            deduped_2_2 := VertexIndex( deduped_3_2 );
            hoisted_1_2 := hoisted_5_1[deduped_2_2][hoisted_44_1][deduped_2_2][hoisted_30_1][SafePosition( hoisted_6_1[deduped_2_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( PathAsAlgebraElement( hoisted_64_1, QuiverVertexAsIdentityPath( deduped_3_2 ) ) ) )][hoisted_65_1];
            return List( [ 1 .. hoisted_2_1[deduped_2_2][hoisted_44_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_67_1 := List( deduped_183_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, deduped_13_2, deduped_14_2, deduped_15_2, deduped_16_2, deduped_17_2, deduped_18_2;
            deduped_18_2 := hoisted_45_1[logic_new_func_x_2];
            deduped_17_2 := hoisted_9_1[logic_new_func_x_2];
            deduped_16_2 := hoisted_31_1[logic_new_func_x_2];
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
            hoisted_5_2 := hoisted_66_1[logic_new_func_x_2];
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
    hoisted_70_1 := List( deduped_183_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2;
            hoisted_4_2 := hoisted_67_1[logic_new_func_x_2];
            hoisted_2_2 := hoisted_68_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_68_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_69_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_69_1, function ( i_3 )
                    return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                end );
        end );
    hoisted_79_1 := List( deduped_154_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_63_1, function ( j_3 )
                    return hoisted_70_1[j_3][hoisted_1_2] * hoisted_72_1[j_3];
                end );
        end );
    hoisted_76_1 := List( deduped_183_1, function ( logic_new_func_x_2 )
            return hoisted_32_1[logic_new_func_x_2];
        end );
    hoisted_77_1 := List( deduped_177_1, function ( j_2 )
            return Product( hoisted_76_1{[ 1 .. j_2 ]} );
        end );
    hoisted_74_1 := deduped_132_1;
    hoisted_73_1 := deduped_138_1;
    hoisted_75_1 := List( deduped_183_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_2_2 := hoisted_32_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_32_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            hoisted_3_2 := List( hoisted_33_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_74_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_73_1[(1 + i_3)]];
                end );
        end );
    hoisted_78_1 := List( deduped_132_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_63_1, function ( j_3 )
                    return hoisted_75_1[j_3][hoisted_1_2] * hoisted_77_1[j_3];
                end );
        end );
    hoisted_80_1 := List( deduped_132_1, function ( i_2 )
            return hoisted_79_1[1 + hoisted_78_1[(1 + i_2)]];
        end );
    hoisted_26_1 := List( deduped_136_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    hoisted_23_1 := List( deduped_136_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_22_1 := List( deduped_136_1, AsList );
    hoisted_13_1 := deduped_142_1;
    hoisted_12_1 := deduped_147_1;
    hoisted_15_1 := List( deduped_170_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := hoisted_12_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_12_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_13_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_27_1 := Concatenation( List( deduped_176_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, hoisted_15_2, hoisted_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2, deduped_21_2, deduped_22_2;
              deduped_22_2 := hoisted_10_1[logic_new_func_x_2];
              deduped_21_2 := deduped_22_2[2];
              deduped_20_2 := deduped_22_2[1];
              deduped_19_2 := hoisted_8_1[deduped_21_2] * hoisted_9_1[deduped_21_2];
              deduped_18_2 := hoisted_8_1[deduped_20_2] * hoisted_9_1[deduped_20_2];
              deduped_17_2 := [ 0 .. deduped_18_2 - 1 ];
              hoisted_13_2 := hoisted_26_1[logic_new_func_x_2];
              hoisted_11_2 := hoisted_24_1[logic_new_func_x_2];
              hoisted_6_2 := hoisted_23_1[logic_new_func_x_2];
              hoisted_10_2 := List( deduped_17_2, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_6_2 ), hoisted_25_1 );
                  end );
              hoisted_12_2 := List( deduped_17_2, function ( i_3 )
                      return hoisted_11_2[1 + hoisted_10_2[(1 + i_3)]];
                  end );
              hoisted_8_2 := hoisted_22_1[logic_new_func_x_2];
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
              hoisted_16_2 := List( [ 0 .. hoisted_11_1 ^ deduped_19_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_5_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_11_1 ^ j_4 ), hoisted_11_1 );
                          end );
                      hoisted_2_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_1_3[1 + hoisted_14_2[(1 + i_4)]];
                          end );
                      hoisted_3_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_2_3[1 + i_4];
                          end );
                      return Sum( List( hoisted_1_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_11_1 ^ k_4;
                            end ) );
                  end );
              hoisted_15_2 := hoisted_15_1[deduped_21_2];
              hoisted_2_2 := hoisted_21_1[logic_new_func_x_2];
              hoisted_4_2 := List( [ 0 .. hoisted_20_1 ^ deduped_18_2 - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, hoisted_3_3;
                      hoisted_1_3 := List( hoisted_1_2, function ( j_4 )
                              return REM_INT( QUO_INT( i_3, hoisted_20_1 ^ j_4 ), hoisted_20_1 );
                          end );
                      hoisted_2_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_1_3[1 + i_4];
                          end );
                      hoisted_3_3 := List( hoisted_1_2, function ( i_4 )
                              return hoisted_2_2[1 + hoisted_2_3[(1 + i_4)]];
                          end );
                      return Sum( List( hoisted_1_2, function ( k_4 )
                                return hoisted_3_3[(1 + k_4)] * hoisted_11_1 ^ k_4;
                            end ) );
                  end );
              hoisted_3_2 := hoisted_15_1[deduped_20_2];
              return [ List( hoisted_13_1, function ( i_3 )
                          return hoisted_4_2[1 + hoisted_3_2[(1 + i_3)]];
                      end ), List( hoisted_13_1, function ( i_3 )
                          return hoisted_16_2[1 + hoisted_15_2[(1 + i_3)]];
                      end ) ];
          end ) );
    hoisted_17_1 := Concatenation( List( deduped_176_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_12_1[hoisted_14_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_18_1 := List( deduped_162_1, function ( j_2 )
            return Product( hoisted_17_1{[ 1 .. j_2 ]} );
        end );
    hoisted_16_1 := Concatenation( List( deduped_176_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_15_1[hoisted_14_1 + logic_new_func_x_2];
              return [ deduped_1_2, deduped_1_2 ];
          end ) );
    hoisted_28_1 := [ List( deduped_142_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_19_1, function ( j_3 )
                        return hoisted_16_1[j_3][hoisted_1_2] * hoisted_18_1[j_3];
                    end );
            end ), List( deduped_142_1, function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + i_2;
                return Sum( hoisted_19_1, function ( j_3 )
                        return hoisted_27_1[j_3][hoisted_1_2] * hoisted_18_1[j_3];
                    end );
            end ) ];
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningPairOfQuiver, NTuple( 2, Length( Filtered( deduped_142_1, function ( x_2 )
                  local hoisted_1_2;
                  hoisted_1_2 := 1 + x_2;
                  return ForAll( hoisted_29_1, function ( j_3 )
                          return hoisted_28_1[j_3][hoisted_1_2] = hoisted_28_1[j_3 + 1][hoisted_1_2];
                      end );
              end ) ), ListN( List( deduped_132_1, function ( x_2 )
                  return -1 + SafePosition( hoisted_81_1, hoisted_80_1[(1 + x_2)] );
              end ), List( deduped_133_1, function ( x_2 )
                  return -1 + SafePosition( hoisted_131_1, hoisted_130_1[(1 + x_2)] );
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
