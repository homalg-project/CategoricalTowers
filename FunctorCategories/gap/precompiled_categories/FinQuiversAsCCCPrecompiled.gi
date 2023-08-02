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
    local deduped_1_1, hoisted_2_1, hoisted_4_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, deduped_11_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_20_1, deduped_21_1, hoisted_23_1, deduped_25_1, hoisted_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1;
    deduped_55_1 := UnderlyingCategory( cat_1 );
    deduped_54_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( b_1 );
    deduped_53_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( a_1 );
    deduped_52_1 := CreateCapCategoryObjectWithAttributes( deduped_55_1, IndexOfObject, 1 );
    deduped_51_1 := CreateCapCategoryObjectWithAttributes( deduped_55_1, IndexOfObject, 0 );
    deduped_50_1 := deduped_54_1[3];
    deduped_49_1 := deduped_53_1[3];
    deduped_48_1 := deduped_53_1[2];
    deduped_47_1 := deduped_54_1[1];
    deduped_46_1 := deduped_53_1[1];
    deduped_45_1 := ListWithIdenticalEntries( deduped_48_1, deduped_47_1 );
    deduped_44_1 := 2 * deduped_46_1;
    deduped_43_1 := ListWithIdenticalEntries( deduped_46_1, deduped_47_1 );
    deduped_42_1 := [ 0 .. deduped_46_1 - 1 ];
    deduped_41_1 := [ 0 .. deduped_48_1 - 1 ];
    deduped_40_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_55_1, deduped_51_1, deduped_52_1, IndexOfMorphism, 1 ), CreateCapCategoryMorphismWithAttributes( deduped_55_1, deduped_51_1, deduped_52_1, IndexOfMorphism, 2 ) ];
    deduped_39_1 := [ List( deduped_50_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_50_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_38_1 := [ 0 .. deduped_48_1 + deduped_48_1 - 1 ];
    deduped_37_1 := ListWithIdenticalEntries( deduped_48_1, [ 0 .. deduped_47_1 - 1 ] );
    deduped_36_1 := Concatenation( ListWithIdenticalEntries( deduped_44_1, deduped_47_1 ), ListWithIdenticalEntries( deduped_48_1, deduped_54_1[2] ) );
    deduped_35_1 := [ 0 .. Product( deduped_43_1 ) - 1 ];
    deduped_34_1 := Product( deduped_36_1 );
    deduped_30_1 := [ 0 .. deduped_34_1 - 1 ];
    hoisted_14_1 := [ deduped_44_1 .. deduped_44_1 + deduped_48_1 - 1 ];
    deduped_33_1 := List( deduped_41_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := hoisted_14_1[1 + i_2];
            hoisted_2_2 := deduped_36_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_36_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_30_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_32_1 := Filtered( deduped_35_1, function ( x_2 )
            return true;
        end );
    deduped_31_1 := ListWithIdenticalEntries( deduped_48_1, deduped_34_1 );
    hoisted_15_1 := Concatenation( deduped_33_1, deduped_33_1 );
    hoisted_13_1 := Concatenation( ListWithIdenticalEntries( deduped_48_1, deduped_39_1[SafeUniquePositionProperty( deduped_40_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                     return IndexOfMorphism( mor_2 ) = 1;
                 else
                     return false;
                 fi;
                 return;
             end )] ), ListWithIdenticalEntries( deduped_48_1, deduped_39_1[SafeUniquePositionProperty( deduped_40_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                     return IndexOfMorphism( mor_2 ) = 2;
                 else
                     return false;
                 fi;
                 return;
             end )] ) );
    deduped_1_1 := Concatenation( deduped_31_1, deduped_31_1 );
    hoisted_16_1 := List( deduped_38_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_13_1[deduped_3_2];
            hoisted_1_2 := hoisted_15_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_10_1 := Concatenation( deduped_45_1, deduped_45_1 );
    deduped_11_1 := List( deduped_38_1, function ( j_2 )
            return Product( hoisted_10_1{[ 1 .. j_2 ]} );
        end );
    hoisted_7_1 := List( deduped_49_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_4_1 := List( deduped_49_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_8_1 := Concatenation( List( deduped_41_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( hoisted_4_1[(1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), deduped_48_1 ))] ) * 2 );
              hoisted_2_2 := deduped_36_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_36_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_30_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_41_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( 1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_7_1[(1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), deduped_48_1 ))] ) * 2 );
              hoisted_2_2 := deduped_36_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_36_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_30_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_2_1 := Concatenation( deduped_37_1, deduped_37_1 );
    hoisted_9_1 := List( deduped_38_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_2_1[deduped_3_2];
            hoisted_1_2 := hoisted_8_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_29_1 := Filtered( deduped_30_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_38_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_9_1[deduped_1_3][deduped_1_2] * deduped_11_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_38_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_16_1[deduped_1_3][deduped_1_2] * deduped_11_1[deduped_1_3];
                    end ) );
        end );
    deduped_28_1 := Length( deduped_29_1 );
    hoisted_27_1 := List( deduped_42_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( 1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 ) * 2 );
            hoisted_2_2 := deduped_36_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_36_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_30_1, function ( i_3 )
                    return CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 ) );
                end );
        end );
    deduped_21_1 := List( deduped_42_1, function ( j_2 )
            return Product( deduped_43_1{[ 1 .. j_2 ]} );
        end );
    hoisted_20_1 := List( [ 1 .. deduped_46_1 ], function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := Product( deduped_43_1{[ 1 .. i_2 - 1 ]} );
            return List( deduped_35_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), deduped_47_1 );
                end );
        end );
    deduped_25_1 := List( deduped_35_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_42_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_20_1[deduped_1_3][hoisted_1_2] * deduped_21_1[deduped_1_3];
                end );
        end );
    hoisted_23_1 := List( deduped_42_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( i_2 ) * 2 );
            hoisted_2_2 := deduped_36_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_36_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_30_1, function ( i_3 )
                    return CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 ) );
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfQuiverEnrichedOverSkeletalFinSets, NTuple( 3, Length( deduped_32_1 ), deduped_28_1, List( [ 0 .. deduped_28_1 - 1 ], function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_29_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))] );
                return NTuple( 2, -1 + BigInt( SafePosition( deduped_32_1, CAP_JIT_INCOMPLETE_LOGIC( deduped_25_1[(1 + Sum( deduped_42_1, function ( j_3 )
                                     local deduped_1_3;
                                     deduped_1_3 := (1 + j_3);
                                     return hoisted_23_1[deduped_1_3][deduped_1_2] * deduped_21_1[deduped_1_3];
                                 end ))] ) ) ), -1 + BigInt( SafePosition( deduped_32_1, CAP_JIT_INCOMPLETE_LOGIC( deduped_25_1[(1 + Sum( deduped_42_1, function ( j_3 )
                                     local deduped_1_3;
                                     deduped_1_3 := (1 + j_3);
                                     return hoisted_27_1[deduped_1_3][deduped_1_2] * deduped_21_1[deduped_1_3];
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
