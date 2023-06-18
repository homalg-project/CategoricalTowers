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
function ( cat_1, objects_1 )
    local deduped_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := [ 1 .. Length( objects_1 ) ];
    deduped_4_1 := List( objects_1, function ( x_2 )
            return DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( x_2 )[2];
        end );
    deduped_3_1 := List( objects_1, function ( x_2 )
            return DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( x_2 )[1];
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfQuiverEnrichedOverSkeletalFinSets, NTuple( 3, Sum( deduped_3_1 ), Sum( deduped_4_1 ), ListN( Concatenation( List( deduped_5_1, function ( i_2 )
                    local hoisted_1_2, hoisted_2_2, deduped_3_2;
                    deduped_3_2 := Sum( deduped_3_1{[ 1 .. i_2 - 1 ]} );
                    hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_3_1[i_2] - 1 ];
                    hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( List( DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( CAP_JIT_INCOMPLETE_LOGIC( objects_1[i_2] ) )[3], function ( a_3 )
                              return a_3[1];
                          end ) );
                    return List( [ 0 .. deduped_4_1[i_2] - 1 ], function ( i_3 )
                            return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                        end );
                end ) ), Concatenation( List( deduped_5_1, function ( i_2 )
                    local hoisted_1_2, hoisted_2_2, deduped_3_2;
                    deduped_3_2 := Sum( deduped_3_1{[ 1 .. i_2 - 1 ]} );
                    hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_3_1[i_2] - 1 ];
                    hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( List( DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( CAP_JIT_INCOMPLETE_LOGIC( objects_1[i_2] ) )[3], function ( a_3 )
                              return a_3[2];
                          end ) );
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
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, hoisted_15_1, hoisted_18_1, hoisted_19_1, deduped_20_1, hoisted_21_1, deduped_22_1, hoisted_24_1, hoisted_26_1, hoisted_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1;
    deduped_55_1 := [ 3 ];
    deduped_54_1 := [ 2 ];
    deduped_53_1 := [ 1 ];
    deduped_52_1 := [ 0 ];
    deduped_51_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_50_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_49_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_48_1 := deduped_51_1[3];
    deduped_47_1 := CreateCapCategoryObjectWithAttributes( deduped_49_1, Length, 4 );
    deduped_46_1 := deduped_50_1[3];
    deduped_45_1 := deduped_50_1[2];
    deduped_44_1 := CreateCapCategoryObjectWithAttributes( deduped_49_1, Length, 2 );
    deduped_43_1 := CreateCapCategoryObjectWithAttributes( deduped_49_1, Length, BigInt( 1 ) );
    deduped_42_1 := deduped_50_1[1];
    deduped_41_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_40_1 := [ 0 .. deduped_45_1 - 1 ];
    deduped_39_1 := CreateCapCategoryObjectWithAttributes( deduped_41_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_49_1, deduped_43_1, deduped_44_1, AsList, deduped_53_1 ) );
    deduped_38_1 := CreateCapCategoryObjectWithAttributes( deduped_41_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_49_1, deduped_43_1, deduped_44_1, AsList, deduped_52_1 ) );
    deduped_37_1 := [ 0 .. deduped_45_1 + deduped_45_1 - 1 ];
    deduped_36_1 := CreateCapCategoryMorphismWithAttributes( deduped_41_1, deduped_38_1, deduped_39_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_49_1, deduped_43_1, deduped_47_1, AsList, deduped_54_1 ) );
    deduped_35_1 := CreateCapCategoryMorphismWithAttributes( deduped_41_1, deduped_38_1, deduped_39_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_49_1, deduped_43_1, deduped_47_1, AsList, deduped_53_1 ) );
    deduped_34_1 := ListWithIdenticalEntries( deduped_45_1, deduped_39_1 );
    deduped_33_1 := ListWithIdenticalEntries( deduped_42_1, deduped_38_1 );
    deduped_2_1 := [ deduped_51_1[1], deduped_51_1[2] ];
    deduped_1_1 := [ deduped_38_1, deduped_39_1 ];
    deduped_32_1 := Concatenation( List( deduped_33_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ), List( deduped_34_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ) );
    deduped_30_1 := Product( deduped_32_1 );
    deduped_28_1 := [ 0 .. deduped_30_1 - 1 ];
    deduped_31_1 := List( deduped_40_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + (i_2 + deduped_42_1);
            hoisted_2_2 := deduped_32_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_32_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_28_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_29_1 := ListWithIdenticalEntries( Length( deduped_40_1 ), deduped_30_1 );
    hoisted_26_1 := Concatenation( deduped_31_1, deduped_31_1 );
    deduped_13_1 := [ List( deduped_48_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_48_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_12_1 := [ deduped_35_1, deduped_36_1 ];
    deduped_9_1 := [ deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1 ];
    deduped_8_1 := [ deduped_52_1, deduped_53_1, deduped_53_1, deduped_53_1 ];
    deduped_7_1 := [ deduped_52_1, deduped_52_1, deduped_52_1, deduped_53_1 ];
    deduped_6_1 := [ 0, 3 ];
    hoisted_24_1 := Concatenation( List( ListWithIdenticalEntries( deduped_45_1, deduped_35_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_6_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_7_1[deduped_1_2] and AsList( MapOfObject( Range( morB_2 ) ) ) = deduped_8_1[deduped_1_2] then
                              return AsList( MapOfMorphism( morB_2 ) ) = deduped_9_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePosition( deduped_12_1, morB_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_45_1, deduped_36_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_6_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_7_1[deduped_1_2] and AsList( MapOfObject( Range( morB_2 ) ) ) = deduped_8_1[deduped_1_2] then
                              return AsList( MapOfMorphism( morB_2 ) ) = deduped_9_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePosition( deduped_12_1, morB_2 )];
              fi;
              return;
          end ) );
    deduped_3_1 := Concatenation( deduped_29_1, deduped_29_1 );
    hoisted_27_1 := List( deduped_37_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_24_1[deduped_3_2];
            hoisted_1_2 := hoisted_26_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_20_1 := Concatenation( deduped_33_1, deduped_34_1 );
    deduped_14_1 := List( deduped_46_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_4_1 := List( deduped_46_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_21_1 := Concatenation( List( deduped_40_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_20_1[1 + deduped_4_1[(1 + i_2)]] )];
          end ), List( deduped_40_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_20_1[1 + deduped_14_1[(1 + i_2)]] )];
          end ) );
    deduped_22_1 := List( deduped_37_1, function ( j_2 )
            return Product( hoisted_21_1{[ 1 .. j_2 ]} );
        end );
    hoisted_18_1 := Concatenation( List( deduped_40_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_4_1[(1 + i_2)];
              hoisted_2_2 := deduped_32_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_32_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_28_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_40_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_14_1[(1 + i_2)];
              hoisted_2_2 := deduped_32_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_32_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_28_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_11_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_41_1, deduped_38_1, deduped_38_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_49_1, deduped_43_1, deduped_47_1, AsList, deduped_52_1 ) ), deduped_35_1, deduped_36_1, CreateCapCategoryMorphismWithAttributes( deduped_41_1, deduped_39_1, deduped_39_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_49_1, deduped_43_1, deduped_47_1, AsList, deduped_55_1 ) ) ];
    deduped_10_1 := [ deduped_38_1, deduped_38_1, deduped_38_1, deduped_39_1 ];
    deduped_5_1 := Concatenation( List( deduped_33_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ), List( deduped_34_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    hoisted_15_1 := Concatenation( List( deduped_40_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_6_1[(1 + deduped_5_1[(1 + deduped_4_1[(1 + i_2)])][1])];
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
          end ), List( deduped_40_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_6_1[(1 + deduped_5_1[(1 + deduped_14_1[(1 + i_2)])][1])];
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
    hoisted_19_1 := List( deduped_37_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_15_1[deduped_3_2];
            hoisted_1_2 := hoisted_18_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( deduped_49_1, Length, Length( Filtered( deduped_28_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_37_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_19_1[deduped_1_3][deduped_1_2] * deduped_22_1[deduped_1_3];
                        end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_37_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_27_1[deduped_1_3][deduped_1_2] * deduped_22_1[deduped_1_3];
                        end ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, hoisted_15_1, hoisted_18_1, hoisted_19_1, deduped_20_1, hoisted_21_1, deduped_22_1, hoisted_24_1, hoisted_26_1, hoisted_27_1, hoisted_29_1, hoisted_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1;
    deduped_65_1 := [ 3 ];
    deduped_64_1 := [ 2 ];
    deduped_63_1 := [ 1 ];
    deduped_62_1 := [ 0 ];
    deduped_61_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( range_1 );
    deduped_60_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( source_1 );
    deduped_59_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_58_1 := deduped_61_1[3];
    deduped_57_1 := CreateCapCategoryObjectWithAttributes( deduped_59_1, Length, 4 );
    deduped_56_1 := deduped_60_1[3];
    deduped_55_1 := deduped_61_1[2];
    deduped_54_1 := deduped_61_1[1];
    deduped_53_1 := CreateCapCategoryObjectWithAttributes( deduped_59_1, Length, 2 );
    deduped_52_1 := CreateCapCategoryObjectWithAttributes( deduped_59_1, Length, BigInt( 1 ) );
    deduped_51_1 := deduped_60_1[2];
    deduped_50_1 := deduped_60_1[1];
    deduped_49_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_48_1 := [ 0 .. deduped_51_1 - 1 ];
    deduped_47_1 := CreateCapCategoryObjectWithAttributes( deduped_49_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_59_1, deduped_52_1, deduped_53_1, AsList, deduped_63_1 ) );
    deduped_46_1 := CreateCapCategoryObjectWithAttributes( deduped_49_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_59_1, deduped_52_1, deduped_53_1, AsList, deduped_62_1 ) );
    deduped_45_1 := [ 0 .. deduped_51_1 + deduped_51_1 - 1 ];
    deduped_44_1 := CreateCapCategoryMorphismWithAttributes( deduped_49_1, deduped_46_1, deduped_47_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_59_1, deduped_52_1, deduped_57_1, AsList, deduped_64_1 ) );
    deduped_43_1 := CreateCapCategoryMorphismWithAttributes( deduped_49_1, deduped_46_1, deduped_47_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_59_1, deduped_52_1, deduped_57_1, AsList, deduped_63_1 ) );
    deduped_42_1 := ListWithIdenticalEntries( deduped_51_1, deduped_47_1 );
    deduped_41_1 := ListWithIdenticalEntries( deduped_50_1, deduped_46_1 );
    deduped_40_1 := List( ListOfValues( [ CreateCapCategoryObjectWithAttributes( deduped_59_1, Length, deduped_50_1 ), CreateCapCategoryObjectWithAttributes( deduped_59_1, Length, deduped_51_1 ) ] ), Length );
    deduped_2_1 := [ deduped_54_1, deduped_55_1 ];
    deduped_1_1 := [ deduped_46_1, deduped_47_1 ];
    deduped_39_1 := Concatenation( List( deduped_41_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ), List( deduped_42_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ) );
    deduped_38_1 := deduped_40_1[1];
    deduped_36_1 := Product( deduped_39_1 );
    deduped_34_1 := [ 0 .. deduped_36_1 - 1 ];
    deduped_37_1 := List( deduped_48_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + (i_2 + deduped_50_1);
            hoisted_2_2 := deduped_39_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_39_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_34_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_35_1 := ListWithIdenticalEntries( Length( deduped_48_1 ), deduped_36_1 );
    deduped_33_1 := Product( deduped_39_1{[ 1 .. deduped_38_1 ]} );
    hoisted_26_1 := Concatenation( deduped_37_1, deduped_37_1 );
    deduped_13_1 := [ List( deduped_58_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_58_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_12_1 := [ deduped_43_1, deduped_44_1 ];
    deduped_9_1 := [ deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1 ];
    deduped_8_1 := [ deduped_62_1, deduped_63_1, deduped_63_1, deduped_63_1 ];
    deduped_7_1 := [ deduped_62_1, deduped_62_1, deduped_62_1, deduped_63_1 ];
    deduped_6_1 := [ 0, 3 ];
    hoisted_24_1 := Concatenation( List( ListWithIdenticalEntries( deduped_51_1, deduped_43_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_6_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_7_1[deduped_1_2] and AsList( MapOfObject( Range( morB_2 ) ) ) = deduped_8_1[deduped_1_2] then
                              return AsList( MapOfMorphism( morB_2 ) ) = deduped_9_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePosition( deduped_12_1, morB_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_51_1, deduped_44_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_6_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_7_1[deduped_1_2] and AsList( MapOfObject( Range( morB_2 ) ) ) = deduped_8_1[deduped_1_2] then
                              return AsList( MapOfMorphism( morB_2 ) ) = deduped_9_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePosition( deduped_12_1, morB_2 )];
              fi;
              return;
          end ) );
    deduped_3_1 := Concatenation( deduped_35_1, deduped_35_1 );
    hoisted_27_1 := List( deduped_45_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_24_1[deduped_3_2];
            hoisted_1_2 := hoisted_26_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_20_1 := Concatenation( deduped_41_1, deduped_42_1 );
    deduped_14_1 := List( deduped_56_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_4_1 := List( deduped_56_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_21_1 := Concatenation( List( deduped_48_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_20_1[1 + deduped_4_1[(1 + i_2)]] )];
          end ), List( deduped_48_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_20_1[1 + deduped_14_1[(1 + i_2)]] )];
          end ) );
    deduped_22_1 := List( deduped_45_1, function ( j_2 )
            return Product( hoisted_21_1{[ 1 .. j_2 ]} );
        end );
    hoisted_18_1 := Concatenation( List( deduped_48_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_4_1[(1 + i_2)];
              hoisted_2_2 := deduped_39_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_39_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_34_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_48_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_14_1[(1 + i_2)];
              hoisted_2_2 := deduped_39_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_39_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_34_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_11_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_49_1, deduped_46_1, deduped_46_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_59_1, deduped_52_1, deduped_57_1, AsList, deduped_62_1 ) ), deduped_43_1, deduped_44_1, CreateCapCategoryMorphismWithAttributes( deduped_49_1, deduped_47_1, deduped_47_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_59_1, deduped_52_1, deduped_57_1, AsList, deduped_65_1 ) ) ];
    deduped_10_1 := [ deduped_46_1, deduped_46_1, deduped_46_1, deduped_47_1 ];
    deduped_5_1 := Concatenation( List( deduped_41_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ), List( deduped_42_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    hoisted_15_1 := Concatenation( List( deduped_48_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_6_1[(1 + deduped_5_1[(1 + deduped_4_1[(1 + i_2)])][1])];
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
          end ), List( deduped_48_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_6_1[(1 + deduped_5_1[(1 + deduped_14_1[(1 + i_2)])][1])];
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
    hoisted_19_1 := List( deduped_45_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_15_1[deduped_3_2];
            hoisted_1_2 := hoisted_18_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_32_1 := CAP_JIT_INCOMPLETE_LOGIC( Filtered( deduped_34_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_45_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_19_1[deduped_1_3][deduped_1_2] * deduped_22_1[deduped_1_3];
                        end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_45_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_27_1[deduped_1_3][deduped_1_2] * deduped_22_1[deduped_1_3];
                        end ) );
            end )[1 + AsList( alpha_1 )[(1 + CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. (Length( Source( alpha_1 ) ) - 1) ][1] ))]] );
    hoisted_31_1 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( deduped_32_1, deduped_33_1 ), Product( deduped_39_1{[ 1 + deduped_38_1 .. Sum( deduped_40_1{[ 1, 2 ]} ) ]} ) ) );
    hoisted_29_1 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( deduped_32_1, deduped_33_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, DefiningPairOfQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( [ 0 .. deduped_38_1 - 1 ], function ( i_2 )
                return REM_INT( QUO_INT( hoisted_29_1, deduped_54_1 ^ i_2 ), deduped_54_1 );
            end ), List( [ 0 .. deduped_40_1[2] - 1 ], function ( i_2 )
                return REM_INT( QUO_INT( hoisted_31_1, deduped_55_1 ^ i_2 ), deduped_55_1 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, hoisted_15_1, hoisted_18_1, hoisted_19_1, deduped_20_1, hoisted_21_1, deduped_22_1, hoisted_24_1, hoisted_26_1, hoisted_27_1, deduped_30_1, hoisted_32_1, hoisted_33_1, hoisted_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1, deduped_68_1, deduped_69_1;
    deduped_69_1 := [ 3 ];
    deduped_68_1 := [ 2 ];
    deduped_67_1 := [ 1 ];
    deduped_66_1 := [ 0 ];
    deduped_65_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_64_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_63_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_62_1 := deduped_65_1[3];
    deduped_61_1 := CreateCapCategoryObjectWithAttributes( deduped_64_1, Length, 4 );
    deduped_60_1 := deduped_63_1[3];
    deduped_59_1 := deduped_65_1[2];
    deduped_58_1 := deduped_65_1[1];
    deduped_57_1 := deduped_63_1[2];
    deduped_56_1 := CreateCapCategoryObjectWithAttributes( deduped_64_1, Length, 2 );
    deduped_55_1 := CreateCapCategoryObjectWithAttributes( deduped_64_1, Length, BigInt( 1 ) );
    deduped_54_1 := deduped_63_1[1];
    deduped_53_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_52_1 := [ 0 .. deduped_57_1 - 1 ];
    deduped_51_1 := CreateCapCategoryObjectWithAttributes( deduped_53_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_64_1, deduped_55_1, deduped_56_1, AsList, deduped_67_1 ) );
    deduped_50_1 := CreateCapCategoryObjectWithAttributes( deduped_53_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_64_1, deduped_55_1, deduped_56_1, AsList, deduped_66_1 ) );
    deduped_49_1 := [ 0 .. deduped_57_1 + deduped_57_1 - 1 ];
    deduped_48_1 := CreateCapCategoryMorphismWithAttributes( deduped_53_1, deduped_50_1, deduped_51_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_64_1, deduped_55_1, deduped_61_1, AsList, deduped_68_1 ) );
    deduped_47_1 := CreateCapCategoryMorphismWithAttributes( deduped_53_1, deduped_50_1, deduped_51_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_64_1, deduped_55_1, deduped_61_1, AsList, deduped_67_1 ) );
    deduped_46_1 := ListWithIdenticalEntries( deduped_57_1, deduped_51_1 );
    deduped_45_1 := ListWithIdenticalEntries( deduped_54_1, deduped_50_1 );
    deduped_44_1 := List( ListOfValues( [ CreateCapCategoryObjectWithAttributes( deduped_64_1, Length, deduped_54_1 ), CreateCapCategoryObjectWithAttributes( deduped_64_1, Length, deduped_57_1 ) ] ), Length );
    deduped_43_1 := deduped_44_1[1];
    deduped_2_1 := [ deduped_58_1, deduped_59_1 ];
    deduped_1_1 := [ deduped_50_1, deduped_51_1 ];
    deduped_42_1 := Concatenation( List( deduped_45_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ), List( deduped_46_1, function ( objB_2 )
              return deduped_2_1[SafePosition( deduped_1_1, objB_2 )];
          end ) );
    deduped_40_1 := Product( deduped_42_1 );
    deduped_38_1 := [ 0 .. deduped_40_1 - 1 ];
    deduped_41_1 := List( deduped_52_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + (i_2 + deduped_54_1);
            hoisted_2_2 := deduped_42_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_42_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_38_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_39_1 := ListWithIdenticalEntries( Length( deduped_52_1 ), deduped_40_1 );
    hoisted_26_1 := Concatenation( deduped_41_1, deduped_41_1 );
    deduped_13_1 := [ List( deduped_62_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_62_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_12_1 := [ deduped_47_1, deduped_48_1 ];
    deduped_9_1 := [ deduped_66_1, deduped_67_1, deduped_68_1, deduped_69_1 ];
    deduped_8_1 := [ deduped_66_1, deduped_67_1, deduped_67_1, deduped_67_1 ];
    deduped_7_1 := [ deduped_66_1, deduped_66_1, deduped_66_1, deduped_67_1 ];
    deduped_6_1 := [ 0, 3 ];
    hoisted_24_1 := Concatenation( List( ListWithIdenticalEntries( deduped_57_1, deduped_47_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_6_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_7_1[deduped_1_2] and AsList( MapOfObject( Range( morB_2 ) ) ) = deduped_8_1[deduped_1_2] then
                              return AsList( MapOfMorphism( morB_2 ) ) = deduped_9_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePosition( deduped_12_1, morB_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_57_1, deduped_48_1 ), function ( morB_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( morB_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_6_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_7_1[deduped_1_2] and AsList( MapOfObject( Range( morB_2 ) ) ) = deduped_8_1[deduped_1_2] then
                              return AsList( MapOfMorphism( morB_2 ) ) = deduped_9_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafePosition( deduped_1_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePosition( deduped_12_1, morB_2 )];
              fi;
              return;
          end ) );
    deduped_3_1 := Concatenation( deduped_39_1, deduped_39_1 );
    hoisted_27_1 := List( deduped_49_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_24_1[deduped_3_2];
            hoisted_1_2 := hoisted_26_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_20_1 := Concatenation( deduped_45_1, deduped_46_1 );
    deduped_14_1 := List( deduped_60_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_4_1 := List( deduped_60_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_21_1 := Concatenation( List( deduped_52_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_20_1[1 + deduped_4_1[(1 + i_2)]] )];
          end ), List( deduped_52_1, function ( i_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_20_1[1 + deduped_14_1[(1 + i_2)]] )];
          end ) );
    deduped_22_1 := List( deduped_49_1, function ( j_2 )
            return Product( hoisted_21_1{[ 1 .. j_2 ]} );
        end );
    hoisted_18_1 := Concatenation( List( deduped_52_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_4_1[(1 + i_2)];
              hoisted_2_2 := deduped_42_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_42_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_38_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_52_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_14_1[(1 + i_2)];
              hoisted_2_2 := deduped_42_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_42_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_38_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_11_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_53_1, deduped_50_1, deduped_50_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_64_1, deduped_55_1, deduped_61_1, AsList, deduped_66_1 ) ), deduped_47_1, deduped_48_1, CreateCapCategoryMorphismWithAttributes( deduped_53_1, deduped_51_1, deduped_51_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_64_1, deduped_55_1, deduped_61_1, AsList, deduped_69_1 ) ) ];
    deduped_10_1 := [ deduped_50_1, deduped_50_1, deduped_50_1, deduped_51_1 ];
    deduped_5_1 := Concatenation( List( deduped_45_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ), List( deduped_46_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    hoisted_15_1 := Concatenation( List( deduped_52_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_6_1[(1 + deduped_5_1[(1 + deduped_4_1[(1 + i_2)])][1])];
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
          end ), List( deduped_52_1, function ( i_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_6_1[(1 + deduped_5_1[(1 + deduped_14_1[(1 + i_2)])][1])];
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
    hoisted_19_1 := List( deduped_49_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_15_1[deduped_3_2];
            hoisted_1_2 := hoisted_18_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_37_1 := Filtered( deduped_38_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_49_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_19_1[deduped_1_3][deduped_1_2] * deduped_22_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_49_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_27_1[deduped_1_3][deduped_1_2] * deduped_22_1[deduped_1_3];
                    end ) );
        end );
    deduped_36_1 := Length( deduped_37_1 );
    hoisted_35_1 := [ 0 .. deduped_44_1[2] - 1 ];
    hoisted_33_1 := Product( deduped_42_1{[ 1 + deduped_43_1 .. Sum( deduped_44_1{[ 1, 2 ]} ) ]} );
    hoisted_32_1 := [ 0 .. deduped_43_1 - 1 ];
    deduped_30_1 := Product( deduped_42_1{[ 1 .. deduped_43_1 ]} );
    return List( [ 0 .. deduped_36_1 - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_37_1[1 + REM_INT( i_2, deduped_36_1 )] );
            hoisted_2_2 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( deduped_3_2, deduped_30_1 ), hoisted_33_1 ) );
            hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( deduped_3_2, deduped_30_1 ) );
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( hoisted_32_1, function ( i_3 )
                        return REM_INT( QUO_INT( hoisted_1_2, deduped_58_1 ^ i_3 ), deduped_58_1 );
                    end ), List( hoisted_35_1, function ( i_3 )
                        return REM_INT( QUO_INT( hoisted_2_2, deduped_59_1 ^ i_3 ), deduped_59_1 );
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
