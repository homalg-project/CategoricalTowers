# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_FinQuiversPrecompiled", function ( cat )
    
    ##
    AddInitialObject( cat,
        
########
function ( cat_1 )
    local deduped_1_1;
    deduped_1_1 := BigInt( 0 );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfQuiverEnrichedOverSkeletalFinSets, NTuple( 3, deduped_1_1, deduped_1_1, [  ] ) );
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
            return DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( logic_new_func_x_2 )[2];
        end );
    deduped_3_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( logic_new_func_x_2 )[1];
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfQuiverEnrichedOverSkeletalFinSets, NTuple( 3, Sum( deduped_3_1 ), Sum( deduped_4_1 ), ListN( Concatenation( List( deduped_5_1, function ( logic_new_func_x_2 )
                    local hoisted_1_2, hoisted_2_2, deduped_3_2;
                    deduped_3_2 := Sum( deduped_3_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
                    hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_3_1[logic_new_func_x_2] - 1 ];
                    hoisted_1_2 := List( DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( CAP_JIT_INCOMPLETE_LOGIC( arg2_1[logic_new_func_x_2] ) )[3], function ( a_3 )
                            return a_3[1];
                        end );
                    return List( [ 0 .. deduped_4_1[logic_new_func_x_2] - 1 ], function ( i_3 )
                            return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                        end );
                end ) ), Concatenation( List( deduped_5_1, function ( logic_new_func_x_2 )
                    local hoisted_1_2, hoisted_2_2, deduped_3_2;
                    deduped_3_2 := Sum( deduped_3_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
                    hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_3_1[logic_new_func_x_2] - 1 ];
                    hoisted_1_2 := List( DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( CAP_JIT_INCOMPLETE_LOGIC( arg2_1[logic_new_func_x_2] ) )[3], function ( a_3 )
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
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, BigInt( 1 ) );
end
########
        
    , 100 );
    
    ##
    AddHomomorphismStructureOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, hoisted_14_1, hoisted_17_1, hoisted_18_1, deduped_19_1, hoisted_20_1, deduped_21_1, hoisted_23_1, hoisted_25_1, hoisted_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1;
    deduped_53_1 := [ 3 ];
    deduped_52_1 := [ 2 ];
    deduped_51_1 := [ 1 ];
    deduped_50_1 := [ 0 ];
    deduped_49_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_48_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_47_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_46_1 := deduped_49_1[3];
    deduped_45_1 := CreateCapCategoryObjectWithAttributes( deduped_47_1, Length, 4 );
    deduped_44_1 := deduped_48_1[3];
    deduped_43_1 := deduped_48_1[2];
    deduped_42_1 := CreateCapCategoryObjectWithAttributes( deduped_47_1, Length, 2 );
    deduped_41_1 := CreateCapCategoryObjectWithAttributes( deduped_47_1, Length, BigInt( 1 ) );
    deduped_40_1 := deduped_48_1[1];
    deduped_39_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_38_1 := [ 0 .. deduped_43_1 - 1 ];
    deduped_37_1 := CreateCapCategoryObjectWithAttributes( deduped_39_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_47_1, deduped_41_1, deduped_42_1, AsList, deduped_51_1 ) );
    deduped_36_1 := CreateCapCategoryObjectWithAttributes( deduped_39_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_47_1, deduped_41_1, deduped_42_1, AsList, deduped_50_1 ) );
    deduped_35_1 := Length( deduped_38_1 );
    deduped_34_1 := CreateCapCategoryMorphismWithAttributes( deduped_39_1, deduped_36_1, deduped_37_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_47_1, deduped_41_1, deduped_45_1, AsList, deduped_52_1 ) );
    deduped_33_1 := CreateCapCategoryMorphismWithAttributes( deduped_39_1, deduped_36_1, deduped_37_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_47_1, deduped_41_1, deduped_45_1, AsList, deduped_51_1 ) );
    deduped_32_1 := ListWithIdenticalEntries( deduped_43_1, deduped_37_1 );
    deduped_31_1 := ListWithIdenticalEntries( deduped_40_1, deduped_36_1 );
    deduped_2_1 := [ deduped_49_1[1], deduped_49_1[2] ];
    deduped_1_1 := [ deduped_36_1, deduped_37_1 ];
    deduped_28_1 := Concatenation( List( deduped_31_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ), List( deduped_32_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ) );
    deduped_27_1 := [ 0 .. Product( deduped_28_1 ) - 1 ];
    deduped_30_1 := List( deduped_38_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := logic_new_func_x_2 + deduped_40_1;
            hoisted_2_2 := deduped_28_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_28_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_27_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_29_1 := [ 0 .. deduped_35_1 + deduped_35_1 - 1 ];
    hoisted_25_1 := Concatenation( deduped_30_1, deduped_30_1 );
    deduped_12_1 := [ List( deduped_46_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_46_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_11_1 := [ deduped_33_1, deduped_34_1 ];
    deduped_8_1 := [ deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1 ];
    deduped_7_1 := [ deduped_50_1, deduped_51_1, deduped_51_1, deduped_51_1 ];
    deduped_6_1 := [ deduped_50_1, deduped_50_1, deduped_50_1, deduped_51_1 ];
    deduped_5_1 := [ 0, 3 ];
    hoisted_23_1 := Concatenation( List( ListWithIdenticalEntries( deduped_43_1, deduped_33_1 ), function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( logic_new_func_x_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_5_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_6_1[deduped_1_2] and AsList( MapOfObject( Range( logic_new_func_x_2 ) ) ) = deduped_7_1[deduped_1_2] then
                              return AsList( MapOfMorphism( logic_new_func_x_2 ) ) = deduped_8_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePosition( deduped_11_1, logic_new_func_x_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_43_1, deduped_34_1 ), function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( logic_new_func_x_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_5_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_6_1[deduped_1_2] and AsList( MapOfObject( Range( logic_new_func_x_2 ) ) ) = deduped_7_1[deduped_1_2] then
                              return AsList( MapOfMorphism( logic_new_func_x_2 ) ) = deduped_8_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePosition( deduped_11_1, logic_new_func_x_2 )];
              fi;
              return;
          end ) );
    hoisted_26_1 := List( deduped_29_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_23_1[deduped_3_2];
            hoisted_1_2 := hoisted_25_1[deduped_3_2];
            return List( deduped_27_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_19_1 := Concatenation( deduped_31_1, deduped_32_1 );
    deduped_13_1 := List( deduped_44_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_3_1 := List( deduped_44_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_20_1 := Concatenation( List( deduped_38_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_19_1[1 + deduped_3_1[(1 + logic_new_func_x_2)]] )];
          end ), List( deduped_38_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_19_1[1 + deduped_13_1[(1 + logic_new_func_x_2)]] )];
          end ) );
    deduped_21_1 := List( deduped_29_1, function ( j_2 )
            return Product( hoisted_20_1{[ 1 .. j_2 ]} );
        end );
    hoisted_17_1 := Concatenation( List( deduped_38_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_3_1[1 + logic_new_func_x_2];
              hoisted_2_2 := deduped_28_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_28_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_27_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_38_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_13_1[1 + logic_new_func_x_2];
              hoisted_2_2 := deduped_28_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_28_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_27_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_10_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_39_1, deduped_36_1, deduped_36_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_47_1, deduped_41_1, deduped_45_1, AsList, deduped_50_1 ) ), deduped_33_1, deduped_34_1, CreateCapCategoryMorphismWithAttributes( deduped_39_1, deduped_37_1, deduped_37_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_47_1, deduped_41_1, deduped_45_1, AsList, deduped_53_1 ) ) ];
    deduped_9_1 := [ deduped_36_1, deduped_36_1, deduped_36_1, deduped_37_1 ];
    deduped_4_1 := Concatenation( List( deduped_31_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ), List( deduped_32_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    hoisted_14_1 := Concatenation( List( deduped_38_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_5_1[(1 + deduped_4_1[(1 + deduped_3_1[(1 + logic_new_func_x_2)])][1])];
              deduped_2_2 := deduped_6_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_5_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_6_1[deduped_1_2] and deduped_7_1[deduped_3_2] = deduped_7_1[deduped_1_2] then
                              return deduped_8_1[deduped_3_2] = deduped_8_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_9_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePosition( deduped_11_1, deduped_10_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_38_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_5_1[(1 + deduped_4_1[(1 + deduped_13_1[(1 + logic_new_func_x_2)])][1])];
              deduped_2_2 := deduped_6_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_5_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_6_1[deduped_1_2] and deduped_7_1[deduped_3_2] = deduped_7_1[deduped_1_2] then
                              return deduped_8_1[deduped_3_2] = deduped_8_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_9_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePosition( deduped_11_1, deduped_10_1[deduped_3_2] )];
              fi;
              return;
          end ) );
    hoisted_18_1 := List( deduped_29_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_14_1[deduped_3_2];
            hoisted_1_2 := hoisted_17_1[deduped_3_2];
            return List( deduped_27_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( deduped_47_1, Length, Length( Filtered( deduped_27_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return Sum( deduped_29_1, function ( j_3 )
                          local deduped_1_3;
                          deduped_1_3 := 1 + j_3;
                          return hoisted_18_1[deduped_1_3][deduped_1_2] * deduped_21_1[deduped_1_3];
                      end ) = Sum( deduped_29_1, function ( j_3 )
                          local deduped_1_3;
                          deduped_1_3 := 1 + j_3;
                          return hoisted_26_1[deduped_1_3][deduped_1_2] * deduped_21_1[deduped_1_3];
                      end );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, hoisted_14_1, hoisted_17_1, hoisted_18_1, deduped_19_1, hoisted_20_1, deduped_21_1, hoisted_23_1, hoisted_25_1, hoisted_26_1, hoisted_28_1, hoisted_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1;
    deduped_63_1 := [ 3 ];
    deduped_62_1 := [ 2 ];
    deduped_61_1 := [ 1 ];
    deduped_60_1 := [ 0 ];
    deduped_59_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( range_1 );
    deduped_58_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( source_1 );
    deduped_57_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_56_1 := deduped_59_1[3];
    deduped_55_1 := CreateCapCategoryObjectWithAttributes( deduped_57_1, Length, 4 );
    deduped_54_1 := deduped_58_1[3];
    deduped_53_1 := deduped_59_1[2];
    deduped_52_1 := deduped_59_1[1];
    deduped_51_1 := CreateCapCategoryObjectWithAttributes( deduped_57_1, Length, 2 );
    deduped_50_1 := CreateCapCategoryObjectWithAttributes( deduped_57_1, Length, BigInt( 1 ) );
    deduped_49_1 := deduped_58_1[2];
    deduped_48_1 := deduped_58_1[1];
    deduped_47_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_46_1 := [ 0 .. deduped_49_1 - 1 ];
    deduped_45_1 := CreateCapCategoryObjectWithAttributes( deduped_47_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_57_1, deduped_50_1, deduped_51_1, AsList, deduped_61_1 ) );
    deduped_44_1 := CreateCapCategoryObjectWithAttributes( deduped_47_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_57_1, deduped_50_1, deduped_51_1, AsList, deduped_60_1 ) );
    deduped_43_1 := Length( deduped_46_1 );
    deduped_42_1 := CreateCapCategoryMorphismWithAttributes( deduped_47_1, deduped_44_1, deduped_45_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_57_1, deduped_50_1, deduped_55_1, AsList, deduped_62_1 ) );
    deduped_41_1 := CreateCapCategoryMorphismWithAttributes( deduped_47_1, deduped_44_1, deduped_45_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_57_1, deduped_50_1, deduped_55_1, AsList, deduped_61_1 ) );
    deduped_40_1 := ListWithIdenticalEntries( deduped_49_1, deduped_45_1 );
    deduped_39_1 := ListWithIdenticalEntries( deduped_48_1, deduped_44_1 );
    deduped_2_1 := [ deduped_52_1, deduped_53_1 ];
    deduped_1_1 := [ deduped_44_1, deduped_45_1 ];
    deduped_35_1 := Concatenation( List( deduped_39_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ), List( deduped_40_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ) );
    deduped_33_1 := [ 0 .. Product( deduped_35_1 ) - 1 ];
    deduped_38_1 := List( deduped_46_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := logic_new_func_x_2 + deduped_48_1;
            hoisted_2_2 := deduped_35_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_35_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_33_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_37_1 := List( ListOfValues( [ CreateCapCategoryObjectWithAttributes( deduped_57_1, Length, deduped_48_1 ), CreateCapCategoryObjectWithAttributes( deduped_57_1, Length, deduped_49_1 ) ] ), Length );
    deduped_36_1 := [ 0 .. deduped_43_1 + deduped_43_1 - 1 ];
    deduped_34_1 := deduped_37_1[1];
    deduped_32_1 := Product( deduped_35_1{[ 1 .. deduped_34_1 ]} );
    hoisted_25_1 := Concatenation( deduped_38_1, deduped_38_1 );
    deduped_12_1 := [ List( deduped_56_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_56_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_11_1 := [ deduped_41_1, deduped_42_1 ];
    deduped_8_1 := [ deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1 ];
    deduped_7_1 := [ deduped_60_1, deduped_61_1, deduped_61_1, deduped_61_1 ];
    deduped_6_1 := [ deduped_60_1, deduped_60_1, deduped_60_1, deduped_61_1 ];
    deduped_5_1 := [ 0, 3 ];
    hoisted_23_1 := Concatenation( List( ListWithIdenticalEntries( deduped_49_1, deduped_41_1 ), function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( logic_new_func_x_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_5_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_6_1[deduped_1_2] and AsList( MapOfObject( Range( logic_new_func_x_2 ) ) ) = deduped_7_1[deduped_1_2] then
                              return AsList( MapOfMorphism( logic_new_func_x_2 ) ) = deduped_8_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePosition( deduped_11_1, logic_new_func_x_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_49_1, deduped_42_1 ), function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( logic_new_func_x_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_5_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_6_1[deduped_1_2] and AsList( MapOfObject( Range( logic_new_func_x_2 ) ) ) = deduped_7_1[deduped_1_2] then
                              return AsList( MapOfMorphism( logic_new_func_x_2 ) ) = deduped_8_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePosition( deduped_11_1, logic_new_func_x_2 )];
              fi;
              return;
          end ) );
    hoisted_26_1 := List( deduped_36_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_23_1[deduped_3_2];
            hoisted_1_2 := hoisted_25_1[deduped_3_2];
            return List( deduped_33_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_19_1 := Concatenation( deduped_39_1, deduped_40_1 );
    deduped_13_1 := List( deduped_54_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_3_1 := List( deduped_54_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_20_1 := Concatenation( List( deduped_46_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_19_1[1 + deduped_3_1[(1 + logic_new_func_x_2)]] )];
          end ), List( deduped_46_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_19_1[1 + deduped_13_1[(1 + logic_new_func_x_2)]] )];
          end ) );
    deduped_21_1 := List( deduped_36_1, function ( j_2 )
            return Product( hoisted_20_1{[ 1 .. j_2 ]} );
        end );
    hoisted_17_1 := Concatenation( List( deduped_46_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_3_1[1 + logic_new_func_x_2];
              hoisted_2_2 := deduped_35_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_35_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_33_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_46_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_13_1[1 + logic_new_func_x_2];
              hoisted_2_2 := deduped_35_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_35_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_33_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_10_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_47_1, deduped_44_1, deduped_44_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_57_1, deduped_50_1, deduped_55_1, AsList, deduped_60_1 ) ), deduped_41_1, deduped_42_1, CreateCapCategoryMorphismWithAttributes( deduped_47_1, deduped_45_1, deduped_45_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_57_1, deduped_50_1, deduped_55_1, AsList, deduped_63_1 ) ) ];
    deduped_9_1 := [ deduped_44_1, deduped_44_1, deduped_44_1, deduped_45_1 ];
    deduped_4_1 := Concatenation( List( deduped_39_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ), List( deduped_40_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    hoisted_14_1 := Concatenation( List( deduped_46_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_5_1[(1 + deduped_4_1[(1 + deduped_3_1[(1 + logic_new_func_x_2)])][1])];
              deduped_2_2 := deduped_6_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_5_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_6_1[deduped_1_2] and deduped_7_1[deduped_3_2] = deduped_7_1[deduped_1_2] then
                              return deduped_8_1[deduped_3_2] = deduped_8_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_9_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePosition( deduped_11_1, deduped_10_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_46_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_5_1[(1 + deduped_4_1[(1 + deduped_13_1[(1 + logic_new_func_x_2)])][1])];
              deduped_2_2 := deduped_6_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_5_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_6_1[deduped_1_2] and deduped_7_1[deduped_3_2] = deduped_7_1[deduped_1_2] then
                              return deduped_8_1[deduped_3_2] = deduped_8_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_9_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePosition( deduped_11_1, deduped_10_1[deduped_3_2] )];
              fi;
              return;
          end ) );
    hoisted_18_1 := List( deduped_36_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_14_1[deduped_3_2];
            hoisted_1_2 := hoisted_17_1[deduped_3_2];
            return List( deduped_33_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_31_1 := CAP_JIT_INCOMPLETE_LOGIC( Filtered( deduped_33_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return Sum( deduped_36_1, function ( j_3 )
                          local deduped_1_3;
                          deduped_1_3 := 1 + j_3;
                          return hoisted_18_1[deduped_1_3][deduped_1_2] * deduped_21_1[deduped_1_3];
                      end ) = Sum( deduped_36_1, function ( j_3 )
                          local deduped_1_3;
                          deduped_1_3 := 1 + j_3;
                          return hoisted_26_1[deduped_1_3][deduped_1_2] * deduped_21_1[deduped_1_3];
                      end );
            end )[1 + AsList( alpha_1 )[(1 + CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. (Length( Source( alpha_1 ) ) - 1) ][1] ))]] );
    hoisted_30_1 := REM_INT( QUO_INT( deduped_31_1, deduped_32_1 ), Product( deduped_35_1{[ 1 + deduped_34_1 .. Sum( deduped_37_1{[ 1, 2 ]} ) ]} ) );
    hoisted_28_1 := REM_INT( deduped_31_1, deduped_32_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, DefiningPairOfQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( [ 0 .. deduped_34_1 - 1 ], function ( i_2 )
                return REM_INT( QUO_INT( hoisted_28_1, deduped_52_1 ^ i_2 ), deduped_52_1 );
            end ), List( [ 0 .. deduped_37_1[2] - 1 ], function ( i_2 )
                return REM_INT( QUO_INT( hoisted_30_1, deduped_53_1 ^ i_2 ), deduped_53_1 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, hoisted_14_1, hoisted_17_1, hoisted_18_1, deduped_19_1, hoisted_20_1, deduped_21_1, hoisted_23_1, hoisted_25_1, hoisted_26_1, deduped_29_1, hoisted_31_1, hoisted_32_1, hoisted_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1;
    deduped_67_1 := [ 3 ];
    deduped_66_1 := [ 2 ];
    deduped_65_1 := [ 1 ];
    deduped_64_1 := [ 0 ];
    deduped_63_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_62_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_61_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_60_1 := deduped_63_1[3];
    deduped_59_1 := CreateCapCategoryObjectWithAttributes( deduped_62_1, Length, 4 );
    deduped_58_1 := deduped_61_1[3];
    deduped_57_1 := deduped_63_1[2];
    deduped_56_1 := deduped_63_1[1];
    deduped_55_1 := deduped_61_1[2];
    deduped_54_1 := CreateCapCategoryObjectWithAttributes( deduped_62_1, Length, 2 );
    deduped_53_1 := CreateCapCategoryObjectWithAttributes( deduped_62_1, Length, BigInt( 1 ) );
    deduped_52_1 := deduped_61_1[1];
    deduped_51_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_50_1 := [ 0 .. deduped_55_1 - 1 ];
    deduped_49_1 := CreateCapCategoryObjectWithAttributes( deduped_51_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_62_1, deduped_53_1, deduped_54_1, AsList, deduped_65_1 ) );
    deduped_48_1 := CreateCapCategoryObjectWithAttributes( deduped_51_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_62_1, deduped_53_1, deduped_54_1, AsList, deduped_64_1 ) );
    deduped_47_1 := Length( deduped_50_1 );
    deduped_46_1 := CreateCapCategoryMorphismWithAttributes( deduped_51_1, deduped_48_1, deduped_49_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_62_1, deduped_53_1, deduped_59_1, AsList, deduped_66_1 ) );
    deduped_45_1 := CreateCapCategoryMorphismWithAttributes( deduped_51_1, deduped_48_1, deduped_49_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_62_1, deduped_53_1, deduped_59_1, AsList, deduped_65_1 ) );
    deduped_44_1 := ListWithIdenticalEntries( deduped_55_1, deduped_49_1 );
    deduped_43_1 := ListWithIdenticalEntries( deduped_52_1, deduped_48_1 );
    deduped_42_1 := List( ListOfValues( [ CreateCapCategoryObjectWithAttributes( deduped_62_1, Length, deduped_52_1 ), CreateCapCategoryObjectWithAttributes( deduped_62_1, Length, deduped_55_1 ) ] ), Length );
    deduped_2_1 := [ deduped_56_1, deduped_57_1 ];
    deduped_1_1 := [ deduped_48_1, deduped_49_1 ];
    deduped_38_1 := Concatenation( List( deduped_43_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ), List( deduped_44_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ) );
    deduped_37_1 := [ 0 .. Product( deduped_38_1 ) - 1 ];
    deduped_41_1 := List( deduped_50_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := logic_new_func_x_2 + deduped_52_1;
            hoisted_2_2 := deduped_38_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_38_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_37_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_40_1 := [ 0 .. deduped_47_1 + deduped_47_1 - 1 ];
    deduped_39_1 := deduped_42_1[1];
    hoisted_25_1 := Concatenation( deduped_41_1, deduped_41_1 );
    deduped_12_1 := [ List( deduped_60_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_60_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_11_1 := [ deduped_45_1, deduped_46_1 ];
    deduped_8_1 := [ deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1 ];
    deduped_7_1 := [ deduped_64_1, deduped_65_1, deduped_65_1, deduped_65_1 ];
    deduped_6_1 := [ deduped_64_1, deduped_64_1, deduped_64_1, deduped_65_1 ];
    deduped_5_1 := [ 0, 3 ];
    hoisted_23_1 := Concatenation( List( ListWithIdenticalEntries( deduped_55_1, deduped_45_1 ), function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( logic_new_func_x_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_5_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_6_1[deduped_1_2] and AsList( MapOfObject( Range( logic_new_func_x_2 ) ) ) = deduped_7_1[deduped_1_2] then
                              return AsList( MapOfMorphism( logic_new_func_x_2 ) ) = deduped_8_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePosition( deduped_11_1, logic_new_func_x_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_55_1, deduped_46_1 ), function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( logic_new_func_x_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_5_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_6_1[deduped_1_2] and AsList( MapOfObject( Range( logic_new_func_x_2 ) ) ) = deduped_7_1[deduped_1_2] then
                              return AsList( MapOfMorphism( logic_new_func_x_2 ) ) = deduped_8_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePosition( deduped_11_1, logic_new_func_x_2 )];
              fi;
              return;
          end ) );
    hoisted_26_1 := List( deduped_40_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_23_1[deduped_3_2];
            hoisted_1_2 := hoisted_25_1[deduped_3_2];
            return List( deduped_37_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_19_1 := Concatenation( deduped_43_1, deduped_44_1 );
    deduped_13_1 := List( deduped_58_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_3_1 := List( deduped_58_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_20_1 := Concatenation( List( deduped_50_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_19_1[1 + deduped_3_1[(1 + logic_new_func_x_2)]] )];
          end ), List( deduped_50_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_19_1[1 + deduped_13_1[(1 + logic_new_func_x_2)]] )];
          end ) );
    deduped_21_1 := List( deduped_40_1, function ( j_2 )
            return Product( hoisted_20_1{[ 1 .. j_2 ]} );
        end );
    hoisted_17_1 := Concatenation( List( deduped_50_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_3_1[1 + logic_new_func_x_2];
              hoisted_2_2 := deduped_38_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_38_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_37_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_50_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_13_1[1 + logic_new_func_x_2];
              hoisted_2_2 := deduped_38_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_38_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_37_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_10_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_51_1, deduped_48_1, deduped_48_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_62_1, deduped_53_1, deduped_59_1, AsList, deduped_64_1 ) ), deduped_45_1, deduped_46_1, CreateCapCategoryMorphismWithAttributes( deduped_51_1, deduped_49_1, deduped_49_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_62_1, deduped_53_1, deduped_59_1, AsList, deduped_67_1 ) ) ];
    deduped_9_1 := [ deduped_48_1, deduped_48_1, deduped_48_1, deduped_49_1 ];
    deduped_4_1 := Concatenation( List( deduped_43_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ), List( deduped_44_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    hoisted_14_1 := Concatenation( List( deduped_50_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_5_1[(1 + deduped_4_1[(1 + deduped_3_1[(1 + logic_new_func_x_2)])][1])];
              deduped_2_2 := deduped_6_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_5_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_6_1[deduped_1_2] and deduped_7_1[deduped_3_2] = deduped_7_1[deduped_1_2] then
                              return deduped_8_1[deduped_3_2] = deduped_8_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_9_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePosition( deduped_11_1, deduped_10_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_50_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_5_1[(1 + deduped_4_1[(1 + deduped_13_1[(1 + logic_new_func_x_2)])][1])];
              deduped_2_2 := deduped_6_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_5_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_6_1[deduped_1_2] and deduped_7_1[deduped_3_2] = deduped_7_1[deduped_1_2] then
                              return deduped_8_1[deduped_3_2] = deduped_8_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_9_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePosition( deduped_11_1, deduped_10_1[deduped_3_2] )];
              fi;
              return;
          end ) );
    hoisted_18_1 := List( deduped_40_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_14_1[deduped_3_2];
            hoisted_1_2 := hoisted_17_1[deduped_3_2];
            return List( deduped_37_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_36_1 := Filtered( deduped_37_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return Sum( deduped_40_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_18_1[deduped_1_3][deduped_1_2] * deduped_21_1[deduped_1_3];
                  end ) = Sum( deduped_40_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_26_1[deduped_1_3][deduped_1_2] * deduped_21_1[deduped_1_3];
                  end );
        end );
    deduped_35_1 := Length( deduped_36_1 );
    hoisted_34_1 := [ 0 .. deduped_42_1[2] - 1 ];
    hoisted_32_1 := Product( deduped_38_1{[ 1 + deduped_39_1 .. Sum( deduped_42_1{[ 1, 2 ]} ) ]} );
    hoisted_31_1 := [ 0 .. deduped_39_1 - 1 ];
    deduped_29_1 := Product( deduped_38_1{[ 1 .. deduped_39_1 ]} );
    return List( [ 0 .. deduped_35_1 - 1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_36_1[1 + REM_INT( logic_new_func_x_2, deduped_35_1 )] );
            hoisted_2_2 := REM_INT( QUO_INT( deduped_3_2, deduped_29_1 ), hoisted_32_1 );
            hoisted_1_2 := REM_INT( deduped_3_2, deduped_29_1 );
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( hoisted_31_1, function ( i_3 )
                        return REM_INT( QUO_INT( hoisted_1_2, deduped_56_1 ^ i_3 ), deduped_56_1 );
                    end ), List( hoisted_34_1, function ( i_3 )
                        return REM_INT( QUO_INT( hoisted_2_2, deduped_57_1 ^ i_3 ), deduped_57_1 );
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

BindGlobal( "FinQuiversPrecompiled", function (  )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function (  )
    return CategoryOfQuiversEnrichedOver( CategoryOfSkeletalFinSets(  : FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_FinQuiversPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
