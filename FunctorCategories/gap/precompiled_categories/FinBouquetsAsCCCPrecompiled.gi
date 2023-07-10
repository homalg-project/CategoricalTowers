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
    local deduped_1_1, deduped_2_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, hoisted_13_1, hoisted_14_1, deduped_15_1, hoisted_17_1, hoisted_19_1, deduped_20_1, hoisted_21_1, hoisted_24_1, deduped_25_1, deduped_27_1, hoisted_29_1, hoisted_30_1, deduped_31_1, hoisted_33_1, hoisted_34_1, hoisted_36_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1;
    deduped_65_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_64_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( b_1 );
    deduped_63_1 := UnderlyingCategory( cat_1 );
    deduped_62_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( a_1 );
    deduped_61_1 := deduped_64_1[3];
    deduped_60_1 := deduped_64_1[2];
    deduped_59_1 := deduped_64_1[1];
    deduped_58_1 := deduped_62_1[2];
    deduped_57_1 := CreateCapCategoryObjectWithAttributes( deduped_63_1, IndexOfObject, 1 );
    deduped_56_1 := CreateCapCategoryObjectWithAttributes( deduped_63_1, IndexOfObject, 0 );
    deduped_55_1 := deduped_62_1[1];
    deduped_54_1 := CreateCapCategoryObjectWithAttributes( deduped_65_1, Length, deduped_55_1 );
    deduped_53_1 := ListWithIdenticalEntries( deduped_58_1, deduped_57_1 );
    deduped_52_1 := ListWithIdenticalEntries( 0, deduped_57_1 );
    deduped_51_1 := ListWithIdenticalEntries( deduped_55_1, deduped_56_1 );
    deduped_50_1 := [ 0 .. deduped_55_1 - 1 ];
    deduped_49_1 := [ 0 .. deduped_58_1 - 1 ];
    deduped_2_1 := [ deduped_59_1, deduped_60_1 ];
    deduped_1_1 := [ deduped_56_1, deduped_57_1 ];
    deduped_48_1 := List( deduped_51_1, function ( objB_2 )
            local hoisted_1_2;
            hoisted_1_2 := IndexOfObject( objB_2 );
            return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                     return IndexOfObject( obj_3 ) = hoisted_1_2;
                 end )];
        end );
    deduped_47_1 := ListOfValues( [ CreateCapCategoryMorphismWithAttributes( deduped_65_1, deduped_54_1, deduped_54_1, AsList, List( deduped_50_1, function ( i_2 )
                    return REM_INT( QUO_INT( i_2, 1 ), deduped_55_1 );
                end ) ), CreateCapCategoryMorphismWithAttributes( deduped_65_1, CreateCapCategoryObjectWithAttributes( deduped_65_1, Length, 0 ), CreateCapCategoryObjectWithAttributes( deduped_65_1, Length, deduped_58_1 ), AsList, [  ] ) ] );
    deduped_46_1 := Concatenation( deduped_48_1, List( deduped_53_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ) );
    deduped_45_1 := Concatenation( deduped_48_1, List( deduped_52_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ) );
    deduped_44_1 := Product( deduped_46_1 );
    deduped_43_1 := [ 1 .. Length( deduped_47_1 ) ];
    deduped_42_1 := [ 0 .. deduped_44_1 - 1 ];
    deduped_41_1 := [ 0 .. Product( deduped_45_1 ) - 1 ];
    deduped_10_1 := [ 0, 1, 2 ];
    deduped_9_1 := [ 0, 1, 1 ];
    deduped_8_1 := [ 0, 0, 1 ];
    deduped_7_1 := [ 0, 2 ];
    hoisted_17_1 := List( ListWithIdenticalEntries( deduped_58_1, CreateCapCategoryMorphismWithAttributes( deduped_63_1, deduped_56_1, deduped_57_1, IndexOfMorphism, 1 ) ), function ( morB_2 )
            local deduped_2_2, deduped_3_2;
            deduped_3_2 := IndexOfObject( Source( morB_2 ) );
            deduped_2_2 := 1 + deduped_7_1[(1 + deduped_3_2)];
            if IdFunc( function (  )
                        if deduped_3_2 = deduped_8_1[deduped_2_2] and IndexOfObject( Range( morB_2 ) ) = deduped_9_1[deduped_2_2] then
                            return IndexOfMorphism( morB_2 ) = deduped_10_1[deduped_2_2];
                        else
                            return false;
                        fi;
                        return;
                    end )(  ) then
                return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                               return (IndexOfObject( obj_3 ) = deduped_3_2);
                           end )] - 1 ];
            else
                return deduped_61_1;
            fi;
            return;
        end );
    hoisted_19_1 := List( deduped_49_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2;
            deduped_4_2 := 1 + (CAP_JIT_INCOMPLETE_LOGIC( i_2 ) + deduped_55_1);
            hoisted_3_2 := hoisted_17_1[1 + i_2];
            hoisted_2_2 := deduped_46_1[deduped_4_2];
            hoisted_1_2 := Product( deduped_46_1{[ 1 .. deduped_4_2 - 1 ]} );
            return List( deduped_42_1, function ( i_3 )
                    return hoisted_3_2[1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 ) )];
                end );
        end );
    deduped_6_1 := Concatenation( List( deduped_51_1, IndexOfObject ), List( deduped_53_1, IndexOfObject ) );
    hoisted_4_1 := deduped_62_1[3];
    deduped_5_1 := List( deduped_49_1, function ( i_2 )
            return hoisted_4_1[1 + REM_INT( QUO_INT( i_2, 1 ), deduped_58_1 )];
        end );
    hoisted_14_1 := List( deduped_49_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_6_1[1 + deduped_5_1[(1 + i_2)]];
            return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                     return IndexOfObject( obj_3 ) = hoisted_1_2;
                 end )];
        end );
    deduped_15_1 := List( deduped_49_1, function ( j_2 )
            return Product( hoisted_14_1{[ 1 .. j_2 ]} );
        end );
    hoisted_13_1 := List( deduped_49_1, function ( i_2 )
            local hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
            deduped_8_2 := 1 + deduped_5_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 ))];
            deduped_7_2 := 1 + deduped_7_1[(1 + deduped_6_1[deduped_8_2])];
            deduped_6_2 := deduped_8_1[deduped_7_2];
            deduped_5_2 := 1 + deduped_7_1[(1 + deduped_6_2)];
            hoisted_4_2 := CAP_JIT_INCOMPLETE_LOGIC( IdFunc( function (  )
                        if IdFunc( function (  )
                                    if deduped_6_2 = deduped_8_1[deduped_5_2] and deduped_9_1[deduped_7_2] = deduped_9_1[deduped_5_2] then
                                        return deduped_10_1[deduped_7_2] = deduped_10_1[deduped_5_2];
                                    else
                                        return false;
                                    fi;
                                    return;
                                end )(  ) then
                            return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_4 )
                                           return (IndexOfObject( obj_4 ) = deduped_6_2);
                                       end )] - 1 ];
                        else
                            return deduped_61_1;
                        fi;
                        return;
                    end )(  ) );
            hoisted_3_2 := deduped_46_1[deduped_8_2];
            hoisted_2_2 := Product( deduped_46_1{[ 1 .. deduped_8_2 - 1 ]} );
            return List( deduped_42_1, function ( i_3 )
                    return hoisted_4_2[1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_2_2 ), hoisted_3_2 ) )];
                end );
        end );
    deduped_40_1 := Filtered( deduped_42_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_49_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_13_1[deduped_1_3][deduped_1_2] * deduped_15_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_49_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_19_1[deduped_1_3][deduped_1_2] * deduped_15_1[deduped_1_3];
                    end ) );
        end );
    deduped_39_1 := Filtered( deduped_41_1, function ( x_2 )
            return true;
        end );
    deduped_38_1 := Length( deduped_40_1 );
    deduped_25_1 := List( deduped_50_1, function ( j_2 )
            return Product( deduped_45_1{[ 1 .. j_2 ]} );
        end );
    deduped_20_1 := [ [ 0 .. deduped_59_1 - 1 ], [ 0 .. deduped_60_1 - 1 ] ];
    hoisted_21_1 := Concatenation( List( deduped_51_1, function ( objB_2 )
              return deduped_20_1[SafePosition( deduped_1_1, objB_2 )];
          end ), List( deduped_52_1, function ( objB_2 )
              return deduped_20_1[SafePosition( deduped_1_1, objB_2 )];
          end ) );
    hoisted_24_1 := List( [ 1 .. deduped_55_1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_21_1[i_2];
            hoisted_2_2 := deduped_45_1[i_2];
            hoisted_1_2 := Product( deduped_45_1{[ 1 .. i_2 - 1 ]} );
            return List( deduped_41_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    hoisted_36_1 := List( deduped_41_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_50_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_24_1[deduped_1_3][hoisted_1_2] * deduped_25_1[deduped_1_3];
                end );
        end );
    deduped_31_1 := List( deduped_47_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_27_1 := List( deduped_47_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_33_1 := Concatenation( List( deduped_43_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := Sum( deduped_31_1{[ 1 .. i_2 - 1 ]} );
              hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_31_1[i_2] - 1 ];
              hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( AsList( CAP_JIT_INCOMPLETE_LOGIC( deduped_47_1[i_2] ) ) );
              return List( [ 0 .. deduped_27_1[i_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + hoisted_2_2[(1 + hoisted_1_2[(1 + i_3)])];
                      hoisted_2_3 := deduped_46_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_46_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_42_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_30_1 := Concatenation( List( deduped_51_1, function ( objB_2 )
              local deduped_2_2, deduped_3_2, deduped_4_2;
              deduped_4_2 := 1 + deduped_7_1[(1 + IndexOfObject( objB_2 ))];
              deduped_3_2 := deduped_8_1[deduped_4_2];
              deduped_2_2 := 1 + deduped_7_1[(1 + deduped_3_2)];
              if IdFunc( function (  )
                          if deduped_3_2 = deduped_8_1[deduped_2_2] and deduped_9_1[deduped_4_2] = deduped_9_1[deduped_2_2] then
                              return deduped_10_1[deduped_4_2] = deduped_10_1[deduped_2_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_3_2);
                             end )] - 1 ];
              else
                  return deduped_61_1;
              fi;
              return;
          end ), List( deduped_52_1, function ( objB_2 )
              local deduped_2_2, deduped_3_2, deduped_4_2;
              deduped_4_2 := 1 + deduped_7_1[(1 + IndexOfObject( objB_2 ))];
              deduped_3_2 := deduped_8_1[deduped_4_2];
              deduped_2_2 := 1 + deduped_7_1[(1 + deduped_3_2)];
              if IdFunc( function (  )
                          if deduped_3_2 = deduped_8_1[deduped_2_2] and deduped_9_1[deduped_4_2] = deduped_9_1[deduped_2_2] then
                              return deduped_10_1[deduped_4_2] = deduped_10_1[deduped_2_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_3_2);
                             end )] - 1 ];
              else
                  return deduped_61_1;
              fi;
              return;
          end ) );
    hoisted_29_1 := Concatenation( List( deduped_43_1, function ( i_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_27_1[i_2] - 1 ] ), deduped_44_1 );
          end ) );
    hoisted_34_1 := List( [ 0 .. Sum( List( deduped_43_1, function ( i_2 )
                      return Length( [ 0 .. deduped_27_1[i_2] - 1 ] );
                  end ) ) - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_30_1[deduped_3_2];
            hoisted_1_2 := hoisted_33_1[deduped_3_2];
            return List( [ 0 .. hoisted_29_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfBouquetEnrichedOverSkeletalFinSets, NTuple( 3, Length( deduped_39_1 ), deduped_38_1, List( [ 0 .. deduped_38_1 - 1 ], function ( x_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_40_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))] );
                return -1 + BigInt( SafePosition( deduped_39_1, CAP_JIT_INCOMPLETE_LOGIC( hoisted_36_1[(1 + Sum( deduped_50_1, function ( j_3 )
                                   local deduped_1_3;
                                   deduped_1_3 := (1 + j_3);
                                   return hoisted_34_1[deduped_1_3][hoisted_1_2] * deduped_25_1[deduped_1_3];
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
