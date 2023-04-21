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
    local deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, hoisted_17_1, hoisted_20_1, hoisted_21_1, deduped_22_1, hoisted_23_1, deduped_24_1, hoisted_26_1, hoisted_28_1, hoisted_29_1, deduped_30_1, deduped_31_1, hoisted_32_1, hoisted_34_1, hoisted_36_1, hoisted_37_1, deduped_40_1, hoisted_41_1, hoisted_42_1, hoisted_44_1, hoisted_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1, deduped_68_1, deduped_69_1, deduped_70_1, deduped_71_1, deduped_72_1, deduped_73_1, deduped_74_1, deduped_75_1, deduped_76_1, deduped_77_1, deduped_78_1, deduped_79_1, deduped_80_1, deduped_81_1;
    deduped_81_1 := [ 3 ];
    deduped_80_1 := [ 2 ];
    deduped_79_1 := [ 1 ];
    deduped_78_1 := [ 0 ];
    deduped_77_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( range_1 );
    deduped_76_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( source_1 );
    deduped_75_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_74_1 := Length( Source( alpha_1 ) );
    deduped_73_1 := deduped_77_1[3];
    deduped_72_1 := CreateCapCategoryObjectWithAttributes( deduped_75_1, Length, 4 );
    deduped_71_1 := deduped_76_1[3];
    deduped_70_1 := deduped_77_1[2];
    deduped_69_1 := CreateCapCategoryObjectWithAttributes( deduped_75_1, Length, 2 );
    deduped_68_1 := CreateCapCategoryObjectWithAttributes( deduped_75_1, Length, BigInt( 1 ) );
    deduped_67_1 := deduped_77_1[1];
    deduped_66_1 := deduped_76_1[2];
    deduped_65_1 := deduped_76_1[1];
    deduped_64_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_63_1 := [ 0 .. deduped_74_1 - 1 ];
    deduped_62_1 := [ 0 .. deduped_66_1 - 1 ];
    deduped_61_1 := CreateCapCategoryObjectWithAttributes( deduped_64_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_75_1, deduped_68_1, deduped_69_1, AsList, deduped_79_1 ) );
    deduped_60_1 := CreateCapCategoryObjectWithAttributes( deduped_64_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_75_1, deduped_68_1, deduped_69_1, AsList, deduped_78_1 ) );
    deduped_59_1 := Length( deduped_62_1 );
    deduped_58_1 := CreateCapCategoryMorphismWithAttributes( deduped_64_1, deduped_60_1, deduped_61_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_75_1, deduped_68_1, deduped_72_1, AsList, deduped_80_1 ) );
    deduped_57_1 := CreateCapCategoryMorphismWithAttributes( deduped_64_1, deduped_60_1, deduped_61_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_75_1, deduped_68_1, deduped_72_1, AsList, deduped_79_1 ) );
    deduped_56_1 := ListWithIdenticalEntries( deduped_66_1, deduped_61_1 );
    deduped_55_1 := ListWithIdenticalEntries( deduped_65_1, deduped_60_1 );
    deduped_4_1 := [ deduped_67_1, deduped_70_1 ];
    deduped_3_1 := [ deduped_60_1, deduped_61_1 ];
    deduped_51_1 := Concatenation( List( deduped_55_1, function ( logic_new_func_x_2 )
              return deduped_4_1[SafePosition( deduped_3_1, logic_new_func_x_2 )];
          end ), List( deduped_56_1, function ( logic_new_func_x_2 )
              return deduped_4_1[SafePosition( deduped_3_1, logic_new_func_x_2 )];
          end ) );
    deduped_46_1 := [ 0 .. Product( deduped_51_1 ) - 1 ];
    deduped_54_1 := List( deduped_62_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := logic_new_func_x_2 + deduped_65_1;
            hoisted_2_2 := deduped_51_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_51_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_46_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_53_1 := List( ListOfValues( [ CreateCapCategoryObjectWithAttributes( deduped_75_1, Length, deduped_65_1 ), CreateCapCategoryObjectWithAttributes( deduped_75_1, Length, deduped_66_1 ) ] ), Length );
    deduped_52_1 := [ 0 .. deduped_59_1 + deduped_59_1 - 1 ];
    deduped_50_1 := deduped_53_1[2];
    deduped_49_1 := deduped_53_1[1];
    deduped_48_1 := deduped_70_1 ^ deduped_50_1;
    deduped_47_1 := deduped_67_1 ^ deduped_49_1;
    hoisted_44_1 := List( [ 0 .. deduped_48_1 * deduped_50_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_70_1 ^ QUO_INT( i_2, deduped_48_1 ) ), deduped_70_1 );
        end );
    deduped_40_1 := Product( deduped_51_1{[ 1 + deduped_49_1 .. Sum( deduped_53_1{[ 1, 2 ]} ) ]} );
    deduped_5_1 := Product( deduped_51_1{[ 1 .. deduped_49_1 ]} );
    hoisted_41_1 := List( deduped_46_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_5_1 ), deduped_40_1 );
        end );
    hoisted_28_1 := Concatenation( deduped_54_1, deduped_54_1 );
    deduped_15_1 := [ List( deduped_73_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_73_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_14_1 := [ deduped_57_1, deduped_58_1 ];
    deduped_11_1 := [ deduped_78_1, deduped_79_1, deduped_80_1, deduped_81_1 ];
    deduped_10_1 := [ deduped_78_1, deduped_79_1, deduped_79_1, deduped_79_1 ];
    deduped_9_1 := [ deduped_78_1, deduped_78_1, deduped_78_1, deduped_79_1 ];
    deduped_8_1 := [ 0, 3 ];
    hoisted_26_1 := Concatenation( List( ListWithIdenticalEntries( deduped_66_1, deduped_57_1 ), function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( logic_new_func_x_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_8_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_9_1[deduped_1_2] and AsList( MapOfObject( Range( logic_new_func_x_2 ) ) ) = deduped_10_1[deduped_1_2] then
                              return AsList( MapOfMorphism( logic_new_func_x_2 ) ) = deduped_11_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_4_1[SafePosition( deduped_3_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_15_1[SafeUniquePosition( deduped_14_1, logic_new_func_x_2 )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_66_1, deduped_58_1 ), function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := Source( logic_new_func_x_2 );
              deduped_2_2 := AsList( MapOfObject( deduped_3_2 ) );
              deduped_1_2 := 1 + deduped_8_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_9_1[deduped_1_2] and AsList( MapOfObject( Range( logic_new_func_x_2 ) ) ) = deduped_10_1[deduped_1_2] then
                              return AsList( MapOfMorphism( logic_new_func_x_2 ) ) = deduped_11_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_4_1[SafePosition( deduped_3_1, deduped_3_2 )] - 1 ];
              else
                  return deduped_15_1[SafeUniquePosition( deduped_14_1, logic_new_func_x_2 )];
              fi;
              return;
          end ) );
    hoisted_29_1 := List( deduped_52_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_26_1[deduped_3_2];
            hoisted_1_2 := hoisted_28_1[deduped_3_2];
            return List( deduped_46_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_22_1 := Concatenation( deduped_55_1, deduped_56_1 );
    deduped_16_1 := List( deduped_71_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_6_1 := List( deduped_71_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_23_1 := Concatenation( List( deduped_62_1, function ( logic_new_func_x_2 )
              return deduped_4_1[SafePosition( deduped_3_1, deduped_22_1[1 + deduped_6_1[(1 + logic_new_func_x_2)]] )];
          end ), List( deduped_62_1, function ( logic_new_func_x_2 )
              return deduped_4_1[SafePosition( deduped_3_1, deduped_22_1[1 + deduped_16_1[(1 + logic_new_func_x_2)]] )];
          end ) );
    deduped_24_1 := List( deduped_52_1, function ( j_2 )
            return Product( hoisted_23_1{[ 1 .. j_2 ]} );
        end );
    hoisted_20_1 := Concatenation( List( deduped_62_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_6_1[1 + logic_new_func_x_2];
              hoisted_2_2 := deduped_51_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_51_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_46_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_62_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_16_1[1 + logic_new_func_x_2];
              hoisted_2_2 := deduped_51_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_51_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_46_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_13_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_64_1, deduped_60_1, deduped_60_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_75_1, deduped_68_1, deduped_72_1, AsList, deduped_78_1 ) ), deduped_57_1, deduped_58_1, CreateCapCategoryMorphismWithAttributes( deduped_64_1, deduped_61_1, deduped_61_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_75_1, deduped_68_1, deduped_72_1, AsList, deduped_81_1 ) ) ];
    deduped_12_1 := [ deduped_60_1, deduped_60_1, deduped_60_1, deduped_61_1 ];
    deduped_7_1 := Concatenation( List( deduped_55_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ), List( deduped_56_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    hoisted_17_1 := Concatenation( List( deduped_62_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_8_1[(1 + deduped_7_1[(1 + deduped_6_1[(1 + logic_new_func_x_2)])][1])];
              deduped_2_2 := deduped_9_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_8_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_9_1[deduped_1_2] and deduped_10_1[deduped_3_2] = deduped_10_1[deduped_1_2] then
                              return deduped_11_1[deduped_3_2] = deduped_11_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_4_1[SafePosition( deduped_3_1, deduped_12_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_15_1[SafeUniquePosition( deduped_14_1, deduped_13_1[deduped_3_2] )];
              fi;
              return;
          end ), List( deduped_62_1, function ( logic_new_func_x_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_8_1[(1 + deduped_7_1[(1 + deduped_16_1[(1 + logic_new_func_x_2)])][1])];
              deduped_2_2 := deduped_9_1[deduped_3_2];
              deduped_1_2 := 1 + deduped_8_1[(1 + deduped_2_2[1])];
              if IdFunc( function (  )
                          if deduped_2_2 = deduped_9_1[deduped_1_2] and deduped_10_1[deduped_3_2] = deduped_10_1[deduped_1_2] then
                              return deduped_11_1[deduped_3_2] = deduped_11_1[deduped_1_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_4_1[SafePosition( deduped_3_1, deduped_12_1[deduped_3_2] )] - 1 ];
              else
                  return deduped_15_1[SafeUniquePosition( deduped_14_1, deduped_13_1[deduped_3_2] )];
              fi;
              return;
          end ) );
    hoisted_21_1 := List( deduped_52_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_17_1[deduped_3_2];
            hoisted_1_2 := hoisted_20_1[deduped_3_2];
            return List( deduped_46_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_31_1 := Filtered( deduped_46_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return Sum( deduped_52_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_21_1[deduped_1_3][deduped_1_2] * deduped_24_1[deduped_1_3];
                  end ) = Sum( deduped_52_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_29_1[deduped_1_3][deduped_1_2] * deduped_24_1[deduped_1_3];
                  end );
        end );
    deduped_30_1 := AsList( alpha_1 );
    hoisted_42_1 := List( deduped_63_1, function ( logic_new_func_x_2 )
            return hoisted_41_1[1 + deduped_31_1[(1 + deduped_30_1[(1 + logic_new_func_x_2)])]];
        end );
    hoisted_45_1 := List( [ 0 .. deduped_74_1 * deduped_50_1 - 1 ], function ( logic_new_func_x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 );
            return hoisted_44_1[1 + (hoisted_42_1[1 + REM_INT( deduped_1_2, deduped_74_1 )] + REM_INT( QUO_INT( deduped_1_2, deduped_74_1 ), deduped_50_1 ) * deduped_40_1)];
        end );
    hoisted_36_1 := List( [ 0 .. deduped_47_1 * deduped_49_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_67_1 ^ QUO_INT( i_2, deduped_47_1 ) ), deduped_67_1 );
        end );
    hoisted_32_1 := List( deduped_46_1, function ( i_2 )
            return REM_INT( i_2, deduped_5_1 );
        end );
    hoisted_34_1 := List( deduped_63_1, function ( logic_new_func_x_2 )
            return hoisted_32_1[1 + deduped_31_1[(1 + deduped_30_1[(1 + logic_new_func_x_2)])]];
        end );
    hoisted_37_1 := List( [ 0 .. deduped_74_1 * deduped_49_1 - 1 ], function ( logic_new_func_x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 );
            return hoisted_36_1[1 + (hoisted_34_1[1 + REM_INT( deduped_1_2, deduped_74_1 )] + REM_INT( QUO_INT( deduped_1_2, deduped_74_1 ), deduped_49_1 ) * deduped_5_1)];
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, DefiningPairOfQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( [ 0 .. deduped_49_1 - 1 ], function ( i_2 )
                return hoisted_37_1[1 + i_2];
            end ), List( [ 0 .. deduped_50_1 - 1 ], function ( i_2 )
                return hoisted_45_1[1 + i_2];
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, hoisted_14_1, hoisted_17_1, hoisted_18_1, deduped_19_1, hoisted_20_1, deduped_21_1, hoisted_23_1, hoisted_25_1, hoisted_26_1, deduped_31_1, hoisted_33_1, hoisted_34_1, deduped_38_1, hoisted_40_1, hoisted_41_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1, deduped_68_1, deduped_69_1, deduped_70_1, deduped_71_1, deduped_72_1, deduped_73_1, deduped_74_1, deduped_75_1, deduped_76_1, deduped_77_1, deduped_78_1, deduped_79_1, deduped_80_1;
    deduped_80_1 := [ 3 ];
    deduped_79_1 := [ 2 ];
    deduped_78_1 := [ 1 ];
    deduped_77_1 := [ 0 ];
    deduped_76_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_75_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_74_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_73_1 := deduped_76_1[3];
    deduped_72_1 := CreateCapCategoryObjectWithAttributes( deduped_75_1, Length, 4 );
    deduped_71_1 := deduped_74_1[3];
    deduped_70_1 := deduped_76_1[2];
    deduped_69_1 := deduped_76_1[1];
    deduped_68_1 := deduped_74_1[2];
    deduped_67_1 := CreateCapCategoryObjectWithAttributes( deduped_75_1, Length, 2 );
    deduped_66_1 := CreateCapCategoryObjectWithAttributes( deduped_75_1, Length, BigInt( 1 ) );
    deduped_65_1 := deduped_74_1[1];
    deduped_64_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_63_1 := [ 0 .. deduped_68_1 - 1 ];
    deduped_62_1 := CreateCapCategoryObjectWithAttributes( deduped_64_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_75_1, deduped_66_1, deduped_67_1, AsList, deduped_78_1 ) );
    deduped_61_1 := CreateCapCategoryObjectWithAttributes( deduped_64_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_75_1, deduped_66_1, deduped_67_1, AsList, deduped_77_1 ) );
    deduped_60_1 := Length( deduped_63_1 );
    deduped_59_1 := CreateCapCategoryMorphismWithAttributes( deduped_64_1, deduped_61_1, deduped_62_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_75_1, deduped_66_1, deduped_72_1, AsList, deduped_79_1 ) );
    deduped_58_1 := CreateCapCategoryMorphismWithAttributes( deduped_64_1, deduped_61_1, deduped_62_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_75_1, deduped_66_1, deduped_72_1, AsList, deduped_78_1 ) );
    deduped_57_1 := ListWithIdenticalEntries( deduped_68_1, deduped_62_1 );
    deduped_56_1 := ListWithIdenticalEntries( deduped_65_1, deduped_61_1 );
    deduped_55_1 := List( ListOfValues( [ CreateCapCategoryObjectWithAttributes( deduped_75_1, Length, deduped_65_1 ), CreateCapCategoryObjectWithAttributes( deduped_75_1, Length, deduped_68_1 ) ] ), Length );
    deduped_2_1 := [ deduped_69_1, deduped_70_1 ];
    deduped_1_1 := [ deduped_61_1, deduped_62_1 ];
    deduped_50_1 := Concatenation( List( deduped_56_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ), List( deduped_57_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ) );
    deduped_45_1 := [ 0 .. Product( deduped_50_1 ) - 1 ];
    deduped_54_1 := List( deduped_63_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := logic_new_func_x_2 + deduped_65_1;
            hoisted_2_2 := deduped_50_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_50_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_45_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_53_1 := [ 0 .. deduped_60_1 + deduped_60_1 - 1 ];
    deduped_52_1 := deduped_55_1[2];
    deduped_51_1 := deduped_55_1[1];
    deduped_49_1 := deduped_70_1 ^ deduped_52_1;
    deduped_48_1 := deduped_69_1 ^ deduped_51_1;
    deduped_47_1 := [ 0 .. deduped_52_1 - 1 ];
    deduped_46_1 := [ 0 .. deduped_51_1 - 1 ];
    hoisted_25_1 := Concatenation( deduped_54_1, deduped_54_1 );
    deduped_12_1 := [ List( deduped_73_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_73_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_11_1 := [ deduped_58_1, deduped_59_1 ];
    deduped_8_1 := [ deduped_77_1, deduped_78_1, deduped_79_1, deduped_80_1 ];
    deduped_7_1 := [ deduped_77_1, deduped_78_1, deduped_78_1, deduped_78_1 ];
    deduped_6_1 := [ deduped_77_1, deduped_77_1, deduped_77_1, deduped_78_1 ];
    deduped_5_1 := [ 0, 3 ];
    hoisted_23_1 := Concatenation( List( ListWithIdenticalEntries( deduped_68_1, deduped_58_1 ), function ( logic_new_func_x_2 )
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
          end ), List( ListWithIdenticalEntries( deduped_68_1, deduped_59_1 ), function ( logic_new_func_x_2 )
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
    hoisted_26_1 := List( deduped_53_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_23_1[deduped_3_2];
            hoisted_1_2 := hoisted_25_1[deduped_3_2];
            return List( deduped_45_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_19_1 := Concatenation( deduped_56_1, deduped_57_1 );
    deduped_13_1 := List( deduped_71_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_3_1 := List( deduped_71_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_20_1 := Concatenation( List( deduped_63_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_19_1[1 + deduped_3_1[(1 + logic_new_func_x_2)]] )];
          end ), List( deduped_63_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, deduped_19_1[1 + deduped_13_1[(1 + logic_new_func_x_2)]] )];
          end ) );
    deduped_21_1 := List( deduped_53_1, function ( j_2 )
            return Product( hoisted_20_1{[ 1 .. j_2 ]} );
        end );
    hoisted_17_1 := Concatenation( List( deduped_63_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_3_1[1 + logic_new_func_x_2];
              hoisted_2_2 := deduped_50_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_50_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_45_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_63_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_13_1[1 + logic_new_func_x_2];
              hoisted_2_2 := deduped_50_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_50_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_45_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    deduped_10_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_64_1, deduped_61_1, deduped_61_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_75_1, deduped_66_1, deduped_72_1, AsList, deduped_77_1 ) ), deduped_58_1, deduped_59_1, CreateCapCategoryMorphismWithAttributes( deduped_64_1, deduped_62_1, deduped_62_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_75_1, deduped_66_1, deduped_72_1, AsList, deduped_80_1 ) ) ];
    deduped_9_1 := [ deduped_61_1, deduped_61_1, deduped_61_1, deduped_62_1 ];
    deduped_4_1 := Concatenation( List( deduped_56_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ), List( deduped_57_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    hoisted_14_1 := Concatenation( List( deduped_63_1, function ( logic_new_func_x_2 )
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
          end ), List( deduped_63_1, function ( logic_new_func_x_2 )
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
    hoisted_18_1 := List( deduped_53_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_14_1[deduped_3_2];
            hoisted_1_2 := hoisted_17_1[deduped_3_2];
            return List( deduped_45_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_44_1 := Filtered( deduped_45_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return Sum( deduped_53_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_18_1[deduped_1_3][deduped_1_2] * deduped_21_1[deduped_1_3];
                  end ) = Sum( deduped_53_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_26_1[deduped_1_3][deduped_1_2] * deduped_21_1[deduped_1_3];
                  end );
        end );
    deduped_43_1 := Length( deduped_44_1 );
    hoisted_41_1 := List( [ 0 .. deduped_49_1 * deduped_52_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_70_1 ^ QUO_INT( i_2, deduped_49_1 ) ), deduped_70_1 );
        end );
    hoisted_40_1 := List( deduped_47_1, function ( logic_new_func_x_2 )
            return REM_INT( logic_new_func_x_2, deduped_52_1 );
        end );
    deduped_38_1 := Product( deduped_50_1{[ 1 + deduped_51_1 .. Sum( deduped_55_1{[ 1, 2 ]} ) ]} );
    hoisted_34_1 := List( [ 0 .. deduped_48_1 * deduped_51_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_69_1 ^ QUO_INT( i_2, deduped_48_1 ) ), deduped_69_1 );
        end );
    hoisted_33_1 := List( deduped_46_1, function ( logic_new_func_x_2 )
            return REM_INT( logic_new_func_x_2, deduped_51_1 );
        end );
    deduped_31_1 := Product( deduped_50_1{[ 1 .. deduped_51_1 ]} );
    return List( [ 0 .. deduped_43_1 - 1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
            deduped_4_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 );
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_44_1[1 + REM_INT( QUO_INT( deduped_4_2, deduped_43_1 ^ QUO_INT( deduped_4_2, deduped_43_1 ) ), deduped_43_1 )] );
            hoisted_2_2 := REM_INT( QUO_INT( deduped_3_2, deduped_31_1 ), deduped_38_1 );
            hoisted_1_2 := REM_INT( deduped_3_2, deduped_31_1 );
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( deduped_46_1, function ( logic_new_func_x_3 )
                        return hoisted_34_1[1 + (hoisted_1_2 + hoisted_33_1[(1 + logic_new_func_x_3)] * deduped_31_1)];
                    end ), List( deduped_47_1, function ( logic_new_func_x_3 )
                        return hoisted_41_1[1 + (hoisted_2_2 + hoisted_40_1[(1 + logic_new_func_x_3)] * deduped_38_1)];
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
