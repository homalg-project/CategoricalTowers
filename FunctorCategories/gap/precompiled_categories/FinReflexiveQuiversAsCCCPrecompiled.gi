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
    local deduped_1_1, deduped_2_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, hoisted_20_1, hoisted_23_1, hoisted_24_1, deduped_25_1, hoisted_26_1, deduped_27_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, deduped_33_1, deduped_35_1, hoisted_36_1, deduped_37_1, hoisted_38_1, deduped_39_1, hoisted_40_1, hoisted_43_1, hoisted_44_1, deduped_45_1, hoisted_46_1, deduped_47_1, hoisted_49_1, hoisted_50_1, hoisted_51_1, deduped_52_1, hoisted_53_1, hoisted_54_1, deduped_55_1, hoisted_57_1, deduped_58_1, hoisted_59_1, deduped_60_1, hoisted_62_1, hoisted_63_1, hoisted_65_1, hoisted_67_1, hoisted_68_1, deduped_69_1, deduped_71_1, deduped_72_1, deduped_73_1, deduped_74_1, deduped_75_1, hoisted_77_1, hoisted_78_1, deduped_79_1, deduped_80_1, deduped_81_1, hoisted_83_1, hoisted_84_1, deduped_85_1, deduped_86_1, deduped_87_1, deduped_88_1, deduped_89_1, deduped_90_1, deduped_91_1, deduped_92_1, deduped_93_1, deduped_94_1, deduped_95_1, deduped_96_1, deduped_97_1, deduped_98_1, deduped_99_1, deduped_100_1, deduped_101_1, deduped_102_1, deduped_103_1, deduped_104_1, deduped_105_1, deduped_106_1, deduped_107_1, deduped_108_1, deduped_109_1, deduped_110_1, deduped_111_1, deduped_112_1, deduped_113_1, deduped_114_1, deduped_115_1, deduped_116_1, deduped_117_1, deduped_118_1, deduped_119_1, deduped_120_1, deduped_121_1, deduped_122_1, deduped_123_1, deduped_124_1, deduped_125_1, deduped_126_1, deduped_127_1, deduped_128_1, deduped_129_1, deduped_130_1, deduped_131_1, deduped_132_1, deduped_133_1, deduped_134_1, deduped_135_1, deduped_136_1, deduped_137_1, deduped_138_1, deduped_139_1, deduped_140_1, deduped_141_1, deduped_142_1, deduped_143_1, deduped_144_1, deduped_145_1, deduped_146_1, deduped_147_1;
    deduped_147_1 := [ 6 ];
    deduped_146_1 := [ 5 ];
    deduped_145_1 := [ 4 ];
    deduped_144_1 := [ 3 ];
    deduped_143_1 := [ 2 ];
    deduped_142_1 := [ 1 ];
    deduped_141_1 := [ 0 ];
    deduped_140_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( b_1 );
    deduped_139_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_138_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( a_1 );
    deduped_137_1 := deduped_138_1[4];
    deduped_136_1 := deduped_140_1[4];
    deduped_135_1 := CreateCapCategoryObjectWithAttributes( deduped_139_1, Length, 7 );
    deduped_134_1 := deduped_140_1[2];
    deduped_133_1 := deduped_140_1[1];
    deduped_132_1 := deduped_138_1[2];
    deduped_131_1 := CreateCapCategoryObjectWithAttributes( deduped_139_1, Length, 2 );
    deduped_130_1 := CreateCapCategoryObjectWithAttributes( deduped_139_1, Length, 1 );
    deduped_129_1 := deduped_138_1[1];
    deduped_128_1 := deduped_129_1 + deduped_132_1;
    deduped_127_1 := CreateCapCategoryObjectWithAttributes( deduped_139_1, Length, deduped_132_1 );
    deduped_126_1 := CreateCapCategoryObjectWithAttributes( deduped_139_1, Length, deduped_129_1 );
    deduped_125_1 := 3 * deduped_132_1;
    deduped_124_1 := 2 * deduped_129_1;
    deduped_123_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_122_1 := [ 0 .. deduped_132_1 - 1 ];
    deduped_121_1 := [ 0 .. deduped_129_1 - 1 ];
    deduped_120_1 := CreateCapCategoryObjectWithAttributes( deduped_139_1, Length, deduped_125_1 );
    deduped_119_1 := CreateCapCategoryObjectWithAttributes( deduped_139_1, Length, deduped_124_1 );
    deduped_118_1 := deduped_124_1 + deduped_125_1;
    deduped_117_1 := CreateCapCategoryObjectWithAttributes( deduped_123_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_139_1, deduped_130_1, deduped_131_1, AsList, deduped_142_1 ) );
    deduped_116_1 := CreateCapCategoryObjectWithAttributes( deduped_123_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_139_1, deduped_130_1, deduped_131_1, AsList, deduped_141_1 ) );
    deduped_115_1 := [ 0 .. deduped_128_1 - 1 ];
    deduped_114_1 := [ 0 .. deduped_125_1 - 1 ];
    deduped_113_1 := [ 0 .. deduped_124_1 - 1 ];
    deduped_112_1 := Length( deduped_122_1 );
    deduped_111_1 := CreateCapCategoryMorphismWithAttributes( deduped_123_1, deduped_116_1, deduped_117_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_139_1, deduped_130_1, deduped_135_1, AsList, deduped_144_1 ) );
    deduped_110_1 := CreateCapCategoryMorphismWithAttributes( deduped_123_1, deduped_116_1, deduped_117_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_139_1, deduped_130_1, deduped_135_1, AsList, deduped_143_1 ) );
    deduped_109_1 := CreateCapCategoryMorphismWithAttributes( deduped_123_1, deduped_117_1, deduped_116_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_139_1, deduped_130_1, deduped_135_1, AsList, deduped_142_1 ) );
    deduped_108_1 := ListWithIdenticalEntries( deduped_125_1, deduped_117_1 );
    deduped_107_1 := ListWithIdenticalEntries( deduped_124_1, deduped_116_1 );
    deduped_106_1 := ListWithIdenticalEntries( deduped_132_1, deduped_117_1 );
    deduped_105_1 := ListWithIdenticalEntries( deduped_129_1, deduped_116_1 );
    deduped_104_1 := [ 0 .. deduped_118_1 - 1 ];
    deduped_103_1 := Length( deduped_114_1 );
    deduped_2_1 := [ deduped_133_1, deduped_134_1 ];
    deduped_1_1 := [ deduped_116_1, deduped_117_1 ];
    deduped_100_1 := Concatenation( List( deduped_107_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ), List( deduped_108_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ) );
    deduped_94_1 := [ 0 .. Product( deduped_100_1 ) - 1 ];
    deduped_102_1 := List( deduped_114_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := logic_new_func_x_2 + deduped_124_1;
            hoisted_2_2 := deduped_100_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_100_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_94_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_99_1 := Concatenation( List( deduped_105_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ), List( deduped_106_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ) );
    deduped_93_1 := [ 0 .. Product( deduped_99_1 ) - 1 ];
    deduped_101_1 := List( deduped_122_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := logic_new_func_x_2 + deduped_129_1;
            hoisted_2_2 := deduped_99_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_99_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_93_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_98_1 := [ 0 .. Sum( [ Length( deduped_121_1 ), deduped_112_1, deduped_112_1 ] ) - 1 ];
    deduped_97_1 := [ 0 .. Sum( [ Length( deduped_113_1 ), deduped_103_1, deduped_103_1 ] ) - 1 ];
    deduped_72_1 := List( deduped_122_1, function ( logic_new_func_x_2 )
            return REM_INT( logic_new_func_x_2, deduped_132_1 );
        end );
    deduped_71_1 := List( deduped_121_1, function ( logic_new_func_x_2 )
            return REM_INT( logic_new_func_x_2, deduped_129_1 );
        end );
    deduped_96_1 := ListOfValues( [ CreateCapCategoryMorphismWithAttributes( deduped_139_1, deduped_126_1, deduped_119_1, AsList, List( deduped_121_1, function ( i_2 )
                    return 1 + deduped_71_1[(1 + i_2)] * 2;
                end ) ), CreateCapCategoryMorphismWithAttributes( deduped_139_1, deduped_127_1, deduped_120_1, AsList, List( deduped_122_1, function ( i_2 )
                    return 2 + deduped_72_1[(1 + i_2)] * 3;
                end ) ) ] );
    deduped_95_1 := ListOfValues( [ CreateCapCategoryMorphismWithAttributes( deduped_139_1, deduped_126_1, deduped_119_1, AsList, List( deduped_121_1, function ( i_2 )
                    return deduped_71_1[(1 + i_2)] * 2;
                end ) ), CreateCapCategoryMorphismWithAttributes( deduped_139_1, deduped_127_1, deduped_120_1, AsList, List( deduped_122_1, function ( i_2 )
                    return 1 + deduped_72_1[(1 + i_2)] * 3;
                end ) ) ] );
    hoisted_57_1 := [ 0, 0, 0 ];
    deduped_92_1 := ListOfValues( [ CreateCapCategoryMorphismWithAttributes( deduped_139_1, deduped_119_1, deduped_126_1, AsList, List( deduped_113_1, function ( logic_new_func_x_2 )
                    return REM_INT( QUO_INT( logic_new_func_x_2, 2 ), deduped_129_1 );
                end ) ), CreateCapCategoryMorphismWithAttributes( deduped_139_1, deduped_120_1, deduped_127_1, AsList, List( deduped_114_1, function ( i_2 )
                    local deduped_1_2;
                    deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
                    return hoisted_57_1[1 + REM_INT( deduped_1_2, 3 )] + REM_INT( QUO_INT( deduped_1_2, 3 ), deduped_132_1 );
                end ) ) ] );
    deduped_91_1 := [ 1 .. Length( deduped_96_1 ) ];
    deduped_90_1 := [ 1 .. Length( deduped_95_1 ) ];
    hoisted_50_1 := Concatenation( List( deduped_113_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2;
              hoisted_2_2 := deduped_100_1[1 + logic_new_func_x_2];
              hoisted_1_2 := Product( deduped_100_1{[ 1 .. logic_new_func_x_2 ]} );
              return List( deduped_94_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), deduped_102_1, deduped_102_1 );
    deduped_14_1 := [ deduped_140_1[3], List( deduped_136_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_136_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_13_1 := [ deduped_109_1, deduped_110_1, deduped_111_1 ];
    deduped_10_1 := [ deduped_141_1, deduped_142_1, deduped_143_1, deduped_144_1, deduped_145_1, deduped_146_1, deduped_147_1 ];
    deduped_9_1 := [ deduped_141_1, deduped_141_1, deduped_142_1, deduped_142_1, deduped_142_1, deduped_142_1, deduped_142_1 ];
    deduped_8_1 := [ deduped_141_1, deduped_142_1, deduped_141_1, deduped_141_1, deduped_142_1, deduped_142_1, deduped_142_1 ];
    deduped_7_1 := [ 0, 4 ];
    hoisted_49_1 := Concatenation( List( ListWithIdenticalEntries( deduped_124_1, deduped_109_1 ), function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( logic_new_func_x_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and AsList( MapOfObject( Range( logic_new_func_x_2 ) ) ) = deduped_9_1[deduped_1_2] then
                              return AsList( MapOfMorphism( logic_new_func_x_2 ) ) = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, logic_new_func_x_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_125_1, deduped_110_1 ), function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( logic_new_func_x_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and AsList( MapOfObject( Range( logic_new_func_x_2 ) ) ) = deduped_9_1[deduped_1_2] then
                              return AsList( MapOfMorphism( logic_new_func_x_2 ) ) = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, logic_new_func_x_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_125_1, deduped_111_1 ), function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( logic_new_func_x_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and AsList( MapOfObject( Range( logic_new_func_x_2 ) ) ) = deduped_9_1[deduped_1_2] then
                              return AsList( MapOfMorphism( logic_new_func_x_2 ) ) = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, logic_new_func_x_2 )];
              fi;
              return;
          end ) );
    hoisted_51_1 := List( deduped_97_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_49_1[deduped_3_2];
            hoisted_1_2 := hoisted_50_1[deduped_3_2];
            return List( deduped_94_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_45_1 := Concatenation( deduped_107_1, deduped_108_1 );
    hoisted_38_1 := [ 1, 0, 1 ];
    deduped_18_1 := List( deduped_137_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_39_1 := List( deduped_114_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return hoisted_38_1[1 + REM_INT( deduped_1_2, 3 )] + deduped_18_1[(1 + REM_INT( QUO_INT( deduped_1_2, 3 ), deduped_132_1 ))] * 2;
        end );
    hoisted_36_1 := [ 0, 0, 1 ];
    deduped_16_1 := List( deduped_137_1, function ( a_2 )
            return a_2[1];
        end );
    deduped_37_1 := List( deduped_114_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return hoisted_36_1[1 + REM_INT( deduped_1_2, 3 )] + deduped_16_1[(1 + REM_INT( QUO_INT( deduped_1_2, 3 ), deduped_132_1 ))] * 2;
        end );
    hoisted_32_1 := [ 1, 2 ];
    deduped_4_1 := deduped_138_1[3];
    deduped_33_1 := List( deduped_113_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return hoisted_32_1[1 + REM_INT( deduped_1_2, 2 )] + deduped_4_1[(1 + REM_INT( QUO_INT( deduped_1_2, 2 ), deduped_129_1 ))] * 3;
        end );
    hoisted_46_1 := Concatenation( List( deduped_113_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_45_1[1 + (deduped_33_1[1 + logic_new_func_x_2] + deduped_124_1)] )];
          end ), List( deduped_114_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_45_1[1 + deduped_37_1[(1 + logic_new_func_x_2)]] )];
          end ), List( deduped_114_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_45_1[1 + deduped_39_1[(1 + logic_new_func_x_2)]] )];
          end ) );
    deduped_47_1 := List( deduped_97_1, function ( j_2 )
            return Product( hoisted_46_1{[ 1 .. j_2 ]} );
        end );
    hoisted_43_1 := Concatenation( List( deduped_113_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_33_1[1 + logic_new_func_x_2] + deduped_124_1;
              hoisted_2_2 := deduped_100_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_100_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_94_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_114_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_37_1[1 + logic_new_func_x_2];
              hoisted_2_2 := deduped_100_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_100_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_94_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_114_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_39_1[1 + logic_new_func_x_2];
              hoisted_2_2 := deduped_100_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_100_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_94_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_35_1 := Concatenation( List( deduped_107_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ), List( deduped_108_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    deduped_12_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_123_1, deduped_116_1, deduped_116_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_139_1, deduped_130_1, deduped_135_1, AsList, deduped_141_1 ) ), deduped_109_1, deduped_110_1, deduped_111_1, CreateCapCategoryMorphismWithAttributes( deduped_123_1, deduped_117_1, deduped_117_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_139_1, deduped_130_1, deduped_135_1, AsList, deduped_145_1 ) ), CreateCapCategoryMorphismWithAttributes( deduped_123_1, deduped_117_1, deduped_117_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_139_1, deduped_130_1, deduped_135_1, AsList, deduped_146_1 ) ), CreateCapCategoryMorphismWithAttributes( deduped_123_1, deduped_117_1, deduped_117_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_139_1, deduped_130_1, deduped_135_1, AsList, deduped_147_1 ) ) ];
    deduped_11_1 := [ deduped_116_1, deduped_117_1, deduped_116_1, deduped_116_1, deduped_117_1, deduped_117_1, deduped_117_1 ];
    hoisted_40_1 := Concatenation( List( deduped_113_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_7_1[(1 + deduped_35_1[(1 + (deduped_33_1[1 + logic_new_func_x_2] + deduped_124_1))][1])];
              deduped_2_2 := deduped_8_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and deduped_9_1[deduped_3_2] = deduped_9_1[deduped_1_2] then
                              return deduped_10_1[deduped_3_2] = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_11_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, deduped_12_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_114_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_7_1[(1 + deduped_35_1[(1 + deduped_37_1[(1 + logic_new_func_x_2)])][1])];
              deduped_2_2 := deduped_8_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and deduped_9_1[deduped_3_2] = deduped_9_1[deduped_1_2] then
                              return deduped_10_1[deduped_3_2] = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_11_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, deduped_12_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_114_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_7_1[(1 + deduped_35_1[(1 + deduped_39_1[(1 + logic_new_func_x_2)])][1])];
              deduped_2_2 := deduped_8_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and deduped_9_1[deduped_3_2] = deduped_9_1[deduped_1_2] then
                              return deduped_10_1[deduped_3_2] = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_11_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, deduped_12_1[deduped_3_2] )];
              fi;
              return;
          end ) );
    hoisted_44_1 := List( deduped_97_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_40_1[deduped_3_2];
            hoisted_1_2 := hoisted_43_1[deduped_3_2];
            return List( deduped_94_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_89_1 := Filtered( deduped_94_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return Sum( deduped_97_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_44_1[deduped_1_3][deduped_1_2] * deduped_47_1[deduped_1_3];
                  end ) = Sum( deduped_97_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_51_1[deduped_1_3][deduped_1_2] * deduped_47_1[deduped_1_3];
                  end );
        end );
    hoisted_30_1 := Concatenation( List( deduped_121_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2;
              hoisted_2_2 := deduped_99_1[1 + logic_new_func_x_2];
              hoisted_1_2 := Product( deduped_99_1{[ 1 .. logic_new_func_x_2 ]} );
              return List( deduped_93_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), deduped_101_1, deduped_101_1 );
    hoisted_29_1 := Concatenation( List( ListWithIdenticalEntries( deduped_129_1, deduped_109_1 ), function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( logic_new_func_x_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and AsList( MapOfObject( Range( logic_new_func_x_2 ) ) ) = deduped_9_1[deduped_1_2] then
                              return AsList( MapOfMorphism( logic_new_func_x_2 ) ) = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, logic_new_func_x_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_132_1, deduped_110_1 ), function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( logic_new_func_x_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and AsList( MapOfObject( Range( logic_new_func_x_2 ) ) ) = deduped_9_1[deduped_1_2] then
                              return AsList( MapOfMorphism( logic_new_func_x_2 ) ) = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, logic_new_func_x_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_132_1, deduped_111_1 ), function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( logic_new_func_x_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and AsList( MapOfObject( Range( logic_new_func_x_2 ) ) ) = deduped_9_1[deduped_1_2] then
                              return AsList( MapOfMorphism( logic_new_func_x_2 ) ) = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, logic_new_func_x_2 )];
              fi;
              return;
          end ) );
    hoisted_31_1 := List( deduped_98_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_29_1[deduped_3_2];
            hoisted_1_2 := hoisted_30_1[deduped_3_2];
            return List( deduped_93_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_25_1 := Concatenation( deduped_105_1, deduped_106_1 );
    deduped_19_1 := List( deduped_122_1, function ( logic_new_func_x_2 )
            return deduped_18_1[1 + REM_INT( logic_new_func_x_2, deduped_132_1 )];
        end );
    deduped_17_1 := List( deduped_122_1, function ( logic_new_func_x_2 )
            return deduped_16_1[1 + REM_INT( logic_new_func_x_2, deduped_132_1 )];
        end );
    deduped_5_1 := List( deduped_121_1, function ( logic_new_func_x_2 )
            return deduped_4_1[1 + REM_INT( logic_new_func_x_2, deduped_129_1 )];
        end );
    hoisted_26_1 := Concatenation( List( deduped_121_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_25_1[1 + (deduped_5_1[1 + logic_new_func_x_2] + deduped_129_1)] )];
          end ), List( deduped_122_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_25_1[1 + deduped_17_1[(1 + logic_new_func_x_2)]] )];
          end ), List( deduped_122_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_25_1[1 + deduped_19_1[(1 + logic_new_func_x_2)]] )];
          end ) );
    deduped_27_1 := List( deduped_98_1, function ( j_2 )
            return Product( hoisted_26_1{[ 1 .. j_2 ]} );
        end );
    hoisted_23_1 := Concatenation( List( deduped_121_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_5_1[1 + logic_new_func_x_2] + deduped_129_1;
              hoisted_2_2 := deduped_99_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_99_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_93_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_122_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_17_1[1 + logic_new_func_x_2];
              hoisted_2_2 := deduped_99_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_99_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_93_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_122_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_19_1[1 + logic_new_func_x_2];
              hoisted_2_2 := deduped_99_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_99_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_93_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_6_1 := Concatenation( List( deduped_105_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ), List( deduped_106_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    hoisted_20_1 := Concatenation( List( deduped_121_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_7_1[(1 + deduped_6_1[(1 + (deduped_5_1[1 + logic_new_func_x_2] + deduped_129_1))][1])];
              deduped_2_2 := deduped_8_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and deduped_9_1[deduped_3_2] = deduped_9_1[deduped_1_2] then
                              return deduped_10_1[deduped_3_2] = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_11_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, deduped_12_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_122_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_7_1[(1 + deduped_6_1[(1 + deduped_17_1[(1 + logic_new_func_x_2)])][1])];
              deduped_2_2 := deduped_8_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and deduped_9_1[deduped_3_2] = deduped_9_1[deduped_1_2] then
                              return deduped_10_1[deduped_3_2] = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_11_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, deduped_12_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_122_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_7_1[(1 + deduped_6_1[(1 + deduped_19_1[(1 + logic_new_func_x_2)])][1])];
              deduped_2_2 := deduped_8_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and deduped_9_1[deduped_3_2] = deduped_9_1[deduped_1_2] then
                              return deduped_10_1[deduped_3_2] = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_11_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, deduped_12_1[deduped_3_2] )];
              fi;
              return;
          end ) );
    hoisted_24_1 := List( deduped_98_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_20_1[deduped_3_2];
            hoisted_1_2 := hoisted_23_1[deduped_3_2];
            return List( deduped_93_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_88_1 := Filtered( deduped_93_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return Sum( deduped_98_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_24_1[deduped_1_3][deduped_1_2] * deduped_27_1[deduped_1_3];
                  end ) = Sum( deduped_98_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_31_1[deduped_1_3][deduped_1_2] * deduped_27_1[deduped_1_3];
                  end );
        end );
    deduped_87_1 := [ 1 .. Length( deduped_92_1 ) ];
    deduped_86_1 := Length( deduped_89_1 );
    deduped_85_1 := Length( deduped_88_1 );
    deduped_81_1 := List( deduped_96_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_80_1 := List( deduped_96_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_83_1 := Concatenation( List( deduped_91_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := Sum( deduped_81_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
              hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_81_1[logic_new_func_x_2] - 1 ];
              hoisted_1_2 := AsList( CAP_JIT_INCOMPLETE_LOGIC( deduped_96_1[logic_new_func_x_2] ) );
              return List( [ 0 .. deduped_80_1[logic_new_func_x_2] - 1 ], function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := hoisted_2_2[1 + hoisted_1_2[(1 + logic_new_func_x_3)]];
                      hoisted_2_3 := deduped_100_1[1 + deduped_3_3];
                      hoisted_1_3 := Product( deduped_100_1{[ 1 .. deduped_3_3 ]} );
                      return List( deduped_94_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    deduped_74_1 := Concatenation( List( deduped_105_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_7_1[(1 + AsList( MapOfObject( logic_new_func_x_2 ) )[1])];
              deduped_2_2 := deduped_8_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and deduped_9_1[deduped_3_2] = deduped_9_1[deduped_1_2] then
                              return deduped_10_1[deduped_3_2] = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_11_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, deduped_12_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_106_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_7_1[(1 + AsList( MapOfObject( logic_new_func_x_2 ) )[1])];
              deduped_2_2 := deduped_8_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and deduped_9_1[deduped_3_2] = deduped_9_1[deduped_1_2] then
                              return deduped_10_1[deduped_3_2] = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_11_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, deduped_12_1[deduped_3_2] )];
              fi;
              return;
          end ) );
    hoisted_84_1 := List( [ 0 .. Sum( List( deduped_91_1, function ( logic_new_func_x_2 )
                      return Length( [ 0 .. deduped_80_1[logic_new_func_x_2] - 1 ] );
                  end ) ) - 1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := deduped_74_1[deduped_3_2];
            hoisted_1_2 := hoisted_83_1[deduped_3_2];
            return List( deduped_94_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_69_1 := List( deduped_115_1, function ( j_2 )
            return Product( deduped_99_1{[ 1 .. j_2 ]} );
        end );
    deduped_52_1 := [ [ 0 .. deduped_133_1 - 1 ], [ 0 .. deduped_134_1 - 1 ] ];
    hoisted_67_1 := Concatenation( List( deduped_105_1, function ( logic_new_func_x_2 )
              return deduped_52_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ), List( deduped_106_1, function ( logic_new_func_x_2 )
              return deduped_52_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ) );
    hoisted_68_1 := List( [ 1 .. deduped_128_1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_67_1[logic_new_func_x_2];
            hoisted_2_2 := deduped_99_1[logic_new_func_x_2];
            hoisted_1_2 := Product( deduped_99_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( deduped_93_1, function ( logic_new_func_x_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( logic_new_func_x_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    deduped_79_1 := List( deduped_93_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_115_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_68_1[deduped_1_3][hoisted_1_2] * deduped_69_1[deduped_1_3];
                end );
        end );
    deduped_75_1 := List( deduped_95_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_73_1 := List( deduped_95_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_77_1 := Concatenation( List( deduped_90_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := Sum( deduped_75_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
              hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_75_1[logic_new_func_x_2] - 1 ];
              hoisted_1_2 := AsList( CAP_JIT_INCOMPLETE_LOGIC( deduped_95_1[logic_new_func_x_2] ) );
              return List( [ 0 .. deduped_73_1[logic_new_func_x_2] - 1 ], function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := hoisted_2_2[1 + hoisted_1_2[(1 + logic_new_func_x_3)]];
                      hoisted_2_3 := deduped_100_1[1 + deduped_3_3];
                      hoisted_1_3 := Product( deduped_100_1{[ 1 .. deduped_3_3 ]} );
                      return List( deduped_94_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_78_1 := List( [ 0 .. Sum( List( deduped_90_1, function ( logic_new_func_x_2 )
                      return Length( [ 0 .. deduped_73_1[logic_new_func_x_2] - 1 ] );
                  end ) ) - 1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := deduped_74_1[deduped_3_2];
            hoisted_1_2 := hoisted_77_1[deduped_3_2];
            return List( deduped_94_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_55_1 := List( deduped_104_1, function ( j_2 )
            return Product( deduped_100_1{[ 1 .. j_2 ]} );
        end );
    hoisted_53_1 := Concatenation( List( deduped_107_1, function ( logic_new_func_x_2 )
              return deduped_52_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ), List( deduped_108_1, function ( logic_new_func_x_2 )
              return deduped_52_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ) );
    hoisted_54_1 := List( [ 1 .. deduped_118_1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_53_1[logic_new_func_x_2];
            hoisted_2_2 := deduped_100_1[logic_new_func_x_2];
            hoisted_1_2 := Product( deduped_100_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( deduped_94_1, function ( logic_new_func_x_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( logic_new_func_x_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    hoisted_65_1 := List( deduped_94_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_104_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_54_1[deduped_1_3][hoisted_1_2] * deduped_55_1[deduped_1_3];
                end );
        end );
    deduped_60_1 := List( deduped_92_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_58_1 := List( deduped_92_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_62_1 := Concatenation( List( deduped_87_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := Sum( deduped_60_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
              hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_60_1[logic_new_func_x_2] - 1 ];
              hoisted_1_2 := AsList( CAP_JIT_INCOMPLETE_LOGIC( deduped_92_1[logic_new_func_x_2] ) );
              return List( [ 0 .. deduped_58_1[logic_new_func_x_2] - 1 ], function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := hoisted_2_2[1 + hoisted_1_2[(1 + logic_new_func_x_3)]];
                      hoisted_2_3 := deduped_99_1[1 + deduped_3_3];
                      hoisted_1_3 := Product( deduped_99_1{[ 1 .. deduped_3_3 ]} );
                      return List( deduped_93_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_59_1 := Concatenation( List( deduped_107_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_7_1[(1 + AsList( MapOfObject( logic_new_func_x_2 ) )[1])];
              deduped_2_2 := deduped_8_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and deduped_9_1[deduped_3_2] = deduped_9_1[deduped_1_2] then
                              return deduped_10_1[deduped_3_2] = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_11_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, deduped_12_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_108_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_7_1[(1 + AsList( MapOfObject( logic_new_func_x_2 ) )[1])];
              deduped_2_2 := deduped_8_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and deduped_9_1[deduped_3_2] = deduped_9_1[deduped_1_2] then
                              return deduped_10_1[deduped_3_2] = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_11_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, deduped_12_1[deduped_3_2] )];
              fi;
              return;
          end ) );
    hoisted_63_1 := List( [ 0 .. Sum( List( deduped_87_1, function ( logic_new_func_x_2 )
                      return Length( [ 0 .. deduped_58_1[logic_new_func_x_2] - 1 ] );
                  end ) ) - 1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_59_1[deduped_3_2];
            hoisted_1_2 := hoisted_62_1[deduped_3_2];
            return List( deduped_93_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets, NTuple( 4, deduped_85_1, deduped_86_1, List( [ 0 .. deduped_85_1 - 1 ], function ( x_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_88_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))] );
                return -1 + SafePosition( deduped_89_1, hoisted_65_1[(1 + Sum( deduped_104_1, function ( j_3 )
                               local deduped_1_3;
                               deduped_1_3 := (1 + j_3);
                               return hoisted_63_1[deduped_1_3][hoisted_1_2] * deduped_55_1[deduped_1_3];
                           end ))] );
            end ), List( [ 0 .. deduped_86_1 - 1 ], function ( logic_new_func_x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_89_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 ))] );
                return NTuple( 2, -1 + SafePosition( deduped_88_1, deduped_79_1[(1 + Sum( deduped_115_1, function ( j_3 )
                                 local deduped_1_3;
                                 deduped_1_3 := (1 + j_3);
                                 return hoisted_78_1[deduped_1_3][deduped_1_2] * deduped_69_1[deduped_1_3];
                             end ))] ), -1 + SafePosition( deduped_88_1, deduped_79_1[(1 + Sum( deduped_115_1, function ( j_3 )
                                 local deduped_1_3;
                                 deduped_1_3 := (1 + j_3);
                                 return hoisted_84_1[deduped_1_3][deduped_1_2] * deduped_69_1[deduped_1_3];
                             end ))] ) );
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
