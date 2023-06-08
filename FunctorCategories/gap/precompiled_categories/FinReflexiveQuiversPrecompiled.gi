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
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := [  ];
    deduped_1_1 := BigInt( 0 );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets, NTuple( 4, deduped_1_1, deduped_1_1, deduped_2_1, deduped_2_1 ) );
end
########
        
    , 100 );
    
    ##
    AddCoproduct( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := [ 1 .. Length( arg2_1 ) ];
    deduped_4_1 := List( arg2_1, function ( x_2 )
            return DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( x_2 )[2];
        end );
    deduped_3_1 := List( arg2_1, function ( x_2 )
            return DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( x_2 )[1];
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets, NTuple( 4, Sum( deduped_3_1 ), Sum( deduped_4_1 ), Concatenation( List( deduped_5_1, function ( i_2 )
                  local hoisted_1_2, hoisted_2_2, deduped_3_2;
                  deduped_3_2 := Sum( deduped_4_1{[ 1 .. i_2 - 1 ]} );
                  hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_4_1[i_2] - 1 ];
                  hoisted_1_2 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( CAP_JIT_INCOMPLETE_LOGIC( arg2_1[i_2] ) )[3];
                  return List( [ 0 .. deduped_3_1[i_2] - 1 ], function ( i_3 )
                          return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                      end );
              end ) ), ListN( Concatenation( List( deduped_5_1, function ( i_2 )
                    local hoisted_1_2, hoisted_2_2, deduped_3_2;
                    deduped_3_2 := Sum( deduped_3_1{[ 1 .. i_2 - 1 ]} );
                    hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_3_1[i_2] - 1 ];
                    hoisted_1_2 := List( DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( CAP_JIT_INCOMPLETE_LOGIC( arg2_1[i_2] ) )[4], function ( a_3 )
                            return a_3[1];
                        end );
                    return List( [ 0 .. deduped_4_1[i_2] - 1 ], function ( i_3 )
                            return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                        end );
                end ) ), Concatenation( List( deduped_5_1, function ( i_2 )
                    local hoisted_1_2, hoisted_2_2, deduped_3_2;
                    deduped_3_2 := Sum( deduped_3_1{[ 1 .. i_2 - 1 ]} );
                    hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_3_1[i_2] - 1 ];
                    hoisted_1_2 := List( DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( CAP_JIT_INCOMPLETE_LOGIC( arg2_1[i_2] ) )[4], function ( a_3 )
                            return a_3[2];
                        end );
                    return List( [ 0 .. deduped_4_1[i_2] - 1 ], function ( i_3 )
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
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, BigInt( 1 ) );
end
########
        
    , 100 );
    
    ##
    AddHomomorphismStructureOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, hoisted_17_1, hoisted_20_1, hoisted_21_1, deduped_22_1, hoisted_23_1, deduped_24_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1;
    deduped_61_1 := [ 6 ];
    deduped_60_1 := [ 5 ];
    deduped_59_1 := [ 4 ];
    deduped_58_1 := [ 3 ];
    deduped_57_1 := [ 2 ];
    deduped_56_1 := [ 1 ];
    deduped_55_1 := [ 0 ];
    deduped_54_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_53_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_52_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_51_1 := deduped_53_1[4];
    deduped_50_1 := deduped_54_1[4];
    deduped_49_1 := CreateCapCategoryObjectWithAttributes( deduped_52_1, Length, 7 );
    deduped_48_1 := deduped_53_1[2];
    deduped_47_1 := CreateCapCategoryObjectWithAttributes( deduped_52_1, Length, 2 );
    deduped_46_1 := CreateCapCategoryObjectWithAttributes( deduped_52_1, Length, BigInt( 1 ) );
    deduped_45_1 := deduped_53_1[1];
    deduped_44_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_43_1 := [ 0 .. deduped_48_1 - 1 ];
    deduped_42_1 := [ 0 .. deduped_45_1 - 1 ];
    deduped_41_1 := CreateCapCategoryObjectWithAttributes( deduped_44_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_52_1, deduped_46_1, deduped_47_1, AsList, deduped_56_1 ) );
    deduped_40_1 := CreateCapCategoryObjectWithAttributes( deduped_44_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_52_1, deduped_46_1, deduped_47_1, AsList, deduped_55_1 ) );
    deduped_39_1 := CreateCapCategoryMorphismWithAttributes( deduped_44_1, deduped_40_1, deduped_41_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_52_1, deduped_46_1, deduped_49_1, AsList, deduped_58_1 ) );
    deduped_38_1 := CreateCapCategoryMorphismWithAttributes( deduped_44_1, deduped_40_1, deduped_41_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_52_1, deduped_46_1, deduped_49_1, AsList, deduped_57_1 ) );
    deduped_37_1 := CreateCapCategoryMorphismWithAttributes( deduped_44_1, deduped_41_1, deduped_40_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_52_1, deduped_46_1, deduped_49_1, AsList, deduped_56_1 ) );
    deduped_36_1 := ListWithIdenticalEntries( deduped_48_1, deduped_41_1 );
    deduped_35_1 := ListWithIdenticalEntries( deduped_45_1, deduped_40_1 );
    deduped_34_1 := [ 0 .. Sum( [ deduped_45_1, deduped_48_1, deduped_48_1 ] ) - 1 ];
    deduped_2_1 := [ deduped_54_1[1], deduped_54_1[2] ];
    deduped_1_1 := [ deduped_40_1, deduped_41_1 ];
    deduped_33_1 := Concatenation( List( deduped_35_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ), List( deduped_36_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ) );
    deduped_31_1 := Product( deduped_33_1 );
    deduped_29_1 := [ 0 .. deduped_31_1 - 1 ];
    deduped_32_1 := List( deduped_43_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + (i_2 + deduped_45_1);
            hoisted_2_2 := deduped_33_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_33_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_29_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_30_1 := ListWithIdenticalEntries( Length( deduped_43_1 ), deduped_31_1 );
    hoisted_27_1 := Concatenation( List( deduped_42_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + i_2;
              hoisted_2_2 := deduped_33_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_33_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_29_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), deduped_32_1, deduped_32_1 );
    deduped_14_1 := [ deduped_54_1[3], List( deduped_50_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_50_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_13_1 := [ deduped_37_1, deduped_38_1, deduped_39_1 ];
    deduped_10_1 := [ deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1 ];
    deduped_9_1 := [ deduped_55_1, deduped_55_1, deduped_56_1, deduped_56_1, deduped_56_1, deduped_56_1, deduped_56_1 ];
    deduped_8_1 := [ deduped_55_1, deduped_56_1, deduped_55_1, deduped_55_1, deduped_56_1, deduped_56_1, deduped_56_1 ];
    deduped_7_1 := [ 0, 4 ];
    hoisted_26_1 := Concatenation( List( ListWithIdenticalEntries( deduped_45_1, deduped_37_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and AsList( MapOfObject( Range( morB_2 ) ) ) = deduped_9_1[deduped_1_2] then
                              return AsList( MapOfMorphism( morB_2 ) ) = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, morB_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_48_1, deduped_38_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and AsList( MapOfObject( Range( morB_2 ) ) ) = deduped_9_1[deduped_1_2] then
                              return AsList( MapOfMorphism( morB_2 ) ) = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, morB_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_48_1, deduped_39_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and AsList( MapOfObject( Range( morB_2 ) ) ) = deduped_9_1[deduped_1_2] then
                              return AsList( MapOfMorphism( morB_2 ) ) = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, morB_2 )];
              fi;
              return;
          end ) );
    deduped_3_1 := Concatenation( ListWithIdenticalEntries( Length( deduped_42_1 ), deduped_31_1 ), deduped_30_1, deduped_30_1 );
    hoisted_28_1 := List( deduped_34_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_26_1[deduped_3_2];
            hoisted_1_2 := hoisted_27_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_22_1 := Concatenation( deduped_35_1, deduped_36_1 );
    deduped_16_1 := List( deduped_51_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_15_1 := List( deduped_51_1, function ( a_2 )
            return a_2[1];
        end );
    deduped_4_1 := deduped_53_1[3];
    hoisted_23_1 := Concatenation( List( deduped_42_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_22_1[1 + (deduped_4_1[1 + i_2] + deduped_45_1)] )];
          end ), List( deduped_43_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_22_1[1 + deduped_15_1[(1 + i_2)]] )];
          end ), List( deduped_43_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_22_1[1 + deduped_16_1[(1 + i_2)]] )];
          end ) );
    deduped_24_1 := List( deduped_34_1, function ( j_2 )
            return Product( hoisted_23_1{[ 1 .. j_2 ]} );
        end );
    hoisted_20_1 := Concatenation( List( deduped_42_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + (deduped_4_1[1 + i_2] + deduped_45_1);
              hoisted_2_2 := deduped_33_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_33_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_29_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_43_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_15_1[(1 + i_2)];
              hoisted_2_2 := deduped_33_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_33_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_29_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_43_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_16_1[(1 + i_2)];
              hoisted_2_2 := deduped_33_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_33_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_29_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_12_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_44_1, deduped_40_1, deduped_40_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_52_1, deduped_46_1, deduped_49_1, AsList, deduped_55_1 ) ), deduped_37_1, deduped_38_1, deduped_39_1, CreateCapCategoryMorphismWithAttributes( deduped_44_1, deduped_41_1, deduped_41_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_52_1, deduped_46_1, deduped_49_1, AsList, deduped_59_1 ) ), CreateCapCategoryMorphismWithAttributes( deduped_44_1, deduped_41_1, deduped_41_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_52_1, deduped_46_1, deduped_49_1, AsList, deduped_60_1 ) ), CreateCapCategoryMorphismWithAttributes( deduped_44_1, deduped_41_1, deduped_41_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_52_1, deduped_46_1, deduped_49_1, AsList, deduped_61_1 ) ) ];
    deduped_11_1 := [ deduped_40_1, deduped_41_1, deduped_40_1, deduped_40_1, deduped_41_1, deduped_41_1, deduped_41_1 ];
    deduped_6_1 := Concatenation( List( deduped_35_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ), List( deduped_36_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    hoisted_17_1 := Concatenation( List( deduped_42_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_7_1[(1 + deduped_6_1[(1 + (deduped_4_1[1 + i_2] + deduped_45_1))][1])];
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
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, deduped_12_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_43_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_7_1[(1 + deduped_6_1[(1 + deduped_15_1[(1 + i_2)])][1])];
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
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, deduped_12_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_43_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_7_1[(1 + deduped_6_1[(1 + deduped_16_1[(1 + i_2)])][1])];
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
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, deduped_12_1[deduped_3_2] )];
              fi;
              return;
          end ) );
    hoisted_21_1 := List( deduped_34_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_17_1[deduped_3_2];
            hoisted_1_2 := hoisted_20_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( deduped_52_1, Length, Length( Filtered( deduped_29_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return Sum( deduped_34_1, function ( j_3 )
                          local deduped_1_3;
                          deduped_1_3 := 1 + j_3;
                          return hoisted_21_1[deduped_1_3][deduped_1_2] * deduped_24_1[deduped_1_3];
                      end ) = Sum( deduped_34_1, function ( j_3 )
                          local deduped_1_3;
                          deduped_1_3 := 1 + j_3;
                          return hoisted_28_1[deduped_1_3][deduped_1_2] * deduped_24_1[deduped_1_3];
                      end );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, hoisted_17_1, hoisted_20_1, hoisted_21_1, deduped_22_1, hoisted_23_1, deduped_24_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_30_1, hoisted_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1, deduped_68_1, deduped_69_1, deduped_70_1, deduped_71_1;
    deduped_71_1 := [ 6 ];
    deduped_70_1 := [ 5 ];
    deduped_69_1 := [ 4 ];
    deduped_68_1 := [ 3 ];
    deduped_67_1 := [ 2 ];
    deduped_66_1 := [ 1 ];
    deduped_65_1 := [ 0 ];
    deduped_64_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( range_1 );
    deduped_63_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( source_1 );
    deduped_62_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_61_1 := deduped_63_1[4];
    deduped_60_1 := deduped_64_1[4];
    deduped_59_1 := CreateCapCategoryObjectWithAttributes( deduped_62_1, Length, 7 );
    deduped_58_1 := deduped_64_1[2];
    deduped_57_1 := deduped_64_1[1];
    deduped_56_1 := CreateCapCategoryObjectWithAttributes( deduped_62_1, Length, 2 );
    deduped_55_1 := CreateCapCategoryObjectWithAttributes( deduped_62_1, Length, BigInt( 1 ) );
    deduped_54_1 := deduped_63_1[2];
    deduped_53_1 := deduped_63_1[1];
    deduped_52_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_51_1 := [ 0 .. deduped_54_1 - 1 ];
    deduped_50_1 := [ 0 .. deduped_53_1 - 1 ];
    deduped_49_1 := CreateCapCategoryObjectWithAttributes( deduped_52_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_62_1, deduped_55_1, deduped_56_1, AsList, deduped_66_1 ) );
    deduped_48_1 := CreateCapCategoryObjectWithAttributes( deduped_52_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_62_1, deduped_55_1, deduped_56_1, AsList, deduped_65_1 ) );
    deduped_47_1 := CreateCapCategoryMorphismWithAttributes( deduped_52_1, deduped_48_1, deduped_49_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_62_1, deduped_55_1, deduped_59_1, AsList, deduped_68_1 ) );
    deduped_46_1 := CreateCapCategoryMorphismWithAttributes( deduped_52_1, deduped_48_1, deduped_49_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_62_1, deduped_55_1, deduped_59_1, AsList, deduped_67_1 ) );
    deduped_45_1 := CreateCapCategoryMorphismWithAttributes( deduped_52_1, deduped_49_1, deduped_48_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_62_1, deduped_55_1, deduped_59_1, AsList, deduped_66_1 ) );
    deduped_44_1 := ListWithIdenticalEntries( deduped_54_1, deduped_49_1 );
    deduped_43_1 := ListWithIdenticalEntries( deduped_53_1, deduped_48_1 );
    deduped_42_1 := [ 0 .. Sum( [ deduped_53_1, deduped_54_1, deduped_54_1 ] ) - 1 ];
    deduped_41_1 := List( ListOfValues( [ CreateCapCategoryObjectWithAttributes( deduped_62_1, Length, deduped_53_1 ), CreateCapCategoryObjectWithAttributes( deduped_62_1, Length, deduped_54_1 ) ] ), Length );
    deduped_2_1 := [ deduped_57_1, deduped_58_1 ];
    deduped_1_1 := [ deduped_48_1, deduped_49_1 ];
    deduped_40_1 := Concatenation( List( deduped_43_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ), List( deduped_44_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ) );
    deduped_39_1 := deduped_41_1[1];
    deduped_37_1 := Product( deduped_40_1 );
    deduped_35_1 := [ 0 .. deduped_37_1 - 1 ];
    deduped_38_1 := List( deduped_51_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + (i_2 + deduped_53_1);
            hoisted_2_2 := deduped_40_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_40_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_35_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_36_1 := ListWithIdenticalEntries( Length( deduped_51_1 ), deduped_37_1 );
    deduped_34_1 := Product( deduped_40_1{[ 1 .. deduped_39_1 ]} );
    hoisted_27_1 := Concatenation( List( deduped_50_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + i_2;
              hoisted_2_2 := deduped_40_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_40_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_35_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), deduped_38_1, deduped_38_1 );
    deduped_14_1 := [ deduped_64_1[3], List( deduped_60_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_60_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_13_1 := [ deduped_45_1, deduped_46_1, deduped_47_1 ];
    deduped_10_1 := [ deduped_65_1, deduped_66_1, deduped_67_1, deduped_68_1, deduped_69_1, deduped_70_1, deduped_71_1 ];
    deduped_9_1 := [ deduped_65_1, deduped_65_1, deduped_66_1, deduped_66_1, deduped_66_1, deduped_66_1, deduped_66_1 ];
    deduped_8_1 := [ deduped_65_1, deduped_66_1, deduped_65_1, deduped_65_1, deduped_66_1, deduped_66_1, deduped_66_1 ];
    deduped_7_1 := [ 0, 4 ];
    hoisted_26_1 := Concatenation( List( ListWithIdenticalEntries( deduped_53_1, deduped_45_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and AsList( MapOfObject( Range( morB_2 ) ) ) = deduped_9_1[deduped_1_2] then
                              return AsList( MapOfMorphism( morB_2 ) ) = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, morB_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_54_1, deduped_46_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and AsList( MapOfObject( Range( morB_2 ) ) ) = deduped_9_1[deduped_1_2] then
                              return AsList( MapOfMorphism( morB_2 ) ) = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, morB_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_54_1, deduped_47_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and AsList( MapOfObject( Range( morB_2 ) ) ) = deduped_9_1[deduped_1_2] then
                              return AsList( MapOfMorphism( morB_2 ) ) = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, morB_2 )];
              fi;
              return;
          end ) );
    deduped_3_1 := Concatenation( ListWithIdenticalEntries( Length( deduped_50_1 ), deduped_37_1 ), deduped_36_1, deduped_36_1 );
    hoisted_28_1 := List( deduped_42_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_26_1[deduped_3_2];
            hoisted_1_2 := hoisted_27_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_22_1 := Concatenation( deduped_43_1, deduped_44_1 );
    deduped_16_1 := List( deduped_61_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_15_1 := List( deduped_61_1, function ( a_2 )
            return a_2[1];
        end );
    deduped_4_1 := deduped_63_1[3];
    hoisted_23_1 := Concatenation( List( deduped_50_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_22_1[1 + (deduped_4_1[1 + i_2] + deduped_53_1)] )];
          end ), List( deduped_51_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_22_1[1 + deduped_15_1[(1 + i_2)]] )];
          end ), List( deduped_51_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_22_1[1 + deduped_16_1[(1 + i_2)]] )];
          end ) );
    deduped_24_1 := List( deduped_42_1, function ( j_2 )
            return Product( hoisted_23_1{[ 1 .. j_2 ]} );
        end );
    hoisted_20_1 := Concatenation( List( deduped_50_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + (deduped_4_1[1 + i_2] + deduped_53_1);
              hoisted_2_2 := deduped_40_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_40_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_35_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_51_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_15_1[(1 + i_2)];
              hoisted_2_2 := deduped_40_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_40_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_35_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_51_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_16_1[(1 + i_2)];
              hoisted_2_2 := deduped_40_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_40_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_35_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_12_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_52_1, deduped_48_1, deduped_48_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_62_1, deduped_55_1, deduped_59_1, AsList, deduped_65_1 ) ), deduped_45_1, deduped_46_1, deduped_47_1, CreateCapCategoryMorphismWithAttributes( deduped_52_1, deduped_49_1, deduped_49_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_62_1, deduped_55_1, deduped_59_1, AsList, deduped_69_1 ) ), CreateCapCategoryMorphismWithAttributes( deduped_52_1, deduped_49_1, deduped_49_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_62_1, deduped_55_1, deduped_59_1, AsList, deduped_70_1 ) ), CreateCapCategoryMorphismWithAttributes( deduped_52_1, deduped_49_1, deduped_49_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_62_1, deduped_55_1, deduped_59_1, AsList, deduped_71_1 ) ) ];
    deduped_11_1 := [ deduped_48_1, deduped_49_1, deduped_48_1, deduped_48_1, deduped_49_1, deduped_49_1, deduped_49_1 ];
    deduped_6_1 := Concatenation( List( deduped_43_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ), List( deduped_44_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    hoisted_17_1 := Concatenation( List( deduped_50_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_7_1[(1 + deduped_6_1[(1 + (deduped_4_1[1 + i_2] + deduped_53_1))][1])];
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
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, deduped_12_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_51_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_7_1[(1 + deduped_6_1[(1 + deduped_15_1[(1 + i_2)])][1])];
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
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, deduped_12_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_51_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_7_1[(1 + deduped_6_1[(1 + deduped_16_1[(1 + i_2)])][1])];
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
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, deduped_12_1[deduped_3_2] )];
              fi;
              return;
          end ) );
    hoisted_21_1 := List( deduped_42_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_17_1[deduped_3_2];
            hoisted_1_2 := hoisted_20_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_33_1 := CAP_JIT_INCOMPLETE_LOGIC( Filtered( deduped_35_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return Sum( deduped_42_1, function ( j_3 )
                          local deduped_1_3;
                          deduped_1_3 := 1 + j_3;
                          return hoisted_21_1[deduped_1_3][deduped_1_2] * deduped_24_1[deduped_1_3];
                      end ) = Sum( deduped_42_1, function ( j_3 )
                          local deduped_1_3;
                          deduped_1_3 := 1 + j_3;
                          return hoisted_28_1[deduped_1_3][deduped_1_2] * deduped_24_1[deduped_1_3];
                      end );
            end )[1 + AsList( alpha_1 )[(1 + CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. (Length( Source( alpha_1 ) ) - 1) ][1] ))]] );
    hoisted_32_1 := REM_INT( QUO_INT( deduped_33_1, deduped_34_1 ), Product( deduped_40_1{[ 1 + deduped_39_1 .. Sum( deduped_41_1{[ 1, 2 ]} ) ]} ) );
    hoisted_30_1 := REM_INT( deduped_33_1, deduped_34_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, DefiningPairOfReflexiveQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( [ 0 .. deduped_39_1 - 1 ], function ( i_2 )
                return REM_INT( QUO_INT( hoisted_30_1, deduped_57_1 ^ i_2 ), deduped_57_1 );
            end ), List( [ 0 .. deduped_41_1[2] - 1 ], function ( i_2 )
                return REM_INT( QUO_INT( hoisted_32_1, deduped_58_1 ^ i_2 ), deduped_58_1 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, hoisted_17_1, hoisted_20_1, hoisted_21_1, deduped_22_1, hoisted_23_1, deduped_24_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, deduped_31_1, hoisted_33_1, hoisted_34_1, hoisted_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1, deduped_68_1, deduped_69_1, deduped_70_1, deduped_71_1, deduped_72_1, deduped_73_1, deduped_74_1, deduped_75_1;
    deduped_75_1 := [ 6 ];
    deduped_74_1 := [ 5 ];
    deduped_73_1 := [ 4 ];
    deduped_72_1 := [ 3 ];
    deduped_71_1 := [ 2 ];
    deduped_70_1 := [ 1 ];
    deduped_69_1 := [ 0 ];
    deduped_68_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_67_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_66_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_65_1 := deduped_66_1[4];
    deduped_64_1 := deduped_68_1[4];
    deduped_63_1 := CreateCapCategoryObjectWithAttributes( deduped_67_1, Length, 7 );
    deduped_62_1 := deduped_68_1[2];
    deduped_61_1 := deduped_68_1[1];
    deduped_60_1 := deduped_66_1[2];
    deduped_59_1 := CreateCapCategoryObjectWithAttributes( deduped_67_1, Length, 2 );
    deduped_58_1 := CreateCapCategoryObjectWithAttributes( deduped_67_1, Length, BigInt( 1 ) );
    deduped_57_1 := deduped_66_1[1];
    deduped_56_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_55_1 := [ 0 .. deduped_60_1 - 1 ];
    deduped_54_1 := [ 0 .. deduped_57_1 - 1 ];
    deduped_53_1 := CreateCapCategoryObjectWithAttributes( deduped_56_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_58_1, deduped_59_1, AsList, deduped_70_1 ) );
    deduped_52_1 := CreateCapCategoryObjectWithAttributes( deduped_56_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_58_1, deduped_59_1, AsList, deduped_69_1 ) );
    deduped_51_1 := CreateCapCategoryMorphismWithAttributes( deduped_56_1, deduped_52_1, deduped_53_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_58_1, deduped_63_1, AsList, deduped_72_1 ) );
    deduped_50_1 := CreateCapCategoryMorphismWithAttributes( deduped_56_1, deduped_52_1, deduped_53_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_58_1, deduped_63_1, AsList, deduped_71_1 ) );
    deduped_49_1 := CreateCapCategoryMorphismWithAttributes( deduped_56_1, deduped_53_1, deduped_52_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_58_1, deduped_63_1, AsList, deduped_70_1 ) );
    deduped_48_1 := ListWithIdenticalEntries( deduped_60_1, deduped_53_1 );
    deduped_47_1 := ListWithIdenticalEntries( deduped_57_1, deduped_52_1 );
    deduped_46_1 := [ 0 .. Sum( [ deduped_57_1, deduped_60_1, deduped_60_1 ] ) - 1 ];
    deduped_45_1 := List( ListOfValues( [ CreateCapCategoryObjectWithAttributes( deduped_67_1, Length, deduped_57_1 ), CreateCapCategoryObjectWithAttributes( deduped_67_1, Length, deduped_60_1 ) ] ), Length );
    deduped_44_1 := deduped_45_1[1];
    deduped_2_1 := [ deduped_61_1, deduped_62_1 ];
    deduped_1_1 := [ deduped_52_1, deduped_53_1 ];
    deduped_43_1 := Concatenation( List( deduped_47_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ), List( deduped_48_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ) );
    deduped_41_1 := Product( deduped_43_1 );
    deduped_39_1 := [ 0 .. deduped_41_1 - 1 ];
    deduped_42_1 := List( deduped_55_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + (i_2 + deduped_57_1);
            hoisted_2_2 := deduped_43_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_43_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_39_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_40_1 := ListWithIdenticalEntries( Length( deduped_55_1 ), deduped_41_1 );
    hoisted_27_1 := Concatenation( List( deduped_54_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + i_2;
              hoisted_2_2 := deduped_43_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_43_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_39_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), deduped_42_1, deduped_42_1 );
    deduped_14_1 := [ deduped_68_1[3], List( deduped_64_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_64_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_13_1 := [ deduped_49_1, deduped_50_1, deduped_51_1 ];
    deduped_10_1 := [ deduped_69_1, deduped_70_1, deduped_71_1, deduped_72_1, deduped_73_1, deduped_74_1, deduped_75_1 ];
    deduped_9_1 := [ deduped_69_1, deduped_69_1, deduped_70_1, deduped_70_1, deduped_70_1, deduped_70_1, deduped_70_1 ];
    deduped_8_1 := [ deduped_69_1, deduped_70_1, deduped_69_1, deduped_69_1, deduped_70_1, deduped_70_1, deduped_70_1 ];
    deduped_7_1 := [ 0, 4 ];
    hoisted_26_1 := Concatenation( List( ListWithIdenticalEntries( deduped_57_1, deduped_49_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and AsList( MapOfObject( Range( morB_2 ) ) ) = deduped_9_1[deduped_1_2] then
                              return AsList( MapOfMorphism( morB_2 ) ) = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, morB_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_60_1, deduped_50_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and AsList( MapOfObject( Range( morB_2 ) ) ) = deduped_9_1[deduped_1_2] then
                              return AsList( MapOfMorphism( morB_2 ) ) = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, morB_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_60_1, deduped_51_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_7_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_8_1[deduped_1_2] and AsList( MapOfObject( Range( morB_2 ) ) ) = deduped_9_1[deduped_1_2] then
                              return AsList( MapOfMorphism( morB_2 ) ) = deduped_10_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, morB_2 )];
              fi;
              return;
          end ) );
    deduped_3_1 := Concatenation( ListWithIdenticalEntries( Length( deduped_54_1 ), deduped_41_1 ), deduped_40_1, deduped_40_1 );
    hoisted_28_1 := List( deduped_46_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_26_1[deduped_3_2];
            hoisted_1_2 := hoisted_27_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_22_1 := Concatenation( deduped_47_1, deduped_48_1 );
    deduped_16_1 := List( deduped_65_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_15_1 := List( deduped_65_1, function ( a_2 )
            return a_2[1];
        end );
    deduped_4_1 := deduped_66_1[3];
    hoisted_23_1 := Concatenation( List( deduped_54_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_22_1[1 + (deduped_4_1[1 + i_2] + deduped_57_1)] )];
          end ), List( deduped_55_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_22_1[1 + deduped_15_1[(1 + i_2)]] )];
          end ), List( deduped_55_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_22_1[1 + deduped_16_1[(1 + i_2)]] )];
          end ) );
    deduped_24_1 := List( deduped_46_1, function ( j_2 )
            return Product( hoisted_23_1{[ 1 .. j_2 ]} );
        end );
    hoisted_20_1 := Concatenation( List( deduped_54_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + (deduped_4_1[1 + i_2] + deduped_57_1);
              hoisted_2_2 := deduped_43_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_43_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_39_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_55_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_15_1[(1 + i_2)];
              hoisted_2_2 := deduped_43_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_43_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_39_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_55_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_16_1[(1 + i_2)];
              hoisted_2_2 := deduped_43_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_43_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_39_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_12_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_56_1, deduped_52_1, deduped_52_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_58_1, deduped_63_1, AsList, deduped_69_1 ) ), deduped_49_1, deduped_50_1, deduped_51_1, CreateCapCategoryMorphismWithAttributes( deduped_56_1, deduped_53_1, deduped_53_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_58_1, deduped_63_1, AsList, deduped_73_1 ) ), CreateCapCategoryMorphismWithAttributes( deduped_56_1, deduped_53_1, deduped_53_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_58_1, deduped_63_1, AsList, deduped_74_1 ) ), CreateCapCategoryMorphismWithAttributes( deduped_56_1, deduped_53_1, deduped_53_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_67_1, deduped_58_1, deduped_63_1, AsList, deduped_75_1 ) ) ];
    deduped_11_1 := [ deduped_52_1, deduped_53_1, deduped_52_1, deduped_52_1, deduped_53_1, deduped_53_1, deduped_53_1 ];
    deduped_6_1 := Concatenation( List( deduped_47_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ), List( deduped_48_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    hoisted_17_1 := Concatenation( List( deduped_54_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_7_1[(1 + deduped_6_1[(1 + (deduped_4_1[1 + i_2] + deduped_57_1))][1])];
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
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, deduped_12_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_55_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_7_1[(1 + deduped_6_1[(1 + deduped_15_1[(1 + i_2)])][1])];
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
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, deduped_12_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_55_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_7_1[(1 + deduped_6_1[(1 + deduped_16_1[(1 + i_2)])][1])];
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
                  return deduped_14_1[SafeUniquePosition( deduped_13_1, deduped_12_1[deduped_3_2] )];
              fi;
              return;
          end ) );
    hoisted_21_1 := List( deduped_46_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_17_1[deduped_3_2];
            hoisted_1_2 := hoisted_20_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_38_1 := Filtered( deduped_39_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return Sum( deduped_46_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_21_1[deduped_1_3][deduped_1_2] * deduped_24_1[deduped_1_3];
                  end ) = Sum( deduped_46_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_28_1[deduped_1_3][deduped_1_2] * deduped_24_1[deduped_1_3];
                  end );
        end );
    deduped_37_1 := Length( deduped_38_1 );
    hoisted_36_1 := [ 0 .. deduped_45_1[2] - 1 ];
    hoisted_34_1 := Product( deduped_43_1{[ 1 + deduped_44_1 .. Sum( deduped_45_1{[ 1, 2 ]} ) ]} );
    hoisted_33_1 := [ 0 .. deduped_44_1 - 1 ];
    deduped_31_1 := Product( deduped_43_1{[ 1 .. deduped_44_1 ]} );
    return List( [ 0 .. deduped_37_1 - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_38_1[1 + REM_INT( i_2, deduped_37_1 )] );
            hoisted_2_2 := REM_INT( QUO_INT( deduped_3_2, deduped_31_1 ), hoisted_34_1 );
            hoisted_1_2 := REM_INT( deduped_3_2, deduped_31_1 );
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfReflexiveQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( hoisted_33_1, function ( i_3 )
                        return REM_INT( QUO_INT( hoisted_1_2, deduped_61_1 ^ i_3 ), deduped_61_1 );
                    end ), List( hoisted_36_1, function ( i_3 )
                        return REM_INT( QUO_INT( hoisted_2_2, deduped_62_1 ^ i_3 ), deduped_62_1 );
                    end ) ) );
        end );
end
########
        
    , 802 : IsPrecompiledDerivation := true );
    
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
