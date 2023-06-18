# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_FinBouquetsAsCCCPrecompiled", function ( cat )
    
    ##
    AddExponentialOnObjects( cat,
        
########
function ( cat_1, a_1, b_1 )
    local deduped_1_1, deduped_2_1, hoisted_3_1, deduped_4_1, deduped_6_1, deduped_7_1, hoisted_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, deduped_19_1, hoisted_21_1, hoisted_23_1, deduped_24_1, hoisted_25_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, deduped_31_1, hoisted_33_1, hoisted_34_1, deduped_35_1, hoisted_36_1, hoisted_37_1, deduped_38_1, deduped_40_1, hoisted_42_1, hoisted_43_1, deduped_44_1, hoisted_46_1, hoisted_47_1, hoisted_49_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1, deduped_68_1, deduped_69_1, deduped_70_1, deduped_71_1, deduped_72_1, deduped_73_1, deduped_74_1, deduped_75_1, deduped_76_1, deduped_77_1, deduped_78_1, deduped_79_1, deduped_80_1, deduped_81_1, deduped_82_1, deduped_83_1, deduped_84_1, deduped_85_1, deduped_86_1, deduped_87_1;
    deduped_87_1 := [ 1 ];
    deduped_86_1 := [ 0 ];
    deduped_85_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( b_1 );
    deduped_84_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_83_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( a_1 );
    deduped_82_1 := deduped_85_1[3];
    deduped_81_1 := deduped_85_1[2];
    deduped_80_1 := deduped_85_1[1];
    deduped_79_1 := deduped_83_1[2];
    deduped_78_1 := CreateCapCategoryObjectWithAttributes( deduped_84_1, Length, 2 );
    deduped_77_1 := CreateCapCategoryObjectWithAttributes( deduped_84_1, Length, BigInt( 1 ) );
    deduped_76_1 := deduped_83_1[1];
    deduped_75_1 := CreateCapCategoryObjectWithAttributes( deduped_84_1, Length, deduped_76_1 );
    deduped_74_1 := 0 * deduped_79_1;
    deduped_73_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_72_1 := [ 0 .. deduped_79_1 - 1 ];
    deduped_71_1 := deduped_76_1 + deduped_74_1;
    deduped_70_1 := CreateCapCategoryObjectWithAttributes( deduped_73_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_84_1, deduped_77_1, deduped_78_1, AsList, deduped_87_1 ) );
    deduped_69_1 := CreateCapCategoryObjectWithAttributes( deduped_73_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_84_1, deduped_77_1, deduped_78_1, AsList, deduped_86_1 ) );
    deduped_68_1 := [ 0 .. deduped_74_1 - 1 ];
    deduped_67_1 := CreateCapCategoryMorphismWithAttributes( deduped_73_1, deduped_69_1, deduped_70_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_84_1, deduped_77_1, CreateCapCategoryObjectWithAttributes( deduped_84_1, Length, 3 ), AsList, deduped_87_1 ) );
    deduped_66_1 := ListWithIdenticalEntries( deduped_79_1, deduped_70_1 );
    deduped_65_1 := ListWithIdenticalEntries( deduped_74_1, deduped_70_1 );
    deduped_64_1 := ListWithIdenticalEntries( deduped_76_1, deduped_69_1 );
    deduped_63_1 := [ 0 .. deduped_71_1 - 1 ];
    deduped_62_1 := List( deduped_64_1, function ( logic_new_func_x_2 )
            return AsList( MapOfObject( logic_new_func_x_2 ) );
        end );
    deduped_2_1 := [ deduped_80_1, deduped_81_1 ];
    deduped_1_1 := [ deduped_69_1, deduped_70_1 ];
    deduped_61_1 := List( deduped_64_1, function ( objB_2 )
            return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
        end );
    deduped_60_1 := Concatenation( deduped_61_1, List( deduped_66_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ) );
    deduped_59_1 := Concatenation( deduped_61_1, List( deduped_65_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ) );
    deduped_58_1 := Product( deduped_60_1 );
    deduped_57_1 := [ 0 .. deduped_58_1 - 1 ];
    deduped_56_1 := [ 0 .. Product( deduped_59_1 ) - 1 ];
    deduped_12_1 := [ deduped_86_1, deduped_87_1, [ 2 ] ];
    deduped_11_1 := [ deduped_86_1, deduped_87_1, deduped_87_1 ];
    deduped_10_1 := [ deduped_86_1, deduped_86_1, deduped_87_1 ];
    deduped_9_1 := [ 0, 2 ];
    hoisted_33_1 := List( ListWithIdenticalEntries( deduped_79_1, deduped_67_1 ), function ( morB_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := Source( morB_2 );
            deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
            deduped_1_2 := 1 + deduped_9_1[(1 + deduped_2_2[1])];
            if IdFunc( function (  )
                        if deduped_2_2 = deduped_10_1[deduped_1_2] and AsList( MapOfObject( Range( morB_2 ) ) ) = deduped_11_1[deduped_1_2] then
                            return AsList( MapOfMorphism( morB_2 ) ) = deduped_12_1[deduped_1_2];
                        else
                            return false;
                        fi;
                        return;
                    end )(  ) then
                return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
            else
                return deduped_82_1;
            fi;
            return;
        end );
    hoisted_34_1 := List( deduped_72_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2;
            deduped_4_2 := 1 + (CAP_JIT_INCOMPLETE_LOGIC( i_2 ) + deduped_76_1);
            hoisted_3_2 := hoisted_33_1[1 + i_2];
            hoisted_2_2 := deduped_60_1[deduped_4_2];
            hoisted_1_2 := Product( deduped_60_1{[ 1 .. deduped_4_2 - 1 ]} );
            return List( deduped_57_1, function ( i_3 )
                    return hoisted_3_2[1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 ) )];
                end );
        end );
    hoisted_29_1 := Concatenation( deduped_64_1, deduped_66_1 );
    deduped_6_1 := deduped_83_1[3];
    deduped_24_1 := List( deduped_72_1, function ( i_2 )
            return CAP_JIT_INCOMPLETE_LOGIC( deduped_6_1[(1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), 1 ), deduped_79_1 ))] ) * 1;
        end );
    hoisted_30_1 := List( deduped_72_1, function ( i_2 )
            return deduped_2_1[SafePosition( deduped_1_1, hoisted_29_1[1 + deduped_24_1[(1 + i_2)]] )];
        end );
    deduped_31_1 := List( deduped_72_1, function ( j_2 )
            return Product( hoisted_30_1{[ 1 .. j_2 ]} );
        end );
    hoisted_25_1 := Concatenation( deduped_62_1, List( deduped_66_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    deduped_13_1 := [ deduped_69_1, deduped_69_1, deduped_70_1 ];
    hoisted_28_1 := List( deduped_72_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := 1 + deduped_24_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 ))];
            deduped_6_2 := 1 + deduped_9_1[(1 + hoisted_25_1[deduped_7_2][1])];
            deduped_5_2 := deduped_10_1[deduped_6_2];
            deduped_4_2 := 1 + deduped_9_1[(1 + deduped_5_2[1])];
            hoisted_3_2 := CAP_JIT_INCOMPLETE_LOGIC( IdFunc( function (  )
                        if IdFunc( function (  )
                                    if deduped_5_2 = deduped_10_1[deduped_4_2] and deduped_11_1[deduped_6_2] = deduped_11_1[deduped_4_2] then
                                        return deduped_12_1[deduped_6_2] = deduped_12_1[deduped_4_2];
                                    else
                                        return false;
                                    fi;
                                    return;
                                end )(  ) then
                            return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_13_1[deduped_6_2] )] - 1 ];
                        else
                            return deduped_82_1;
                        fi;
                        return;
                    end )(  ) );
            hoisted_2_2 := deduped_60_1[deduped_7_2];
            hoisted_1_2 := Product( deduped_60_1{[ 1 .. deduped_7_2 - 1 ]} );
            return List( deduped_57_1, function ( i_3 )
                    return hoisted_3_2[1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 ) )];
                end );
        end );
    deduped_55_1 := Filtered( deduped_57_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_72_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_28_1[deduped_1_3][deduped_1_2] * deduped_31_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_72_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_34_1[deduped_1_3][deduped_1_2] * deduped_31_1[deduped_1_3];
                    end ) );
        end );
    hoisted_21_1 := List( ListWithIdenticalEntries( deduped_74_1, deduped_67_1 ), function ( morB_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := Source( morB_2 );
            deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
            deduped_1_2 := 1 + deduped_9_1[(1 + deduped_2_2[1])];
            if IdFunc( function (  )
                        if deduped_2_2 = deduped_10_1[deduped_1_2] and AsList( MapOfObject( Range( morB_2 ) ) ) = deduped_11_1[deduped_1_2] then
                            return AsList( MapOfMorphism( morB_2 ) ) = deduped_12_1[deduped_1_2];
                        else
                            return false;
                        fi;
                        return;
                    end )(  ) then
                return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
            else
                return deduped_82_1;
            fi;
            return;
        end );
    hoisted_23_1 := List( deduped_68_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2;
            deduped_4_2 := 1 + (CAP_JIT_INCOMPLETE_LOGIC( i_2 ) + deduped_76_1);
            hoisted_3_2 := hoisted_21_1[1 + i_2];
            hoisted_2_2 := deduped_59_1[deduped_4_2];
            hoisted_1_2 := Product( deduped_59_1{[ 1 .. deduped_4_2 - 1 ]} );
            return List( deduped_56_1, function ( i_3 )
                    return hoisted_3_2[1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 ) )];
                end );
        end );
    hoisted_17_1 := Concatenation( deduped_64_1, deduped_65_1 );
    hoisted_3_1 := [  ];
    deduped_4_1 := List( deduped_68_1, function ( i_2 )
            return hoisted_3_1[1 + REM_INT( i_2, 0 )];
        end );
    deduped_7_1 := List( deduped_68_1, function ( i_2 )
            return deduped_4_1[1 + i_2] + CAP_JIT_INCOMPLETE_LOGIC( deduped_6_1[(1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), 0 ), deduped_79_1 ))] ) * 1;
        end );
    hoisted_18_1 := List( deduped_68_1, function ( i_2 )
            return deduped_2_1[SafePosition( deduped_1_1, hoisted_17_1[1 + deduped_7_1[(1 + i_2)]] )];
        end );
    deduped_19_1 := List( deduped_68_1, function ( j_2 )
            return Product( hoisted_18_1{[ 1 .. j_2 ]} );
        end );
    hoisted_8_1 := Concatenation( deduped_62_1, List( deduped_65_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    hoisted_16_1 := List( deduped_68_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := 1 + deduped_7_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 ))];
            deduped_6_2 := 1 + deduped_9_1[(1 + hoisted_8_1[deduped_7_2][1])];
            deduped_5_2 := deduped_10_1[deduped_6_2];
            deduped_4_2 := 1 + deduped_9_1[(1 + deduped_5_2[1])];
            hoisted_3_2 := CAP_JIT_INCOMPLETE_LOGIC( IdFunc( function (  )
                        if IdFunc( function (  )
                                    if deduped_5_2 = deduped_10_1[deduped_4_2] and deduped_11_1[deduped_6_2] = deduped_11_1[deduped_4_2] then
                                        return deduped_12_1[deduped_6_2] = deduped_12_1[deduped_4_2];
                                    else
                                        return false;
                                    fi;
                                    return;
                                end )(  ) then
                            return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_13_1[deduped_6_2] )] - 1 ];
                        else
                            return deduped_82_1;
                        fi;
                        return;
                    end )(  ) );
            hoisted_2_2 := deduped_59_1[deduped_7_2];
            hoisted_1_2 := Product( deduped_59_1{[ 1 .. deduped_7_2 - 1 ]} );
            return List( deduped_56_1, function ( i_3 )
                    return hoisted_3_2[1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 ) )];
                end );
        end );
    deduped_54_1 := Filtered( deduped_56_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_68_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_16_1[deduped_1_3][deduped_1_2] * deduped_19_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_68_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_23_1[deduped_1_3][deduped_1_2] * deduped_19_1[deduped_1_3];
                    end ) );
        end );
    deduped_53_1 := ListOfValues( [ CreateCapCategoryMorphismWithAttributes( deduped_84_1, deduped_75_1, deduped_75_1, AsList, List( [ 0 .. deduped_76_1 - 1 ], function ( i_2 )
                    return CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), 1 ), deduped_76_1 ) ) * 1;
                end ) ), CreateCapCategoryMorphismWithAttributes( deduped_84_1, CreateCapCategoryObjectWithAttributes( deduped_84_1, Length, deduped_74_1 ), CreateCapCategoryObjectWithAttributes( deduped_84_1, Length, deduped_79_1 ), AsList, List( deduped_68_1, function ( i_2 )
                    return deduped_4_1[1 + i_2] + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), 0 ), deduped_79_1 ) ) * 1;
                end ) ) ] );
    deduped_52_1 := Length( deduped_55_1 );
    deduped_51_1 := [ 1 .. Length( deduped_53_1 ) ];
    deduped_38_1 := List( deduped_63_1, function ( j_2 )
            return Product( deduped_59_1{[ 1 .. j_2 ]} );
        end );
    deduped_35_1 := [ [ 0 .. deduped_80_1 - 1 ], [ 0 .. deduped_81_1 - 1 ] ];
    hoisted_36_1 := Concatenation( List( deduped_64_1, function ( objB_2 )
              return deduped_35_1[SafePosition( deduped_1_1, objB_2 )];
          end ), List( deduped_65_1, function ( objB_2 )
              return deduped_35_1[SafePosition( deduped_1_1, objB_2 )];
          end ) );
    hoisted_37_1 := List( [ 1 .. deduped_71_1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_36_1[i_2];
            hoisted_2_2 := deduped_59_1[i_2];
            hoisted_1_2 := Product( deduped_59_1{[ 1 .. i_2 - 1 ]} );
            return List( deduped_56_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    hoisted_49_1 := List( deduped_56_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_63_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_37_1[deduped_1_3][hoisted_1_2] * deduped_38_1[deduped_1_3];
                end );
        end );
    deduped_44_1 := List( deduped_53_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_40_1 := List( deduped_53_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_46_1 := Concatenation( List( deduped_51_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := Sum( deduped_44_1{[ 1 .. i_2 - 1 ]} );
              hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_44_1[i_2] - 1 ];
              hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( AsList( CAP_JIT_INCOMPLETE_LOGIC( deduped_53_1[i_2] ) ) );
              return List( [ 0 .. deduped_40_1[i_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + hoisted_2_2[(1 + hoisted_1_2[(1 + i_3)])];
                      hoisted_2_3 := deduped_60_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_60_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_57_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_43_1 := Concatenation( List( deduped_64_1, function ( objB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_9_1[(1 + AsList( MapOfObject( objB_2 ) )[1])];
              deduped_2_2 := deduped_10_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_9_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_10_1[deduped_1_2] and deduped_11_1[deduped_3_2] = deduped_11_1[deduped_1_2] then
                              return deduped_12_1[deduped_3_2] = deduped_12_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_13_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_82_1;
              fi;
              return;
          end ), List( deduped_65_1, function ( objB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_9_1[(1 + AsList( MapOfObject( objB_2 ) )[1])];
              deduped_2_2 := deduped_10_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_9_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_10_1[deduped_1_2] and deduped_11_1[deduped_3_2] = deduped_11_1[deduped_1_2] then
                              return deduped_12_1[deduped_3_2] = deduped_12_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_13_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_82_1;
              fi;
              return;
          end ) );
    hoisted_42_1 := Concatenation( List( deduped_51_1, function ( i_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_40_1[i_2] - 1 ] ), deduped_58_1 );
          end ) );
    hoisted_47_1 := List( [ 0 .. Sum( List( deduped_51_1, function ( i_2 )
                      return Length( [ 0 .. deduped_40_1[i_2] - 1 ] );
                  end ) ) - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_43_1[deduped_3_2];
            hoisted_1_2 := hoisted_46_1[deduped_3_2];
            return List( [ 0 .. hoisted_42_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfBouquetEnrichedOverSkeletalFinSets, NTuple( 3, Length( deduped_54_1 ), deduped_52_1, List( [ 0 .. deduped_52_1 - 1 ], function ( x_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_55_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))] );
                return -1 + BigInt( SafePosition( deduped_54_1, CAP_JIT_INCOMPLETE_LOGIC( hoisted_49_1[(1 + Sum( deduped_63_1, function ( j_3 )
                                   local deduped_1_3;
                                   deduped_1_3 := (1 + j_3);
                                   return hoisted_47_1[deduped_1_3][hoisted_1_2] * deduped_38_1[deduped_1_3];
                               end ))] ) ) );
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

BindGlobal( "FinBouquetsAsCCCPrecompiled", function (  )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function (  )
    return CategoryOfBouquetsEnrichedOver( CategoryOfSkeletalFinSets(  : FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_FinBouquetsAsCCCPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
