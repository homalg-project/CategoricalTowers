# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_FinBouquetsPrecompiled", function ( cat )
    
    ##
    AddInitialObject( cat,
        
########
function ( cat_1 )
    local deduped_1_1;
    deduped_1_1 := BigInt( 0 );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfBouquetEnrichedOverSkeletalFinSets, NTuple( 3, deduped_1_1, deduped_1_1, [  ] ) );
end
########
        
    , 100 );
    
    ##
    AddCoproduct( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_3_1, deduped_4_1;
    deduped_4_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( logic_new_func_x_2 )[2];
        end );
    deduped_3_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( logic_new_func_x_2 )[1];
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfBouquetEnrichedOverSkeletalFinSets, NTuple( 3, Sum( deduped_3_1 ), Sum( deduped_4_1 ), Concatenation( List( [ 1 .. Length( arg2_1 ) ], function ( logic_new_func_x_2 )
                  local hoisted_1_2, hoisted_2_2, deduped_3_2;
                  deduped_3_2 := Sum( deduped_3_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
                  hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_3_1[logic_new_func_x_2] - 1 ];
                  hoisted_1_2 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( CAP_JIT_INCOMPLETE_LOGIC( arg2_1[logic_new_func_x_2] ) )[3];
                  return List( [ 0 .. deduped_4_1[logic_new_func_x_2] - 1 ], function ( i_3 )
                          return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                      end );
              end ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddInjectionOfCofactorOfCoproductWithGivenCoproduct( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := [ 1 .. k_1 - 1 ];
    deduped_4_1 := List( objects_1, function ( logic_new_func_x_2 )
            return DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( logic_new_func_x_2 )[2];
        end );
    deduped_3_1 := List( objects_1, function ( logic_new_func_x_2 )
            return DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( logic_new_func_x_2 )[1];
        end );
    deduped_2_1 := Sum( deduped_4_1{deduped_5_1} );
    deduped_1_1 := Sum( deduped_3_1{deduped_5_1} );
    return CreateCapCategoryMorphismWithAttributes( cat_1, objects_1[k_1], P_1, DefiningPairOfBouquetMorphismEnrichedOverSkeletalFinSets, NTuple( 2, [ deduped_1_1 .. deduped_1_1 + deduped_3_1[k_1] - 1 ], [ deduped_2_1 .. deduped_2_1 + deduped_4_1[k_1] - 1 ] ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromCoproductWithGivenCoproduct( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, DefiningPairOfBouquetMorphismEnrichedOverSkeletalFinSets, NTuple( 2, Concatenation( List( tau_1, function ( logic_new_func_x_2 )
                  return DefiningPairOfBouquetMorphismEnrichedOverSkeletalFinSets( logic_new_func_x_2 )[1];
              end ) ), Concatenation( List( tau_1, function ( logic_new_func_x_2 )
                  return DefiningPairOfBouquetMorphismEnrichedOverSkeletalFinSets( logic_new_func_x_2 )[2];
              end ) ) ) );
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
    local deduped_1_1, deduped_2_1, deduped_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, hoisted_9_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, deduped_15_1, hoisted_17_1, hoisted_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1;
    deduped_38_1 := [ 1 ];
    deduped_37_1 := [ 0 ];
    deduped_36_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_35_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_34_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_33_1 := deduped_36_1[3];
    deduped_32_1 := deduped_35_1[2];
    deduped_31_1 := CreateCapCategoryObjectWithAttributes( deduped_34_1, Length, 2 );
    deduped_30_1 := CreateCapCategoryObjectWithAttributes( deduped_34_1, Length, BigInt( 1 ) );
    deduped_29_1 := deduped_35_1[1];
    deduped_28_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_27_1 := [ 0 .. deduped_32_1 - 1 ];
    deduped_26_1 := CreateCapCategoryObjectWithAttributes( deduped_28_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_34_1, deduped_30_1, deduped_31_1, AsList, deduped_38_1 ) );
    deduped_25_1 := CreateCapCategoryObjectWithAttributes( deduped_28_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_34_1, deduped_30_1, deduped_31_1, AsList, deduped_37_1 ) );
    deduped_24_1 := ListWithIdenticalEntries( deduped_32_1, deduped_26_1 );
    deduped_23_1 := ListWithIdenticalEntries( deduped_29_1, deduped_25_1 );
    deduped_22_1 := [ 0 .. Length( deduped_27_1 ) - 1 ];
    deduped_2_1 := [ deduped_36_1[1], deduped_36_1[2] ];
    deduped_1_1 := [ deduped_25_1, deduped_26_1 ];
    deduped_21_1 := Concatenation( List( deduped_23_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ), List( deduped_24_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ) );
    deduped_20_1 := [ 0 .. Product( deduped_21_1 ) - 1 ];
    deduped_8_1 := [ deduped_37_1, deduped_38_1, [ 2 ] ];
    deduped_7_1 := [ deduped_37_1, deduped_38_1, deduped_38_1 ];
    deduped_6_1 := [ deduped_37_1, deduped_37_1, deduped_38_1 ];
    deduped_5_1 := [ 0, 2 ];
    hoisted_17_1 := List( ListWithIdenticalEntries( deduped_32_1, CreateCapCategoryMorphismWithAttributes( deduped_28_1, deduped_25_1, deduped_26_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_34_1, deduped_30_1, CreateCapCategoryObjectWithAttributes( deduped_34_1, Length, 3 ), AsList, deduped_38_1 ) ) ), function ( logic_new_func_x_2 )
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
                return deduped_33_1;
            fi;
            return;
        end );
    hoisted_19_1 := List( deduped_22_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2;
            deduped_4_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 ) + deduped_29_1;
            hoisted_3_2 := hoisted_17_1[1 + logic_new_func_x_2];
            hoisted_2_2 := deduped_21_1[1 + deduped_4_2];
            hoisted_1_2 := Product( deduped_21_1{[ 1 .. deduped_4_2 ]} );
            return List( deduped_20_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    hoisted_13_1 := Concatenation( deduped_23_1, deduped_24_1 );
    deduped_3_1 := deduped_35_1[3];
    hoisted_14_1 := List( deduped_27_1, function ( logic_new_func_x_2 )
            return deduped_2_1[SafePosition( deduped_1_1, hoisted_13_1[1 + deduped_3_1[(1 + logic_new_func_x_2)]] )];
        end );
    deduped_15_1 := List( deduped_22_1, function ( j_2 )
            return Product( hoisted_14_1{[ 1 .. j_2 ]} );
        end );
    hoisted_9_1 := [ deduped_25_1, deduped_25_1, deduped_26_1 ];
    hoisted_4_1 := Concatenation( List( deduped_23_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ), List( deduped_24_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    hoisted_12_1 := List( deduped_22_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
            deduped_8_2 := deduped_3_1[1 + CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 )];
            deduped_7_2 := 1 + deduped_8_2;
            deduped_6_2 := 1 + deduped_5_1[(1 + hoisted_4_1[deduped_7_2][1])];
            deduped_5_2 := deduped_6_1[deduped_6_2];
            deduped_4_2 := 1 + deduped_5_1[(1 + deduped_5_2[1])];
            if IdFunc( function (  )
                        if deduped_5_2 = deduped_6_1[deduped_4_2] and deduped_7_1[deduped_6_2] = deduped_7_1[deduped_4_2] then
                            return deduped_8_1[deduped_6_2] = deduped_8_1[deduped_4_2];
                        else
                            return false;
                        fi;
                        return;
                    end )(  ) then
                hoisted_3_2 := [ 0 .. deduped_2_1[SafePosition( deduped_1_1, hoisted_9_1[deduped_6_2] )] - 1 ];
            else
                hoisted_3_2 := deduped_33_1;
            fi;
            hoisted_2_2 := deduped_21_1[deduped_7_2];
            hoisted_1_2 := Product( deduped_21_1{[ 1 .. deduped_8_2 ]} );
            return List( deduped_20_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( deduped_34_1, Length, Length( Filtered( deduped_20_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return Sum( deduped_22_1, function ( j_3 )
                          local deduped_1_3;
                          deduped_1_3 := 1 + j_3;
                          return hoisted_12_1[deduped_1_3][deduped_1_2] * deduped_15_1[deduped_1_3];
                      end ) = Sum( deduped_22_1, function ( j_3 )
                          local deduped_1_3;
                          deduped_1_3 := 1 + j_3;
                          return hoisted_19_1[deduped_1_3][deduped_1_2] * deduped_15_1[deduped_1_3];
                      end );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, hoisted_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, hoisted_12_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, deduped_18_1, hoisted_20_1, hoisted_22_1, deduped_23_1, deduped_24_1, hoisted_25_1, hoisted_27_1, hoisted_29_1, hoisted_30_1, deduped_33_1, hoisted_34_1, hoisted_35_1, hoisted_37_1, hoisted_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1;
    deduped_66_1 := [ 1 ];
    deduped_65_1 := [ 0 ];
    deduped_64_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( range_1 );
    deduped_63_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( source_1 );
    deduped_62_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_61_1 := Length( Source( alpha_1 ) );
    deduped_60_1 := deduped_64_1[3];
    deduped_59_1 := deduped_64_1[2];
    deduped_58_1 := CreateCapCategoryObjectWithAttributes( deduped_62_1, Length, 2 );
    deduped_57_1 := CreateCapCategoryObjectWithAttributes( deduped_62_1, Length, BigInt( 1 ) );
    deduped_56_1 := deduped_64_1[1];
    deduped_55_1 := deduped_63_1[2];
    deduped_54_1 := deduped_63_1[1];
    deduped_53_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_52_1 := [ 0 .. deduped_61_1 - 1 ];
    deduped_51_1 := [ 0 .. deduped_55_1 - 1 ];
    deduped_50_1 := CreateCapCategoryObjectWithAttributes( deduped_53_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_62_1, deduped_57_1, deduped_58_1, AsList, deduped_66_1 ) );
    deduped_49_1 := CreateCapCategoryObjectWithAttributes( deduped_53_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_62_1, deduped_57_1, deduped_58_1, AsList, deduped_65_1 ) );
    deduped_48_1 := ListWithIdenticalEntries( deduped_55_1, deduped_50_1 );
    deduped_47_1 := ListWithIdenticalEntries( deduped_54_1, deduped_49_1 );
    deduped_46_1 := [ 0 .. Length( deduped_51_1 ) - 1 ];
    deduped_45_1 := List( ListOfValues( [ CreateCapCategoryObjectWithAttributes( deduped_62_1, Length, deduped_54_1 ), CreateCapCategoryObjectWithAttributes( deduped_62_1, Length, deduped_55_1 ) ] ), Length );
    deduped_4_1 := [ deduped_56_1, deduped_59_1 ];
    deduped_3_1 := [ deduped_49_1, deduped_50_1 ];
    deduped_44_1 := Concatenation( List( deduped_47_1, function ( logic_new_func_x_2 )
              return deduped_4_1[SafePosition( deduped_3_1, logic_new_func_x_2 )];
          end ), List( deduped_48_1, function ( logic_new_func_x_2 )
              return deduped_4_1[SafePosition( deduped_3_1, logic_new_func_x_2 )];
          end ) );
    deduped_43_1 := deduped_45_1[2];
    deduped_42_1 := deduped_45_1[1];
    deduped_41_1 := deduped_59_1 ^ deduped_43_1;
    deduped_40_1 := deduped_56_1 ^ deduped_42_1;
    deduped_39_1 := [ 0 .. Product( deduped_44_1 ) - 1 ];
    hoisted_37_1 := List( [ 0 .. deduped_41_1 * deduped_43_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_59_1 ^ QUO_INT( i_2, deduped_41_1 ) ), deduped_59_1 );
        end );
    deduped_33_1 := Product( deduped_44_1{[ 1 + deduped_42_1 .. Sum( deduped_45_1{[ 1, 2 ]} ) ]} );
    deduped_5_1 := Product( deduped_44_1{[ 1 .. deduped_42_1 ]} );
    hoisted_34_1 := List( deduped_39_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_5_1 ), deduped_33_1 );
        end );
    deduped_11_1 := [ deduped_65_1, deduped_66_1, [ 2 ] ];
    deduped_10_1 := [ deduped_65_1, deduped_66_1, deduped_66_1 ];
    deduped_9_1 := [ deduped_65_1, deduped_65_1, deduped_66_1 ];
    deduped_8_1 := [ 0, 2 ];
    hoisted_20_1 := List( ListWithIdenticalEntries( deduped_55_1, CreateCapCategoryMorphismWithAttributes( deduped_53_1, deduped_49_1, deduped_50_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_62_1, deduped_57_1, CreateCapCategoryObjectWithAttributes( deduped_62_1, Length, 3 ), AsList, deduped_66_1 ) ) ), function ( logic_new_func_x_2 )
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
                return deduped_60_1;
            fi;
            return;
        end );
    hoisted_22_1 := List( deduped_46_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2;
            deduped_4_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 ) + deduped_54_1;
            hoisted_3_2 := hoisted_20_1[1 + logic_new_func_x_2];
            hoisted_2_2 := deduped_44_1[1 + deduped_4_2];
            hoisted_1_2 := Product( deduped_44_1{[ 1 .. deduped_4_2 ]} );
            return List( deduped_39_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    hoisted_16_1 := Concatenation( deduped_47_1, deduped_48_1 );
    deduped_6_1 := deduped_63_1[3];
    hoisted_17_1 := List( deduped_51_1, function ( logic_new_func_x_2 )
            return deduped_4_1[SafePosition( deduped_3_1, hoisted_16_1[1 + deduped_6_1[(1 + logic_new_func_x_2)]] )];
        end );
    deduped_18_1 := List( deduped_46_1, function ( j_2 )
            return Product( hoisted_17_1{[ 1 .. j_2 ]} );
        end );
    hoisted_12_1 := [ deduped_49_1, deduped_49_1, deduped_50_1 ];
    hoisted_7_1 := Concatenation( List( deduped_47_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ), List( deduped_48_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    hoisted_15_1 := List( deduped_46_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
            deduped_8_2 := deduped_6_1[1 + CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 )];
            deduped_7_2 := 1 + deduped_8_2;
            deduped_6_2 := 1 + deduped_8_1[(1 + hoisted_7_1[deduped_7_2][1])];
            deduped_5_2 := deduped_9_1[deduped_6_2];
            deduped_4_2 := 1 + deduped_8_1[(1 + deduped_5_2[1])];
            if IdFunc( function (  )
                        if deduped_5_2 = deduped_9_1[deduped_4_2] and deduped_10_1[deduped_6_2] = deduped_10_1[deduped_4_2] then
                            return deduped_11_1[deduped_6_2] = deduped_11_1[deduped_4_2];
                        else
                            return false;
                        fi;
                        return;
                    end )(  ) then
                hoisted_3_2 := [ 0 .. deduped_4_1[SafePosition( deduped_3_1, hoisted_12_1[deduped_6_2] )] - 1 ];
            else
                hoisted_3_2 := deduped_60_1;
            fi;
            hoisted_2_2 := deduped_44_1[deduped_7_2];
            hoisted_1_2 := Product( deduped_44_1{[ 1 .. deduped_8_2 ]} );
            return List( deduped_39_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    deduped_24_1 := Filtered( deduped_39_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return Sum( deduped_46_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_15_1[deduped_1_3][deduped_1_2] * deduped_18_1[deduped_1_3];
                  end ) = Sum( deduped_46_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_22_1[deduped_1_3][deduped_1_2] * deduped_18_1[deduped_1_3];
                  end );
        end );
    deduped_23_1 := AsList( alpha_1 );
    hoisted_35_1 := List( deduped_52_1, function ( logic_new_func_x_2 )
            return hoisted_34_1[1 + deduped_24_1[(1 + deduped_23_1[(1 + logic_new_func_x_2)])]];
        end );
    hoisted_38_1 := List( [ 0 .. deduped_61_1 * deduped_43_1 - 1 ], function ( logic_new_func_x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 );
            return hoisted_37_1[1 + (hoisted_35_1[1 + REM_INT( deduped_1_2, deduped_61_1 )] + REM_INT( QUO_INT( deduped_1_2, deduped_61_1 ), deduped_43_1 ) * deduped_33_1)];
        end );
    hoisted_29_1 := List( [ 0 .. deduped_40_1 * deduped_42_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_56_1 ^ QUO_INT( i_2, deduped_40_1 ) ), deduped_56_1 );
        end );
    hoisted_25_1 := List( deduped_39_1, function ( i_2 )
            return REM_INT( i_2, deduped_5_1 );
        end );
    hoisted_27_1 := List( deduped_52_1, function ( logic_new_func_x_2 )
            return hoisted_25_1[1 + deduped_24_1[(1 + deduped_23_1[(1 + logic_new_func_x_2)])]];
        end );
    hoisted_30_1 := List( [ 0 .. deduped_61_1 * deduped_42_1 - 1 ], function ( logic_new_func_x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 );
            return hoisted_29_1[1 + (hoisted_27_1[1 + REM_INT( deduped_1_2, deduped_61_1 )] + REM_INT( QUO_INT( deduped_1_2, deduped_61_1 ), deduped_42_1 ) * deduped_5_1)];
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, DefiningPairOfBouquetMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( [ 0 .. deduped_42_1 - 1 ], function ( i_2 )
                return hoisted_30_1[1 + i_2];
            end ), List( [ 0 .. deduped_43_1 - 1 ], function ( i_2 )
                return hoisted_38_1[1 + i_2];
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, hoisted_9_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, deduped_15_1, hoisted_17_1, hoisted_19_1, deduped_24_1, hoisted_26_1, hoisted_27_1, deduped_31_1, hoisted_33_1, hoisted_34_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1;
    deduped_65_1 := [ 1 ];
    deduped_64_1 := [ 0 ];
    deduped_63_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_62_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_61_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_60_1 := deduped_63_1[3];
    deduped_59_1 := deduped_63_1[2];
    deduped_58_1 := deduped_63_1[1];
    deduped_57_1 := deduped_61_1[2];
    deduped_56_1 := CreateCapCategoryObjectWithAttributes( deduped_62_1, Length, 2 );
    deduped_55_1 := CreateCapCategoryObjectWithAttributes( deduped_62_1, Length, BigInt( 1 ) );
    deduped_54_1 := deduped_61_1[1];
    deduped_53_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_52_1 := [ 0 .. deduped_57_1 - 1 ];
    deduped_51_1 := CreateCapCategoryObjectWithAttributes( deduped_53_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_62_1, deduped_55_1, deduped_56_1, AsList, deduped_65_1 ) );
    deduped_50_1 := CreateCapCategoryObjectWithAttributes( deduped_53_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_62_1, deduped_55_1, deduped_56_1, AsList, deduped_64_1 ) );
    deduped_49_1 := ListWithIdenticalEntries( deduped_57_1, deduped_51_1 );
    deduped_48_1 := ListWithIdenticalEntries( deduped_54_1, deduped_50_1 );
    deduped_47_1 := [ 0 .. Length( deduped_52_1 ) - 1 ];
    deduped_46_1 := List( ListOfValues( [ CreateCapCategoryObjectWithAttributes( deduped_62_1, Length, deduped_54_1 ), CreateCapCategoryObjectWithAttributes( deduped_62_1, Length, deduped_57_1 ) ] ), Length );
    deduped_45_1 := deduped_46_1[2];
    deduped_44_1 := deduped_46_1[1];
    deduped_2_1 := [ deduped_58_1, deduped_59_1 ];
    deduped_1_1 := [ deduped_50_1, deduped_51_1 ];
    deduped_43_1 := Concatenation( List( deduped_48_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ), List( deduped_49_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ) );
    deduped_42_1 := deduped_59_1 ^ deduped_45_1;
    deduped_41_1 := deduped_58_1 ^ deduped_44_1;
    deduped_40_1 := [ 0 .. deduped_45_1 - 1 ];
    deduped_39_1 := [ 0 .. deduped_44_1 - 1 ];
    deduped_38_1 := [ 0 .. Product( deduped_43_1 ) - 1 ];
    deduped_8_1 := [ deduped_64_1, deduped_65_1, [ 2 ] ];
    deduped_7_1 := [ deduped_64_1, deduped_65_1, deduped_65_1 ];
    deduped_6_1 := [ deduped_64_1, deduped_64_1, deduped_65_1 ];
    deduped_5_1 := [ 0, 2 ];
    hoisted_17_1 := List( ListWithIdenticalEntries( deduped_57_1, CreateCapCategoryMorphismWithAttributes( deduped_53_1, deduped_50_1, deduped_51_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_62_1, deduped_55_1, CreateCapCategoryObjectWithAttributes( deduped_62_1, Length, 3 ), AsList, deduped_65_1 ) ) ), function ( logic_new_func_x_2 )
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
                return deduped_60_1;
            fi;
            return;
        end );
    hoisted_19_1 := List( deduped_47_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2;
            deduped_4_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 ) + deduped_54_1;
            hoisted_3_2 := hoisted_17_1[1 + logic_new_func_x_2];
            hoisted_2_2 := deduped_43_1[1 + deduped_4_2];
            hoisted_1_2 := Product( deduped_43_1{[ 1 .. deduped_4_2 ]} );
            return List( deduped_38_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    hoisted_13_1 := Concatenation( deduped_48_1, deduped_49_1 );
    deduped_3_1 := deduped_61_1[3];
    hoisted_14_1 := List( deduped_52_1, function ( logic_new_func_x_2 )
            return deduped_2_1[SafePosition( deduped_1_1, hoisted_13_1[1 + deduped_3_1[(1 + logic_new_func_x_2)]] )];
        end );
    deduped_15_1 := List( deduped_47_1, function ( j_2 )
            return Product( hoisted_14_1{[ 1 .. j_2 ]} );
        end );
    hoisted_9_1 := [ deduped_50_1, deduped_50_1, deduped_51_1 ];
    hoisted_4_1 := Concatenation( List( deduped_48_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ), List( deduped_49_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    hoisted_12_1 := List( deduped_47_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
            deduped_8_2 := deduped_3_1[1 + CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 )];
            deduped_7_2 := 1 + deduped_8_2;
            deduped_6_2 := 1 + deduped_5_1[(1 + hoisted_4_1[deduped_7_2][1])];
            deduped_5_2 := deduped_6_1[deduped_6_2];
            deduped_4_2 := 1 + deduped_5_1[(1 + deduped_5_2[1])];
            if IdFunc( function (  )
                        if deduped_5_2 = deduped_6_1[deduped_4_2] and deduped_7_1[deduped_6_2] = deduped_7_1[deduped_4_2] then
                            return deduped_8_1[deduped_6_2] = deduped_8_1[deduped_4_2];
                        else
                            return false;
                        fi;
                        return;
                    end )(  ) then
                hoisted_3_2 := [ 0 .. deduped_2_1[SafePosition( deduped_1_1, hoisted_9_1[deduped_6_2] )] - 1 ];
            else
                hoisted_3_2 := deduped_60_1;
            fi;
            hoisted_2_2 := deduped_43_1[deduped_7_2];
            hoisted_1_2 := Product( deduped_43_1{[ 1 .. deduped_8_2 ]} );
            return List( deduped_38_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    deduped_37_1 := Filtered( deduped_38_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return Sum( deduped_47_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_12_1[deduped_1_3][deduped_1_2] * deduped_15_1[deduped_1_3];
                  end ) = Sum( deduped_47_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_19_1[deduped_1_3][deduped_1_2] * deduped_15_1[deduped_1_3];
                  end );
        end );
    deduped_36_1 := Length( deduped_37_1 );
    hoisted_34_1 := List( [ 0 .. deduped_42_1 * deduped_45_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_59_1 ^ QUO_INT( i_2, deduped_42_1 ) ), deduped_59_1 );
        end );
    hoisted_33_1 := List( deduped_40_1, function ( logic_new_func_x_2 )
            return REM_INT( logic_new_func_x_2, deduped_45_1 );
        end );
    deduped_31_1 := Product( deduped_43_1{[ 1 + deduped_44_1 .. Sum( deduped_46_1{[ 1, 2 ]} ) ]} );
    hoisted_27_1 := List( [ 0 .. deduped_41_1 * deduped_44_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_58_1 ^ QUO_INT( i_2, deduped_41_1 ) ), deduped_58_1 );
        end );
    hoisted_26_1 := List( deduped_39_1, function ( logic_new_func_x_2 )
            return REM_INT( logic_new_func_x_2, deduped_44_1 );
        end );
    deduped_24_1 := Product( deduped_43_1{[ 1 .. deduped_44_1 ]} );
    return List( [ 0 .. deduped_36_1 - 1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
            deduped_4_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 );
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_37_1[1 + REM_INT( QUO_INT( deduped_4_2, deduped_36_1 ^ QUO_INT( deduped_4_2, deduped_36_1 ) ), deduped_36_1 )] );
            hoisted_2_2 := REM_INT( QUO_INT( deduped_3_2, deduped_24_1 ), deduped_31_1 );
            hoisted_1_2 := REM_INT( deduped_3_2, deduped_24_1 );
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfBouquetMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( deduped_39_1, function ( logic_new_func_x_3 )
                        return hoisted_27_1[1 + (hoisted_1_2 + hoisted_26_1[(1 + logic_new_func_x_3)] * deduped_24_1)];
                    end ), List( deduped_40_1, function ( logic_new_func_x_3 )
                        return hoisted_34_1[1 + (hoisted_2_2 + hoisted_33_1[(1 + logic_new_func_x_3)] * deduped_31_1)];
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

BindGlobal( "FinBouquetsPrecompiled", function (  )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function (  )
    return CategoryOfBouquetsEnrichedOver( CategoryOfSkeletalFinSets(  : FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_FinBouquetsPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
