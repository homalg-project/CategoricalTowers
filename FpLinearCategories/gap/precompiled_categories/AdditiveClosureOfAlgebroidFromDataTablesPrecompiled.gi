# SPDX-License-Identifier: GPL-2.0-or-later
# FpLinearCategories: Finitely presented linear categories by generating quivers and relations
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_AdditiveClosureOfAlgebroidFromDataTablesPrecompiled", function ( cat )
    
    ##
    AddAdditionForMorphisms( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, deduped_9_1, deduped_10_1, deduped_11_1;
    deduped_11_1 := MorphismMatrix( alpha_1 );
    deduped_10_1 := Range( alpha_1 );
    deduped_9_1 := Source( alpha_1 );
    hoisted_8_1 := [ 1 .. Length( ObjectList( deduped_10_1 ) ) ];
    hoisted_7_1 := UnderlyingCategory( cat_1 );
    hoisted_6_1 := List( MorphismMatrix( beta_1 ), function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, CoefficientsList );
        end );
    hoisted_5_1 := List( deduped_11_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, CoefficientsList );
        end );
    hoisted_4_1 := List( deduped_11_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, Target );
        end );
    hoisted_3_1 := List( deduped_11_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, Source );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_9_1, deduped_10_1, MorphismMatrix, List( [ 1 .. Length( ObjectList( deduped_9_1 ) ) ], function ( i_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2;
              hoisted_4_2 := hoisted_6_1[i_2];
              hoisted_3_2 := hoisted_5_1[i_2];
              hoisted_2_2 := hoisted_4_1[i_2];
              hoisted_1_2 := hoisted_3_1[i_2];
              return List( hoisted_8_1, function ( j_3 )
                      return CreateCapCategoryMorphismWithAttributes( hoisted_7_1, hoisted_1_2[j_3], hoisted_2_2[j_3], CoefficientsList, Sum( [ hoisted_3_2[j_3], hoisted_4_2[j_3] ] ) );
                  end );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddAdditiveInverseForMorphisms( cat,
        
########
function ( cat_1, alpha_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1, deduped_8_1;
    deduped_8_1 := MorphismMatrix( alpha_1 );
    deduped_7_1 := Range( alpha_1 );
    deduped_6_1 := Source( alpha_1 );
    hoisted_5_1 := [ 1 .. Length( ObjectList( deduped_7_1 ) ) ];
    hoisted_4_1 := UnderlyingCategory( cat_1 );
    hoisted_3_1 := List( deduped_8_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return List( CoefficientsList( logic_new_func_x_3 ), AdditiveInverseSameMutability );
                end );
        end );
    hoisted_2_1 := List( deduped_8_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, Target );
        end );
    hoisted_1_1 := List( deduped_8_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, Source );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_6_1, deduped_7_1, MorphismMatrix, List( [ 1 .. Length( ObjectList( deduped_6_1 ) ) ], function ( i_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2;
              hoisted_3_2 := hoisted_3_1[i_2];
              hoisted_2_2 := hoisted_2_1[i_2];
              hoisted_1_2 := hoisted_1_1[i_2];
              return List( hoisted_5_1, function ( j_3 )
                      return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, hoisted_1_2[j_3], hoisted_2_2[j_3], CoefficientsList, hoisted_3_2[j_3] );
                  end );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddComponentOfMorphismFromDirectSum( cat,
        
########
function ( cat_1, alpha_1, S_1, i_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := List( S_1, function ( s_2 )
            return Length( ObjectList( s_2 ) );
        end );
    deduped_1_1 := Sum( deduped_2_1{[ 1 .. i_1 - 1 ]} );
    return CreateCapCategoryMorphismWithAttributes( cat_1, S_1[i_1], Range( alpha_1 ), MorphismMatrix, MorphismMatrix( alpha_1 ){[ deduped_1_1 + 1 .. deduped_1_1 + deduped_2_1[i_1] ]} );
end
########
        
    , 100 );
    
    ##
    AddComponentOfMorphismIntoDirectSum( cat,
        
########
function ( cat_1, alpha_1, S_1, i_1 )
    local hoisted_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := List( S_1, function ( s_2 )
            return Length( ObjectList( s_2 ) );
        end );
    deduped_2_1 := Sum( deduped_3_1{[ 1 .. i_1 - 1 ]} );
    hoisted_1_1 := [ deduped_2_1 + 1 .. deduped_2_1 + deduped_3_1[i_1] ];
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), S_1[i_1], MorphismMatrix, List( MorphismMatrix( alpha_1 ), function ( row_2 )
              return row_2{hoisted_1_1};
          end ) );
end
########
        
    , 100 );
    
    ##
    AddDirectSum( cat,
        
########
function ( cat_1, objects_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, ObjectList, Concatenation( List( [ 1 .. Length( objects_1 ) ], function ( i_2 )
                return CAP_JIT_INCOMPLETE_LOGIC( ObjectList( CAP_JIT_INCOMPLETE_LOGIC( objects_1[i_2] ) ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.DirectSum :=
        
########
function ( cat_1, objects_1 )
    local hoisted_1_1;
    hoisted_1_1 := List( objects_1, ObjectList );
    return CreateCapCategoryObjectWithAttributes( cat_1, ObjectList, Concatenation( List( [ 1 .. Length( objects_1 ) ], function ( i_2 )
                return hoisted_1_1[i_2];
            end ) ) );
end
########
        
    ;
    
    ##
    AddDistinguishedObjectOfHomomorphismStructure( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), RankOfObject, 1 );
end
########
        
    , 100 );
    
    ##
    AddHomomorphismStructureOnMorphismsWithGivenObjects( cat,
        
########
function ( cat_1, source_1, alpha_1, beta_1, range_1 )
    local deduped_2_1, hoisted_3_1, deduped_4_1, hoisted_6_1, deduped_7_1, deduped_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1;
    deduped_30_1 := MorphismMatrix( beta_1 );
    deduped_29_1 := MorphismMatrix( alpha_1 );
    deduped_28_1 := UnderlyingCategory( cat_1 );
    deduped_27_1 := RankOfObject( range_1 );
    deduped_26_1 := ObjectList( Range( beta_1 ) );
    deduped_25_1 := ObjectList( Source( alpha_1 ) );
    deduped_24_1 := ObjectList( Source( beta_1 ) );
    deduped_23_1 := ObjectList( Range( alpha_1 ) );
    deduped_22_1 := [ 1 .. Length( deduped_25_1 ) ];
    hoisted_20_1 := List( deduped_30_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return ObjectIndex( Target( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_19_1 := List( deduped_30_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return ObjectIndex( Source( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_18_1 := List( deduped_29_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return ObjectIndex( Target( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_17_1 := HomomorphismStructureOnMorphismsMatrices( deduped_28_1 );
    hoisted_16_1 := List( deduped_29_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return ObjectIndex( Source( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_15_1 := List( deduped_30_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, IndicesOfSupportMorphisms );
        end );
    hoisted_14_1 := List( deduped_30_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, CoefficientsList );
        end );
    hoisted_13_1 := List( deduped_29_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, IndicesOfSupportMorphisms );
        end );
    hoisted_12_1 := List( deduped_29_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, CoefficientsList );
        end );
    hoisted_11_1 := List( deduped_30_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return Length( IndicesOfSupportMorphisms( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_10_1 := List( deduped_29_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return Length( IndicesOfSupportMorphisms( logic_new_func_x_3 ) );
                end );
        end );
    deduped_7_1 := [ 1 .. Length( deduped_26_1 ) ];
    hoisted_6_1 := List( deduped_26_1, ObjectIndex );
    deduped_2_1 := HomomorphismStructureOnObjectsRanks( deduped_28_1 );
    deduped_8_1 := List( deduped_22_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_2_1[CAP_JIT_INCOMPLETE_LOGIC( ObjectIndex( CAP_JIT_INCOMPLETE_LOGIC( deduped_25_1[i_2] ) ) )];
            return List( deduped_7_1, function ( t_3 )
                    return hoisted_1_2[hoisted_6_1[t_3]];
                end );
        end );
    hoisted_9_1 := List( deduped_22_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_8_1[i_2];
            return Sum( List( deduped_7_1, function ( i_3 )
                      return CAP_JIT_INCOMPLETE_LOGIC( hoisted_1_2[CAP_JIT_INCOMPLETE_LOGIC( i_3 )] );
                  end ) );
        end );
    deduped_4_1 := [ 1 .. Length( deduped_24_1 ) ];
    hoisted_3_1 := List( deduped_24_1, ObjectIndex );
    return CreateCapCategoryMorphismWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), source_1, range_1, UnderlyingMatrix, HomalgMatrixListList( UnionOfRowsListList( deduped_27_1, List( [ 1 .. Length( deduped_23_1 ) ], function ( j_2 )
                  local hoisted_1_2, deduped_2_2;
                  hoisted_1_2 := deduped_2_1[CAP_JIT_INCOMPLETE_LOGIC( ObjectIndex( CAP_JIT_INCOMPLETE_LOGIC( deduped_23_1[CAP_JIT_INCOMPLETE_LOGIC( j_2 )] ) ) )];
                  deduped_2_2 := CAP_JIT_INCOMPLETE_LOGIC( List( deduped_4_1, function ( s_3 )
                            return hoisted_1_2[hoisted_3_1[s_3]];
                        end ) );
                  return UnionOfColumnsListList( Sum( List( deduped_4_1, function ( i_3 )
                              return CAP_JIT_INCOMPLETE_LOGIC( deduped_2_2[CAP_JIT_INCOMPLETE_LOGIC( i_3 )] );
                          end ) ), List( deduped_22_1, function ( i_3 )
                            local hoisted_1_3, deduped_2_3, hoisted_3_3, hoisted_4_3, hoisted_5_3, hoisted_6_3, hoisted_7_3, deduped_8_3;
                            deduped_8_3 := hoisted_10_1[i_3][j_2];
                            hoisted_7_3 := [ 1 .. deduped_8_3 ];
                            hoisted_6_3 := hoisted_17_1[hoisted_16_1[i_3][j_2]][hoisted_18_1[i_3][j_2]];
                            hoisted_5_3 := hoisted_12_1[i_3][j_2];
                            hoisted_4_3 := hoisted_13_1[i_3][j_2];
                            deduped_2_3 := deduped_8_1[i_3];
                            hoisted_3_3 := Sum( deduped_7_1, function ( t_4 )
                                    return deduped_2_3[t_4];
                                end );
                            hoisted_1_3 := deduped_8_3 = 0;
                            return UnionOfRowsListList( hoisted_9_1[i_3], List( deduped_4_1, function ( s_4 )
                                      local hoisted_1_4, hoisted_3_4, hoisted_4_4, hoisted_5_4, hoisted_6_4, deduped_7_4;
                                      deduped_7_4 := deduped_2_2[s_4];
                                      if deduped_7_4 = 0 or hoisted_1_3 then
                                          return NullMatImmutable( deduped_7_4, hoisted_3_3 );
                                      else
                                          hoisted_6_4 := hoisted_20_1[s_4];
                                          hoisted_5_4 := hoisted_19_1[s_4];
                                          hoisted_4_4 := hoisted_15_1[s_4];
                                          hoisted_3_4 := hoisted_14_1[s_4];
                                          hoisted_1_4 := hoisted_11_1[s_4];
                                          return UnionOfColumnsListList( deduped_7_4, List( deduped_7_1, function ( t_5 )
                                                    local hoisted_1_5, hoisted_2_5, hoisted_3_5, hoisted_4_5, deduped_5_5, deduped_6_5;
                                                    deduped_6_5 := hoisted_1_4[t_5];
                                                    deduped_5_5 := deduped_2_3[t_5];
                                                    if deduped_5_5 = 0 or deduped_6_5 = 0 then
                                                        return NullMatImmutable( deduped_7_4, deduped_5_5 );
                                                    else
                                                        hoisted_4_5 := [ 1 .. deduped_6_5 ];
                                                        hoisted_3_5 := hoisted_6_3[hoisted_5_4[t_5]][hoisted_6_4[t_5]];
                                                        hoisted_2_5 := hoisted_3_4[t_5];
                                                        hoisted_1_5 := hoisted_4_4[t_5];
                                                        return EntriesOfHomalgMatrixAsListList( Sum( List( hoisted_7_3, function ( l_6 )
                                                                    local hoisted_1_6, hoisted_2_6, deduped_3_6;
                                                                    deduped_3_6 := hoisted_4_3[l_6];
                                                                    hoisted_2_6 := hoisted_3_5[deduped_3_6];
                                                                    hoisted_1_6 := hoisted_5_3[deduped_3_6];
                                                                    return Sum( List( hoisted_4_5, function ( r_7 )
                                                                              local deduped_1_7;
                                                                              deduped_1_7 := hoisted_1_5[r_7];
                                                                              return hoisted_1_6 * hoisted_2_5[deduped_1_7] * hoisted_2_6[deduped_1_7];
                                                                          end ) );
                                                                end ) ) );
                                                    fi;
                                                    return;
                                                end ) );
                                      fi;
                                      return;
                                  end ) );
                        end ) );
              end ) ), RankOfObject( source_1 ), deduped_27_1, CommutativeRingOfLinearCategory( cat_1 ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.HomomorphismStructureOnMorphismsWithGivenObjects :=
        
########
function ( cat_1, source_1, alpha_1, beta_1, range_1 )
    local hoisted_1_1, deduped_2_1, hoisted_3_1, deduped_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, deduped_8_1, deduped_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1;
    deduped_32_1 := MorphismMatrix( beta_1 );
    deduped_31_1 := MorphismMatrix( alpha_1 );
    deduped_30_1 := UnderlyingCategory( cat_1 );
    deduped_29_1 := RankOfObject( range_1 );
    deduped_28_1 := ObjectList( Range( beta_1 ) );
    deduped_27_1 := ObjectList( Source( alpha_1 ) );
    deduped_26_1 := ObjectList( Source( beta_1 ) );
    deduped_25_1 := ObjectList( Range( alpha_1 ) );
    deduped_24_1 := [ 1 .. Length( deduped_27_1 ) ];
    deduped_23_1 := [ 1 .. Length( deduped_25_1 ) ];
    hoisted_21_1 := List( deduped_32_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return ObjectIndex( Target( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_20_1 := List( deduped_32_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return ObjectIndex( Source( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_19_1 := List( deduped_31_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return ObjectIndex( Target( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_18_1 := HomomorphismStructureOnMorphismsMatrices( deduped_30_1 );
    hoisted_17_1 := List( deduped_31_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return ObjectIndex( Source( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_16_1 := List( deduped_32_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, IndicesOfSupportMorphisms );
        end );
    hoisted_15_1 := List( deduped_32_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, CoefficientsList );
        end );
    hoisted_14_1 := List( deduped_31_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, IndicesOfSupportMorphisms );
        end );
    hoisted_13_1 := List( deduped_31_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, CoefficientsList );
        end );
    hoisted_12_1 := List( deduped_32_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return Length( IndicesOfSupportMorphisms( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_11_1 := List( deduped_31_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return Length( IndicesOfSupportMorphisms( logic_new_func_x_3 ) );
                end );
        end );
    deduped_8_1 := [ 1 .. Length( deduped_28_1 ) ];
    hoisted_7_1 := List( deduped_28_1, ObjectIndex );
    hoisted_6_1 := List( deduped_27_1, ObjectIndex );
    deduped_2_1 := HomomorphismStructureOnObjectsRanks( deduped_30_1 );
    deduped_9_1 := List( deduped_24_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_2_1[hoisted_6_1[i_2]];
            return List( deduped_8_1, function ( t_3 )
                    return hoisted_1_2[hoisted_7_1[t_3]];
                end );
        end );
    hoisted_10_1 := List( deduped_24_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := deduped_9_1[i_2];
            hoisted_2_2 := List( deduped_8_1, function ( t_3 )
                    return hoisted_1_2[t_3];
                end );
            return Sum( List( deduped_8_1, function ( i_3 )
                      return hoisted_2_2[i_3];
                  end ) );
        end );
    deduped_4_1 := [ 1 .. Length( deduped_26_1 ) ];
    hoisted_3_1 := List( deduped_26_1, ObjectIndex );
    hoisted_1_1 := List( deduped_25_1, ObjectIndex );
    hoisted_5_1 := List( deduped_23_1, function ( j_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_2_1[hoisted_1_1[j_2]];
            return List( deduped_4_1, function ( s_3 )
                    return hoisted_1_2[hoisted_3_1[s_3]];
                end );
        end );
    return CreateCapCategoryMorphismWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), source_1, range_1, UnderlyingMatrix, HomalgMatrixListList( UnionOfRowsListList( deduped_29_1, List( deduped_23_1, function ( j_2 )
                  local deduped_1_2, hoisted_2_2;
                  deduped_1_2 := hoisted_5_1[j_2];
                  hoisted_2_2 := List( deduped_4_1, function ( s_3 )
                          return deduped_1_2[s_3];
                      end );
                  return UnionOfColumnsListList( Sum( List( deduped_4_1, function ( i_3 )
                              return hoisted_2_2[i_3];
                          end ) ), List( deduped_24_1, function ( i_3 )
                            local hoisted_1_3, deduped_2_3, hoisted_3_3, hoisted_4_3, hoisted_5_3, hoisted_6_3, hoisted_7_3, deduped_8_3;
                            deduped_8_3 := hoisted_11_1[i_3][j_2];
                            hoisted_7_3 := [ 1 .. deduped_8_3 ];
                            hoisted_6_3 := hoisted_18_1[hoisted_17_1[i_3][j_2]][hoisted_19_1[i_3][j_2]];
                            hoisted_5_3 := hoisted_13_1[i_3][j_2];
                            hoisted_4_3 := hoisted_14_1[i_3][j_2];
                            deduped_2_3 := deduped_9_1[i_3];
                            hoisted_3_3 := Sum( deduped_8_1, function ( t_4 )
                                    return deduped_2_3[t_4];
                                end );
                            hoisted_1_3 := deduped_8_3 = 0;
                            return UnionOfRowsListList( hoisted_10_1[i_3], List( deduped_4_1, function ( s_4 )
                                      local hoisted_1_4, hoisted_3_4, hoisted_4_4, hoisted_5_4, hoisted_6_4, deduped_7_4;
                                      deduped_7_4 := deduped_1_2[s_4];
                                      if deduped_7_4 = 0 or hoisted_1_3 then
                                          return NullMatImmutable( deduped_7_4, hoisted_3_3 );
                                      else
                                          hoisted_6_4 := hoisted_21_1[s_4];
                                          hoisted_5_4 := hoisted_20_1[s_4];
                                          hoisted_4_4 := hoisted_16_1[s_4];
                                          hoisted_3_4 := hoisted_15_1[s_4];
                                          hoisted_1_4 := hoisted_12_1[s_4];
                                          return UnionOfColumnsListList( deduped_7_4, List( deduped_8_1, function ( t_5 )
                                                    local hoisted_1_5, hoisted_2_5, hoisted_3_5, hoisted_4_5, deduped_5_5, deduped_6_5;
                                                    deduped_6_5 := hoisted_1_4[t_5];
                                                    deduped_5_5 := deduped_2_3[t_5];
                                                    if deduped_5_5 = 0 or deduped_6_5 = 0 then
                                                        return NullMatImmutable( deduped_7_4, deduped_5_5 );
                                                    else
                                                        hoisted_4_5 := [ 1 .. deduped_6_5 ];
                                                        hoisted_3_5 := hoisted_6_3[hoisted_5_4[t_5]][hoisted_6_4[t_5]];
                                                        hoisted_2_5 := hoisted_3_4[t_5];
                                                        hoisted_1_5 := hoisted_4_4[t_5];
                                                        return EntriesOfHomalgMatrixAsListList( Sum( List( hoisted_7_3, function ( l_6 )
                                                                    local hoisted_1_6, hoisted_2_6, deduped_3_6;
                                                                    deduped_3_6 := hoisted_4_3[l_6];
                                                                    hoisted_2_6 := hoisted_3_5[deduped_3_6];
                                                                    hoisted_1_6 := hoisted_5_3[deduped_3_6];
                                                                    return Sum( List( hoisted_4_5, function ( r_7 )
                                                                              local deduped_1_7;
                                                                              deduped_1_7 := hoisted_1_5[r_7];
                                                                              return hoisted_1_6 * hoisted_2_5[deduped_1_7] * hoisted_2_6[deduped_1_7];
                                                                          end ) );
                                                                end ) ) );
                                                    fi;
                                                    return;
                                                end ) );
                                      fi;
                                      return;
                                  end ) );
                        end ) );
              end ) ), RankOfObject( source_1 ), deduped_29_1, CommutativeRingOfLinearCategory( cat_1 ) ) );
end
########
        
    ;
    
    ##
    AddHomomorphismStructureOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1;
    deduped_8_1 := ObjectList( arg3_1 );
    deduped_7_1 := ObjectList( arg2_1 );
    hoisted_6_1 := [ 1 .. Length( deduped_8_1 ) ];
    hoisted_5_1 := List( deduped_8_1, ObjectIndex );
    hoisted_4_1 := HomomorphismStructureOnObjectsRanks( UnderlyingCategory( cat_1 ) );
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), RankOfObject, Sum( List( [ 1 .. Length( deduped_7_1 ) ], function ( i_2 )
                local hoisted_1_2;
                hoisted_1_2 := hoisted_4_1[CAP_JIT_INCOMPLETE_LOGIC( ObjectIndex( CAP_JIT_INCOMPLETE_LOGIC( deduped_7_1[CAP_JIT_INCOMPLETE_LOGIC( i_2 )] ) ) )];
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( List( hoisted_6_1, function ( i_3 )
                            return CAP_JIT_INCOMPLETE_LOGIC( hoisted_1_2[hoisted_5_1[CAP_JIT_INCOMPLETE_LOGIC( i_3 )]] );
                        end ) ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.HomomorphismStructureOnObjects :=
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, hoisted_7_1, deduped_8_1, deduped_9_1, deduped_10_1;
    deduped_10_1 := ObjectList( arg3_1 );
    deduped_9_1 := ObjectList( arg2_1 );
    deduped_8_1 := [ 1 .. Length( deduped_9_1 ) ];
    deduped_6_1 := [ 1 .. Length( deduped_10_1 ) ];
    hoisted_5_1 := List( deduped_10_1, ObjectIndex );
    hoisted_4_1 := HomomorphismStructureOnObjectsRanks( UnderlyingCategory( cat_1 ) );
    hoisted_3_1 := List( deduped_9_1, ObjectIndex );
    hoisted_7_1 := List( deduped_8_1, function ( j_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := hoisted_4_1[hoisted_3_1[j_2]];
            hoisted_2_2 := List( deduped_6_1, function ( s_3 )
                    return hoisted_1_2[hoisted_5_1[s_3]];
                end );
            return Sum( List( deduped_6_1, function ( i_3 )
                      return hoisted_2_2[i_3];
                  end ) );
        end );
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), RankOfObject, Sum( List( deduped_8_1, function ( i_2 )
                return hoisted_7_1[i_2];
            end ) ) );
end
########
        
    ;
    
    ##
    AddIdentityMorphism( cat,
        
########
function ( cat_1, a_1 )
    local deduped_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_6_1, hoisted_7_1, deduped_10_1, deduped_11_1, deduped_12_1;
    deduped_12_1 := UnderlyingCategory( cat_1 );
    deduped_11_1 := ObjectList( a_1 );
    deduped_10_1 := [ 1 .. Length( deduped_11_1 ) ];
    hoisted_7_1 := ZeroImmutable( CommutativeRingOfLinearCategory( cat_1 ) );
    hoisted_6_1 := HomomorphismStructureOnObjectsRanks( deduped_12_1 );
    hoisted_4_1 := CapJitTypedExpression( [  ], function (  )
            return rec(
                filter := IsList,
                element_type := rec(
                    filter := IsInt ) );
        end );
    hoisted_3_1 := DecompositionIndicesOfBasesElements( deduped_12_1 );
    hoisted_2_1 := BasesElements( deduped_12_1 );
    deduped_1_1 := List( deduped_11_1, ObjectIndex );
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, MorphismMatrix, List( deduped_10_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2;
              deduped_4_2 := deduped_1_1[i_2];
              hoisted_3_2 := deduped_11_1[i_2];
              hoisted_2_2 := hoisted_6_1[deduped_4_2];
              hoisted_1_2 := hoisted_2_1[deduped_4_2][deduped_4_2][SafePositionProperty( hoisted_3_1[deduped_4_2][deduped_4_2], function ( indices_3 )
                       return indices_3 = hoisted_4_1;
                   end )];
              return List( deduped_10_1, function ( j_3 )
                      if i_2 = j_3 then
                          return hoisted_1_2;
                      else
                          return CreateCapCategoryMorphismWithAttributes( deduped_12_1, hoisted_3_2, deduped_11_1[j_3], CoefficientsList, ListWithIdenticalEntries( hoisted_2_2[deduped_1_1[j_3]], hoisted_7_1 ) );
                      fi;
                      return;
                  end );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects( cat,
        
########
function ( cat_1, source_1, alpha_1, range_1 )
    local hoisted_1_1, hoisted_2_1, deduped_4_1;
    deduped_4_1 := RankOfObject( source_1 );
    hoisted_2_1 := [ 1 .. Length( ObjectList( Range( alpha_1 ) ) ) ];
    hoisted_1_1 := List( MorphismMatrix( alpha_1 ), function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, CoefficientsList );
        end );
    return CreateCapCategoryMorphismWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), source_1, range_1, UnderlyingMatrix, HomalgMatrixListList( UnionOfColumnsListList( deduped_4_1, List( [ 1 .. Length( ObjectList( Source( alpha_1 ) ) ) ], function ( j_2 )
                  local hoisted_1_2;
                  hoisted_1_2 := hoisted_1_1[j_2];
                  return UnionOfColumnsListList( deduped_4_1, List( hoisted_2_1, function ( s_3 )
                            return [ hoisted_1_2[s_3] ];
                        end ) );
              end ) ), deduped_4_1, RankOfObject( range_1 ), CommutativeRingOfLinearCategory( cat_1 ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, hoisted_7_1, hoisted_8_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1;
    deduped_13_1 := UnderlyingCategory( cat_1 );
    deduped_12_1 := ObjectList( range_1 );
    deduped_11_1 := ObjectList( source_1 );
    deduped_10_1 := [ 1 .. Length( deduped_11_1 ) ];
    hoisted_8_1 := CAP_JIT_INCOMPLETE_LOGIC( EntriesOfHomalgMatrixAsListList( UnderlyingMatrix( alpha_1 ) )[1] );
    deduped_5_1 := [ 1 .. Length( deduped_12_1 ) ];
    hoisted_4_1 := List( deduped_12_1, ObjectIndex );
    hoisted_3_1 := HomomorphismStructureOnObjectsRanks( deduped_13_1 );
    deduped_6_1 := List( deduped_10_1, function ( j_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_3_1[CAP_JIT_INCOMPLETE_LOGIC( ObjectIndex( CAP_JIT_INCOMPLETE_LOGIC( deduped_11_1[j_2] ) ) )];
            return List( deduped_5_1, function ( s_3 )
                    return hoisted_1_2[hoisted_4_1[s_3]];
                end );
        end );
    hoisted_7_1 := List( deduped_10_1, function ( j_2 )
            local hoisted_1_2;
            hoisted_1_2 := deduped_6_1[j_2];
            return Sum( List( deduped_5_1, function ( i_3 )
                      return CAP_JIT_INCOMPLETE_LOGIC( hoisted_1_2[CAP_JIT_INCOMPLETE_LOGIC( i_3 )] );
                  end ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, MorphismMatrix, List( deduped_10_1, function ( j_2 )
              local deduped_1_2, deduped_2_2, hoisted_3_2, deduped_4_2;
              deduped_4_2 := CAP_JIT_INCOMPLETE_LOGIC( j_2 );
              hoisted_3_2 := deduped_11_1[j_2];
              deduped_2_2 := Sum( hoisted_7_1{[ 1 .. deduped_4_2 - 1 ]} );
              deduped_1_2 := deduped_6_1[deduped_4_2];
              return List( deduped_5_1, function ( s_3 )
                      local deduped_1_3, deduped_2_3;
                      deduped_2_3 := CAP_JIT_INCOMPLETE_LOGIC( s_3 );
                      deduped_1_3 := Sum( deduped_1_2{[ 1 .. deduped_2_3 - 1 ]} );
                      return CreateCapCategoryMorphismWithAttributes( deduped_13_1, hoisted_3_2, deduped_12_1[s_3], CoefficientsList, CAP_JIT_INCOMPLETE_LOGIC( hoisted_8_1{[ deduped_2_2 + (deduped_1_3 + 1) .. deduped_2_2 + (deduped_1_3 + deduped_1_2[deduped_2_3]) ]} ) );
                  end );
          end ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism :=
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1, hoisted_8_1, hoisted_9_1, hoisted_11_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1;
    deduped_16_1 := UnderlyingCategory( cat_1 );
    deduped_15_1 := ObjectList( range_1 );
    deduped_14_1 := ObjectList( source_1 );
    deduped_13_1 := [ 1 .. Length( deduped_14_1 ) ];
    hoisted_9_1 := EntriesOfHomalgMatrixAsListList( UnderlyingMatrix( alpha_1 ) );
    deduped_6_1 := [ 1 .. Length( deduped_15_1 ) ];
    hoisted_5_1 := List( deduped_15_1, ObjectIndex );
    hoisted_4_1 := HomomorphismStructureOnObjectsRanks( deduped_16_1 );
    hoisted_3_1 := List( deduped_14_1, ObjectIndex );
    deduped_7_1 := List( deduped_13_1, function ( j_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_4_1[hoisted_3_1[j_2]];
            return List( deduped_6_1, function ( s_3 )
                    return hoisted_1_2[hoisted_5_1[s_3]];
                end );
        end );
    hoisted_8_1 := List( deduped_13_1, function ( j_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := deduped_7_1[j_2];
            hoisted_2_2 := List( deduped_6_1, function ( s_3 )
                    return hoisted_1_2[s_3];
                end );
            return Sum( List( deduped_6_1, function ( i_3 )
                      return hoisted_2_2[i_3];
                  end ) );
        end );
    hoisted_11_1 := List( deduped_13_1, function ( j_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_7_1[j_2];
            return List( deduped_6_1, function ( s_3 )
                    local hoisted_1_3, hoisted_2_3, deduped_3_3;
                    deduped_3_3 := Sum( deduped_1_2{[ 1 .. s_3 - 1 ]} );
                    hoisted_2_3 := deduped_3_3 + deduped_1_2[s_3];
                    hoisted_1_3 := deduped_3_3 + 1;
                    return List( deduped_13_1, function ( j_4 )
                              local hoisted_1_4, deduped_2_4;
                              deduped_2_4 := Sum( hoisted_8_1{[ 1 .. j_4 - 1 ]} );
                              hoisted_1_4 := [ deduped_2_4 + hoisted_1_3 .. deduped_2_4 + hoisted_2_3 ];
                              return List( hoisted_9_1, function ( row_5 )
                                      return row_5{hoisted_1_4};
                                  end );
                          end )[j_2];
                end );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, MorphismMatrix, List( deduped_13_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2;
              hoisted_2_2 := deduped_14_1[j_2];
              hoisted_1_2 := hoisted_11_1[j_2];
              return List( deduped_6_1, function ( s_3 )
                      return CreateCapCategoryMorphismWithAttributes( deduped_16_1, hoisted_2_2, deduped_15_1[s_3], CoefficientsList, hoisted_1_2[s_3][1] );
                  end );
          end ) );
end
########
        
    ;
    
    ##
    AddIsCongruentForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := Length( ObjectList( Range( arg2_1 ) ) );
    deduped_6_1 := Length( ObjectList( Source( arg2_1 ) ) );
    if deduped_6_1 <> Length( ObjectList( Source( arg3_1 ) ) ) then
        return false;
    elif deduped_7_1 <> Length( ObjectList( Range( arg3_1 ) ) ) then
        return false;
    else
        hoisted_5_1 := [ 1 .. deduped_7_1 ];
        hoisted_4_1 := List( MorphismMatrix( arg3_1 ), function ( logic_new_func_list_2 )
                return List( logic_new_func_list_2, CoefficientsList );
            end );
        hoisted_3_1 := List( MorphismMatrix( arg2_1 ), function ( logic_new_func_list_2 )
                return List( logic_new_func_list_2, CoefficientsList );
            end );
        return ForAll( [ 1 .. deduped_6_1 ], function ( i_2 )
                local hoisted_1_2, hoisted_2_2;
                hoisted_2_2 := hoisted_4_1[i_2];
                hoisted_1_2 := hoisted_3_1[i_2];
                return ForAll( hoisted_5_1, function ( j_3 )
                        return hoisted_1_2[j_3] = hoisted_2_2[j_3];
                    end );
            end );
    fi;
    return;
end
########
        
    , 100 );
    
    ##
    AddIsEqualForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := Length( ObjectList( Range( arg2_1 ) ) );
    deduped_6_1 := Length( ObjectList( Source( arg2_1 ) ) );
    if deduped_6_1 <> Length( ObjectList( Source( arg3_1 ) ) ) then
        return false;
    elif deduped_7_1 <> Length( ObjectList( Range( arg3_1 ) ) ) then
        return false;
    else
        hoisted_5_1 := [ 1 .. deduped_7_1 ];
        hoisted_4_1 := List( MorphismMatrix( arg3_1 ), function ( logic_new_func_list_2 )
                return List( logic_new_func_list_2, CoefficientsList );
            end );
        hoisted_3_1 := List( MorphismMatrix( arg2_1 ), function ( logic_new_func_list_2 )
                return List( logic_new_func_list_2, CoefficientsList );
            end );
        return ForAll( [ 1 .. deduped_6_1 ], function ( i_2 )
                local hoisted_1_2, hoisted_2_2;
                hoisted_2_2 := hoisted_4_1[i_2];
                hoisted_1_2 := hoisted_3_1[i_2];
                return ForAll( hoisted_5_1, function ( j_3 )
                        return hoisted_1_2[j_3] = hoisted_2_2[j_3];
                    end );
            end );
    fi;
    return;
end
########
        
    , 100 );
    
    ##
    AddIsEqualForObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := ObjectList( arg3_1 );
    deduped_6_1 := ObjectList( arg2_1 );
    deduped_5_1 := Length( deduped_6_1 );
    if deduped_5_1 <> Length( deduped_7_1 ) then
        return false;
    else
        hoisted_4_1 := List( deduped_7_1, ObjectIndex );
        return ForAll( [ 1 .. deduped_5_1 ], function ( i_2 )
                return CAP_JIT_INCOMPLETE_LOGIC( ObjectIndex( CAP_JIT_INCOMPLETE_LOGIC( deduped_6_1[i_2] ) ) ) = hoisted_4_1[i_2];
            end );
    fi;
    return;
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.IsEqualForObjects :=
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := ObjectList( arg3_1 );
    deduped_6_1 := ObjectList( arg2_1 );
    deduped_5_1 := Length( deduped_6_1 );
    if deduped_5_1 <> Length( deduped_7_1 ) then
        return false;
    else
        hoisted_4_1 := List( deduped_7_1, ObjectIndex );
        hoisted_3_1 := List( deduped_6_1, ObjectIndex );
        return ForAll( [ 1 .. deduped_5_1 ], function ( i_2 )
                return hoisted_3_1[i_2] = hoisted_4_1[i_2];
            end );
    fi;
    return;
end
########
        
    ;
    
    ##
    AddIsWellDefinedForMorphisms( cat,
        
########
function ( cat_1, alpha_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_9_1, hoisted_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1;
    deduped_16_1 := MorphismMatrix( alpha_1 );
    deduped_15_1 := ObjectList( Range( alpha_1 ) );
    deduped_14_1 := ObjectList( Source( alpha_1 ) );
    deduped_13_1 := Length( deduped_15_1 );
    deduped_12_1 := Length( deduped_14_1 );
    deduped_11_1 := [ 1 .. deduped_12_1 ];
    hoisted_10_1 := [ 1 .. deduped_13_1 ];
    hoisted_9_1 := List( deduped_15_1, ObjectIndex );
    hoisted_7_1 := List( deduped_16_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return ObjectIndex( Target( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_6_1 := HomomorphismStructureOnObjectsRanks( UnderlyingCategory( cat_1 ) );
    hoisted_5_1 := List( deduped_16_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return ObjectIndex( Source( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_4_1 := List( deduped_16_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return Length( CoefficientsList( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_2_1 := List( deduped_16_1, Length );
    hoisted_1_1 := List( deduped_16_1, IsList );
    if not (IsList( deduped_16_1 ) and Length( deduped_16_1 ) = deduped_12_1) then
        return false;
    elif not ForAll( deduped_11_1, function ( i_2 )
                 return (hoisted_1_1[i_2] and hoisted_2_1[i_2] = deduped_13_1);
             end ) then
        return false;
    elif not ForAll( deduped_11_1, function ( i_2 )
                 local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2;
                 hoisted_4_2 := CAP_JIT_INCOMPLETE_LOGIC( ObjectIndex( CAP_JIT_INCOMPLETE_LOGIC( deduped_14_1[i_2] ) ) );
                 hoisted_3_2 := hoisted_7_1[i_2];
                 hoisted_2_2 := hoisted_5_1[i_2];
                 hoisted_1_2 := hoisted_4_1[i_2];
                 return ForAll( hoisted_10_1, function ( j_3 )
                         local deduped_1_3, deduped_2_3;
                         deduped_2_3 := hoisted_3_2[j_3];
                         deduped_1_3 := hoisted_2_2[j_3];
                         return (hoisted_1_2[j_3] = hoisted_6_1[deduped_1_3][deduped_2_3] and deduped_1_3 = hoisted_4_2 and deduped_2_3 = hoisted_9_1[j_3]);
                     end );
             end ) then
        return false;
    else
        return true;
    fi;
    return;
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.IsWellDefinedForMorphisms :=
        
########
function ( cat_1, alpha_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1;
    deduped_16_1 := MorphismMatrix( alpha_1 );
    deduped_15_1 := ObjectList( Range( alpha_1 ) );
    deduped_14_1 := ObjectList( Source( alpha_1 ) );
    deduped_13_1 := Length( deduped_15_1 );
    deduped_12_1 := Length( deduped_14_1 );
    deduped_11_1 := [ 1 .. deduped_12_1 ];
    hoisted_10_1 := [ 1 .. deduped_13_1 ];
    hoisted_9_1 := List( deduped_15_1, ObjectIndex );
    hoisted_8_1 := List( deduped_14_1, ObjectIndex );
    hoisted_7_1 := List( deduped_16_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return ObjectIndex( Target( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_6_1 := HomomorphismStructureOnObjectsRanks( UnderlyingCategory( cat_1 ) );
    hoisted_5_1 := List( deduped_16_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return ObjectIndex( Source( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_4_1 := List( deduped_16_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return Length( CoefficientsList( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_2_1 := List( deduped_16_1, Length );
    hoisted_1_1 := List( deduped_16_1, IsList );
    if not (IsList( deduped_16_1 ) and Length( deduped_16_1 ) = deduped_12_1) then
        return false;
    elif not ForAll( deduped_11_1, function ( i_2 )
                 return (hoisted_1_1[i_2] and hoisted_2_1[i_2] = deduped_13_1);
             end ) then
        return false;
    elif not ForAll( deduped_11_1, function ( i_2 )
                 local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2;
                 hoisted_4_2 := hoisted_8_1[i_2];
                 hoisted_3_2 := hoisted_7_1[i_2];
                 hoisted_2_2 := hoisted_5_1[i_2];
                 hoisted_1_2 := hoisted_4_1[i_2];
                 return ForAll( hoisted_10_1, function ( j_3 )
                         local deduped_1_3, deduped_2_3;
                         deduped_2_3 := hoisted_3_2[j_3];
                         deduped_1_3 := hoisted_2_2[j_3];
                         return (hoisted_1_2[j_3] = hoisted_6_1[deduped_1_3][deduped_2_3] and deduped_1_3 = hoisted_4_2 and deduped_2_3 = hoisted_9_1[j_3]);
                     end );
             end ) then
        return false;
    else
        return true;
    fi;
    return;
end
########
        
    ;
    
    ##
    AddIsWellDefinedForObjects( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1;
    deduped_1_1 := ObjectList( arg2_1 );
    if not IsList( deduped_1_1 ) then
        return false;
    elif not ForAll( deduped_1_1, function ( obj_2 )
                 return true;
             end ) then
        return false;
    else
        return true;
    fi;
    return;
end
########
        
    , 100 );
    
    ##
    AddIsZeroForMorphisms( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1;
    deduped_7_1 := MorphismMatrix( arg2_1 );
    hoisted_6_1 := [ 1 .. Length( ObjectList( Range( arg2_1 ) ) ) ];
    hoisted_5_1 := List( deduped_7_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, CoefficientsList );
        end );
    hoisted_4_1 := ZeroImmutable( CommutativeRingOfLinearCategory( cat_1 ) );
    hoisted_3_1 := List( deduped_7_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return ObjectIndex( Range( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_2_1 := HomomorphismStructureOnObjectsRanks( UnderlyingCategory( cat_1 ) );
    hoisted_1_1 := List( deduped_7_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return ObjectIndex( Source( logic_new_func_x_3 ) );
                end );
        end );
    return ForAll( [ 1 .. Length( ObjectList( Source( arg2_1 ) ) ) ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_5_1[i_2];
            hoisted_2_2 := hoisted_3_1[i_2];
            hoisted_1_2 := hoisted_1_1[i_2];
            return ForAll( hoisted_6_1, function ( j_3 )
                    return ListWithIdenticalEntries( hoisted_2_1[hoisted_1_2[j_3]][hoisted_2_2[j_3]], hoisted_4_1 ) = hoisted_3_2[j_3];
                end );
        end );
end
########
        
    , 100 );
    
    ##
    AddMorphismConstructor( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg4_1, MorphismMatrix, arg3_1 );
end
########
        
    , 100 );
    
    ##
    AddMorphismDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return MorphismMatrix( arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddMultiplyWithElementOfCommutativeRingForMorphisms( cat,
        
########
function ( cat_1, r_1, alpha_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1, deduped_8_1;
    deduped_8_1 := MorphismMatrix( alpha_1 );
    deduped_7_1 := Range( alpha_1 );
    deduped_6_1 := Source( alpha_1 );
    hoisted_5_1 := [ 1 .. Length( ObjectList( deduped_7_1 ) ) ];
    hoisted_4_1 := UnderlyingCategory( cat_1 );
    hoisted_3_1 := List( deduped_8_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return List( CoefficientsList( logic_new_func_x_3 ), function ( c_4 )
                            return r_1 * c_4;
                        end );
                end );
        end );
    hoisted_2_1 := List( deduped_8_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, Target );
        end );
    hoisted_1_1 := List( deduped_8_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, Source );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_6_1, deduped_7_1, MorphismMatrix, List( [ 1 .. Length( ObjectList( deduped_6_1 ) ) ], function ( i_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2;
              hoisted_3_2 := hoisted_3_1[i_2];
              hoisted_2_2 := hoisted_2_1[i_2];
              hoisted_1_2 := hoisted_1_1[i_2];
              return List( hoisted_5_1, function ( j_3 )
                      return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, hoisted_1_2[j_3], hoisted_2_2[j_3], CoefficientsList, hoisted_3_2[j_3] );
                  end );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddObjectConstructor( cat,
        
########
function ( cat_1, arg2_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, ObjectList, arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddObjectDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return ObjectList( arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddPreCompose( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local hoisted_5_1, deduped_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, deduped_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1;
    deduped_37_1 := CommutativeRingOfLinearCategory( cat_1 );
    deduped_36_1 := MorphismMatrix( beta_1 );
    deduped_35_1 := UnderlyingCategory( cat_1 );
    deduped_34_1 := MorphismMatrix( alpha_1 );
    deduped_33_1 := Range( beta_1 );
    deduped_32_1 := Source( alpha_1 );
    deduped_31_1 := BasesElements( deduped_35_1 );
    deduped_30_1 := ObjectList( deduped_33_1 );
    deduped_29_1 := ObjectList( deduped_32_1 );
    hoisted_28_1 := [ 1 .. Length( deduped_30_1 ) ];
    hoisted_26_1 := List( deduped_30_1, ObjectIndex );
    hoisted_25_1 := [ 1 .. Length( ObjectList( Range( alpha_1 ) ) ) ];
    hoisted_24_1 := HomomorphismStructureOnMorphismsMatrices( deduped_35_1 );
    hoisted_23_1 := List( deduped_36_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, IndicesOfSupportMorphisms );
        end );
    hoisted_22_1 := List( deduped_36_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, CoefficientsList );
        end );
    hoisted_21_1 := List( deduped_34_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, IndicesOfSupportMorphisms );
        end );
    hoisted_20_1 := List( deduped_34_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, CoefficientsList );
        end );
    deduped_19_1 := ZeroImmutable( deduped_37_1 );
    hoisted_18_1 := CAP_JIT_INCOMPLETE_LOGIC( 1 );
    hoisted_17_1 := List( deduped_31_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_list_3 )
                    return List( logic_new_func_list_3, function ( logic_new_func_x_4 )
                            return ObjectIndex( Target( logic_new_func_x_4 ) );
                        end );
                end );
        end );
    hoisted_16_1 := List( deduped_31_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_list_3 )
                    return List( logic_new_func_list_3, function ( logic_new_func_x_4 )
                            return ObjectIndex( Source( logic_new_func_x_4 ) );
                        end );
                end );
        end );
    hoisted_15_1 := CapJitTypedExpression( [  ], function (  )
            return rec(
                filter := IsList,
                element_type := rec(
                    filter := IsInt ) );
        end );
    hoisted_14_1 := DecompositionIndicesOfBasesElements( deduped_35_1 );
    hoisted_13_1 := List( deduped_31_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_list_3 )
                    return List( logic_new_func_list_3, CoefficientsList );
                end );
        end );
    hoisted_11_1 := List( deduped_36_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return Length( IndicesOfSupportMorphisms( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_10_1 := List( deduped_36_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return ObjectIndex( Range( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_9_1 := List( deduped_34_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return ObjectIndex( Source( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_8_1 := List( deduped_34_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return Length( IndicesOfSupportMorphisms( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_7_1 := List( deduped_36_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return ObjectIndex( Source( logic_new_func_x_3 ) );
                end );
        end );
    deduped_6_1 := HomomorphismStructureOnObjectsRanks( deduped_35_1 );
    hoisted_5_1 := List( deduped_34_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return ObjectIndex( Range( logic_new_func_x_3 ) );
                end );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_32_1, deduped_33_1, MorphismMatrix, List( [ 1 .. Length( deduped_29_1 ) ], function ( i_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_8_2;
              deduped_8_2 := deduped_29_1[i_2];
              hoisted_6_2 := deduped_6_1[CAP_JIT_INCOMPLETE_LOGIC( ObjectIndex( CAP_JIT_INCOMPLETE_LOGIC( deduped_8_2 ) ) )];
              hoisted_5_2 := hoisted_21_1[i_2];
              hoisted_4_2 := hoisted_20_1[i_2];
              hoisted_3_2 := hoisted_9_1[i_2];
              hoisted_2_2 := hoisted_8_1[i_2];
              hoisted_1_2 := hoisted_5_1[i_2];
              return List( hoisted_28_1, function ( j_3 )
                      return CreateCapCategoryMorphismWithAttributes( deduped_35_1, deduped_8_2, deduped_30_1[j_3], CoefficientsList, Iterated( List( hoisted_25_1, function ( k_4 )
                                  local deduped_1_4, deduped_3_4, hoisted_4_4, hoisted_5_4, hoisted_6_4, hoisted_7_4, hoisted_8_4, hoisted_9_4, hoisted_10_4, deduped_11_4, deduped_12_4, deduped_13_4, deduped_14_4, deduped_15_4, deduped_16_4, deduped_17_4, deduped_18_4, deduped_19_4, deduped_20_4, deduped_21_4, deduped_22_4;
                                  deduped_22_4 := hoisted_3_2[k_4];
                                  deduped_21_4 := hoisted_2_2[k_4];
                                  deduped_20_4 := hoisted_1_2[k_4];
                                  deduped_19_4 := hoisted_11_1[k_4][j_3];
                                  deduped_18_4 := hoisted_10_1[k_4][j_3];
                                  deduped_17_4 := hoisted_7_1[k_4][j_3];
                                  deduped_16_4 := deduped_6_1[deduped_22_4][deduped_18_4];
                                  deduped_15_4 := deduped_6_1[deduped_20_4][deduped_17_4];
                                  deduped_14_4 := SafePositionProperty( hoisted_14_1[deduped_20_4][deduped_20_4], function ( indices_5 )
                                          return indices_5 = hoisted_15_1;
                                      end );
                                  deduped_12_4 := [ hoisted_13_1[deduped_20_4][deduped_20_4][deduped_14_4] ];
                                  deduped_3_4 := [ 1 .. NumberColumns( HomalgMatrixListList( deduped_12_4, 1, deduped_6_1[hoisted_16_1[deduped_20_4][deduped_20_4][deduped_14_4]][hoisted_17_1[deduped_20_4][deduped_20_4][deduped_14_4]], deduped_37_1 ) ) ];
                                  deduped_1_4 := deduped_12_4[hoisted_18_1];
                                  if deduped_15_4 = 0 or deduped_21_4 = 0 or (deduped_16_4 = 0 or deduped_19_4 = 0) then
                                      deduped_13_4 := NullMatImmutable( deduped_15_4, deduped_16_4 );
                                      return CAP_JIT_INCOMPLETE_LOGIC( List( [ 1 .. NumberColumns( HomalgMatrixListList( deduped_13_4, deduped_15_4, deduped_16_4, deduped_37_1 ) ) ], function ( j_5 )
                                                return Iterated( List( deduped_3_4, function ( k_6 )
                                                          return deduped_1_4[k_6] * deduped_13_4[k_6][j_5];
                                                      end ), function ( alpha_6, beta_6 )
                                                        return alpha_6 + beta_6;
                                                    end, deduped_19_1 );
                                            end ) );
                                  else
                                      hoisted_9_4 := [ 1 .. deduped_19_4 ];
                                      hoisted_8_4 := hoisted_24_1[deduped_22_4][deduped_20_4][deduped_17_4][deduped_18_4];
                                      hoisted_7_4 := hoisted_22_1[k_4][j_3];
                                      hoisted_6_4 := hoisted_23_1[k_4][j_3];
                                      hoisted_5_4 := hoisted_4_2[k_4];
                                      hoisted_4_4 := hoisted_5_2[k_4];
                                      deduped_11_4 := Sum( List( [ 1 .. deduped_21_4 ], function ( l_5 )
                                                local hoisted_1_5, hoisted_2_5, deduped_3_5;
                                                deduped_3_5 := hoisted_4_4[l_5];
                                                hoisted_2_5 := hoisted_8_4[deduped_3_5];
                                                hoisted_1_5 := hoisted_5_4[deduped_3_5];
                                                return Sum( List( hoisted_9_4, function ( r_6 )
                                                          local deduped_1_6;
                                                          deduped_1_6 := hoisted_6_4[r_6];
                                                          return hoisted_1_5 * hoisted_7_4[deduped_1_6] * hoisted_2_5[deduped_1_6];
                                                      end ) );
                                            end ) );
                                      hoisted_10_4 := EntriesOfHomalgMatrixAsListList( deduped_11_4 );
                                      return CAP_JIT_INCOMPLETE_LOGIC( List( [ 1 .. NumberColumns( deduped_11_4 ) ], function ( j_5 )
                                                return Iterated( List( deduped_3_4, function ( k_6 )
                                                          return deduped_1_4[k_6] * hoisted_10_4[k_6][j_5];
                                                      end ), function ( alpha_6, beta_6 )
                                                        return alpha_6 + beta_6;
                                                    end, deduped_19_1 );
                                            end ) );
                                  fi;
                                  return;
                              end ), function ( alpha_4, beta_4 )
                                return Sum( [ alpha_4, beta_4 ] );
                            end, ListWithIdenticalEntries( hoisted_6_2[hoisted_26_1[j_3]], deduped_19_1 ) ) );
                  end );
          end ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.PreCompose :=
        
########
function ( cat_1, alpha_1, beta_1 )
    local hoisted_5_1, deduped_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, deduped_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1;
    deduped_37_1 := CommutativeRingOfLinearCategory( cat_1 );
    deduped_36_1 := MorphismMatrix( beta_1 );
    deduped_35_1 := UnderlyingCategory( cat_1 );
    deduped_34_1 := MorphismMatrix( alpha_1 );
    deduped_33_1 := Range( beta_1 );
    deduped_32_1 := Source( alpha_1 );
    deduped_31_1 := BasesElements( deduped_35_1 );
    deduped_30_1 := ObjectList( deduped_33_1 );
    deduped_29_1 := ObjectList( deduped_32_1 );
    hoisted_28_1 := [ 1 .. Length( deduped_30_1 ) ];
    hoisted_26_1 := List( deduped_30_1, ObjectIndex );
    hoisted_25_1 := List( deduped_29_1, ObjectIndex );
    hoisted_24_1 := [ 1 .. Length( ObjectList( Range( alpha_1 ) ) ) ];
    hoisted_23_1 := HomomorphismStructureOnMorphismsMatrices( deduped_35_1 );
    hoisted_22_1 := List( deduped_36_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, IndicesOfSupportMorphisms );
        end );
    hoisted_21_1 := List( deduped_36_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, CoefficientsList );
        end );
    hoisted_20_1 := List( deduped_34_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, IndicesOfSupportMorphisms );
        end );
    hoisted_19_1 := List( deduped_34_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, CoefficientsList );
        end );
    deduped_18_1 := ZeroImmutable( deduped_37_1 );
    hoisted_16_1 := List( deduped_31_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_list_3 )
                    return List( logic_new_func_list_3, function ( logic_new_func_x_4 )
                            return ObjectIndex( Target( logic_new_func_x_4 ) );
                        end );
                end );
        end );
    hoisted_15_1 := List( deduped_31_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_list_3 )
                    return List( logic_new_func_list_3, function ( logic_new_func_x_4 )
                            return ObjectIndex( Source( logic_new_func_x_4 ) );
                        end );
                end );
        end );
    hoisted_14_1 := CapJitTypedExpression( [  ], function (  )
            return rec(
                filter := IsList,
                element_type := rec(
                    filter := IsInt ) );
        end );
    hoisted_13_1 := DecompositionIndicesOfBasesElements( deduped_35_1 );
    hoisted_12_1 := List( deduped_31_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_list_3 )
                    return List( logic_new_func_list_3, CoefficientsList );
                end );
        end );
    hoisted_11_1 := List( deduped_36_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return Length( IndicesOfSupportMorphisms( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_10_1 := List( deduped_36_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return ObjectIndex( Range( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_9_1 := List( deduped_34_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return ObjectIndex( Source( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_8_1 := List( deduped_34_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return Length( IndicesOfSupportMorphisms( logic_new_func_x_3 ) );
                end );
        end );
    hoisted_7_1 := List( deduped_36_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return ObjectIndex( Source( logic_new_func_x_3 ) );
                end );
        end );
    deduped_6_1 := HomomorphismStructureOnObjectsRanks( deduped_35_1 );
    hoisted_5_1 := List( deduped_34_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, function ( logic_new_func_x_3 )
                    return ObjectIndex( Range( logic_new_func_x_3 ) );
                end );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_32_1, deduped_33_1, MorphismMatrix, List( [ 1 .. Length( deduped_29_1 ) ], function ( i_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2;
              hoisted_7_2 := deduped_29_1[i_2];
              hoisted_6_2 := deduped_6_1[hoisted_25_1[i_2]];
              hoisted_5_2 := hoisted_20_1[i_2];
              hoisted_4_2 := hoisted_19_1[i_2];
              hoisted_3_2 := hoisted_9_1[i_2];
              hoisted_2_2 := hoisted_8_1[i_2];
              hoisted_1_2 := hoisted_5_1[i_2];
              return List( hoisted_28_1, function ( j_3 )
                      return CreateCapCategoryMorphismWithAttributes( deduped_35_1, hoisted_7_2, deduped_30_1[j_3], CoefficientsList, Iterated( List( hoisted_24_1, function ( k_4 )
                                  local deduped_3_4, hoisted_4_4, hoisted_5_4, hoisted_6_4, hoisted_7_4, hoisted_8_4, hoisted_9_4, hoisted_10_4, hoisted_11_4, hoisted_12_4, deduped_13_4, deduped_14_4, deduped_15_4, deduped_16_4, deduped_17_4, deduped_18_4, deduped_19_4, deduped_20_4, deduped_21_4, deduped_22_4, deduped_23_4, deduped_24_4, deduped_25_4, deduped_26_4;
                                  deduped_26_4 := hoisted_3_2[k_4];
                                  deduped_25_4 := hoisted_2_2[k_4];
                                  deduped_24_4 := hoisted_1_2[k_4];
                                  deduped_23_4 := hoisted_11_1[k_4][j_3];
                                  deduped_22_4 := hoisted_10_1[k_4][j_3];
                                  deduped_21_4 := hoisted_7_1[k_4][j_3];
                                  deduped_20_4 := deduped_6_1[deduped_26_4][deduped_22_4];
                                  deduped_19_4 := deduped_6_1[deduped_24_4][deduped_21_4];
                                  deduped_17_4 := SafePositionProperty( hoisted_13_1[deduped_24_4][deduped_24_4], function ( indices_5 )
                                          return indices_5 = hoisted_14_1;
                                      end );
                                  deduped_16_4 := [ hoisted_12_1[deduped_24_4][deduped_24_4][deduped_17_4] ];
                                  deduped_15_4 := HomalgMatrixListList( deduped_16_4, 1, deduped_6_1[hoisted_15_1[deduped_24_4][deduped_24_4][deduped_17_4]][hoisted_16_1[deduped_24_4][deduped_24_4][deduped_17_4]], deduped_37_1 );
                                  deduped_14_4 := [ 1 .. NumberRows( deduped_15_4 ) ];
                                  deduped_3_4 := [ 1 .. NumberColumns( deduped_15_4 ) ];
                                  if deduped_19_4 = 0 or deduped_25_4 = 0 or (deduped_20_4 = 0 or deduped_23_4 = 0) then
                                      deduped_18_4 := NullMatImmutable( deduped_19_4, deduped_20_4 );
                                      hoisted_4_4 := [ 1 .. NumberColumns( HomalgMatrixListList( deduped_18_4, deduped_19_4, deduped_20_4, deduped_37_1 ) ) ];
                                      return List( deduped_14_4, function ( i_5 )
                                                local hoisted_1_5;
                                                hoisted_1_5 := deduped_16_4[i_5];
                                                return List( hoisted_4_4, function ( j_6 )
                                                        return Iterated( List( deduped_3_4, function ( k_7 )
                                                                  return hoisted_1_5[k_7] * deduped_18_4[k_7][j_6];
                                                              end ), function ( alpha_7, beta_7 )
                                                                return alpha_7 + beta_7;
                                                            end, deduped_18_1 );
                                                    end );
                                            end )[1];
                                  else
                                      hoisted_10_4 := [ 1 .. deduped_23_4 ];
                                      hoisted_9_4 := hoisted_23_1[deduped_26_4][deduped_24_4][deduped_21_4][deduped_22_4];
                                      hoisted_8_4 := hoisted_21_1[k_4][j_3];
                                      hoisted_7_4 := hoisted_22_1[k_4][j_3];
                                      hoisted_6_4 := hoisted_4_2[k_4];
                                      hoisted_5_4 := hoisted_5_2[k_4];
                                      deduped_13_4 := Sum( List( [ 1 .. deduped_25_4 ], function ( l_5 )
                                                local hoisted_1_5, hoisted_2_5, deduped_3_5;
                                                deduped_3_5 := hoisted_5_4[l_5];
                                                hoisted_2_5 := hoisted_9_4[deduped_3_5];
                                                hoisted_1_5 := hoisted_6_4[deduped_3_5];
                                                return Sum( List( hoisted_10_4, function ( r_6 )
                                                          local deduped_1_6;
                                                          deduped_1_6 := hoisted_7_4[r_6];
                                                          return hoisted_1_5 * hoisted_8_4[deduped_1_6] * hoisted_2_5[deduped_1_6];
                                                      end ) );
                                            end ) );
                                      hoisted_12_4 := [ 1 .. NumberColumns( deduped_13_4 ) ];
                                      hoisted_11_4 := EntriesOfHomalgMatrixAsListList( deduped_13_4 );
                                      return List( deduped_14_4, function ( i_5 )
                                                local hoisted_1_5;
                                                hoisted_1_5 := deduped_16_4[i_5];
                                                return List( hoisted_12_4, function ( j_6 )
                                                        return Iterated( List( deduped_3_4, function ( k_7 )
                                                                  return hoisted_1_5[k_7] * hoisted_11_4[k_7][j_6];
                                                              end ), function ( alpha_7, beta_7 )
                                                                return alpha_7 + beta_7;
                                                            end, deduped_18_1 );
                                                    end );
                                            end )[1];
                                  fi;
                                  return;
                              end ), function ( alpha_4, beta_4 )
                                return Sum( [ alpha_4, beta_4 ] );
                            end, ListWithIdenticalEntries( hoisted_6_2[hoisted_26_1[j_3]], deduped_18_1 ) ) );
                  end );
          end ) );
end
########
        
    ;
    
    ##
    AddSumOfMorphisms( cat,
        
########
function ( cat_1, source_1, list_of_morphisms_1, range_1 )
    local hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_7_1, deduped_8_1, deduped_9_1, deduped_10_1;
    deduped_10_1 := UnderlyingCategory( cat_1 );
    deduped_9_1 := ObjectList( range_1 );
    deduped_8_1 := ObjectList( source_1 );
    hoisted_7_1 := [ 1 .. Length( deduped_9_1 ) ];
    hoisted_5_1 := ZeroImmutable( CommutativeRingOfLinearCategory( cat_1 ) );
    hoisted_4_1 := List( deduped_9_1, ObjectIndex );
    hoisted_3_1 := HomomorphismStructureOnObjectsRanks( deduped_10_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, MorphismMatrix, List( [ 1 .. Length( deduped_8_1 ) ], function ( i_2 )
              local hoisted_1_2, deduped_3_2;
              deduped_3_2 := deduped_8_1[i_2];
              hoisted_1_2 := hoisted_3_1[CAP_JIT_INCOMPLETE_LOGIC( ObjectIndex( CAP_JIT_INCOMPLETE_LOGIC( deduped_3_2 ) ) )];
              return List( hoisted_7_1, function ( j_3 )
                      return CreateCapCategoryMorphismWithAttributes( deduped_10_1, deduped_3_2, deduped_9_1[j_3], CoefficientsList, Iterated( List( list_of_morphisms_1, function ( m_4 )
                                  return CAP_JIT_INCOMPLETE_LOGIC( CoefficientsList( CAP_JIT_INCOMPLETE_LOGIC( CAP_JIT_INCOMPLETE_LOGIC( MorphismMatrix( m_4 )[i_2] )[j_3] ) ) );
                              end ), function ( alpha_4, beta_4 )
                                return Sum( [ alpha_4, beta_4 ] );
                            end, ListWithIdenticalEntries( hoisted_1_2[hoisted_4_1[j_3]], hoisted_5_1 ) ) );
                  end );
          end ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.SumOfMorphisms :=
        
########
function ( cat_1, source_1, list_of_morphisms_1, range_1 )
    local hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_8_1, deduped_9_1, deduped_10_1, deduped_11_1;
    deduped_11_1 := UnderlyingCategory( cat_1 );
    deduped_10_1 := ObjectList( range_1 );
    deduped_9_1 := ObjectList( source_1 );
    hoisted_8_1 := [ 1 .. Length( deduped_10_1 ) ];
    hoisted_6_1 := ZeroImmutable( CommutativeRingOfLinearCategory( cat_1 ) );
    hoisted_5_1 := List( deduped_10_1, ObjectIndex );
    hoisted_4_1 := HomomorphismStructureOnObjectsRanks( deduped_11_1 );
    hoisted_3_1 := List( deduped_9_1, ObjectIndex );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, MorphismMatrix, List( [ 1 .. Length( deduped_9_1 ) ], function ( i_2 )
              local hoisted_1_2, hoisted_2_2;
              hoisted_2_2 := deduped_9_1[i_2];
              hoisted_1_2 := hoisted_4_1[hoisted_3_1[i_2]];
              return List( hoisted_8_1, function ( j_3 )
                      return CreateCapCategoryMorphismWithAttributes( deduped_11_1, hoisted_2_2, deduped_10_1[j_3], CoefficientsList, Iterated( List( list_of_morphisms_1, function ( m_4 )
                                  return List( MorphismMatrix( m_4 ), function ( logic_new_func_list_5 )
                                              return List( logic_new_func_list_5, CoefficientsList );
                                          end )[i_2][j_3];
                              end ), function ( alpha_4, beta_4 )
                                return Sum( [ alpha_4, beta_4 ] );
                            end, ListWithIdenticalEntries( hoisted_1_2[hoisted_5_1[j_3]], hoisted_6_1 ) ) );
                  end );
          end ) );
end
########
        
    ;
    
    ##
    AddUniversalMorphismFromDirectSumWithGivenDirectSum( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, MorphismMatrix, UnionOfRowsListList( Length( ObjectList( T_1 ) ), List( tau_1, MorphismMatrix ) ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoDirectSumWithGivenDirectSum( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, MorphismMatrix, UnionOfColumnsListList( Length( ObjectList( T_1 ) ), List( tau_1, MorphismMatrix ) ) );
end
########
        
    , 100 );
    
    ##
    AddZeroMorphism( cat,
        
########
function ( cat_1, a_1, b_1 )
    local hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_7_1, deduped_8_1, deduped_9_1, deduped_10_1;
    deduped_10_1 := UnderlyingCategory( cat_1 );
    deduped_9_1 := ObjectList( b_1 );
    deduped_8_1 := ObjectList( a_1 );
    hoisted_7_1 := [ 1 .. Length( deduped_9_1 ) ];
    hoisted_5_1 := ZeroImmutable( CommutativeRingOfLinearCategory( cat_1 ) );
    hoisted_4_1 := List( deduped_9_1, ObjectIndex );
    hoisted_3_1 := HomomorphismStructureOnObjectsRanks( deduped_10_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, b_1, MorphismMatrix, List( [ 1 .. Length( deduped_8_1 ) ], function ( i_2 )
              local hoisted_1_2, deduped_3_2;
              deduped_3_2 := deduped_8_1[i_2];
              hoisted_1_2 := hoisted_3_1[CAP_JIT_INCOMPLETE_LOGIC( ObjectIndex( CAP_JIT_INCOMPLETE_LOGIC( deduped_3_2 ) ) )];
              return List( hoisted_7_1, function ( j_3 )
                      return CreateCapCategoryMorphismWithAttributes( deduped_10_1, deduped_3_2, deduped_9_1[j_3], CoefficientsList, ListWithIdenticalEntries( hoisted_1_2[hoisted_4_1[j_3]], hoisted_5_1 ) );
                  end );
          end ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.ZeroMorphism :=
        
########
function ( cat_1, a_1, b_1 )
    local hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_8_1, deduped_9_1, deduped_10_1, deduped_11_1;
    deduped_11_1 := UnderlyingCategory( cat_1 );
    deduped_10_1 := ObjectList( b_1 );
    deduped_9_1 := ObjectList( a_1 );
    hoisted_8_1 := [ 1 .. Length( deduped_10_1 ) ];
    hoisted_6_1 := ZeroImmutable( CommutativeRingOfLinearCategory( cat_1 ) );
    hoisted_5_1 := List( deduped_10_1, ObjectIndex );
    hoisted_4_1 := HomomorphismStructureOnObjectsRanks( deduped_11_1 );
    hoisted_3_1 := List( deduped_9_1, ObjectIndex );
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, b_1, MorphismMatrix, List( [ 1 .. Length( deduped_9_1 ) ], function ( i_2 )
              local hoisted_1_2, hoisted_2_2;
              hoisted_2_2 := deduped_9_1[i_2];
              hoisted_1_2 := hoisted_4_1[hoisted_3_1[i_2]];
              return List( hoisted_8_1, function ( j_3 )
                      return CreateCapCategoryMorphismWithAttributes( deduped_11_1, hoisted_2_2, deduped_10_1[j_3], CoefficientsList, ListWithIdenticalEntries( hoisted_1_2[hoisted_5_1[j_3]], hoisted_6_1 ) );
                  end );
          end ) );
end
########
        
    ;
    
    ##
    AddZeroObject( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, ObjectList, [  ] );
end
########
        
    , 100 );
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
end );

BindGlobal( "AdditiveClosureOfAlgebroidFromDataTablesPrecompiled", function ( data_tables )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function ( data_tables )
    return AdditiveClosure( AlgebroidFromDataTables( ShallowCopy( data_tables ) : range_of_HomStructure := CategoryOfRows_as_AdditiveClosure_RingAsCategory( data_tables[1] : FinalizeCategory := true ),
          FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor( data_tables : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_AdditiveClosureOfAlgebroidFromDataTablesPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
