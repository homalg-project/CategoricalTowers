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
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfBouquetEnrichedOverSkeletalFinSets, NTuple( 3, deduped_1_1, deduped_1_1, CapJitTypedExpression( [  ], function (  )
                return rec(
                    filter := IsList,
                    element_type := rec(
                        filter := IsInt ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddCoproduct( cat,
        
########
function ( cat_1, objects_1 )
    local deduped_3_1, deduped_4_1;
    deduped_4_1 := List( objects_1, function ( x_2 )
            return DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( x_2 )[2];
        end );
    deduped_3_1 := List( objects_1, function ( x_2 )
            return DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( x_2 )[1];
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfBouquetEnrichedOverSkeletalFinSets, NTuple( 3, Sum( deduped_3_1 ), Sum( deduped_4_1 ), Concatenation( List( [ 1 .. Length( objects_1 ) ], function ( i_2 )
                  local hoisted_1_2, hoisted_2_2, deduped_3_2;
                  deduped_3_2 := Sum( deduped_3_1{[ 1 .. i_2 - 1 ]} );
                  hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_3_1[i_2] - 1 ];
                  hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( CAP_JIT_INCOMPLETE_LOGIC( objects_1[i_2] ) )[3] );
                  return List( [ 0 .. deduped_4_1[i_2] - 1 ], function ( i_3 )
                          return hoisted_2_2[1 + hoisted_1_2[1 + i_3]];
                      end );
              end ) ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.Coproduct :=
        
########
function ( cat_1, objects_1 )
    local hoisted_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := List( objects_1, function ( x_2 )
            return DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( x_2 )[2];
        end );
    deduped_4_1 := List( objects_1, function ( x_2 )
            return DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( x_2 )[1];
        end );
    hoisted_3_1 := List( objects_1, function ( x_2 )
            return DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( x_2 )[3];
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfBouquetEnrichedOverSkeletalFinSets, NTuple( 3, Sum( deduped_4_1 ), Sum( deduped_5_1 ), Concatenation( List( [ 1 .. Length( objects_1 ) ], function ( i_2 )
                  local hoisted_1_2, hoisted_2_2, deduped_3_2;
                  deduped_3_2 := Sum( deduped_4_1{[ 1 .. i_2 - 1 ]} );
                  hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_4_1[i_2] - 1 ];
                  hoisted_1_2 := hoisted_3_1[i_2];
                  return List( [ 0 .. deduped_5_1[i_2] - 1 ], function ( i_3 )
                          return hoisted_2_2[1 + hoisted_1_2[1 + i_3]];
                      end );
              end ) ) ) );
end
########
        
    ;
    
    ##
    AddInjectionOfCofactorOfCoproductWithGivenCoproduct( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := [ 1 .. k_1 - 1 ];
    deduped_4_1 := List( objects_1, function ( x_2 )
            return DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( x_2 )[2];
        end );
    deduped_3_1 := List( objects_1, function ( x_2 )
            return DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( x_2 )[1];
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
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, DefiningPairOfBouquetMorphismEnrichedOverSkeletalFinSets, NTuple( 2, Concatenation( List( tau_1, function ( x_2 )
                  return DefiningPairOfBouquetMorphismEnrichedOverSkeletalFinSets( x_2 )[1];
              end ) ), Concatenation( List( tau_1, function ( x_2 )
                  return DefiningPairOfBouquetMorphismEnrichedOverSkeletalFinSets( x_2 )[2];
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
    local hoisted_1_1, hoisted_6_1, hoisted_7_1, deduped_8_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1;
    deduped_22_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_21_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_20_1 := deduped_21_1[2];
    deduped_19_1 := deduped_22_1[1];
    deduped_18_1 := deduped_21_1[1];
    deduped_17_1 := deduped_18_1 + deduped_20_1;
    deduped_16_1 := [ 0 .. deduped_20_1 - 1 ];
    deduped_15_1 := Concatenation( ListWithIdenticalEntries( deduped_18_1, deduped_19_1 ), ListWithIdenticalEntries( deduped_20_1, deduped_22_1[2] ) );
    deduped_14_1 := Product( deduped_15_1 );
    deduped_13_1 := [ 0 .. deduped_14_1 - 1 ];
    hoisted_11_1 := deduped_22_1[3];
    hoisted_10_1 := [ deduped_18_1 .. deduped_17_1 - 1 ];
    hoisted_12_1 := List( deduped_16_1, function ( i_2 )
            local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := hoisted_10_1[1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 )];
            deduped_6_2 := 1 + deduped_7_2;
            deduped_5_2 := deduped_15_1[deduped_6_2];
            deduped_4_2 := Product( deduped_15_1{[ 1 .. deduped_7_2 ]} );
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_14_1, deduped_4_2, deduped_5_2 * Product( deduped_15_1{[ deduped_6_2 + 1 .. deduped_17_1 ]} ) );
            return List( deduped_13_1, function ( i_3 )
                    return hoisted_11_1[1 + CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( QuoIntWithDomain( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), deduped_4_2, deduped_14_1 ), deduped_5_2, hoisted_3_2 ) )];
                end );
        end );
    hoisted_7_1 := ListWithIdenticalEntries( deduped_20_1, deduped_19_1 );
    deduped_8_1 := List( deduped_16_1, function ( j_2 )
            return Product( hoisted_7_1{[ 1 .. j_2 ]} );
        end );
    hoisted_1_1 := deduped_21_1[3];
    hoisted_6_1 := List( deduped_16_1, function ( i_2 )
            local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := hoisted_1_1[1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 )];
            deduped_6_2 := 1 + deduped_7_2;
            deduped_5_2 := deduped_15_1[deduped_6_2];
            deduped_4_2 := Product( deduped_15_1{[ 1 .. deduped_7_2 ]} );
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_14_1, deduped_4_2, deduped_5_2 * Product( deduped_15_1{[ deduped_6_2 + 1 .. deduped_17_1 ]} ) );
            return List( deduped_13_1, function ( i_3 )
                    return CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( QuoIntWithDomain( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), deduped_4_2, deduped_14_1 ), deduped_5_2, hoisted_3_2 ) );
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, BigInt( Length( Filtered( deduped_13_1, function ( x_2 )
                  local deduped_1_2;
                  deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                  return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_16_1, function ( j_3 )
                              local deduped_1_3;
                              deduped_1_3 := 1 + j_3;
                              return hoisted_6_1[deduped_1_3][deduped_1_2] * deduped_8_1[deduped_1_3];
                          end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_16_1, function ( j_3 )
                              local deduped_1_3;
                              deduped_1_3 := 1 + j_3;
                              return hoisted_12_1[deduped_1_3][deduped_1_2] * deduped_8_1[deduped_1_3];
                          end ) );
              end ) ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.HomomorphismStructureOnObjects :=
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, deduped_9_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1;
    deduped_26_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_25_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_24_1 := deduped_25_1[2];
    deduped_23_1 := deduped_26_1[1];
    deduped_22_1 := deduped_25_1[1];
    deduped_21_1 := deduped_22_1 + deduped_24_1;
    deduped_20_1 := [ 0 .. deduped_24_1 - 1 ];
    deduped_19_1 := Concatenation( ListWithIdenticalEntries( deduped_22_1, deduped_23_1 ), ListWithIdenticalEntries( deduped_24_1, deduped_26_1[2] ) );
    deduped_18_1 := Product( deduped_19_1 );
    deduped_17_1 := [ 0 .. deduped_18_1 - 1 ];
    hoisted_14_1 := deduped_26_1[3];
    hoisted_12_1 := [ deduped_22_1 .. deduped_21_1 - 1 ];
    hoisted_13_1 := List( deduped_20_1, function ( i_2 )
            local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := hoisted_12_1[1 + i_2];
            deduped_6_2 := 1 + deduped_7_2;
            deduped_5_2 := deduped_19_1[deduped_6_2];
            deduped_4_2 := Product( deduped_19_1{[ 1 .. deduped_7_2 ]} );
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_18_1, deduped_4_2, deduped_5_2 * Product( deduped_19_1{[ deduped_6_2 + 1 .. deduped_21_1 ]} ) );
            return List( deduped_17_1, function ( i_3 )
                    return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_18_1 ), deduped_5_2, hoisted_3_2 );
                end );
        end );
    hoisted_15_1 := List( deduped_20_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_13_1[1 + i_2];
            return List( deduped_17_1, function ( i_3 )
                    return hoisted_14_1[1 + hoisted_1_2[1 + i_3]];
                end );
        end );
    hoisted_8_1 := ListWithIdenticalEntries( deduped_24_1, deduped_23_1 );
    deduped_9_1 := List( deduped_20_1, function ( j_2 )
            return Product( hoisted_8_1{[ 1 .. j_2 ]} );
        end );
    hoisted_16_1 := List( deduped_17_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_20_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_15_1[deduped_1_3][hoisted_1_2] * deduped_9_1[deduped_1_3];
                end );
        end );
    hoisted_1_1 := deduped_25_1[3];
    hoisted_6_1 := List( deduped_20_1, function ( i_2 )
            local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := hoisted_1_1[1 + i_2];
            deduped_6_2 := 1 + deduped_7_2;
            deduped_5_2 := deduped_19_1[deduped_6_2];
            deduped_4_2 := Product( deduped_19_1{[ 1 .. deduped_7_2 ]} );
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_18_1, deduped_4_2, deduped_5_2 * Product( deduped_19_1{[ deduped_6_2 + 1 .. deduped_21_1 ]} ) );
            return List( deduped_17_1, function ( i_3 )
                    return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_18_1 ), deduped_5_2, hoisted_3_2 );
                end );
        end );
    hoisted_7_1 := List( deduped_20_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_6_1[1 + i_2];
            return List( deduped_17_1, function ( i_3 )
                    return hoisted_1_2[1 + i_3];
                end );
        end );
    hoisted_11_1 := List( deduped_17_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_20_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_7_1[deduped_1_3][hoisted_1_2] * deduped_9_1[deduped_1_3];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, BigInt( Length( Filtered( deduped_17_1, function ( x_2 )
                  local deduped_1_2;
                  deduped_1_2 := 1 + x_2;
                  return hoisted_11_1[deduped_1_2] = hoisted_16_1[deduped_1_2];
              end ) ) ) );
