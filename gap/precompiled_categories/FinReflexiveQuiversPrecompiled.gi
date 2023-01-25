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
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningQuadrupleOfReflexiveQuiver, NTuple( 4, 0, 0, deduped_1_1, deduped_1_1 ) );
end
########
        
    , 100 );
    
    ##
    AddCoproduct( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1, deduped_8_1;
    deduped_8_1 := [ 1 .. Length( arg2_1 ) ];
    deduped_7_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return DefiningQuadrupleOfReflexiveQuiver( logic_new_func_x_2 )[2];
        end );
    deduped_6_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return DefiningQuadrupleOfReflexiveQuiver( logic_new_func_x_2 )[1];
        end );
    hoisted_5_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return List( DefiningQuadrupleOfReflexiveQuiver( logic_new_func_x_2 )[4], function ( a_3 )
                    return a_3[2];
                end );
        end );
    hoisted_4_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return List( DefiningQuadrupleOfReflexiveQuiver( logic_new_func_x_2 )[4], function ( a_3 )
                    return a_3[1];
                end );
        end );
    hoisted_3_1 := List( arg2_1, function ( logic_new_func_x_2 )
            return DefiningQuadrupleOfReflexiveQuiver( logic_new_func_x_2 )[3];
        end );
    hoisted_2_1 := deduped_7_1;
    hoisted_1_1 := deduped_6_1;
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningQuadrupleOfReflexiveQuiver, NTuple( 4, Sum( deduped_6_1 ), Sum( deduped_7_1 ), Concatenation( List( deduped_8_1, function ( logic_new_func_x_2 )
                  local hoisted_1_2, hoisted_2_2, deduped_3_2;
                  deduped_3_2 := Sum( hoisted_2_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
                  hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + hoisted_2_1[logic_new_func_x_2] - 1 ];
                  hoisted_1_2 := hoisted_3_1[logic_new_func_x_2];
                  return List( [ 0 .. hoisted_1_1[logic_new_func_x_2] - 1 ], function ( i_3 )
                          return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                      end );
              end ) ), ListN( Concatenation( List( deduped_8_1, function ( logic_new_func_x_2 )
                    local hoisted_1_2, hoisted_2_2, deduped_3_2;
                    deduped_3_2 := Sum( hoisted_1_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
                    hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + hoisted_1_1[logic_new_func_x_2] - 1 ];
                    hoisted_1_2 := hoisted_4_1[logic_new_func_x_2];
                    return List( [ 0 .. hoisted_2_1[logic_new_func_x_2] - 1 ], function ( i_3 )
                            return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                        end );
                end ) ), Concatenation( List( deduped_8_1, function ( logic_new_func_x_2 )
                    local hoisted_1_2, hoisted_2_2, deduped_3_2;
                    deduped_3_2 := Sum( hoisted_1_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
                    hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + hoisted_1_1[logic_new_func_x_2] - 1 ];
                    hoisted_1_2 := hoisted_5_1[logic_new_func_x_2];
                    return List( [ 0 .. hoisted_2_1[logic_new_func_x_2] - 1 ], function ( i_3 )
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
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1;
    deduped_51_1 := [ 1, 2, 3, 4 ];
    deduped_50_1 := [ 1, 2, 3 ];
    deduped_49_1 := [ 1, 2 ];
    deduped_48_1 := DefiningQuadrupleOfReflexiveQuiver( arg2_1 );
    deduped_47_1 := DefiningQuadrupleOfReflexiveQuiver( arg3_1 );
    deduped_46_1 := deduped_47_1[4];
    deduped_45_1 := deduped_48_1[4];
    deduped_44_1 := deduped_48_1[2];
    deduped_43_1 := deduped_47_1[2];
    deduped_42_1 := deduped_48_1[1];
    deduped_41_1 := deduped_47_1[1];
    deduped_40_1 := deduped_41_1 ^ deduped_44_1;
    deduped_39_1 := deduped_43_1 ^ deduped_42_1;
    deduped_38_1 := deduped_43_1 ^ deduped_44_1;
    deduped_37_1 := deduped_41_1 ^ deduped_42_1;
    deduped_36_1 := [ deduped_39_1, deduped_39_1, deduped_40_1, deduped_40_1, deduped_40_1, deduped_40_1 ];
    deduped_35_1 := [ deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_40_1 ];
    deduped_34_1 := [ 0 .. deduped_37_1 - 1 ];
    deduped_33_1 := [ 0 .. deduped_38_1 - 1 ];
    deduped_32_1 := [ 0 .. Product( deduped_35_1 ) - 1 ];
    hoisted_5_1 := Product( deduped_35_1{deduped_51_1} );
    hoisted_4_1 := deduped_40_1;
    deduped_31_1 := List( deduped_32_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_5_1 ), hoisted_4_1 );
        end );
    hoisted_3_1 := Product( deduped_35_1{deduped_50_1} );
    deduped_30_1 := List( deduped_32_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_3_1 ), hoisted_4_1 );
        end );
    hoisted_2_1 := deduped_39_1;
    hoisted_1_1 := Product( deduped_35_1{deduped_49_1} );
    deduped_29_1 := List( deduped_32_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_1_1 ), hoisted_2_1 );
        end );
    hoisted_26_1 := List( deduped_46_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_17_1 := deduped_41_1;
    hoisted_11_1 := [ 0 .. deduped_44_1 - 1 ];
    hoisted_10_1 := deduped_43_1;
    hoisted_27_1 := List( deduped_33_1, function ( i_2 )
            return Sum( List( hoisted_11_1, function ( k_3 )
                      return hoisted_26_1[(1 + REM_INT( QUO_INT( i_2, hoisted_10_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_11_1[(1 + k_3)] ) ), hoisted_10_1 ))] * hoisted_17_1 ^ k_3;
                  end ) );
        end );
    hoisted_24_1 := List( deduped_45_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_12_1 := [ 0 .. deduped_42_1 - 1 ];
    hoisted_25_1 := List( deduped_34_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_12_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_17_1 ^ j_3 ), hoisted_17_1 );
                end );
            return Sum( List( hoisted_11_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_24_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_11_1[(1 + k_3)] ))])] * hoisted_17_1 ^ k_3;
                  end ) );
        end );
    hoisted_22_1 := List( deduped_46_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_23_1 := List( deduped_33_1, function ( i_2 )
            return Sum( List( hoisted_11_1, function ( k_3 )
                      return hoisted_22_1[(1 + REM_INT( QUO_INT( i_2, hoisted_10_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_11_1[(1 + k_3)] ) ), hoisted_10_1 ))] * hoisted_17_1 ^ k_3;
                  end ) );
        end );
    hoisted_20_1 := List( deduped_45_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_21_1 := List( deduped_34_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_12_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_17_1 ^ j_3 ), hoisted_17_1 );
                end );
            return Sum( List( hoisted_11_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_20_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_11_1[(1 + k_3)] ))])] * hoisted_17_1 ^ k_3;
                  end ) );
        end );
    hoisted_18_1 := deduped_47_1[3];
    hoisted_19_1 := List( deduped_34_1, function ( i_2 )
            return Sum( List( hoisted_12_1, function ( k_3 )
                      return hoisted_18_1[(1 + REM_INT( QUO_INT( i_2, hoisted_17_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_12_1[(1 + k_3)] ) ), hoisted_17_1 ))] * hoisted_10_1 ^ k_3;
                  end ) );
        end );
    hoisted_13_1 := deduped_48_1[3];
    hoisted_16_1 := List( deduped_33_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_11_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_10_1 ^ j_3 ), hoisted_10_1 );
                end );
            return Sum( List( hoisted_12_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_13_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_12_1[(1 + k_3)] ))])] * hoisted_10_1 ^ k_3;
                  end ) );
        end );
    hoisted_15_1 := deduped_38_1;
    hoisted_14_1 := deduped_37_1;
    hoisted_28_1 := [ List( deduped_32_1, function ( logic_new_func_x_2 )
                return hoisted_16_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_14_1 ), hoisted_15_1 )];
            end ), List( deduped_32_1, function ( logic_new_func_x_2 )
                return hoisted_19_1[1 + REM_INT( logic_new_func_x_2, hoisted_14_1 )];
            end ), List( deduped_32_1, function ( logic_new_func_x_2 )
                return hoisted_21_1[1 + REM_INT( logic_new_func_x_2, hoisted_14_1 )];
            end ), List( deduped_32_1, function ( logic_new_func_x_2 )
                return hoisted_23_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_14_1 ), hoisted_15_1 )];
            end ), List( deduped_32_1, function ( logic_new_func_x_2 )
                return hoisted_25_1[1 + REM_INT( logic_new_func_x_2, hoisted_14_1 )];
            end ), List( deduped_32_1, function ( logic_new_func_x_2 )
                return hoisted_27_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_14_1 ), hoisted_15_1 )];
            end ) ];
    hoisted_9_1 := [ 0, 1, 2, 3, 4, 5 ];
    hoisted_8_1 := [ 1, deduped_39_1, Product( deduped_36_1{deduped_49_1} ), Product( deduped_36_1{deduped_50_1} ), Product( deduped_36_1{deduped_51_1} ), Product( deduped_36_1{[ 1, 2, 3, 4, 5 ]} ) ];
    hoisted_7_1 := deduped_32_1;
    hoisted_6_1 := [ deduped_29_1, deduped_29_1, deduped_30_1, deduped_30_1, deduped_31_1, deduped_31_1 ];
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, Length( Filtered( deduped_32_1, function ( x_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_7_1[(1 + x_2)] );
                return Sum( hoisted_9_1, function ( j_3 )
                          local deduped_1_3;
                          deduped_1_3 := 1 + j_3;
                          return hoisted_6_1[deduped_1_3][hoisted_1_2] * hoisted_8_1[deduped_1_3];
                      end ) = Sum( hoisted_9_1, function ( j_3 )
                          local deduped_1_3;
                          deduped_1_3 := 1 + j_3;
                          return hoisted_28_1[deduped_1_3][hoisted_1_2] * hoisted_8_1[deduped_1_3];
                      end );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, hoisted_34_1, hoisted_35_1, hoisted_36_1, hoisted_37_1, hoisted_38_1, hoisted_39_1, hoisted_40_1, hoisted_41_1, hoisted_42_1, hoisted_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1, deduped_68_1, deduped_69_1, deduped_70_1, deduped_71_1, deduped_72_1, deduped_73_1, deduped_74_1;
    deduped_74_1 := [ 1, 2, 3, 4 ];
    deduped_73_1 := [ 1, 2, 3 ];
    deduped_72_1 := [ 1, 2 ];
    deduped_71_1 := DefiningQuadrupleOfReflexiveQuiver( range_1 );
    deduped_70_1 := DefiningQuadrupleOfReflexiveQuiver( source_1 );
    deduped_69_1 := Length( Source( alpha_1 ) );
    deduped_68_1 := deduped_71_1[4];
    deduped_67_1 := deduped_70_1[4];
    deduped_66_1 := deduped_71_1[2];
    deduped_65_1 := deduped_71_1[1];
    deduped_64_1 := deduped_70_1[2];
    deduped_63_1 := deduped_70_1[1];
    deduped_62_1 := deduped_65_1 ^ deduped_64_1;
    deduped_61_1 := deduped_66_1 ^ deduped_63_1;
    deduped_60_1 := deduped_66_1 ^ deduped_64_1;
    deduped_59_1 := deduped_65_1 ^ deduped_63_1;
    deduped_58_1 := [ 0 .. deduped_69_1 - 1 ];
    deduped_57_1 := [ 0 .. deduped_64_1 - 1 ];
    deduped_56_1 := [ 0 .. deduped_63_1 - 1 ];
    deduped_55_1 := [ deduped_61_1, deduped_61_1, deduped_62_1, deduped_62_1, deduped_62_1, deduped_62_1 ];
    deduped_54_1 := [ deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_62_1 ];
    deduped_53_1 := [ 0 .. deduped_69_1 * deduped_64_1 - 1 ];
    deduped_52_1 := [ 0 .. deduped_69_1 * deduped_63_1 - 1 ];
    deduped_51_1 := [ 0 .. deduped_59_1 - 1 ];
    deduped_50_1 := [ 0 .. deduped_60_1 - 1 ];
    deduped_49_1 := [ 0 .. Product( deduped_54_1 ) - 1 ];
    hoisted_7_1 := Product( deduped_54_1{deduped_74_1} );
    hoisted_6_1 := deduped_62_1;
    deduped_48_1 := List( deduped_49_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_7_1 ), hoisted_6_1 );
        end );
    hoisted_5_1 := Product( deduped_54_1{deduped_73_1} );
    deduped_47_1 := List( deduped_49_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_5_1 ), hoisted_6_1 );
        end );
    hoisted_4_1 := deduped_61_1;
    hoisted_3_1 := Product( deduped_54_1{deduped_72_1} );
    deduped_46_1 := List( deduped_49_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_3_1 ), hoisted_4_1 );
        end );
    hoisted_26_1 := List( deduped_68_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_13_1 := deduped_57_1;
    hoisted_12_1 := deduped_66_1;
    hoisted_2_1 := deduped_65_1;
    hoisted_27_1 := List( deduped_50_1, function ( i_2 )
            return Sum( List( hoisted_13_1, function ( k_3 )
                      return hoisted_26_1[(1 + REM_INT( QUO_INT( i_2, hoisted_12_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_13_1[(1 + k_3)] ) ), hoisted_12_1 ))] * hoisted_2_1 ^ k_3;
                  end ) );
        end );
    hoisted_24_1 := List( deduped_67_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_14_1 := deduped_56_1;
    hoisted_25_1 := List( deduped_51_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_14_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_2_1 ^ j_3 ), hoisted_2_1 );
                end );
            return Sum( List( hoisted_13_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_24_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_13_1[(1 + k_3)] ))])] * hoisted_2_1 ^ k_3;
                  end ) );
        end );
    hoisted_22_1 := List( deduped_68_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_23_1 := List( deduped_50_1, function ( i_2 )
            return Sum( List( hoisted_13_1, function ( k_3 )
                      return hoisted_22_1[(1 + REM_INT( QUO_INT( i_2, hoisted_12_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_13_1[(1 + k_3)] ) ), hoisted_12_1 ))] * hoisted_2_1 ^ k_3;
                  end ) );
        end );
    hoisted_20_1 := List( deduped_67_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_21_1 := List( deduped_51_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_14_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_2_1 ^ j_3 ), hoisted_2_1 );
                end );
            return Sum( List( hoisted_13_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_20_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_13_1[(1 + k_3)] ))])] * hoisted_2_1 ^ k_3;
                  end ) );
        end );
    hoisted_18_1 := deduped_71_1[3];
    hoisted_19_1 := List( deduped_51_1, function ( i_2 )
            return Sum( List( hoisted_14_1, function ( k_3 )
                      return hoisted_18_1[(1 + REM_INT( QUO_INT( i_2, hoisted_2_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_14_1[(1 + k_3)] ) ), hoisted_2_1 ))] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_15_1 := deduped_70_1[3];
    hoisted_17_1 := List( deduped_50_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_13_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_12_1 ^ j_3 ), hoisted_12_1 );
                end );
            return Sum( List( hoisted_14_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_15_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_14_1[(1 + k_3)] ))])] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_16_1 := deduped_60_1;
    hoisted_1_1 := deduped_59_1;
    hoisted_28_1 := [ List( deduped_49_1, function ( logic_new_func_x_2 )
                return hoisted_17_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_1_1 ), hoisted_16_1 )];
            end ), List( deduped_49_1, function ( logic_new_func_x_2 )
                return hoisted_19_1[1 + REM_INT( logic_new_func_x_2, hoisted_1_1 )];
            end ), List( deduped_49_1, function ( logic_new_func_x_2 )
                return hoisted_21_1[1 + REM_INT( logic_new_func_x_2, hoisted_1_1 )];
            end ), List( deduped_49_1, function ( logic_new_func_x_2 )
                return hoisted_23_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_1_1 ), hoisted_16_1 )];
            end ), List( deduped_49_1, function ( logic_new_func_x_2 )
                return hoisted_25_1[1 + REM_INT( logic_new_func_x_2, hoisted_1_1 )];
            end ), List( deduped_49_1, function ( logic_new_func_x_2 )
                return hoisted_27_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_1_1 ), hoisted_16_1 )];
            end ) ];
    hoisted_11_1 := [ 0, 1, 2, 3, 4, 5 ];
    hoisted_10_1 := [ 1, deduped_61_1, Product( deduped_55_1{deduped_72_1} ), Product( deduped_55_1{deduped_73_1} ), Product( deduped_55_1{deduped_74_1} ), Product( deduped_55_1{[ 1, 2, 3, 4, 5 ]} ) ];
    hoisted_9_1 := deduped_49_1;
    hoisted_8_1 := [ deduped_46_1, deduped_46_1, deduped_47_1, deduped_47_1, deduped_48_1, deduped_48_1 ];
    deduped_45_1 := Filtered( deduped_49_1, function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_9_1[(1 + x_2)] );
            return Sum( hoisted_11_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_8_1[deduped_1_3][hoisted_1_2] * hoisted_10_1[deduped_1_3];
                  end ) = Sum( hoisted_11_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_28_1[deduped_1_3][hoisted_1_2] * hoisted_10_1[deduped_1_3];
                  end );
        end );
    deduped_44_1 := [ 0 .. Length( deduped_45_1 ) - 1 ];
    hoisted_42_1 := List( [ 0 .. deduped_60_1 * deduped_64_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_12_1 ^ QUO_INT( i_2, hoisted_16_1 ) ), hoisted_12_1 );
        end );
    hoisted_41_1 := deduped_64_1;
    hoisted_29_1 := deduped_45_1;
    hoisted_38_1 := List( deduped_44_1, function ( i_2 )
            return REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_9_1[1 + hoisted_29_1[(1 + i_2)]] ), hoisted_1_1 ), hoisted_16_1 );
        end );
    hoisted_30_1 := AsList( alpha_1 );
    hoisted_40_1 := List( deduped_58_1, function ( i_2 )
            return hoisted_38_1[1 + hoisted_30_1[(1 + i_2)]];
        end );
    hoisted_39_1 := deduped_53_1;
    hoisted_33_1 := deduped_69_1;
    hoisted_43_1 := List( deduped_53_1, function ( logic_new_func_x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_39_1[1 + logic_new_func_x_2] );
            return hoisted_42_1[1 + (hoisted_40_1[1 + REM_INT( deduped_1_2, hoisted_33_1 )] + REM_INT( QUO_INT( deduped_1_2, hoisted_33_1 ), hoisted_41_1 ) * hoisted_16_1)];
        end );
    hoisted_36_1 := List( [ 0 .. deduped_59_1 * deduped_63_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_2_1 ^ QUO_INT( i_2, hoisted_1_1 ) ), hoisted_2_1 );
        end );
    hoisted_35_1 := deduped_63_1;
    hoisted_31_1 := List( deduped_44_1, function ( i_2 )
            return REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_9_1[1 + hoisted_29_1[(1 + i_2)]] ), hoisted_1_1 );
        end );
    hoisted_34_1 := List( deduped_58_1, function ( i_2 )
            return hoisted_31_1[1 + hoisted_30_1[(1 + i_2)]];
        end );
    hoisted_32_1 := deduped_52_1;
    hoisted_37_1 := List( deduped_52_1, function ( logic_new_func_x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_32_1[1 + logic_new_func_x_2] );
            return hoisted_36_1[1 + (hoisted_34_1[1 + REM_INT( deduped_1_2, hoisted_33_1 )] + REM_INT( QUO_INT( deduped_1_2, hoisted_33_1 ), hoisted_35_1 ) * hoisted_1_1)];
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, DefiningPairOfReflexiveQuiverMorphism, NTuple( 2, List( deduped_56_1, function ( i_2 )
                return hoisted_37_1[1 + i_2];
            end ), List( deduped_57_1, function ( i_2 )
                return hoisted_43_1[1 + i_2];
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, hoisted_34_1, hoisted_35_1, hoisted_36_1, hoisted_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1;
    deduped_65_1 := [ 1, 2, 3, 4 ];
    deduped_64_1 := [ 1, 2, 3 ];
    deduped_63_1 := [ 1, 2 ];
    deduped_62_1 := DefiningQuadrupleOfReflexiveQuiver( arg2_1 );
    deduped_61_1 := DefiningQuadrupleOfReflexiveQuiver( arg3_1 );
    deduped_60_1 := deduped_61_1[4];
    deduped_59_1 := deduped_62_1[4];
    deduped_58_1 := deduped_62_1[2];
    deduped_57_1 := deduped_61_1[2];
    deduped_56_1 := deduped_62_1[1];
    deduped_55_1 := deduped_61_1[1];
    deduped_54_1 := deduped_55_1 ^ deduped_58_1;
    deduped_53_1 := deduped_57_1 ^ deduped_56_1;
    deduped_52_1 := deduped_57_1 ^ deduped_58_1;
    deduped_51_1 := deduped_55_1 ^ deduped_56_1;
    deduped_50_1 := [ 0 .. deduped_56_1 - 1 ];
    deduped_49_1 := [ 0 .. deduped_58_1 - 1 ];
    deduped_48_1 := [ deduped_53_1, deduped_53_1, deduped_54_1, deduped_54_1, deduped_54_1, deduped_54_1 ];
    deduped_47_1 := [ deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_54_1 ];
    deduped_46_1 := [ 0 .. deduped_51_1 - 1 ];
    deduped_45_1 := [ 0 .. deduped_52_1 - 1 ];
    deduped_44_1 := [ 0 .. Product( deduped_47_1 ) - 1 ];
    hoisted_5_1 := Product( deduped_47_1{deduped_65_1} );
    hoisted_4_1 := deduped_54_1;
    deduped_43_1 := List( deduped_44_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_5_1 ), hoisted_4_1 );
        end );
    hoisted_3_1 := Product( deduped_47_1{deduped_64_1} );
    deduped_42_1 := List( deduped_44_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_3_1 ), hoisted_4_1 );
        end );
    hoisted_2_1 := deduped_53_1;
    hoisted_1_1 := Product( deduped_47_1{deduped_63_1} );
    deduped_41_1 := List( deduped_44_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_1_1 ), hoisted_2_1 );
        end );
    hoisted_26_1 := List( deduped_60_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_17_1 := deduped_55_1;
    hoisted_11_1 := deduped_49_1;
    hoisted_10_1 := deduped_57_1;
    hoisted_27_1 := List( deduped_45_1, function ( i_2 )
            return Sum( List( hoisted_11_1, function ( k_3 )
                      return hoisted_26_1[(1 + REM_INT( QUO_INT( i_2, hoisted_10_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_11_1[(1 + k_3)] ) ), hoisted_10_1 ))] * hoisted_17_1 ^ k_3;
                  end ) );
        end );
    hoisted_24_1 := List( deduped_59_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_12_1 := deduped_50_1;
    hoisted_25_1 := List( deduped_46_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_12_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_17_1 ^ j_3 ), hoisted_17_1 );
                end );
            return Sum( List( hoisted_11_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_24_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_11_1[(1 + k_3)] ))])] * hoisted_17_1 ^ k_3;
                  end ) );
        end );
    hoisted_22_1 := List( deduped_60_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_23_1 := List( deduped_45_1, function ( i_2 )
            return Sum( List( hoisted_11_1, function ( k_3 )
                      return hoisted_22_1[(1 + REM_INT( QUO_INT( i_2, hoisted_10_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_11_1[(1 + k_3)] ) ), hoisted_10_1 ))] * hoisted_17_1 ^ k_3;
                  end ) );
        end );
    hoisted_20_1 := List( deduped_59_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_21_1 := List( deduped_46_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_12_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_17_1 ^ j_3 ), hoisted_17_1 );
                end );
            return Sum( List( hoisted_11_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_20_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_11_1[(1 + k_3)] ))])] * hoisted_17_1 ^ k_3;
                  end ) );
        end );
    hoisted_18_1 := deduped_61_1[3];
    hoisted_19_1 := List( deduped_46_1, function ( i_2 )
            return Sum( List( hoisted_12_1, function ( k_3 )
                      return hoisted_18_1[(1 + REM_INT( QUO_INT( i_2, hoisted_17_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_12_1[(1 + k_3)] ) ), hoisted_17_1 ))] * hoisted_10_1 ^ k_3;
                  end ) );
        end );
    hoisted_13_1 := deduped_62_1[3];
    hoisted_16_1 := List( deduped_45_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_11_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_10_1 ^ j_3 ), hoisted_10_1 );
                end );
            return Sum( List( hoisted_12_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_13_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_12_1[(1 + k_3)] ))])] * hoisted_10_1 ^ k_3;
                  end ) );
        end );
    hoisted_15_1 := deduped_52_1;
    hoisted_14_1 := deduped_51_1;
    hoisted_28_1 := [ List( deduped_44_1, function ( logic_new_func_x_2 )
                return hoisted_16_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_14_1 ), hoisted_15_1 )];
            end ), List( deduped_44_1, function ( logic_new_func_x_2 )
                return hoisted_19_1[1 + REM_INT( logic_new_func_x_2, hoisted_14_1 )];
            end ), List( deduped_44_1, function ( logic_new_func_x_2 )
                return hoisted_21_1[1 + REM_INT( logic_new_func_x_2, hoisted_14_1 )];
            end ), List( deduped_44_1, function ( logic_new_func_x_2 )
                return hoisted_23_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_14_1 ), hoisted_15_1 )];
            end ), List( deduped_44_1, function ( logic_new_func_x_2 )
                return hoisted_25_1[1 + REM_INT( logic_new_func_x_2, hoisted_14_1 )];
            end ), List( deduped_44_1, function ( logic_new_func_x_2 )
                return hoisted_27_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_14_1 ), hoisted_15_1 )];
            end ) ];
    hoisted_9_1 := [ 0, 1, 2, 3, 4, 5 ];
    hoisted_8_1 := [ 1, deduped_53_1, Product( deduped_48_1{deduped_63_1} ), Product( deduped_48_1{deduped_64_1} ), Product( deduped_48_1{deduped_65_1} ), Product( deduped_48_1{[ 1, 2, 3, 4, 5 ]} ) ];
    hoisted_7_1 := deduped_44_1;
    hoisted_6_1 := [ deduped_41_1, deduped_41_1, deduped_42_1, deduped_42_1, deduped_43_1, deduped_43_1 ];
    deduped_40_1 := Filtered( deduped_44_1, function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_7_1[(1 + x_2)] );
            return Sum( hoisted_9_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_6_1[deduped_1_3][hoisted_1_2] * hoisted_8_1[deduped_1_3];
                  end ) = Sum( hoisted_9_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_28_1[deduped_1_3][hoisted_1_2] * hoisted_8_1[deduped_1_3];
                  end );
        end );
    deduped_39_1 := Length( deduped_40_1 );
    deduped_38_1 := [ 0 .. deduped_39_1 - 1 ];
    hoisted_37_1 := List( [ 0 .. deduped_52_1 * deduped_58_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_10_1 ^ QUO_INT( i_2, hoisted_15_1 ) ), hoisted_10_1 );
        end );
    hoisted_35_1 := deduped_58_1;
    hoisted_36_1 := List( deduped_49_1, function ( logic_new_func_x_2 )
            return REM_INT( logic_new_func_x_2, hoisted_35_1 );
        end );
    hoisted_34_1 := List( [ 0 .. deduped_51_1 * deduped_56_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_17_1 ^ QUO_INT( i_2, hoisted_14_1 ) ), hoisted_17_1 );
        end );
    hoisted_32_1 := deduped_56_1;
    hoisted_33_1 := List( deduped_50_1, function ( logic_new_func_x_2 )
            return REM_INT( logic_new_func_x_2, hoisted_32_1 );
        end );
    hoisted_31_1 := deduped_40_1;
    hoisted_30_1 := deduped_39_1;
    hoisted_29_1 := deduped_38_1;
    return List( deduped_38_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
            deduped_4_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_29_1[1 + logic_new_func_x_2] );
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_7_1[1 + hoisted_31_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_29_1[(1 + REM_INT( QUO_INT( deduped_4_2, hoisted_30_1 ^ QUO_INT( deduped_4_2, hoisted_30_1 ) ), hoisted_30_1 ))] ))]] );
            hoisted_2_2 := REM_INT( QUO_INT( deduped_3_2, hoisted_14_1 ), hoisted_15_1 );
            hoisted_1_2 := REM_INT( deduped_3_2, hoisted_14_1 );
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfReflexiveQuiverMorphism, NTuple( 2, List( hoisted_12_1, function ( logic_new_func_x_3 )
                        return hoisted_34_1[1 + (hoisted_1_2 + hoisted_33_1[(1 + logic_new_func_x_3)] * hoisted_14_1)];
                    end ), List( hoisted_11_1, function ( logic_new_func_x_3 )
                        return hoisted_37_1[1 + (hoisted_2_2 + hoisted_36_1[(1 + logic_new_func_x_3)] * hoisted_15_1)];
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
