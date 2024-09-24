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
    local deduped_5_1, deduped_6_1, deduped_8_1, hoisted_11_1, hoisted_12_1, deduped_14_1, hoisted_15_1, deduped_19_1, hoisted_21_1, deduped_24_1, hoisted_25_1, deduped_28_1, hoisted_29_1, deduped_33_1, hoisted_35_1, hoisted_39_1, deduped_40_1, hoisted_41_1, hoisted_43_1, hoisted_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1, deduped_68_1, deduped_69_1, deduped_70_1, deduped_71_1, deduped_72_1, deduped_73_1, deduped_74_1, deduped_75_1, deduped_76_1, deduped_77_1, deduped_78_1, deduped_79_1, deduped_80_1, deduped_81_1, deduped_82_1, deduped_83_1;
    deduped_83_1 := MapOfMorphism( beta_1 );
    deduped_82_1 := MapOfMorphism( alpha_1 );
    deduped_81_1 := NerveData( cat_1 );
    deduped_80_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_79_1 := MapOfObject( Target( beta_1 ) );
    deduped_78_1 := MapOfObject( Source( alpha_1 ) );
    deduped_77_1 := deduped_81_1[2];
    deduped_76_1 := deduped_77_1[3];
    deduped_75_1 := deduped_77_1[2];
    deduped_74_1 := deduped_77_1[6];
    deduped_73_1 := deduped_77_1[7];
    deduped_72_1 := Length( Source( deduped_76_1 ) );
    deduped_71_1 := Length( Source( deduped_75_1 ) );
    deduped_70_1 := Length( Source( deduped_73_1 ) );
    deduped_69_1 := deduped_72_1 * deduped_71_1;
    deduped_68_1 := deduped_72_1 * Length( Source( deduped_79_1 ) );
    deduped_67_1 := deduped_71_1 * Length( Source( deduped_78_1 ) );
    deduped_66_1 := deduped_70_1 * Length( Source( deduped_74_1 ) );
    deduped_65_1 := [ 0 .. deduped_66_1 - 1 ];
    deduped_28_1 := AsList( deduped_76_1 );
    deduped_24_1 := AsList( deduped_75_1 );
    deduped_64_1 := Filtered( [ 0 .. deduped_69_1 - 1 ], function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( deduped_28_1[1 + RemIntWithDomain( deduped_1_2, deduped_72_1, deduped_69_1 )] ) = CAP_JIT_INCOMPLETE_LOGIC( deduped_24_1[1 + QuoIntWithDomain( deduped_1_2, deduped_72_1, deduped_69_1 )] );
        end );
    hoisted_29_1 := AsList( deduped_79_1 );
    deduped_63_1 := Filtered( [ 0 .. deduped_68_1 - 1 ], function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( deduped_28_1[1 + RemIntWithDomain( deduped_1_2, deduped_72_1, deduped_68_1 )] ) = CAP_JIT_INCOMPLETE_LOGIC( hoisted_29_1[1 + QuoIntWithDomain( deduped_1_2, deduped_72_1, deduped_68_1 )] );
        end );
    hoisted_25_1 := AsList( deduped_78_1 );
    deduped_62_1 := Filtered( [ 0 .. deduped_67_1 - 1 ], function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( deduped_24_1[1 + RemIntWithDomain( deduped_1_2, deduped_71_1, deduped_67_1 )] ) = CAP_JIT_INCOMPLETE_LOGIC( hoisted_25_1[1 + QuoIntWithDomain( deduped_1_2, deduped_71_1, deduped_67_1 )] );
        end );
    deduped_6_1 := AsList( deduped_74_1 );
    deduped_5_1 := AsList( deduped_73_1 );
    deduped_61_1 := Filtered( deduped_65_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( deduped_5_1[1 + RemIntWithDomain( deduped_1_2, deduped_70_1, deduped_66_1 )] ) = CAP_JIT_INCOMPLETE_LOGIC( deduped_6_1[1 + QuoIntWithDomain( deduped_1_2, deduped_70_1, deduped_66_1 )] );
        end );
    deduped_60_1 := Length( deduped_63_1 );
    deduped_59_1 := Length( deduped_62_1 );
    deduped_58_1 := Length( deduped_61_1 );
    deduped_57_1 := deduped_59_1 * deduped_60_1;
    deduped_56_1 := deduped_58_1 * Length( Source( deduped_83_1 ) );
    deduped_55_1 := deduped_58_1 * Length( Source( deduped_82_1 ) );
    deduped_54_1 := [ 0 .. deduped_58_1 - 1 ];
    hoisted_35_1 := List( [ 0 .. deduped_60_1 - 1 ], function ( i_2 )
            return CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( CAP_JIT_INCOMPLETE_LOGIC( deduped_63_1[1 + i_2] ), deduped_72_1, deduped_68_1 ) );
        end );
    deduped_33_1 := List( [ 0 .. deduped_59_1 - 1 ], function ( i_2 )
            return CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( CAP_JIT_INCOMPLETE_LOGIC( deduped_62_1[1 + i_2] ), deduped_71_1, deduped_67_1 ) );
        end );
    deduped_53_1 := Filtered( [ 0 .. deduped_57_1 - 1 ], function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( deduped_33_1[1 + RemIntWithDomain( deduped_1_2, deduped_59_1, deduped_57_1 )] ) = CAP_JIT_INCOMPLETE_LOGIC( hoisted_35_1[1 + QuoIntWithDomain( deduped_1_2, deduped_59_1, deduped_57_1 )] );
        end );
    hoisted_15_1 := AsList( deduped_83_1 );
    deduped_14_1 := List( deduped_54_1, function ( i_2 )
            return deduped_5_1[1 + CAP_JIT_INCOMPLETE_LOGIC( QuoIntWithDomain( CAP_JIT_INCOMPLETE_LOGIC( deduped_61_1[(1 + i_2)] ), deduped_70_1, deduped_66_1 ) )];
        end );
    deduped_52_1 := Filtered( [ 0 .. deduped_56_1 - 1 ], function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( deduped_14_1[1 + RemIntWithDomain( deduped_1_2, deduped_58_1, deduped_56_1 )] ) = CAP_JIT_INCOMPLETE_LOGIC( hoisted_15_1[1 + QuoIntWithDomain( deduped_1_2, deduped_58_1, deduped_56_1 )] );
        end );
    hoisted_12_1 := AsList( deduped_82_1 );
    deduped_8_1 := List( deduped_65_1, function ( i_2 )
            return RemIntWithDomain( i_2, deduped_70_1, deduped_66_1 );
        end );
    hoisted_11_1 := List( deduped_54_1, function ( i_2 )
            return deduped_6_1[1 + deduped_8_1[(1 + deduped_61_1[(1 + i_2)])]];
        end );
    deduped_51_1 := Filtered( [ 0 .. deduped_55_1 - 1 ], function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( hoisted_11_1[1 + RemIntWithDomain( deduped_1_2, deduped_58_1, deduped_55_1 )] ) = CAP_JIT_INCOMPLETE_LOGIC( hoisted_12_1[1 + QuoIntWithDomain( deduped_1_2, deduped_58_1, deduped_55_1 )] );
        end );
    deduped_50_1 := Length( deduped_53_1 );
    deduped_49_1 := Length( deduped_52_1 );
    deduped_48_1 := Length( deduped_51_1 );
    deduped_47_1 := deduped_48_1 * deduped_49_1;
    hoisted_21_1 := List( [ 0 .. deduped_49_1 - 1 ], function ( i_2 )
            return CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( CAP_JIT_INCOMPLETE_LOGIC( deduped_52_1[1 + i_2] ), deduped_58_1, deduped_56_1 ) );
        end );
    deduped_19_1 := List( [ 0 .. deduped_48_1 - 1 ], function ( i_2 )
            return CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( CAP_JIT_INCOMPLETE_LOGIC( deduped_51_1[1 + i_2] ), deduped_58_1, deduped_55_1 ) );
        end );
    deduped_46_1 := Filtered( [ 0 .. deduped_47_1 - 1 ], function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( deduped_19_1[1 + RemIntWithDomain( deduped_1_2, deduped_48_1, deduped_47_1 )] ) = CAP_JIT_INCOMPLETE_LOGIC( hoisted_21_1[1 + QuoIntWithDomain( deduped_1_2, deduped_48_1, deduped_47_1 )] );
        end );
    deduped_45_1 := Length( deduped_46_1 );
    hoisted_44_1 := List( [ 0 .. deduped_50_1 - 1 ], function ( i_2 )
            return deduped_33_1[1 + CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( CAP_JIT_INCOMPLETE_LOGIC( deduped_53_1[(1 + i_2)] ), deduped_59_1, deduped_57_1 ) )];
        end );
    hoisted_39_1 := List( [ 0 .. Length( deduped_81_1[1][3] ) - 1 ], function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return -1 + BigInt( SafePosition( deduped_64_1, CAP_JIT_INCOMPLETE_LOGIC( (deduped_6_1[deduped_1_2] + deduped_5_1[deduped_1_2] * deduped_72_1) ) ) );
        end );
    hoisted_41_1 := List( [ 0 .. Length( deduped_64_1 ) - 1 ], function ( x_2 )
            return -1 + BigInt( SafePosition( hoisted_39_1, x_2 ) );
        end );
    deduped_40_1 := AsList( deduped_77_1[8] );
    hoisted_43_1 := List( deduped_54_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
            return deduped_40_1[1 + hoisted_41_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( (-1 + BigInt( SafePosition( deduped_64_1, CAP_JIT_INCOMPLETE_LOGIC( (CAP_JIT_INCOMPLETE_LOGIC( deduped_40_1[1 + deduped_8_1[(1 + deduped_61_1[(1 + deduped_1_2)])]] ) + deduped_14_1[(1 + deduped_1_2)] * deduped_72_1) ) ) )) ))]];
        end );
    return CreateCapCategoryMorphismWithAttributes( deduped_80_1, CreateCapCategoryObjectWithAttributes( deduped_80_1, Length, deduped_45_1 ), CreateCapCategoryObjectWithAttributes( deduped_80_1, Length, deduped_50_1 ), AsList, List( [ 0 .. deduped_45_1 - 1 ], function ( x_2 )
              return -1 + BigInt( SafePosition( hoisted_44_1, CAP_JIT_INCOMPLETE_LOGIC( hoisted_43_1[(1 + deduped_19_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( CAP_JIT_INCOMPLETE_LOGIC( deduped_46_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))] ), deduped_48_1, deduped_47_1 ) ))])] ) ) );
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
    sFinSets := SkeletalCategoryOfFiniteSets(  : FinalizeCategory := true );
    return CategoryFromNerveData( PathCategory( quiver : range_of_HomStructure := sFinSets,
          FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor( quiver : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_CategoryFromNerveDataHomStructureOnMorphismsPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
