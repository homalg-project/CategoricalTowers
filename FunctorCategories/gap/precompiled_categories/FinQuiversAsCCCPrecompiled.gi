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
    local deduped_1_1, deduped_2_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, hoisted_15_1, deduped_16_1, hoisted_17_1, hoisted_20_1, hoisted_21_1, deduped_22_1, hoisted_23_1, deduped_24_1, hoisted_26_1, hoisted_28_1, hoisted_29_1, deduped_30_1, hoisted_31_1, hoisted_34_1, deduped_35_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, hoisted_43_1, hoisted_44_1, deduped_46_1, deduped_48_1, deduped_49_1, hoisted_51_1, hoisted_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1, deduped_68_1, deduped_69_1, deduped_70_1, deduped_71_1, deduped_72_1, deduped_73_1, deduped_74_1, deduped_75_1, deduped_76_1, deduped_77_1, deduped_78_1, deduped_79_1, deduped_80_1, deduped_81_1, deduped_82_1, deduped_83_1, deduped_84_1, deduped_85_1, deduped_86_1, deduped_87_1, deduped_88_1, deduped_89_1, deduped_90_1, deduped_91_1, deduped_92_1, deduped_93_1, deduped_94_1, deduped_95_1, deduped_96_1, deduped_97_1;
    deduped_97_1 := [ 3 ];
    deduped_96_1 := [ 2 ];
    deduped_95_1 := [ 1 ];
    deduped_94_1 := [ 0 ];
    deduped_93_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( b_1 );
    deduped_92_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_91_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( a_1 );
    deduped_90_1 := deduped_93_1[3];
    deduped_89_1 := CreateCapCategoryObjectWithAttributes( deduped_92_1, Length, 4 );
    deduped_88_1 := deduped_91_1[3];
    deduped_87_1 := deduped_93_1[2];
    deduped_86_1 := deduped_93_1[1];
    deduped_85_1 := deduped_91_1[2];
    deduped_84_1 := CreateCapCategoryObjectWithAttributes( deduped_92_1, Length, 2 );
    deduped_83_1 := CreateCapCategoryObjectWithAttributes( deduped_92_1, Length, 1 );
    deduped_82_1 := deduped_91_1[1];
    deduped_81_1 := CreateCapCategoryObjectWithAttributes( deduped_92_1, Length, deduped_82_1 );
    deduped_80_1 := 2 * deduped_82_1;
    deduped_79_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_78_1 := [ 0 .. deduped_82_1 - 1 ];
    deduped_77_1 := [ 0 .. deduped_85_1 - 1 ];
    deduped_76_1 := CreateCapCategoryMorphismWithAttributes( deduped_92_1, CreateCapCategoryObjectWithAttributes( deduped_92_1, Length, 0 ), CreateCapCategoryObjectWithAttributes( deduped_92_1, Length, deduped_85_1 ), AsList, [  ] );
    deduped_75_1 := CreateCapCategoryObjectWithAttributes( deduped_92_1, Length, deduped_80_1 );
    deduped_74_1 := CreateCapCategoryObjectWithAttributes( deduped_79_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_92_1, deduped_83_1, deduped_84_1, AsList, deduped_95_1 ) );
    deduped_73_1 := CreateCapCategoryObjectWithAttributes( deduped_79_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_92_1, deduped_83_1, deduped_84_1, AsList, deduped_94_1 ) );
    deduped_72_1 := Length( deduped_77_1 );
    deduped_71_1 := CreateCapCategoryMorphismWithAttributes( deduped_79_1, deduped_73_1, deduped_74_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_92_1, deduped_83_1, deduped_89_1, AsList, deduped_96_1 ) );
    deduped_70_1 := CreateCapCategoryMorphismWithAttributes( deduped_79_1, deduped_73_1, deduped_74_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_92_1, deduped_83_1, deduped_89_1, AsList, deduped_95_1 ) );
    deduped_69_1 := ListWithIdenticalEntries( deduped_85_1, deduped_74_1 );
    deduped_68_1 := ListWithIdenticalEntries( deduped_80_1, deduped_73_1 );
    deduped_67_1 := ListWithIdenticalEntries( 0, deduped_74_1 );
    deduped_66_1 := ListWithIdenticalEntries( deduped_82_1, deduped_73_1 );
    deduped_2_1 := [ deduped_86_1, deduped_87_1 ];
    deduped_1_1 := [ deduped_73_1, deduped_74_1 ];
    deduped_63_1 := Concatenation( List( deduped_68_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ), List( deduped_69_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ) );
    deduped_58_1 := [ 0 .. Product( deduped_63_1 ) - 1 ];
    deduped_65_1 := List( deduped_77_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := logic_new_func_x_2 + deduped_80_1;
            hoisted_2_2 := deduped_63_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_63_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_58_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_64_1 := [ 0 .. deduped_72_1 + deduped_72_1 - 1 ];
    deduped_62_1 := Concatenation( List( deduped_66_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ), List( deduped_67_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ) );
    deduped_38_1 := List( deduped_78_1, function ( logic_new_func_x_2 )
            return REM_INT( logic_new_func_x_2, deduped_82_1 );
        end );
    deduped_61_1 := ListOfValues( [ CreateCapCategoryMorphismWithAttributes( deduped_92_1, deduped_81_1, deduped_75_1, AsList, List( deduped_78_1, function ( i_2 )
                    return deduped_38_1[(1 + i_2)] * 2;
                end ) ), deduped_76_1 ] );
    deduped_60_1 := ListOfValues( [ CreateCapCategoryMorphismWithAttributes( deduped_92_1, deduped_81_1, deduped_75_1, AsList, List( deduped_78_1, function ( i_2 )
                    return 1 + deduped_38_1[(1 + i_2)] * 2;
                end ) ), deduped_76_1 ] );
    deduped_59_1 := [ 1 .. Length( deduped_61_1 ) ];
    deduped_57_1 := [ 0 .. Product( deduped_62_1 ) - 1 ];
    deduped_56_1 := [ 1 .. Length( deduped_60_1 ) ];
    hoisted_28_1 := Concatenation( deduped_65_1, deduped_65_1 );
    deduped_14_1 := [ List( deduped_90_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_90_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_13_1 := [ deduped_70_1, deduped_71_1 ];
    deduped_10_1 := [ deduped_94_1, deduped_95_1, deduped_96_1, deduped_97_1 ];
    deduped_9_1 := [ deduped_94_1, deduped_95_1, deduped_95_1, deduped_95_1 ];
    deduped_8_1 := [ deduped_94_1, deduped_94_1, deduped_94_1, deduped_95_1 ];
    deduped_7_1 := [ 0, 3 ];
    hoisted_26_1 := Concatenation( List( ListWithIdenticalEntries( deduped_85_1, deduped_70_1 ), function ( logic_new_func_x_2 )
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
          end ), List( ListWithIdenticalEntries( deduped_85_1, deduped_71_1 ), function ( logic_new_func_x_2 )
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
    hoisted_29_1 := List( deduped_64_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_26_1[deduped_3_2];
            hoisted_1_2 := hoisted_28_1[deduped_3_2];
            return List( deduped_58_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_22_1 := Concatenation( deduped_68_1, deduped_69_1 );
    hoisted_15_1 := List( deduped_88_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_16_1 := List( deduped_77_1, function ( i_2 )
            return 1 + hoisted_15_1[(1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), deduped_85_1 ))] * 2;
        end );
    hoisted_4_1 := List( deduped_88_1, function ( a_2 )
            return a_2[1];
        end );
    deduped_5_1 := List( deduped_77_1, function ( i_2 )
            return hoisted_4_1[(1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), deduped_85_1 ))] * 2;
        end );
    hoisted_23_1 := Concatenation( List( deduped_77_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_22_1[1 + deduped_5_1[(1 + logic_new_func_x_2)]] )];
          end ), List( deduped_77_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_22_1[1 + deduped_16_1[(1 + logic_new_func_x_2)]] )];
          end ) );
    deduped_24_1 := List( deduped_64_1, function ( j_2 )
            return Product( hoisted_23_1{[ 1 .. j_2 ]} );
        end );
    hoisted_20_1 := Concatenation( List( deduped_77_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_5_1[1 + logic_new_func_x_2];
              hoisted_2_2 := deduped_63_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_63_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_58_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_77_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_16_1[1 + logic_new_func_x_2];
              hoisted_2_2 := deduped_63_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_63_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_58_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_12_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_79_1, deduped_73_1, deduped_73_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_92_1, deduped_83_1, deduped_89_1, AsList, deduped_94_1 ) ), deduped_70_1, deduped_71_1, CreateCapCategoryMorphismWithAttributes( deduped_79_1, deduped_74_1, deduped_74_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_92_1, deduped_83_1, deduped_89_1, AsList, deduped_97_1 ) ) ];
    deduped_11_1 := [ deduped_73_1, deduped_73_1, deduped_73_1, deduped_74_1 ];
    deduped_6_1 := Concatenation( List( deduped_68_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ), List( deduped_69_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    hoisted_17_1 := Concatenation( List( deduped_77_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_7_1[(1 + deduped_6_1[(1 + deduped_5_1[(1 + logic_new_func_x_2)])][1])];
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
          end ), List( deduped_77_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_7_1[(1 + deduped_6_1[(1 + deduped_16_1[(1 + logic_new_func_x_2)])][1])];
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
    hoisted_21_1 := List( deduped_64_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_17_1[deduped_3_2];
            hoisted_1_2 := hoisted_20_1[deduped_3_2];
            return List( deduped_58_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_55_1 := Filtered( deduped_58_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return Sum( deduped_64_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_21_1[deduped_1_3][deduped_1_2] * deduped_24_1[deduped_1_3];
                  end ) = Sum( deduped_64_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_29_1[deduped_1_3][deduped_1_2] * deduped_24_1[deduped_1_3];
                  end );
        end );
    deduped_54_1 := Filtered( deduped_57_1, function ( x_2 )
            return true;
        end );
    deduped_53_1 := Length( deduped_55_1 );
    deduped_49_1 := List( deduped_60_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_48_1 := List( deduped_60_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_51_1 := Concatenation( List( deduped_56_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := Sum( deduped_49_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
              hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_49_1[logic_new_func_x_2] - 1 ];
              hoisted_1_2 := AsList( CAP_JIT_INCOMPLETE_LOGIC( deduped_60_1[logic_new_func_x_2] ) );
              return List( [ 0 .. deduped_48_1[logic_new_func_x_2] - 1 ], function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := hoisted_2_2[1 + hoisted_1_2[(1 + logic_new_func_x_3)]];
                      hoisted_2_3 := deduped_63_1[1 + deduped_3_3];
                      hoisted_1_3 := Product( deduped_63_1{[ 1 .. deduped_3_3 ]} );
                      return List( deduped_58_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    deduped_40_1 := Concatenation( List( deduped_66_1, function ( logic_new_func_x_2 )
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
          end ), List( deduped_67_1, function ( logic_new_func_x_2 )
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
    hoisted_52_1 := List( [ 0 .. Sum( List( deduped_56_1, function ( logic_new_func_x_2 )
                      return Length( [ 0 .. deduped_48_1[logic_new_func_x_2] - 1 ] );
                  end ) ) - 1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := deduped_40_1[deduped_3_2];
            hoisted_1_2 := hoisted_51_1[deduped_3_2];
            return List( deduped_58_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_35_1 := List( deduped_78_1, function ( j_2 )
            return Product( deduped_62_1{[ 1 .. j_2 ]} );
        end );
    deduped_30_1 := [ [ 0 .. deduped_86_1 - 1 ], [ 0 .. deduped_87_1 - 1 ] ];
    hoisted_31_1 := Concatenation( List( deduped_66_1, function ( logic_new_func_x_2 )
              return deduped_30_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ), List( deduped_67_1, function ( logic_new_func_x_2 )
              return deduped_30_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ) );
    hoisted_34_1 := List( [ 1 .. deduped_82_1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_31_1[logic_new_func_x_2];
            hoisted_2_2 := deduped_62_1[logic_new_func_x_2];
            hoisted_1_2 := Product( deduped_62_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( deduped_57_1, function ( logic_new_func_x_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( logic_new_func_x_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    deduped_46_1 := List( deduped_57_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_78_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_34_1[deduped_1_3][hoisted_1_2] * deduped_35_1[deduped_1_3];
                end );
        end );
    deduped_41_1 := List( deduped_61_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_39_1 := List( deduped_61_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_43_1 := Concatenation( List( deduped_59_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := Sum( deduped_41_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
              hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_41_1[logic_new_func_x_2] - 1 ];
              hoisted_1_2 := AsList( CAP_JIT_INCOMPLETE_LOGIC( deduped_61_1[logic_new_func_x_2] ) );
              return List( [ 0 .. deduped_39_1[logic_new_func_x_2] - 1 ], function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := hoisted_2_2[1 + hoisted_1_2[(1 + logic_new_func_x_3)]];
                      hoisted_2_3 := deduped_63_1[1 + deduped_3_3];
                      hoisted_1_3 := Product( deduped_63_1{[ 1 .. deduped_3_3 ]} );
                      return List( deduped_58_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_44_1 := List( [ 0 .. Sum( List( deduped_59_1, function ( logic_new_func_x_2 )
                      return Length( [ 0 .. deduped_39_1[logic_new_func_x_2] - 1 ] );
                  end ) ) - 1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := deduped_40_1[deduped_3_2];
            hoisted_1_2 := hoisted_43_1[deduped_3_2];
            return List( deduped_58_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfQuiverEnrichedOverSkeletalFinSets, NTuple( 3, Length( deduped_54_1 ), deduped_53_1, List( [ 0 .. deduped_53_1 - 1 ], function ( logic_new_func_x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_55_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 ))] );
                return NTuple( 2, -1 + SafePosition( deduped_54_1, deduped_46_1[(1 + Sum( deduped_78_1, function ( j_3 )
                                 local deduped_1_3;
                                 deduped_1_3 := (1 + j_3);
                                 return hoisted_44_1[deduped_1_3][deduped_1_2] * deduped_35_1[deduped_1_3];
                             end ))] ), -1 + SafePosition( deduped_54_1, deduped_46_1[(1 + Sum( deduped_78_1, function ( j_3 )
                                 local deduped_1_3;
                                 deduped_1_3 := (1 + j_3);
                                 return hoisted_52_1[deduped_1_3][deduped_1_2] * deduped_35_1[deduped_1_3];
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
