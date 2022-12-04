# SPDX-License-Identifier: GPL-2.0-or-later
# Algebroids: Algebroids and bialgebroids as preadditive categories generated by enhanced quivers
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_CategoryFromNerveDataHomStructureOnMorphismsPrecompiled", function ( cat )
    
    ##
    AddHomomorphismStructureOnMorphismsWithGivenObjects( cat,
        
########
function ( cat_1, source_1, alpha_1, beta_1, range_1 )
    local hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, hoisted_34_1, hoisted_35_1, hoisted_36_1, hoisted_37_1, hoisted_38_1, hoisted_39_1, hoisted_40_1, hoisted_41_1, hoisted_42_1, hoisted_43_1, hoisted_44_1, hoisted_45_1, hoisted_46_1, hoisted_47_1, hoisted_48_1, hoisted_49_1, hoisted_50_1, hoisted_51_1, hoisted_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1, deduped_68_1, deduped_69_1, deduped_70_1, deduped_71_1, deduped_72_1, deduped_73_1, deduped_74_1, deduped_75_1, deduped_76_1, deduped_77_1, deduped_78_1, deduped_79_1, deduped_80_1, deduped_81_1, deduped_82_1, deduped_83_1, deduped_84_1, deduped_85_1, deduped_86_1, deduped_87_1, deduped_88_1, deduped_89_1, deduped_90_1, deduped_91_1, deduped_92_1, deduped_93_1, deduped_94_1, deduped_95_1, deduped_96_1;
    deduped_96_1 := MapOfMorphism( beta_1 );
    deduped_95_1 := MapOfMorphism( alpha_1 );
    deduped_94_1 := NerveTruncatedInDegree2Data( cat_1 );
    deduped_93_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_92_1 := MapOfObject( Range( beta_1 ) );
    deduped_91_1 := MapOfObject( Source( alpha_1 ) );
    deduped_90_1 := deduped_94_1[2];
    deduped_89_1 := deduped_90_1[3];
    deduped_88_1 := deduped_90_1[2];
    deduped_87_1 := Length( Source( deduped_96_1 ) );
    deduped_86_1 := Length( Source( deduped_95_1 ) );
    deduped_85_1 := deduped_90_1[6];
    deduped_84_1 := deduped_90_1[7];
    deduped_83_1 := Length( Source( deduped_92_1 ) );
    deduped_82_1 := Length( Source( deduped_91_1 ) );
    deduped_81_1 := Length( Source( deduped_89_1 ) );
    deduped_80_1 := Length( Source( deduped_88_1 ) );
    deduped_79_1 := Length( Source( deduped_85_1 ) );
    deduped_78_1 := Length( Source( deduped_84_1 ) );
    deduped_77_1 := [ 0 .. Length( deduped_94_1[1][3] ) - 1 ];
    deduped_76_1 := [ 0 .. deduped_81_1 * deduped_83_1 - 1 ];
    deduped_75_1 := [ 0 .. deduped_80_1 * deduped_82_1 - 1 ];
    deduped_74_1 := [ 0 .. deduped_78_1 * deduped_79_1 - 1 ];
    hoisted_29_1 := AsList( deduped_89_1 );
    hoisted_28_1 := deduped_81_1;
    hoisted_25_1 := AsList( deduped_88_1 );
    hoisted_24_1 := deduped_80_1;
    deduped_73_1 := Filtered( [ 0 .. deduped_81_1 * deduped_80_1 - 1 ], function ( x_2 )
            return hoisted_29_1[1 + REM_INT( x_2, hoisted_28_1 )] = hoisted_25_1[1 + REM_INT( QUO_INT( x_2, hoisted_28_1 ), hoisted_24_1 )];
        end );
    hoisted_31_1 := AsList( deduped_92_1 );
    hoisted_30_1 := deduped_83_1;
    deduped_72_1 := Filtered( deduped_76_1, function ( x_2 )
            return hoisted_29_1[1 + REM_INT( x_2, hoisted_28_1 )] = hoisted_31_1[1 + REM_INT( QUO_INT( x_2, hoisted_28_1 ), hoisted_30_1 )];
        end );
    hoisted_27_1 := AsList( deduped_91_1 );
    hoisted_26_1 := deduped_82_1;
    deduped_71_1 := Filtered( deduped_75_1, function ( x_2 )
            return hoisted_25_1[1 + REM_INT( x_2, hoisted_24_1 )] = hoisted_27_1[1 + REM_INT( QUO_INT( x_2, hoisted_24_1 ), hoisted_26_1 )];
        end );
    hoisted_6_1 := AsList( deduped_85_1 );
    hoisted_5_1 := deduped_79_1;
    hoisted_4_1 := AsList( deduped_84_1 );
    hoisted_3_1 := deduped_78_1;
    deduped_70_1 := Filtered( deduped_74_1, function ( x_2 )
            return hoisted_4_1[1 + REM_INT( x_2, hoisted_3_1 )] = hoisted_6_1[1 + REM_INT( QUO_INT( x_2, hoisted_3_1 ), hoisted_5_1 )];
        end );
    deduped_69_1 := Length( deduped_72_1 );
    deduped_68_1 := Length( deduped_71_1 );
    deduped_67_1 := Length( deduped_70_1 );
    deduped_66_1 := [ 0 .. deduped_67_1 - 1 ];
    deduped_65_1 := [ 0 .. deduped_68_1 * deduped_69_1 - 1 ];
    deduped_64_1 := [ 0 .. deduped_67_1 * deduped_87_1 - 1 ];
    deduped_63_1 := [ 0 .. deduped_67_1 * deduped_86_1 - 1 ];
    hoisted_37_1 := deduped_76_1;
    hoisted_36_1 := deduped_72_1;
    hoisted_39_1 := List( [ 0 .. deduped_69_1 - 1 ], function ( i_2 )
            return REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_37_1[1 + hoisted_36_1[(1 + i_2)]] ), hoisted_28_1 );
        end );
    hoisted_38_1 := deduped_69_1;
    hoisted_33_1 := deduped_75_1;
    hoisted_32_1 := deduped_71_1;
    hoisted_35_1 := List( [ 0 .. deduped_68_1 - 1 ], function ( i_2 )
            return REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_33_1[1 + hoisted_32_1[(1 + i_2)]] ), hoisted_24_1 );
        end );
    hoisted_34_1 := deduped_68_1;
    deduped_62_1 := Filtered( deduped_65_1, function ( x_2 )
            return hoisted_35_1[1 + REM_INT( x_2, hoisted_34_1 )] = hoisted_39_1[1 + REM_INT( QUO_INT( x_2, hoisted_34_1 ), hoisted_38_1 )];
        end );
    hoisted_15_1 := AsList( deduped_96_1 );
    hoisted_14_1 := deduped_87_1;
    hoisted_8_1 := deduped_74_1;
    hoisted_7_1 := deduped_70_1;
    hoisted_13_1 := List( deduped_66_1, function ( logic_new_func_x_2 )
            return hoisted_4_1[1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_8_1[(1 + hoisted_7_1[(1 + logic_new_func_x_2)])] ), hoisted_3_1 ), hoisted_5_1 )];
        end );
    hoisted_9_1 := deduped_67_1;
    deduped_61_1 := Filtered( deduped_64_1, function ( x_2 )
            return hoisted_13_1[1 + REM_INT( x_2, hoisted_9_1 )] = hoisted_15_1[1 + REM_INT( QUO_INT( x_2, hoisted_9_1 ), hoisted_14_1 )];
        end );
    hoisted_12_1 := AsList( deduped_95_1 );
    hoisted_11_1 := deduped_86_1;
    hoisted_10_1 := List( deduped_66_1, function ( logic_new_func_x_2 )
            return hoisted_6_1[1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_8_1[(1 + hoisted_7_1[(1 + logic_new_func_x_2)])] ), hoisted_3_1 )];
        end );
    deduped_60_1 := Filtered( deduped_63_1, function ( x_2 )
            return hoisted_10_1[1 + REM_INT( x_2, hoisted_9_1 )] = hoisted_12_1[1 + REM_INT( QUO_INT( x_2, hoisted_9_1 ), hoisted_11_1 )];
        end );
    deduped_59_1 := Length( deduped_62_1 );
    deduped_58_1 := Length( deduped_61_1 );
    deduped_57_1 := Length( deduped_60_1 );
    deduped_56_1 := [ 0 .. deduped_57_1 * deduped_58_1 - 1 ];
    hoisted_21_1 := deduped_64_1;
    hoisted_20_1 := deduped_61_1;
    hoisted_23_1 := List( [ 0 .. deduped_58_1 - 1 ], function ( i_2 )
            return REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_21_1[1 + hoisted_20_1[(1 + i_2)]] ), hoisted_9_1 );
        end );
    hoisted_22_1 := deduped_58_1;
    hoisted_17_1 := deduped_63_1;
    hoisted_16_1 := deduped_60_1;
    hoisted_19_1 := List( [ 0 .. deduped_57_1 - 1 ], function ( i_2 )
            return REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_17_1[1 + hoisted_16_1[(1 + i_2)]] ), hoisted_9_1 );
        end );
    hoisted_18_1 := deduped_57_1;
    deduped_55_1 := Filtered( deduped_56_1, function ( x_2 )
            return hoisted_19_1[1 + REM_INT( x_2, hoisted_18_1 )] = hoisted_23_1[1 + REM_INT( QUO_INT( x_2, hoisted_18_1 ), hoisted_22_1 )];
        end );
    deduped_54_1 := Length( deduped_55_1 );
    deduped_53_1 := [ 0 .. deduped_54_1 - 1 ];
    hoisted_41_1 := deduped_65_1;
    hoisted_40_1 := deduped_62_1;
    hoisted_52_1 := List( [ 0 .. deduped_59_1 - 1 ], function ( logic_new_func_x_2 )
            return hoisted_35_1[1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_41_1[(1 + hoisted_40_1[(1 + logic_new_func_x_2)])] ), hoisted_34_1 )];
        end );
    hoisted_43_1 := deduped_73_1;
    hoisted_42_1 := deduped_77_1;
    hoisted_44_1 := List( deduped_77_1, function ( logic_new_func_x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_42_1[(1 + logic_new_func_x_2)] );
            return -1 + SafePosition( hoisted_43_1, (hoisted_6_1[deduped_1_2] + hoisted_4_1[deduped_1_2] * hoisted_28_1) );
        end );
    hoisted_47_1 := List( [ 0 .. Length( deduped_73_1 ) - 1 ], function ( x_2 )
            return -1 + SafePosition( hoisted_44_1, x_2 );
        end );
    hoisted_46_1 := AsList( deduped_90_1[8] );
    hoisted_45_1 := deduped_66_1;
    hoisted_51_1 := List( deduped_66_1, function ( logic_new_func_x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_8_1[1 + hoisted_7_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_45_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_45_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_45_1[(1 + logic_new_func_x_2)] ))] ))] ))]] );
            return hoisted_46_1[1 + hoisted_47_1[(1 + (-1 + SafePosition( hoisted_43_1, (hoisted_46_1[1 + REM_INT( deduped_1_2, hoisted_3_1 )] + hoisted_4_1[(1 + REM_INT( QUO_INT( deduped_1_2, hoisted_3_1 ), hoisted_5_1 ))] * hoisted_28_1) )))]];
        end );
    hoisted_50_1 := deduped_56_1;
    hoisted_49_1 := deduped_55_1;
    hoisted_48_1 := deduped_53_1;
    return CreateCapCategoryMorphismWithAttributes( deduped_93_1, CreateCapCategoryObjectWithAttributes( deduped_93_1, Length, deduped_54_1 ), CreateCapCategoryObjectWithAttributes( deduped_93_1, Length, deduped_59_1 ), AsList, List( deduped_53_1, function ( x_2 )
              return -1 + SafePosition( hoisted_52_1, hoisted_51_1[(1 + hoisted_19_1[(1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_50_1[(1 + hoisted_49_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_48_1[(1 + x_2)] ))])] ), hoisted_18_1 ))])] );
          end ) );
end
########
        
    , 100 );
    
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
    sFinSets := CategoryOfSkeletalFinSets(  : FinalizeCategory := true );
    return CategoryFromNerveData( "CategoryFromNerveData", NerveTruncatedInDegree2Data( FreeCategory( quiver : range_of_HomStructure := sFinSets,
            FinalizeCategory := true ) ), [ 0 ], [ [ "a", "b" ], [ "m" ] ] );
end;
        
        
    
    cat := category_constructor( quiver : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_CategoryFromNerveDataHomStructureOnMorphismsPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