end
########
        
    ;
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local hoisted_1_1, hoisted_6_1, hoisted_7_1, deduped_8_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_16_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1;
    deduped_31_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( range_1 );
    deduped_30_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( source_1 );
    deduped_29_1 := deduped_31_1[2];
    deduped_28_1 := deduped_31_1[1];
    deduped_27_1 := deduped_30_1[2];
    deduped_26_1 := deduped_30_1[1];
    deduped_25_1 := deduped_26_1 + deduped_27_1;
    deduped_24_1 := [ 0 .. deduped_27_1 - 1 ];
    deduped_23_1 := Concatenation( ListWithIdenticalEntries( deduped_26_1, deduped_28_1 ), ListWithIdenticalEntries( deduped_27_1, deduped_29_1 ) );
    deduped_22_1 := Product( deduped_23_1 );
    deduped_21_1 := Product( deduped_23_1{[ 1 .. deduped_26_1 ]} );
    deduped_20_1 := [ 0 .. deduped_22_1 - 1 ];
    hoisted_11_1 := deduped_31_1[3];
    hoisted_10_1 := [ deduped_26_1 .. deduped_25_1 - 1 ];
    hoisted_12_1 := List( deduped_24_1, function ( i_2 )
            local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := hoisted_10_1[1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 )];
            deduped_6_2 := 1 + deduped_7_2;
            deduped_5_2 := deduped_23_1[deduped_6_2];
            deduped_4_2 := Product( deduped_23_1{[ 1 .. deduped_7_2 ]} );
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_22_1, deduped_4_2, deduped_5_2 * Product( deduped_23_1{[ deduped_6_2 + 1 .. deduped_25_1 ]} ) );
            return List( deduped_20_1, function ( i_3 )
                    return hoisted_11_1[1 + CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( QuoIntWithDomain( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), deduped_4_2, deduped_22_1 ), deduped_5_2, hoisted_3_2 ) )];
                end );
        end );
    hoisted_7_1 := ListWithIdenticalEntries( deduped_27_1, deduped_28_1 );
    deduped_8_1 := List( deduped_24_1, function ( j_2 )
            return Product( hoisted_7_1{[ 1 .. j_2 ]} );
        end );
    hoisted_1_1 := deduped_30_1[3];
    hoisted_6_1 := List( deduped_24_1, function ( i_2 )
            local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := hoisted_1_1[1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 )];
            deduped_6_2 := 1 + deduped_7_2;
            deduped_5_2 := deduped_23_1[deduped_6_2];
            deduped_4_2 := Product( deduped_23_1{[ 1 .. deduped_7_2 ]} );
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_22_1, deduped_4_2, deduped_5_2 * Product( deduped_23_1{[ deduped_6_2 + 1 .. deduped_25_1 ]} ) );
            return List( deduped_20_1, function ( i_3 )
                    return CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( QuoIntWithDomain( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), deduped_4_2, deduped_22_1 ), deduped_5_2, hoisted_3_2 ) );
                end );
        end );
    deduped_19_1 := CAP_JIT_INCOMPLETE_LOGIC( Filtered( deduped_20_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_24_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_6_1[deduped_1_3][deduped_1_2] * deduped_8_1[deduped_1_3];
                        end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_24_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_12_1[deduped_1_3][deduped_1_2] * deduped_8_1[deduped_1_3];
                        end ) );
            end )[1 + AsList( alpha_1 )[1 + CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. Length( Source( alpha_1 ) ) - 1 ][1] )]] );
    hoisted_16_1 := CAP_JIT_INCOMPLETE_LOGIC( QuoIntWithDomain( deduped_19_1, deduped_21_1, deduped_22_1 ) );
    hoisted_13_1 := CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( deduped_19_1, deduped_21_1, deduped_22_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, DefiningPairOfBouquetMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( [ 0 .. deduped_26_1 - 1 ], function ( i_2 )
                return DigitInPositionalNotation( hoisted_13_1, i_2, deduped_26_1, deduped_28_1 );
            end ), List( deduped_24_1, function ( i_2 )
                return DigitInPositionalNotation( hoisted_16_1, i_2, deduped_27_1, deduped_29_1 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism :=
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local deduped_1_1, hoisted_3_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, deduped_10_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, deduped_18_1, deduped_19_1, hoisted_20_1, hoisted_21_1, hoisted_24_1, hoisted_25_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1;
    deduped_39_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( range_1 );
    deduped_38_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( source_1 );
    deduped_37_1 := deduped_39_1[2];
    deduped_36_1 := deduped_39_1[1];
    deduped_35_1 := deduped_38_1[2];
    deduped_34_1 := deduped_38_1[1];
    deduped_33_1 := deduped_34_1 + deduped_35_1;
    deduped_32_1 := [ 0 .. Length( Source( alpha_1 ) ) - 1 ];
    deduped_31_1 := [ 0 .. deduped_35_1 - 1 ];
    deduped_30_1 := Concatenation( ListWithIdenticalEntries( deduped_34_1, deduped_36_1 ), ListWithIdenticalEntries( deduped_35_1, deduped_37_1 ) );
    deduped_29_1 := Product( deduped_30_1 );
    deduped_28_1 := [ 0 .. deduped_29_1 - 1 ];
    deduped_1_1 := Product( deduped_30_1{[ 1 .. deduped_34_1 ]} );
    hoisted_24_1 := List( deduped_28_1, function ( i_2 )
            return QuoIntWithDomain( i_2, deduped_1_1, deduped_29_1 );
        end );
    hoisted_15_1 := deduped_39_1[3];
    hoisted_13_1 := [ deduped_34_1 .. deduped_33_1 - 1 ];
    hoisted_14_1 := List( deduped_31_1, function ( i_2 )
            local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := hoisted_13_1[1 + i_2];
            deduped_6_2 := 1 + deduped_7_2;
            deduped_5_2 := deduped_30_1[deduped_6_2];
            deduped_4_2 := Product( deduped_30_1{[ 1 .. deduped_7_2 ]} );
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_29_1, deduped_4_2, deduped_5_2 * Product( deduped_30_1{[ deduped_6_2 + 1 .. deduped_33_1 ]} ) );
            return List( deduped_28_1, function ( i_3 )
                    return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_29_1 ), deduped_5_2, hoisted_3_2 );
                end );
        end );
    hoisted_16_1 := List( deduped_31_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_14_1[1 + i_2];
            return List( deduped_28_1, function ( i_3 )
                    return hoisted_15_1[1 + hoisted_1_2[1 + i_3]];
                end );
        end );
    hoisted_9_1 := ListWithIdenticalEntries( deduped_35_1, deduped_36_1 );
    deduped_10_1 := List( deduped_31_1, function ( j_2 )
            return Product( hoisted_9_1{[ 1 .. j_2 ]} );
        end );
    hoisted_17_1 := List( deduped_28_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_31_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_16_1[deduped_1_3][hoisted_1_2] * deduped_10_1[deduped_1_3];
                end );
        end );
    hoisted_3_1 := deduped_38_1[3];
    hoisted_7_1 := List( deduped_31_1, function ( i_2 )
            local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := hoisted_3_1[1 + i_2];
            deduped_6_2 := 1 + deduped_7_2;
            deduped_5_2 := deduped_30_1[deduped_6_2];
            deduped_4_2 := Product( deduped_30_1{[ 1 .. deduped_7_2 ]} );
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_29_1, deduped_4_2, deduped_5_2 * Product( deduped_30_1{[ deduped_6_2 + 1 .. deduped_33_1 ]} ) );
            return List( deduped_28_1, function ( i_3 )
                    return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_29_1 ), deduped_5_2, hoisted_3_2 );
                end );
        end );
    hoisted_8_1 := List( deduped_31_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_7_1[1 + i_2];
            return List( deduped_28_1, function ( i_3 )
                    return hoisted_1_2[1 + i_3];
                end );
        end );
    hoisted_12_1 := List( deduped_28_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_31_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_8_1[deduped_1_3][hoisted_1_2] * deduped_10_1[deduped_1_3];
                end );
        end );
    deduped_19_1 := Filtered( deduped_28_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + x_2;
            return hoisted_12_1[deduped_1_2] = hoisted_17_1[deduped_1_2];
        end );
    deduped_18_1 := AsList( alpha_1 );
    hoisted_25_1 := List( deduped_32_1, function ( i_2 )
              return hoisted_24_1[1 + deduped_19_1[1 + deduped_18_1[1 + i_2]]];
          end )[1];
    hoisted_20_1 := List( deduped_28_1, function ( i_2 )
            return RemIntWithDomain( i_2, deduped_1_1, deduped_29_1 );
        end );
    hoisted_21_1 := List( deduped_32_1, function ( i_2 )
              return hoisted_20_1[1 + deduped_19_1[1 + deduped_18_1[1 + i_2]]];
          end )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, DefiningPairOfBouquetMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( [ 0 .. deduped_34_1 - 1 ], function ( i_2 )
                return DigitInPositionalNotation( hoisted_21_1, i_2, deduped_34_1, deduped_36_1 );
            end ), List( deduped_31_1, function ( i_2 )
                return DigitInPositionalNotation( hoisted_25_1, i_2, deduped_35_1, deduped_37_1 );
            end ) ) );
