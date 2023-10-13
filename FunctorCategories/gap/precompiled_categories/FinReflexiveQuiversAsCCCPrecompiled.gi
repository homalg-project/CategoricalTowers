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
    local deduped_1_1, hoisted_2_1, deduped_4_1, deduped_5_1, deduped_9_1, deduped_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, deduped_14_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, deduped_19_1, hoisted_20_1, hoisted_21_1, deduped_22_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, deduped_30_1, hoisted_32_1, hoisted_33_1, hoisted_34_1, deduped_35_1, hoisted_36_1, deduped_37_1, hoisted_39_1, hoisted_40_1, hoisted_41_1, hoisted_42_1, hoisted_44_1, deduped_46_1, hoisted_47_1, deduped_48_1, deduped_50_1, hoisted_51_1, hoisted_52_1, deduped_53_1, hoisted_54_1, hoisted_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1, deduped_68_1, deduped_69_1, deduped_70_1, deduped_71_1, deduped_72_1, deduped_73_1, deduped_74_1, deduped_75_1, deduped_76_1, deduped_77_1, deduped_78_1, deduped_79_1, deduped_80_1, deduped_81_1, deduped_82_1, deduped_83_1, deduped_84_1, deduped_85_1, deduped_86_1, deduped_87_1, deduped_88_1, deduped_89_1, deduped_90_1, deduped_91_1, deduped_92_1, deduped_93_1, deduped_94_1, deduped_95_1, deduped_96_1, deduped_97_1, deduped_98_1, deduped_99_1, deduped_100_1, deduped_101_1, deduped_102_1, deduped_103_1, deduped_104_1, deduped_105_1;
    deduped_105_1 := UnderlyingCategory( cat_1 );
    deduped_104_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( b_1 );
    deduped_103_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( a_1 );
    deduped_102_1 := CreateCapCategoryObjectWithAttributes( deduped_105_1, IndexOfObject, 0 );
    deduped_101_1 := CreateCapCategoryObjectWithAttributes( deduped_105_1, IndexOfObject, 1 );
    deduped_100_1 := deduped_104_1[4];
    deduped_99_1 := deduped_103_1[4];
    deduped_98_1 := deduped_104_1[2];
    deduped_97_1 := deduped_103_1[2];
    deduped_96_1 := deduped_104_1[1];
    deduped_95_1 := deduped_103_1[1];
    deduped_94_1 := ListWithIdenticalEntries( deduped_97_1, deduped_96_1 );
    deduped_93_1 := deduped_95_1 + deduped_97_1;
    deduped_92_1 := 3 * deduped_97_1;
    deduped_91_1 := 2 * deduped_95_1;
    deduped_90_1 := [ 0 .. deduped_97_1 - 1 ];
    deduped_89_1 := [ 0 .. deduped_95_1 - 1 ];
    deduped_88_1 := [ 0 .. deduped_96_1 - 1 ];
    deduped_87_1 := [ 0 .. deduped_98_1 - 1 ];
    deduped_86_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_105_1, deduped_101_1, deduped_102_1, IndexOfMorphism, 1 ), CreateCapCategoryMorphismWithAttributes( deduped_105_1, deduped_102_1, deduped_101_1, IndexOfMorphism, 2 ), CreateCapCategoryMorphismWithAttributes( deduped_105_1, deduped_102_1, deduped_101_1, IndexOfMorphism, 3 ) ];
    deduped_85_1 := [ deduped_104_1[3], List( deduped_100_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_100_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_84_1 := ListWithIdenticalEntries( deduped_92_1, deduped_96_1 );
    deduped_83_1 := deduped_91_1 + deduped_92_1;
    deduped_82_1 := deduped_93_1 - 1;
    deduped_81_1 := Concatenation( ListWithIdenticalEntries( deduped_95_1, deduped_96_1 ), ListWithIdenticalEntries( deduped_97_1, deduped_98_1 ) );
    deduped_80_1 := [ 0 .. deduped_82_1 ];
    deduped_79_1 := [ 0 .. deduped_92_1 - 1 ];
    deduped_78_1 := [ 0 .. deduped_91_1 - 1 ];
    deduped_77_1 := ListWithIdenticalEntries( deduped_92_1, deduped_88_1 );
    deduped_76_1 := ListWithIdenticalEntries( deduped_97_1, deduped_88_1 );
    deduped_75_1 := deduped_83_1 - 1;
    deduped_74_1 := Concatenation( ListWithIdenticalEntries( deduped_91_1, deduped_96_1 ), ListWithIdenticalEntries( deduped_92_1, deduped_98_1 ) );
    deduped_73_1 := Product( deduped_81_1 );
    deduped_72_1 := [ 0 .. deduped_75_1 ];
    deduped_71_1 := [ 0 .. Sum( [ deduped_95_1, deduped_97_1, deduped_97_1 ] ) - 1 ];
    deduped_70_1 := ListWithIdenticalEntries( deduped_97_1, deduped_73_1 );
    deduped_69_1 := Product( deduped_74_1 );
    deduped_68_1 := [ 0 .. Sum( [ deduped_91_1, deduped_92_1, deduped_92_1 ] ) - 1 ];
    deduped_67_1 := [ 0 .. deduped_73_1 - 1 ];
    deduped_63_1 := [ 0 .. deduped_69_1 - 1 ];
    deduped_22_1 := [ deduped_91_1 .. deduped_75_1 ];
    deduped_66_1 := List( deduped_79_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := deduped_22_1[1 + i_2];
            hoisted_2_2 := deduped_74_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_74_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_63_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_5_1 := [ deduped_95_1 .. deduped_82_1 ];
    deduped_65_1 := List( deduped_90_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := deduped_5_1[1 + i_2];
            hoisted_2_2 := deduped_81_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_81_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_67_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_64_1 := ListWithIdenticalEntries( deduped_92_1, deduped_69_1 );
    deduped_62_1 := deduped_85_1[SafeUniquePositionProperty( deduped_86_1, function ( mor_2 )
             if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                 return IndexOfMorphism( mor_2 ) = 3;
             else
                 return false;
             fi;
             return;
         end )];
    deduped_61_1 := deduped_85_1[SafeUniquePositionProperty( deduped_86_1, function ( mor_2 )
             if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                 return IndexOfMorphism( mor_2 ) = 2;
             else
                 return false;
             fi;
             return;
         end )];
    deduped_60_1 := deduped_85_1[SafeUniquePositionProperty( deduped_86_1, function ( mor_2 )
             if IndexOfObject( Source( mor_2 ) ) = 1 and IndexOfObject( Range( mor_2 ) ) = 0 then
                 return IndexOfMorphism( mor_2 ) = 1;
             else
                 return false;
             fi;
             return;
         end )];
    hoisted_33_1 := Concatenation( List( deduped_78_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2;
              hoisted_2_2 := deduped_74_1[1 + i_2];
              hoisted_1_2 := Product( deduped_74_1{[ 1 .. i_2 ]} );
              return List( deduped_63_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), deduped_66_1, deduped_66_1 );
    hoisted_32_1 := Concatenation( ListWithIdenticalEntries( deduped_91_1, deduped_60_1 ), ListWithIdenticalEntries( deduped_92_1, deduped_61_1 ), ListWithIdenticalEntries( deduped_92_1, deduped_62_1 ) );
    deduped_19_1 := Concatenation( ListWithIdenticalEntries( deduped_91_1, deduped_69_1 ), deduped_64_1, deduped_64_1 );
    hoisted_34_1 := List( deduped_68_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_32_1[deduped_3_2];
            hoisted_1_2 := hoisted_33_1[deduped_3_2];
            return List( [ 0 .. deduped_19_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_29_1 := Concatenation( ListWithIdenticalEntries( deduped_91_1, deduped_98_1 ), deduped_84_1, deduped_84_1 );
    deduped_30_1 := List( deduped_68_1, function ( j_2 )
            return Product( hoisted_29_1{[ 1 .. j_2 ]} );
        end );
    hoisted_26_1 := [ 1, 0, 1 ];
    hoisted_25_1 := [ 0, 0, 1 ];
    hoisted_21_1 := [ 1, 2 ];
    deduped_10_1 := List( deduped_99_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_9_1 := List( deduped_99_1, function ( a_2 )
            return a_2[1];
        end );
    deduped_4_1 := deduped_103_1[3];
    hoisted_27_1 := Concatenation( List( deduped_78_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
              deduped_4_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
              deduped_3_2 := deduped_22_1[1 + CAP_JIT_INCOMPLETE_LOGIC( (CAP_JIT_INCOMPLETE_LOGIC( hoisted_21_1[1 + REM_INT( deduped_4_2, 2 )] ) + CAP_JIT_INCOMPLETE_LOGIC( deduped_4_1[(1 + REM_INT( QUO_INT( deduped_4_2, 2 ), deduped_95_1 ))] ) * 3) )];
              hoisted_2_2 := deduped_74_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_74_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_63_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_79_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
              deduped_4_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
              deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( hoisted_25_1[1 + REM_INT( deduped_4_2, 3 )] ) + CAP_JIT_INCOMPLETE_LOGIC( deduped_9_1[(1 + REM_INT( QUO_INT( deduped_4_2, 3 ), deduped_97_1 ))] ) * 2 );
              hoisted_2_2 := deduped_74_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_74_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_63_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_79_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
              deduped_4_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
              deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( hoisted_26_1[1 + REM_INT( deduped_4_2, 3 )] ) + CAP_JIT_INCOMPLETE_LOGIC( deduped_10_1[(1 + REM_INT( QUO_INT( deduped_4_2, 3 ), deduped_97_1 ))] ) * 2 );
              hoisted_2_2 := deduped_74_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_74_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_63_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_20_1 := Concatenation( ListWithIdenticalEntries( deduped_91_1, deduped_87_1 ), deduped_77_1, deduped_77_1 );
    hoisted_28_1 := List( deduped_68_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_20_1[deduped_3_2];
            hoisted_1_2 := hoisted_27_1[deduped_3_2];
            return List( [ 0 .. deduped_19_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_59_1 := Filtered( deduped_63_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_68_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_28_1[deduped_1_3][deduped_1_2] * deduped_30_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_68_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_34_1[deduped_1_3][deduped_1_2] * deduped_30_1[deduped_1_3];
                    end ) );
        end );
    hoisted_17_1 := Concatenation( List( deduped_89_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2;
              hoisted_2_2 := deduped_81_1[1 + i_2];
              hoisted_1_2 := Product( deduped_81_1{[ 1 .. i_2 ]} );
              return List( deduped_67_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), deduped_65_1, deduped_65_1 );
    hoisted_16_1 := Concatenation( ListWithIdenticalEntries( deduped_95_1, deduped_60_1 ), ListWithIdenticalEntries( deduped_97_1, deduped_61_1 ), ListWithIdenticalEntries( deduped_97_1, deduped_62_1 ) );
    deduped_1_1 := Concatenation( ListWithIdenticalEntries( deduped_95_1, deduped_73_1 ), deduped_70_1, deduped_70_1 );
    hoisted_18_1 := List( deduped_71_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_16_1[deduped_3_2];
            hoisted_1_2 := hoisted_17_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_13_1 := Concatenation( ListWithIdenticalEntries( deduped_95_1, deduped_98_1 ), deduped_94_1, deduped_94_1 );
    deduped_14_1 := List( deduped_71_1, function ( j_2 )
            return Product( hoisted_13_1{[ 1 .. j_2 ]} );
        end );
    hoisted_11_1 := Concatenation( List( deduped_89_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_5_1[1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_4_1[(1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), deduped_95_1 ))] )];
              hoisted_2_2 := deduped_81_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_81_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_67_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_90_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_9_1[1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), deduped_97_1 )] );
              hoisted_2_2 := deduped_81_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_81_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_67_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_90_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_10_1[1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), deduped_97_1 )] );
              hoisted_2_2 := deduped_81_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_81_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_67_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_2_1 := Concatenation( ListWithIdenticalEntries( deduped_95_1, deduped_87_1 ), deduped_76_1, deduped_76_1 );
    hoisted_12_1 := List( deduped_71_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_2_1[deduped_3_2];
            hoisted_1_2 := hoisted_11_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_58_1 := Filtered( deduped_67_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_71_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_12_1[deduped_1_3][deduped_1_2] * deduped_14_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_71_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_18_1[deduped_1_3][deduped_1_2] * deduped_14_1[deduped_1_3];
                    end ) );
        end );
    deduped_57_1 := Length( deduped_59_1 );
    deduped_56_1 := Length( deduped_58_1 );
    hoisted_54_1 := Concatenation( List( deduped_89_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( 1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 ) * 2 );
              hoisted_2_2 := deduped_74_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_74_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_63_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_90_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_22_1[1 + CAP_JIT_INCOMPLETE_LOGIC( (2 + CAP_JIT_INCOMPLETE_LOGIC( i_2 ) * 3) )];
              hoisted_2_2 := deduped_74_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_74_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_63_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_50_1 := Concatenation( ListWithIdenticalEntries( deduped_95_1, deduped_69_1 ), ListWithIdenticalEntries( deduped_97_1, deduped_69_1 ) );
    deduped_46_1 := Concatenation( ListWithIdenticalEntries( deduped_95_1, deduped_88_1 ), ListWithIdenticalEntries( deduped_97_1, deduped_87_1 ) );
    hoisted_55_1 := List( deduped_80_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := deduped_46_1[deduped_3_2];
            hoisted_1_2 := hoisted_54_1[deduped_3_2];
            return List( [ 0 .. deduped_50_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_48_1 := List( deduped_80_1, function ( j_2 )
            return Product( deduped_81_1{[ 1 .. j_2 ]} );
        end );
    hoisted_47_1 := List( [ 1 .. deduped_93_1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := deduped_46_1[i_2];
            hoisted_2_2 := deduped_81_1[i_2];
            hoisted_1_2 := Product( deduped_81_1{[ 1 .. i_2 - 1 ]} );
            return List( deduped_67_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    deduped_53_1 := List( deduped_67_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_80_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_47_1[deduped_1_3][hoisted_1_2] * deduped_48_1[deduped_1_3];
                end );
        end );
    hoisted_51_1 := Concatenation( List( deduped_89_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( i_2 ) * 2 );
              hoisted_2_2 := deduped_74_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_74_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_63_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_90_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_22_1[1 + CAP_JIT_INCOMPLETE_LOGIC( (1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 ) * 3) )];
              hoisted_2_2 := deduped_74_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_74_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_63_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_52_1 := List( deduped_80_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := deduped_46_1[deduped_3_2];
            hoisted_1_2 := hoisted_51_1[deduped_3_2];
            return List( [ 0 .. deduped_50_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_37_1 := List( deduped_72_1, function ( j_2 )
            return Product( deduped_74_1{[ 1 .. j_2 ]} );
        end );
    deduped_35_1 := Concatenation( ListWithIdenticalEntries( deduped_91_1, deduped_88_1 ), ListWithIdenticalEntries( deduped_92_1, deduped_87_1 ) );
    hoisted_36_1 := List( [ 1 .. deduped_83_1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := deduped_35_1[i_2];
            hoisted_2_2 := deduped_74_1[i_2];
            hoisted_1_2 := Product( deduped_74_1{[ 1 .. i_2 - 1 ]} );
            return List( deduped_63_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    hoisted_44_1 := List( deduped_63_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_72_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_36_1[deduped_1_3][hoisted_1_2] * deduped_37_1[deduped_1_3];
                end );
        end );
    hoisted_40_1 := [ 0, 0, 0 ];
    hoisted_41_1 := Concatenation( List( deduped_78_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), 2 ), deduped_95_1 ) );
              hoisted_2_2 := deduped_81_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_81_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_67_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_79_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
              deduped_4_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
              deduped_3_2 := deduped_5_1[1 + CAP_JIT_INCOMPLETE_LOGIC( (CAP_JIT_INCOMPLETE_LOGIC( hoisted_40_1[1 + REM_INT( deduped_4_2, 3 )] ) + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( deduped_4_2, 3 ), deduped_97_1 ) )) )];
              hoisted_2_2 := deduped_81_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_81_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_67_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_39_1 := Concatenation( ListWithIdenticalEntries( deduped_91_1, deduped_73_1 ), ListWithIdenticalEntries( deduped_92_1, deduped_73_1 ) );
    hoisted_42_1 := List( deduped_72_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := deduped_35_1[deduped_3_2];
            hoisted_1_2 := hoisted_41_1[deduped_3_2];
            return List( [ 0 .. hoisted_39_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets, NTuple( 4, deduped_56_1, deduped_57_1, List( [ 0 .. deduped_56_1 - 1 ], function ( x_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_58_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))] );
                return -1 + BigInt( SafePosition( deduped_59_1, CAP_JIT_INCOMPLETE_LOGIC( hoisted_44_1[(1 + Sum( deduped_72_1, function ( j_3 )
                                   local deduped_1_3;
                                   deduped_1_3 := (1 + j_3);
                                   return hoisted_42_1[deduped_1_3][hoisted_1_2] * deduped_37_1[deduped_1_3];
                               end ))] ) ) );
            end ), List( [ 0 .. deduped_57_1 - 1 ], function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_59_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))] );
                return NTuple( 2, -1 + BigInt( SafePosition( deduped_58_1, CAP_JIT_INCOMPLETE_LOGIC( deduped_53_1[(1 + Sum( deduped_80_1, function ( j_3 )
                                     local deduped_1_3;
                                     deduped_1_3 := (1 + j_3);
                                     return hoisted_52_1[deduped_1_3][deduped_1_2] * deduped_48_1[deduped_1_3];
                                 end ))] ) ) ), -1 + BigInt( SafePosition( deduped_58_1, CAP_JIT_INCOMPLETE_LOGIC( deduped_53_1[(1 + Sum( deduped_80_1, function ( j_3 )
                                     local deduped_1_3;
                                     deduped_1_3 := (1 + j_3);
                                     return hoisted_55_1[deduped_1_3][deduped_1_2] * deduped_48_1[deduped_1_3];
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
    return CategoryOfReflexiveQuiversEnrichedOver( SkeletalCategoryOfFiniteSets(  : FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_FinReflexiveQuiversAsCCCPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
