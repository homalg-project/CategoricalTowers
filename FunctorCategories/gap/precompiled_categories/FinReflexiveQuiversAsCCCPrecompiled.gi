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
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, hoisted_21_1, hoisted_24_1, hoisted_25_1, deduped_26_1, hoisted_27_1, deduped_28_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, deduped_33_1, hoisted_34_1, deduped_35_1, deduped_37_1, hoisted_38_1, deduped_39_1, hoisted_40_1, deduped_41_1, hoisted_42_1, hoisted_45_1, hoisted_46_1, deduped_47_1, hoisted_48_1, deduped_49_1, hoisted_51_1, hoisted_52_1, hoisted_53_1, deduped_54_1, hoisted_55_1, hoisted_56_1, deduped_57_1, hoisted_59_1, deduped_60_1, hoisted_62_1, hoisted_63_1, deduped_64_1, hoisted_66_1, hoisted_67_1, hoisted_69_1, hoisted_71_1, hoisted_72_1, deduped_73_1, deduped_75_1, deduped_76_1, deduped_77_1, hoisted_79_1, deduped_80_1, deduped_81_1, hoisted_83_1, hoisted_84_1, deduped_85_1, deduped_86_1, hoisted_87_1, deduped_88_1, hoisted_90_1, hoisted_91_1, deduped_92_1, deduped_93_1, deduped_94_1, deduped_95_1, deduped_96_1, deduped_97_1, deduped_98_1, deduped_99_1, deduped_100_1, deduped_101_1, deduped_102_1, deduped_103_1, deduped_104_1, deduped_105_1, deduped_106_1, deduped_107_1, deduped_108_1, deduped_109_1, deduped_110_1, deduped_111_1, deduped_112_1, deduped_113_1, deduped_114_1, deduped_115_1, deduped_116_1, deduped_117_1, deduped_118_1, deduped_119_1, deduped_120_1, deduped_121_1, deduped_122_1, deduped_123_1, deduped_124_1, deduped_125_1, deduped_126_1, deduped_127_1, deduped_128_1, deduped_129_1, deduped_130_1, deduped_131_1, deduped_132_1, deduped_133_1, deduped_134_1, deduped_135_1, deduped_136_1, deduped_137_1, deduped_138_1, deduped_139_1, deduped_140_1, deduped_141_1, deduped_142_1, deduped_143_1, deduped_144_1, deduped_145_1, deduped_146_1;
    deduped_146_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_145_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( b_1 );
    deduped_144_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( a_1 );
    deduped_143_1 := deduped_144_1[4];
    deduped_142_1 := deduped_145_1[4];
    deduped_141_1 := deduped_145_1[2];
    deduped_140_1 := deduped_145_1[1];
    deduped_139_1 := deduped_144_1[2];
    deduped_138_1 := deduped_144_1[1];
    deduped_137_1 := deduped_138_1 + deduped_139_1;
    deduped_136_1 := CreateCapCategoryObjectWithAttributes( deduped_146_1, Length, deduped_139_1 );
    deduped_135_1 := CreateCapCategoryObjectWithAttributes( deduped_146_1, Length, deduped_138_1 );
    deduped_134_1 := 3 * deduped_139_1;
    deduped_133_1 := 2 * deduped_138_1;
    deduped_132_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_131_1 := [ 0 .. deduped_139_1 - 1 ];
    deduped_130_1 := [ 0 .. deduped_138_1 - 1 ];
    deduped_129_1 := CreateCapCategoryObjectWithAttributes( deduped_146_1, Length, deduped_134_1 );
    deduped_128_1 := CreateCapCategoryObjectWithAttributes( deduped_146_1, Length, deduped_133_1 );
    deduped_127_1 := deduped_133_1 + deduped_134_1;
    deduped_126_1 := CreateCapCategoryObjectWithAttributes( deduped_132_1, IndexOfObject, 1 );
    deduped_125_1 := CreateCapCategoryObjectWithAttributes( deduped_132_1, IndexOfObject, 0 );
    deduped_124_1 := [ 0 .. deduped_137_1 - 1 ];
    deduped_123_1 := [ 0 .. deduped_134_1 - 1 ];
    deduped_122_1 := [ 0 .. deduped_133_1 - 1 ];
    deduped_121_1 := CreateCapCategoryMorphismWithAttributes( deduped_132_1, deduped_125_1, deduped_126_1, IndexOfMorphism, 3 );
    deduped_120_1 := CreateCapCategoryMorphismWithAttributes( deduped_132_1, deduped_125_1, deduped_126_1, IndexOfMorphism, 2 );
    deduped_119_1 := CreateCapCategoryMorphismWithAttributes( deduped_132_1, deduped_126_1, deduped_125_1, IndexOfMorphism, 1 );
    deduped_118_1 := ListWithIdenticalEntries( deduped_134_1, deduped_126_1 );
    deduped_117_1 := ListWithIdenticalEntries( deduped_133_1, deduped_125_1 );
    deduped_116_1 := ListWithIdenticalEntries( deduped_139_1, deduped_126_1 );
    deduped_115_1 := ListWithIdenticalEntries( deduped_138_1, deduped_125_1 );
    deduped_114_1 := [ 0 .. deduped_127_1 - 1 ];
    deduped_113_1 := [ 0 .. Sum( [ deduped_138_1, deduped_139_1, deduped_139_1 ] ) - 1 ];
    deduped_112_1 := [ 0 .. Sum( [ deduped_133_1, deduped_134_1, deduped_134_1 ] ) - 1 ];
    deduped_2_1 := [ deduped_140_1, deduped_141_1 ];
    deduped_1_1 := [ deduped_125_1, deduped_126_1 ];
    deduped_111_1 := Concatenation( List( deduped_117_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ), List( deduped_118_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ) );
    deduped_110_1 := Concatenation( List( deduped_115_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ), List( deduped_116_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ) );
    deduped_107_1 := Product( deduped_111_1 );
    deduped_101_1 := [ 0 .. deduped_107_1 - 1 ];
    deduped_109_1 := List( deduped_123_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + (i_2 + deduped_133_1);
            hoisted_2_2 := deduped_111_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_111_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_101_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_106_1 := Product( deduped_110_1 );
    deduped_100_1 := [ 0 .. deduped_106_1 - 1 ];
    deduped_108_1 := List( deduped_131_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + (i_2 + deduped_138_1);
            hoisted_2_2 := deduped_110_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_110_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_100_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_76_1 := List( deduped_131_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, 1 ), deduped_139_1 );
        end );
    deduped_75_1 := List( deduped_130_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, 1 ), deduped_138_1 );
        end );
    deduped_105_1 := ListOfValues( [ CreateCapCategoryMorphismWithAttributes( deduped_146_1, deduped_135_1, deduped_128_1, AsList, List( deduped_130_1, function ( i_2 )
                    return 1 + deduped_75_1[(1 + i_2)] * 2;
                end ) ), CreateCapCategoryMorphismWithAttributes( deduped_146_1, deduped_136_1, deduped_129_1, AsList, List( deduped_131_1, function ( i_2 )
                    return 2 + deduped_76_1[(1 + i_2)] * 3;
                end ) ) ] );
    deduped_104_1 := ListOfValues( [ CreateCapCategoryMorphismWithAttributes( deduped_146_1, deduped_135_1, deduped_128_1, AsList, List( deduped_130_1, function ( i_2 )
                    return deduped_75_1[(1 + i_2)] * 2;
                end ) ), CreateCapCategoryMorphismWithAttributes( deduped_146_1, deduped_136_1, deduped_129_1, AsList, List( deduped_131_1, function ( i_2 )
                    return 1 + deduped_76_1[(1 + i_2)] * 3;
                end ) ) ] );
    deduped_103_1 := ListWithIdenticalEntries( Length( deduped_123_1 ), deduped_107_1 );
    deduped_102_1 := ListWithIdenticalEntries( Length( deduped_131_1 ), deduped_106_1 );
    deduped_99_1 := [ 1 .. Length( deduped_105_1 ) ];
    deduped_98_1 := [ 1 .. Length( deduped_104_1 ) ];
    hoisted_52_1 := Concatenation( List( deduped_122_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + i_2;
              hoisted_2_2 := deduped_111_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_111_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_101_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), deduped_109_1, deduped_109_1 );
    deduped_15_1 := [ deduped_145_1[3], List( deduped_142_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_142_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_14_1 := [ deduped_119_1, deduped_120_1, deduped_121_1 ];
    deduped_11_1 := [ 0, 1, 2, 3, 4, 5, 6 ];
    deduped_10_1 := [ 0, 0, 1, 1, 1, 1, 1 ];
    deduped_9_1 := [ 0, 1, 0, 0, 1, 1, 1 ];
    deduped_8_1 := [ 0, 4 ];
    hoisted_51_1 := Concatenation( List( ListWithIdenticalEntries( deduped_133_1, deduped_119_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := IndexOfObject( deduped_3_2 );
              deduped_1_2 := 1 + deduped_8_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_9_1[deduped_1_2] and IndexOfObject( Range( morB_2 ) ) = deduped_10_1[deduped_1_2] then
                              return IndexOfMorphism( morB_2 ) = deduped_11_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_15_1[SafeUniquePosition( deduped_14_1, morB_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_134_1, deduped_120_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := IndexOfObject( deduped_3_2 );
              deduped_1_2 := 1 + deduped_8_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_9_1[deduped_1_2] and IndexOfObject( Range( morB_2 ) ) = deduped_10_1[deduped_1_2] then
                              return IndexOfMorphism( morB_2 ) = deduped_11_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_15_1[SafeUniquePosition( deduped_14_1, morB_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_134_1, deduped_121_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := IndexOfObject( deduped_3_2 );
              deduped_1_2 := 1 + deduped_8_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_9_1[deduped_1_2] and IndexOfObject( Range( morB_2 ) ) = deduped_10_1[deduped_1_2] then
                              return IndexOfMorphism( morB_2 ) = deduped_11_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_15_1[SafeUniquePosition( deduped_14_1, morB_2 )];
              fi;
              return;
          end ) );
    deduped_33_1 := Concatenation( ListWithIdenticalEntries( Length( deduped_122_1 ), deduped_107_1 ), deduped_103_1, deduped_103_1 );
    hoisted_53_1 := List( deduped_112_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_51_1[deduped_3_2];
            hoisted_1_2 := hoisted_52_1[deduped_3_2];
            return List( [ 0 .. deduped_33_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_47_1 := Concatenation( deduped_117_1, deduped_118_1 );
    hoisted_40_1 := [ 1, 0, 1 ];
    deduped_19_1 := List( deduped_143_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_41_1 := List( deduped_123_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( hoisted_40_1[1 + REM_INT( deduped_1_2, 3 )] ) + CAP_JIT_INCOMPLETE_LOGIC( deduped_19_1[(1 + REM_INT( QUO_INT( deduped_1_2, 3 ), deduped_139_1 ))] ) * 2;
        end );
    hoisted_38_1 := [ 0, 0, 1 ];
    deduped_17_1 := List( deduped_143_1, function ( a_2 )
            return a_2[1];
        end );
    deduped_39_1 := List( deduped_123_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( hoisted_38_1[1 + REM_INT( deduped_1_2, 3 )] ) + CAP_JIT_INCOMPLETE_LOGIC( deduped_17_1[(1 + REM_INT( QUO_INT( deduped_1_2, 3 ), deduped_139_1 ))] ) * 2;
        end );
    hoisted_34_1 := [ 1, 2 ];
    deduped_5_1 := deduped_144_1[3];
    deduped_35_1 := List( deduped_122_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( hoisted_34_1[1 + REM_INT( deduped_1_2, 2 )] ) + CAP_JIT_INCOMPLETE_LOGIC( deduped_5_1[(1 + REM_INT( QUO_INT( deduped_1_2, 2 ), deduped_138_1 ))] ) * 3;
        end );
    hoisted_48_1 := Concatenation( List( deduped_122_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_47_1[1 + (deduped_35_1[1 + i_2] + deduped_133_1)] )];
          end ), List( deduped_123_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_47_1[1 + deduped_39_1[(1 + i_2)]] )];
          end ), List( deduped_123_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_47_1[1 + deduped_41_1[(1 + i_2)]] )];
          end ) );
    deduped_49_1 := List( deduped_112_1, function ( j_2 )
            return Product( hoisted_48_1{[ 1 .. j_2 ]} );
        end );
    hoisted_45_1 := Concatenation( List( deduped_122_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + (deduped_35_1[1 + i_2] + deduped_133_1);
              hoisted_2_2 := deduped_111_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_111_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_101_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_123_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_39_1[(1 + i_2)];
              hoisted_2_2 := deduped_111_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_111_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_101_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_123_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_41_1[(1 + i_2)];
              hoisted_2_2 := deduped_111_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_111_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_101_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_37_1 := Concatenation( List( deduped_117_1, IndexOfObject ), List( deduped_118_1, IndexOfObject ) );
    deduped_13_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_132_1, deduped_125_1, deduped_125_1, IndexOfMorphism, 0 ), deduped_119_1, deduped_120_1, deduped_121_1, CreateCapCategoryMorphismWithAttributes( deduped_132_1, deduped_126_1, deduped_126_1, IndexOfMorphism, 4 ), CreateCapCategoryMorphismWithAttributes( deduped_132_1, deduped_126_1, deduped_126_1, IndexOfMorphism, 5 ), CreateCapCategoryMorphismWithAttributes( deduped_132_1, deduped_126_1, deduped_126_1, IndexOfMorphism, 6 ) ];
    deduped_12_1 := [ deduped_125_1, deduped_126_1, deduped_125_1, deduped_125_1, deduped_126_1, deduped_126_1, deduped_126_1 ];
    hoisted_42_1 := Concatenation( List( deduped_122_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_8_1[(1 + deduped_37_1[(1 + (deduped_35_1[1 + i_2] + deduped_133_1))])];
              deduped_2_2 := deduped_9_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_8_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_9_1[deduped_1_2] and deduped_10_1[deduped_3_2] = deduped_10_1[deduped_1_2] then
                              return deduped_11_1[deduped_3_2] = deduped_11_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_12_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_15_1[SafeUniquePosition( deduped_14_1, deduped_13_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_123_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_8_1[(1 + deduped_37_1[(1 + deduped_39_1[(1 + i_2)])])];
              deduped_2_2 := deduped_9_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_8_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_9_1[deduped_1_2] and deduped_10_1[deduped_3_2] = deduped_10_1[deduped_1_2] then
                              return deduped_11_1[deduped_3_2] = deduped_11_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_12_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_15_1[SafeUniquePosition( deduped_14_1, deduped_13_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_123_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_8_1[(1 + deduped_37_1[(1 + deduped_41_1[(1 + i_2)])])];
              deduped_2_2 := deduped_9_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_8_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_9_1[deduped_1_2] and deduped_10_1[deduped_3_2] = deduped_10_1[deduped_1_2] then
                              return deduped_11_1[deduped_3_2] = deduped_11_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_12_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_15_1[SafeUniquePosition( deduped_14_1, deduped_13_1[deduped_3_2] )];
              fi;
              return;
          end ) );
    hoisted_46_1 := List( deduped_112_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_42_1[deduped_3_2];
            hoisted_1_2 := hoisted_45_1[deduped_3_2];
            return List( [ 0 .. deduped_33_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_97_1 := Filtered( deduped_101_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_112_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_46_1[deduped_1_3][deduped_1_2] * deduped_49_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_112_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_53_1[deduped_1_3][deduped_1_2] * deduped_49_1[deduped_1_3];
                    end ) );
        end );
    hoisted_31_1 := Concatenation( List( deduped_130_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + i_2;
              hoisted_2_2 := deduped_110_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_110_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_100_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), deduped_108_1, deduped_108_1 );
    hoisted_30_1 := Concatenation( List( ListWithIdenticalEntries( deduped_138_1, deduped_119_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := IndexOfObject( deduped_3_2 );
              deduped_1_2 := 1 + deduped_8_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_9_1[deduped_1_2] and IndexOfObject( Range( morB_2 ) ) = deduped_10_1[deduped_1_2] then
                              return IndexOfMorphism( morB_2 ) = deduped_11_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_15_1[SafeUniquePosition( deduped_14_1, morB_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_139_1, deduped_120_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := IndexOfObject( deduped_3_2 );
              deduped_1_2 := 1 + deduped_8_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_9_1[deduped_1_2] and IndexOfObject( Range( morB_2 ) ) = deduped_10_1[deduped_1_2] then
                              return IndexOfMorphism( morB_2 ) = deduped_11_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_15_1[SafeUniquePosition( deduped_14_1, morB_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_139_1, deduped_121_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := IndexOfObject( deduped_3_2 );
              deduped_1_2 := 1 + deduped_8_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_9_1[deduped_1_2] and IndexOfObject( Range( morB_2 ) ) = deduped_10_1[deduped_1_2] then
                              return IndexOfMorphism( morB_2 ) = deduped_11_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_15_1[SafeUniquePosition( deduped_14_1, morB_2 )];
              fi;
              return;
          end ) );
    deduped_3_1 := Concatenation( ListWithIdenticalEntries( Length( deduped_130_1 ), deduped_106_1 ), deduped_102_1, deduped_102_1 );
    hoisted_32_1 := List( deduped_113_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_30_1[deduped_3_2];
            hoisted_1_2 := hoisted_31_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_26_1 := Concatenation( deduped_115_1, deduped_116_1 );
    deduped_20_1 := List( deduped_131_1, function ( i_2 )
            return CAP_JIT_INCOMPLETE_LOGIC( deduped_19_1[(1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), 1 ), deduped_139_1 ))] ) * 1;
        end );
    deduped_18_1 := List( deduped_131_1, function ( i_2 )
            return CAP_JIT_INCOMPLETE_LOGIC( deduped_17_1[(1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), 1 ), deduped_139_1 ))] ) * 1;
        end );
    deduped_6_1 := List( deduped_130_1, function ( i_2 )
            return CAP_JIT_INCOMPLETE_LOGIC( deduped_5_1[(1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), 1 ), deduped_138_1 ))] ) * 1;
        end );
    hoisted_27_1 := Concatenation( List( deduped_130_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_26_1[1 + (deduped_6_1[1 + i_2] + deduped_138_1)] )];
          end ), List( deduped_131_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_26_1[1 + deduped_18_1[(1 + i_2)]] )];
          end ), List( deduped_131_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_26_1[1 + deduped_20_1[(1 + i_2)]] )];
          end ) );
    deduped_28_1 := List( deduped_113_1, function ( j_2 )
            return Product( hoisted_27_1{[ 1 .. j_2 ]} );
        end );
    hoisted_24_1 := Concatenation( List( deduped_130_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + (deduped_6_1[1 + i_2] + deduped_138_1);
              hoisted_2_2 := deduped_110_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_110_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_100_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_131_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_18_1[(1 + i_2)];
              hoisted_2_2 := deduped_110_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_110_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_100_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_131_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_20_1[(1 + i_2)];
              hoisted_2_2 := deduped_110_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_110_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_100_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_7_1 := Concatenation( List( deduped_115_1, IndexOfObject ), List( deduped_116_1, IndexOfObject ) );
    hoisted_21_1 := Concatenation( List( deduped_130_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_8_1[(1 + deduped_7_1[(1 + (deduped_6_1[1 + i_2] + deduped_138_1))])];
              deduped_2_2 := deduped_9_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_8_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_9_1[deduped_1_2] and deduped_10_1[deduped_3_2] = deduped_10_1[deduped_1_2] then
                              return deduped_11_1[deduped_3_2] = deduped_11_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_12_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_15_1[SafeUniquePosition( deduped_14_1, deduped_13_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_131_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_8_1[(1 + deduped_7_1[(1 + deduped_18_1[(1 + i_2)])])];
              deduped_2_2 := deduped_9_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_8_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_9_1[deduped_1_2] and deduped_10_1[deduped_3_2] = deduped_10_1[deduped_1_2] then
                              return deduped_11_1[deduped_3_2] = deduped_11_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_12_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_15_1[SafeUniquePosition( deduped_14_1, deduped_13_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_131_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_8_1[(1 + deduped_7_1[(1 + deduped_20_1[(1 + i_2)])])];
              deduped_2_2 := deduped_9_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_8_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_9_1[deduped_1_2] and deduped_10_1[deduped_3_2] = deduped_10_1[deduped_1_2] then
                              return deduped_11_1[deduped_3_2] = deduped_11_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_12_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_15_1[SafeUniquePosition( deduped_14_1, deduped_13_1[deduped_3_2] )];
              fi;
              return;
          end ) );
    hoisted_25_1 := List( deduped_113_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_21_1[deduped_3_2];
            hoisted_1_2 := hoisted_24_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_96_1 := Filtered( deduped_100_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_113_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_25_1[deduped_1_3][deduped_1_2] * deduped_28_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_113_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_32_1[deduped_1_3][deduped_1_2] * deduped_28_1[deduped_1_3];
                    end ) );
        end );
    hoisted_59_1 := [ 0, 0, 0 ];
    deduped_95_1 := ListOfValues( [ CreateCapCategoryMorphismWithAttributes( deduped_146_1, deduped_128_1, deduped_135_1, AsList, List( deduped_122_1, function ( i_2 )
                    return CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), 2 ), deduped_138_1 ) ) * 1;
                end ) ), CreateCapCategoryMorphismWithAttributes( deduped_146_1, deduped_129_1, deduped_136_1, AsList, List( deduped_123_1, function ( i_2 )
                    local deduped_1_2;
                    deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
                    return CAP_JIT_INCOMPLETE_LOGIC( hoisted_59_1[1 + REM_INT( deduped_1_2, 3 )] ) + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( deduped_1_2, 3 ), deduped_139_1 ) ) * 1;
                end ) ) ] );
    deduped_94_1 := Length( deduped_97_1 );
    deduped_93_1 := Length( deduped_96_1 );
    deduped_92_1 := [ 1 .. Length( deduped_95_1 ) ];
    deduped_88_1 := List( deduped_105_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_86_1 := List( deduped_105_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_90_1 := Concatenation( List( deduped_99_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := Sum( deduped_88_1{[ 1 .. i_2 - 1 ]} );
              hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_88_1[i_2] - 1 ];
              hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( AsList( CAP_JIT_INCOMPLETE_LOGIC( deduped_105_1[i_2] ) ) );
              return List( [ 0 .. deduped_86_1[i_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + hoisted_2_2[(1 + hoisted_1_2[(1 + i_3)])];
                      hoisted_2_3 := deduped_111_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_111_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_101_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_87_1 := Concatenation( List( deduped_99_1, function ( i_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_86_1[i_2] - 1 ] ), deduped_107_1 );
          end ) );
    deduped_80_1 := Concatenation( List( deduped_115_1, function ( objB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_8_1[(1 + IndexOfObject( objB_2 ))];
              deduped_2_2 := deduped_9_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_8_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_9_1[deduped_1_2] and deduped_10_1[deduped_3_2] = deduped_10_1[deduped_1_2] then
                              return deduped_11_1[deduped_3_2] = deduped_11_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_12_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_15_1[SafeUniquePosition( deduped_14_1, deduped_13_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_116_1, function ( objB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_8_1[(1 + IndexOfObject( objB_2 ))];
              deduped_2_2 := deduped_9_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_8_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_9_1[deduped_1_2] and deduped_10_1[deduped_3_2] = deduped_10_1[deduped_1_2] then
                              return deduped_11_1[deduped_3_2] = deduped_11_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_12_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_15_1[SafeUniquePosition( deduped_14_1, deduped_13_1[deduped_3_2] )];
              fi;
              return;
          end ) );
    hoisted_91_1 := List( [ 0 .. Sum( List( deduped_99_1, function ( i_2 )
                      return Length( [ 0 .. deduped_86_1[i_2] - 1 ] );
                  end ) ) - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := deduped_80_1[deduped_3_2];
            hoisted_1_2 := hoisted_90_1[deduped_3_2];
            return List( [ 0 .. hoisted_87_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_73_1 := List( deduped_124_1, function ( j_2 )
            return Product( deduped_110_1{[ 1 .. j_2 ]} );
        end );
    deduped_54_1 := [ [ 0 .. deduped_140_1 - 1 ], [ 0 .. deduped_141_1 - 1 ] ];
    hoisted_71_1 := Concatenation( List( deduped_115_1, function ( objB_2 )
              return deduped_54_1[SafePosition( deduped_1_1, objB_2 )];
          end ), List( deduped_116_1, function ( objB_2 )
              return deduped_54_1[SafePosition( deduped_1_1, objB_2 )];
          end ) );
    hoisted_72_1 := List( [ 1 .. deduped_137_1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_71_1[i_2];
            hoisted_2_2 := deduped_110_1[i_2];
            hoisted_1_2 := Product( deduped_110_1{[ 1 .. i_2 - 1 ]} );
            return List( deduped_100_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    deduped_85_1 := List( deduped_100_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_124_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_72_1[deduped_1_3][hoisted_1_2] * deduped_73_1[deduped_1_3];
                end );
        end );
    deduped_81_1 := List( deduped_104_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_77_1 := List( deduped_104_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_83_1 := Concatenation( List( deduped_98_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := Sum( deduped_81_1{[ 1 .. i_2 - 1 ]} );
              hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_81_1[i_2] - 1 ];
              hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( AsList( CAP_JIT_INCOMPLETE_LOGIC( deduped_104_1[i_2] ) ) );
              return List( [ 0 .. deduped_77_1[i_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + hoisted_2_2[(1 + hoisted_1_2[(1 + i_3)])];
                      hoisted_2_3 := deduped_111_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_111_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_101_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_79_1 := Concatenation( List( deduped_98_1, function ( i_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_77_1[i_2] - 1 ] ), deduped_107_1 );
          end ) );
    hoisted_84_1 := List( [ 0 .. Sum( List( deduped_98_1, function ( i_2 )
                      return Length( [ 0 .. deduped_77_1[i_2] - 1 ] );
                  end ) ) - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := deduped_80_1[deduped_3_2];
            hoisted_1_2 := hoisted_83_1[deduped_3_2];
            return List( [ 0 .. hoisted_79_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_57_1 := List( deduped_114_1, function ( j_2 )
            return Product( deduped_111_1{[ 1 .. j_2 ]} );
        end );
    hoisted_55_1 := Concatenation( List( deduped_117_1, function ( objB_2 )
              return deduped_54_1[SafePosition( deduped_1_1, objB_2 )];
          end ), List( deduped_118_1, function ( objB_2 )
              return deduped_54_1[SafePosition( deduped_1_1, objB_2 )];
          end ) );
    hoisted_56_1 := List( [ 1 .. deduped_127_1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_55_1[i_2];
            hoisted_2_2 := deduped_111_1[i_2];
            hoisted_1_2 := Product( deduped_111_1{[ 1 .. i_2 - 1 ]} );
            return List( deduped_101_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    hoisted_69_1 := List( deduped_101_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_114_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_56_1[deduped_1_3][hoisted_1_2] * deduped_57_1[deduped_1_3];
                end );
        end );
    deduped_64_1 := List( deduped_95_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_60_1 := List( deduped_95_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_66_1 := Concatenation( List( deduped_92_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := Sum( deduped_64_1{[ 1 .. i_2 - 1 ]} );
              hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_64_1[i_2] - 1 ];
              hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( AsList( CAP_JIT_INCOMPLETE_LOGIC( deduped_95_1[i_2] ) ) );
              return List( [ 0 .. deduped_60_1[i_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + hoisted_2_2[(1 + hoisted_1_2[(1 + i_3)])];
                      hoisted_2_3 := deduped_110_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_110_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_100_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_63_1 := Concatenation( List( deduped_117_1, function ( objB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_8_1[(1 + IndexOfObject( objB_2 ))];
              deduped_2_2 := deduped_9_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_8_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_9_1[deduped_1_2] and deduped_10_1[deduped_3_2] = deduped_10_1[deduped_1_2] then
                              return deduped_11_1[deduped_3_2] = deduped_11_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_12_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_15_1[SafeUniquePosition( deduped_14_1, deduped_13_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_118_1, function ( objB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_8_1[(1 + IndexOfObject( objB_2 ))];
              deduped_2_2 := deduped_9_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_8_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_9_1[deduped_1_2] and deduped_10_1[deduped_3_2] = deduped_10_1[deduped_1_2] then
                              return deduped_11_1[deduped_3_2] = deduped_11_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_12_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_15_1[SafeUniquePosition( deduped_14_1, deduped_13_1[deduped_3_2] )];
              fi;
              return;
          end ) );
    hoisted_62_1 := Concatenation( List( deduped_92_1, function ( i_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_60_1[i_2] - 1 ] ), deduped_106_1 );
          end ) );
    hoisted_67_1 := List( [ 0 .. Sum( List( deduped_92_1, function ( i_2 )
                      return Length( [ 0 .. deduped_60_1[i_2] - 1 ] );
                  end ) ) - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_63_1[deduped_3_2];
            hoisted_1_2 := hoisted_66_1[deduped_3_2];
            return List( [ 0 .. hoisted_62_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets, NTuple( 4, deduped_93_1, deduped_94_1, List( [ 0 .. deduped_93_1 - 1 ], function ( x_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_96_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))] );
                return -1 + BigInt( SafePosition( deduped_97_1, CAP_JIT_INCOMPLETE_LOGIC( hoisted_69_1[(1 + Sum( deduped_114_1, function ( j_3 )
                                   local deduped_1_3;
                                   deduped_1_3 := (1 + j_3);
                                   return hoisted_67_1[deduped_1_3][hoisted_1_2] * deduped_57_1[deduped_1_3];
                               end ))] ) ) );
            end ), List( [ 0 .. deduped_94_1 - 1 ], function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_97_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))] );
                return NTuple( 2, -1 + BigInt( SafePosition( deduped_96_1, CAP_JIT_INCOMPLETE_LOGIC( deduped_85_1[(1 + Sum( deduped_124_1, function ( j_3 )
                                     local deduped_1_3;
                                     deduped_1_3 := (1 + j_3);
                                     return hoisted_84_1[deduped_1_3][deduped_1_2] * deduped_73_1[deduped_1_3];
                                 end ))] ) ) ), -1 + BigInt( SafePosition( deduped_96_1, CAP_JIT_INCOMPLETE_LOGIC( deduped_85_1[(1 + Sum( deduped_124_1, function ( j_3 )
                                     local deduped_1_3;
                                     deduped_1_3 := (1 + j_3);
                                     return hoisted_91_1[deduped_1_3][deduped_1_2] * deduped_73_1[deduped_1_3];
                                 end ))] ) ) ) );
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