end
########
        
    ;
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_6_1, hoisted_7_1, deduped_8_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, deduped_13_1, hoisted_15_1, hoisted_18_1, hoisted_19_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1;
    deduped_33_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_32_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_31_1 := deduped_33_1[2];
    deduped_30_1 := deduped_32_1[2];
    deduped_29_1 := deduped_33_1[1];
    deduped_28_1 := deduped_32_1[1];
    deduped_27_1 := deduped_28_1 + deduped_30_1;
    deduped_26_1 := [ 0 .. deduped_30_1 - 1 ];
    deduped_25_1 := Concatenation( ListWithIdenticalEntries( deduped_28_1, deduped_29_1 ), ListWithIdenticalEntries( deduped_30_1, deduped_31_1 ) );
    deduped_24_1 := Product( deduped_25_1 );
    deduped_23_1 := [ 0 .. deduped_24_1 - 1 ];
    hoisted_11_1 := deduped_33_1[3];
    hoisted_10_1 := [ deduped_28_1 .. deduped_27_1 - 1 ];
    hoisted_12_1 := List( deduped_26_1, function ( i_2 )
            local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := hoisted_10_1[1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 )];
            deduped_6_2 := 1 + deduped_7_2;
            deduped_5_2 := deduped_25_1[deduped_6_2];
            deduped_4_2 := Product( deduped_25_1{[ 1 .. deduped_7_2 ]} );
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_24_1, deduped_4_2, deduped_5_2 * Product( deduped_25_1{[ deduped_6_2 + 1 .. deduped_27_1 ]} ) );
            return List( deduped_23_1, function ( i_3 )
                    return hoisted_11_1[1 + CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( QuoIntWithDomain( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), deduped_4_2, deduped_24_1 ), deduped_5_2, hoisted_3_2 ) )];
                end );
        end );
    hoisted_7_1 := ListWithIdenticalEntries( deduped_30_1, deduped_29_1 );
    deduped_8_1 := List( deduped_26_1, function ( j_2 )
            return Product( hoisted_7_1{[ 1 .. j_2 ]} );
        end );
    hoisted_1_1 := deduped_32_1[3];
    hoisted_6_1 := List( deduped_26_1, function ( i_2 )
            local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := hoisted_1_1[1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 )];
            deduped_6_2 := 1 + deduped_7_2;
            deduped_5_2 := deduped_25_1[deduped_6_2];
            deduped_4_2 := Product( deduped_25_1{[ 1 .. deduped_7_2 ]} );
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_24_1, deduped_4_2, deduped_5_2 * Product( deduped_25_1{[ deduped_6_2 + 1 .. deduped_27_1 ]} ) );
            return List( deduped_23_1, function ( i_3 )
                    return CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( QuoIntWithDomain( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), deduped_4_2, deduped_24_1 ), deduped_5_2, hoisted_3_2 ) );
                end );
        end );
    deduped_22_1 := Filtered( deduped_23_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_26_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_6_1[deduped_1_3][deduped_1_2] * deduped_8_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_26_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_12_1[deduped_1_3][deduped_1_2] * deduped_8_1[deduped_1_3];
                    end ) );
        end );
    deduped_13_1 := Product( deduped_25_1{[ 1 .. deduped_28_1 ]} );
    hoisted_19_1 := List( deduped_23_1, function ( i_2 )
            return QuoIntWithDomain( i_2, deduped_13_1, deduped_24_1 );
        end );
    hoisted_18_1 := [ 0 .. deduped_28_1 - 1 ];
    hoisted_15_1 := List( deduped_23_1, function ( i_2 )
            return RemIntWithDomain( i_2, deduped_13_1, deduped_24_1 );
        end );
    return List( [ 0 .. BigInt( Length( deduped_22_1 ) ) - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + deduped_22_1[1 + i_2];
            hoisted_2_2 := hoisted_19_1[deduped_3_2];
            hoisted_1_2 := hoisted_15_1[deduped_3_2];
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfBouquetMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( hoisted_18_1, function ( i_3 )
                        return DigitInPositionalNotation( hoisted_1_2, i_3, deduped_28_1, deduped_29_1 );
                    end ), List( deduped_26_1, function ( i_3 )
                        return DigitInPositionalNotation( hoisted_2_2, i_3, deduped_30_1, deduped_31_1 );
                    end ) ) );
        end );
