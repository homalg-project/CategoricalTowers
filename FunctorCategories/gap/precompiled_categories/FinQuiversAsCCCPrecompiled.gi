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
    local deduped_1_1, deduped_2_1, deduped_3_1, hoisted_4_1, deduped_5_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, hoisted_20_1, hoisted_23_1, hoisted_24_1, deduped_25_1, hoisted_26_1, deduped_27_1, hoisted_29_1, hoisted_31_1, hoisted_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, hoisted_37_1, hoisted_40_1, hoisted_41_1, deduped_42_1, hoisted_43_1, deduped_44_1, hoisted_46_1, hoisted_48_1, hoisted_49_1, deduped_50_1, hoisted_51_1, hoisted_52_1, deduped_53_1, deduped_55_1, deduped_56_1, hoisted_58_1, deduped_59_1, deduped_60_1, hoisted_62_1, hoisted_63_1, deduped_65_1, deduped_67_1, hoisted_68_1, deduped_69_1, hoisted_71_1, hoisted_72_1, deduped_73_1, deduped_74_1, deduped_75_1, deduped_76_1, deduped_77_1, deduped_78_1, deduped_79_1, deduped_80_1, deduped_81_1, deduped_82_1, deduped_83_1, deduped_84_1, deduped_85_1, deduped_86_1, deduped_87_1, deduped_88_1, deduped_89_1, deduped_90_1, deduped_91_1, deduped_92_1, deduped_93_1, deduped_94_1, deduped_95_1, deduped_96_1, deduped_97_1, deduped_98_1, deduped_99_1, deduped_100_1, deduped_101_1, deduped_102_1, deduped_103_1, deduped_104_1, deduped_105_1, deduped_106_1, deduped_107_1, deduped_108_1, deduped_109_1, deduped_110_1, deduped_111_1, deduped_112_1, deduped_113_1, deduped_114_1, deduped_115_1, deduped_116_1, deduped_117_1, deduped_118_1, deduped_119_1;
    deduped_119_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_118_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( b_1 );
    deduped_117_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( a_1 );
    deduped_116_1 := deduped_118_1[3];
    deduped_115_1 := deduped_117_1[3];
    deduped_114_1 := deduped_118_1[2];
    deduped_113_1 := deduped_118_1[1];
    deduped_112_1 := deduped_117_1[2];
    deduped_111_1 := deduped_117_1[1];
    deduped_110_1 := CreateCapCategoryObjectWithAttributes( deduped_119_1, Length, deduped_111_1 );
    deduped_109_1 := 2 * deduped_111_1;
    deduped_108_1 := 0 * deduped_112_1;
    deduped_107_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_106_1 := [ 0 .. deduped_111_1 - 1 ];
    deduped_105_1 := [ 0 .. deduped_112_1 - 1 ];
    deduped_104_1 := CreateCapCategoryObjectWithAttributes( deduped_119_1, Length, deduped_109_1 );
    deduped_103_1 := deduped_111_1 + deduped_108_1;
    deduped_102_1 := CreateCapCategoryObjectWithAttributes( deduped_107_1, IndexOfObject, 1 );
    deduped_101_1 := CreateCapCategoryObjectWithAttributes( deduped_107_1, IndexOfObject, 0 );
    deduped_100_1 := [ 0 .. deduped_112_1 + deduped_112_1 - 1 ];
    deduped_99_1 := [ 0 .. deduped_108_1 - 1 ];
    deduped_98_1 := CreateCapCategoryMorphismWithAttributes( deduped_107_1, deduped_101_1, deduped_102_1, IndexOfMorphism, 2 );
    deduped_97_1 := CreateCapCategoryMorphismWithAttributes( deduped_107_1, deduped_101_1, deduped_102_1, IndexOfMorphism, 1 );
    deduped_96_1 := ListWithIdenticalEntries( deduped_112_1, deduped_102_1 );
    deduped_95_1 := ListWithIdenticalEntries( deduped_109_1, deduped_101_1 );
    deduped_94_1 := ListWithIdenticalEntries( deduped_108_1, deduped_102_1 );
    deduped_93_1 := ListWithIdenticalEntries( deduped_111_1, deduped_101_1 );
    deduped_92_1 := [ 0 .. deduped_103_1 - 1 ];
    deduped_91_1 := [ 0 .. deduped_108_1 + deduped_108_1 - 1 ];
    deduped_2_1 := [ deduped_113_1, deduped_114_1 ];
    deduped_1_1 := [ deduped_101_1, deduped_102_1 ];
    deduped_90_1 := Concatenation( List( deduped_95_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ), List( deduped_96_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ) );
    deduped_89_1 := Concatenation( List( deduped_93_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ), List( deduped_94_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ) );
    deduped_86_1 := Product( deduped_90_1 );
    deduped_81_1 := [ 0 .. deduped_86_1 - 1 ];
    deduped_88_1 := List( deduped_105_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + (i_2 + deduped_109_1);
            hoisted_2_2 := deduped_90_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_90_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_81_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_85_1 := Product( deduped_89_1 );
    deduped_80_1 := [ 0 .. deduped_85_1 - 1 ];
    deduped_87_1 := List( deduped_99_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + (i_2 + deduped_111_1);
            hoisted_2_2 := deduped_89_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_89_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_80_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_4_1 := [  ];
    deduped_5_1 := List( deduped_99_1, function ( i_2 )
            return hoisted_4_1[1 + REM_INT( i_2, 0 )];
        end );
    deduped_84_1 := CreateCapCategoryMorphismWithAttributes( deduped_119_1, CreateCapCategoryObjectWithAttributes( deduped_119_1, Length, deduped_108_1 ), CreateCapCategoryObjectWithAttributes( deduped_119_1, Length, deduped_112_1 ), AsList, List( deduped_99_1, function ( i_2 )
              return deduped_5_1[1 + i_2] + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), 0 ), deduped_112_1 ) ) * 1;
          end ) );
    deduped_83_1 := ListWithIdenticalEntries( Length( deduped_105_1 ), deduped_86_1 );
    deduped_82_1 := ListWithIdenticalEntries( Length( deduped_99_1 ), deduped_85_1 );
    hoisted_48_1 := Concatenation( deduped_88_1, deduped_88_1 );
    deduped_17_1 := [ List( deduped_116_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_116_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_16_1 := [ deduped_97_1, deduped_98_1 ];
    deduped_13_1 := [ 0, 1, 2, 3 ];
    deduped_12_1 := [ 0, 1, 1, 1 ];
    deduped_11_1 := [ 0, 0, 0, 1 ];
    deduped_10_1 := [ 0, 3 ];
    hoisted_46_1 := Concatenation( List( ListWithIdenticalEntries( deduped_112_1, deduped_97_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := IndexOfObject( deduped_3_2 );
              deduped_1_2 := 1 + deduped_10_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_11_1[deduped_1_2] and IndexOfObject( Range( morB_2 ) ) = deduped_12_1[deduped_1_2] then
                              return IndexOfMorphism( morB_2 ) = deduped_13_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_17_1[SafeUniquePosition( deduped_16_1, morB_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_112_1, deduped_98_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := IndexOfObject( deduped_3_2 );
              deduped_1_2 := 1 + deduped_10_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_11_1[deduped_1_2] and IndexOfObject( Range( morB_2 ) ) = deduped_12_1[deduped_1_2] then
                              return IndexOfMorphism( morB_2 ) = deduped_13_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_17_1[SafeUniquePosition( deduped_16_1, morB_2 )];
              fi;
              return;
          end ) );
    deduped_33_1 := Concatenation( deduped_83_1, deduped_83_1 );
    hoisted_49_1 := List( deduped_100_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_46_1[deduped_3_2];
            hoisted_1_2 := hoisted_48_1[deduped_3_2];
            return List( [ 0 .. deduped_33_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_42_1 := Concatenation( deduped_95_1, deduped_96_1 );
    deduped_18_1 := List( deduped_115_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_36_1 := List( deduped_105_1, function ( i_2 )
            return 1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_18_1[(1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), 1 ), deduped_112_1 ))] ) * 2;
        end );
    deduped_7_1 := List( deduped_115_1, function ( a_2 )
            return a_2[1];
        end );
    deduped_34_1 := List( deduped_105_1, function ( i_2 )
            return CAP_JIT_INCOMPLETE_LOGIC( deduped_7_1[(1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), 1 ), deduped_112_1 ))] ) * 2;
        end );
    hoisted_43_1 := Concatenation( List( deduped_105_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_42_1[1 + deduped_34_1[(1 + i_2)]] )];
          end ), List( deduped_105_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_42_1[1 + deduped_36_1[(1 + i_2)]] )];
          end ) );
    deduped_44_1 := List( deduped_100_1, function ( j_2 )
            return Product( hoisted_43_1{[ 1 .. j_2 ]} );
        end );
    hoisted_40_1 := Concatenation( List( deduped_105_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_34_1[(1 + i_2)];
              hoisted_2_2 := deduped_90_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_90_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_81_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_105_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_36_1[(1 + i_2)];
              hoisted_2_2 := deduped_90_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_90_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_81_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_35_1 := Concatenation( List( deduped_95_1, IndexOfObject ), List( deduped_96_1, IndexOfObject ) );
    deduped_15_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_107_1, deduped_101_1, deduped_101_1, IndexOfMorphism, 0 ), deduped_97_1, deduped_98_1, CreateCapCategoryMorphismWithAttributes( deduped_107_1, deduped_102_1, deduped_102_1, IndexOfMorphism, 3 ) ];
    deduped_14_1 := [ deduped_101_1, deduped_101_1, deduped_101_1, deduped_102_1 ];
    hoisted_37_1 := Concatenation( List( deduped_105_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_10_1[(1 + deduped_35_1[(1 + deduped_34_1[(1 + i_2)])])];
              deduped_2_2 := deduped_11_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_10_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_11_1[deduped_1_2] and deduped_12_1[deduped_3_2] = deduped_12_1[deduped_1_2] then
                              return deduped_13_1[deduped_3_2] = deduped_13_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_14_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_17_1[SafeUniquePosition( deduped_16_1, deduped_15_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_105_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_10_1[(1 + deduped_35_1[(1 + deduped_36_1[(1 + i_2)])])];
              deduped_2_2 := deduped_11_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_10_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_11_1[deduped_1_2] and deduped_12_1[deduped_3_2] = deduped_12_1[deduped_1_2] then
                              return deduped_13_1[deduped_3_2] = deduped_13_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_14_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_17_1[SafeUniquePosition( deduped_16_1, deduped_15_1[deduped_3_2] )];
              fi;
              return;
          end ) );
    hoisted_41_1 := List( deduped_100_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_37_1[deduped_3_2];
            hoisted_1_2 := hoisted_40_1[deduped_3_2];
            return List( [ 0 .. deduped_33_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_79_1 := Filtered( deduped_81_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_100_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_41_1[deduped_1_3][deduped_1_2] * deduped_44_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_100_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_49_1[deduped_1_3][deduped_1_2] * deduped_44_1[deduped_1_3];
                    end ) );
        end );
    hoisted_31_1 := Concatenation( deduped_87_1, deduped_87_1 );
    hoisted_29_1 := Concatenation( List( ListWithIdenticalEntries( deduped_108_1, deduped_97_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := IndexOfObject( deduped_3_2 );
              deduped_1_2 := 1 + deduped_10_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_11_1[deduped_1_2] and IndexOfObject( Range( morB_2 ) ) = deduped_12_1[deduped_1_2] then
                              return IndexOfMorphism( morB_2 ) = deduped_13_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_17_1[SafeUniquePosition( deduped_16_1, morB_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_108_1, deduped_98_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := IndexOfObject( deduped_3_2 );
              deduped_1_2 := 1 + deduped_10_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_11_1[deduped_1_2] and IndexOfObject( Range( morB_2 ) ) = deduped_12_1[deduped_1_2] then
                              return IndexOfMorphism( morB_2 ) = deduped_13_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_17_1[SafeUniquePosition( deduped_16_1, morB_2 )];
              fi;
              return;
          end ) );
    deduped_3_1 := Concatenation( deduped_82_1, deduped_82_1 );
    hoisted_32_1 := List( deduped_91_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_29_1[deduped_3_2];
            hoisted_1_2 := hoisted_31_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_25_1 := Concatenation( deduped_93_1, deduped_94_1 );
    deduped_19_1 := List( deduped_99_1, function ( i_2 )
            return deduped_5_1[1 + i_2] + CAP_JIT_INCOMPLETE_LOGIC( deduped_18_1[(1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), 0 ), deduped_112_1 ))] ) * 1;
        end );
    deduped_8_1 := List( deduped_99_1, function ( i_2 )
            return deduped_5_1[1 + i_2] + CAP_JIT_INCOMPLETE_LOGIC( deduped_7_1[(1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), 0 ), deduped_112_1 ))] ) * 1;
        end );
    hoisted_26_1 := Concatenation( List( deduped_99_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_25_1[1 + deduped_8_1[(1 + i_2)]] )];
          end ), List( deduped_99_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_25_1[1 + deduped_19_1[(1 + i_2)]] )];
          end ) );
    deduped_27_1 := List( deduped_91_1, function ( j_2 )
            return Product( hoisted_26_1{[ 1 .. j_2 ]} );
        end );
    hoisted_23_1 := Concatenation( List( deduped_99_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_8_1[(1 + i_2)];
              hoisted_2_2 := deduped_89_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_89_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_80_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_99_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_19_1[(1 + i_2)];
              hoisted_2_2 := deduped_89_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_89_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_80_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_9_1 := Concatenation( List( deduped_93_1, IndexOfObject ), List( deduped_94_1, IndexOfObject ) );
    hoisted_20_1 := Concatenation( List( deduped_99_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_10_1[(1 + deduped_9_1[(1 + deduped_8_1[(1 + i_2)])])];
              deduped_2_2 := deduped_11_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_10_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_11_1[deduped_1_2] and deduped_12_1[deduped_3_2] = deduped_12_1[deduped_1_2] then
                              return deduped_13_1[deduped_3_2] = deduped_13_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_14_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_17_1[SafeUniquePosition( deduped_16_1, deduped_15_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_99_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_10_1[(1 + deduped_9_1[(1 + deduped_19_1[(1 + i_2)])])];
              deduped_2_2 := deduped_11_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_10_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_11_1[deduped_1_2] and deduped_12_1[deduped_3_2] = deduped_12_1[deduped_1_2] then
                              return deduped_13_1[deduped_3_2] = deduped_13_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_14_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_17_1[SafeUniquePosition( deduped_16_1, deduped_15_1[deduped_3_2] )];
              fi;
              return;
          end ) );
    hoisted_24_1 := List( deduped_91_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_20_1[deduped_3_2];
            hoisted_1_2 := hoisted_23_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_78_1 := Filtered( deduped_80_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_91_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_24_1[deduped_1_3][deduped_1_2] * deduped_27_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_91_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_32_1[deduped_1_3][deduped_1_2] * deduped_27_1[deduped_1_3];
                    end ) );
        end );
    deduped_55_1 := List( deduped_106_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, 1 ), deduped_111_1 );
        end );
    deduped_77_1 := ListOfValues( [ CreateCapCategoryMorphismWithAttributes( deduped_119_1, deduped_110_1, deduped_104_1, AsList, List( deduped_106_1, function ( i_2 )
                    return 1 + deduped_55_1[(1 + i_2)] * 2;
                end ) ), deduped_84_1 ] );
    deduped_76_1 := ListOfValues( [ CreateCapCategoryMorphismWithAttributes( deduped_119_1, deduped_110_1, deduped_104_1, AsList, List( deduped_106_1, function ( i_2 )
                    return deduped_55_1[(1 + i_2)] * 2;
                end ) ), deduped_84_1 ] );
    deduped_75_1 := Length( deduped_79_1 );
    deduped_74_1 := [ 1 .. Length( deduped_77_1 ) ];
    deduped_73_1 := [ 1 .. Length( deduped_76_1 ) ];
    deduped_69_1 := List( deduped_77_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_67_1 := List( deduped_77_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_71_1 := Concatenation( List( deduped_74_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := Sum( deduped_69_1{[ 1 .. i_2 - 1 ]} );
              hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_69_1[i_2] - 1 ];
              hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( AsList( CAP_JIT_INCOMPLETE_LOGIC( deduped_77_1[i_2] ) ) );
              return List( [ 0 .. deduped_67_1[i_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + hoisted_2_2[(1 + hoisted_1_2[(1 + i_3)])];
                      hoisted_2_3 := deduped_90_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_90_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_81_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_68_1 := Concatenation( List( deduped_74_1, function ( i_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_67_1[i_2] - 1 ] ), deduped_86_1 );
          end ) );
    deduped_59_1 := Concatenation( List( deduped_93_1, function ( objB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_10_1[(1 + IndexOfObject( objB_2 ))];
              deduped_2_2 := deduped_11_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_10_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_11_1[deduped_1_2] and deduped_12_1[deduped_3_2] = deduped_12_1[deduped_1_2] then
                              return deduped_13_1[deduped_3_2] = deduped_13_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_14_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_17_1[SafeUniquePosition( deduped_16_1, deduped_15_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_94_1, function ( objB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_10_1[(1 + IndexOfObject( objB_2 ))];
              deduped_2_2 := deduped_11_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_10_1[(1 + deduped_2_2)];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_11_1[deduped_1_2] and deduped_12_1[deduped_3_2] = deduped_12_1[deduped_1_2] then
                              return deduped_13_1[deduped_3_2] = deduped_13_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_14_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_17_1[SafeUniquePosition( deduped_16_1, deduped_15_1[deduped_3_2] )];
              fi;
              return;
          end ) );
    hoisted_72_1 := List( [ 0 .. Sum( List( deduped_74_1, function ( i_2 )
                      return Length( [ 0 .. deduped_67_1[i_2] - 1 ] );
                  end ) ) - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := deduped_59_1[deduped_3_2];
            hoisted_1_2 := hoisted_71_1[deduped_3_2];
            return List( [ 0 .. hoisted_68_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_53_1 := List( deduped_92_1, function ( j_2 )
            return Product( deduped_89_1{[ 1 .. j_2 ]} );
        end );
    deduped_50_1 := [ [ 0 .. deduped_113_1 - 1 ], [ 0 .. deduped_114_1 - 1 ] ];
    hoisted_51_1 := Concatenation( List( deduped_93_1, function ( objB_2 )
              return deduped_50_1[SafePosition( deduped_1_1, objB_2 )];
          end ), List( deduped_94_1, function ( objB_2 )
              return deduped_50_1[SafePosition( deduped_1_1, objB_2 )];
          end ) );
    hoisted_52_1 := List( [ 1 .. deduped_103_1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_51_1[i_2];
            hoisted_2_2 := deduped_89_1[i_2];
            hoisted_1_2 := Product( deduped_89_1{[ 1 .. i_2 - 1 ]} );
            return List( deduped_80_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    deduped_65_1 := List( deduped_80_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_92_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_52_1[deduped_1_3][hoisted_1_2] * deduped_53_1[deduped_1_3];
                end );
        end );
    deduped_60_1 := List( deduped_76_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_56_1 := List( deduped_76_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_62_1 := Concatenation( List( deduped_73_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := Sum( deduped_60_1{[ 1 .. i_2 - 1 ]} );
              hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_60_1[i_2] - 1 ];
              hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( AsList( CAP_JIT_INCOMPLETE_LOGIC( deduped_76_1[i_2] ) ) );
              return List( [ 0 .. deduped_56_1[i_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + hoisted_2_2[(1 + hoisted_1_2[(1 + i_3)])];
                      hoisted_2_3 := deduped_90_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_90_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_81_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_58_1 := Concatenation( List( deduped_73_1, function ( i_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_56_1[i_2] - 1 ] ), deduped_86_1 );
          end ) );
    hoisted_63_1 := List( [ 0 .. Sum( List( deduped_73_1, function ( i_2 )
                      return Length( [ 0 .. deduped_56_1[i_2] - 1 ] );
                  end ) ) - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := deduped_59_1[deduped_3_2];
            hoisted_1_2 := hoisted_62_1[deduped_3_2];
            return List( [ 0 .. hoisted_58_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfQuiverEnrichedOverSkeletalFinSets, NTuple( 3, Length( deduped_78_1 ), deduped_75_1, List( [ 0 .. deduped_75_1 - 1 ], function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_79_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))] );
                return NTuple( 2, -1 + BigInt( SafePosition( deduped_78_1, CAP_JIT_INCOMPLETE_LOGIC( deduped_65_1[(1 + Sum( deduped_92_1, function ( j_3 )
                                     local deduped_1_3;
                                     deduped_1_3 := (1 + j_3);
                                     return hoisted_63_1[deduped_1_3][deduped_1_2] * deduped_53_1[deduped_1_3];
                                 end ))] ) ) ), -1 + BigInt( SafePosition( deduped_78_1, CAP_JIT_INCOMPLETE_LOGIC( deduped_65_1[(1 + Sum( deduped_92_1, function ( j_3 )
                                     local deduped_1_3;
                                     deduped_1_3 := (1 + j_3);
                                     return hoisted_72_1[deduped_1_3][deduped_1_2] * deduped_53_1[deduped_1_3];
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
