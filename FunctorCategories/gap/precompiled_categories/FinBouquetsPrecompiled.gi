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
    local deduped_1_1, deduped_2_1, deduped_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, hoisted_9_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, deduped_15_1, hoisted_17_1, hoisted_19_1, hoisted_21_1, hoisted_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1;
    deduped_48_1 := [ 1 ];
    deduped_47_1 := [ 0 ];
    deduped_46_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( range_1 );
    deduped_45_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( source_1 );
    deduped_44_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_43_1 := deduped_46_1[3];
    deduped_42_1 := deduped_46_1[2];
    deduped_41_1 := deduped_46_1[1];
    deduped_40_1 := CreateCapCategoryObjectWithAttributes( deduped_44_1, Length, 2 );
    deduped_39_1 := CreateCapCategoryObjectWithAttributes( deduped_44_1, Length, BigInt( 1 ) );
    deduped_38_1 := deduped_45_1[2];
    deduped_37_1 := deduped_45_1[1];
    deduped_36_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_35_1 := [ 0 .. deduped_38_1 - 1 ];
    deduped_34_1 := CreateCapCategoryObjectWithAttributes( deduped_36_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_44_1, deduped_39_1, deduped_40_1, AsList, deduped_48_1 ) );
    deduped_33_1 := CreateCapCategoryObjectWithAttributes( deduped_36_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_44_1, deduped_39_1, deduped_40_1, AsList, deduped_47_1 ) );
    deduped_32_1 := ListWithIdenticalEntries( deduped_38_1, deduped_34_1 );
    deduped_31_1 := ListWithIdenticalEntries( deduped_37_1, deduped_33_1 );
    deduped_30_1 := [ 0 .. Length( deduped_35_1 ) - 1 ];
    deduped_29_1 := List( ListOfValues( [ CreateCapCategoryObjectWithAttributes( deduped_44_1, Length, deduped_37_1 ), CreateCapCategoryObjectWithAttributes( deduped_44_1, Length, deduped_38_1 ) ] ), Length );
    deduped_2_1 := [ deduped_41_1, deduped_42_1 ];
    deduped_1_1 := [ deduped_33_1, deduped_34_1 ];
    deduped_28_1 := Concatenation( List( deduped_31_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ), List( deduped_32_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ) );
    deduped_27_1 := deduped_29_1[1];
    deduped_26_1 := [ 0 .. Product( deduped_28_1 ) - 1 ];
    deduped_25_1 := Product( deduped_28_1{[ 1 .. deduped_27_1 ]} );
    deduped_8_1 := [ deduped_47_1, deduped_48_1, [ 2 ] ];
    deduped_7_1 := [ deduped_47_1, deduped_48_1, deduped_48_1 ];
    deduped_6_1 := [ deduped_47_1, deduped_47_1, deduped_48_1 ];
    deduped_5_1 := [ 0, 2 ];
    hoisted_17_1 := List( ListWithIdenticalEntries( deduped_38_1, CreateCapCategoryMorphismWithAttributes( deduped_36_1, deduped_33_1, deduped_34_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_44_1, deduped_39_1, CreateCapCategoryObjectWithAttributes( deduped_44_1, Length, 3 ), AsList, deduped_48_1 ) ) ), function ( logic_new_func_x_2 )
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
                return deduped_43_1;
            fi;
            return;
        end );
    hoisted_19_1 := List( deduped_30_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2;
            deduped_4_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 ) + deduped_37_1;
            hoisted_3_2 := hoisted_17_1[1 + logic_new_func_x_2];
            hoisted_2_2 := deduped_28_1[1 + deduped_4_2];
            hoisted_1_2 := Product( deduped_28_1{[ 1 .. deduped_4_2 ]} );
            return List( deduped_26_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    hoisted_13_1 := Concatenation( deduped_31_1, deduped_32_1 );
    deduped_3_1 := deduped_45_1[3];
    hoisted_14_1 := List( deduped_35_1, function ( logic_new_func_x_2 )
            return deduped_2_1[SafePosition( deduped_1_1, hoisted_13_1[1 + deduped_3_1[(1 + logic_new_func_x_2)]] )];
        end );
    deduped_15_1 := List( deduped_30_1, function ( j_2 )
            return Product( hoisted_14_1{[ 1 .. j_2 ]} );
        end );
    hoisted_9_1 := [ deduped_33_1, deduped_33_1, deduped_34_1 ];
    hoisted_4_1 := Concatenation( List( deduped_31_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ), List( deduped_32_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    hoisted_12_1 := List( deduped_30_1, function ( logic_new_func_x_2 )
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
                hoisted_3_2 := deduped_43_1;
            fi;
            hoisted_2_2 := deduped_28_1[deduped_7_2];
            hoisted_1_2 := Product( deduped_28_1{[ 1 .. deduped_8_2 ]} );
            return List( deduped_26_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    deduped_24_1 := CAP_JIT_INCOMPLETE_LOGIC( Filtered( deduped_26_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return Sum( deduped_30_1, function ( j_3 )
                          local deduped_1_3;
                          deduped_1_3 := 1 + j_3;
                          return hoisted_12_1[deduped_1_3][deduped_1_2] * deduped_15_1[deduped_1_3];
                      end ) = Sum( deduped_30_1, function ( j_3 )
                          local deduped_1_3;
                          deduped_1_3 := 1 + j_3;
                          return hoisted_19_1[deduped_1_3][deduped_1_2] * deduped_15_1[deduped_1_3];
                      end );
            end )[1 + AsList( alpha_1 )[(1 + CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. (Length( Source( alpha_1 ) ) - 1) ][1] ))]] );
    hoisted_23_1 := REM_INT( QUO_INT( deduped_24_1, deduped_25_1 ), Product( deduped_28_1{[ 1 + deduped_27_1 .. Sum( deduped_29_1{[ 1, 2 ]} ) ]} ) );
    hoisted_21_1 := REM_INT( deduped_24_1, deduped_25_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, DefiningPairOfBouquetMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( [ 0 .. deduped_27_1 - 1 ], function ( i_2 )
                return REM_INT( QUO_INT( hoisted_21_1, deduped_41_1 ^ i_2 ), deduped_41_1 );
            end ), List( [ 0 .. deduped_29_1[2] - 1 ], function ( i_2 )
                return REM_INT( QUO_INT( hoisted_23_1, deduped_42_1 ^ i_2 ), deduped_42_1 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, hoisted_9_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, deduped_15_1, hoisted_17_1, hoisted_19_1, deduped_22_1, hoisted_24_1, hoisted_25_1, hoisted_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1;
    deduped_52_1 := [ 1 ];
    deduped_51_1 := [ 0 ];
    deduped_50_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_49_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_48_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_47_1 := deduped_50_1[3];
    deduped_46_1 := deduped_50_1[2];
    deduped_45_1 := deduped_50_1[1];
    deduped_44_1 := deduped_48_1[2];
    deduped_43_1 := CreateCapCategoryObjectWithAttributes( deduped_49_1, Length, 2 );
    deduped_42_1 := CreateCapCategoryObjectWithAttributes( deduped_49_1, Length, BigInt( 1 ) );
    deduped_41_1 := deduped_48_1[1];
    deduped_40_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_39_1 := [ 0 .. deduped_44_1 - 1 ];
    deduped_38_1 := CreateCapCategoryObjectWithAttributes( deduped_40_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_49_1, deduped_42_1, deduped_43_1, AsList, deduped_52_1 ) );
    deduped_37_1 := CreateCapCategoryObjectWithAttributes( deduped_40_1, MapOfObject, CreateCapCategoryMorphismWithAttributes( deduped_49_1, deduped_42_1, deduped_43_1, AsList, deduped_51_1 ) );
    deduped_36_1 := ListWithIdenticalEntries( deduped_44_1, deduped_38_1 );
    deduped_35_1 := ListWithIdenticalEntries( deduped_41_1, deduped_37_1 );
    deduped_34_1 := [ 0 .. Length( deduped_39_1 ) - 1 ];
    deduped_33_1 := List( ListOfValues( [ CreateCapCategoryObjectWithAttributes( deduped_49_1, Length, deduped_41_1 ), CreateCapCategoryObjectWithAttributes( deduped_49_1, Length, deduped_44_1 ) ] ), Length );
    deduped_32_1 := deduped_33_1[1];
    deduped_2_1 := [ deduped_45_1, deduped_46_1 ];
    deduped_1_1 := [ deduped_37_1, deduped_38_1 ];
    deduped_31_1 := Concatenation( List( deduped_35_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ), List( deduped_36_1, function ( logic_new_func_x_2 )
              return deduped_2_1[SafePosition( deduped_1_1, logic_new_func_x_2 )];
          end ) );
    deduped_30_1 := [ 0 .. Product( deduped_31_1 ) - 1 ];
    deduped_8_1 := [ deduped_51_1, deduped_52_1, [ 2 ] ];
    deduped_7_1 := [ deduped_51_1, deduped_52_1, deduped_52_1 ];
    deduped_6_1 := [ deduped_51_1, deduped_51_1, deduped_52_1 ];
    deduped_5_1 := [ 0, 2 ];
    hoisted_17_1 := List( ListWithIdenticalEntries( deduped_44_1, CreateCapCategoryMorphismWithAttributes( deduped_40_1, deduped_37_1, deduped_38_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_49_1, deduped_42_1, CreateCapCategoryObjectWithAttributes( deduped_49_1, Length, 3 ), AsList, deduped_52_1 ) ) ), function ( logic_new_func_x_2 )
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
                return deduped_47_1;
            fi;
            return;
        end );
    hoisted_19_1 := List( deduped_34_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2;
            deduped_4_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 ) + deduped_41_1;
            hoisted_3_2 := hoisted_17_1[1 + logic_new_func_x_2];
            hoisted_2_2 := deduped_31_1[1 + deduped_4_2];
            hoisted_1_2 := Product( deduped_31_1{[ 1 .. deduped_4_2 ]} );
            return List( deduped_30_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    hoisted_13_1 := Concatenation( deduped_35_1, deduped_36_1 );
    deduped_3_1 := deduped_48_1[3];
    hoisted_14_1 := List( deduped_39_1, function ( logic_new_func_x_2 )
            return deduped_2_1[SafePosition( deduped_1_1, hoisted_13_1[1 + deduped_3_1[(1 + logic_new_func_x_2)]] )];
        end );
    deduped_15_1 := List( deduped_34_1, function ( j_2 )
            return Product( hoisted_14_1{[ 1 .. j_2 ]} );
        end );
    hoisted_9_1 := [ deduped_37_1, deduped_37_1, deduped_38_1 ];
    hoisted_4_1 := Concatenation( List( deduped_35_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ), List( deduped_36_1, function ( logic_new_func_x_2 )
              return AsList( MapOfObject( logic_new_func_x_2 ) );
          end ) );
    hoisted_12_1 := List( deduped_34_1, function ( logic_new_func_x_2 )
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
                hoisted_3_2 := deduped_47_1;
            fi;
            hoisted_2_2 := deduped_31_1[deduped_7_2];
            hoisted_1_2 := Product( deduped_31_1{[ 1 .. deduped_8_2 ]} );
            return List( deduped_30_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    deduped_29_1 := Filtered( deduped_30_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return Sum( deduped_34_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_12_1[deduped_1_3][deduped_1_2] * deduped_15_1[deduped_1_3];
                  end ) = Sum( deduped_34_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_19_1[deduped_1_3][deduped_1_2] * deduped_15_1[deduped_1_3];
                  end );
        end );
    deduped_28_1 := Length( deduped_29_1 );
    hoisted_27_1 := [ 0 .. deduped_33_1[2] - 1 ];
    hoisted_25_1 := Product( deduped_31_1{[ 1 + deduped_32_1 .. Sum( deduped_33_1{[ 1, 2 ]} ) ]} );
    hoisted_24_1 := [ 0 .. deduped_32_1 - 1 ];
    deduped_22_1 := Product( deduped_31_1{[ 1 .. deduped_32_1 ]} );
    return List( [ 0 .. deduped_28_1 - 1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_29_1[1 + REM_INT( logic_new_func_x_2, deduped_28_1 )] );
            hoisted_2_2 := REM_INT( QUO_INT( deduped_3_2, deduped_22_1 ), hoisted_25_1 );
            hoisted_1_2 := REM_INT( deduped_3_2, deduped_22_1 );
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfBouquetMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( hoisted_24_1, function ( i_3 )
                        return REM_INT( QUO_INT( hoisted_1_2, deduped_45_1 ^ i_3 ), deduped_45_1 );
                    end ), List( hoisted_27_1, function ( i_3 )
                        return REM_INT( QUO_INT( hoisted_2_2, deduped_46_1 ^ i_3 ), deduped_46_1 );
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
