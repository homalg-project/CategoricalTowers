# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_CategoryFromNerveDataHomStructureOnMorphismsPrecompiled", function ( cat )
    
    ##
    AddHomomorphismStructureOnMorphismsWithGivenObjects( cat,
        
########
function ( cat_1, source_1, alpha_1, beta_1, range_1 )
    local deduped_5_1, deduped_6_1, deduped_8_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, deduped_15_1, hoisted_16_1, hoisted_18_1, deduped_21_1, hoisted_23_1, hoisted_24_1, deduped_27_1, hoisted_28_1, deduped_31_1, hoisted_32_1, hoisted_34_1, deduped_37_1, hoisted_39_1, hoisted_40_1, hoisted_42_1, hoisted_45_1, deduped_46_1, hoisted_47_1, hoisted_49_1, hoisted_50_1, hoisted_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1, deduped_68_1, deduped_69_1, deduped_70_1, deduped_71_1, deduped_72_1, deduped_73_1, deduped_74_1, deduped_75_1, deduped_76_1, deduped_77_1, deduped_78_1, deduped_79_1, deduped_80_1, deduped_81_1, deduped_82_1, deduped_83_1, deduped_84_1, deduped_85_1, deduped_86_1, deduped_87_1, deduped_88_1, deduped_89_1, deduped_90_1, deduped_91_1, deduped_92_1, deduped_93_1, deduped_94_1, deduped_95_1, deduped_96_1;
    deduped_96_1 := MapOfMorphism( beta_1 );
    deduped_95_1 := MapOfMorphism( alpha_1 );
    deduped_94_1 := NerveData( cat_1 );
    deduped_93_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_92_1 := MapOfObject( Target( beta_1 ) );
    deduped_91_1 := MapOfObject( Source( alpha_1 ) );
    deduped_90_1 := deduped_94_1[2];
    deduped_89_1 := deduped_90_1[3];
    deduped_88_1 := deduped_90_1[2];
    deduped_87_1 := deduped_90_1[6];
    deduped_86_1 := deduped_90_1[7];
    deduped_85_1 := Length( Source( deduped_89_1 ) );
    deduped_84_1 := Length( Source( deduped_88_1 ) );
    deduped_83_1 := Length( Source( deduped_86_1 ) );
    deduped_82_1 := deduped_85_1 * deduped_84_1;
    deduped_81_1 := deduped_85_1 * Length( Source( deduped_92_1 ) );
    deduped_80_1 := deduped_84_1 * Length( Source( deduped_91_1 ) );
    deduped_79_1 := deduped_83_1 * Length( Source( deduped_87_1 ) );
    deduped_78_1 := [ 0 .. deduped_81_1 - 1 ];
    deduped_77_1 := [ 0 .. deduped_80_1 - 1 ];
    deduped_76_1 := [ 0 .. deduped_79_1 - 1 ];
    deduped_31_1 := AsList( deduped_89_1 );
    deduped_27_1 := AsList( deduped_88_1 );
    deduped_75_1 := Filtered( [ 0 .. deduped_82_1 - 1 ], function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( deduped_31_1[1 + RemIntWithDomain( deduped_1_2, deduped_85_1, deduped_82_1 )] ) = CAP_JIT_INCOMPLETE_LOGIC( deduped_27_1[1 + QuoIntWithDomain( deduped_1_2, deduped_85_1, deduped_82_1 )] );
        end );
    hoisted_32_1 := AsList( deduped_92_1 );
    deduped_74_1 := Filtered( deduped_78_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( deduped_31_1[1 + RemIntWithDomain( deduped_1_2, deduped_85_1, deduped_81_1 )] ) = CAP_JIT_INCOMPLETE_LOGIC( hoisted_32_1[1 + QuoIntWithDomain( deduped_1_2, deduped_85_1, deduped_81_1 )] );
        end );
    hoisted_28_1 := AsList( deduped_91_1 );
    deduped_73_1 := Filtered( deduped_77_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( deduped_27_1[1 + RemIntWithDomain( deduped_1_2, deduped_84_1, deduped_80_1 )] ) = CAP_JIT_INCOMPLETE_LOGIC( hoisted_28_1[1 + QuoIntWithDomain( deduped_1_2, deduped_84_1, deduped_80_1 )] );
        end );
    deduped_6_1 := AsList( deduped_87_1 );
    deduped_5_1 := AsList( deduped_86_1 );
    deduped_72_1 := Filtered( deduped_76_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( deduped_5_1[1 + RemIntWithDomain( deduped_1_2, deduped_83_1, deduped_79_1 )] ) = CAP_JIT_INCOMPLETE_LOGIC( deduped_6_1[1 + QuoIntWithDomain( deduped_1_2, deduped_83_1, deduped_79_1 )] );
        end );
    deduped_71_1 := BigInt( Length( deduped_74_1 ) );
    deduped_70_1 := BigInt( Length( deduped_73_1 ) );
    deduped_69_1 := BigInt( Length( deduped_72_1 ) );
    deduped_68_1 := deduped_70_1 * deduped_71_1;
    deduped_67_1 := deduped_69_1 * Length( Source( deduped_96_1 ) );
    deduped_66_1 := deduped_69_1 * Length( Source( deduped_95_1 ) );
    deduped_65_1 := [ 0 .. deduped_69_1 - 1 ];
    deduped_64_1 := [ 0 .. deduped_68_1 - 1 ];
    deduped_63_1 := [ 0 .. deduped_67_1 - 1 ];
    deduped_62_1 := [ 0 .. deduped_66_1 - 1 ];
    hoisted_39_1 := List( deduped_78_1, function ( i_2 )
            return RemIntWithDomain( i_2, deduped_85_1, deduped_81_1 );
        end );
    hoisted_40_1 := List( [ 0 .. deduped_71_1 - 1 ], function ( i_2 )
            return hoisted_39_1[1 + deduped_74_1[1 + i_2]];
        end );
    hoisted_34_1 := List( deduped_77_1, function ( i_2 )
            return RemIntWithDomain( i_2, deduped_84_1, deduped_80_1 );
        end );
    deduped_37_1 := List( [ 0 .. deduped_70_1 - 1 ], function ( i_2 )
            return hoisted_34_1[1 + deduped_73_1[1 + i_2]];
        end );
    deduped_61_1 := Filtered( deduped_64_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( deduped_37_1[1 + RemIntWithDomain( deduped_1_2, deduped_70_1, deduped_68_1 )] ) = CAP_JIT_INCOMPLETE_LOGIC( hoisted_40_1[1 + QuoIntWithDomain( deduped_1_2, deduped_70_1, deduped_68_1 )] );
        end );
    hoisted_16_1 := AsList( deduped_96_1 );
    hoisted_13_1 := List( deduped_76_1, function ( i_2 )
            return QuoIntWithDomain( i_2, deduped_83_1, deduped_79_1 );
        end );
    deduped_15_1 := List( deduped_65_1, function ( i_2 )
            return deduped_5_1[1 + hoisted_13_1[1 + deduped_72_1[1 + i_2]]];
        end );
    deduped_60_1 := Filtered( deduped_63_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( deduped_15_1[1 + RemIntWithDomain( deduped_1_2, deduped_69_1, deduped_67_1 )] ) = CAP_JIT_INCOMPLETE_LOGIC( hoisted_16_1[1 + QuoIntWithDomain( deduped_1_2, deduped_69_1, deduped_67_1 )] );
        end );
    hoisted_12_1 := AsList( deduped_95_1 );
    deduped_8_1 := List( deduped_76_1, function ( i_2 )
            return RemIntWithDomain( i_2, deduped_83_1, deduped_79_1 );
        end );
    hoisted_11_1 := List( deduped_65_1, function ( i_2 )
            return deduped_6_1[1 + deduped_8_1[1 + deduped_72_1[1 + i_2]]];
        end );
    deduped_59_1 := Filtered( deduped_62_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( hoisted_11_1[1 + RemIntWithDomain( deduped_1_2, deduped_69_1, deduped_66_1 )] ) = CAP_JIT_INCOMPLETE_LOGIC( hoisted_12_1[1 + QuoIntWithDomain( deduped_1_2, deduped_69_1, deduped_66_1 )] );
        end );
    deduped_58_1 := BigInt( Length( deduped_61_1 ) );
    deduped_57_1 := BigInt( Length( deduped_60_1 ) );
    deduped_56_1 := BigInt( Length( deduped_59_1 ) );
    deduped_55_1 := deduped_56_1 * deduped_57_1;
    deduped_54_1 := [ 0 .. deduped_55_1 - 1 ];
    hoisted_23_1 := List( deduped_63_1, function ( i_2 )
            return RemIntWithDomain( i_2, deduped_69_1, deduped_67_1 );
        end );
    hoisted_24_1 := List( [ 0 .. deduped_57_1 - 1 ], function ( i_2 )
            return hoisted_23_1[1 + deduped_60_1[1 + i_2]];
        end );
    hoisted_18_1 := List( deduped_62_1, function ( i_2 )
            return RemIntWithDomain( i_2, deduped_69_1, deduped_66_1 );
        end );
    deduped_21_1 := List( [ 0 .. deduped_56_1 - 1 ], function ( i_2 )
            return hoisted_18_1[1 + deduped_59_1[1 + i_2]];
        end );
    deduped_53_1 := Filtered( deduped_54_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( deduped_21_1[1 + RemIntWithDomain( deduped_1_2, deduped_56_1, deduped_55_1 )] ) = CAP_JIT_INCOMPLETE_LOGIC( hoisted_24_1[1 + QuoIntWithDomain( deduped_1_2, deduped_56_1, deduped_55_1 )] );
        end );
    deduped_52_1 := BigInt( Length( deduped_53_1 ) );
    hoisted_42_1 := List( deduped_64_1, function ( i_2 )
            return RemIntWithDomain( i_2, deduped_70_1, deduped_68_1 );
        end );
    hoisted_51_1 := List( [ 0 .. deduped_58_1 - 1 ], function ( i_2 )
            return deduped_37_1[1 + hoisted_42_1[1 + deduped_61_1[1 + i_2]]];
        end );
    hoisted_45_1 := List( [ 0 .. Length( deduped_94_1[1][3] ) - 1 ], function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return -1 + BigInt( SafePosition( deduped_75_1, CAP_JIT_INCOMPLETE_LOGIC( deduped_6_1[deduped_1_2] + deduped_5_1[deduped_1_2] * deduped_85_1 ) ) );
        end );
    hoisted_47_1 := List( [ 0 .. BigInt( Length( deduped_75_1 ) ) - 1 ], function ( x_2 )
            return -1 + BigInt( SafePosition( hoisted_45_1, x_2 ) );
        end );
    deduped_46_1 := AsList( deduped_90_1[8] );
    hoisted_50_1 := List( deduped_65_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return deduped_46_1[1 + hoisted_47_1[1 + CAP_JIT_INCOMPLETE_LOGIC( -1 + BigInt( SafePosition( deduped_75_1, CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( deduped_46_1[1 + deduped_8_1[1 + deduped_72_1[1 + deduped_1_2]]] ) + deduped_15_1[1 + deduped_1_2] * deduped_85_1 ) ) ) )]];
        end );
    hoisted_49_1 := List( deduped_54_1, function ( i_2 )
            return RemIntWithDomain( i_2, deduped_56_1, deduped_55_1 );
        end );
    return CreateCapCategoryMorphismWithAttributes( deduped_93_1, CreateCapCategoryObjectWithAttributes( deduped_93_1, Length, deduped_52_1 ), CreateCapCategoryObjectWithAttributes( deduped_93_1, Length, deduped_58_1 ), AsList, List( [ 0 .. deduped_52_1 - 1 ], function ( x_2 )
              return -1 + BigInt( SafePosition( hoisted_51_1, CAP_JIT_INCOMPLETE_LOGIC( hoisted_50_1[1 + deduped_21_1[1 + hoisted_49_1[1 + deduped_53_1[1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 )]]]] ) ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.HomomorphismStructureOnMorphismsWithGivenObjects :=
        
########
function ( cat_1, source_1, alpha_1, beta_1, range_1 )
    local deduped_5_1, hoisted_6_1, deduped_7_1, hoisted_8_1, deduped_10_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, deduped_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_24_1, deduped_27_1, hoisted_28_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, deduped_35_1, hoisted_36_1, hoisted_37_1, hoisted_38_1, deduped_41_1, hoisted_42_1, hoisted_43_1, hoisted_44_1, hoisted_46_1, deduped_49_1, hoisted_50_1, hoisted_52_1, hoisted_53_1, hoisted_54_1, hoisted_56_1, hoisted_58_1, hoisted_59_1, hoisted_60_1, hoisted_62_1, deduped_63_1, hoisted_64_1, hoisted_65_1, hoisted_66_1, hoisted_67_1, hoisted_69_1, hoisted_70_1, hoisted_71_1, hoisted_72_1, deduped_73_1, deduped_74_1, deduped_75_1, deduped_76_1, deduped_77_1, deduped_78_1, deduped_79_1, deduped_80_1, deduped_81_1, deduped_82_1, deduped_83_1, deduped_84_1, deduped_85_1, deduped_86_1, deduped_87_1, deduped_88_1, deduped_89_1, deduped_90_1, deduped_91_1, deduped_92_1, deduped_93_1, deduped_94_1, deduped_95_1, deduped_96_1, deduped_97_1, deduped_98_1, deduped_99_1, deduped_100_1, deduped_101_1, deduped_102_1, deduped_103_1, deduped_104_1, deduped_105_1, deduped_106_1, deduped_107_1, deduped_108_1, deduped_109_1, deduped_110_1, deduped_111_1, deduped_112_1, deduped_113_1, deduped_114_1, deduped_115_1, deduped_116_1, deduped_117_1, deduped_118_1, deduped_119_1, deduped_120_1;
    deduped_120_1 := MapOfMorphism( beta_1 );
    deduped_119_1 := MapOfMorphism( alpha_1 );
    deduped_118_1 := NerveData( cat_1 );
    deduped_117_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_116_1 := MapOfObject( Target( beta_1 ) );
    deduped_115_1 := MapOfObject( Source( alpha_1 ) );
    deduped_114_1 := deduped_118_1[2];
    deduped_113_1 := deduped_114_1[3];
    deduped_112_1 := deduped_114_1[2];
    deduped_111_1 := deduped_114_1[6];
    deduped_110_1 := deduped_114_1[7];
    deduped_109_1 := Length( Source( deduped_113_1 ) );
    deduped_108_1 := Length( Source( deduped_112_1 ) );
    deduped_107_1 := Length( Source( deduped_110_1 ) );
    deduped_106_1 := [ 0 .. Length( deduped_118_1[1][3] ) - 1 ];
    deduped_105_1 := deduped_109_1 * deduped_108_1;
    deduped_104_1 := deduped_109_1 * Length( Source( deduped_116_1 ) );
    deduped_103_1 := deduped_108_1 * Length( Source( deduped_115_1 ) );
    deduped_102_1 := deduped_107_1 * Length( Source( deduped_111_1 ) );
    deduped_101_1 := [ 0 .. deduped_105_1 - 1 ];
    deduped_100_1 := [ 0 .. deduped_104_1 - 1 ];
    deduped_99_1 := [ 0 .. deduped_103_1 - 1 ];
    deduped_98_1 := [ 0 .. deduped_102_1 - 1 ];
    deduped_35_1 := AsList( deduped_112_1 );
    hoisted_59_1 := List( deduped_101_1, function ( i_2 )
            return deduped_35_1[1 + QuoIntWithDomain( i_2, deduped_109_1, deduped_105_1 )];
        end );
    deduped_41_1 := AsList( deduped_113_1 );
    hoisted_58_1 := List( deduped_101_1, function ( i_2 )
            return deduped_41_1[1 + RemIntWithDomain( i_2, deduped_109_1, deduped_105_1 )];
        end );
    deduped_97_1 := Filtered( deduped_101_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + x_2;
            return hoisted_58_1[deduped_1_2] = hoisted_59_1[deduped_1_2];
        end );
    hoisted_43_1 := AsList( deduped_116_1 );
    hoisted_44_1 := List( deduped_100_1, function ( i_2 )
            return hoisted_43_1[1 + QuoIntWithDomain( i_2, deduped_109_1, deduped_104_1 )];
        end );
    hoisted_42_1 := List( deduped_100_1, function ( i_2 )
            return deduped_41_1[1 + RemIntWithDomain( i_2, deduped_109_1, deduped_104_1 )];
        end );
    deduped_96_1 := Filtered( deduped_100_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + x_2;
            return hoisted_42_1[deduped_1_2] = hoisted_44_1[deduped_1_2];
        end );
    hoisted_37_1 := AsList( deduped_115_1 );
    hoisted_38_1 := List( deduped_99_1, function ( i_2 )
            return hoisted_37_1[1 + QuoIntWithDomain( i_2, deduped_108_1, deduped_103_1 )];
        end );
    hoisted_36_1 := List( deduped_99_1, function ( i_2 )
            return deduped_35_1[1 + RemIntWithDomain( i_2, deduped_108_1, deduped_103_1 )];
        end );
    deduped_95_1 := Filtered( deduped_99_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + x_2;
            return hoisted_36_1[deduped_1_2] = hoisted_38_1[deduped_1_2];
        end );
    deduped_7_1 := AsList( deduped_111_1 );
    hoisted_8_1 := List( deduped_98_1, function ( i_2 )
            return deduped_7_1[1 + QuoIntWithDomain( i_2, deduped_107_1, deduped_102_1 )];
        end );
    deduped_5_1 := AsList( deduped_110_1 );
    hoisted_6_1 := List( deduped_98_1, function ( i_2 )
            return deduped_5_1[1 + RemIntWithDomain( i_2, deduped_107_1, deduped_102_1 )];
        end );
    deduped_94_1 := Filtered( deduped_98_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + x_2;
            return hoisted_6_1[deduped_1_2] = hoisted_8_1[deduped_1_2];
        end );
    deduped_93_1 := BigInt( Length( deduped_96_1 ) );
    deduped_92_1 := BigInt( Length( deduped_95_1 ) );
    deduped_91_1 := BigInt( Length( deduped_94_1 ) );
    deduped_90_1 := deduped_92_1 * deduped_93_1;
    deduped_89_1 := deduped_91_1 * Length( Source( deduped_120_1 ) );
    deduped_88_1 := deduped_91_1 * Length( Source( deduped_119_1 ) );
    deduped_87_1 := [ 0 .. deduped_91_1 - 1 ];
    deduped_86_1 := [ 0 .. deduped_90_1 - 1 ];
    deduped_85_1 := [ 0 .. deduped_89_1 - 1 ];
    deduped_84_1 := [ 0 .. deduped_88_1 - 1 ];
    hoisted_52_1 := List( deduped_100_1, function ( i_2 )
            return RemIntWithDomain( i_2, deduped_109_1, deduped_104_1 );
        end );
    hoisted_53_1 := List( [ 0 .. deduped_93_1 - 1 ], function ( i_2 )
            return hoisted_52_1[1 + deduped_96_1[1 + i_2]];
        end );
    hoisted_54_1 := List( deduped_86_1, function ( i_2 )
            return hoisted_53_1[1 + QuoIntWithDomain( i_2, deduped_92_1, deduped_90_1 )];
        end );
    hoisted_46_1 := List( deduped_99_1, function ( i_2 )
            return RemIntWithDomain( i_2, deduped_108_1, deduped_103_1 );
        end );
    deduped_49_1 := List( [ 0 .. deduped_92_1 - 1 ], function ( i_2 )
            return hoisted_46_1[1 + deduped_95_1[1 + i_2]];
        end );
    hoisted_50_1 := List( deduped_86_1, function ( i_2 )
            return deduped_49_1[1 + RemIntWithDomain( i_2, deduped_92_1, deduped_90_1 )];
        end );
    deduped_83_1 := Filtered( deduped_86_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + x_2;
            return hoisted_50_1[deduped_1_2] = hoisted_54_1[deduped_1_2];
        end );
    hoisted_21_1 := AsList( deduped_120_1 );
    hoisted_22_1 := List( deduped_85_1, function ( i_2 )
            return hoisted_21_1[1 + QuoIntWithDomain( i_2, deduped_91_1, deduped_89_1 )];
        end );
    hoisted_17_1 := List( deduped_98_1, function ( i_2 )
            return QuoIntWithDomain( i_2, deduped_107_1, deduped_102_1 );
        end );
    deduped_19_1 := List( deduped_87_1, function ( i_2 )
            return deduped_5_1[1 + hoisted_17_1[1 + deduped_94_1[1 + i_2]]];
        end );
    hoisted_20_1 := List( deduped_85_1, function ( i_2 )
            return deduped_19_1[1 + RemIntWithDomain( i_2, deduped_91_1, deduped_89_1 )];
        end );
    deduped_82_1 := Filtered( deduped_85_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + x_2;
            return hoisted_20_1[deduped_1_2] = hoisted_22_1[deduped_1_2];
        end );
    hoisted_15_1 := AsList( deduped_119_1 );
    hoisted_16_1 := List( deduped_84_1, function ( i_2 )
            return hoisted_15_1[1 + QuoIntWithDomain( i_2, deduped_91_1, deduped_88_1 )];
        end );
    deduped_10_1 := List( deduped_98_1, function ( i_2 )
            return RemIntWithDomain( i_2, deduped_107_1, deduped_102_1 );
        end );
    hoisted_13_1 := List( deduped_87_1, function ( i_2 )
            return deduped_7_1[1 + deduped_10_1[1 + deduped_94_1[1 + i_2]]];
        end );
    hoisted_14_1 := List( deduped_84_1, function ( i_2 )
            return hoisted_13_1[1 + RemIntWithDomain( i_2, deduped_91_1, deduped_88_1 )];
        end );
    deduped_81_1 := Filtered( deduped_84_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + x_2;
            return hoisted_14_1[deduped_1_2] = hoisted_16_1[deduped_1_2];
        end );
    deduped_80_1 := BigInt( Length( deduped_83_1 ) );
    deduped_79_1 := BigInt( Length( deduped_82_1 ) );
    deduped_78_1 := BigInt( Length( deduped_81_1 ) );
    deduped_77_1 := deduped_78_1 * deduped_79_1;
    deduped_76_1 := [ 0 .. deduped_77_1 - 1 ];
    hoisted_30_1 := List( deduped_85_1, function ( i_2 )
            return RemIntWithDomain( i_2, deduped_91_1, deduped_89_1 );
        end );
    hoisted_31_1 := List( [ 0 .. deduped_79_1 - 1 ], function ( i_2 )
            return hoisted_30_1[1 + deduped_82_1[1 + i_2]];
        end );
    hoisted_32_1 := List( deduped_76_1, function ( i_2 )
            return hoisted_31_1[1 + QuoIntWithDomain( i_2, deduped_78_1, deduped_77_1 )];
        end );
    hoisted_24_1 := List( deduped_84_1, function ( i_2 )
            return RemIntWithDomain( i_2, deduped_91_1, deduped_88_1 );
        end );
    deduped_27_1 := List( [ 0 .. deduped_78_1 - 1 ], function ( i_2 )
            return hoisted_24_1[1 + deduped_81_1[1 + i_2]];
        end );
    hoisted_28_1 := List( deduped_76_1, function ( i_2 )
            return deduped_27_1[1 + RemIntWithDomain( i_2, deduped_78_1, deduped_77_1 )];
        end );
    deduped_75_1 := Filtered( deduped_76_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + x_2;
            return hoisted_28_1[deduped_1_2] = hoisted_32_1[deduped_1_2];
        end );
    deduped_74_1 := BigInt( Length( deduped_75_1 ) );
    deduped_73_1 := [ 0 .. deduped_74_1 - 1 ];
    hoisted_56_1 := List( deduped_86_1, function ( i_2 )
            return RemIntWithDomain( i_2, deduped_92_1, deduped_90_1 );
        end );
    hoisted_72_1 := List( [ 0 .. deduped_80_1 - 1 ], function ( i_2 )
            return deduped_49_1[1 + hoisted_56_1[1 + deduped_83_1[1 + i_2]]];
        end );
    hoisted_60_1 := List( deduped_106_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return deduped_7_1[deduped_1_2] + deduped_5_1[deduped_1_2] * deduped_109_1;
        end );
    hoisted_62_1 := List( deduped_106_1, function ( x_2 )
            return -1 + BigInt( SafePosition( deduped_97_1, hoisted_60_1[1 + x_2] ) );
        end );
    hoisted_67_1 := List( [ 0 .. BigInt( Length( deduped_97_1 ) ) - 1 ], function ( x_2 )
            return -1 + BigInt( SafePosition( hoisted_62_1, x_2 ) );
        end );
    deduped_63_1 := AsList( deduped_114_1[8] );
    hoisted_64_1 := List( deduped_87_1, function ( i_2 )
            return deduped_63_1[1 + deduped_10_1[1 + deduped_94_1[1 + i_2]]];
        end );
    hoisted_65_1 := List( deduped_87_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return hoisted_64_1[deduped_1_2] + deduped_19_1[deduped_1_2] * deduped_109_1;
        end );
    hoisted_66_1 := List( deduped_87_1, function ( x_2 )
            return -1 + BigInt( SafePosition( deduped_97_1, hoisted_65_1[1 + x_2] ) );
        end );
    hoisted_70_1 := List( deduped_87_1, function ( i_2 )
            return deduped_63_1[1 + hoisted_67_1[1 + hoisted_66_1[1 + i_2]]];
        end );
    hoisted_69_1 := List( deduped_76_1, function ( i_2 )
            return RemIntWithDomain( i_2, deduped_78_1, deduped_77_1 );
        end );
    hoisted_71_1 := List( deduped_73_1, function ( i_2 )
            return hoisted_70_1[1 + deduped_27_1[1 + hoisted_69_1[1 + deduped_75_1[1 + i_2]]]];
        end );
    return CreateCapCategoryMorphismWithAttributes( deduped_117_1, CreateCapCategoryObjectWithAttributes( deduped_117_1, Length, deduped_74_1 ), CreateCapCategoryObjectWithAttributes( deduped_117_1, Length, deduped_80_1 ), AsList, List( deduped_73_1, function ( x_2 )
              return -1 + BigInt( SafePosition( hoisted_72_1, hoisted_71_1[1 + x_2] ) );
          end ) );
end
########
        
    ;
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        #Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
end );

BindGlobal( "CategoryFromNerveDataHomStructureOnMorphismsPrecompiled", function ( quiver )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function ( quiver )
    local sFinSets;
    sFinSets := SkeletalCategoryOfFiniteSets(  : FinalizeCategory := true );
    return CategoryFromNerveData( PathCategory( quiver : range_of_HomStructure := sFinSets,
          FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor( quiver : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_CategoryFromNerveDataHomStructureOnMorphismsPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
