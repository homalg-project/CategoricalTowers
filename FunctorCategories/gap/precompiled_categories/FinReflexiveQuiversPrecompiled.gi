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
    local hoisted_1_1, hoisted_3_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1, deduped_10_1, hoisted_11_1, deduped_12_1, hoisted_15_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1;
    deduped_50_1 := [ 1, 2, 3, 4 ];
    deduped_49_1 := [ 1, 2, 3 ];
    deduped_48_1 := [ 1, 2 ];
    deduped_47_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_46_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_45_1 := deduped_46_1[4];
    deduped_44_1 := deduped_47_1[4];
    deduped_43_1 := deduped_47_1[2];
    deduped_42_1 := deduped_46_1[2];
    deduped_41_1 := deduped_47_1[1];
    deduped_40_1 := deduped_46_1[1];
    deduped_39_1 := deduped_40_1 ^ deduped_43_1;
    deduped_38_1 := deduped_42_1 ^ deduped_41_1;
    deduped_37_1 := deduped_42_1 ^ deduped_43_1;
    deduped_36_1 := deduped_40_1 ^ deduped_41_1;
    deduped_35_1 := [ deduped_38_1, deduped_38_1, deduped_39_1, deduped_39_1, deduped_39_1, deduped_39_1 ];
    deduped_34_1 := [ deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_39_1 ];
    deduped_33_1 := [ 0 .. deduped_36_1 - 1 ];
    deduped_32_1 := [ 0 .. deduped_37_1 - 1 ];
    deduped_31_1 := [ 0 .. Product( deduped_34_1 ) - 1 ];
    hoisted_5_1 := Product( deduped_34_1{deduped_50_1} );
    deduped_30_1 := List( deduped_31_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_5_1 ), deduped_39_1 );
        end );
    hoisted_3_1 := Product( deduped_34_1{deduped_49_1} );
    deduped_29_1 := List( deduped_31_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_3_1 ), deduped_39_1 );
        end );
    hoisted_1_1 := Product( deduped_34_1{deduped_48_1} );
    deduped_28_1 := List( deduped_31_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_1_1 ), deduped_38_1 );
        end );
    hoisted_25_1 := List( deduped_45_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_10_1 := [ 0 .. deduped_43_1 - 1 ];
    hoisted_26_1 := List( deduped_32_1, function ( i_2 )
            return Sum( List( deduped_10_1, function ( k_3 )
                      return hoisted_25_1[(1 + REM_INT( QUO_INT( i_2, deduped_42_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_42_1 ))] * deduped_40_1 ^ k_3;
                  end ) );
        end );
    hoisted_23_1 := List( deduped_44_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_12_1 := [ 0 .. deduped_41_1 - 1 ];
    hoisted_24_1 := List( deduped_33_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_12_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_40_1 ^ j_3 ), deduped_40_1 );
                end );
            return Sum( List( deduped_10_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_23_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))])] * deduped_40_1 ^ k_3;
                  end ) );
        end );
    hoisted_21_1 := List( deduped_45_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_22_1 := List( deduped_32_1, function ( i_2 )
            return Sum( List( deduped_10_1, function ( k_3 )
                      return hoisted_21_1[(1 + REM_INT( QUO_INT( i_2, deduped_42_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_42_1 ))] * deduped_40_1 ^ k_3;
                  end ) );
        end );
    hoisted_19_1 := List( deduped_44_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_20_1 := List( deduped_33_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_12_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_40_1 ^ j_3 ), deduped_40_1 );
                end );
            return Sum( List( deduped_10_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_19_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))])] * deduped_40_1 ^ k_3;
                  end ) );
        end );
    hoisted_17_1 := deduped_46_1[3];
    hoisted_18_1 := List( deduped_33_1, function ( i_2 )
            return Sum( List( deduped_12_1, function ( k_3 )
                      return hoisted_17_1[(1 + REM_INT( QUO_INT( i_2, deduped_40_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_40_1 ))] * deduped_42_1 ^ k_3;
                  end ) );
        end );
    hoisted_11_1 := deduped_47_1[3];
    hoisted_15_1 := List( deduped_32_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_10_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_42_1 ^ j_3 ), deduped_42_1 );
                end );
            return Sum( List( deduped_12_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_11_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))])] * deduped_42_1 ^ k_3;
                  end ) );
        end );
    hoisted_27_1 := [ List( deduped_31_1, function ( logic_new_func_x_2 )
                return hoisted_15_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_36_1 ), deduped_37_1 )];
            end ), List( deduped_31_1, function ( logic_new_func_x_2 )
                return hoisted_18_1[1 + REM_INT( logic_new_func_x_2, deduped_36_1 )];
            end ), List( deduped_31_1, function ( logic_new_func_x_2 )
                return hoisted_20_1[1 + REM_INT( logic_new_func_x_2, deduped_36_1 )];
            end ), List( deduped_31_1, function ( logic_new_func_x_2 )
                return hoisted_22_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_36_1 ), deduped_37_1 )];
            end ), List( deduped_31_1, function ( logic_new_func_x_2 )
                return hoisted_24_1[1 + REM_INT( logic_new_func_x_2, deduped_36_1 )];
            end ), List( deduped_31_1, function ( logic_new_func_x_2 )
                return hoisted_26_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_36_1 ), deduped_37_1 )];
            end ) ];
    deduped_8_1 := [ 0, 1, 2, 3, 4, 5 ];
    deduped_7_1 := [ 1, deduped_38_1, Product( deduped_35_1{deduped_48_1} ), Product( deduped_35_1{deduped_49_1} ), Product( deduped_35_1{deduped_50_1} ), Product( deduped_35_1{[ 1, 2, 3, 4, 5 ]} ) ];
    hoisted_6_1 := [ deduped_28_1, deduped_28_1, deduped_29_1, deduped_29_1, deduped_30_1, deduped_30_1 ];
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, Length( Filtered( deduped_31_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return Sum( deduped_8_1, function ( j_3 )
                          local deduped_1_3;
                          deduped_1_3 := 1 + j_3;
                          return hoisted_6_1[deduped_1_3][deduped_1_2] * deduped_7_1[deduped_1_3];
                      end ) = Sum( deduped_8_1, function ( j_3 )
                          local deduped_1_3;
                          deduped_1_3 := 1 + j_3;
                          return hoisted_27_1[deduped_1_3][deduped_1_2] * deduped_7_1[deduped_1_3];
                      end );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local hoisted_3_1, hoisted_5_1, hoisted_7_1, hoisted_8_1, deduped_9_1, deduped_10_1, hoisted_13_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, deduped_29_1, hoisted_30_1, hoisted_32_1, hoisted_34_1, hoisted_35_1, hoisted_36_1, hoisted_37_1, hoisted_39_1, hoisted_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1, deduped_68_1, deduped_69_1;
    deduped_69_1 := [ 1, 2, 3, 4 ];
    deduped_68_1 := [ 1, 2, 3 ];
    deduped_67_1 := [ 1, 2 ];
    deduped_66_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( range_1 );
    deduped_65_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( source_1 );
    deduped_64_1 := Length( Source( alpha_1 ) );
    deduped_63_1 := deduped_66_1[4];
    deduped_62_1 := deduped_65_1[4];
    deduped_61_1 := deduped_66_1[2];
    deduped_60_1 := deduped_66_1[1];
    deduped_59_1 := deduped_65_1[2];
    deduped_58_1 := deduped_65_1[1];
    deduped_57_1 := deduped_60_1 ^ deduped_59_1;
    deduped_56_1 := deduped_61_1 ^ deduped_58_1;
    deduped_55_1 := deduped_61_1 ^ deduped_59_1;
    deduped_54_1 := deduped_60_1 ^ deduped_58_1;
    deduped_53_1 := [ 0 .. deduped_64_1 - 1 ];
    deduped_52_1 := [ 0 .. deduped_59_1 - 1 ];
    deduped_51_1 := [ 0 .. deduped_58_1 - 1 ];
    deduped_50_1 := [ deduped_56_1, deduped_56_1, deduped_57_1, deduped_57_1, deduped_57_1, deduped_57_1 ];
    deduped_49_1 := [ deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_57_1 ];
    deduped_48_1 := [ 0 .. deduped_54_1 - 1 ];
    deduped_47_1 := [ 0 .. deduped_55_1 - 1 ];
    deduped_46_1 := [ 0 .. Product( deduped_49_1 ) - 1 ];
    hoisted_7_1 := Product( deduped_49_1{deduped_69_1} );
    deduped_45_1 := List( deduped_46_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_7_1 ), deduped_57_1 );
        end );
    hoisted_5_1 := Product( deduped_49_1{deduped_68_1} );
    deduped_44_1 := List( deduped_46_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_5_1 ), deduped_57_1 );
        end );
    hoisted_3_1 := Product( deduped_49_1{deduped_67_1} );
    deduped_43_1 := List( deduped_46_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_3_1 ), deduped_56_1 );
        end );
    hoisted_25_1 := List( deduped_63_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_26_1 := List( deduped_47_1, function ( i_2 )
            return Sum( List( deduped_52_1, function ( k_3 )
                      return hoisted_25_1[(1 + REM_INT( QUO_INT( i_2, deduped_61_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_61_1 ))] * deduped_60_1 ^ k_3;
                  end ) );
        end );
    hoisted_23_1 := List( deduped_62_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_24_1 := List( deduped_48_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_51_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_60_1 ^ j_3 ), deduped_60_1 );
                end );
            return Sum( List( deduped_52_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_23_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))])] * deduped_60_1 ^ k_3;
                  end ) );
        end );
    hoisted_21_1 := List( deduped_63_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_22_1 := List( deduped_47_1, function ( i_2 )
            return Sum( List( deduped_52_1, function ( k_3 )
                      return hoisted_21_1[(1 + REM_INT( QUO_INT( i_2, deduped_61_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_61_1 ))] * deduped_60_1 ^ k_3;
                  end ) );
        end );
    hoisted_19_1 := List( deduped_62_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_20_1 := List( deduped_48_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_51_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_60_1 ^ j_3 ), deduped_60_1 );
                end );
            return Sum( List( deduped_52_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_19_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))])] * deduped_60_1 ^ k_3;
                  end ) );
        end );
    hoisted_17_1 := deduped_66_1[3];
    hoisted_18_1 := List( deduped_48_1, function ( i_2 )
            return Sum( List( deduped_51_1, function ( k_3 )
                      return hoisted_17_1[(1 + REM_INT( QUO_INT( i_2, deduped_60_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_60_1 ))] * deduped_61_1 ^ k_3;
                  end ) );
        end );
    hoisted_13_1 := deduped_65_1[3];
    hoisted_16_1 := List( deduped_47_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_52_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_61_1 ^ j_3 ), deduped_61_1 );
                end );
            return Sum( List( deduped_51_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_13_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))])] * deduped_61_1 ^ k_3;
                  end ) );
        end );
    hoisted_27_1 := [ List( deduped_46_1, function ( logic_new_func_x_2 )
                return hoisted_16_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_54_1 ), deduped_55_1 )];
            end ), List( deduped_46_1, function ( logic_new_func_x_2 )
                return hoisted_18_1[1 + REM_INT( logic_new_func_x_2, deduped_54_1 )];
            end ), List( deduped_46_1, function ( logic_new_func_x_2 )
                return hoisted_20_1[1 + REM_INT( logic_new_func_x_2, deduped_54_1 )];
            end ), List( deduped_46_1, function ( logic_new_func_x_2 )
                return hoisted_22_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_54_1 ), deduped_55_1 )];
            end ), List( deduped_46_1, function ( logic_new_func_x_2 )
                return hoisted_24_1[1 + REM_INT( logic_new_func_x_2, deduped_54_1 )];
            end ), List( deduped_46_1, function ( logic_new_func_x_2 )
                return hoisted_26_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_54_1 ), deduped_55_1 )];
            end ) ];
    deduped_10_1 := [ 0, 1, 2, 3, 4, 5 ];
    deduped_9_1 := [ 1, deduped_56_1, Product( deduped_50_1{deduped_67_1} ), Product( deduped_50_1{deduped_68_1} ), Product( deduped_50_1{deduped_69_1} ), Product( deduped_50_1{[ 1, 2, 3, 4, 5 ]} ) ];
    hoisted_8_1 := [ deduped_43_1, deduped_43_1, deduped_44_1, deduped_44_1, deduped_45_1, deduped_45_1 ];
    deduped_42_1 := Filtered( deduped_46_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return Sum( deduped_10_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_8_1[deduped_1_3][deduped_1_2] * deduped_9_1[deduped_1_3];
                  end ) = Sum( deduped_10_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_27_1[deduped_1_3][deduped_1_2] * deduped_9_1[deduped_1_3];
                  end );
        end );
    deduped_41_1 := [ 0 .. Length( deduped_42_1 ) - 1 ];
    hoisted_39_1 := List( [ 0 .. deduped_55_1 * deduped_59_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_61_1 ^ QUO_INT( i_2, deduped_55_1 ) ), deduped_61_1 );
        end );
    hoisted_36_1 := List( deduped_41_1, function ( i_2 )
            return REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_42_1[1 + i_2] ), deduped_54_1 ), deduped_55_1 );
        end );
    deduped_29_1 := AsList( alpha_1 );
    hoisted_37_1 := List( deduped_53_1, function ( i_2 )
            return hoisted_36_1[1 + deduped_29_1[(1 + i_2)]];
        end );
    hoisted_40_1 := List( [ 0 .. deduped_64_1 * deduped_59_1 - 1 ], function ( logic_new_func_x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 );
            return hoisted_39_1[1 + (hoisted_37_1[1 + REM_INT( deduped_1_2, deduped_64_1 )] + REM_INT( QUO_INT( deduped_1_2, deduped_64_1 ), deduped_59_1 ) * deduped_55_1)];
        end );
    hoisted_34_1 := List( [ 0 .. deduped_54_1 * deduped_58_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_60_1 ^ QUO_INT( i_2, deduped_54_1 ) ), deduped_60_1 );
        end );
    hoisted_30_1 := List( deduped_41_1, function ( i_2 )
            return REM_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_42_1[1 + i_2] ), deduped_54_1 );
        end );
    hoisted_32_1 := List( deduped_53_1, function ( i_2 )
            return hoisted_30_1[1 + deduped_29_1[(1 + i_2)]];
        end );
    hoisted_35_1 := List( [ 0 .. deduped_64_1 * deduped_58_1 - 1 ], function ( logic_new_func_x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 );
            return hoisted_34_1[1 + (hoisted_32_1[1 + REM_INT( deduped_1_2, deduped_64_1 )] + REM_INT( QUO_INT( deduped_1_2, deduped_64_1 ), deduped_58_1 ) * deduped_54_1)];
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, DefiningPairOfReflexiveQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( deduped_51_1, function ( i_2 )
                return hoisted_35_1[1 + i_2];
            end ), List( deduped_52_1, function ( i_2 )
                return hoisted_40_1[1 + i_2];
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_3_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1, hoisted_11_1, hoisted_15_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_31_1, hoisted_32_1, hoisted_34_1, hoisted_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1;
    deduped_62_1 := [ 1, 2, 3, 4 ];
    deduped_61_1 := [ 1, 2, 3 ];
    deduped_60_1 := [ 1, 2 ];
    deduped_59_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_58_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_57_1 := deduped_58_1[4];
    deduped_56_1 := deduped_59_1[4];
    deduped_55_1 := deduped_59_1[2];
    deduped_54_1 := deduped_58_1[2];
    deduped_53_1 := deduped_59_1[1];
    deduped_52_1 := deduped_58_1[1];
    deduped_51_1 := deduped_52_1 ^ deduped_55_1;
    deduped_50_1 := deduped_54_1 ^ deduped_53_1;
    deduped_49_1 := deduped_54_1 ^ deduped_55_1;
    deduped_48_1 := deduped_52_1 ^ deduped_53_1;
    deduped_47_1 := [ 0 .. deduped_53_1 - 1 ];
    deduped_46_1 := [ 0 .. deduped_55_1 - 1 ];
    deduped_45_1 := [ deduped_50_1, deduped_50_1, deduped_51_1, deduped_51_1, deduped_51_1, deduped_51_1 ];
    deduped_44_1 := [ deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_51_1 ];
    deduped_43_1 := [ 0 .. deduped_48_1 - 1 ];
    deduped_42_1 := [ 0 .. deduped_49_1 - 1 ];
    deduped_41_1 := [ 0 .. Product( deduped_44_1 ) - 1 ];
    hoisted_5_1 := Product( deduped_44_1{deduped_62_1} );
    deduped_40_1 := List( deduped_41_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_5_1 ), deduped_51_1 );
        end );
    hoisted_3_1 := Product( deduped_44_1{deduped_61_1} );
    deduped_39_1 := List( deduped_41_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_3_1 ), deduped_51_1 );
        end );
    hoisted_1_1 := Product( deduped_44_1{deduped_60_1} );
    deduped_38_1 := List( deduped_41_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_1_1 ), deduped_50_1 );
        end );
    hoisted_25_1 := List( deduped_57_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_26_1 := List( deduped_42_1, function ( i_2 )
            return Sum( List( deduped_46_1, function ( k_3 )
                      return hoisted_25_1[(1 + REM_INT( QUO_INT( i_2, deduped_54_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_54_1 ))] * deduped_52_1 ^ k_3;
                  end ) );
        end );
    hoisted_23_1 := List( deduped_56_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_24_1 := List( deduped_43_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_47_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_52_1 ^ j_3 ), deduped_52_1 );
                end );
            return Sum( List( deduped_46_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_23_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))])] * deduped_52_1 ^ k_3;
                  end ) );
        end );
    hoisted_21_1 := List( deduped_57_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_22_1 := List( deduped_42_1, function ( i_2 )
            return Sum( List( deduped_46_1, function ( k_3 )
                      return hoisted_21_1[(1 + REM_INT( QUO_INT( i_2, deduped_54_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_54_1 ))] * deduped_52_1 ^ k_3;
                  end ) );
        end );
    hoisted_19_1 := List( deduped_56_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_20_1 := List( deduped_43_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_47_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_52_1 ^ j_3 ), deduped_52_1 );
                end );
            return Sum( List( deduped_46_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_19_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))])] * deduped_52_1 ^ k_3;
                  end ) );
        end );
    hoisted_17_1 := deduped_58_1[3];
    hoisted_18_1 := List( deduped_43_1, function ( i_2 )
            return Sum( List( deduped_47_1, function ( k_3 )
                      return hoisted_17_1[(1 + REM_INT( QUO_INT( i_2, deduped_52_1 ^ CAP_JIT_INCOMPLETE_LOGIC( k_3 ) ), deduped_52_1 ))] * deduped_54_1 ^ k_3;
                  end ) );
        end );
    hoisted_11_1 := deduped_59_1[3];
    hoisted_15_1 := List( deduped_42_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_46_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, deduped_54_1 ^ j_3 ), deduped_54_1 );
                end );
            return Sum( List( deduped_47_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_11_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 ))])] * deduped_54_1 ^ k_3;
                  end ) );
        end );
    hoisted_27_1 := [ List( deduped_41_1, function ( logic_new_func_x_2 )
                return hoisted_15_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_48_1 ), deduped_49_1 )];
            end ), List( deduped_41_1, function ( logic_new_func_x_2 )
                return hoisted_18_1[1 + REM_INT( logic_new_func_x_2, deduped_48_1 )];
            end ), List( deduped_41_1, function ( logic_new_func_x_2 )
                return hoisted_20_1[1 + REM_INT( logic_new_func_x_2, deduped_48_1 )];
            end ), List( deduped_41_1, function ( logic_new_func_x_2 )
                return hoisted_22_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_48_1 ), deduped_49_1 )];
            end ), List( deduped_41_1, function ( logic_new_func_x_2 )
                return hoisted_24_1[1 + REM_INT( logic_new_func_x_2, deduped_48_1 )];
            end ), List( deduped_41_1, function ( logic_new_func_x_2 )
                return hoisted_26_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, deduped_48_1 ), deduped_49_1 )];
            end ) ];
    deduped_8_1 := [ 0, 1, 2, 3, 4, 5 ];
    deduped_7_1 := [ 1, deduped_50_1, Product( deduped_45_1{deduped_60_1} ), Product( deduped_45_1{deduped_61_1} ), Product( deduped_45_1{deduped_62_1} ), Product( deduped_45_1{[ 1, 2, 3, 4, 5 ]} ) ];
    hoisted_6_1 := [ deduped_38_1, deduped_38_1, deduped_39_1, deduped_39_1, deduped_40_1, deduped_40_1 ];
    deduped_37_1 := Filtered( deduped_41_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return Sum( deduped_8_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_6_1[deduped_1_3][deduped_1_2] * deduped_7_1[deduped_1_3];
                  end ) = Sum( deduped_8_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_27_1[deduped_1_3][deduped_1_2] * deduped_7_1[deduped_1_3];
                  end );
        end );
    deduped_36_1 := Length( deduped_37_1 );
    hoisted_35_1 := List( [ 0 .. deduped_49_1 * deduped_55_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_54_1 ^ QUO_INT( i_2, deduped_49_1 ) ), deduped_54_1 );
        end );
    hoisted_34_1 := List( deduped_46_1, function ( logic_new_func_x_2 )
            return REM_INT( logic_new_func_x_2, deduped_55_1 );
        end );
    hoisted_32_1 := List( [ 0 .. deduped_48_1 * deduped_53_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_52_1 ^ QUO_INT( i_2, deduped_48_1 ) ), deduped_52_1 );
        end );
    hoisted_31_1 := List( deduped_47_1, function ( logic_new_func_x_2 )
            return REM_INT( logic_new_func_x_2, deduped_53_1 );
        end );
    return List( [ 0 .. deduped_36_1 - 1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
            deduped_4_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 );
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_37_1[1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( deduped_4_2, deduped_36_1 ^ QUO_INT( deduped_4_2, deduped_36_1 ) ), deduped_36_1 ) )] );
            hoisted_2_2 := REM_INT( QUO_INT( deduped_3_2, deduped_48_1 ), deduped_49_1 );
            hoisted_1_2 := REM_INT( deduped_3_2, deduped_48_1 );
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfReflexiveQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( deduped_47_1, function ( logic_new_func_x_3 )
                        return hoisted_32_1[1 + (hoisted_1_2 + hoisted_31_1[(1 + logic_new_func_x_3)] * deduped_48_1)];
                    end ), List( deduped_46_1, function ( logic_new_func_x_3 )
                        return hoisted_35_1[1 + (hoisted_2_2 + hoisted_34_1[(1 + logic_new_func_x_3)] * deduped_49_1)];
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
