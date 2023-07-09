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
    local deduped_1_1, deduped_2_1, hoisted_4_1, deduped_5_1, hoisted_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, deduped_17_1, hoisted_19_1, hoisted_21_1, deduped_22_1, hoisted_23_1, hoisted_26_1, deduped_27_1, deduped_29_1, hoisted_31_1, hoisted_32_1, deduped_33_1, hoisted_35_1, hoisted_36_1, hoisted_38_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1;
    deduped_67_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_66_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( b_1 );
    deduped_65_1 := UnderlyingCategory( cat_1 );
    deduped_64_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( a_1 );
    deduped_63_1 := deduped_66_1[3];
    deduped_62_1 := deduped_66_1[2];
    deduped_61_1 := deduped_66_1[1];
    deduped_60_1 := deduped_64_1[2];
    deduped_59_1 := CreateCapCategoryObjectWithAttributes( deduped_65_1, IndexOfObject, 1 );
    deduped_58_1 := CreateCapCategoryObjectWithAttributes( deduped_65_1, IndexOfObject, 0 );
    deduped_57_1 := deduped_64_1[1];
    deduped_56_1 := CreateCapCategoryObjectWithAttributes( deduped_67_1, Length, deduped_57_1 );
    deduped_55_1 := ListWithIdenticalEntries( deduped_60_1, deduped_59_1 );
    deduped_54_1 := ListWithIdenticalEntries( 0, deduped_59_1 );
    deduped_53_1 := ListWithIdenticalEntries( deduped_57_1, deduped_58_1 );
    deduped_52_1 := [ 0 .. deduped_57_1 - 1 ];
    deduped_51_1 := [ 0 .. deduped_60_1 - 1 ];
    deduped_2_1 := [ deduped_61_1, deduped_62_1 ];
    deduped_1_1 := [ deduped_58_1, deduped_59_1 ];
    deduped_50_1 := List( deduped_53_1, function ( objB_2 )
            return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
        end );
    deduped_49_1 := Concatenation( deduped_50_1, List( deduped_55_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ) );
    deduped_48_1 := Concatenation( deduped_50_1, List( deduped_54_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ) );
    deduped_47_1 := Product( deduped_49_1 );
    deduped_46_1 := [ 0 .. deduped_47_1 - 1 ];
    deduped_45_1 := [ 0 .. Product( deduped_48_1 ) - 1 ];
    deduped_44_1 := ListOfValues( [ CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_56_1, deduped_56_1, AsList, List( deduped_52_1, function ( i_2 )
                    return REM_INT( QUO_INT( i_2, 1 ), deduped_57_1 );
                end ) ), CreateCapCategoryMorphismWithAttributes( deduped_67_1, CreateCapCategoryObjectWithAttributes( deduped_67_1, Length, 0 ), CreateCapCategoryObjectWithAttributes( deduped_67_1, Length, deduped_60_1 ), AsList, [  ] ) ] );
    deduped_43_1 := Filtered( deduped_45_1, function ( x_2 )
            return true;
        end );
    deduped_42_1 := [ 1 .. Length( deduped_44_1 ) ];
    deduped_10_1 := [ 0, 1, 2 ];
    deduped_9_1 := [ 0, 1, 1 ];
    deduped_8_1 := [ 0, 0, 1 ];
    deduped_7_1 := [ 0, 2 ];
    hoisted_19_1 := List( ListWithIdenticalEntries( deduped_60_1, CreateCapCategoryMorphismWithAttributes( deduped_65_1, deduped_58_1, deduped_59_1, IndexOfMorphism, 1 ) ), function ( morB_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := Source( morB_2 );
            deduped_2_2 := IndexOfObject( deduped_3_2 );
            deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2)];
            if IdFunc( function (  )
                        if deduped_2_2 = deduped_8_1[deduped_1_2] and IndexOfObject( Range( morB_2 ) ) = deduped_9_1[deduped_1_2] then
                            return IndexOfMorphism( morB_2 ) = deduped_10_1[deduped_1_2];
                        else
                            return false;
                        fi;
                        return;
                    end )(  ) then
                return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
            else
                return deduped_63_1;
            fi;
            return;
        end );
    hoisted_21_1 := List( deduped_51_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2;
            deduped_4_2 := 1 + (CAP_JIT_INCOMPLETE_LOGIC( i_2 ) + deduped_57_1);
            hoisted_3_2 := hoisted_19_1[1 + i_2];
            hoisted_2_2 := deduped_49_1[deduped_4_2];
            hoisted_1_2 := Product( deduped_49_1{[ 1 .. deduped_4_2 - 1 ]} );
            return List( deduped_46_1, function ( i_3 )
                    return hoisted_3_2[1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 ) )];
                end );
        end );
    hoisted_15_1 := Concatenation( deduped_53_1, deduped_55_1 );
    hoisted_4_1 := deduped_64_1[3];
    deduped_5_1 := List( deduped_51_1, function ( i_2 )
            return hoisted_4_1[1 + REM_INT( QUO_INT( i_2, 1 ), deduped_60_1 )];
        end );
    hoisted_16_1 := List( deduped_51_1, function ( i_2 )
            return deduped_2_1[SafePosition( deduped_1_1, hoisted_15_1[1 + deduped_5_1[(1 + i_2)]] )];
        end );
    deduped_17_1 := List( deduped_51_1, function ( j_2 )
            return Product( hoisted_16_1{[ 1 .. j_2 ]} );
        end );
    deduped_11_1 := [ deduped_58_1, deduped_58_1, deduped_59_1 ];
    hoisted_6_1 := Concatenation( List( deduped_53_1, IndexOfObject ), List( deduped_55_1, IndexOfObject ) );
    hoisted_14_1 := List( deduped_51_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := 1 + deduped_5_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 ))];
            deduped_6_2 := 1 + deduped_7_1[(1 + hoisted_6_1[deduped_7_2])];
            deduped_5_2 := deduped_8_1[deduped_6_2];
            deduped_4_2 := 1 + deduped_7_1[(1 + deduped_5_2)];
            hoisted_3_2 := CAP_JIT_INCOMPLETE_LOGIC( IdFunc( function (  )
                        if IdFunc( function (  )
                                    if deduped_5_2 = deduped_8_1[deduped_4_2] and deduped_9_1[deduped_6_2] = deduped_9_1[deduped_4_2] then
                                        return deduped_10_1[deduped_6_2] = deduped_10_1[deduped_4_2];
                                    else
                                        return false;
                                    fi;
                                    return;
                                end )(  ) then
                            return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_11_1[deduped_6_2] )] - 1 ];
                        else
                            return deduped_63_1;
                        fi;
                        return;
                    end )(  ) );
            hoisted_2_2 := deduped_49_1[deduped_7_2];
            hoisted_1_2 := Product( deduped_49_1{[ 1 .. deduped_7_2 - 1 ]} );
            return List( deduped_46_1, function ( i_3 )
                    return hoisted_3_2[1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 ) )];
                end );
        end );
    deduped_41_1 := Filtered( deduped_46_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_51_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_14_1[deduped_1_3][deduped_1_2] * deduped_17_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_51_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_21_1[deduped_1_3][deduped_1_2] * deduped_17_1[deduped_1_3];
                    end ) );
        end );
    deduped_40_1 := Length( deduped_41_1 );
    deduped_27_1 := List( deduped_52_1, function ( j_2 )
            return Product( deduped_48_1{[ 1 .. j_2 ]} );
        end );
    deduped_22_1 := [ [ 0 .. deduped_61_1 - 1 ], [ 0 .. deduped_62_1 - 1 ] ];
    hoisted_23_1 := Concatenation( List( deduped_53_1, function ( objB_2 )
              return deduped_22_1[SafePosition( deduped_1_1, objB_2 )];
          end ), List( deduped_54_1, function ( objB_2 )
              return deduped_22_1[SafePosition( deduped_1_1, objB_2 )];
          end ) );
    hoisted_26_1 := List( [ 1 .. deduped_57_1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_23_1[i_2];
            hoisted_2_2 := deduped_48_1[i_2];
            hoisted_1_2 := Product( deduped_48_1{[ 1 .. i_2 - 1 ]} );
            return List( deduped_45_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    hoisted_38_1 := List( deduped_45_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_52_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_26_1[deduped_1_3][hoisted_1_2] * deduped_27_1[deduped_1_3];
                end );
        end );
    deduped_33_1 := List( deduped_44_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_29_1 := List( deduped_44_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_35_1 := Concatenation( List( deduped_42_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := Sum( deduped_33_1{[ 1 .. i_2 - 1 ]} );
              hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_33_1[i_2] - 1 ];
              hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( AsList( CAP_JIT_INCOMPLETE_LOGIC( deduped_44_1[i_2] ) ) );
              return List( [ 0 .. deduped_29_1[i_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + hoisted_2_2[(1 + hoisted_1_2[(1 + i_3)])];
                      hoisted_2_3 := deduped_49_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_49_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_46_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_32_1 := Concatenation( List( deduped_53_1, function ( objB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_7_1[(1 + IndexOfObject( objB_2 ))];
              deduped_2_2 := deduped_8_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2)];
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
                  return deduped_63_1;
              fi;
              return;
          end ), List( deduped_54_1, function ( objB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_7_1[(1 + IndexOfObject( objB_2 ))];
              deduped_2_2 := deduped_8_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2)];
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
                  return deduped_63_1;
              fi;
              return;
          end ) );
    hoisted_31_1 := Concatenation( List( deduped_42_1, function ( i_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_29_1[i_2] - 1 ] ), deduped_47_1 );
          end ) );
    hoisted_36_1 := List( [ 0 .. Sum( List( deduped_42_1, function ( i_2 )
                      return Length( [ 0 .. deduped_29_1[i_2] - 1 ] );
                  end ) ) - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_32_1[deduped_3_2];
            hoisted_1_2 := hoisted_35_1[deduped_3_2];
            return List( [ 0 .. hoisted_31_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfBouquetEnrichedOverSkeletalFinSets, NTuple( 3, Length( deduped_43_1 ), deduped_40_1, List( [ 0 .. deduped_40_1 - 1 ], function ( x_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_41_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))] );
                return -1 + BigInt( SafePosition( deduped_43_1, CAP_JIT_INCOMPLETE_LOGIC( hoisted_38_1[(1 + Sum( deduped_52_1, function ( j_3 )
                                   local deduped_1_3;
                                   deduped_1_3 := (1 + j_3);
                                   return hoisted_36_1[deduped_1_3][hoisted_1_2] * deduped_27_1[deduped_1_3];
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
