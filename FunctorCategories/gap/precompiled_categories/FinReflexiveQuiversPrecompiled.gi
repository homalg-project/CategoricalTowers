# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_FinReflexiveQuiversPrecompiled", function ( cat )
    
    ##
    AddInitialObject( cat,
        
########
function ( cat_1 )
    local deduped_1_1;
    deduped_1_1 := [  ];
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets, NTuple( 4, 0, 0, deduped_1_1, deduped_1_1 ) );
end
########
        
    , 100 );
    
    ##
    AddCoproduct( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := [ 1 .. Length( arg2_1 ) ];
    deduped_4_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( logic_new_func_x_2 )[2];
        end );
    deduped_3_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( logic_new_func_x_2 )[1];
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets, NTuple( 4, Sum( deduped_3_1 ), Sum( deduped_4_1 ), Concatenation( List( deduped_5_1, function ( logic_new_func_x_2 )
                  local hoisted_1_2, hoisted_2_2, deduped_3_2;
                  deduped_3_2 := Sum( deduped_4_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
                  hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_4_1[logic_new_func_x_2] - 1 ];
                  hoisted_1_2 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( CAP_JIT_INCOMPLETE_LOGIC( arg2_1[logic_new_func_x_2] ) )[3];
                  return List( [ 0 .. deduped_3_1[logic_new_func_x_2] - 1 ], function ( i_3 )
                          return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                      end );
              end ) ), ListN( Concatenation( List( deduped_5_1, function ( logic_new_func_x_2 )
                    local hoisted_1_2, hoisted_2_2, deduped_3_2;
                    deduped_3_2 := Sum( deduped_3_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
                    hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_3_1[logic_new_func_x_2] - 1 ];
                    hoisted_1_2 := List( DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( CAP_JIT_INCOMPLETE_LOGIC( arg2_1[logic_new_func_x_2] ) )[4], function ( a_3 )
                            return a_3[1];
                        end );
                    return List( [ 0 .. deduped_4_1[logic_new_func_x_2] - 1 ], function ( i_3 )
                            return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                        end );
                end ) ), Concatenation( List( deduped_5_1, function ( logic_new_func_x_2 )
                    local hoisted_1_2, hoisted_2_2, deduped_3_2;
                    deduped_3_2 := Sum( deduped_3_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
                    hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_3_1[logic_new_func_x_2] - 1 ];
                    hoisted_1_2 := List( DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( CAP_JIT_INCOMPLETE_LOGIC( arg2_1[logic_new_func_x_2] ) )[4], function ( a_3 )
                            return a_3[2];
                        end );
                    return List( [ 0 .. deduped_4_1[logic_new_func_x_2] - 1 ], function ( i_3 )
                            return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                        end );
                end ) ), function ( s_2, t_2 )
                return NTuple( 2, s_2, t_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddDistinguishedObjectOfHomomorphismStructure( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, 1 );
end
########
        
    , 100 );
    
    ##
    AddHomomorphismStructureOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, hoisted_16_1, hoisted_19_1, hoisted_20_1, deduped_21_1, hoisted_22_1, deduped_23_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1;
    deduped_59_1 := [ 6 ];
    deduped_58_1 := [ 5 ];
    deduped_57_1 := [ 4 ];
    deduped_56_1 := [ 3 ];
    deduped_55_1 := [ 2 ];
    deduped_54_1 := [ 1 ];
    deduped_53_1 := [ 0 ];
    deduped_52_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_51_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_50_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_49_1 := deduped_51_1[4];
    deduped_48_1 := deduped_52_1[4];
    deduped_47_1 := CreateCapCategoryObjectWithAttributes( deduped_50_1, Length, 7 );
    deduped_46_1 := deduped_51_1[2];
    deduped_45_1 := CreateCapCategoryObjectWithAttributes( deduped_50_1, Length, 2 );
    deduped_44_1 := CreateCapCategoryObjectWithAttributes( deduped_50_1, Length, 1 );
    deduped_43_1 := deduped_51_1[1];
    deduped_42_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_41_1 := [ 0 .. deduped_46_1 - 1 ];
    deduped_40_1 := [ 0 .. deduped_43_1 - 1 ];
    deduped_39_1 := CreateCapCategoryObjectWithAttributes( deduped_42_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_50_1, deduped_44_1, deduped_45_1, AsList, deduped_54_1 ) );
    deduped_38_1 := CreateCapCategoryObjectWithAttributes( deduped_42_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_50_1, deduped_44_1, deduped_45_1, AsList, deduped_53_1 ) );
    deduped_37_1 := Length( deduped_41_1 );
    deduped_36_1 := CreateCapCategoryMorphismWithAttributes( deduped_42_1, deduped_38_1, deduped_39_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_50_1, deduped_44_1, deduped_47_1, AsList, deduped_56_1 ) );
    deduped_35_1 := CreateCapCategoryMorphismWithAttributes( deduped_42_1, deduped_38_1, deduped_39_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_50_1, deduped_44_1, deduped_47_1, AsList, deduped_55_1 ) );
    deduped_34_1 := CreateCapCategoryMorphismWithAttributes( deduped_42_1, deduped_39_1, deduped_38_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_50_1, deduped_44_1, deduped_47_1, AsList, deduped_54_1 ) );
    deduped_33_1 := ListWithIdenticalEntries( deduped_46_1, deduped_39_1 );
    deduped_32_1 := ListWithIdenticalEntries( deduped_43_1, deduped_38_1 );
    deduped_2_1 := [ deduped_52_1[1], deduped_52_1[2] ];
    deduped_1_1 := [ deduped_38_1, deduped_39_1 ];
    deduped_30_1 := Concatenation( List( deduped_32_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ), List( deduped_33_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ) );
    deduped_28_1 := [ 0 .. Product( deduped_30_1 ) - 1 ];
    deduped_31_1 := List( deduped_41_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := logic_new_func_x_2 + deduped_43_1;
            hoisted_2_2 := deduped_30_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_30_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_28_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_29_1 := [ 0 .. Sum( [ Length( deduped_40_1 ), deduped_37_1, deduped_37_1 ] ) - 1 ];
    hoisted_26_1 := Concatenation( List( deduped_40_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2;
              hoisted_2_2 := deduped_30_1[1 + logic_new_func_x_2];
              hoisted_1_2 := Product( deduped_30_1{[ 1 .. logic_new_func_x_2 ]} );
              return List( deduped_28_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), deduped_31_1, deduped_31_1 );
    deduped_13_1 := [ deduped_52_1[3], List( deduped_48_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_48_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_12_1 := [ deduped_34_1, deduped_35_1, deduped_36_1 ];
    deduped_9_1 := [ deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1 ];
    deduped_8_1 := [ deduped_53_1, deduped_53_1, deduped_54_1, deduped_54_1, deduped_54_1, deduped_54_1, deduped_54_1 ];
    deduped_7_1 := [ deduped_53_1, deduped_54_1, deduped_53_1, deduped_53_1, deduped_54_1, deduped_54_1, deduped_54_1 ];
    deduped_6_1 := [ 0, 4 ];
    hoisted_25_1 := Concatenation( List( ListWithIdenticalEntries( deduped_43_1, deduped_34_1 ), function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( logic_new_func_x_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_6_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_7_1[deduped_1_2] and AsList( MapOfObject( Range( logic_new_func_x_2 ) ) ) = deduped_8_1[deduped_1_2] then
                              return AsList( MapOfMorphism( logic_new_func_x_2 ) ) = deduped_9_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePosition( deduped_12_1, logic_new_func_x_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_46_1, deduped_35_1 ), function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( logic_new_func_x_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_6_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_7_1[deduped_1_2] and AsList( MapOfObject( Range( logic_new_func_x_2 ) ) ) = deduped_8_1[deduped_1_2] then
                              return AsList( MapOfMorphism( logic_new_func_x_2 ) ) = deduped_9_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePosition( deduped_12_1, logic_new_func_x_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_46_1, deduped_36_1 ), function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( logic_new_func_x_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_6_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_7_1[deduped_1_2] and AsList( MapOfObject( Range( logic_new_func_x_2 ) ) ) = deduped_8_1[deduped_1_2] then
                              return AsList( MapOfMorphism( logic_new_func_x_2 ) ) = deduped_9_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePosition( deduped_12_1, logic_new_func_x_2 )];
              fi;
              return;
          end ) );
    hoisted_27_1 := List( deduped_29_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_25_1[deduped_3_2];
            hoisted_1_2 := hoisted_26_1[deduped_3_2];
            return List( deduped_28_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_21_1 := Concatenation( deduped_32_1, deduped_33_1 );
    deduped_15_1 := List( deduped_49_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_14_1 := List( deduped_49_1, function ( a_2 )
            return a_2[1];
        end );
    deduped_3_1 := deduped_51_1[3];
    hoisted_22_1 := Concatenation( List( deduped_40_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_21_1[1 + (deduped_3_1[1 + logic_new_func_x_2] + deduped_43_1)] )];
          end ), List( deduped_41_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_21_1[1 + deduped_14_1[(1 + logic_new_func_x_2)]] )];
          end ), List( deduped_41_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_21_1[1 + deduped_15_1[(1 + logic_new_func_x_2)]] )];
          end ) );
    deduped_23_1 := List( deduped_29_1, function ( j_2 )
            return Product( hoisted_22_1{[ 1 .. j_2 ]} );
        end );
    hoisted_19_1 := Concatenation( List( deduped_40_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_3_1[1 + logic_new_func_x_2] + deduped_43_1;
              hoisted_2_2 := deduped_30_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_30_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_28_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_41_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_14_1[1 + logic_new_func_x_2];
              hoisted_2_2 := deduped_30_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_30_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_28_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_41_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_15_1[1 + logic_new_func_x_2];
              hoisted_2_2 := deduped_30_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_30_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_28_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_11_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_42_1, deduped_38_1, deduped_38_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_50_1, deduped_44_1, deduped_47_1, AsList, deduped_53_1 ) ), deduped_34_1, deduped_35_1, deduped_36_1, CreateCapCategoryMorphismWithAttributes( deduped_42_1, deduped_39_1, deduped_39_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_50_1, deduped_44_1, deduped_47_1, AsList, deduped_57_1 ) ), CreateCapCategoryMorphismWithAttributes( deduped_42_1, deduped_39_1, deduped_39_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_50_1, deduped_44_1, deduped_47_1, AsList, deduped_58_1 ) ), CreateCapCategoryMorphismWithAttributes( deduped_42_1, deduped_39_1, deduped_39_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_50_1, deduped_44_1, deduped_47_1, AsList, deduped_59_1 ) ) ];
    deduped_10_1 := [ deduped_38_1, deduped_39_1, deduped_38_1, deduped_38_1, deduped_39_1, deduped_39_1, deduped_39_1 ];
    deduped_5_1 := Concatenation( List( deduped_32_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ), List( deduped_33_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    hoisted_16_1 := Concatenation( List( deduped_40_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_6_1[(1 + deduped_5_1[(1 + (deduped_3_1[1 + logic_new_func_x_2] + deduped_43_1))][1])];
              deduped_2_2 := deduped_7_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_6_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_7_1[deduped_1_2] and deduped_8_1[deduped_3_2] = deduped_8_1[deduped_1_2] then
                              return deduped_9_1[deduped_3_2] = deduped_9_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_10_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePosition( deduped_12_1, deduped_11_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_41_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_6_1[(1 + deduped_5_1[(1 + deduped_14_1[(1 + logic_new_func_x_2)])][1])];
              deduped_2_2 := deduped_7_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_6_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_7_1[deduped_1_2] and deduped_8_1[deduped_3_2] = deduped_8_1[deduped_1_2] then
                              return deduped_9_1[deduped_3_2] = deduped_9_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_10_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePosition( deduped_12_1, deduped_11_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_41_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_6_1[(1 + deduped_5_1[(1 + deduped_15_1[(1 + logic_new_func_x_2)])][1])];
              deduped_2_2 := deduped_7_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_6_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_7_1[deduped_1_2] and deduped_8_1[deduped_3_2] = deduped_8_1[deduped_1_2] then
                              return deduped_9_1[deduped_3_2] = deduped_9_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_10_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePosition( deduped_12_1, deduped_11_1[deduped_3_2] )];
              fi;
              return;
          end ) );
    hoisted_20_1 := List( deduped_29_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_16_1[deduped_3_2];
            hoisted_1_2 := hoisted_19_1[deduped_3_2];
            return List( deduped_28_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( deduped_50_1, Length, Length( Filtered( deduped_28_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return Sum( deduped_29_1, function ( j_3 )
                          local deduped_1_3;
                          deduped_1_3 := 1 + j_3;
                          return hoisted_20_1[deduped_1_3][deduped_1_2] * deduped_23_1[deduped_1_3];
                      end ) = Sum( deduped_29_1, function ( j_3 )
                          local deduped_1_3;
                          deduped_1_3 := 1 + j_3;
                          return hoisted_27_1[deduped_1_3][deduped_1_2] * deduped_23_1[deduped_1_3];
                      end );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, hoisted_19_1, hoisted_22_1, hoisted_23_1, deduped_24_1, hoisted_25_1, deduped_26_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, deduped_31_1, deduped_32_1, hoisted_33_1, hoisted_35_1, hoisted_37_1, hoisted_38_1, deduped_41_1, hoisted_42_1, hoisted_43_1, hoisted_45_1, hoisted_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1, deduped_68_1, deduped_69_1, deduped_70_1, deduped_71_1, deduped_72_1, deduped_73_1, deduped_74_1, deduped_75_1, deduped_76_1, deduped_77_1, deduped_78_1, deduped_79_1, deduped_80_1, deduped_81_1, deduped_82_1, deduped_83_1, deduped_84_1, deduped_85_1, deduped_86_1, deduped_87_1;
    deduped_87_1 := [ 6 ];
    deduped_86_1 := [ 5 ];
    deduped_85_1 := [ 4 ];
    deduped_84_1 := [ 3 ];
    deduped_83_1 := [ 2 ];
    deduped_82_1 := [ 1 ];
    deduped_81_1 := [ 0 ];
    deduped_80_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( range_1 );
    deduped_79_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( source_1 );
    deduped_78_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_77_1 := Length( Source( alpha_1 ) );
    deduped_76_1 := deduped_79_1[4];
    deduped_75_1 := deduped_80_1[4];
    deduped_74_1 := CreateCapCategoryObjectWithAttributes( deduped_78_1, Length, 7 );
    deduped_73_1 := deduped_80_1[2];
    deduped_72_1 := CreateCapCategoryObjectWithAttributes( deduped_78_1, Length, 2 );
    deduped_71_1 := CreateCapCategoryObjectWithAttributes( deduped_78_1, Length, 1 );
    deduped_70_1 := deduped_80_1[1];
    deduped_69_1 := deduped_79_1[2];
    deduped_68_1 := deduped_79_1[1];
    deduped_67_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_66_1 := [ 0 .. deduped_77_1 - 1 ];
    deduped_65_1 := [ 0 .. deduped_69_1 - 1 ];
    deduped_64_1 := [ 0 .. deduped_68_1 - 1 ];
    deduped_63_1 := CreateCapCategoryObjectWithAttributes( deduped_67_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_78_1, deduped_71_1, deduped_72_1, AsList, deduped_82_1 ) );
    deduped_62_1 := CreateCapCategoryObjectWithAttributes( deduped_67_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_78_1, deduped_71_1, deduped_72_1, AsList, deduped_81_1 ) );
    deduped_61_1 := Length( deduped_65_1 );
    deduped_60_1 := CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_62_1, deduped_63_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_78_1, deduped_71_1, deduped_74_1, AsList, deduped_84_1 ) );
    deduped_59_1 := CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_62_1, deduped_63_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_78_1, deduped_71_1, deduped_74_1, AsList, deduped_83_1 ) );
    deduped_58_1 := CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_63_1, deduped_62_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_78_1, deduped_71_1, deduped_74_1, AsList, deduped_82_1 ) );
    deduped_57_1 := ListWithIdenticalEntries( deduped_69_1, deduped_63_1 );
    deduped_56_1 := ListWithIdenticalEntries( deduped_68_1, deduped_62_1 );
    deduped_4_1 := [ deduped_70_1, deduped_73_1 ];
    deduped_3_1 := [ deduped_62_1, deduped_63_1 ];
    deduped_53_1 := Concatenation( List( deduped_56_1, function ( logic_new_func_x_2 )
              return deduped_4_1[SafePosition( deduped_3_1, logic_new_func_x_2 )];
          end ), List( deduped_57_1, function ( logic_new_func_x_2 )
              return deduped_4_1[SafePosition( deduped_3_1, logic_new_func_x_2 )];
          end ) );
    deduped_47_1 := [ 0 .. Product( deduped_53_1 ) - 1 ];
    deduped_55_1 := List( deduped_65_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := logic_new_func_x_2 + deduped_68_1;
            hoisted_2_2 := deduped_53_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_53_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_47_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_54_1 := List( ListOfValues( [ CreateCapCategoryObjectWithAttributes( deduped_78_1, Length, deduped_68_1 ), CreateCapCategoryObjectWithAttributes( deduped_78_1, Length, deduped_69_1 ) ] ), Length );
    deduped_52_1 := deduped_54_1[2];
    deduped_51_1 := deduped_54_1[1];
    deduped_50_1 := [ 0 .. Sum( [ Length( deduped_64_1 ), deduped_61_1, deduped_61_1 ] ) - 1 ];
    deduped_49_1 := deduped_73_1 ^ deduped_52_1;
    deduped_48_1 := deduped_70_1 ^ deduped_51_1;
    hoisted_45_1 := List( [ 0 .. deduped_49_1 * deduped_52_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_73_1 ^ QUO_INT( i_2, deduped_49_1 ) ), deduped_73_1 );
        end );
    deduped_41_1 := Product( deduped_53_1{[ 1 + deduped_51_1 .. Sum( deduped_54_1{[ 1, 2 ]} ) ]} );
    deduped_5_1 := Product( deduped_53_1{[ 1 .. deduped_51_1 ]} );
    hoisted_42_1 := List( deduped_47_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_5_1 ), deduped_41_1 );
        end );
    hoisted_29_1 := Concatenation( List( deduped_64_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2;
              hoisted_2_2 := deduped_53_1[1 + logic_new_func_x_2];
              hoisted_1_2 := Product( deduped_53_1{[ 1 .. logic_new_func_x_2 ]} );
              return List( deduped_47_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), deduped_55_1, deduped_55_1 );
    deduped_16_1 := [ deduped_80_1[3], List( deduped_75_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_75_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_15_1 := [ deduped_58_1, deduped_59_1, deduped_60_1 ];
    deduped_12_1 := [ deduped_81_1, deduped_82_1, deduped_83_1, deduped_84_1, deduped_85_1, deduped_86_1, deduped_87_1 ];
    deduped_11_1 := [ deduped_81_1, deduped_81_1, deduped_82_1, deduped_82_1, deduped_82_1, deduped_82_1, deduped_82_1 ];
    deduped_10_1 := [ deduped_81_1, deduped_82_1, deduped_81_1, deduped_81_1, deduped_82_1, deduped_82_1, deduped_82_1 ];
    deduped_9_1 := [ 0, 4 ];
    hoisted_28_1 := Concatenation( List( ListWithIdenticalEntries( deduped_68_1, deduped_58_1 ), function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( logic_new_func_x_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_9_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_10_1[deduped_1_2] and AsList( MapOfObject( Range( logic_new_func_x_2 ) ) ) = deduped_11_1[deduped_1_2] then
                              return AsList( MapOfMorphism( logic_new_func_x_2 ) ) = deduped_12_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_4_1[SafePosition( deduped_3_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_16_1[SafeUniquePosition( deduped_15_1, logic_new_func_x_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_69_1, deduped_59_1 ), function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( logic_new_func_x_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_9_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_10_1[deduped_1_2] and AsList( MapOfObject( Range( logic_new_func_x_2 ) ) ) = deduped_11_1[deduped_1_2] then
                              return AsList( MapOfMorphism( logic_new_func_x_2 ) ) = deduped_12_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_4_1[SafePosition( deduped_3_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_16_1[SafeUniquePosition( deduped_15_1, logic_new_func_x_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_69_1, deduped_60_1 ), function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( logic_new_func_x_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_9_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_10_1[deduped_1_2] and AsList( MapOfObject( Range( logic_new_func_x_2 ) ) ) = deduped_11_1[deduped_1_2] then
                              return AsList( MapOfMorphism( logic_new_func_x_2 ) ) = deduped_12_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_4_1[SafePosition( deduped_3_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_16_1[SafeUniquePosition( deduped_15_1, logic_new_func_x_2 )];
              fi;
              return;
          end ) );
    hoisted_30_1 := List( deduped_50_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_28_1[deduped_3_2];
            hoisted_1_2 := hoisted_29_1[deduped_3_2];
            return List( deduped_47_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_24_1 := Concatenation( deduped_56_1, deduped_57_1 );
    deduped_18_1 := List( deduped_76_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_17_1 := List( deduped_76_1, function ( a_2 )
            return a_2[1];
        end );
    deduped_6_1 := deduped_79_1[3];
    hoisted_25_1 := Concatenation( List( deduped_64_1, function ( logic_new_func_x_2 )
              return deduped_4_1[SafePosition( deduped_3_1, deduped_24_1[1 + (deduped_6_1[1 + logic_new_func_x_2] + deduped_68_1)] )];
          end ), List( deduped_65_1, function ( logic_new_func_x_2 )
              return deduped_4_1[SafePosition( deduped_3_1, deduped_24_1[1 + deduped_17_1[(1 + logic_new_func_x_2)]] )];
          end ), List( deduped_65_1, function ( logic_new_func_x_2 )
              return deduped_4_1[SafePosition( deduped_3_1, deduped_24_1[1 + deduped_18_1[(1 + logic_new_func_x_2)]] )];
          end ) );
    deduped_26_1 := List( deduped_50_1, function ( j_2 )
            return Product( hoisted_25_1{[ 1 .. j_2 ]} );
        end );
    hoisted_22_1 := Concatenation( List( deduped_64_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_6_1[1 + logic_new_func_x_2] + deduped_68_1;
              hoisted_2_2 := deduped_53_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_53_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_47_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_65_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_17_1[1 + logic_new_func_x_2];
              hoisted_2_2 := deduped_53_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_53_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_47_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_65_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_18_1[1 + logic_new_func_x_2];
              hoisted_2_2 := deduped_53_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_53_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_47_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_14_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_62_1, deduped_62_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_78_1, deduped_71_1, deduped_74_1, AsList, deduped_81_1 ) ), deduped_58_1, deduped_59_1, deduped_60_1, CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_63_1, deduped_63_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_78_1, deduped_71_1, deduped_74_1, AsList, deduped_85_1 ) ), CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_63_1, deduped_63_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_78_1, deduped_71_1, deduped_74_1, AsList, deduped_86_1 ) ), CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_63_1, deduped_63_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_78_1, deduped_71_1, deduped_74_1, AsList, deduped_87_1 ) ) ];
    deduped_13_1 := [ deduped_62_1, deduped_63_1, deduped_62_1, deduped_62_1, deduped_63_1, deduped_63_1, deduped_63_1 ];
    deduped_8_1 := Concatenation( List( deduped_56_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ), List( deduped_57_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    hoisted_19_1 := Concatenation( List( deduped_64_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_9_1[(1 + deduped_8_1[(1 + (deduped_6_1[1 + logic_new_func_x_2] + deduped_68_1))][1])];
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
                  return [ 0 .. deduped_4_1[SafePosition( deduped_3_1, deduped_13_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_16_1[SafeUniquePosition( deduped_15_1, deduped_14_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_65_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_9_1[(1 + deduped_8_1[(1 + deduped_17_1[(1 + logic_new_func_x_2)])][1])];
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
                  return [ 0 .. deduped_4_1[SafePosition( deduped_3_1, deduped_13_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_16_1[SafeUniquePosition( deduped_15_1, deduped_14_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_65_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_9_1[(1 + deduped_8_1[(1 + deduped_18_1[(1 + logic_new_func_x_2)])][1])];
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
                  return [ 0 .. deduped_4_1[SafePosition( deduped_3_1, deduped_13_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_16_1[SafeUniquePosition( deduped_15_1, deduped_14_1[deduped_3_2] )];
              fi;
              return;
          end ) );
    hoisted_23_1 := List( deduped_50_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_19_1[deduped_3_2];
            hoisted_1_2 := hoisted_22_1[deduped_3_2];
            return List( deduped_47_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_32_1 := Filtered( deduped_47_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return Sum( deduped_50_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_23_1[deduped_1_3][deduped_1_2] * deduped_26_1[deduped_1_3];
                  end ) = Sum( deduped_50_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_30_1[deduped_1_3][deduped_1_2] * deduped_26_1[deduped_1_3];
                  end );
        end );
    deduped_31_1 := AsList( alpha_1 );
    hoisted_43_1 := List( deduped_66_1, function ( logic_new_func_x_2 )
            return hoisted_42_1[1 + deduped_32_1[(1 + deduped_31_1[(1 + logic_new_func_x_2)])]];
        end );
    hoisted_46_1 := List( [ 0 .. deduped_77_1 * deduped_52_1 - 1 ], function ( logic_new_func_x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 );
            return hoisted_45_1[1 + (hoisted_43_1[1 + REM_INT( deduped_1_2, deduped_77_1 )] + REM_INT( QUO_INT( deduped_1_2, deduped_77_1 ), deduped_52_1 ) * deduped_41_1)];
        end );
    hoisted_37_1 := List( [ 0 .. deduped_48_1 * deduped_51_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_70_1 ^ QUO_INT( i_2, deduped_48_1 ) ), deduped_70_1 );
        end );
    hoisted_33_1 := List( deduped_47_1, function ( i_2 )
            return REM_INT( i_2, deduped_5_1 );
        end );
    hoisted_35_1 := List( deduped_66_1, function ( logic_new_func_x_2 )
            return hoisted_33_1[1 + deduped_32_1[(1 + deduped_31_1[(1 + logic_new_func_x_2)])]];
        end );
    hoisted_38_1 := List( [ 0 .. deduped_77_1 * deduped_51_1 - 1 ], function ( logic_new_func_x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 );
            return hoisted_37_1[1 + (hoisted_35_1[1 + REM_INT( deduped_1_2, deduped_77_1 )] + REM_INT( QUO_INT( deduped_1_2, deduped_77_1 ), deduped_51_1 ) * deduped_5_1)];
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, DefiningPairOfReflexiveQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( [ 0 .. deduped_51_1 - 1 ], function ( i_2 )
                return hoisted_38_1[1 + i_2];
            end ), List( [ 0 .. deduped_52_1 - 1 ], function ( i_2 )
                return hoisted_46_1[1 + i_2];
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, hoisted_16_1, hoisted_19_1, hoisted_20_1, deduped_21_1, hoisted_22_1, deduped_23_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, deduped_32_1, hoisted_34_1, hoisted_35_1, deduped_39_1, hoisted_41_1, hoisted_42_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1, deduped_68_1, deduped_69_1, deduped_70_1, deduped_71_1, deduped_72_1, deduped_73_1, deduped_74_1, deduped_75_1, deduped_76_1, deduped_77_1, deduped_78_1, deduped_79_1, deduped_80_1, deduped_81_1, deduped_82_1, deduped_83_1, deduped_84_1, deduped_85_1, deduped_86_1;
    deduped_86_1 := [ 6 ];
    deduped_85_1 := [ 5 ];
    deduped_84_1 := [ 4 ];
    deduped_83_1 := [ 3 ];
    deduped_82_1 := [ 2 ];
    deduped_81_1 := [ 1 ];
    deduped_80_1 := [ 0 ];
    deduped_79_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_78_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_77_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_76_1 := deduped_77_1[4];
    deduped_75_1 := deduped_79_1[4];
    deduped_74_1 := CreateCapCategoryObjectWithAttributes( deduped_78_1, Length, 7 );
    deduped_73_1 := deduped_79_1[2];
    deduped_72_1 := deduped_79_1[1];
    deduped_71_1 := deduped_77_1[2];
    deduped_70_1 := CreateCapCategoryObjectWithAttributes( deduped_78_1, Length, 2 );
    deduped_69_1 := CreateCapCategoryObjectWithAttributes( deduped_78_1, Length, 1 );
    deduped_68_1 := deduped_77_1[1];
    deduped_67_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_66_1 := [ 0 .. deduped_71_1 - 1 ];
    deduped_65_1 := [ 0 .. deduped_68_1 - 1 ];
    deduped_64_1 := CreateCapCategoryObjectWithAttributes( deduped_67_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_78_1, deduped_69_1, deduped_70_1, AsList, deduped_81_1 ) );
    deduped_63_1 := CreateCapCategoryObjectWithAttributes( deduped_67_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_78_1, deduped_69_1, deduped_70_1, AsList, deduped_80_1 ) );
    deduped_62_1 := Length( deduped_66_1 );
    deduped_61_1 := CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_63_1, deduped_64_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_78_1, deduped_69_1, deduped_74_1, AsList, deduped_83_1 ) );
    deduped_60_1 := CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_63_1, deduped_64_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_78_1, deduped_69_1, deduped_74_1, AsList, deduped_82_1 ) );
    deduped_59_1 := CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_64_1, deduped_63_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_78_1, deduped_69_1, deduped_74_1, AsList, deduped_81_1 ) );
    deduped_58_1 := ListWithIdenticalEntries( deduped_71_1, deduped_64_1 );
    deduped_57_1 := ListWithIdenticalEntries( deduped_68_1, deduped_63_1 );
    deduped_56_1 := List( ListOfValues( [ CreateCapCategoryObjectWithAttributes( deduped_78_1, Length, deduped_68_1 ), CreateCapCategoryObjectWithAttributes( deduped_78_1, Length, deduped_71_1 ) ] ), Length );
    deduped_2_1 := [ deduped_72_1, deduped_73_1 ];
    deduped_1_1 := [ deduped_63_1, deduped_64_1 ];
    deduped_52_1 := Concatenation( List( deduped_57_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ), List( deduped_58_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ) );
    deduped_46_1 := [ 0 .. Product( deduped_52_1 ) - 1 ];
    deduped_55_1 := List( deduped_66_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := logic_new_func_x_2 + deduped_68_1;
            hoisted_2_2 := deduped_52_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_52_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_46_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_54_1 := deduped_56_1[2];
    deduped_53_1 := deduped_56_1[1];
    deduped_51_1 := [ 0 .. Sum( [ Length( deduped_65_1 ), deduped_62_1, deduped_62_1 ] ) - 1 ];
    deduped_50_1 := deduped_73_1 ^ deduped_54_1;
    deduped_49_1 := deduped_72_1 ^ deduped_53_1;
    deduped_48_1 := [ 0 .. deduped_54_1 - 1 ];
    deduped_47_1 := [ 0 .. deduped_53_1 - 1 ];
    hoisted_26_1 := Concatenation( List( deduped_65_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2;
              hoisted_2_2 := deduped_52_1[1 + logic_new_func_x_2];
              hoisted_1_2 := Product( deduped_52_1{[ 1 .. logic_new_func_x_2 ]} );
              return List( deduped_46_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), deduped_55_1, deduped_55_1 );
    deduped_13_1 := [ deduped_79_1[3], List( deduped_75_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_75_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_12_1 := [ deduped_59_1, deduped_60_1, deduped_61_1 ];
    deduped_9_1 := [ deduped_80_1, deduped_81_1, deduped_82_1, deduped_83_1, deduped_84_1, deduped_85_1, deduped_86_1 ];
    deduped_8_1 := [ deduped_80_1, deduped_80_1, deduped_81_1, deduped_81_1, deduped_81_1, deduped_81_1, deduped_81_1 ];
    deduped_7_1 := [ deduped_80_1, deduped_81_1, deduped_80_1, deduped_80_1, deduped_81_1, deduped_81_1, deduped_81_1 ];
    deduped_6_1 := [ 0, 4 ];
    hoisted_25_1 := Concatenation( List( ListWithIdenticalEntries( deduped_68_1, deduped_59_1 ), function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( logic_new_func_x_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_6_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_7_1[deduped_1_2] and AsList( MapOfObject( Range( logic_new_func_x_2 ) ) ) = deduped_8_1[deduped_1_2] then
                              return AsList( MapOfMorphism( logic_new_func_x_2 ) ) = deduped_9_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePosition( deduped_12_1, logic_new_func_x_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_71_1, deduped_60_1 ), function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( logic_new_func_x_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_6_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_7_1[deduped_1_2] and AsList( MapOfObject( Range( logic_new_func_x_2 ) ) ) = deduped_8_1[deduped_1_2] then
                              return AsList( MapOfMorphism( logic_new_func_x_2 ) ) = deduped_9_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePosition( deduped_12_1, logic_new_func_x_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_71_1, deduped_61_1 ), function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( logic_new_func_x_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_6_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_7_1[deduped_1_2] and AsList( MapOfObject( Range( logic_new_func_x_2 ) ) ) = deduped_8_1[deduped_1_2] then
                              return AsList( MapOfMorphism( logic_new_func_x_2 ) ) = deduped_9_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePosition( deduped_12_1, logic_new_func_x_2 )];
              fi;
              return;
          end ) );
    hoisted_27_1 := List( deduped_51_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_25_1[deduped_3_2];
            hoisted_1_2 := hoisted_26_1[deduped_3_2];
            return List( deduped_46_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_21_1 := Concatenation( deduped_57_1, deduped_58_1 );
    deduped_15_1 := List( deduped_76_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_14_1 := List( deduped_76_1, function ( a_2 )
            return a_2[1];
        end );
    deduped_3_1 := deduped_77_1[3];
    hoisted_22_1 := Concatenation( List( deduped_65_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_21_1[1 + (deduped_3_1[1 + logic_new_func_x_2] + deduped_68_1)] )];
          end ), List( deduped_66_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_21_1[1 + deduped_14_1[(1 + logic_new_func_x_2)]] )];
          end ), List( deduped_66_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_21_1[1 + deduped_15_1[(1 + logic_new_func_x_2)]] )];
          end ) );
    deduped_23_1 := List( deduped_51_1, function ( j_2 )
            return Product( hoisted_22_1{[ 1 .. j_2 ]} );
        end );
    hoisted_19_1 := Concatenation( List( deduped_65_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_3_1[1 + logic_new_func_x_2] + deduped_68_1;
              hoisted_2_2 := deduped_52_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_52_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_46_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_66_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_14_1[1 + logic_new_func_x_2];
              hoisted_2_2 := deduped_52_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_52_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_46_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_66_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_15_1[1 + logic_new_func_x_2];
              hoisted_2_2 := deduped_52_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_52_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_46_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_11_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_63_1, deduped_63_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_78_1, deduped_69_1, deduped_74_1, AsList, deduped_80_1 ) ), deduped_59_1, deduped_60_1, deduped_61_1, CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_64_1, deduped_64_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_78_1, deduped_69_1, deduped_74_1, AsList, deduped_84_1 ) ), CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_64_1, deduped_64_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_78_1, deduped_69_1, deduped_74_1, AsList, deduped_85_1 ) ), CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_64_1, deduped_64_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_78_1, deduped_69_1, deduped_74_1, AsList, deduped_86_1 ) ) ];
    deduped_10_1 := [ deduped_63_1, deduped_64_1, deduped_63_1, deduped_63_1, deduped_64_1, deduped_64_1, deduped_64_1 ];
    deduped_5_1 := Concatenation( List( deduped_57_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ), List( deduped_58_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    hoisted_16_1 := Concatenation( List( deduped_65_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_6_1[(1 + deduped_5_1[(1 + (deduped_3_1[1 + logic_new_func_x_2] + deduped_68_1))][1])];
              deduped_2_2 := deduped_7_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_6_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_7_1[deduped_1_2] and deduped_8_1[deduped_3_2] = deduped_8_1[deduped_1_2] then
                              return deduped_9_1[deduped_3_2] = deduped_9_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_10_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePosition( deduped_12_1, deduped_11_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_66_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_6_1[(1 + deduped_5_1[(1 + deduped_14_1[(1 + logic_new_func_x_2)])][1])];
              deduped_2_2 := deduped_7_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_6_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_7_1[deduped_1_2] and deduped_8_1[deduped_3_2] = deduped_8_1[deduped_1_2] then
                              return deduped_9_1[deduped_3_2] = deduped_9_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_10_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePosition( deduped_12_1, deduped_11_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_66_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_6_1[(1 + deduped_5_1[(1 + deduped_15_1[(1 + logic_new_func_x_2)])][1])];
              deduped_2_2 := deduped_7_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_6_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_7_1[deduped_1_2] and deduped_8_1[deduped_3_2] = deduped_8_1[deduped_1_2] then
                              return deduped_9_1[deduped_3_2] = deduped_9_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_10_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePosition( deduped_12_1, deduped_11_1[deduped_3_2] )];
              fi;
              return;
          end ) );
    hoisted_20_1 := List( deduped_51_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_16_1[deduped_3_2];
            hoisted_1_2 := hoisted_19_1[deduped_3_2];
            return List( deduped_46_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_45_1 := Filtered( deduped_46_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return Sum( deduped_51_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_20_1[deduped_1_3][deduped_1_2] * deduped_23_1[deduped_1_3];
                  end ) = Sum( deduped_51_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_27_1[deduped_1_3][deduped_1_2] * deduped_23_1[deduped_1_3];
                  end );
        end );
    deduped_44_1 := Length( deduped_45_1 );
    hoisted_42_1 := List( [ 0 .. deduped_50_1 * deduped_54_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_73_1 ^ QUO_INT( i_2, deduped_50_1 ) ), deduped_73_1 );
        end );
    hoisted_41_1 := List( deduped_48_1, function ( logic_new_func_x_2 )
            return REM_INT( logic_new_func_x_2, deduped_54_1 );
        end );
    deduped_39_1 := Product( deduped_52_1{[ 1 + deduped_53_1 .. Sum( deduped_56_1{[ 1, 2 ]} ) ]} );
    hoisted_35_1 := List( [ 0 .. deduped_49_1 * deduped_53_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_72_1 ^ QUO_INT( i_2, deduped_49_1 ) ), deduped_72_1 );
        end );
    hoisted_34_1 := List( deduped_47_1, function ( logic_new_func_x_2 )
            return REM_INT( logic_new_func_x_2, deduped_53_1 );
        end );
    deduped_32_1 := Product( deduped_52_1{[ 1 .. deduped_53_1 ]} );
    return List( [ 0 .. deduped_44_1 - 1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
            deduped_4_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 );
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_45_1[1 + REM_INT( QUO_INT( deduped_4_2, deduped_44_1 ^ QUO_INT( deduped_4_2, deduped_44_1 ) ), deduped_44_1 )] );
            hoisted_2_2 := REM_INT( QUO_INT( deduped_3_2, deduped_32_1 ), deduped_39_1 );
            hoisted_1_2 := REM_INT( deduped_3_2, deduped_32_1 );
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfReflexiveQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( deduped_47_1, function ( logic_new_func_x_3 )
                        return hoisted_35_1[1 + (hoisted_1_2 + hoisted_34_1[(1 + logic_new_func_x_3)] * deduped_32_1)];
                    end ), List( deduped_48_1, function ( logic_new_func_x_3 )
                        return hoisted_42_1[1 + (hoisted_2_2 + hoisted_41_1[(1 + logic_new_func_x_3)] * deduped_39_1)];
                    end ) ) );
        end );
end
########
        
    , 501 : IsPrecompiledDerivation := true );
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
end );

BindGlobal( "FinReflexiveQuiversPrecompiled", function (  )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function (  )
    return CategoryOfReflexiveQuiversEnrichedOver( CategoryOfSkeletalFinSets(  : FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_FinReflexiveQuiversPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