end
########
        
    , 802 : IsPrecompiledDerivation := true );
    
    ##
    cat!.cached_precompiled_functions.MorphismsOfExternalHom :=
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, deduped_9_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, deduped_17_1, hoisted_19_1, hoisted_22_1, hoisted_23_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1;
    deduped_37_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_36_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_35_1 := deduped_37_1[2];
    deduped_34_1 := deduped_36_1[2];
    deduped_33_1 := deduped_37_1[1];
    deduped_32_1 := deduped_36_1[1];
    deduped_31_1 := deduped_32_1 + deduped_34_1;
    deduped_30_1 := [ 0 .. deduped_34_1 - 1 ];
    deduped_29_1 := Concatenation( ListWithIdenticalEntries( deduped_32_1, deduped_33_1 ), ListWithIdenticalEntries( deduped_34_1, deduped_35_1 ) );
    deduped_28_1 := Product( deduped_29_1 );
    deduped_27_1 := [ 0 .. deduped_28_1 - 1 ];
    hoisted_14_1 := deduped_37_1[3];
    hoisted_12_1 := [ deduped_32_1 .. deduped_31_1 - 1 ];
    hoisted_13_1 := List( deduped_30_1, function ( i_2 )
            local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := hoisted_12_1[1 + i_2];
            deduped_6_2 := 1 + deduped_7_2;
            deduped_5_2 := deduped_29_1[deduped_6_2];
            deduped_4_2 := Product( deduped_29_1{[ 1 .. deduped_7_2 ]} );
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_28_1, deduped_4_2, deduped_5_2 * Product( deduped_29_1{[ deduped_6_2 + 1 .. deduped_31_1 ]} ) );
            return List( deduped_27_1, function ( i_3 )
                    return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_28_1 ), deduped_5_2, hoisted_3_2 );
                end );
        end );
    hoisted_15_1 := List( deduped_30_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_13_1[1 + i_2];
            return List( deduped_27_1, function ( i_3 )
                    return hoisted_14_1[1 + hoisted_1_2[1 + i_3]];
                end );
        end );
    hoisted_8_1 := ListWithIdenticalEntries( deduped_34_1, deduped_33_1 );
    deduped_9_1 := List( deduped_30_1, function ( j_2 )
            return Product( hoisted_8_1{[ 1 .. j_2 ]} );
        end );
    hoisted_16_1 := List( deduped_27_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_30_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_15_1[deduped_1_3][hoisted_1_2] * deduped_9_1[deduped_1_3];
                end );
        end );
    hoisted_1_1 := deduped_36_1[3];
    hoisted_6_1 := List( deduped_30_1, function ( i_2 )
            local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := hoisted_1_1[1 + i_2];
            deduped_6_2 := 1 + deduped_7_2;
            deduped_5_2 := deduped_29_1[deduped_6_2];
            deduped_4_2 := Product( deduped_29_1{[ 1 .. deduped_7_2 ]} );
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_28_1, deduped_4_2, deduped_5_2 * Product( deduped_29_1{[ deduped_6_2 + 1 .. deduped_31_1 ]} ) );
            return List( deduped_27_1, function ( i_3 )
                    return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_28_1 ), deduped_5_2, hoisted_3_2 );
                end );
        end );
    hoisted_7_1 := List( deduped_30_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_6_1[1 + i_2];
            return List( deduped_27_1, function ( i_3 )
                    return hoisted_1_2[1 + i_3];
                end );
        end );
    hoisted_11_1 := List( deduped_27_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_30_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_7_1[deduped_1_3][hoisted_1_2] * deduped_9_1[deduped_1_3];
                end );
        end );
    deduped_26_1 := Filtered( deduped_27_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + x_2;
            return hoisted_11_1[deduped_1_2] = hoisted_16_1[deduped_1_2];
        end );
    deduped_17_1 := Product( deduped_29_1{[ 1 .. deduped_32_1 ]} );
    hoisted_23_1 := List( deduped_27_1, function ( i_2 )
            return QuoIntWithDomain( i_2, deduped_17_1, deduped_28_1 );
        end );
    hoisted_22_1 := [ 0 .. deduped_32_1 - 1 ];
    hoisted_19_1 := List( deduped_27_1, function ( i_2 )
            return RemIntWithDomain( i_2, deduped_17_1, deduped_28_1 );
        end );
    return List( [ 0 .. BigInt( Length( deduped_26_1 ) ) - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + deduped_26_1[1 + i_2];
            hoisted_2_2 := hoisted_23_1[deduped_3_2];
            hoisted_1_2 := hoisted_19_1[deduped_3_2];
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfBouquetMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( hoisted_22_1, function ( i_3 )
                        return DigitInPositionalNotation( hoisted_1_2, i_3, deduped_32_1, deduped_33_1 );
                    end ), List( deduped_30_1, function ( i_3 )
                        return DigitInPositionalNotation( hoisted_2_2, i_3, deduped_34_1, deduped_35_1 );
                    end ) ) );
        end );
end
########
        
    ;
    
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
    return CategoryOfBouquetsEnrichedOver( SkeletalCategoryOfFiniteSets(  : FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_FinBouquetsPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
