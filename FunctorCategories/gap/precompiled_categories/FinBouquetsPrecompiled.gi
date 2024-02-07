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
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_14_1, deduped_4_2, deduped_5_2 * Product( deduped_15_1{[ (deduped_6_2 + 1) .. deduped_17_1 ]} ) );
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
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_14_1, deduped_4_2, deduped_5_2 * Product( deduped_15_1{[ (deduped_6_2 + 1) .. deduped_17_1 ]} ) );
            return List( deduped_13_1, function ( i_3 )
                    return CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( QuoIntWithDomain( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), deduped_4_2, deduped_14_1 ), deduped_5_2, hoisted_3_2 ) );
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, Length( Filtered( deduped_13_1, function ( x_2 )
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
            end ) ) );
end
########
        
    , 100 );
    
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
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_22_1, deduped_4_2, deduped_5_2 * Product( deduped_23_1{[ (deduped_6_2 + 1) .. deduped_25_1 ]} ) );
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
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_22_1, deduped_4_2, deduped_5_2 * Product( deduped_23_1{[ (deduped_6_2 + 1) .. deduped_25_1 ]} ) );
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
            end )[1 + AsList( alpha_1 )[(1 + CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. (Length( Source( alpha_1 ) ) - 1) ][1] ))]] );
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
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_6_1, hoisted_7_1, deduped_8_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, deduped_14_1, hoisted_17_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1;
    deduped_31_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_30_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_29_1 := deduped_31_1[2];
    deduped_28_1 := deduped_30_1[2];
    deduped_27_1 := deduped_31_1[1];
    deduped_26_1 := deduped_30_1[1];
    deduped_25_1 := deduped_26_1 + deduped_28_1;
    deduped_24_1 := [ 0 .. deduped_28_1 - 1 ];
    deduped_23_1 := Concatenation( ListWithIdenticalEntries( deduped_26_1, deduped_27_1 ), ListWithIdenticalEntries( deduped_28_1, deduped_29_1 ) );
    deduped_22_1 := Product( deduped_23_1 );
    deduped_21_1 := [ 0 .. deduped_22_1 - 1 ];
    hoisted_11_1 := deduped_31_1[3];
    hoisted_10_1 := [ deduped_26_1 .. deduped_25_1 - 1 ];
    hoisted_12_1 := List( deduped_24_1, function ( i_2 )
            local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := hoisted_10_1[1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 )];
            deduped_6_2 := 1 + deduped_7_2;
            deduped_5_2 := deduped_23_1[deduped_6_2];
            deduped_4_2 := Product( deduped_23_1{[ 1 .. deduped_7_2 ]} );
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_22_1, deduped_4_2, deduped_5_2 * Product( deduped_23_1{[ (deduped_6_2 + 1) .. deduped_25_1 ]} ) );
            return List( deduped_21_1, function ( i_3 )
                    return hoisted_11_1[1 + CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( QuoIntWithDomain( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), deduped_4_2, deduped_22_1 ), deduped_5_2, hoisted_3_2 ) )];
                end );
        end );
    hoisted_7_1 := ListWithIdenticalEntries( deduped_28_1, deduped_27_1 );
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
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_22_1, deduped_4_2, deduped_5_2 * Product( deduped_23_1{[ (deduped_6_2 + 1) .. deduped_25_1 ]} ) );
            return List( deduped_21_1, function ( i_3 )
                    return CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( QuoIntWithDomain( CAP_JIT_INCOMPLETE_LOGIC( i_3 ), deduped_4_2, deduped_22_1 ), deduped_5_2, hoisted_3_2 ) );
                end );
        end );
    deduped_20_1 := Filtered( deduped_21_1, function ( x_2 )
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
        end );
    hoisted_17_1 := [ 0 .. deduped_26_1 - 1 ];
    deduped_14_1 := Product( deduped_23_1{[ 1 .. deduped_26_1 ]} );
    return List( [ 0 .. Length( deduped_20_1 ) - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_20_1[1 + i_2] );
            hoisted_2_2 := CAP_JIT_INCOMPLETE_LOGIC( QuoIntWithDomain( deduped_3_2, deduped_14_1, deduped_22_1 ) );
            hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( deduped_3_2, deduped_14_1, deduped_22_1 ) );
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfBouquetMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( hoisted_17_1, function ( i_3 )
                        return DigitInPositionalNotation( hoisted_1_2, i_3, deduped_26_1, deduped_27_1 );
                    end ), List( deduped_24_1, function ( i_3 )
                        return DigitInPositionalNotation( hoisted_2_2, i_3, deduped_28_1, deduped_29_1 );
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
