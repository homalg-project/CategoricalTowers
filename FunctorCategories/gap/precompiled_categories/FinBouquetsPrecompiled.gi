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
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfBouquetEnrichedOverSkeletalFinSets, NTuple( 3, 0, 0, [  ] ) );
end
########
        
    , 100 );
    
    ##
    AddCoproduct( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( logic_new_func_x_2 )[2];
        end );
    deduped_4_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( logic_new_func_x_2 )[1];
        end );
    hoisted_3_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( logic_new_func_x_2 )[3];
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfBouquetEnrichedOverSkeletalFinSets, NTuple( 3, Sum( deduped_4_1 ), Sum( deduped_5_1 ), Concatenation( List( [ 1 .. Length( arg2_1 ) ], function ( logic_new_func_x_2 )
                  local hoisted_1_2, hoisted_2_2, deduped_3_2;
                  deduped_3_2 := Sum( deduped_4_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
                  hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_4_1[logic_new_func_x_2] - 1 ];
                  hoisted_1_2 := hoisted_3_1[logic_new_func_x_2];
                  return List( [ 0 .. deduped_5_1[logic_new_func_x_2] - 1 ], function ( i_3 )
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
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, 1 );
end
########
        
    , 100 );
    
    ##
    AddHomomorphismStructureOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_4_1, hoisted_5_1, deduped_6_1, hoisted_8_1, hoisted_10_1, hoisted_12_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1;
    deduped_22_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_21_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_20_1 := deduped_22_1[2];
    deduped_19_1 := deduped_21_1[2];
    deduped_18_1 := deduped_22_1[1];
    deduped_17_1 := deduped_21_1[1];
    deduped_16_1 := deduped_17_1 ^ deduped_20_1;
    deduped_15_1 := deduped_19_1 ^ deduped_20_1;
    deduped_14_1 := deduped_17_1 ^ deduped_18_1;
    deduped_13_1 := deduped_14_1 * deduped_15_1;
    hoisted_10_1 := deduped_21_1[3];
    deduped_6_1 := [ 0 .. deduped_20_1 - 1 ];
    hoisted_12_1 := List( [ 0 .. deduped_15_1 - 1 ], function ( i_2 )
            return Sum( List( deduped_6_1, function ( k_3 )
                      return hoisted_10_1[(1 + REM_INT( QUO_INT( i_2, deduped_19_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_19_1 ))] * deduped_17_1 ^ k_3;
                  end ) );
        end );
    hoisted_5_1 := deduped_22_1[3];
    hoisted_4_1 := [ 0 .. deduped_18_1 - 1 ];
    hoisted_8_1 := List( [ 0 .. deduped_14_1 - 1 ], function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_4_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_17_1 ^ j_3 ), deduped_17_1 );
                end );
            return Sum( List( deduped_6_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_5_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))])] * deduped_17_1 ^ k_3;
                  end ) );
        end );
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, Length( Filtered( [ 0 .. deduped_13_1 * deduped_16_1 - 1 ], function ( x_2 )
                local deduped_1_2, deduped_2_2;
                deduped_2_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                deduped_1_2 := REM_INT( QUO_INT( deduped_2_2, deduped_13_1 ), deduped_16_1 );
                return deduped_1_2 + deduped_1_2 * deduped_16_1 = hoisted_8_1[1 + REM_INT( deduped_2_2, deduped_14_1 )] + hoisted_12_1[(1 + REM_INT( QUO_INT( deduped_2_2, deduped_14_1 ), deduped_15_1 ))] * deduped_16_1;
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local hoisted_6_1, hoisted_8_1, hoisted_10_1, hoisted_12_1, deduped_14_1, hoisted_15_1, hoisted_17_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_24_1, hoisted_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1;
    deduped_41_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( range_1 );
    deduped_40_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( source_1 );
    deduped_39_1 := Length( Source( alpha_1 ) );
    deduped_38_1 := deduped_41_1[2];
    deduped_37_1 := deduped_41_1[1];
    deduped_36_1 := deduped_40_1[2];
    deduped_35_1 := deduped_40_1[1];
    deduped_34_1 := deduped_37_1 ^ deduped_36_1;
    deduped_33_1 := deduped_38_1 ^ deduped_36_1;
    deduped_32_1 := deduped_37_1 ^ deduped_35_1;
    deduped_31_1 := [ 0 .. deduped_39_1 - 1 ];
    deduped_30_1 := [ 0 .. deduped_36_1 - 1 ];
    deduped_29_1 := [ 0 .. deduped_35_1 - 1 ];
    deduped_28_1 := deduped_32_1 * deduped_33_1;
    hoisted_10_1 := deduped_41_1[3];
    hoisted_12_1 := List( [ 0 .. deduped_33_1 - 1 ], function ( i_2 )
            return Sum( List( deduped_30_1, function ( k_3 )
                      return hoisted_10_1[(1 + REM_INT( QUO_INT( i_2, deduped_38_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_38_1 ))] * deduped_37_1 ^ k_3;
                  end ) );
        end );
    hoisted_6_1 := deduped_40_1[3];
    hoisted_8_1 := List( [ 0 .. deduped_32_1 - 1 ], function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_29_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_37_1 ^ j_3 ), deduped_37_1 );
                end );
            return Sum( List( deduped_30_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_6_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))])] * deduped_37_1 ^ k_3;
                  end ) );
        end );
    deduped_27_1 := Filtered( [ 0 .. deduped_28_1 * deduped_34_1 - 1 ], function ( x_2 )
            local deduped_1_2, deduped_2_2;
            deduped_2_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            deduped_1_2 := REM_INT( QUO_INT( deduped_2_2, deduped_28_1 ), deduped_34_1 );
            return deduped_1_2 + deduped_1_2 * deduped_34_1 = hoisted_8_1[1 + REM_INT( deduped_2_2, deduped_32_1 )] + hoisted_12_1[(1 + REM_INT( QUO_INT( deduped_2_2, deduped_32_1 ), deduped_33_1 ))] * deduped_34_1;
        end );
    deduped_26_1 := [ 0 .. Length( deduped_27_1 ) - 1 ];
    hoisted_24_1 := List( [ 0 .. deduped_33_1 * deduped_36_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_38_1 ^ QUO_INT( i_2, deduped_33_1 ) ), deduped_38_1 );
        end );
    hoisted_21_1 := List( deduped_26_1, function ( i_2 )
            return REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_27_1[1 + i_2] ), deduped_32_1 ), deduped_33_1 );
        end );
    deduped_14_1 := AsList( alpha_1 );
    hoisted_22_1 := List( deduped_31_1, function ( i_2 )
            return hoisted_21_1[1 + deduped_14_1[(1 + i_2)]];
        end );
    hoisted_25_1 := List( [ 0 .. deduped_39_1 * deduped_36_1 - 1 ], function ( logic_new_func_x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 );
            return hoisted_24_1[1 + (hoisted_22_1[1 + REM_INT( deduped_1_2, deduped_39_1 )] + REM_INT( QUO_INT( deduped_1_2, deduped_39_1 ), deduped_36_1 ) * deduped_33_1)];
        end );
    hoisted_19_1 := List( [ 0 .. deduped_32_1 * deduped_35_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_37_1 ^ QUO_INT( i_2, deduped_32_1 ) ), deduped_37_1 );
        end );
    hoisted_15_1 := List( deduped_26_1, function ( i_2 )
            return REM_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_27_1[1 + i_2] ), deduped_32_1 );
        end );
    hoisted_17_1 := List( deduped_31_1, function ( i_2 )
            return hoisted_15_1[1 + deduped_14_1[(1 + i_2)]];
        end );
    hoisted_20_1 := List( [ 0 .. deduped_39_1 * deduped_35_1 - 1 ], function ( logic_new_func_x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 );
            return hoisted_19_1[1 + (hoisted_17_1[1 + REM_INT( deduped_1_2, deduped_39_1 )] + REM_INT( QUO_INT( deduped_1_2, deduped_39_1 ), deduped_35_1 ) * deduped_32_1)];
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, DefiningPairOfBouquetMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( deduped_29_1, function ( i_2 )
                return hoisted_20_1[1 + i_2];
            end ), List( deduped_30_1, function ( i_2 )
                return hoisted_25_1[1 + i_2];
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_5_1, hoisted_8_1, hoisted_10_1, hoisted_12_1, hoisted_16_1, hoisted_17_1, hoisted_19_1, hoisted_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1;
    deduped_34_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_33_1 := DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_32_1 := deduped_34_1[2];
    deduped_31_1 := deduped_33_1[2];
    deduped_30_1 := deduped_34_1[1];
    deduped_29_1 := deduped_33_1[1];
    deduped_28_1 := deduped_29_1 ^ deduped_32_1;
    deduped_27_1 := deduped_31_1 ^ deduped_32_1;
    deduped_26_1 := deduped_29_1 ^ deduped_30_1;
    deduped_25_1 := [ 0 .. deduped_32_1 - 1 ];
    deduped_24_1 := [ 0 .. deduped_30_1 - 1 ];
    deduped_23_1 := deduped_26_1 * deduped_27_1;
    hoisted_10_1 := deduped_33_1[3];
    hoisted_12_1 := List( [ 0 .. deduped_27_1 - 1 ], function ( i_2 )
            return Sum( List( deduped_25_1, function ( k_3 )
                      return hoisted_10_1[(1 + REM_INT( QUO_INT( i_2, deduped_31_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_31_1 ))] * deduped_29_1 ^ k_3;
                  end ) );
        end );
    hoisted_5_1 := deduped_34_1[3];
    hoisted_8_1 := List( [ 0 .. deduped_26_1 - 1 ], function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_24_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_29_1 ^ j_3 ), deduped_29_1 );
                end );
            return Sum( List( deduped_25_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_5_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))])] * deduped_29_1 ^ k_3;
                  end ) );
        end );
    deduped_22_1 := Filtered( [ 0 .. deduped_23_1 * deduped_28_1 - 1 ], function ( x_2 )
            local deduped_1_2, deduped_2_2;
            deduped_2_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            deduped_1_2 := REM_INT( QUO_INT( deduped_2_2, deduped_23_1 ), deduped_28_1 );
            return deduped_1_2 + deduped_1_2 * deduped_28_1 = hoisted_8_1[1 + REM_INT( deduped_2_2, deduped_26_1 )] + hoisted_12_1[(1 + REM_INT( QUO_INT( deduped_2_2, deduped_26_1 ), deduped_27_1 ))] * deduped_28_1;
        end );
    deduped_21_1 := Length( deduped_22_1 );
    hoisted_20_1 := List( [ 0 .. deduped_27_1 * deduped_32_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_31_1 ^ QUO_INT( i_2, deduped_27_1 ) ), deduped_31_1 );
        end );
    hoisted_19_1 := List( deduped_25_1, function ( logic_new_func_x_2 )
            return REM_INT( logic_new_func_x_2, deduped_32_1 );
        end );
    hoisted_17_1 := List( [ 0 .. deduped_26_1 * deduped_30_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_29_1 ^ QUO_INT( i_2, deduped_26_1 ) ), deduped_29_1 );
        end );
    hoisted_16_1 := List( deduped_24_1, function ( logic_new_func_x_2 )
            return REM_INT( logic_new_func_x_2, deduped_30_1 );
        end );
    return List( [ 0 .. deduped_21_1 - 1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
            deduped_4_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 );
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_22_1[1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( deduped_4_2, deduped_21_1 ^ QUO_INT( deduped_4_2, deduped_21_1 ) ), deduped_21_1 ) )] );
            hoisted_2_2 := REM_INT( QUO_INT( deduped_3_2, deduped_26_1 ), deduped_27_1 );
            hoisted_1_2 := REM_INT( deduped_3_2, deduped_26_1 );
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfBouquetMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( deduped_24_1, function ( logic_new_func_x_3 )
                        return hoisted_17_1[1 + (hoisted_1_2 + hoisted_16_1[(1 + logic_new_func_x_3)] * deduped_26_1)];
                    end ), List( deduped_25_1, function ( logic_new_func_x_3 )
                        return hoisted_20_1[1 + (hoisted_2_2 + hoisted_19_1[(1 + logic_new_func_x_3)] * deduped_27_1)];
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
