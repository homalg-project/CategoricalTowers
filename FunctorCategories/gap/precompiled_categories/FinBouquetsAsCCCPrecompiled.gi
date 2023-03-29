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
    local deduped_1_1, deduped_2_1, hoisted_4_1, deduped_5_1, hoisted_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, deduped_17_1, hoisted_19_1, hoisted_21_1, deduped_22_1, hoisted_23_1, hoisted_26_1, deduped_27_1, deduped_29_1, hoisted_30_1, deduped_31_1, hoisted_33_1, hoisted_34_1, hoisted_36_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1, deduped_68_1, deduped_69_1;
    deduped_69_1 := [ 1 ];
    deduped_68_1 := [ 0 ];
    deduped_67_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( b_1 );
    deduped_66_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_65_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( a_1 );
    deduped_64_1 := deduped_67_1[3];
    deduped_63_1 := deduped_67_1[2];
    deduped_62_1 := deduped_67_1[1];
    deduped_61_1 := deduped_65_1[2];
    deduped_60_1 := CreateCapCategoryObjectWithAttributes( deduped_66_1, Length, 2 );
    deduped_59_1 := CreateCapCategoryObjectWithAttributes( deduped_66_1, Length, 1 );
    deduped_58_1 := deduped_65_1[1];
    deduped_57_1 := CreateCapCategoryObjectWithAttributes( deduped_66_1, Length, deduped_58_1 );
    deduped_56_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_55_1 := [ 0 .. deduped_58_1 - 1 ];
    deduped_54_1 := [ 0 .. deduped_61_1 - 1 ];
    deduped_53_1 := CreateCapCategoryObjectWithAttributes( deduped_56_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_66_1, deduped_59_1, deduped_60_1, AsList, deduped_69_1 ) );
    deduped_52_1 := CreateCapCategoryObjectWithAttributes( deduped_56_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_66_1, deduped_59_1, deduped_60_1, AsList, deduped_68_1 ) );
    deduped_51_1 := ListWithIdenticalEntries( deduped_61_1, deduped_53_1 );
    deduped_50_1 := ListWithIdenticalEntries( 0, deduped_53_1 );
    deduped_49_1 := ListWithIdenticalEntries( deduped_58_1, deduped_52_1 );
    deduped_48_1 := [ 0 .. Length( deduped_54_1 ) - 1 ];
    deduped_2_1 := [ deduped_62_1, deduped_63_1 ];
    deduped_1_1 := [ deduped_52_1, deduped_53_1 ];
    deduped_47_1 := List( deduped_49_1, function ( logic_new_func_x_2 )
            return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
        end );
    deduped_46_1 := Concatenation( deduped_47_1, List( deduped_51_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ) );
    deduped_45_1 := Concatenation( deduped_47_1, List( deduped_50_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ) );
    deduped_44_1 := ListOfValues( [ CreateCapCategoryMorphismWithAttributes( deduped_66_1, deduped_57_1, deduped_57_1, AsList, List( deduped_55_1, function ( logic_new_func_x_2 )
                    return REM_INT( logic_new_func_x_2, deduped_58_1 );
                end ) ), CreateCapCategoryMorphismWithAttributes( deduped_66_1, CreateCapCategoryObjectWithAttributes( deduped_66_1, Length, 0 ), CreateCapCategoryObjectWithAttributes( deduped_66_1, Length, deduped_61_1 ), AsList, [  ] ) ] );
    deduped_43_1 := [ 1 .. Length( deduped_44_1 ) ];
    deduped_42_1 := [ 0 .. Product( deduped_46_1 ) - 1 ];
    deduped_41_1 := [ 0 .. Product( deduped_45_1 ) - 1 ];
    deduped_10_1 := [ deduped_68_1, deduped_69_1, [ 2 ] ];
    deduped_9_1 := [ deduped_68_1, deduped_69_1, deduped_69_1 ];
    deduped_8_1 := [ deduped_68_1, deduped_68_1, deduped_69_1 ];
    deduped_7_1 := [ 0, 2 ];
    hoisted_19_1 := List( ListWithIdenticalEntries( deduped_61_1, CreateCapCategoryMorphismWithAttributes( deduped_56_1, deduped_52_1, deduped_53_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_66_1, deduped_59_1, CreateCapCategoryObjectWithAttributes( deduped_66_1, Length, 3 ), AsList, deduped_69_1 ) ) ), function ( logic_new_func_x_2 )
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
                return deduped_64_1;
            fi;
            return;
        end );
    hoisted_21_1 := List( deduped_48_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2;
            deduped_4_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 ) + deduped_58_1;
            hoisted_3_2 := hoisted_19_1[1 + logic_new_func_x_2];
            hoisted_2_2 := deduped_46_1[1 + deduped_4_2];
            hoisted_1_2 := Product( deduped_46_1{[ 1 .. deduped_4_2 ]} );
            return List( deduped_42_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    hoisted_15_1 := Concatenation( deduped_49_1, deduped_51_1 );
    hoisted_4_1 := deduped_65_1[3];
    deduped_5_1 := List( deduped_54_1, function ( logic_new_func_x_2 )
            return hoisted_4_1[1 + REM_INT( logic_new_func_x_2, deduped_61_1 )];
        end );
    hoisted_16_1 := List( deduped_54_1, function ( logic_new_func_x_2 )
            return deduped_2_1[SafePosition( deduped_1_1, hoisted_15_1[1 + deduped_5_1[(1 + logic_new_func_x_2)]] )];
        end );
    deduped_17_1 := List( deduped_48_1, function ( j_2 )
            return Product( hoisted_16_1{[ 1 .. j_2 ]} );
        end );
    deduped_11_1 := [ deduped_52_1, deduped_52_1, deduped_53_1 ];
    hoisted_6_1 := Concatenation( List( deduped_49_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ), List( deduped_51_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    hoisted_14_1 := List( deduped_48_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
            deduped_8_2 := deduped_5_1[1 + CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 )];
            deduped_7_2 := 1 + deduped_8_2;
            deduped_6_2 := 1 + deduped_7_1[(1 + hoisted_6_1[deduped_7_2][1])];
            deduped_5_2 := deduped_8_1[deduped_6_2];
            deduped_4_2 := 1 + deduped_7_1[(1 + deduped_5_2[1])];
            if IdFunc( function (  )
                        if deduped_5_2 = deduped_8_1[deduped_4_2] and deduped_9_1[deduped_6_2] = deduped_9_1[deduped_4_2] then
                            return deduped_10_1[deduped_6_2] = deduped_10_1[deduped_4_2];
                        else
                            return false;
                        fi;
                        return;
                    end )(  ) then
                hoisted_3_2 := [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_11_1[deduped_6_2] )] - 1 ];
            else
                hoisted_3_2 := deduped_64_1;
            fi;
            hoisted_2_2 := deduped_46_1[deduped_7_2];
            hoisted_1_2 := Product( deduped_46_1{[ 1 .. deduped_8_2 ]} );
            return List( deduped_42_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    deduped_40_1 := Filtered( deduped_42_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return Sum( deduped_48_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_14_1[deduped_1_3][deduped_1_2] * deduped_17_1[deduped_1_3];
                  end ) = Sum( deduped_48_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_21_1[deduped_1_3][deduped_1_2] * deduped_17_1[deduped_1_3];
                  end );
        end );
    deduped_39_1 := Filtered( deduped_41_1, function ( x_2 )
            return true;
        end );
    deduped_38_1 := Length( deduped_40_1 );
    deduped_27_1 := List( deduped_55_1, function ( j_2 )
            return Product( deduped_45_1{[ 1 .. j_2 ]} );
        end );
    deduped_22_1 := [ [ 0 .. deduped_62_1 - 1 ], [ 0 .. deduped_63_1 - 1 ] ];
    hoisted_23_1 := Concatenation( List( deduped_49_1, function ( logic_new_func_x_2 )
              return deduped_22_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ), List( deduped_50_1, function ( logic_new_func_x_2 )
              return deduped_22_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ) );
    hoisted_26_1 := List( [ 1 .. deduped_58_1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_23_1[logic_new_func_x_2];
            hoisted_2_2 := deduped_45_1[logic_new_func_x_2];
            hoisted_1_2 := Product( deduped_45_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( deduped_41_1, function ( logic_new_func_x_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( logic_new_func_x_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    hoisted_36_1 := List( deduped_41_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_55_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_26_1[deduped_1_3][hoisted_1_2] * deduped_27_1[deduped_1_3];
                end );
        end );
    deduped_31_1 := List( deduped_44_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_29_1 := List( deduped_44_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_33_1 := Concatenation( List( deduped_43_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := Sum( deduped_31_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
              hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_31_1[logic_new_func_x_2] - 1 ];
              hoisted_1_2 := AsList( CAP_JIT_INCOMPLETE_LOGIC( deduped_44_1[logic_new_func_x_2] ) );
              return List( [ 0 .. deduped_29_1[logic_new_func_x_2] - 1 ], function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := hoisted_2_2[1 + hoisted_1_2[(1 + logic_new_func_x_3)]];
                      hoisted_2_3 := deduped_46_1[1 + deduped_3_3];
                      hoisted_1_3 := Product( deduped_46_1{[ 1 .. deduped_3_3 ]} );
                      return List( deduped_42_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_30_1 := Concatenation( List( deduped_49_1, function ( logic_new_func_x_2 )
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
                  return deduped_64_1;
              fi;
              return;
          end ), List( deduped_50_1, function ( logic_new_func_x_2 )
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
                  return deduped_64_1;
              fi;
              return;
          end ) );
    hoisted_34_1 := List( [ 0 .. Sum( List( deduped_43_1, function ( logic_new_func_x_2 )
                      return Length( [ 0 .. deduped_29_1[logic_new_func_x_2] - 1 ] );
                  end ) ) - 1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_30_1[deduped_3_2];
            hoisted_1_2 := hoisted_33_1[deduped_3_2];
            return List( deduped_42_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfBouquetEnrichedOverSkeletalFinSets, NTuple( 3, Length( deduped_39_1 ), deduped_38_1, List( [ 0 .. deduped_38_1 - 1 ], function ( x_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_40_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))] );
                return -1 + SafePosition( deduped_39_1, hoisted_36_1[(1 + Sum( deduped_55_1, function ( j_3 )
                               local deduped_1_3;
                               deduped_1_3 := (1 + j_3);
                               return hoisted_34_1[deduped_1_3][hoisted_1_2] * deduped_27_1[deduped_1_3];
                           end ))] );
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
