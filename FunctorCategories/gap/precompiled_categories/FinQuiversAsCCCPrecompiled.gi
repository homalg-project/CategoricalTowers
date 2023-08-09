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
    local deduped_1_1, hoisted_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, hoisted_14_1, deduped_15_1, hoisted_16_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, deduped_22_1, hoisted_24_1, hoisted_26_1, hoisted_27_1, hoisted_31_1, deduped_32_1, hoisted_34_1, deduped_36_1, hoisted_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1;
    deduped_66_1 := UnderlyingCategory( cat_1 );
    deduped_65_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( b_1 );
    deduped_64_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( a_1 );
    deduped_63_1 := deduped_65_1[3];
    deduped_62_1 := CreateCapCategoryObjectWithAttributes( deduped_66_1, IndexOfObject, 1 );
    deduped_61_1 := CreateCapCategoryObjectWithAttributes( deduped_66_1, IndexOfObject, 0 );
    deduped_60_1 := deduped_64_1[3];
    deduped_59_1 := deduped_65_1[2];
    deduped_58_1 := deduped_64_1[2];
    deduped_57_1 := deduped_65_1[1];
    deduped_56_1 := deduped_64_1[1];
    deduped_55_1 := 2 * deduped_56_1;
    deduped_54_1 := ListWithIdenticalEntries( deduped_56_1, deduped_57_1 );
    deduped_53_1 := [ 0 .. deduped_56_1 - 1 ];
    deduped_52_1 := [ 0 .. deduped_58_1 - 1 ];
    deduped_51_1 := [ List( deduped_63_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_63_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_50_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_66_1, deduped_61_1, deduped_62_1, IndexOfMorphism, 1 ), CreateCapCategoryMorphismWithAttributes( deduped_66_1, deduped_61_1, deduped_62_1, IndexOfMorphism, 2 ) ];
    deduped_49_1 := [ 0 .. deduped_58_1 + deduped_58_1 - 1 ];
    deduped_48_1 := Concatenation( ListWithIdenticalEntries( deduped_55_1, deduped_57_1 ), ListWithIdenticalEntries( deduped_58_1, deduped_59_1 ) );
    deduped_47_1 := [ 0 .. Product( deduped_54_1 ) - 1 ];
    deduped_46_1 := [ 0 .. Length( deduped_53_1 ) - 1 ];
    deduped_45_1 := Product( deduped_48_1 );
    deduped_44_1 := Filtered( deduped_47_1, function ( x_2 )
            return true;
        end );
    deduped_43_1 := ListWithIdenticalEntries( Length( deduped_52_1 ), deduped_45_1 );
    deduped_42_1 := [ 0 .. deduped_45_1 - 1 ];
    deduped_41_1 := List( deduped_52_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + (i_2 + deduped_55_1);
            hoisted_2_2 := deduped_48_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_48_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_42_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_26_1 := Concatenation( deduped_41_1, deduped_41_1 );
    hoisted_24_1 := Concatenation( ListWithIdenticalEntries( deduped_58_1, deduped_51_1[SafeUniquePositionProperty( deduped_50_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                     return IndexOfMorphism( mor_2 ) = 1;
                 else
                     return false;
                 fi;
                 return;
             end )] ), ListWithIdenticalEntries( deduped_58_1, deduped_51_1[SafeUniquePositionProperty( deduped_50_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                     return IndexOfMorphism( mor_2 ) = 2;
                 else
                     return false;
                 fi;
                 return;
             end )] ) );
    deduped_1_1 := Concatenation( deduped_43_1, deduped_43_1 );
    hoisted_27_1 := List( deduped_49_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_24_1[deduped_3_2];
            hoisted_1_2 := hoisted_26_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_14_1 := List( deduped_60_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_15_1 := List( deduped_52_1, function ( i_2 )
            return 1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_14_1[(1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), deduped_58_1 ))] ) * 2;
        end );
    deduped_11_1 := [ deduped_57_1, deduped_59_1 ];
    deduped_10_1 := [ 0, 1 ];
    deduped_5_1 := Concatenation( ListWithIdenticalEntries( deduped_55_1, 0 ), ListWithIdenticalEntries( deduped_58_1, 1 ) );
    hoisted_3_1 := List( deduped_60_1, function ( a_2 )
            return a_2[1];
        end );
    deduped_4_1 := List( deduped_52_1, function ( i_2 )
            return CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[(1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), deduped_58_1 ))] ) * 2;
        end );
    hoisted_21_1 := Concatenation( List( deduped_52_1, function ( i_2 )
              return deduped_11_1[SafeUniquePosition( deduped_10_1, deduped_5_1[1 + deduped_4_1[(1 + i_2)]] )];
          end ), List( deduped_52_1, function ( i_2 )
              return deduped_11_1[SafeUniquePosition( deduped_10_1, deduped_5_1[1 + deduped_15_1[(1 + i_2)]] )];
          end ) );
    deduped_22_1 := List( deduped_49_1, function ( j_2 )
            return Product( hoisted_21_1{[ 1 .. j_2 ]} );
        end );
    hoisted_19_1 := Concatenation( List( deduped_52_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_4_1[(1 + i_2)];
              hoisted_2_2 := deduped_48_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_48_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_42_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_52_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_15_1[(1 + i_2)];
              hoisted_2_2 := deduped_48_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_48_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_42_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_9_1 := [ 0, 1, 2, 3 ];
    deduped_8_1 := [ 0, 1, 1, 1 ];
    deduped_7_1 := [ 0, 0, 0, 1 ];
    deduped_6_1 := [ 0, 3 ];
    hoisted_16_1 := Concatenation( List( deduped_52_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_6_1[(1 + deduped_5_1[(1 + deduped_4_1[(1 + i_2)])])];
              deduped_7_2 := deduped_9_1[deduped_8_2];
              deduped_6_2 := deduped_8_1[deduped_8_2];
              deduped_5_2 := deduped_7_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_6_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_7_1[deduped_4_2] and deduped_6_2 = deduped_8_1[deduped_4_2] then
                              return deduped_7_2 = deduped_9_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_11_1[SafeUniquePosition( deduped_10_1, deduped_5_2 )] - 1 ];
              else
                  return deduped_51_1[SafeUniquePositionProperty( deduped_50_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( deduped_52_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_6_1[(1 + deduped_5_1[(1 + deduped_15_1[(1 + i_2)])])];
              deduped_7_2 := deduped_9_1[deduped_8_2];
              deduped_6_2 := deduped_8_1[deduped_8_2];
              deduped_5_2 := deduped_7_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_6_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_7_1[deduped_4_2] and deduped_6_2 = deduped_8_1[deduped_4_2] then
                              return deduped_7_2 = deduped_9_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_11_1[SafeUniquePosition( deduped_10_1, deduped_5_2 )] - 1 ];
              else
                  return deduped_51_1[SafeUniquePositionProperty( deduped_50_1, function ( mor_3 )
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
    hoisted_20_1 := List( deduped_49_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_16_1[deduped_3_2];
            hoisted_1_2 := hoisted_19_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_40_1 := Filtered( deduped_42_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_49_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_20_1[deduped_1_3][deduped_1_2] * deduped_22_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_49_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_27_1[deduped_1_3][deduped_1_2] * deduped_22_1[deduped_1_3];
                    end ) );
        end );
    deduped_39_1 := Length( deduped_40_1 );
    hoisted_38_1 := List( deduped_46_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( (1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 ) * 2) );
            hoisted_2_2 := deduped_48_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_48_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_42_1, function ( i_3 )
                    return CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 ) );
                end );
        end );
    deduped_32_1 := List( deduped_53_1, function ( j_2 )
            return Product( deduped_54_1{[ 1 .. j_2 ]} );
        end );
    hoisted_31_1 := List( [ 1 .. deduped_56_1 ], function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := Product( deduped_54_1{[ 1 .. i_2 - 1 ]} );
            return List( deduped_47_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), deduped_57_1 );
                end );
        end );
    deduped_36_1 := List( deduped_47_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_53_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_31_1[deduped_1_3][hoisted_1_2] * deduped_32_1[deduped_1_3];
                end );
        end );
    hoisted_34_1 := List( deduped_46_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( i_2 ) * 2 );
            hoisted_2_2 := deduped_48_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_48_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_42_1, function ( i_3 )
                    return CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 ) );
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfQuiverEnrichedOverSkeletalFinSets, NTuple( 3, Length( deduped_44_1 ), deduped_39_1, List( [ 0 .. deduped_39_1 - 1 ], function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_40_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))] );
                return NTuple( 2, -1 + BigInt( SafePosition( deduped_44_1, CAP_JIT_INCOMPLETE_LOGIC( deduped_36_1[(1 + Sum( deduped_53_1, function ( j_3 )
                                     local deduped_1_3;
                                     deduped_1_3 := (1 + j_3);
                                     return hoisted_34_1[deduped_1_3][deduped_1_2] * deduped_32_1[deduped_1_3];
                                 end ))] ) ) ), -1 + BigInt( SafePosition( deduped_44_1, CAP_JIT_INCOMPLETE_LOGIC( deduped_36_1[(1 + Sum( deduped_53_1, function ( j_3 )
                                     local deduped_1_3;
                                     deduped_1_3 := (1 + j_3);
                                     return hoisted_38_1[deduped_1_3][deduped_1_2] * deduped_32_1[deduped_1_3];
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
