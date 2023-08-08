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
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, hoisted_19_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, deduped_25_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, deduped_30_1, hoisted_31_1, deduped_32_1, deduped_34_1, hoisted_35_1, deduped_36_1, hoisted_37_1, deduped_38_1, hoisted_39_1, hoisted_42_1, hoisted_43_1, hoisted_44_1, deduped_45_1, hoisted_47_1, hoisted_48_1, hoisted_49_1, deduped_50_1, hoisted_51_1, hoisted_52_1, deduped_53_1, hoisted_55_1, hoisted_56_1, hoisted_57_1, hoisted_58_1, hoisted_59_1, hoisted_60_1, hoisted_62_1, hoisted_64_1, hoisted_65_1, deduped_66_1, deduped_68_1, deduped_69_1, deduped_70_1, hoisted_71_1, hoisted_72_1, deduped_73_1, hoisted_74_1, hoisted_75_1, deduped_76_1, deduped_77_1, deduped_78_1, deduped_79_1, deduped_80_1, deduped_81_1, deduped_82_1, deduped_83_1, deduped_84_1, deduped_85_1, deduped_86_1, deduped_87_1, deduped_88_1, deduped_89_1, deduped_90_1, deduped_91_1, deduped_92_1, deduped_93_1, deduped_94_1, deduped_95_1, deduped_96_1, deduped_97_1, deduped_98_1, deduped_99_1, deduped_100_1, deduped_101_1, deduped_102_1, deduped_103_1, deduped_104_1, deduped_105_1, deduped_106_1, deduped_107_1, deduped_108_1, deduped_109_1, deduped_110_1, deduped_111_1, deduped_112_1, deduped_113_1, deduped_114_1, deduped_115_1, deduped_116_1, deduped_117_1, deduped_118_1, deduped_119_1, deduped_120_1, deduped_121_1, deduped_122_1, deduped_123_1, deduped_124_1, deduped_125_1, deduped_126_1;
    deduped_126_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( b_1 );
    deduped_125_1 := UnderlyingCategory( cat_1 );
    deduped_124_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( a_1 );
    deduped_123_1 := deduped_124_1[4];
    deduped_122_1 := deduped_126_1[4];
    deduped_121_1 := deduped_126_1[2];
    deduped_120_1 := deduped_126_1[1];
    deduped_119_1 := CreateCapCategoryObjectWithAttributes( deduped_125_1, IndexOfObject, 1 );
    deduped_118_1 := deduped_124_1[2];
    deduped_117_1 := CreateCapCategoryObjectWithAttributes( deduped_125_1, IndexOfObject, 0 );
    deduped_116_1 := deduped_124_1[1];
    deduped_115_1 := deduped_116_1 + deduped_118_1;
    deduped_114_1 := CreateCapCategoryMorphismWithAttributes( deduped_125_1, deduped_117_1, deduped_119_1, IndexOfMorphism, 3 );
    deduped_113_1 := CreateCapCategoryMorphismWithAttributes( deduped_125_1, deduped_117_1, deduped_119_1, IndexOfMorphism, 2 );
    deduped_112_1 := CreateCapCategoryMorphismWithAttributes( deduped_125_1, deduped_119_1, deduped_117_1, IndexOfMorphism, 1 );
    deduped_111_1 := 3 * deduped_118_1;
    deduped_110_1 := 2 * deduped_116_1;
    deduped_109_1 := ListWithIdenticalEntries( deduped_118_1, deduped_119_1 );
    deduped_108_1 := ListWithIdenticalEntries( deduped_116_1, deduped_117_1 );
    deduped_107_1 := [ 0 .. deduped_118_1 - 1 ];
    deduped_106_1 := [ 0 .. deduped_116_1 - 1 ];
    deduped_105_1 := deduped_115_1 - 1;
    deduped_104_1 := deduped_110_1 + deduped_111_1;
    deduped_103_1 := ListWithIdenticalEntries( deduped_111_1, deduped_119_1 );
    deduped_102_1 := ListWithIdenticalEntries( deduped_110_1, deduped_117_1 );
    deduped_101_1 := [ 0 .. deduped_105_1 ];
    deduped_100_1 := [ 0 .. deduped_111_1 - 1 ];
    deduped_99_1 := [ 0 .. deduped_110_1 - 1 ];
    deduped_98_1 := Length( deduped_107_1 );
    deduped_97_1 := Length( deduped_106_1 );
    deduped_96_1 := deduped_104_1 - 1;
    deduped_95_1 := [ 0 .. deduped_96_1 ];
    deduped_94_1 := [ 0 .. Sum( [ deduped_116_1, deduped_118_1, deduped_118_1 ] ) - 1 ];
    deduped_93_1 := Length( deduped_100_1 );
    deduped_92_1 := Length( deduped_99_1 );
    deduped_91_1 := [ 0 .. Sum( [ deduped_110_1, deduped_111_1, deduped_111_1 ] ) - 1 ];
    deduped_90_1 := [ 0 .. deduped_97_1 + deduped_98_1 - 1 ];
    deduped_2_1 := [ deduped_120_1, deduped_121_1 ];
    deduped_1_1 := [ deduped_117_1, deduped_119_1 ];
    deduped_87_1 := Concatenation( List( deduped_102_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_103_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ) );
    deduped_85_1 := Product( deduped_87_1 );
    deduped_81_1 := [ 0 .. deduped_85_1 - 1 ];
    deduped_89_1 := List( deduped_100_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + (i_2 + deduped_110_1);
            hoisted_2_2 := deduped_87_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_87_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_81_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_86_1 := Concatenation( List( deduped_108_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_109_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ) );
    deduped_84_1 := Product( deduped_86_1 );
    deduped_80_1 := [ 0 .. deduped_84_1 - 1 ];
    deduped_88_1 := List( deduped_107_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + (i_2 + deduped_116_1);
            hoisted_2_2 := deduped_86_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_86_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_80_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_83_1 := ListWithIdenticalEntries( deduped_93_1, deduped_85_1 );
    deduped_82_1 := ListWithIdenticalEntries( deduped_98_1, deduped_84_1 );
    hoisted_48_1 := Concatenation( List( deduped_99_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + i_2;
              hoisted_2_2 := deduped_87_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_87_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_81_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), deduped_89_1, deduped_89_1 );
    deduped_13_1 := [ deduped_126_1[3], List( deduped_122_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_122_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_12_1 := [ deduped_112_1, deduped_113_1, deduped_114_1 ];
    deduped_11_1 := [ 0, 1, 2, 3, 4, 5, 6 ];
    deduped_10_1 := [ 0, 0, 1, 1, 1, 1, 1 ];
    deduped_9_1 := [ 0, 1, 0, 0, 1, 1, 1 ];
    deduped_8_1 := [ 0, 4 ];
    hoisted_47_1 := Concatenation( List( ListWithIdenticalEntries( deduped_110_1, deduped_112_1 ), function ( morB_2 )
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
          end ), List( ListWithIdenticalEntries( deduped_111_1, deduped_113_1 ), function ( morB_2 )
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
          end ), List( ListWithIdenticalEntries( deduped_111_1, deduped_114_1 ), function ( morB_2 )
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
    deduped_30_1 := Concatenation( ListWithIdenticalEntries( deduped_92_1, deduped_85_1 ), deduped_83_1, deduped_83_1 );
    hoisted_49_1 := List( deduped_91_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_47_1[deduped_3_2];
            hoisted_1_2 := hoisted_48_1[deduped_3_2];
            return List( [ 0 .. deduped_30_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_37_1 := [ 1, 0, 1 ];
    deduped_17_1 := List( deduped_123_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_38_1 := List( deduped_100_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( hoisted_37_1[1 + REM_INT( deduped_1_2, 3 )] ) + CAP_JIT_INCOMPLETE_LOGIC( deduped_17_1[(1 + REM_INT( QUO_INT( deduped_1_2, 3 ), deduped_118_1 ))] ) * 2;
        end );
    hoisted_35_1 := [ 0, 0, 1 ];
    deduped_15_1 := List( deduped_123_1, function ( a_2 )
            return a_2[1];
        end );
    deduped_36_1 := List( deduped_100_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( hoisted_35_1[1 + REM_INT( deduped_1_2, 3 )] ) + CAP_JIT_INCOMPLETE_LOGIC( deduped_15_1[(1 + REM_INT( QUO_INT( deduped_1_2, 3 ), deduped_118_1 ))] ) * 2;
        end );
    deduped_34_1 := Concatenation( List( deduped_102_1, IndexOfObject ), List( deduped_103_1, IndexOfObject ) );
    hoisted_31_1 := [ 1, 2 ];
    deduped_5_1 := deduped_124_1[3];
    deduped_32_1 := List( deduped_99_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( hoisted_31_1[1 + REM_INT( deduped_1_2, 2 )] ) + CAP_JIT_INCOMPLETE_LOGIC( deduped_5_1[(1 + REM_INT( QUO_INT( deduped_1_2, 2 ), deduped_116_1 ))] ) * 3;
        end );
    hoisted_44_1 := Concatenation( List( deduped_99_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_34_1[1 + (deduped_32_1[1 + i_2] + deduped_110_1)];
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_100_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_34_1[1 + deduped_36_1[(1 + i_2)]];
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_100_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_34_1[1 + deduped_38_1[(1 + i_2)]];
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ) );
    deduped_45_1 := List( deduped_91_1, function ( j_2 )
            return Product( hoisted_44_1{[ 1 .. j_2 ]} );
        end );
    hoisted_42_1 := Concatenation( List( deduped_99_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + (deduped_32_1[1 + i_2] + deduped_110_1);
              hoisted_2_2 := deduped_87_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_87_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_81_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_100_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_36_1[(1 + i_2)];
              hoisted_2_2 := deduped_87_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_87_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_81_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_100_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_38_1[(1 + i_2)];
              hoisted_2_2 := deduped_87_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_87_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_81_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_39_1 := Concatenation( List( deduped_99_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_8_1[(1 + deduped_34_1[(1 + (deduped_32_1[1 + i_2] + deduped_110_1))])];
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
          end ), List( deduped_100_1, function ( i_2 )
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
          end ), List( deduped_100_1, function ( i_2 )
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
    hoisted_43_1 := List( deduped_91_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_39_1[deduped_3_2];
            hoisted_1_2 := hoisted_42_1[deduped_3_2];
            return List( [ 0 .. deduped_30_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_79_1 := Filtered( deduped_81_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_91_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_43_1[deduped_1_3][deduped_1_2] * deduped_45_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_91_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_49_1[deduped_1_3][deduped_1_2] * deduped_45_1[deduped_1_3];
                    end ) );
        end );
    hoisted_28_1 := Concatenation( List( deduped_106_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + i_2;
              hoisted_2_2 := deduped_86_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_86_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_80_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), deduped_88_1, deduped_88_1 );
    hoisted_27_1 := Concatenation( List( ListWithIdenticalEntries( deduped_116_1, deduped_112_1 ), function ( morB_2 )
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
          end ), List( ListWithIdenticalEntries( deduped_118_1, deduped_113_1 ), function ( morB_2 )
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
          end ), List( ListWithIdenticalEntries( deduped_118_1, deduped_114_1 ), function ( morB_2 )
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
    deduped_3_1 := Concatenation( ListWithIdenticalEntries( deduped_97_1, deduped_84_1 ), deduped_82_1, deduped_82_1 );
    hoisted_29_1 := List( deduped_94_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_27_1[deduped_3_2];
            hoisted_1_2 := hoisted_28_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_18_1 := List( deduped_107_1, function ( i_2 )
            return deduped_17_1[1 + REM_INT( i_2, deduped_118_1 )];
        end );
    deduped_16_1 := List( deduped_107_1, function ( i_2 )
            return deduped_15_1[1 + REM_INT( i_2, deduped_118_1 )];
        end );
    deduped_7_1 := Concatenation( List( deduped_108_1, IndexOfObject ), List( deduped_109_1, IndexOfObject ) );
    deduped_6_1 := List( deduped_106_1, function ( i_2 )
            return deduped_5_1[1 + REM_INT( i_2, deduped_116_1 )];
        end );
    hoisted_24_1 := Concatenation( List( deduped_106_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_7_1[1 + (deduped_6_1[1 + i_2] + deduped_116_1)];
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_107_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_7_1[1 + deduped_16_1[(1 + i_2)]];
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_107_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_7_1[1 + deduped_18_1[(1 + i_2)]];
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ) );
    deduped_25_1 := List( deduped_94_1, function ( j_2 )
            return Product( hoisted_24_1{[ 1 .. j_2 ]} );
        end );
    hoisted_22_1 := Concatenation( List( deduped_106_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + (deduped_6_1[1 + i_2] + deduped_116_1);
              hoisted_2_2 := deduped_86_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_86_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_80_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_107_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_16_1[(1 + i_2)];
              hoisted_2_2 := deduped_86_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_86_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_80_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_107_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_18_1[(1 + i_2)];
              hoisted_2_2 := deduped_86_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_86_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_80_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_19_1 := Concatenation( List( deduped_106_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_8_1[(1 + deduped_7_1[(1 + (deduped_6_1[1 + i_2] + deduped_116_1))])];
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
          end ), List( deduped_107_1, function ( i_2 )
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
          end ), List( deduped_107_1, function ( i_2 )
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
    hoisted_23_1 := List( deduped_94_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_19_1[deduped_3_2];
            hoisted_1_2 := hoisted_22_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_78_1 := Filtered( deduped_80_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_94_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_23_1[deduped_1_3][deduped_1_2] * deduped_25_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_94_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_29_1[deduped_1_3][deduped_1_2] * deduped_25_1[deduped_1_3];
                    end ) );
        end );
    deduped_77_1 := Length( deduped_79_1 );
    deduped_76_1 := Length( deduped_78_1 );
    deduped_70_1 := [ deduped_110_1 .. deduped_96_1 ];
    hoisted_74_1 := Concatenation( List( deduped_106_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( (1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 ) * 2) );
              hoisted_2_2 := deduped_87_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_87_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_81_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_107_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_70_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( (2 + CAP_JIT_INCOMPLETE_LOGIC( i_2 ) * 3) ))];
              hoisted_2_2 := deduped_87_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_87_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_81_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_69_1 := Concatenation( List( deduped_108_1, function ( objB_2 )
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
          end ), List( deduped_109_1, function ( objB_2 )
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
    deduped_68_1 := Concatenation( ListWithIdenticalEntries( deduped_97_1, deduped_85_1 ), ListWithIdenticalEntries( deduped_98_1, deduped_85_1 ) );
    hoisted_75_1 := List( deduped_90_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := deduped_69_1[deduped_3_2];
            hoisted_1_2 := hoisted_74_1[deduped_3_2];
            return List( [ 0 .. deduped_68_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_66_1 := List( deduped_101_1, function ( j_2 )
            return Product( deduped_86_1{[ 1 .. j_2 ]} );
        end );
    deduped_50_1 := [ [ 0 .. deduped_120_1 - 1 ], [ 0 .. deduped_121_1 - 1 ] ];
    hoisted_64_1 := Concatenation( List( deduped_108_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_50_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_109_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_50_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ) );
    hoisted_65_1 := List( [ 1 .. deduped_115_1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_64_1[i_2];
            hoisted_2_2 := deduped_86_1[i_2];
            hoisted_1_2 := Product( deduped_86_1{[ 1 .. i_2 - 1 ]} );
            return List( deduped_80_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    deduped_73_1 := List( deduped_80_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_101_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_65_1[deduped_1_3][hoisted_1_2] * deduped_66_1[deduped_1_3];
                end );
        end );
    hoisted_71_1 := Concatenation( List( deduped_106_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( i_2 ) * 2 );
              hoisted_2_2 := deduped_87_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_87_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_81_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_107_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_70_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( (1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 ) * 3) ))];
              hoisted_2_2 := deduped_87_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_87_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_81_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_72_1 := List( deduped_90_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := deduped_69_1[deduped_3_2];
            hoisted_1_2 := hoisted_71_1[deduped_3_2];
            return List( [ 0 .. deduped_68_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_53_1 := List( deduped_95_1, function ( j_2 )
            return Product( deduped_87_1{[ 1 .. j_2 ]} );
        end );
    hoisted_51_1 := Concatenation( List( deduped_102_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_50_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_103_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_50_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ) );
    hoisted_52_1 := List( [ 1 .. deduped_104_1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_51_1[i_2];
            hoisted_2_2 := deduped_87_1[i_2];
            hoisted_1_2 := Product( deduped_87_1{[ 1 .. i_2 - 1 ]} );
            return List( deduped_81_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    hoisted_62_1 := List( deduped_81_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_95_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_52_1[deduped_1_3][hoisted_1_2] * deduped_53_1[deduped_1_3];
                end );
        end );
    hoisted_58_1 := [ deduped_116_1 .. deduped_105_1 ];
    hoisted_57_1 := [ 0, 0, 0 ];
    hoisted_59_1 := Concatenation( List( deduped_99_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), 2 ), deduped_116_1 ) );
              hoisted_2_2 := deduped_86_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_86_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_80_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_100_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
              deduped_4_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
              deduped_3_2 := 1 + hoisted_58_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( (CAP_JIT_INCOMPLETE_LOGIC( hoisted_57_1[1 + REM_INT( deduped_4_2, 3 )] ) + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( deduped_4_2, 3 ), deduped_118_1 ) )) ))];
              hoisted_2_2 := deduped_86_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_86_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_80_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_56_1 := Concatenation( List( deduped_102_1, function ( objB_2 )
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
          end ), List( deduped_103_1, function ( objB_2 )
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
    hoisted_55_1 := Concatenation( ListWithIdenticalEntries( deduped_92_1, deduped_84_1 ), ListWithIdenticalEntries( deduped_93_1, deduped_84_1 ) );
    hoisted_60_1 := List( [ 0 .. deduped_92_1 + deduped_93_1 - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_56_1[deduped_3_2];
            hoisted_1_2 := hoisted_59_1[deduped_3_2];
            return List( [ 0 .. hoisted_55_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets, NTuple( 4, deduped_76_1, deduped_77_1, List( [ 0 .. deduped_76_1 - 1 ], function ( x_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_78_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))] );
                return -1 + BigInt( SafePosition( deduped_79_1, CAP_JIT_INCOMPLETE_LOGIC( hoisted_62_1[(1 + Sum( deduped_95_1, function ( j_3 )
                                   local deduped_1_3;
                                   deduped_1_3 := (1 + j_3);
                                   return hoisted_60_1[deduped_1_3][hoisted_1_2] * deduped_53_1[deduped_1_3];
                               end ))] ) ) );
            end ), List( [ 0 .. deduped_77_1 - 1 ], function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_79_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))] );
                return NTuple( 2, -1 + BigInt( SafePosition( deduped_78_1, CAP_JIT_INCOMPLETE_LOGIC( deduped_73_1[(1 + Sum( deduped_101_1, function ( j_3 )
                                     local deduped_1_3;
                                     deduped_1_3 := (1 + j_3);
                                     return hoisted_72_1[deduped_1_3][deduped_1_2] * deduped_66_1[deduped_1_3];
                                 end ))] ) ) ), -1 + BigInt( SafePosition( deduped_78_1, CAP_JIT_INCOMPLETE_LOGIC( deduped_73_1[(1 + Sum( deduped_101_1, function ( j_3 )
                                     local deduped_1_3;
                                     deduped_1_3 := (1 + j_3);
                                     return hoisted_75_1[deduped_1_3][deduped_1_2] * deduped_66_1[deduped_1_3];
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
