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
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, hoisted_19_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, deduped_25_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, deduped_30_1, hoisted_31_1, deduped_32_1, deduped_34_1, hoisted_35_1, deduped_36_1, hoisted_37_1, deduped_38_1, hoisted_39_1, hoisted_42_1, hoisted_43_1, hoisted_44_1, deduped_45_1, hoisted_47_1, hoisted_48_1, hoisted_49_1, deduped_50_1, hoisted_51_1, hoisted_52_1, deduped_53_1, hoisted_55_1, deduped_56_1, hoisted_58_1, hoisted_59_1, deduped_60_1, hoisted_62_1, hoisted_63_1, hoisted_65_1, hoisted_67_1, hoisted_68_1, deduped_69_1, deduped_71_1, deduped_72_1, deduped_73_1, hoisted_75_1, deduped_76_1, deduped_77_1, hoisted_79_1, hoisted_80_1, deduped_81_1, deduped_82_1, hoisted_83_1, deduped_84_1, hoisted_86_1, hoisted_87_1, deduped_88_1, deduped_89_1, deduped_90_1, deduped_91_1, deduped_92_1, deduped_93_1, deduped_94_1, deduped_95_1, deduped_96_1, deduped_97_1, deduped_98_1, deduped_99_1, deduped_100_1, deduped_101_1, deduped_102_1, deduped_103_1, deduped_104_1, deduped_105_1, deduped_106_1, deduped_107_1, deduped_108_1, deduped_109_1, deduped_110_1, deduped_111_1, deduped_112_1, deduped_113_1, deduped_114_1, deduped_115_1, deduped_116_1, deduped_117_1, deduped_118_1, deduped_119_1, deduped_120_1, deduped_121_1, deduped_122_1, deduped_123_1, deduped_124_1, deduped_125_1, deduped_126_1, deduped_127_1, deduped_128_1, deduped_129_1, deduped_130_1, deduped_131_1, deduped_132_1, deduped_133_1, deduped_134_1, deduped_135_1, deduped_136_1, deduped_137_1, deduped_138_1, deduped_139_1, deduped_140_1, deduped_141_1, deduped_142_1;
    deduped_142_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_141_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( b_1 );
    deduped_140_1 := UnderlyingCategory( cat_1 );
    deduped_139_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( a_1 );
    deduped_138_1 := deduped_139_1[4];
    deduped_137_1 := deduped_141_1[4];
    deduped_136_1 := deduped_141_1[2];
    deduped_135_1 := deduped_141_1[1];
    deduped_134_1 := CreateCapCategoryObjectWithAttributes( deduped_140_1, IndexOfObject, 1 );
    deduped_133_1 := deduped_139_1[2];
    deduped_132_1 := CreateCapCategoryObjectWithAttributes( deduped_140_1, IndexOfObject, 0 );
    deduped_131_1 := deduped_139_1[1];
    deduped_130_1 := deduped_131_1 + deduped_133_1;
    deduped_129_1 := CreateCapCategoryObjectWithAttributes( deduped_142_1, Length, deduped_133_1 );
    deduped_128_1 := CreateCapCategoryObjectWithAttributes( deduped_142_1, Length, deduped_131_1 );
    deduped_127_1 := CreateCapCategoryMorphismWithAttributes( deduped_140_1, deduped_132_1, deduped_134_1, IndexOfMorphism, 3 );
    deduped_126_1 := CreateCapCategoryMorphismWithAttributes( deduped_140_1, deduped_132_1, deduped_134_1, IndexOfMorphism, 2 );
    deduped_125_1 := CreateCapCategoryMorphismWithAttributes( deduped_140_1, deduped_134_1, deduped_132_1, IndexOfMorphism, 1 );
    deduped_124_1 := 3 * deduped_133_1;
    deduped_123_1 := 2 * deduped_131_1;
    deduped_122_1 := ListWithIdenticalEntries( deduped_133_1, deduped_134_1 );
    deduped_121_1 := ListWithIdenticalEntries( deduped_131_1, deduped_132_1 );
    deduped_120_1 := [ 0 .. deduped_133_1 - 1 ];
    deduped_119_1 := [ 0 .. deduped_131_1 - 1 ];
    deduped_118_1 := CreateCapCategoryObjectWithAttributes( deduped_142_1, Length, deduped_124_1 );
    deduped_117_1 := CreateCapCategoryObjectWithAttributes( deduped_142_1, Length, deduped_123_1 );
    deduped_116_1 := deduped_123_1 + deduped_124_1;
    deduped_115_1 := ListWithIdenticalEntries( deduped_124_1, deduped_134_1 );
    deduped_114_1 := ListWithIdenticalEntries( deduped_123_1, deduped_132_1 );
    deduped_113_1 := [ 0 .. deduped_130_1 - 1 ];
    deduped_112_1 := [ 0 .. deduped_124_1 - 1 ];
    deduped_111_1 := [ 0 .. deduped_123_1 - 1 ];
    deduped_110_1 := [ 0 .. deduped_116_1 - 1 ];
    deduped_109_1 := [ 0 .. Sum( [ deduped_131_1, deduped_133_1, deduped_133_1 ] ) - 1 ];
    deduped_108_1 := [ 0 .. Sum( [ deduped_123_1, deduped_124_1, deduped_124_1 ] ) - 1 ];
    deduped_2_1 := [ deduped_135_1, deduped_136_1 ];
    deduped_1_1 := [ deduped_132_1, deduped_134_1 ];
    deduped_105_1 := Concatenation( List( deduped_114_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_115_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ) );
    deduped_103_1 := Product( deduped_105_1 );
    deduped_97_1 := [ 0 .. deduped_103_1 - 1 ];
    deduped_107_1 := List( deduped_112_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + (i_2 + deduped_123_1);
            hoisted_2_2 := deduped_105_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_105_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_97_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_104_1 := Concatenation( List( deduped_121_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_122_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ) );
    deduped_102_1 := Product( deduped_104_1 );
    deduped_96_1 := [ 0 .. deduped_102_1 - 1 ];
    deduped_106_1 := List( deduped_120_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + (i_2 + deduped_131_1);
            hoisted_2_2 := deduped_104_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_104_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_96_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_72_1 := List( deduped_120_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, 1 ), deduped_133_1 );
        end );
    deduped_71_1 := List( deduped_119_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, 1 ), deduped_131_1 );
        end );
    deduped_101_1 := ListOfValues( [ CreateCapCategoryMorphismWithAttributes( deduped_142_1, deduped_128_1, deduped_117_1, AsList, List( deduped_119_1, function ( i_2 )
                    return 1 + deduped_71_1[(1 + i_2)] * 2;
                end ) ), CreateCapCategoryMorphismWithAttributes( deduped_142_1, deduped_129_1, deduped_118_1, AsList, List( deduped_120_1, function ( i_2 )
                    return 2 + deduped_72_1[(1 + i_2)] * 3;
                end ) ) ] );
    deduped_100_1 := ListOfValues( [ CreateCapCategoryMorphismWithAttributes( deduped_142_1, deduped_128_1, deduped_117_1, AsList, List( deduped_119_1, function ( i_2 )
                    return deduped_71_1[(1 + i_2)] * 2;
                end ) ), CreateCapCategoryMorphismWithAttributes( deduped_142_1, deduped_129_1, deduped_118_1, AsList, List( deduped_120_1, function ( i_2 )
                    return 1 + deduped_72_1[(1 + i_2)] * 3;
                end ) ) ] );
    deduped_99_1 := ListWithIdenticalEntries( Length( deduped_112_1 ), deduped_103_1 );
    deduped_98_1 := ListWithIdenticalEntries( Length( deduped_120_1 ), deduped_102_1 );
    deduped_95_1 := [ 1 .. Length( deduped_101_1 ) ];
    deduped_94_1 := [ 1 .. Length( deduped_100_1 ) ];
    hoisted_55_1 := [ 0, 0, 0 ];
    deduped_93_1 := ListOfValues( [ CreateCapCategoryMorphismWithAttributes( deduped_142_1, deduped_117_1, deduped_128_1, AsList, List( deduped_111_1, function ( i_2 )
                    return REM_INT( QUO_INT( i_2, 2 ), deduped_131_1 );
                end ) ), CreateCapCategoryMorphismWithAttributes( deduped_142_1, deduped_118_1, deduped_129_1, AsList, List( deduped_112_1, function ( i_2 )
                    local deduped_1_2;
                    deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
                    return CAP_JIT_INCOMPLETE_LOGIC( hoisted_55_1[1 + REM_INT( deduped_1_2, 3 )] ) + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( deduped_1_2, 3 ), deduped_133_1 ) );
                end ) ) ] );
    hoisted_48_1 := Concatenation( List( deduped_111_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + i_2;
              hoisted_2_2 := deduped_105_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_105_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_97_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), deduped_107_1, deduped_107_1 );
    deduped_13_1 := [ deduped_141_1[3], List( deduped_137_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_137_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_12_1 := [ deduped_125_1, deduped_126_1, deduped_127_1 ];
    deduped_11_1 := [ 0, 1, 2, 3, 4, 5, 6 ];
    deduped_10_1 := [ 0, 0, 1, 1, 1, 1, 1 ];
    deduped_9_1 := [ 0, 1, 0, 0, 1, 1, 1 ];
    deduped_8_1 := [ 0, 4 ];
    hoisted_47_1 := Concatenation( List( ListWithIdenticalEntries( deduped_123_1, deduped_125_1 ), function ( morB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := IndexOfMorphism( morB_2 );
              deduped_6_2 := IndexOfObject( Range( morB_2 ) );
              deduped_5_2 := IndexOfObject( Source( morB_2 ) );
              deduped_4_2 := 1 + deduped_8_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_9_1[deduped_4_2] and deduped_6_2 = deduped_10_1[deduped_4_2] then
                              return deduped_7_2 = deduped_11_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePositionProperty( deduped_12_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_124_1, deduped_126_1 ), function ( morB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := IndexOfMorphism( morB_2 );
              deduped_6_2 := IndexOfObject( Range( morB_2 ) );
              deduped_5_2 := IndexOfObject( Source( morB_2 ) );
              deduped_4_2 := 1 + deduped_8_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_9_1[deduped_4_2] and deduped_6_2 = deduped_10_1[deduped_4_2] then
                              return deduped_7_2 = deduped_11_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePositionProperty( deduped_12_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_124_1, deduped_127_1 ), function ( morB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := IndexOfMorphism( morB_2 );
              deduped_6_2 := IndexOfObject( Range( morB_2 ) );
              deduped_5_2 := IndexOfObject( Source( morB_2 ) );
              deduped_4_2 := 1 + deduped_8_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_9_1[deduped_4_2] and deduped_6_2 = deduped_10_1[deduped_4_2] then
                              return deduped_7_2 = deduped_11_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePositionProperty( deduped_12_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ) );
    deduped_30_1 := Concatenation( ListWithIdenticalEntries( Length( deduped_111_1 ), deduped_103_1 ), deduped_99_1, deduped_99_1 );
    hoisted_49_1 := List( deduped_108_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_47_1[deduped_3_2];
            hoisted_1_2 := hoisted_48_1[deduped_3_2];
            return List( [ 0 .. deduped_30_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_37_1 := [ 1, 0, 1 ];
    deduped_17_1 := List( deduped_138_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_38_1 := List( deduped_112_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( hoisted_37_1[1 + REM_INT( deduped_1_2, 3 )] ) + CAP_JIT_INCOMPLETE_LOGIC( deduped_17_1[(1 + REM_INT( QUO_INT( deduped_1_2, 3 ), deduped_133_1 ))] ) * 2;
        end );
    hoisted_35_1 := [ 0, 0, 1 ];
    deduped_15_1 := List( deduped_138_1, function ( a_2 )
            return a_2[1];
        end );
    deduped_36_1 := List( deduped_112_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( hoisted_35_1[1 + REM_INT( deduped_1_2, 3 )] ) + CAP_JIT_INCOMPLETE_LOGIC( deduped_15_1[(1 + REM_INT( QUO_INT( deduped_1_2, 3 ), deduped_133_1 ))] ) * 2;
        end );
    deduped_34_1 := Concatenation( List( deduped_114_1, IndexOfObject ), List( deduped_115_1, IndexOfObject ) );
    hoisted_31_1 := [ 1, 2 ];
    deduped_5_1 := deduped_139_1[3];
    deduped_32_1 := List( deduped_111_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( hoisted_31_1[1 + REM_INT( deduped_1_2, 2 )] ) + CAP_JIT_INCOMPLETE_LOGIC( deduped_5_1[(1 + REM_INT( QUO_INT( deduped_1_2, 2 ), deduped_131_1 ))] ) * 3;
        end );
    hoisted_44_1 := Concatenation( List( deduped_111_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_34_1[1 + (deduped_32_1[1 + i_2] + deduped_123_1)];
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_112_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_34_1[1 + deduped_36_1[(1 + i_2)]];
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_112_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_34_1[1 + deduped_38_1[(1 + i_2)]];
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ) );
    deduped_45_1 := List( deduped_108_1, function ( j_2 )
            return Product( hoisted_44_1{[ 1 .. j_2 ]} );
        end );
    hoisted_42_1 := Concatenation( List( deduped_111_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + (deduped_32_1[1 + i_2] + deduped_123_1);
              hoisted_2_2 := deduped_105_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_105_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_97_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_112_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_36_1[(1 + i_2)];
              hoisted_2_2 := deduped_105_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_105_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_97_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_112_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_38_1[(1 + i_2)];
              hoisted_2_2 := deduped_105_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_105_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_97_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_39_1 := Concatenation( List( deduped_111_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_8_1[(1 + deduped_34_1[(1 + (deduped_32_1[1 + i_2] + deduped_123_1))])];
              deduped_7_2 := deduped_11_1[deduped_8_2];
              deduped_6_2 := deduped_10_1[deduped_8_2];
              deduped_5_2 := deduped_9_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_8_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_9_1[deduped_4_2] and deduped_6_2 = deduped_10_1[deduped_4_2] then
                              return deduped_7_2 = deduped_11_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePositionProperty( deduped_12_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( deduped_112_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_8_1[(1 + deduped_34_1[(1 + deduped_36_1[(1 + i_2)])])];
              deduped_7_2 := deduped_11_1[deduped_8_2];
              deduped_6_2 := deduped_10_1[deduped_8_2];
              deduped_5_2 := deduped_9_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_8_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_9_1[deduped_4_2] and deduped_6_2 = deduped_10_1[deduped_4_2] then
                              return deduped_7_2 = deduped_11_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePositionProperty( deduped_12_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( deduped_112_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_8_1[(1 + deduped_34_1[(1 + deduped_38_1[(1 + i_2)])])];
              deduped_7_2 := deduped_11_1[deduped_8_2];
              deduped_6_2 := deduped_10_1[deduped_8_2];
              deduped_5_2 := deduped_9_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_8_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_9_1[deduped_4_2] and deduped_6_2 = deduped_10_1[deduped_4_2] then
                              return deduped_7_2 = deduped_11_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePositionProperty( deduped_12_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ) );
    hoisted_43_1 := List( deduped_108_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_39_1[deduped_3_2];
            hoisted_1_2 := hoisted_42_1[deduped_3_2];
            return List( [ 0 .. deduped_30_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_92_1 := Filtered( deduped_97_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_108_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_43_1[deduped_1_3][deduped_1_2] * deduped_45_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_108_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_49_1[deduped_1_3][deduped_1_2] * deduped_45_1[deduped_1_3];
                    end ) );
        end );
    hoisted_28_1 := Concatenation( List( deduped_119_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + i_2;
              hoisted_2_2 := deduped_104_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_104_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_96_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), deduped_106_1, deduped_106_1 );
    hoisted_27_1 := Concatenation( List( ListWithIdenticalEntries( deduped_131_1, deduped_125_1 ), function ( morB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := IndexOfMorphism( morB_2 );
              deduped_6_2 := IndexOfObject( Range( morB_2 ) );
              deduped_5_2 := IndexOfObject( Source( morB_2 ) );
              deduped_4_2 := 1 + deduped_8_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_9_1[deduped_4_2] and deduped_6_2 = deduped_10_1[deduped_4_2] then
                              return deduped_7_2 = deduped_11_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePositionProperty( deduped_12_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_133_1, deduped_126_1 ), function ( morB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := IndexOfMorphism( morB_2 );
              deduped_6_2 := IndexOfObject( Range( morB_2 ) );
              deduped_5_2 := IndexOfObject( Source( morB_2 ) );
              deduped_4_2 := 1 + deduped_8_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_9_1[deduped_4_2] and deduped_6_2 = deduped_10_1[deduped_4_2] then
                              return deduped_7_2 = deduped_11_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePositionProperty( deduped_12_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_133_1, deduped_127_1 ), function ( morB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := IndexOfMorphism( morB_2 );
              deduped_6_2 := IndexOfObject( Range( morB_2 ) );
              deduped_5_2 := IndexOfObject( Source( morB_2 ) );
              deduped_4_2 := 1 + deduped_8_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_9_1[deduped_4_2] and deduped_6_2 = deduped_10_1[deduped_4_2] then
                              return deduped_7_2 = deduped_11_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePositionProperty( deduped_12_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ) );
    deduped_3_1 := Concatenation( ListWithIdenticalEntries( Length( deduped_119_1 ), deduped_102_1 ), deduped_98_1, deduped_98_1 );
    hoisted_29_1 := List( deduped_109_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_27_1[deduped_3_2];
            hoisted_1_2 := hoisted_28_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_18_1 := List( deduped_120_1, function ( i_2 )
            return deduped_17_1[1 + REM_INT( QUO_INT( i_2, 1 ), deduped_133_1 )];
        end );
    deduped_16_1 := List( deduped_120_1, function ( i_2 )
            return deduped_15_1[1 + REM_INT( QUO_INT( i_2, 1 ), deduped_133_1 )];
        end );
    deduped_7_1 := Concatenation( List( deduped_121_1, IndexOfObject ), List( deduped_122_1, IndexOfObject ) );
    deduped_6_1 := List( deduped_119_1, function ( i_2 )
            return deduped_5_1[1 + REM_INT( QUO_INT( i_2, 1 ), deduped_131_1 )];
        end );
    hoisted_24_1 := Concatenation( List( deduped_119_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_7_1[1 + (deduped_6_1[1 + i_2] + deduped_131_1)];
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_120_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_7_1[1 + deduped_16_1[(1 + i_2)]];
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_120_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_7_1[1 + deduped_18_1[(1 + i_2)]];
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ) );
    deduped_25_1 := List( deduped_109_1, function ( j_2 )
            return Product( hoisted_24_1{[ 1 .. j_2 ]} );
        end );
    hoisted_22_1 := Concatenation( List( deduped_119_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + (deduped_6_1[1 + i_2] + deduped_131_1);
              hoisted_2_2 := deduped_104_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_104_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_96_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_120_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_16_1[(1 + i_2)];
              hoisted_2_2 := deduped_104_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_104_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_96_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_120_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_18_1[(1 + i_2)];
              hoisted_2_2 := deduped_104_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_104_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_96_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_19_1 := Concatenation( List( deduped_119_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_8_1[(1 + deduped_7_1[(1 + (deduped_6_1[1 + i_2] + deduped_131_1))])];
              deduped_7_2 := deduped_11_1[deduped_8_2];
              deduped_6_2 := deduped_10_1[deduped_8_2];
              deduped_5_2 := deduped_9_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_8_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_9_1[deduped_4_2] and deduped_6_2 = deduped_10_1[deduped_4_2] then
                              return deduped_7_2 = deduped_11_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePositionProperty( deduped_12_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( deduped_120_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_8_1[(1 + deduped_7_1[(1 + deduped_16_1[(1 + i_2)])])];
              deduped_7_2 := deduped_11_1[deduped_8_2];
              deduped_6_2 := deduped_10_1[deduped_8_2];
              deduped_5_2 := deduped_9_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_8_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_9_1[deduped_4_2] and deduped_6_2 = deduped_10_1[deduped_4_2] then
                              return deduped_7_2 = deduped_11_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePositionProperty( deduped_12_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( deduped_120_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_8_1[(1 + deduped_7_1[(1 + deduped_18_1[(1 + i_2)])])];
              deduped_7_2 := deduped_11_1[deduped_8_2];
              deduped_6_2 := deduped_10_1[deduped_8_2];
              deduped_5_2 := deduped_9_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_8_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_9_1[deduped_4_2] and deduped_6_2 = deduped_10_1[deduped_4_2] then
                              return deduped_7_2 = deduped_11_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePositionProperty( deduped_12_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ) );
    hoisted_23_1 := List( deduped_109_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_19_1[deduped_3_2];
            hoisted_1_2 := hoisted_22_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_91_1 := Filtered( deduped_96_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_109_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_23_1[deduped_1_3][deduped_1_2] * deduped_25_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_109_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_29_1[deduped_1_3][deduped_1_2] * deduped_25_1[deduped_1_3];
                    end ) );
        end );
    deduped_90_1 := Length( deduped_92_1 );
    deduped_89_1 := Length( deduped_91_1 );
    deduped_88_1 := [ 1 .. Length( deduped_93_1 ) ];
    deduped_84_1 := List( deduped_101_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_82_1 := List( deduped_101_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_86_1 := Concatenation( List( deduped_95_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := Sum( deduped_84_1{[ 1 .. i_2 - 1 ]} );
              hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_84_1[i_2] - 1 ];
              hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( AsList( CAP_JIT_INCOMPLETE_LOGIC( deduped_101_1[i_2] ) ) );
              return List( [ 0 .. deduped_82_1[i_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + hoisted_2_2[(1 + hoisted_1_2[(1 + i_3)])];
                      hoisted_2_3 := deduped_105_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_105_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_97_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_83_1 := Concatenation( List( deduped_95_1, function ( i_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_82_1[i_2] - 1 ] ), deduped_103_1 );
          end ) );
    deduped_76_1 := Concatenation( List( deduped_121_1, function ( objB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_8_1[(1 + IndexOfObject( objB_2 ))];
              deduped_7_2 := deduped_11_1[deduped_8_2];
              deduped_6_2 := deduped_10_1[deduped_8_2];
              deduped_5_2 := deduped_9_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_8_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_9_1[deduped_4_2] and deduped_6_2 = deduped_10_1[deduped_4_2] then
                              return deduped_7_2 = deduped_11_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePositionProperty( deduped_12_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( deduped_122_1, function ( objB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_8_1[(1 + IndexOfObject( objB_2 ))];
              deduped_7_2 := deduped_11_1[deduped_8_2];
              deduped_6_2 := deduped_10_1[deduped_8_2];
              deduped_5_2 := deduped_9_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_8_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_9_1[deduped_4_2] and deduped_6_2 = deduped_10_1[deduped_4_2] then
                              return deduped_7_2 = deduped_11_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePositionProperty( deduped_12_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ) );
    hoisted_87_1 := List( [ 0 .. Sum( List( deduped_95_1, function ( i_2 )
                      return Length( [ 0 .. deduped_82_1[i_2] - 1 ] );
                  end ) ) - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := deduped_76_1[deduped_3_2];
            hoisted_1_2 := hoisted_86_1[deduped_3_2];
            return List( [ 0 .. hoisted_83_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_69_1 := List( deduped_113_1, function ( j_2 )
            return Product( deduped_104_1{[ 1 .. j_2 ]} );
        end );
    deduped_50_1 := [ [ 0 .. deduped_135_1 - 1 ], [ 0 .. deduped_136_1 - 1 ] ];
    hoisted_67_1 := Concatenation( List( deduped_121_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_50_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_122_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_50_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ) );
    hoisted_68_1 := List( [ 1 .. deduped_130_1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_67_1[i_2];
            hoisted_2_2 := deduped_104_1[i_2];
            hoisted_1_2 := Product( deduped_104_1{[ 1 .. i_2 - 1 ]} );
            return List( deduped_96_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    deduped_81_1 := List( deduped_96_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_113_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_68_1[deduped_1_3][hoisted_1_2] * deduped_69_1[deduped_1_3];
                end );
        end );
    deduped_77_1 := List( deduped_100_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_73_1 := List( deduped_100_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_79_1 := Concatenation( List( deduped_94_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := Sum( deduped_77_1{[ 1 .. i_2 - 1 ]} );
              hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_77_1[i_2] - 1 ];
              hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( AsList( CAP_JIT_INCOMPLETE_LOGIC( deduped_100_1[i_2] ) ) );
              return List( [ 0 .. deduped_73_1[i_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + hoisted_2_2[(1 + hoisted_1_2[(1 + i_3)])];
                      hoisted_2_3 := deduped_105_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_105_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_97_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_75_1 := Concatenation( List( deduped_94_1, function ( i_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_73_1[i_2] - 1 ] ), deduped_103_1 );
          end ) );
    hoisted_80_1 := List( [ 0 .. Sum( List( deduped_94_1, function ( i_2 )
                      return Length( [ 0 .. deduped_73_1[i_2] - 1 ] );
                  end ) ) - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := deduped_76_1[deduped_3_2];
            hoisted_1_2 := hoisted_79_1[deduped_3_2];
            return List( [ 0 .. hoisted_75_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_53_1 := List( deduped_110_1, function ( j_2 )
            return Product( deduped_105_1{[ 1 .. j_2 ]} );
        end );
    hoisted_51_1 := Concatenation( List( deduped_114_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_50_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_115_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_50_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ) );
    hoisted_52_1 := List( [ 1 .. deduped_116_1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_51_1[i_2];
            hoisted_2_2 := deduped_105_1[i_2];
            hoisted_1_2 := Product( deduped_105_1{[ 1 .. i_2 - 1 ]} );
            return List( deduped_97_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    hoisted_65_1 := List( deduped_97_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_110_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_52_1[deduped_1_3][hoisted_1_2] * deduped_53_1[deduped_1_3];
                end );
        end );
    deduped_60_1 := List( deduped_93_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_56_1 := List( deduped_93_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_62_1 := Concatenation( List( deduped_88_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := Sum( deduped_60_1{[ 1 .. i_2 - 1 ]} );
              hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_60_1[i_2] - 1 ];
              hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( AsList( CAP_JIT_INCOMPLETE_LOGIC( deduped_93_1[i_2] ) ) );
              return List( [ 0 .. deduped_56_1[i_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + hoisted_2_2[(1 + hoisted_1_2[(1 + i_3)])];
                      hoisted_2_3 := deduped_104_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_104_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_96_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_59_1 := Concatenation( List( deduped_114_1, function ( objB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_8_1[(1 + IndexOfObject( objB_2 ))];
              deduped_7_2 := deduped_11_1[deduped_8_2];
              deduped_6_2 := deduped_10_1[deduped_8_2];
              deduped_5_2 := deduped_9_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_8_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_9_1[deduped_4_2] and deduped_6_2 = deduped_10_1[deduped_4_2] then
                              return deduped_7_2 = deduped_11_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePositionProperty( deduped_12_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( deduped_115_1, function ( objB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_8_1[(1 + IndexOfObject( objB_2 ))];
              deduped_7_2 := deduped_11_1[deduped_8_2];
              deduped_6_2 := deduped_10_1[deduped_8_2];
              deduped_5_2 := deduped_9_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_8_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_9_1[deduped_4_2] and deduped_6_2 = deduped_10_1[deduped_4_2] then
                              return deduped_7_2 = deduped_11_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePositionProperty( deduped_12_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ) );
    hoisted_58_1 := Concatenation( List( deduped_88_1, function ( i_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_56_1[i_2] - 1 ] ), deduped_102_1 );
          end ) );
    hoisted_63_1 := List( [ 0 .. Sum( List( deduped_88_1, function ( i_2 )
                      return Length( [ 0 .. deduped_56_1[i_2] - 1 ] );
                  end ) ) - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_59_1[deduped_3_2];
            hoisted_1_2 := hoisted_62_1[deduped_3_2];
            return List( [ 0 .. hoisted_58_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets, NTuple( 4, deduped_89_1, deduped_90_1, List( [ 0 .. deduped_89_1 - 1 ], function ( x_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_91_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))] );
                return -1 + BigInt( SafePosition( deduped_92_1, CAP_JIT_INCOMPLETE_LOGIC( hoisted_65_1[(1 + Sum( deduped_110_1, function ( j_3 )
                                   local deduped_1_3;
                                   deduped_1_3 := (1 + j_3);
                                   return hoisted_63_1[deduped_1_3][hoisted_1_2] * deduped_53_1[deduped_1_3];
                               end ))] ) ) );
            end ), List( [ 0 .. deduped_90_1 - 1 ], function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_92_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))] );
                return NTuple( 2, -1 + BigInt( SafePosition( deduped_91_1, CAP_JIT_INCOMPLETE_LOGIC( deduped_81_1[(1 + Sum( deduped_113_1, function ( j_3 )
                                     local deduped_1_3;
                                     deduped_1_3 := (1 + j_3);
                                     return hoisted_80_1[deduped_1_3][deduped_1_2] * deduped_69_1[deduped_1_3];
                                 end ))] ) ) ), -1 + BigInt( SafePosition( deduped_91_1, CAP_JIT_INCOMPLETE_LOGIC( deduped_81_1[(1 + Sum( deduped_113_1, function ( j_3 )
                                     local deduped_1_3;
                                     deduped_1_3 := (1 + j_3);
                                     return hoisted_87_1[deduped_1_3][deduped_1_2] * deduped_69_1[deduped_1_3];
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
