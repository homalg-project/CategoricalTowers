# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_PreSheavesOfFreeAlgebroidInCategoryOfRowsPrecompiled", function ( cat )
    
    ##
    AddAdditionForMorphisms( cat,
        
########
function ( cat_1, a_1, b_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1;
    deduped_6_1 := ValuesOnAllObjects( a_1 );
    hoisted_5_1 := Range( cat_1 );
    hoisted_4_1 := List( ValuesOnAllObjects( b_1 ), UnderlyingMatrix );
    hoisted_3_1 := List( deduped_6_1, UnderlyingMatrix );
    hoisted_2_1 := List( deduped_6_1, Range );
    hoisted_1_1 := List( deduped_6_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( a_1 ), Range( a_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, hoisted_3_1[o_2] + hoisted_4_1[o_2] );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddAdditiveInverseForMorphisms( cat,
        
########
function ( cat_1, a_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1;
    deduped_5_1 := ValuesOnAllObjects( a_1 );
    hoisted_4_1 := Range( cat_1 );
    hoisted_3_1 := List( deduped_5_1, function ( logic_new_func_x_2 )
            return - UnderlyingMatrix( logic_new_func_x_2 );
        end );
    hoisted_2_1 := List( deduped_5_1, Range );
    hoisted_1_1 := List( deduped_5_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( a_1 ), Range( a_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, hoisted_3_1[o_2] );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddAssociatorLeftToRightWithGivenTensorProducts( cat,
        
########
function ( cat_1, s_1, a_1, b_1, c_1, r_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1;
    deduped_6_1 := Range( cat_1 );
    deduped_5_1 := ValuesOfPreSheaf( s_1 )[1];
    hoisted_4_1 := deduped_6_1;
    hoisted_3_1 := UnderlyingRing( deduped_6_1 );
    hoisted_2_1 := List( deduped_5_1, RankOfObject );
    hoisted_1_1 := deduped_5_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_1_1[o_2];
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, deduped_1_2, deduped_1_2, UnderlyingMatrix, HomalgIdentityMatrix( hoisted_2_1[o_2], hoisted_3_1 ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddAssociatorRightToLeftWithGivenTensorProducts( cat,
        
########
function ( cat_1, s_1, a_1, b_1, c_1, r_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1;
    deduped_6_1 := Range( cat_1 );
    deduped_5_1 := ValuesOfPreSheaf( s_1 )[1];
    hoisted_4_1 := deduped_6_1;
    hoisted_3_1 := UnderlyingRing( deduped_6_1 );
    hoisted_2_1 := List( deduped_5_1, RankOfObject );
    hoisted_1_1 := deduped_5_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_1_1[o_2];
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, deduped_1_2, deduped_1_2, UnderlyingMatrix, HomalgIdentityMatrix( hoisted_2_1[o_2], hoisted_3_1 ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddBasisOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1;
    deduped_41_1 := ValuesOfPreSheaf( arg3_1 );
    deduped_40_1 := ValuesOfPreSheaf( arg2_1 );
    deduped_39_1 := SetOfObjects( cat_1 );
    deduped_38_1 := SetOfGeneratingMorphisms( cat_1 );
    deduped_37_1 := Range( cat_1 );
    deduped_36_1 := deduped_41_1[1];
    deduped_35_1 := deduped_40_1[1];
    deduped_34_1 := deduped_41_1[2];
    deduped_33_1 := deduped_40_1[2];
    deduped_32_1 := Length( deduped_39_1 );
    deduped_31_1 := UnderlyingRing( deduped_37_1 );
    deduped_30_1 := [ 1 .. deduped_32_1 ];
    deduped_29_1 := [ 1 .. Length( deduped_38_1 ) ];
    hoisted_2_1 := List( deduped_34_1, function ( logic_new_func_x_2 )
            return RankOfObject( Range( logic_new_func_x_2 ) );
        end );
    hoisted_1_1 := List( deduped_33_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    deduped_28_1 := List( deduped_29_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[logic_new_func_x_2] * hoisted_2_1[logic_new_func_x_2];
        end );
    hoisted_13_1 := deduped_29_1;
    hoisted_12_1 := deduped_28_1;
    hoisted_11_1 := deduped_30_1;
    hoisted_10_1 := List( deduped_34_1, UnderlyingMatrix );
    hoisted_9_1 := deduped_31_1;
    hoisted_8_1 := List( deduped_33_1, function ( logic_new_func_x_2 )
            return TransposedMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_7_1 := List( deduped_38_1, Range );
    hoisted_6_1 := List( deduped_38_1, Source );
    hoisted_5_1 := deduped_39_1;
    hoisted_4_1 := List( deduped_36_1, RankOfObject );
    hoisted_3_1 := List( deduped_35_1, RankOfObject );
    deduped_27_1 := SyzygiesOfRows( UnionOfRows( deduped_31_1, Sum( deduped_28_1 ), List( deduped_30_1, function ( logic_new_func_x_2 )
                local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
                deduped_7_2 := hoisted_4_1[logic_new_func_x_2];
                deduped_6_2 := hoisted_3_1[logic_new_func_x_2];
                deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_11_1[logic_new_func_x_2] );
                hoisted_4_2 := hoisted_3_1[deduped_5_2] * hoisted_4_1[deduped_5_2];
                hoisted_3_2 := TransposedMatrix( HomalgIdentityMatrix( deduped_6_2, hoisted_9_1 ) );
                hoisted_2_2 := HomalgIdentityMatrix( deduped_7_2, hoisted_9_1 );
                hoisted_1_2 := hoisted_5_1[logic_new_func_x_2];
                return UnionOfColumns( hoisted_9_1, deduped_6_2 * deduped_7_2, List( hoisted_13_1, function ( logic_new_func_x_3 )
                          local deduped_1_3, deduped_2_3, deduped_3_3, deduped_4_3;
                          deduped_4_3 := hoisted_1_2 = hoisted_7_1[logic_new_func_x_3];
                          deduped_3_3 := hoisted_1_2 = hoisted_6_1[logic_new_func_x_3];
                          deduped_2_3 := KroneckerMat( hoisted_8_1[logic_new_func_x_3], hoisted_2_2 );
                          deduped_1_3 := - KroneckerMat( hoisted_3_2, hoisted_10_1[logic_new_func_x_3] );
                          if deduped_3_3 and deduped_4_3 then
                              return deduped_2_3 + deduped_1_3;
                          elif not deduped_3_3 and deduped_4_3 then
                              return deduped_1_3;
                          elif deduped_3_3 and not deduped_4_3 then
                              return deduped_2_3;
                          else
                              return HomalgZeroMatrix( hoisted_4_2, hoisted_12_1[logic_new_func_x_3], hoisted_9_1 );
                          fi;
                          return;
                      end ) );
            end ) ) );
    deduped_26_1 := NumberRows( deduped_27_1 );
    deduped_25_1 := 1 * deduped_26_1;
    deduped_24_1 := [ 1 .. deduped_25_1 ];
    hoisted_23_1 := deduped_37_1;
    hoisted_21_1 := deduped_24_1;
    hoisted_20_1 := deduped_27_1;
    hoisted_19_1 := deduped_32_1;
    hoisted_18_1 := List( deduped_30_1, function ( logic_new_func_x_2 )
            return hoisted_3_1[logic_new_func_x_2] * hoisted_4_1[logic_new_func_x_2];
        end );
    hoisted_17_1 := deduped_26_1;
    hoisted_16_1 := HomalgIdentityMatrix( deduped_25_1, deduped_31_1 );
    hoisted_22_1 := List( [ 1 .. Length( deduped_35_1 ) ], function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2;
            deduped_2_2 := hoisted_18_1[logic_new_func_x_2];
            hoisted_1_2 := hoisted_20_1 * UnionOfRows( HomalgZeroMatrix( Sum( hoisted_18_1{[ 1 .. (logic_new_func_x_2 - 1) ]} ), deduped_2_2, hoisted_9_1 ), HomalgIdentityMatrix( deduped_2_2, hoisted_9_1 ), HomalgZeroMatrix( Sum( hoisted_18_1{[ (logic_new_func_x_2 + 1) .. hoisted_19_1 ]} ), deduped_2_2, hoisted_9_1 ) );
            return List( hoisted_21_1, function ( logic_new_func_x_3 )
                    return ConvertRowToMatrix( CertainRows( hoisted_16_1, [ logic_new_func_x_3 ] ), 1, hoisted_17_1 ) * hoisted_1_2;
                end );
        end );
    hoisted_15_1 := deduped_36_1;
    hoisted_14_1 := deduped_35_1;
    return List( deduped_24_1, function ( j_2 )
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, ValuesOnAllObjects, LazyHList( hoisted_11_1, function ( i_3 )
                      return CreateCapCategoryMorphismWithAttributes( hoisted_23_1, hoisted_14_1[i_3], hoisted_15_1[i_3], UnderlyingMatrix, ConvertRowToMatrix( hoisted_22_1[i_3][j_2], hoisted_3_1[i_3], hoisted_4_1[i_3] ) );
                  end ) );
        end );
end
########
        
    , 100 );
    
    ##
    AddBraidingInverseWithGivenTensorProducts( cat,
        
########
function ( cat_1, s_1, a_1, b_1, r_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := Range( cat_1 );
    deduped_8_1 := ValuesOfPreSheaf( s_1 )[1];
    hoisted_7_1 := deduped_9_1;
    hoisted_6_1 := UnderlyingRing( deduped_9_1 );
    hoisted_5_1 := List( ValuesOfPreSheaf( b_1 )[1], RankOfObject );
    hoisted_4_1 := List( ValuesOfPreSheaf( a_1 )[1], RankOfObject );
    hoisted_3_1 := List( deduped_8_1, RankOfObject );
    hoisted_2_1 := ValuesOfPreSheaf( r_1 )[1];
    hoisted_1_1 := deduped_8_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := hoisted_3_1[o_2];
              hoisted_2_2 := hoisted_5_1[o_2];
              hoisted_1_2 := hoisted_4_1[o_2];
              return CreateCapCategoryMorphismWithAttributes( hoisted_7_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, HomalgMatrix( PermutationMat( PermList( List( [ 1 .. deduped_3_2 ], function ( i_3 )
                              local deduped_1_3;
                              deduped_1_3 := i_3 - 1;
                              return REM_INT( deduped_1_3, hoisted_1_2 ) * hoisted_2_2 + QUO_INT( deduped_1_3, hoisted_1_2 ) + 1;
                          end ) ), deduped_3_2 ), deduped_3_2, deduped_3_2, hoisted_6_1 ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddBraidingWithGivenTensorProducts( cat,
        
########
function ( cat_1, s_1, a_1, b_1, r_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := Range( cat_1 );
    deduped_8_1 := ValuesOfPreSheaf( s_1 )[1];
    hoisted_7_1 := deduped_9_1;
    hoisted_6_1 := UnderlyingRing( deduped_9_1 );
    hoisted_5_1 := List( ValuesOfPreSheaf( a_1 )[1], RankOfObject );
    hoisted_4_1 := List( ValuesOfPreSheaf( b_1 )[1], RankOfObject );
    hoisted_3_1 := List( deduped_8_1, RankOfObject );
    hoisted_2_1 := ValuesOfPreSheaf( r_1 )[1];
    hoisted_1_1 := deduped_8_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := hoisted_3_1[o_2];
              hoisted_2_2 := hoisted_5_1[o_2];
              hoisted_1_2 := hoisted_4_1[o_2];
              return CreateCapCategoryMorphismWithAttributes( hoisted_7_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, HomalgMatrix( PermutationMat( PermList( List( [ 1 .. deduped_3_2 ], function ( i_3 )
                              local deduped_1_3;
                              deduped_1_3 := i_3 - 1;
                              return REM_INT( deduped_1_3, hoisted_1_2 ) * hoisted_2_2 + QUO_INT( deduped_1_3, hoisted_1_2 ) + 1;
                          end ) ), deduped_3_2 ), deduped_3_2, deduped_3_2, hoisted_6_1 ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCoastrictionToImageWithGivenImageObject( cat,
        
########
function ( cat_1, alpha_1, I_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := Range( cat_1 );
    deduped_8_1 := ValuesOnAllObjects( alpha_1 );
    hoisted_7_1 := deduped_9_1;
    hoisted_6_1 := List( deduped_8_1, function ( logic_new_func_x_2 )
            return SyzygiesOfRows( SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) ) );
        end );
    hoisted_5_1 := UnderlyingRing( deduped_9_1 );
    hoisted_4_1 := List( deduped_8_1, function ( logic_new_func_x_2 )
            return RowRankOfMatrix( SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) ) );
        end );
    hoisted_3_1 := List( deduped_8_1, function ( logic_new_func_x_2 )
            return RankOfObject( Range( logic_new_func_x_2 ) );
        end );
    hoisted_2_1 := List( deduped_8_1, UnderlyingMatrix );
    hoisted_1_1 := List( deduped_8_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), I_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local morphism_attr_1_2;
              morphism_attr_1_2 := RightDivide( hoisted_2_1[o_2], HomalgIdentityMatrix( (hoisted_3_1[o_2] - hoisted_4_1[o_2]), hoisted_5_1 ) * hoisted_6_1[o_2] );
              return CreateCapCategoryMorphismWithAttributes( hoisted_7_1, hoisted_1_1[o_2], CreateCapCategoryObjectWithAttributes( hoisted_7_1, RankOfObject, NumberColumns( morphism_attr_1_2 ) ), UnderlyingMatrix, morphism_attr_1_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCoefficientsOfMorphism( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1;
    deduped_23_1 := SetOfObjects( cat_1 );
    deduped_22_1 := SetOfGeneratingMorphisms( cat_1 );
    deduped_21_1 := ValuesOfPreSheaf( Range( arg2_1 ) );
    deduped_20_1 := ValuesOfPreSheaf( Source( arg2_1 ) );
    deduped_19_1 := UnderlyingRing( Range( cat_1 ) );
    deduped_18_1 := [ 1 .. Length( deduped_23_1 ) ];
    deduped_17_1 := [ 1 .. Length( deduped_22_1 ) ];
    deduped_16_1 := deduped_21_1[2];
    deduped_15_1 := deduped_20_1[2];
    hoisted_2_1 := List( deduped_16_1, function ( logic_new_func_x_2 )
            return RankOfObject( Range( logic_new_func_x_2 ) );
        end );
    hoisted_1_1 := List( deduped_15_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    deduped_14_1 := List( deduped_17_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[logic_new_func_x_2] * hoisted_2_1[logic_new_func_x_2];
        end );
    hoisted_13_1 := deduped_17_1;
    hoisted_12_1 := deduped_14_1;
    hoisted_11_1 := deduped_18_1;
    hoisted_10_1 := List( deduped_16_1, UnderlyingMatrix );
    hoisted_9_1 := deduped_19_1;
    hoisted_8_1 := List( deduped_15_1, function ( logic_new_func_x_2 )
            return TransposedMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_7_1 := List( deduped_22_1, Range );
    hoisted_6_1 := List( deduped_22_1, Source );
    hoisted_5_1 := deduped_23_1;
    hoisted_4_1 := List( deduped_21_1[1], RankOfObject );
    hoisted_3_1 := List( deduped_20_1[1], RankOfObject );
    return EntriesOfHomalgMatrix( RightDivide( UnionOfColumns( deduped_19_1, 1, List( ListOfValues( ValuesOnAllObjects( arg2_1 ) ), function ( logic_new_func_x_2 )
                  return ConvertMatrixToRow( UnderlyingMatrix( logic_new_func_x_2 ) );
              end ) ), SyzygiesOfRows( UnionOfRows( deduped_19_1, Sum( deduped_14_1 ), List( deduped_18_1, function ( logic_new_func_x_2 )
                    local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
                    deduped_7_2 := hoisted_4_1[logic_new_func_x_2];
                    deduped_6_2 := hoisted_3_1[logic_new_func_x_2];
                    deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_11_1[logic_new_func_x_2] );
                    hoisted_4_2 := hoisted_3_1[deduped_5_2] * hoisted_4_1[deduped_5_2];
                    hoisted_3_2 := TransposedMatrix( HomalgIdentityMatrix( deduped_6_2, hoisted_9_1 ) );
                    hoisted_2_2 := HomalgIdentityMatrix( deduped_7_2, hoisted_9_1 );
                    hoisted_1_2 := hoisted_5_1[logic_new_func_x_2];
                    return UnionOfColumns( hoisted_9_1, deduped_6_2 * deduped_7_2, List( hoisted_13_1, function ( logic_new_func_x_3 )
                              local deduped_1_3, deduped_2_3, deduped_3_3, deduped_4_3;
                              deduped_4_3 := hoisted_1_2 = hoisted_7_1[logic_new_func_x_3];
                              deduped_3_3 := hoisted_1_2 = hoisted_6_1[logic_new_func_x_3];
                              deduped_2_3 := KroneckerMat( hoisted_8_1[logic_new_func_x_3], hoisted_2_2 );
                              deduped_1_3 := - KroneckerMat( hoisted_3_2, hoisted_10_1[logic_new_func_x_3] );
                              if deduped_3_3 and deduped_4_3 then
                                  return deduped_2_3 + deduped_1_3;
                              elif not deduped_3_3 and deduped_4_3 then
                                  return deduped_1_3;
                              elif deduped_3_3 and not deduped_4_3 then
                                  return deduped_2_3;
                              else
                                  return HomalgZeroMatrix( hoisted_4_2, hoisted_12_1[logic_new_func_x_3], hoisted_9_1 );
                              fi;
                              return;
                          end ) );
                end ) ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddCokernelColiftWithGivenCokernelObject( cat,
        
########
function ( cat_1, alpha_1, T_1, tau_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1;
    deduped_5_1 := ValuesOnAllObjects( tau_1 );
    hoisted_4_1 := List( deduped_5_1, Range );
    hoisted_3_1 := Range( cat_1 );
    hoisted_2_1 := List( deduped_5_1, UnderlyingMatrix );
    hoisted_1_1 := List( ValuesOnAllObjects( alpha_1 ), function ( logic_new_func_x_2 )
            return SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local morphism_attr_1_2;
              morphism_attr_1_2 := LeftDivide( hoisted_1_1[o_2], hoisted_2_1[o_2] );
              return CreateCapCategoryMorphismWithAttributes( hoisted_3_1, CreateCapCategoryObjectWithAttributes( hoisted_3_1, RankOfObject, NumberRows( morphism_attr_1_2 ) ), hoisted_4_1[o_2], UnderlyingMatrix, morphism_attr_1_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCokernelObject( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1;
    deduped_10_1 := ValuesOnAllObjects( arg2_1 );
    deduped_9_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_8_1 := Range( cat_1 );
    deduped_7_1 := deduped_9_1[2];
    hoisted_6_1 := List( ValuesOfPreSheaf( Range( arg2_1 ) )[2], UnderlyingMatrix );
    hoisted_5_1 := List( deduped_10_1, function ( logic_new_func_x_2 )
            return SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_4_1 := deduped_7_1;
    hoisted_3_1 := deduped_8_1;
    hoisted_2_1 := List( deduped_10_1, function ( logic_new_func_x_2 )
            return RowRankOfMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_1_1 := List( deduped_10_1, function ( logic_new_func_x_2 )
            return RankOfObject( Range( logic_new_func_x_2 ) );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, Source( cat_1 ), Range, deduped_8_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_9_1[1] ], function ( o_2 )
                return CreateCapCategoryObjectWithAttributes( hoisted_3_1, RankOfObject, hoisted_1_1[o_2] - hoisted_2_1[o_2] );
            end ), LazyHList( [ 1 .. Length( deduped_7_1 ) ], function ( m_2 )
                local morphism_attr_1_2, deduped_2_2;
                deduped_2_2 := hoisted_4_1[m_2];
                morphism_attr_1_2 := LeftDivide( hoisted_5_1[1 + deduped_2_2[2]], hoisted_6_1[m_2] * hoisted_5_1[(1 + deduped_2_2[1])] );
                return CreateCapCategoryMorphismWithAttributes( hoisted_3_1, CreateCapCategoryObjectWithAttributes( hoisted_3_1, RankOfObject, NumberRows( morphism_attr_1_2 ) ), CreateCapCategoryObjectWithAttributes( hoisted_3_1, RankOfObject, NumberColumns( morphism_attr_1_2 ) ), UnderlyingMatrix, morphism_attr_1_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddCokernelObjectFunctorialWithGivenCokernelObjects( cat,
        
########
function ( cat_1, P_1, alpha_1, mu_1, alphap_1, Pp_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1;
    hoisted_4_1 := Range( cat_1 );
    hoisted_3_1 := List( ValuesOnAllObjects( alphap_1 ), function ( logic_new_func_x_2 )
            return SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_2_1 := List( ValuesOnAllObjects( mu_1 ), UnderlyingMatrix );
    hoisted_1_1 := List( ValuesOnAllObjects( alpha_1 ), function ( logic_new_func_x_2 )
            return SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Pp_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local morphism_attr_1_2;
              morphism_attr_1_2 := LeftDivide( hoisted_1_1[o_2], hoisted_2_1[o_2] * hoisted_3_1[o_2] );
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, CreateCapCategoryObjectWithAttributes( hoisted_4_1, RankOfObject, NumberRows( morphism_attr_1_2 ) ), CreateCapCategoryObjectWithAttributes( hoisted_4_1, RankOfObject, NumberColumns( morphism_attr_1_2 ) ), UnderlyingMatrix, morphism_attr_1_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCokernelProjectionWithGivenCokernelObject( cat,
        
########
function ( cat_1, alpha_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1;
    deduped_4_1 := ValuesOnAllObjects( alpha_1 );
    hoisted_3_1 := Range( cat_1 );
    hoisted_2_1 := List( deduped_4_1, function ( logic_new_func_x_2 )
            return SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_1_1 := List( deduped_4_1, Range );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Range( alpha_1 ), P_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local morphism_attr_1_2;
              morphism_attr_1_2 := hoisted_2_1[o_2];
              return CreateCapCategoryMorphismWithAttributes( hoisted_3_1, hoisted_1_1[o_2], CreateCapCategoryObjectWithAttributes( hoisted_3_1, RankOfObject, NumberColumns( morphism_attr_1_2 ) ), UnderlyingMatrix, morphism_attr_1_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddColiftAlongEpimorphism( cat,
        
########
function ( cat_1, epsilon_1, tau_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := ValuesOnAllObjects( tau_1 );
    deduped_6_1 := ValuesOnAllObjects( epsilon_1 );
    hoisted_5_1 := Range( cat_1 );
    hoisted_4_1 := List( deduped_7_1, UnderlyingMatrix );
    hoisted_3_1 := List( deduped_6_1, UnderlyingMatrix );
    hoisted_2_1 := List( deduped_7_1, Range );
    hoisted_1_1 := List( deduped_6_1, Range );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Range( epsilon_1 ), Range( tau_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, LeftDivide( hoisted_3_1[o_2], hoisted_4_1[o_2] ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddComponentOfMorphismFromDirectSum( cat,
        
########
function ( cat_1, alpha_1, S_1, i_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := ValuesOnAllObjects( alpha_1 );
    deduped_6_1 := S_1[i_1];
    hoisted_5_1 := Range( cat_1 );
    hoisted_4_1 := [ 1 .. i_1 - 1 ];
    hoisted_3_1 := List( deduped_7_1, UnderlyingMatrix );
    hoisted_2_1 := List( deduped_7_1, Range );
    hoisted_1_1 := ValuesOfPreSheaf( CAP_JIT_INCOMPLETE_LOGIC( deduped_6_1 ) )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_6_1, Range( alpha_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local deduped_1_2, deduped_2_2;
              deduped_2_2 := List( S_1, function ( logic_new_func_x_3 )
                      return RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][o_2] ) );
                  end );
              deduped_1_2 := Sum( deduped_2_2{hoisted_4_1} ) + 1;
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, CertainRows( hoisted_3_1[o_2], [ deduped_1_2 .. deduped_1_2 - 1 + deduped_2_2[i_1] ] ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddComponentOfMorphismIntoDirectSum( cat,
        
########
function ( cat_1, alpha_1, S_1, i_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := ValuesOnAllObjects( alpha_1 );
    deduped_6_1 := S_1[i_1];
    hoisted_5_1 := Range( cat_1 );
    hoisted_4_1 := [ 1 .. i_1 - 1 ];
    hoisted_3_1 := List( deduped_7_1, UnderlyingMatrix );
    hoisted_2_1 := ValuesOfPreSheaf( CAP_JIT_INCOMPLETE_LOGIC( deduped_6_1 ) )[1];
    hoisted_1_1 := List( deduped_7_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), deduped_6_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local deduped_1_2, deduped_2_2;
              deduped_2_2 := List( S_1, function ( logic_new_func_x_3 )
                      return RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][o_2] ) );
                  end );
              deduped_1_2 := Sum( deduped_2_2{hoisted_4_1} ) + 1;
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, CertainColumns( hoisted_3_1[o_2], [ deduped_1_2 .. deduped_1_2 - 1 + deduped_2_2[i_1] ] ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCoproduct( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := Length( arg2_1 );
    deduped_8_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_7_1 := Range( cat_1 );
    deduped_6_1 := deduped_8_1[2];
    hoisted_5_1 := [ 1 .. deduped_9_1 ];
    hoisted_4_1 := deduped_9_1;
    hoisted_3_1 := deduped_6_1;
    hoisted_2_1 := UnderlyingRing( deduped_7_1 );
    hoisted_1_1 := deduped_7_1;
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, Source( cat_1 ), Range, deduped_7_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_8_1[1] ], function ( o_2 )
                return CreateCapCategoryObjectWithAttributes( hoisted_1_1, RankOfObject, Sum( List( arg2_1, function ( logic_new_func_x_3 )
                            return RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][o_2] ) );
                        end ) ) );
            end ), LazyHList( [ 1 .. Length( deduped_6_1 ) ], function ( m_2 )
                local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2, deduped_6_2;
                deduped_6_2 := List( arg2_1, function ( logic_new_func_x_3 )
                        return RankOfObject( Range( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[2][m_2] ) ) );
                    end );
                hoisted_4_2 := HomalgIdentityMatrix( Sum( deduped_6_2 ), hoisted_2_1 );
                hoisted_3_2 := deduped_6_2;
                hoisted_2_2 := List( arg2_1, function ( logic_new_func_x_3 )
                        return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[2][m_2] ) );
                    end );
                hoisted_1_2 := 1 + hoisted_3_1[m_2][1];
                deduped_5_2 := HomalgIdentityMatrix( Sum( List( arg2_1, function ( logic_new_func_x_3 )
                              return RankOfObject( Source( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[2][m_2] ) ) );
                          end ) ), hoisted_2_1 ) * UnionOfRows( hoisted_2_1, Sum( List( arg2_1, function ( logic_new_func_x_3 )
                              return RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][hoisted_1_2] ) );
                          end ) ), List( hoisted_5_1, function ( logic_new_func_x_3 )
                            local deduped_1_3;
                            deduped_1_3 := hoisted_3_2[logic_new_func_x_3];
                            return (hoisted_2_2[logic_new_func_x_3] * (UnionOfColumns( HomalgZeroMatrix( deduped_1_3, Sum( hoisted_3_2{[ 1 .. (logic_new_func_x_3 - 1) ]} ), hoisted_2_1 ), HomalgIdentityMatrix( deduped_1_3, hoisted_2_1 ), HomalgZeroMatrix( deduped_1_3, Sum( hoisted_3_2{[ (logic_new_func_x_3 + 1) .. hoisted_4_1 ]} ), hoisted_2_1 ) ) * hoisted_4_2));
                        end ) );
                return CreateCapCategoryMorphismWithAttributes( hoisted_1_1, CreateCapCategoryObjectWithAttributes( hoisted_1_1, RankOfObject, NumberRows( deduped_5_2 ) ), CreateCapCategoryObjectWithAttributes( hoisted_1_1, RankOfObject, NumberColumns( deduped_5_2 ) ), UnderlyingMatrix, deduped_5_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddCoproductFunctorialWithGivenCoproducts( cat,
        
########
function ( cat_1, P_1, objects_1, L_1, objectsp_1, Pp_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1;
    deduped_8_1 := Range( cat_1 );
    deduped_7_1 := ValuesOfPreSheaf( Pp_1 )[1];
    hoisted_6_1 := deduped_7_1;
    hoisted_5_1 := deduped_8_1;
    hoisted_4_1 := [ 1 .. Length( L_1 ) ];
    hoisted_3_1 := Length( objectsp_1 );
    hoisted_2_1 := List( deduped_7_1, RankOfObject );
    hoisted_1_1 := UnderlyingRing( deduped_8_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Pp_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2, deduped_5_2;
              deduped_5_2 := List( objectsp_1, function ( logic_new_func_x_3 )
                      return RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][o_2] ) );
                  end );
              hoisted_3_2 := HomalgIdentityMatrix( Sum( deduped_5_2 ), hoisted_1_1 );
              hoisted_2_2 := deduped_5_2;
              hoisted_1_2 := List( L_1, function ( logic_new_func_x_3 )
                      return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                  end );
              deduped_4_2 := HomalgIdentityMatrix( Sum( List( objects_1, function ( logic_new_func_x_3 )
                            return RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][o_2] ) );
                        end ) ), hoisted_1_1 ) * UnionOfRows( hoisted_1_1, hoisted_2_1[o_2], List( hoisted_4_1, function ( logic_new_func_x_3 )
                          local deduped_1_3;
                          deduped_1_3 := hoisted_2_2[logic_new_func_x_3];
                          return (hoisted_1_2[logic_new_func_x_3] * (UnionOfColumns( HomalgZeroMatrix( deduped_1_3, Sum( hoisted_2_2{[ 1 .. (logic_new_func_x_3 - 1) ]} ), hoisted_1_1 ), HomalgIdentityMatrix( deduped_1_3, hoisted_1_1 ), HomalgZeroMatrix( deduped_1_3, Sum( hoisted_2_2{[ (logic_new_func_x_3 + 1) .. hoisted_3_1 ]} ), hoisted_1_1 ) ) * hoisted_3_2));
                      end ) );
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, CreateCapCategoryObjectWithAttributes( hoisted_5_1, RankOfObject, NumberRows( deduped_4_2 ) ), hoisted_6_1[o_2], UnderlyingMatrix, deduped_4_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddDirectProduct( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := Length( arg2_1 );
    deduped_8_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_7_1 := Range( cat_1 );
    deduped_6_1 := deduped_8_1[2];
    hoisted_5_1 := [ 1 .. deduped_9_1 ];
    hoisted_4_1 := deduped_9_1;
    hoisted_3_1 := UnderlyingRing( deduped_7_1 );
    hoisted_2_1 := deduped_6_1;
    hoisted_1_1 := deduped_7_1;
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, Source( cat_1 ), Range, deduped_7_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_8_1[1] ], function ( o_2 )
                return CreateCapCategoryObjectWithAttributes( hoisted_1_1, RankOfObject, Sum( List( arg2_1, function ( logic_new_func_x_3 )
                            return RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][o_2] ) );
                        end ) ) );
            end ), LazyHList( [ 1 .. Length( deduped_6_1 ) ], function ( m_2 )
                local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2, deduped_6_2;
                deduped_6_2 := List( arg2_1, function ( logic_new_func_x_3 )
                        return RankOfObject( Source( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[2][m_2] ) ) );
                    end );
                hoisted_4_2 := List( arg2_1, function ( logic_new_func_x_3 )
                        return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[2][m_2] ) );
                    end );
                hoisted_3_2 := HomalgIdentityMatrix( Sum( deduped_6_2 ), hoisted_3_1 );
                hoisted_2_2 := deduped_6_2;
                hoisted_1_2 := 1 + hoisted_2_1[m_2][2];
                deduped_5_2 := UnionOfColumns( hoisted_3_1, Sum( List( arg2_1, function ( logic_new_func_x_3 )
                              return RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][hoisted_1_2] ) );
                          end ) ), List( hoisted_5_1, function ( logic_new_func_x_3 )
                            local deduped_1_3;
                            deduped_1_3 := hoisted_2_2[logic_new_func_x_3];
                            return hoisted_3_2 * UnionOfRows( HomalgZeroMatrix( Sum( hoisted_2_2{[ 1 .. (logic_new_func_x_3 - 1) ]} ), deduped_1_3, hoisted_3_1 ), HomalgIdentityMatrix( deduped_1_3, hoisted_3_1 ), HomalgZeroMatrix( Sum( hoisted_2_2{[ (logic_new_func_x_3 + 1) .. hoisted_4_1 ]} ), deduped_1_3, hoisted_3_1 ) ) * hoisted_4_2[logic_new_func_x_3];
                        end ) ) * HomalgIdentityMatrix( Sum( List( arg2_1, function ( logic_new_func_x_3 )
                              return RankOfObject( Range( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[2][m_2] ) ) );
                          end ) ), hoisted_3_1 );
                return CreateCapCategoryMorphismWithAttributes( hoisted_1_1, CreateCapCategoryObjectWithAttributes( hoisted_1_1, RankOfObject, NumberRows( deduped_5_2 ) ), CreateCapCategoryObjectWithAttributes( hoisted_1_1, RankOfObject, NumberColumns( deduped_5_2 ) ), UnderlyingMatrix, deduped_5_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddDirectProductFunctorialWithGivenDirectProducts( cat,
        
########
function ( cat_1, P_1, objects_1, L_1, objectsp_1, Pp_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1;
    deduped_8_1 := Range( cat_1 );
    deduped_7_1 := ValuesOfPreSheaf( P_1 )[1];
    hoisted_6_1 := deduped_8_1;
    hoisted_5_1 := [ 1 .. Length( L_1 ) ];
    hoisted_4_1 := Length( objects_1 );
    hoisted_3_1 := UnderlyingRing( deduped_8_1 );
    hoisted_2_1 := List( deduped_7_1, RankOfObject );
    hoisted_1_1 := deduped_7_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Pp_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, deduped_4_2, deduped_5_2;
              deduped_5_2 := List( objects_1, function ( logic_new_func_x_3 )
                      return RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][o_2] ) );
                  end );
              hoisted_3_2 := List( L_1, function ( logic_new_func_x_3 )
                      return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                  end );
              hoisted_2_2 := HomalgIdentityMatrix( Sum( deduped_5_2 ), hoisted_3_1 );
              hoisted_1_2 := deduped_5_2;
              deduped_4_2 := UnionOfColumns( hoisted_3_1, hoisted_2_1[o_2], List( hoisted_5_1, function ( logic_new_func_x_3 )
                          local deduped_1_3;
                          deduped_1_3 := hoisted_1_2[logic_new_func_x_3];
                          return hoisted_2_2 * UnionOfRows( HomalgZeroMatrix( Sum( hoisted_1_2{[ 1 .. (logic_new_func_x_3 - 1) ]} ), deduped_1_3, hoisted_3_1 ), HomalgIdentityMatrix( deduped_1_3, hoisted_3_1 ), HomalgZeroMatrix( Sum( hoisted_1_2{[ (logic_new_func_x_3 + 1) .. hoisted_4_1 ]} ), deduped_1_3, hoisted_3_1 ) ) * hoisted_3_2[logic_new_func_x_3];
                      end ) ) * HomalgIdentityMatrix( Sum( List( objectsp_1, function ( logic_new_func_x_3 )
                            return RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][o_2] ) );
                        end ) ), hoisted_3_1 );
              return CreateCapCategoryMorphismWithAttributes( hoisted_6_1, hoisted_1_1[o_2], CreateCapCategoryObjectWithAttributes( hoisted_6_1, RankOfObject, NumberColumns( deduped_4_2 ) ), UnderlyingMatrix, deduped_4_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddDirectSum( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, deduped_4_1;
    deduped_4_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_3_1 := Range( cat_1 );
    hoisted_2_1 := UnderlyingRing( deduped_3_1 );
    hoisted_1_1 := deduped_3_1;
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, Source( cat_1 ), Range, deduped_3_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_4_1[1] ], function ( o_2 )
                return CreateCapCategoryObjectWithAttributes( hoisted_1_1, RankOfObject, Sum( List( arg2_1, function ( logic_new_func_x_3 )
                            return RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][o_2] ) );
                        end ) ) );
            end ), LazyHList( [ 1 .. Length( deduped_4_1[2] ) ], function ( m_2 )
                local deduped_1_2;
                deduped_1_2 := DiagMat( hoisted_2_1, List( arg2_1, function ( logic_new_func_x_3 )
                          return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[2][m_2] ) );
                      end ) );
                return CreateCapCategoryMorphismWithAttributes( hoisted_1_1, CreateCapCategoryObjectWithAttributes( hoisted_1_1, RankOfObject, NumberRows( deduped_1_2 ) ), CreateCapCategoryObjectWithAttributes( hoisted_1_1, RankOfObject, NumberColumns( deduped_1_2 ) ), UnderlyingMatrix, deduped_1_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddDirectSumFunctorialWithGivenDirectSums( cat,
        
########
function ( cat_1, P_1, objects_1, L_1, objectsp_1, Pp_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1;
    deduped_5_1 := Range( cat_1 );
    hoisted_4_1 := deduped_5_1;
    hoisted_3_1 := UnderlyingRing( deduped_5_1 );
    hoisted_2_1 := ValuesOfPreSheaf( Pp_1 )[1];
    hoisted_1_1 := ValuesOfPreSheaf( P_1 )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Pp_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, DiagMat( hoisted_3_1, List( L_1, function ( logic_new_func_x_3 )
                          return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                      end ) ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddDistinguishedObjectOfHomomorphismStructure( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( Range( cat_1 ), RankOfObject, 1 );
end
########
        
    , 100 );
    
    ##
    AddFiberProduct( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1;
    deduped_11_1 := Length( arg2_1 );
    deduped_10_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_9_1 := Range( cat_1 );
    deduped_8_1 := deduped_10_1[2];
    hoisted_7_1 := deduped_8_1;
    hoisted_6_1 := deduped_9_1;
    hoisted_5_1 := [ 2 .. deduped_11_1 ];
    hoisted_4_1 := [ 1 .. deduped_11_1 - 1 ];
    hoisted_3_1 := [ 1 .. deduped_11_1 ];
    hoisted_2_1 := deduped_11_1;
    hoisted_1_1 := UnderlyingRing( deduped_9_1 );
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, Source( cat_1 ), Range, deduped_9_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_10_1[1] ], function ( o_2 )
                local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2, deduped_5_2;
                deduped_5_2 := List( arg2_1, function ( logic_new_func_x_3 )
                        return RankOfObject( Source( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) ) );
                    end );
                deduped_4_2 := Sum( deduped_5_2 );
                hoisted_2_2 := List( arg2_1, function ( logic_new_func_x_3 )
                        return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                    end );
                hoisted_1_2 := deduped_5_2;
                deduped_3_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                        local deduped_1_3;
                        deduped_1_3 := hoisted_1_2[logic_new_func_x_3];
                        return UnionOfRows( HomalgZeroMatrix( Sum( hoisted_1_2{[ 1 .. (logic_new_func_x_3 - 1) ]} ), deduped_1_3, hoisted_1_1 ), HomalgIdentityMatrix( deduped_1_3, hoisted_1_1 ), HomalgZeroMatrix( Sum( hoisted_1_2{[ (logic_new_func_x_3 + 1) .. hoisted_2_1 ]} ), deduped_1_3, hoisted_1_1 ) ) * hoisted_2_2[logic_new_func_x_3];
                    end );
                return CreateCapCategoryObjectWithAttributes( hoisted_6_1, RankOfObject, deduped_4_2 - RowRankOfMatrix( (UnionOfColumns( hoisted_1_1, deduped_4_2, deduped_3_2{hoisted_4_1} ) + (- UnionOfColumns( hoisted_1_1, deduped_4_2, deduped_3_2{hoisted_5_1} ))) ) );
            end ), LazyHList( [ 1 .. Length( deduped_8_1 ) ], function ( m_2 )
                local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, deduped_9_2, deduped_10_2, deduped_11_2, deduped_12_2, deduped_13_2, deduped_14_2, deduped_15_2, deduped_16_2, deduped_17_2, deduped_18_2, deduped_19_2;
                deduped_19_2 := hoisted_7_1[m_2];
                hoisted_6_2 := 1 + deduped_19_2[1];
                deduped_18_2 := List( arg2_1, function ( logic_new_func_x_3 )
                        return RankOfObject( Source( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[hoisted_6_2] ) ) );
                    end );
                hoisted_1_2 := 1 + deduped_19_2[2];
                deduped_17_2 := List( arg2_1, function ( logic_new_func_x_3 )
                        return RankOfObject( Source( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[hoisted_1_2] ) ) );
                    end );
                deduped_16_2 := Sum( deduped_18_2 );
                deduped_15_2 := Sum( deduped_17_2 );
                hoisted_8_2 := List( arg2_1, function ( logic_new_func_x_3 )
                        return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[hoisted_6_2] ) );
                    end );
                hoisted_7_2 := deduped_18_2;
                deduped_14_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                        local deduped_1_3;
                        deduped_1_3 := hoisted_7_2[logic_new_func_x_3];
                        return UnionOfRows( HomalgZeroMatrix( Sum( hoisted_7_2{[ 1 .. (logic_new_func_x_3 - 1) ]} ), deduped_1_3, hoisted_1_1 ), HomalgIdentityMatrix( deduped_1_3, hoisted_1_1 ), HomalgZeroMatrix( Sum( hoisted_7_2{[ (logic_new_func_x_3 + 1) .. hoisted_2_1 ]} ), deduped_1_3, hoisted_1_1 ) ) * hoisted_8_2[logic_new_func_x_3];
                    end );
                hoisted_3_2 := List( arg2_1, function ( logic_new_func_x_3 )
                        return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[hoisted_1_2] ) );
                    end );
                hoisted_2_2 := deduped_17_2;
                deduped_13_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                        local deduped_1_3;
                        deduped_1_3 := hoisted_2_2[logic_new_func_x_3];
                        return UnionOfRows( HomalgZeroMatrix( Sum( hoisted_2_2{[ 1 .. (logic_new_func_x_3 - 1) ]} ), deduped_1_3, hoisted_1_1 ), HomalgIdentityMatrix( deduped_1_3, hoisted_1_1 ), HomalgZeroMatrix( Sum( hoisted_2_2{[ (logic_new_func_x_3 + 1) .. hoisted_2_1 ]} ), deduped_1_3, hoisted_1_1 ) ) * hoisted_3_2[logic_new_func_x_3];
                    end );
                deduped_12_2 := UnionOfColumns( hoisted_1_1, deduped_16_2, deduped_14_2{hoisted_4_1} ) + (- UnionOfColumns( hoisted_1_1, deduped_16_2, deduped_14_2{hoisted_5_1} ));
                deduped_11_2 := UnionOfColumns( hoisted_1_1, deduped_15_2, deduped_13_2{hoisted_4_1} ) + (- UnionOfColumns( hoisted_1_1, deduped_15_2, deduped_13_2{hoisted_5_1} ));
                deduped_10_2 := deduped_15_2 - RowRankOfMatrix( deduped_11_2 );
                hoisted_5_2 := List( arg2_1, function ( logic_new_func_x_3 )
                        return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( Source( logic_new_func_x_3 ) )[2][m_2] ) );
                    end );
                hoisted_4_2 := HomalgIdentityMatrix( deduped_10_2, hoisted_1_1 ) * SyzygiesOfRows( deduped_11_2 );
                deduped_9_2 := RightDivide( UnionOfColumns( hoisted_1_1, deduped_10_2, List( hoisted_3_1, function ( logic_new_func_x_3 )
                              local deduped_1_3;
                              deduped_1_3 := (Sum( hoisted_2_2{[ 1 .. logic_new_func_x_3 - 1 ]} ) + 1);
                              return CertainColumns( hoisted_4_2, [ deduped_1_3 .. (deduped_1_3 - 1 + hoisted_2_2[logic_new_func_x_3]) ] ) * hoisted_5_2[logic_new_func_x_3];
                          end ) ), SyzygiesOfRows( deduped_12_2 ) ) * HomalgIdentityMatrix( (deduped_16_2 - RowRankOfMatrix( deduped_12_2 )), hoisted_1_1 );
                return CreateCapCategoryMorphismWithAttributes( hoisted_6_1, CreateCapCategoryObjectWithAttributes( hoisted_6_1, RankOfObject, NumberRows( deduped_9_2 ) ), CreateCapCategoryObjectWithAttributes( hoisted_6_1, RankOfObject, NumberColumns( deduped_9_2 ) ), UnderlyingMatrix, deduped_9_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddFiberProductFunctorialWithGivenFiberProducts( cat,
        
########
function ( cat_1, P_1, morphisms_1, L_1, morphismsp_1, Pp_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1;
    deduped_17_1 := Length( morphismsp_1 );
    deduped_16_1 := Length( morphisms_1 );
    deduped_15_1 := Range( cat_1 );
    deduped_14_1 := ValuesOfPreSheaf( P_1 )[1];
    hoisted_13_1 := deduped_15_1;
    hoisted_12_1 := [ 2 .. deduped_17_1 ];
    hoisted_11_1 := [ 1 .. deduped_17_1 - 1 ];
    hoisted_10_1 := [ 1 .. deduped_17_1 ];
    hoisted_9_1 := deduped_17_1;
    hoisted_8_1 := [ 1 .. Length( L_1 ) ];
    hoisted_7_1 := [ 2 .. deduped_16_1 ];
    hoisted_6_1 := [ 1 .. deduped_16_1 - 1 ];
    hoisted_5_1 := [ 1 .. deduped_16_1 ];
    hoisted_4_1 := deduped_16_1;
    hoisted_3_1 := UnderlyingRing( deduped_15_1 );
    hoisted_2_1 := List( deduped_14_1, RankOfObject );
    hoisted_1_1 := deduped_14_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Pp_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2, deduped_11_2, deduped_12_2, deduped_13_2, deduped_14_2, deduped_15_2;
              deduped_15_2 := List( morphisms_1, function ( logic_new_func_x_3 )
                      return RankOfObject( Source( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) ) );
                  end );
              deduped_14_2 := List( morphismsp_1, function ( logic_new_func_x_3 )
                      return RankOfObject( Source( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) ) );
                  end );
              deduped_13_2 := Sum( deduped_15_2 );
              deduped_12_2 := Sum( deduped_14_2 );
              hoisted_2_2 := List( morphisms_1, function ( logic_new_func_x_3 )
                      return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                  end );
              hoisted_1_2 := deduped_15_2;
              deduped_11_2 := List( hoisted_5_1, function ( logic_new_func_x_3 )
                      local deduped_1_3;
                      deduped_1_3 := hoisted_1_2[logic_new_func_x_3];
                      return UnionOfRows( HomalgZeroMatrix( Sum( hoisted_1_2{[ 1 .. (logic_new_func_x_3 - 1) ]} ), deduped_1_3, hoisted_3_1 ), HomalgIdentityMatrix( deduped_1_3, hoisted_3_1 ), HomalgZeroMatrix( Sum( hoisted_1_2{[ (logic_new_func_x_3 + 1) .. hoisted_4_1 ]} ), deduped_1_3, hoisted_3_1 ) ) * hoisted_2_2[logic_new_func_x_3];
                  end );
              hoisted_6_2 := List( morphismsp_1, function ( logic_new_func_x_3 )
                      return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                  end );
              hoisted_5_2 := deduped_14_2;
              deduped_10_2 := List( hoisted_10_1, function ( logic_new_func_x_3 )
                      local deduped_1_3;
                      deduped_1_3 := hoisted_5_2[logic_new_func_x_3];
                      return UnionOfRows( HomalgZeroMatrix( Sum( hoisted_5_2{[ 1 .. (logic_new_func_x_3 - 1) ]} ), deduped_1_3, hoisted_3_1 ), HomalgIdentityMatrix( deduped_1_3, hoisted_3_1 ), HomalgZeroMatrix( Sum( hoisted_5_2{[ (logic_new_func_x_3 + 1) .. hoisted_9_1 ]} ), deduped_1_3, hoisted_3_1 ) ) * hoisted_6_2[logic_new_func_x_3];
                  end );
              deduped_9_2 := UnionOfColumns( hoisted_3_1, deduped_13_2, deduped_11_2{hoisted_6_1} ) + (- UnionOfColumns( hoisted_3_1, deduped_13_2, deduped_11_2{hoisted_7_1} ));
              deduped_8_2 := UnionOfColumns( hoisted_3_1, deduped_12_2, deduped_10_2{hoisted_11_1} ) + (- UnionOfColumns( hoisted_3_1, deduped_12_2, deduped_10_2{hoisted_12_1} ));
              hoisted_4_2 := List( L_1, function ( logic_new_func_x_3 )
                      return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                  end );
              hoisted_3_2 := HomalgIdentityMatrix( (deduped_13_2 - RowRankOfMatrix( deduped_9_2 )), hoisted_3_1 ) * SyzygiesOfRows( deduped_9_2 );
              deduped_7_2 := RightDivide( UnionOfColumns( hoisted_3_1, hoisted_2_1[o_2], List( hoisted_8_1, function ( logic_new_func_x_3 )
                            local deduped_1_3;
                            deduped_1_3 := (Sum( hoisted_1_2{[ 1 .. logic_new_func_x_3 - 1 ]} ) + 1);
                            return CertainColumns( hoisted_3_2, [ deduped_1_3 .. (deduped_1_3 - 1 + hoisted_1_2[logic_new_func_x_3]) ] ) * hoisted_4_2[logic_new_func_x_3];
                        end ) ), SyzygiesOfRows( deduped_8_2 ) ) * HomalgIdentityMatrix( (deduped_12_2 - RowRankOfMatrix( deduped_8_2 )), hoisted_3_1 );
              return CreateCapCategoryMorphismWithAttributes( hoisted_13_1, hoisted_1_1[o_2], CreateCapCategoryObjectWithAttributes( hoisted_13_1, RankOfObject, NumberColumns( deduped_7_2 ) ), UnderlyingMatrix, deduped_7_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddHomomorphismStructureOnMorphismsWithGivenObjects( cat,
        
########
function ( cat_1, source_1, alpha_1, beta_1, range_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1;
    deduped_39_1 := SetOfObjects( cat_1 );
    deduped_38_1 := SetOfGeneratingMorphisms( cat_1 );
    deduped_37_1 := Range( cat_1 );
    deduped_36_1 := ValuesOfPreSheaf( Range( beta_1 ) );
    deduped_35_1 := ValuesOfPreSheaf( Source( alpha_1 ) );
    deduped_34_1 := ValuesOfPreSheaf( Source( beta_1 ) );
    deduped_33_1 := ValuesOfPreSheaf( Range( alpha_1 ) );
    deduped_32_1 := UnderlyingRing( deduped_37_1 );
    deduped_31_1 := [ 1 .. Length( deduped_39_1 ) ];
    deduped_30_1 := [ 1 .. Length( deduped_38_1 ) ];
    deduped_29_1 := deduped_36_1[2];
    deduped_28_1 := deduped_35_1[2];
    deduped_27_1 := deduped_34_1[2];
    deduped_26_1 := deduped_33_1[2];
    hoisted_17_1 := List( deduped_29_1, function ( logic_new_func_x_2 )
            return RankOfObject( Range( logic_new_func_x_2 ) );
        end );
    hoisted_16_1 := List( deduped_28_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    deduped_25_1 := List( deduped_30_1, function ( logic_new_func_x_2 )
            return hoisted_16_1[logic_new_func_x_2] * hoisted_17_1[logic_new_func_x_2];
        end );
    hoisted_2_1 := List( deduped_27_1, function ( logic_new_func_x_2 )
            return RankOfObject( Range( logic_new_func_x_2 ) );
        end );
    hoisted_1_1 := List( deduped_26_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    deduped_24_1 := List( deduped_30_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[logic_new_func_x_2] * hoisted_2_1[logic_new_func_x_2];
        end );
    hoisted_22_1 := deduped_25_1;
    hoisted_21_1 := List( deduped_29_1, UnderlyingMatrix );
    hoisted_20_1 := List( deduped_28_1, function ( logic_new_func_x_2 )
            return TransposedMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_19_1 := List( deduped_36_1[1], RankOfObject );
    hoisted_18_1 := List( deduped_35_1[1], RankOfObject );
    hoisted_15_1 := List( ValuesOnAllObjects( beta_1 ), UnderlyingMatrix );
    hoisted_14_1 := List( ValuesOnAllObjects( alpha_1 ), function ( logic_new_func_x_2 )
            return TransposedMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_13_1 := deduped_30_1;
    hoisted_12_1 := deduped_24_1;
    hoisted_11_1 := deduped_31_1;
    hoisted_10_1 := List( deduped_27_1, UnderlyingMatrix );
    hoisted_9_1 := deduped_32_1;
    hoisted_8_1 := List( deduped_26_1, function ( logic_new_func_x_2 )
            return TransposedMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_7_1 := List( deduped_38_1, Range );
    hoisted_6_1 := List( deduped_38_1, Source );
    hoisted_5_1 := deduped_39_1;
    hoisted_4_1 := List( deduped_34_1[1], RankOfObject );
    hoisted_3_1 := List( deduped_33_1[1], RankOfObject );
    deduped_23_1 := RightDivide( SyzygiesOfRows( UnionOfRows( deduped_32_1, Sum( deduped_24_1 ), List( deduped_31_1, function ( logic_new_func_x_2 )
                    local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
                    deduped_7_2 := hoisted_4_1[logic_new_func_x_2];
                    deduped_6_2 := hoisted_3_1[logic_new_func_x_2];
                    deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_11_1[logic_new_func_x_2] );
                    hoisted_4_2 := hoisted_3_1[deduped_5_2] * hoisted_4_1[deduped_5_2];
                    hoisted_3_2 := TransposedMatrix( HomalgIdentityMatrix( deduped_6_2, hoisted_9_1 ) );
                    hoisted_2_2 := HomalgIdentityMatrix( deduped_7_2, hoisted_9_1 );
                    hoisted_1_2 := hoisted_5_1[logic_new_func_x_2];
                    return UnionOfColumns( hoisted_9_1, deduped_6_2 * deduped_7_2, List( hoisted_13_1, function ( logic_new_func_x_3 )
                              local deduped_1_3, deduped_2_3, deduped_3_3, deduped_4_3;
                              deduped_4_3 := (hoisted_1_2 = hoisted_7_1[logic_new_func_x_3]);
                              deduped_3_3 := (hoisted_1_2 = hoisted_6_1[logic_new_func_x_3]);
                              deduped_2_3 := KroneckerMat( hoisted_8_1[logic_new_func_x_3], hoisted_2_2 );
                              deduped_1_3 := (- KroneckerMat( hoisted_3_2, hoisted_10_1[logic_new_func_x_3] ));
                              if (deduped_3_3 and deduped_4_3) then
                                  return (deduped_2_3 + deduped_1_3);
                              elif (not deduped_3_3 and deduped_4_3) then
                                  return deduped_1_3;
                              elif (deduped_3_3 and not deduped_4_3) then
                                  return deduped_2_3;
                              else
                                  return HomalgZeroMatrix( hoisted_4_2, hoisted_12_1[logic_new_func_x_3], hoisted_9_1 );
                              fi;
                              return;
                          end ) );
                end ) ) ) * DiagMat( deduped_32_1, List( deduped_31_1, function ( logic_new_func_x_2 )
                  return KroneckerMat( hoisted_14_1[logic_new_func_x_2], hoisted_15_1[logic_new_func_x_2] );
              end ) ), SyzygiesOfRows( UnionOfRows( deduped_32_1, Sum( deduped_25_1 ), List( deduped_31_1, function ( logic_new_func_x_2 )
                  local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
                  deduped_7_2 := hoisted_19_1[logic_new_func_x_2];
                  deduped_6_2 := hoisted_18_1[logic_new_func_x_2];
                  deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_11_1[logic_new_func_x_2] );
                  hoisted_4_2 := hoisted_18_1[deduped_5_2] * hoisted_19_1[deduped_5_2];
                  hoisted_3_2 := TransposedMatrix( HomalgIdentityMatrix( deduped_6_2, hoisted_9_1 ) );
                  hoisted_2_2 := HomalgIdentityMatrix( deduped_7_2, hoisted_9_1 );
                  hoisted_1_2 := hoisted_5_1[logic_new_func_x_2];
                  return UnionOfColumns( hoisted_9_1, deduped_6_2 * deduped_7_2, List( hoisted_13_1, function ( logic_new_func_x_3 )
                            local deduped_1_3, deduped_2_3, deduped_3_3, deduped_4_3;
                            deduped_4_3 := hoisted_1_2 = hoisted_7_1[logic_new_func_x_3];
                            deduped_3_3 := hoisted_1_2 = hoisted_6_1[logic_new_func_x_3];
                            deduped_2_3 := KroneckerMat( hoisted_20_1[logic_new_func_x_3], hoisted_2_2 );
                            deduped_1_3 := - KroneckerMat( hoisted_3_2, hoisted_21_1[logic_new_func_x_3] );
                            if deduped_3_3 and deduped_4_3 then
                                return deduped_2_3 + deduped_1_3;
                            elif not deduped_3_3 and deduped_4_3 then
                                return deduped_1_3;
                            elif deduped_3_3 and not deduped_4_3 then
                                return deduped_2_3;
                            else
                                return HomalgZeroMatrix( hoisted_4_2, hoisted_22_1[logic_new_func_x_3], hoisted_9_1 );
                            fi;
                            return;
                        end ) );
              end ) ) ) );
    return CreateCapCategoryMorphismWithAttributes( deduped_37_1, CreateCapCategoryObjectWithAttributes( deduped_37_1, RankOfObject, NumberRows( deduped_23_1 ) ), CreateCapCategoryObjectWithAttributes( deduped_37_1, RankOfObject, NumberColumns( deduped_23_1 ) ), UnderlyingMatrix, deduped_23_1 );
end
########
        
    , 100 );
    
    ##
    AddHomomorphismStructureOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1;
    deduped_24_1 := ValuesOfPreSheaf( arg3_1 );
    deduped_23_1 := ValuesOfPreSheaf( arg2_1 );
    deduped_22_1 := SetOfGeneratingMorphisms( cat_1 );
    deduped_21_1 := SetOfObjects( cat_1 );
    deduped_20_1 := Range( cat_1 );
    deduped_19_1 := deduped_24_1[2];
    deduped_18_1 := deduped_23_1[2];
    deduped_17_1 := UnderlyingRing( deduped_20_1 );
    deduped_16_1 := [ 1 .. Length( deduped_22_1 ) ];
    deduped_15_1 := [ 1 .. Length( deduped_21_1 ) ];
    hoisted_4_1 := List( deduped_19_1, function ( logic_new_func_x_2 )
            return RankOfObject( Range( logic_new_func_x_2 ) );
        end );
    hoisted_3_1 := List( deduped_18_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    deduped_14_1 := List( deduped_16_1, function ( logic_new_func_x_2 )
            return hoisted_3_1[logic_new_func_x_2] * hoisted_4_1[logic_new_func_x_2];
        end );
    hoisted_13_1 := deduped_16_1;
    hoisted_12_1 := deduped_14_1;
    hoisted_11_1 := deduped_15_1;
    hoisted_10_1 := List( deduped_19_1, UnderlyingMatrix );
    hoisted_9_1 := deduped_17_1;
    hoisted_8_1 := List( deduped_18_1, function ( logic_new_func_x_2 )
            return TransposedMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_7_1 := List( deduped_22_1, Range );
    hoisted_6_1 := List( deduped_22_1, Source );
    hoisted_5_1 := deduped_21_1;
    hoisted_2_1 := List( deduped_24_1[1], RankOfObject );
    hoisted_1_1 := List( deduped_23_1[1], RankOfObject );
    return CreateCapCategoryObjectWithAttributes( deduped_20_1, RankOfObject, Sum( List( deduped_15_1, function ( logic_new_func_x_2 )
                  return hoisted_1_1[logic_new_func_x_2] * hoisted_2_1[logic_new_func_x_2];
              end ) ) - RowRankOfMatrix( UnionOfRows( deduped_17_1, Sum( deduped_14_1 ), List( deduped_15_1, function ( logic_new_func_x_2 )
                    local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
                    deduped_7_2 := hoisted_2_1[logic_new_func_x_2];
                    deduped_6_2 := hoisted_1_1[logic_new_func_x_2];
                    deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_11_1[logic_new_func_x_2] );
                    hoisted_4_2 := hoisted_1_1[deduped_5_2] * hoisted_2_1[deduped_5_2];
                    hoisted_3_2 := TransposedMatrix( HomalgIdentityMatrix( deduped_6_2, hoisted_9_1 ) );
                    hoisted_2_2 := HomalgIdentityMatrix( deduped_7_2, hoisted_9_1 );
                    hoisted_1_2 := hoisted_5_1[logic_new_func_x_2];
                    return UnionOfColumns( hoisted_9_1, deduped_6_2 * deduped_7_2, List( hoisted_13_1, function ( logic_new_func_x_3 )
                              local deduped_1_3, deduped_2_3, deduped_3_3, deduped_4_3;
                              deduped_4_3 := (hoisted_1_2 = hoisted_7_1[logic_new_func_x_3]);
                              deduped_3_3 := (hoisted_1_2 = hoisted_6_1[logic_new_func_x_3]);
                              deduped_2_3 := KroneckerMat( hoisted_8_1[logic_new_func_x_3], hoisted_2_2 );
                              deduped_1_3 := (- KroneckerMat( hoisted_3_2, hoisted_10_1[logic_new_func_x_3] ));
                              if (deduped_3_3 and deduped_4_3) then
                                  return (deduped_2_3 + deduped_1_3);
                              elif (not deduped_3_3 and deduped_4_3) then
                                  return deduped_1_3;
                              elif (deduped_3_3 and not deduped_4_3) then
                                  return deduped_2_3;
                              else
                                  return HomalgZeroMatrix( hoisted_4_2, hoisted_12_1[logic_new_func_x_3], hoisted_9_1 );
                              fi;
                              return;
                          end ) );
                end ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddIdentityMorphism( cat,
        
########
function ( cat_1, a_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1;
    deduped_6_1 := Range( cat_1 );
    deduped_5_1 := ValuesOfPreSheaf( a_1 )[1];
    hoisted_4_1 := deduped_6_1;
    hoisted_3_1 := UnderlyingRing( deduped_6_1 );
    hoisted_2_1 := List( deduped_5_1, RankOfObject );
    hoisted_1_1 := deduped_5_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_1_1[o_2];
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, deduped_1_2, deduped_1_2, UnderlyingMatrix, HomalgIdentityMatrix( hoisted_2_1[o_2], hoisted_3_1 ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddImageEmbeddingWithGivenImageObject( cat,
        
########
function ( cat_1, alpha_1, I_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1;
    deduped_8_1 := Range( cat_1 );
    deduped_7_1 := ValuesOnAllObjects( alpha_1 );
    hoisted_6_1 := List( deduped_7_1, Range );
    hoisted_5_1 := deduped_8_1;
    hoisted_4_1 := List( deduped_7_1, function ( logic_new_func_x_2 )
            return SyzygiesOfRows( SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) ) );
        end );
    hoisted_3_1 := UnderlyingRing( deduped_8_1 );
    hoisted_2_1 := List( deduped_7_1, function ( logic_new_func_x_2 )
            return RowRankOfMatrix( SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) ) );
        end );
    hoisted_1_1 := List( deduped_7_1, function ( logic_new_func_x_2 )
            return RankOfObject( Range( logic_new_func_x_2 ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, I_1, Range( alpha_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local morphism_attr_1_2;
              morphism_attr_1_2 := HomalgIdentityMatrix( (hoisted_1_1[o_2] - hoisted_2_1[o_2]), hoisted_3_1 ) * hoisted_4_1[o_2];
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, CreateCapCategoryObjectWithAttributes( hoisted_5_1, RankOfObject, NumberRows( morphism_attr_1_2 ) ), hoisted_6_1[o_2], UnderlyingMatrix, morphism_attr_1_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddImageObject( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1;
    deduped_11_1 := ValuesOnAllObjects( arg2_1 );
    deduped_10_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_9_1 := Range( cat_1 );
    deduped_8_1 := deduped_10_1[2];
    hoisted_7_1 := List( ValuesOfPreSheaf( Range( arg2_1 ) )[2], UnderlyingMatrix );
    hoisted_6_1 := List( deduped_11_1, function ( logic_new_func_x_2 )
            return SyzygiesOfRows( SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) ) );
        end );
    hoisted_5_1 := UnderlyingRing( deduped_9_1 );
    hoisted_4_1 := deduped_8_1;
    hoisted_3_1 := deduped_9_1;
    hoisted_2_1 := List( deduped_11_1, function ( logic_new_func_x_2 )
            return RowRankOfMatrix( SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) ) );
        end );
    hoisted_1_1 := List( deduped_11_1, function ( logic_new_func_x_2 )
            return RankOfObject( Range( logic_new_func_x_2 ) );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, Source( cat_1 ), Range, deduped_9_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_10_1[1] ], function ( o_2 )
                return CreateCapCategoryObjectWithAttributes( hoisted_3_1, RankOfObject, hoisted_1_1[o_2] - hoisted_2_1[o_2] );
            end ), LazyHList( [ 1 .. Length( deduped_8_1 ) ], function ( m_2 )
                local morphism_attr_1_2, deduped_2_2, deduped_3_2, deduped_4_2;
                deduped_4_2 := hoisted_4_1[m_2];
                deduped_3_2 := 1 + deduped_4_2[1];
                deduped_2_2 := 1 + deduped_4_2[2];
                morphism_attr_1_2 := RightDivide( HomalgIdentityMatrix( (hoisted_1_1[deduped_2_2] - hoisted_2_1[deduped_2_2]), hoisted_5_1 ) * hoisted_6_1[deduped_2_2] * hoisted_7_1[m_2], HomalgIdentityMatrix( (hoisted_1_1[deduped_3_2] - hoisted_2_1[deduped_3_2]), hoisted_5_1 ) * hoisted_6_1[deduped_3_2] );
                return CreateCapCategoryMorphismWithAttributes( hoisted_3_1, CreateCapCategoryObjectWithAttributes( hoisted_3_1, RankOfObject, NumberRows( morphism_attr_1_2 ) ), CreateCapCategoryObjectWithAttributes( hoisted_3_1, RankOfObject, NumberColumns( morphism_attr_1_2 ) ), UnderlyingMatrix, morphism_attr_1_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInitialObject( cat,
        
########
function ( cat_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_4_1 := Range( cat_1 );
    hoisted_3_1 := HomalgIdentityMatrix( 0, UnderlyingRing( deduped_4_1 ) );
    hoisted_2_1 := deduped_4_1;
    hoisted_1_1 := CreateCapCategoryObjectWithAttributes( deduped_4_1, RankOfObject, 0 );
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, Source( cat_1 ), Range, deduped_4_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_5_1[1] ], function ( o_2 )
                return hoisted_1_1;
            end ), LazyHList( [ 1 .. Length( deduped_5_1[2] ) ], function ( m_2 )
                local morphism_attr_1_2;
                morphism_attr_1_2 := hoisted_3_1;
                return CreateCapCategoryMorphismWithAttributes( hoisted_2_1, hoisted_1_1, hoisted_1_1, UnderlyingMatrix, morphism_attr_1_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInjectionOfCofactorOfCoproductWithGivenCoproduct( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := Range( cat_1 );
    deduped_6_1 := objects_1[k_1];
    hoisted_5_1 := deduped_7_1;
    hoisted_4_1 := [ k_1 + 1 .. Length( objects_1 ) ];
    hoisted_3_1 := UnderlyingRing( deduped_7_1 );
    hoisted_2_1 := [ 1 .. k_1 - 1 ];
    hoisted_1_1 := ValuesOfPreSheaf( CAP_JIT_INCOMPLETE_LOGIC( deduped_6_1 ) )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_6_1, P_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := List( objects_1, function ( logic_new_func_x_3 )
                      return RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][o_2] ) );
                  end );
              deduped_2_2 := deduped_3_2[k_1];
              deduped_1_2 := UnionOfColumns( HomalgZeroMatrix( deduped_2_2, Sum( deduped_3_2{hoisted_2_1} ), hoisted_3_1 ), HomalgIdentityMatrix( deduped_2_2, hoisted_3_1 ), HomalgZeroMatrix( deduped_2_2, Sum( deduped_3_2{hoisted_4_1} ), hoisted_3_1 ) ) * HomalgIdentityMatrix( Sum( deduped_3_2 ), hoisted_3_1 );
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], CreateCapCategoryObjectWithAttributes( hoisted_5_1, RankOfObject, NumberColumns( deduped_1_2 ) ), UnderlyingMatrix, deduped_1_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddInjectionOfCofactorOfDirectSumWithGivenDirectSum( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1;
    deduped_8_1 := Range( cat_1 );
    deduped_7_1 := objects_1[k_1];
    hoisted_6_1 := deduped_8_1;
    hoisted_5_1 := [ k_1 + 1 .. Length( objects_1 ) ];
    hoisted_4_1 := UnderlyingRing( deduped_8_1 );
    hoisted_3_1 := [ 1 .. k_1 - 1 ];
    hoisted_2_1 := ValuesOfPreSheaf( P_1 )[1];
    hoisted_1_1 := ValuesOfPreSheaf( CAP_JIT_INCOMPLETE_LOGIC( deduped_7_1 ) )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_7_1, P_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local deduped_1_2, deduped_2_2;
              deduped_2_2 := List( objects_1, function ( logic_new_func_x_3 )
                      return RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][o_2] ) );
                  end );
              deduped_1_2 := deduped_2_2[k_1];
              return CreateCapCategoryMorphismWithAttributes( hoisted_6_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, UnionOfColumns( HomalgZeroMatrix( deduped_1_2, Sum( deduped_2_2{hoisted_3_1} ), hoisted_4_1 ), HomalgIdentityMatrix( deduped_1_2, hoisted_4_1 ), HomalgZeroMatrix( deduped_1_2, Sum( deduped_2_2{hoisted_5_1} ), hoisted_4_1 ) ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddInjectionOfCofactorOfPushoutWithGivenPushout( cat,
        
########
function ( cat_1, morphisms_1, k_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, deduped_9_1, deduped_10_1, deduped_11_1;
    deduped_11_1 := Length( morphisms_1 );
    deduped_10_1 := Range( cat_1 );
    deduped_9_1 := CAP_JIT_INCOMPLETE_LOGIC( morphisms_1[k_1] );
    hoisted_8_1 := deduped_10_1;
    hoisted_7_1 := [ 1 .. k_1 - 1 ];
    hoisted_6_1 := [ 2 .. deduped_11_1 ];
    hoisted_5_1 := [ 1 .. deduped_11_1 - 1 ];
    hoisted_4_1 := [ 1 .. deduped_11_1 ];
    hoisted_3_1 := deduped_11_1;
    hoisted_2_1 := UnderlyingRing( deduped_10_1 );
    hoisted_1_1 := ValuesOnAllObjects( deduped_9_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Range( deduped_9_1 ), P_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := List( morphisms_1, function ( logic_new_func_x_3 )
                      return RankOfObject( Range( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) ) );
                  end );
              deduped_7_2 := Sum( deduped_8_2 );
              hoisted_2_2 := deduped_8_2;
              hoisted_1_2 := List( morphisms_1, function ( logic_new_func_x_3 )
                      return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                  end );
              deduped_6_2 := List( hoisted_4_1, function ( logic_new_func_x_3 )
                      local deduped_1_3;
                      deduped_1_3 := hoisted_2_2[logic_new_func_x_3];
                      return hoisted_1_2[logic_new_func_x_3] * UnionOfColumns( HomalgZeroMatrix( deduped_1_3, Sum( hoisted_2_2{[ 1 .. (logic_new_func_x_3 - 1) ]} ), hoisted_2_1 ), HomalgIdentityMatrix( deduped_1_3, hoisted_2_1 ), HomalgZeroMatrix( deduped_1_3, Sum( hoisted_2_2{[ (logic_new_func_x_3 + 1) .. hoisted_3_1 ]} ), hoisted_2_1 ) );
                  end );
              deduped_5_2 := Sum( deduped_8_2{hoisted_7_1} ) + 1;
              deduped_4_2 := UnionOfRows( hoisted_2_1, deduped_7_2, deduped_6_2{hoisted_5_1} ) + (- UnionOfRows( hoisted_2_1, deduped_7_2, deduped_6_2{hoisted_6_1} ));
              deduped_3_2 := CertainRows( SyzygiesOfColumns( deduped_4_2 ) * HomalgIdentityMatrix( (deduped_7_2 - RowRankOfMatrix( deduped_4_2 )), hoisted_2_1 ), [ deduped_5_2 .. deduped_5_2 - 1 + deduped_8_2[k_1] ] );
              return CreateCapCategoryMorphismWithAttributes( hoisted_8_1, Range( CAP_JIT_INCOMPLETE_LOGIC( hoisted_1_1[o_2] ) ), CreateCapCategoryObjectWithAttributes( hoisted_8_1, RankOfObject, NumberColumns( deduped_3_2 ) ), UnderlyingMatrix, deduped_3_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( cat,
        
########
function ( cat_1, alpha_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1;
    deduped_25_1 := SetOfObjects( cat_1 );
    deduped_24_1 := SetOfGeneratingMorphisms( cat_1 );
    deduped_23_1 := Range( cat_1 );
    deduped_22_1 := ValuesOfPreSheaf( Range( alpha_1 ) );
    deduped_21_1 := ValuesOfPreSheaf( Source( alpha_1 ) );
    deduped_20_1 := UnderlyingRing( deduped_23_1 );
    deduped_19_1 := [ 1 .. Length( deduped_25_1 ) ];
    deduped_18_1 := [ 1 .. Length( deduped_24_1 ) ];
    deduped_17_1 := deduped_22_1[2];
    deduped_16_1 := deduped_21_1[2];
    hoisted_2_1 := List( deduped_17_1, function ( logic_new_func_x_2 )
            return RankOfObject( Range( logic_new_func_x_2 ) );
        end );
    hoisted_1_1 := List( deduped_16_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    deduped_15_1 := List( deduped_18_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[logic_new_func_x_2] * hoisted_2_1[logic_new_func_x_2];
        end );
    hoisted_13_1 := deduped_18_1;
    hoisted_12_1 := deduped_15_1;
    hoisted_11_1 := deduped_19_1;
    hoisted_10_1 := List( deduped_17_1, UnderlyingMatrix );
    hoisted_9_1 := deduped_20_1;
    hoisted_8_1 := List( deduped_16_1, function ( logic_new_func_x_2 )
            return TransposedMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_7_1 := List( deduped_24_1, Range );
    hoisted_6_1 := List( deduped_24_1, Source );
    hoisted_5_1 := deduped_25_1;
    hoisted_4_1 := List( deduped_22_1[1], RankOfObject );
    hoisted_3_1 := List( deduped_21_1[1], RankOfObject );
    deduped_14_1 := RightDivide( UnionOfColumns( deduped_20_1, 1, List( ListOfValues( ValuesOnAllObjects( alpha_1 ) ), function ( logic_new_func_x_2 )
                return ConvertMatrixToRow( UnderlyingMatrix( logic_new_func_x_2 ) );
            end ) ), SyzygiesOfRows( UnionOfRows( deduped_20_1, Sum( deduped_15_1 ), List( deduped_19_1, function ( logic_new_func_x_2 )
                  local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
                  deduped_7_2 := hoisted_4_1[logic_new_func_x_2];
                  deduped_6_2 := hoisted_3_1[logic_new_func_x_2];
                  deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_11_1[logic_new_func_x_2] );
                  hoisted_4_2 := hoisted_3_1[deduped_5_2] * hoisted_4_1[deduped_5_2];
                  hoisted_3_2 := TransposedMatrix( HomalgIdentityMatrix( deduped_6_2, hoisted_9_1 ) );
                  hoisted_2_2 := HomalgIdentityMatrix( deduped_7_2, hoisted_9_1 );
                  hoisted_1_2 := hoisted_5_1[logic_new_func_x_2];
                  return UnionOfColumns( hoisted_9_1, deduped_6_2 * deduped_7_2, List( hoisted_13_1, function ( logic_new_func_x_3 )
                            local deduped_1_3, deduped_2_3, deduped_3_3, deduped_4_3;
                            deduped_4_3 := hoisted_1_2 = hoisted_7_1[logic_new_func_x_3];
                            deduped_3_3 := hoisted_1_2 = hoisted_6_1[logic_new_func_x_3];
                            deduped_2_3 := KroneckerMat( hoisted_8_1[logic_new_func_x_3], hoisted_2_2 );
                            deduped_1_3 := - KroneckerMat( hoisted_3_2, hoisted_10_1[logic_new_func_x_3] );
                            if deduped_3_3 and deduped_4_3 then
                                return deduped_2_3 + deduped_1_3;
                            elif not deduped_3_3 and deduped_4_3 then
                                return deduped_1_3;
                            elif deduped_3_3 and not deduped_4_3 then
                                return deduped_2_3;
                            else
                                return HomalgZeroMatrix( hoisted_4_2, hoisted_12_1[logic_new_func_x_3], hoisted_9_1 );
                            fi;
                            return;
                        end ) );
              end ) ) ) );
    return CreateCapCategoryMorphismWithAttributes( deduped_23_1, CreateCapCategoryObjectWithAttributes( deduped_23_1, RankOfObject, 1 ), CreateCapCategoryObjectWithAttributes( deduped_23_1, RankOfObject, NumberColumns( deduped_14_1 ) ), UnderlyingMatrix, deduped_14_1 );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1;
    deduped_34_1 := Range( cat_1 );
    deduped_33_1 := SetOfGeneratingMorphisms( cat_1 );
    deduped_32_1 := ValuesOfPreSheaf( arg3_1 );
    deduped_31_1 := ValuesOfPreSheaf( arg2_1 );
    deduped_30_1 := SetOfObjects( cat_1 );
    deduped_29_1 := UnderlyingRing( deduped_34_1 );
    deduped_28_1 := deduped_32_1[2];
    deduped_27_1 := deduped_31_1[2];
    deduped_26_1 := deduped_32_1[1];
    deduped_25_1 := deduped_31_1[1];
    deduped_24_1 := Length( deduped_30_1 );
    deduped_23_1 := [ 1 .. Length( deduped_33_1 ) ];
    deduped_22_1 := [ 1 .. deduped_24_1 ];
    hoisted_4_1 := List( deduped_28_1, function ( logic_new_func_x_2 )
            return RankOfObject( Range( logic_new_func_x_2 ) );
        end );
    hoisted_3_1 := List( deduped_27_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    deduped_21_1 := List( deduped_23_1, function ( logic_new_func_x_2 )
            return hoisted_3_1[logic_new_func_x_2] * hoisted_4_1[logic_new_func_x_2];
        end );
    hoisted_20_1 := deduped_34_1;
    hoisted_15_1 := deduped_23_1;
    hoisted_14_1 := deduped_21_1;
    hoisted_13_1 := deduped_22_1;
    hoisted_12_1 := List( deduped_28_1, UnderlyingMatrix );
    hoisted_11_1 := deduped_29_1;
    hoisted_10_1 := List( deduped_27_1, function ( logic_new_func_x_2 )
            return TransposedMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_9_1 := List( deduped_33_1, Range );
    hoisted_8_1 := List( deduped_33_1, Source );
    hoisted_7_1 := deduped_30_1;
    hoisted_6_1 := List( deduped_26_1, RankOfObject );
    hoisted_5_1 := List( deduped_25_1, RankOfObject );
    hoisted_18_1 := UnderlyingMatrix( arg4_1 ) * SyzygiesOfRows( UnionOfRows( deduped_29_1, Sum( deduped_21_1 ), List( deduped_22_1, function ( logic_new_func_x_2 )
                  local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
                  deduped_7_2 := hoisted_6_1[logic_new_func_x_2];
                  deduped_6_2 := hoisted_5_1[logic_new_func_x_2];
                  deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_13_1[logic_new_func_x_2] );
                  hoisted_4_2 := (hoisted_5_1[deduped_5_2] * hoisted_6_1[deduped_5_2]);
                  hoisted_3_2 := TransposedMatrix( HomalgIdentityMatrix( deduped_6_2, hoisted_11_1 ) );
                  hoisted_2_2 := HomalgIdentityMatrix( deduped_7_2, hoisted_11_1 );
                  hoisted_1_2 := hoisted_7_1[logic_new_func_x_2];
                  return UnionOfColumns( hoisted_11_1, (deduped_6_2 * deduped_7_2), List( hoisted_15_1, function ( logic_new_func_x_3 )
                            local deduped_1_3, deduped_2_3, deduped_3_3, deduped_4_3;
                            deduped_4_3 := (hoisted_1_2 = hoisted_9_1[logic_new_func_x_3]);
                            deduped_3_3 := (hoisted_1_2 = hoisted_8_1[logic_new_func_x_3]);
                            deduped_2_3 := KroneckerMat( hoisted_10_1[logic_new_func_x_3], hoisted_2_2 );
                            deduped_1_3 := (- KroneckerMat( hoisted_3_2, hoisted_12_1[logic_new_func_x_3] ));
                            if (deduped_3_3 and deduped_4_3) then
                                return (deduped_2_3 + deduped_1_3);
                            elif (not deduped_3_3 and deduped_4_3) then
                                return deduped_1_3;
                            elif (deduped_3_3 and not deduped_4_3) then
                                return deduped_2_3;
                            else
                                return HomalgZeroMatrix( hoisted_4_2, hoisted_14_1[logic_new_func_x_3], hoisted_11_1 );
                            fi;
                            return;
                        end ) );
              end ) ) );
    hoisted_17_1 := deduped_24_1;
    hoisted_16_1 := List( deduped_22_1, function ( logic_new_func_x_2 )
            return hoisted_5_1[logic_new_func_x_2] * hoisted_6_1[logic_new_func_x_2];
        end );
    hoisted_19_1 := List( deduped_22_1, function ( logic_new_func_x_2 )
            local deduped_1_2, deduped_2_2;
            deduped_2_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_13_1[logic_new_func_x_2] );
            deduped_1_2 := hoisted_5_1[deduped_2_2] * hoisted_6_1[deduped_2_2];
            return hoisted_18_1 * UnionOfRows( HomalgZeroMatrix( Sum( hoisted_16_1{[ 1 .. (logic_new_func_x_2 - 1) ]} ), deduped_1_2, hoisted_11_1 ), HomalgIdentityMatrix( deduped_1_2, hoisted_11_1 ), HomalgZeroMatrix( Sum( hoisted_16_1{[ (logic_new_func_x_2 + 1) .. hoisted_17_1 ]} ), deduped_1_2, hoisted_11_1 ) );
        end );
    hoisted_2_1 := deduped_26_1;
    hoisted_1_1 := deduped_25_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, ValuesOnAllObjects, LazyHList( deduped_22_1, function ( i_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_20_1, hoisted_1_1[i_2], hoisted_2_1[i_2], UnderlyingMatrix, ConvertRowToMatrix( hoisted_19_1[i_2], hoisted_5_1[i_2], hoisted_6_1[i_2] ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddInverseForMorphisms( cat,
        
########
function ( cat_1, alpha_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1;
    deduped_8_1 := Range( cat_1 );
    deduped_7_1 := ValuesOnAllObjects( alpha_1 );
    hoisted_6_1 := deduped_8_1;
    hoisted_5_1 := List( deduped_7_1, UnderlyingMatrix );
    hoisted_4_1 := UnderlyingRing( deduped_8_1 );
    hoisted_3_1 := List( deduped_7_1, function ( logic_new_func_x_2 )
            return RankOfObject( Range( logic_new_func_x_2 ) );
        end );
    hoisted_2_1 := List( deduped_7_1, Source );
    hoisted_1_1 := List( deduped_7_1, Range );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Range( alpha_1 ), Source( alpha_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_6_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, RightDivide( HomalgIdentityMatrix( hoisted_3_1[o_2], hoisted_4_1 ), hoisted_5_1[o_2] ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddIsColiftableAlongEpimorphism( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return ForAll( SetOfObjects( cat_1 ), function ( object_2 )
            return IsZero( DecideZeroColumns( UnderlyingMatrix( arg3_1( object_2 ) ), UnderlyingMatrix( arg2_1( object_2 ) ) ) );
        end );
end
########
        
    , 100 );
    
    ##
    AddIsCongruentForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return ForAll( SetOfObjects( cat_1 ), function ( o_2 )
            return UnderlyingMatrix( arg2_1( o_2 ) ) = UnderlyingMatrix( arg3_1( o_2 ) );
        end );
end
########
        
    , 100 );
    
    ##
    AddIsEqualForCacheForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return IS_IDENTICAL_OBJ( arg2_1, arg3_1 );
end
########
        
    , 100 );
    
    ##
    AddIsEqualForCacheForObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return IS_IDENTICAL_OBJ( arg2_1, arg3_1 );
end
########
        
    , 100 );
    
    ##
    AddIsEqualForObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return ForAll( SetOfObjects( cat_1 ), function ( o_2 )
              return RankOfObject( arg2_1( o_2 ) ) = RankOfObject( arg3_1( o_2 ) );
          end ) and ForAll( SetOfGeneratingMorphisms( cat_1 ), function ( m_2 )
              return UnderlyingMatrix( arg2_1( m_2 ) ) = UnderlyingMatrix( arg3_1( m_2 ) );
          end );
end
########
        
    , 100 );
    
    ##
    AddIsLiftableAlongMonomorphism( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return ForAll( SetOfObjects( cat_1 ), function ( object_2 )
            return IsZero( DecideZeroRows( UnderlyingMatrix( arg3_1( object_2 ) ), UnderlyingMatrix( arg2_1( object_2 ) ) ) );
        end );
end
########
        
    , 100 );
    
    ##
    AddIsWellDefinedForMorphisms( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, hoisted_2_1;
    hoisted_2_1 := Range( arg2_1 );
    hoisted_1_1 := Source( arg2_1 );
    return ForAll( SetOfObjects( cat_1 ), function ( o_2 )
              local deduped_1_2, deduped_2_2;
              deduped_2_2 := arg2_1( o_2 );
              deduped_1_2 := UnderlyingMatrix( deduped_2_2 );
              if NumberRows( deduped_1_2 ) <> RankOfObject( Source( deduped_2_2 ) ) then
                  return false;
              elif NumberColumns( deduped_1_2 ) <> RankOfObject( Range( deduped_2_2 ) ) then
                  return false;
              else
                  return true;
              fi;
              return;
          end ) and ForAll( SetOfGeneratingMorphisms( cat_1 ), function ( m_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2;
              deduped_4_2 := hoisted_2_1( m_2 );
              deduped_3_2 := hoisted_1_1( m_2 );
              deduped_2_2 := arg2_1( Range( m_2 ) );
              deduped_1_2 := arg2_1( Source( m_2 ) );
              return (RankOfObject( Range( deduped_3_2 ) ) = RankOfObject( Source( deduped_1_2 ) ) and RankOfObject( Range( deduped_2_2 ) ) = RankOfObject( Source( deduped_4_2 ) ) and UnderlyingMatrix( deduped_3_2 ) * UnderlyingMatrix( deduped_1_2 ) = UnderlyingMatrix( deduped_2_2 ) * UnderlyingMatrix( deduped_4_2 ));
          end );
end
########
        
    , 100 );
    
    ##
    AddKernelEmbeddingWithGivenKernelObject( cat,
        
########
function ( cat_1, alpha_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1;
    deduped_4_1 := ValuesOnAllObjects( alpha_1 );
    hoisted_3_1 := List( deduped_4_1, Source );
    hoisted_2_1 := Range( cat_1 );
    hoisted_1_1 := List( deduped_4_1, function ( logic_new_func_x_2 )
            return SyzygiesOfRows( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Source( alpha_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local morphism_attr_1_2;
              morphism_attr_1_2 := hoisted_1_1[o_2];
              return CreateCapCategoryMorphismWithAttributes( hoisted_2_1, CreateCapCategoryObjectWithAttributes( hoisted_2_1, RankOfObject, NumberRows( morphism_attr_1_2 ) ), hoisted_3_1[o_2], UnderlyingMatrix, morphism_attr_1_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddKernelLiftWithGivenKernelObject( cat,
        
########
function ( cat_1, alpha_1, T_1, tau_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1;
    deduped_5_1 := ValuesOnAllObjects( tau_1 );
    hoisted_4_1 := Range( cat_1 );
    hoisted_3_1 := List( ValuesOnAllObjects( alpha_1 ), function ( logic_new_func_x_2 )
            return SyzygiesOfRows( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_2_1 := List( deduped_5_1, UnderlyingMatrix );
    hoisted_1_1 := List( deduped_5_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local morphism_attr_1_2;
              morphism_attr_1_2 := RightDivide( hoisted_2_1[o_2], hoisted_3_1[o_2] );
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, hoisted_1_1[o_2], CreateCapCategoryObjectWithAttributes( hoisted_4_1, RankOfObject, NumberColumns( morphism_attr_1_2 ) ), UnderlyingMatrix, morphism_attr_1_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddKernelObject( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1;
    deduped_10_1 := ValuesOnAllObjects( arg2_1 );
    deduped_9_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_8_1 := Range( cat_1 );
    deduped_7_1 := deduped_9_1[2];
    hoisted_6_1 := List( ValuesOfPreSheaf( Source( arg2_1 ) )[2], UnderlyingMatrix );
    hoisted_5_1 := List( deduped_10_1, function ( logic_new_func_x_2 )
            return SyzygiesOfRows( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_4_1 := deduped_7_1;
    hoisted_3_1 := deduped_8_1;
    hoisted_2_1 := List( deduped_10_1, function ( logic_new_func_x_2 )
            return RowRankOfMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_1_1 := List( deduped_10_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, Source( cat_1 ), Range, deduped_8_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_9_1[1] ], function ( o_2 )
                return CreateCapCategoryObjectWithAttributes( hoisted_3_1, RankOfObject, hoisted_1_1[o_2] - hoisted_2_1[o_2] );
            end ), LazyHList( [ 1 .. Length( deduped_7_1 ) ], function ( m_2 )
                local morphism_attr_1_2, deduped_2_2;
                deduped_2_2 := hoisted_4_1[m_2];
                morphism_attr_1_2 := RightDivide( hoisted_5_1[(1 + deduped_2_2[2])] * hoisted_6_1[m_2], hoisted_5_1[1 + deduped_2_2[1]] );
                return CreateCapCategoryMorphismWithAttributes( hoisted_3_1, CreateCapCategoryObjectWithAttributes( hoisted_3_1, RankOfObject, NumberRows( morphism_attr_1_2 ) ), CreateCapCategoryObjectWithAttributes( hoisted_3_1, RankOfObject, NumberColumns( morphism_attr_1_2 ) ), UnderlyingMatrix, morphism_attr_1_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddKernelObjectFunctorialWithGivenKernelObjects( cat,
        
########
function ( cat_1, P_1, alpha_1, mu_1, alphap_1, Pp_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1;
    hoisted_4_1 := Range( cat_1 );
    hoisted_3_1 := List( ValuesOnAllObjects( alphap_1 ), function ( logic_new_func_x_2 )
            return SyzygiesOfRows( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_2_1 := List( ValuesOnAllObjects( mu_1 ), UnderlyingMatrix );
    hoisted_1_1 := List( ValuesOnAllObjects( alpha_1 ), function ( logic_new_func_x_2 )
            return SyzygiesOfRows( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Pp_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local morphism_attr_1_2;
              morphism_attr_1_2 := RightDivide( hoisted_1_1[o_2] * hoisted_2_1[o_2], hoisted_3_1[o_2] );
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, CreateCapCategoryObjectWithAttributes( hoisted_4_1, RankOfObject, NumberRows( morphism_attr_1_2 ) ), CreateCapCategoryObjectWithAttributes( hoisted_4_1, RankOfObject, NumberColumns( morphism_attr_1_2 ) ), UnderlyingMatrix, morphism_attr_1_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddLeftDistributivityExpandingWithGivenObjects( cat,
        
########
function ( cat_1, s_1, a_1, L_1, r_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, deduped_8_1, deduped_9_1, deduped_10_1;
    deduped_10_1 := Length( L_1 );
    deduped_9_1 := Range( cat_1 );
    deduped_8_1 := ValuesOfPreSheaf( s_1 )[1];
    hoisted_7_1 := deduped_9_1;
    hoisted_6_1 := [ 1 .. deduped_10_1 ];
    hoisted_5_1 := deduped_10_1;
    hoisted_4_1 := UnderlyingRing( deduped_9_1 );
    hoisted_3_1 := List( ValuesOfPreSheaf( a_1 )[1], RankOfObject );
    hoisted_2_1 := List( deduped_8_1, RankOfObject );
    hoisted_1_1 := deduped_8_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              hoisted_2_2 := HomalgIdentityMatrix( hoisted_3_1[o_2], hoisted_4_1 );
              hoisted_1_2 := List( L_1, function ( logic_new_func_x_3 )
                      return RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][o_2] ) );
                  end );
              deduped_3_2 := UnionOfColumns( hoisted_4_1, hoisted_2_1[o_2], List( hoisted_6_1, function ( logic_new_func_x_3 )
                        local deduped_1_3;
                        deduped_1_3 := hoisted_1_2[logic_new_func_x_3];
                        return KroneckerMat( hoisted_2_2, UnionOfRows( HomalgZeroMatrix( Sum( hoisted_1_2{[ 1 .. logic_new_func_x_3 - 1 ]} ), deduped_1_3, hoisted_4_1 ), HomalgIdentityMatrix( deduped_1_3, hoisted_4_1 ), HomalgZeroMatrix( Sum( hoisted_1_2{[ logic_new_func_x_3 + 1 .. hoisted_5_1 ]} ), deduped_1_3, hoisted_4_1 ) ) );
                    end ) );
              return CreateCapCategoryMorphismWithAttributes( hoisted_7_1, hoisted_1_1[o_2], CreateCapCategoryObjectWithAttributes( hoisted_7_1, RankOfObject, NumberColumns( deduped_3_2 ) ), UnderlyingMatrix, deduped_3_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddLeftDistributivityFactoringWithGivenObjects( cat,
        
########
function ( cat_1, s_1, a_1, L_1, r_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, deduped_8_1, deduped_9_1, deduped_10_1;
    deduped_10_1 := Length( L_1 );
    deduped_9_1 := Range( cat_1 );
    deduped_8_1 := ValuesOfPreSheaf( r_1 )[1];
    hoisted_7_1 := deduped_8_1;
    hoisted_6_1 := deduped_9_1;
    hoisted_5_1 := [ 1 .. deduped_10_1 ];
    hoisted_4_1 := deduped_10_1;
    hoisted_3_1 := UnderlyingRing( deduped_9_1 );
    hoisted_2_1 := List( ValuesOfPreSheaf( a_1 )[1], RankOfObject );
    hoisted_1_1 := List( deduped_8_1, RankOfObject );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              hoisted_2_2 := HomalgIdentityMatrix( hoisted_2_1[o_2], hoisted_3_1 );
              hoisted_1_2 := List( L_1, function ( logic_new_func_x_3 )
                      return RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][o_2] ) );
                  end );
              deduped_3_2 := UnionOfRows( hoisted_3_1, hoisted_1_1[o_2], List( hoisted_5_1, function ( logic_new_func_x_3 )
                        local deduped_1_3;
                        deduped_1_3 := hoisted_1_2[logic_new_func_x_3];
                        return KroneckerMat( hoisted_2_2, UnionOfColumns( HomalgZeroMatrix( deduped_1_3, Sum( hoisted_1_2{[ 1 .. logic_new_func_x_3 - 1 ]} ), hoisted_3_1 ), HomalgIdentityMatrix( deduped_1_3, hoisted_3_1 ), HomalgZeroMatrix( deduped_1_3, Sum( hoisted_1_2{[ logic_new_func_x_3 + 1 .. hoisted_4_1 ]} ), hoisted_3_1 ) ) );
                    end ) );
              return CreateCapCategoryMorphismWithAttributes( hoisted_6_1, CreateCapCategoryObjectWithAttributes( hoisted_6_1, RankOfObject, NumberRows( deduped_3_2 ) ), hoisted_7_1[o_2], UnderlyingMatrix, deduped_3_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddLeftUnitorInverseWithGivenTensorProduct( cat,
        
########
function ( cat_1, a_1, r_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1;
    deduped_6_1 := Range( cat_1 );
    deduped_5_1 := ValuesOfPreSheaf( a_1 )[1];
    hoisted_4_1 := deduped_6_1;
    hoisted_3_1 := UnderlyingRing( deduped_6_1 );
    hoisted_2_1 := List( deduped_5_1, RankOfObject );
    hoisted_1_1 := deduped_5_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, r_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_1_1[o_2];
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, deduped_1_2, deduped_1_2, UnderlyingMatrix, HomalgIdentityMatrix( hoisted_2_1[o_2], hoisted_3_1 ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddLeftUnitorWithGivenTensorProduct( cat,
        
########
function ( cat_1, a_1, s_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1;
    deduped_6_1 := Range( cat_1 );
    deduped_5_1 := ValuesOfPreSheaf( a_1 )[1];
    hoisted_4_1 := deduped_6_1;
    hoisted_3_1 := UnderlyingRing( deduped_6_1 );
    hoisted_2_1 := List( deduped_5_1, RankOfObject );
    hoisted_1_1 := deduped_5_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, a_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_1_1[o_2];
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, deduped_1_2, deduped_1_2, UnderlyingMatrix, HomalgIdentityMatrix( hoisted_2_1[o_2], hoisted_3_1 ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddLiftAlongMonomorphism( cat,
        
########
function ( cat_1, iota_1, tau_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := ValuesOnAllObjects( iota_1 );
    deduped_6_1 := ValuesOnAllObjects( tau_1 );
    hoisted_5_1 := Range( cat_1 );
    hoisted_4_1 := List( deduped_7_1, UnderlyingMatrix );
    hoisted_3_1 := List( deduped_6_1, UnderlyingMatrix );
    hoisted_2_1 := List( deduped_7_1, Source );
    hoisted_1_1 := List( deduped_6_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( tau_1 ), Source( iota_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, RightDivide( hoisted_3_1[o_2], hoisted_4_1[o_2] ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismBetweenDirectSumsWithGivenDirectSums( cat,
        
########
function ( cat_1, S_1, source_diagram_1, mat_1, range_diagram_1, T_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1;
    deduped_5_1 := Range( cat_1 );
    hoisted_4_1 := deduped_5_1;
    hoisted_3_1 := UnderlyingRing( deduped_5_1 );
    hoisted_2_1 := ValuesOfPreSheaf( T_1 )[1];
    hoisted_1_1 := ValuesOfPreSheaf( S_1 )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, S_1, T_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_2_1[o_2];
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, hoisted_1_1[o_2], deduped_1_2, UnderlyingMatrix, UnionOfRows( hoisted_3_1, RankOfObject( deduped_1_2 ), ListN( List( source_diagram_1, function ( Si_3 )
                            return ValuesOfPreSheaf( Si_3 )[1][o_2];
                        end ), List( mat_1, function ( row_3 )
                            return List( row_3, function ( m_4 )
                                    return ValuesOnAllObjects( m_4 )[o_2];
                                end );
                        end ), function ( logic_new_func_x_3, logic_new_func_y_3 )
                          return UnionOfColumns( hoisted_3_1, RankOfObject( logic_new_func_x_3 ), List( logic_new_func_y_3, UnderlyingMatrix ) );
                      end ) ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismConstructor( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg4_1, ValuesOnAllObjects, arg3_1 );
end
########
        
    , 100 );
    
    ##
    AddMorphismDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return ValuesOnAllObjects( arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddMorphismFromSourceToPushoutWithGivenPushout( cat,
        
########
function ( cat_1, morphisms_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, deduped_9_1, deduped_10_1, deduped_11_1;
    deduped_11_1 := Length( morphisms_1 );
    deduped_10_1 := Range( cat_1 );
    deduped_9_1 := CAP_JIT_INCOMPLETE_LOGIC( morphisms_1[1] );
    hoisted_8_1 := deduped_10_1;
    hoisted_7_1 := [ 1 .. 1 - 1 ];
    hoisted_6_1 := [ 2 .. deduped_11_1 ];
    hoisted_5_1 := [ 1 .. deduped_11_1 - 1 ];
    hoisted_4_1 := [ 1 .. deduped_11_1 ];
    hoisted_3_1 := deduped_11_1;
    hoisted_2_1 := UnderlyingRing( deduped_10_1 );
    hoisted_1_1 := ValuesOnAllObjects( deduped_9_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( deduped_9_1 ), P_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2, deduped_9_2;
              deduped_9_2 := List( morphisms_1, function ( logic_new_func_x_3 )
                      return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                  end );
              deduped_8_2 := List( morphisms_1, function ( logic_new_func_x_3 )
                      return RankOfObject( Range( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) ) );
                  end );
              deduped_7_2 := Sum( deduped_8_2 );
              hoisted_2_2 := deduped_8_2;
              hoisted_1_2 := deduped_9_2;
              deduped_6_2 := List( hoisted_4_1, function ( logic_new_func_x_3 )
                      local deduped_1_3;
                      deduped_1_3 := hoisted_2_2[logic_new_func_x_3];
                      return hoisted_1_2[logic_new_func_x_3] * UnionOfColumns( HomalgZeroMatrix( deduped_1_3, Sum( hoisted_2_2{[ 1 .. (logic_new_func_x_3 - 1) ]} ), hoisted_2_1 ), HomalgIdentityMatrix( deduped_1_3, hoisted_2_1 ), HomalgZeroMatrix( deduped_1_3, Sum( hoisted_2_2{[ (logic_new_func_x_3 + 1) .. hoisted_3_1 ]} ), hoisted_2_1 ) );
                  end );
              deduped_5_2 := Sum( deduped_8_2{hoisted_7_1} ) + 1;
              deduped_4_2 := UnionOfRows( hoisted_2_1, deduped_7_2, deduped_6_2{hoisted_5_1} ) + (- UnionOfRows( hoisted_2_1, deduped_7_2, deduped_6_2{hoisted_6_1} ));
              deduped_3_2 := deduped_9_2[1] * CertainRows( (SyzygiesOfColumns( deduped_4_2 ) * HomalgIdentityMatrix( (deduped_7_2 - RowRankOfMatrix( deduped_4_2 )), hoisted_2_1 )), [ deduped_5_2 .. (deduped_5_2 - 1 + deduped_8_2[1]) ] );
              return CreateCapCategoryMorphismWithAttributes( hoisted_8_1, Source( CAP_JIT_INCOMPLETE_LOGIC( hoisted_1_1[o_2] ) ), CreateCapCategoryObjectWithAttributes( hoisted_8_1, RankOfObject, NumberColumns( deduped_3_2 ) ), UnderlyingMatrix, deduped_3_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddMultiplyWithElementOfCommutativeRingForMorphisms( cat,
        
########
function ( cat_1, r_1, a_1 )
    local hoisted_1_1, hoisted_2_1;
    hoisted_2_1 := Range( cat_1 );
    hoisted_1_1 := ValuesOnAllObjects( a_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( a_1 ), Range( a_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_1_1[o_2];
              return CreateCapCategoryMorphismWithAttributes( hoisted_2_1, Source( deduped_1_2 ), Range( deduped_1_2 ), UnderlyingMatrix, r_1 * UnderlyingMatrix( deduped_1_2 ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddObjectConstructor( cat,
        
########
function ( cat_1, arg2_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, Source( cat_1 ), Range, Range( cat_1 ), ValuesOfPreSheaf, arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddObjectDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return ValuesOfPreSheaf( arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddPostCompose( cat,
        
########
function ( cat_1, beta_1, alpha_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := ValuesOnAllObjects( beta_1 );
    deduped_6_1 := ValuesOnAllObjects( alpha_1 );
    hoisted_5_1 := Range( cat_1 );
    hoisted_4_1 := List( deduped_7_1, UnderlyingMatrix );
    hoisted_3_1 := List( deduped_6_1, UnderlyingMatrix );
    hoisted_2_1 := List( deduped_7_1, Range );
    hoisted_1_1 := List( deduped_6_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), Range( beta_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, hoisted_3_1[o_2] * hoisted_4_1[o_2] );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddPreCompose( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := ValuesOnAllObjects( beta_1 );
    deduped_6_1 := ValuesOnAllObjects( alpha_1 );
    hoisted_5_1 := Range( cat_1 );
    hoisted_4_1 := List( deduped_7_1, UnderlyingMatrix );
    hoisted_3_1 := List( deduped_6_1, UnderlyingMatrix );
    hoisted_2_1 := List( deduped_7_1, Range );
    hoisted_1_1 := List( deduped_6_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), Range( beta_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, hoisted_3_1[o_2] * hoisted_4_1[o_2] );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddProjectionInFactorOfDirectProductWithGivenDirectProduct( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := Range( cat_1 );
    deduped_6_1 := objects_1[k_1];
    hoisted_5_1 := ValuesOfPreSheaf( CAP_JIT_INCOMPLETE_LOGIC( deduped_6_1 ) )[1];
    hoisted_4_1 := deduped_7_1;
    hoisted_3_1 := [ k_1 + 1 .. Length( objects_1 ) ];
    hoisted_2_1 := [ 1 .. k_1 - 1 ];
    hoisted_1_1 := UnderlyingRing( deduped_7_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, deduped_6_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := List( objects_1, function ( logic_new_func_x_3 )
                      return RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][o_2] ) );
                  end );
              deduped_2_2 := deduped_3_2[k_1];
              deduped_1_2 := HomalgIdentityMatrix( Sum( deduped_3_2 ), hoisted_1_1 ) * UnionOfRows( HomalgZeroMatrix( Sum( deduped_3_2{hoisted_2_1} ), deduped_2_2, hoisted_1_1 ), HomalgIdentityMatrix( deduped_2_2, hoisted_1_1 ), HomalgZeroMatrix( Sum( deduped_3_2{hoisted_3_1} ), deduped_2_2, hoisted_1_1 ) );
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, CreateCapCategoryObjectWithAttributes( hoisted_4_1, RankOfObject, NumberRows( deduped_1_2 ) ), hoisted_5_1[o_2], UnderlyingMatrix, deduped_1_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddProjectionInFactorOfDirectSumWithGivenDirectSum( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1;
    deduped_8_1 := Range( cat_1 );
    deduped_7_1 := objects_1[k_1];
    hoisted_6_1 := deduped_8_1;
    hoisted_5_1 := [ k_1 + 1 .. Length( objects_1 ) ];
    hoisted_4_1 := UnderlyingRing( deduped_8_1 );
    hoisted_3_1 := [ 1 .. k_1 - 1 ];
    hoisted_2_1 := ValuesOfPreSheaf( CAP_JIT_INCOMPLETE_LOGIC( deduped_7_1 ) )[1];
    hoisted_1_1 := ValuesOfPreSheaf( P_1 )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, deduped_7_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local deduped_1_2, deduped_2_2;
              deduped_2_2 := List( objects_1, function ( logic_new_func_x_3 )
                      return RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][o_2] ) );
                  end );
              deduped_1_2 := deduped_2_2[k_1];
              return CreateCapCategoryMorphismWithAttributes( hoisted_6_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, UnionOfRows( HomalgZeroMatrix( Sum( deduped_2_2{hoisted_3_1} ), deduped_1_2, hoisted_4_1 ), HomalgIdentityMatrix( deduped_1_2, hoisted_4_1 ), HomalgZeroMatrix( Sum( deduped_2_2{hoisted_5_1} ), deduped_1_2, hoisted_4_1 ) ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddProjectionInFactorOfFiberProductWithGivenFiberProduct( cat,
        
########
function ( cat_1, morphisms_1, k_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, deduped_9_1, deduped_10_1, deduped_11_1;
    deduped_11_1 := Length( morphisms_1 );
    deduped_10_1 := Range( cat_1 );
    deduped_9_1 := CAP_JIT_INCOMPLETE_LOGIC( morphisms_1[k_1] );
    hoisted_8_1 := ValuesOnAllObjects( deduped_9_1 );
    hoisted_7_1 := deduped_10_1;
    hoisted_6_1 := [ 1 .. k_1 - 1 ];
    hoisted_5_1 := [ 2 .. deduped_11_1 ];
    hoisted_4_1 := [ 1 .. deduped_11_1 - 1 ];
    hoisted_3_1 := [ 1 .. deduped_11_1 ];
    hoisted_2_1 := deduped_11_1;
    hoisted_1_1 := UnderlyingRing( deduped_10_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Source( deduped_9_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := List( morphisms_1, function ( logic_new_func_x_3 )
                      return RankOfObject( Source( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) ) );
                  end );
              deduped_7_2 := Sum( deduped_8_2 );
              hoisted_2_2 := List( morphisms_1, function ( logic_new_func_x_3 )
                      return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                  end );
              hoisted_1_2 := deduped_8_2;
              deduped_6_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                      local deduped_1_3;
                      deduped_1_3 := hoisted_1_2[logic_new_func_x_3];
                      return UnionOfRows( HomalgZeroMatrix( Sum( hoisted_1_2{[ 1 .. (logic_new_func_x_3 - 1) ]} ), deduped_1_3, hoisted_1_1 ), HomalgIdentityMatrix( deduped_1_3, hoisted_1_1 ), HomalgZeroMatrix( Sum( hoisted_1_2{[ (logic_new_func_x_3 + 1) .. hoisted_2_1 ]} ), deduped_1_3, hoisted_1_1 ) ) * hoisted_2_2[logic_new_func_x_3];
                  end );
              deduped_5_2 := Sum( deduped_8_2{hoisted_6_1} ) + 1;
              deduped_4_2 := UnionOfColumns( hoisted_1_1, deduped_7_2, deduped_6_2{hoisted_4_1} ) + (- UnionOfColumns( hoisted_1_1, deduped_7_2, deduped_6_2{hoisted_5_1} ));
              deduped_3_2 := CertainColumns( HomalgIdentityMatrix( (deduped_7_2 - RowRankOfMatrix( deduped_4_2 )), hoisted_1_1 ) * SyzygiesOfRows( deduped_4_2 ), [ deduped_5_2 .. deduped_5_2 - 1 + deduped_8_2[k_1] ] );
              return CreateCapCategoryMorphismWithAttributes( hoisted_7_1, CreateCapCategoryObjectWithAttributes( hoisted_7_1, RankOfObject, NumberRows( deduped_3_2 ) ), Source( CAP_JIT_INCOMPLETE_LOGIC( hoisted_8_1[o_2] ) ), UnderlyingMatrix, deduped_3_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddPushout( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1;
    deduped_11_1 := Length( arg2_1 );
    deduped_10_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_9_1 := Range( cat_1 );
    deduped_8_1 := deduped_10_1[2];
    hoisted_7_1 := deduped_8_1;
    hoisted_6_1 := deduped_9_1;
    hoisted_5_1 := [ 2 .. deduped_11_1 ];
    hoisted_4_1 := [ 1 .. deduped_11_1 - 1 ];
    hoisted_3_1 := [ 1 .. deduped_11_1 ];
    hoisted_2_1 := deduped_11_1;
    hoisted_1_1 := UnderlyingRing( deduped_9_1 );
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, Source( cat_1 ), Range, deduped_9_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_10_1[1] ], function ( o_2 )
                local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2, deduped_5_2;
                deduped_5_2 := List( arg2_1, function ( logic_new_func_x_3 )
                        return RankOfObject( Range( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) ) );
                    end );
                deduped_4_2 := Sum( deduped_5_2 );
                hoisted_2_2 := deduped_5_2;
                hoisted_1_2 := List( arg2_1, function ( logic_new_func_x_3 )
                        return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                    end );
                deduped_3_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                        local deduped_1_3;
                        deduped_1_3 := hoisted_2_2[logic_new_func_x_3];
                        return hoisted_1_2[logic_new_func_x_3] * UnionOfColumns( HomalgZeroMatrix( deduped_1_3, Sum( hoisted_2_2{[ 1 .. (logic_new_func_x_3 - 1) ]} ), hoisted_1_1 ), HomalgIdentityMatrix( deduped_1_3, hoisted_1_1 ), HomalgZeroMatrix( deduped_1_3, Sum( hoisted_2_2{[ (logic_new_func_x_3 + 1) .. hoisted_2_1 ]} ), hoisted_1_1 ) );
                    end );
                return CreateCapCategoryObjectWithAttributes( hoisted_6_1, RankOfObject, deduped_4_2 - RowRankOfMatrix( (UnionOfRows( hoisted_1_1, deduped_4_2, deduped_3_2{hoisted_4_1} ) + (- UnionOfRows( hoisted_1_1, deduped_4_2, deduped_3_2{hoisted_5_1} ))) ) );
            end ), LazyHList( [ 1 .. Length( deduped_8_1 ) ], function ( m_2 )
                local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, deduped_9_2, deduped_10_2, deduped_11_2, deduped_12_2, deduped_13_2, deduped_14_2, deduped_15_2, deduped_16_2, deduped_17_2, deduped_18_2, deduped_19_2;
                deduped_19_2 := hoisted_7_1[m_2];
                hoisted_4_2 := 1 + deduped_19_2[1];
                deduped_18_2 := List( arg2_1, function ( logic_new_func_x_3 )
                        return RankOfObject( Range( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[hoisted_4_2] ) ) );
                    end );
                hoisted_1_2 := 1 + deduped_19_2[2];
                deduped_17_2 := List( arg2_1, function ( logic_new_func_x_3 )
                        return RankOfObject( Range( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[hoisted_1_2] ) ) );
                    end );
                deduped_16_2 := Sum( deduped_18_2 );
                deduped_15_2 := Sum( deduped_17_2 );
                hoisted_6_2 := deduped_18_2;
                hoisted_5_2 := List( arg2_1, function ( logic_new_func_x_3 )
                        return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[hoisted_4_2] ) );
                    end );
                deduped_14_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                        local deduped_1_3;
                        deduped_1_3 := hoisted_6_2[logic_new_func_x_3];
                        return hoisted_5_2[logic_new_func_x_3] * UnionOfColumns( HomalgZeroMatrix( deduped_1_3, Sum( hoisted_6_2{[ 1 .. (logic_new_func_x_3 - 1) ]} ), hoisted_1_1 ), HomalgIdentityMatrix( deduped_1_3, hoisted_1_1 ), HomalgZeroMatrix( deduped_1_3, Sum( hoisted_6_2{[ (logic_new_func_x_3 + 1) .. hoisted_2_1 ]} ), hoisted_1_1 ) );
                    end );
                hoisted_3_2 := deduped_17_2;
                hoisted_2_2 := List( arg2_1, function ( logic_new_func_x_3 )
                        return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[hoisted_1_2] ) );
                    end );
                deduped_13_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                        local deduped_1_3;
                        deduped_1_3 := hoisted_3_2[logic_new_func_x_3];
                        return hoisted_2_2[logic_new_func_x_3] * UnionOfColumns( HomalgZeroMatrix( deduped_1_3, Sum( hoisted_3_2{[ 1 .. (logic_new_func_x_3 - 1) ]} ), hoisted_1_1 ), HomalgIdentityMatrix( deduped_1_3, hoisted_1_1 ), HomalgZeroMatrix( deduped_1_3, Sum( hoisted_3_2{[ (logic_new_func_x_3 + 1) .. hoisted_2_1 ]} ), hoisted_1_1 ) );
                    end );
                deduped_12_2 := UnionOfRows( hoisted_1_1, deduped_16_2, deduped_14_2{hoisted_4_1} ) + (- UnionOfRows( hoisted_1_1, deduped_16_2, deduped_14_2{hoisted_5_1} ));
                deduped_11_2 := UnionOfRows( hoisted_1_1, deduped_15_2, deduped_13_2{hoisted_4_1} ) + (- UnionOfRows( hoisted_1_1, deduped_15_2, deduped_13_2{hoisted_5_1} ));
                deduped_10_2 := deduped_16_2 - RowRankOfMatrix( deduped_12_2 );
                hoisted_8_2 := SyzygiesOfColumns( deduped_12_2 ) * HomalgIdentityMatrix( deduped_10_2, hoisted_1_1 );
                hoisted_7_2 := List( arg2_1, function ( logic_new_func_x_3 )
                        return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( Range( logic_new_func_x_3 ) )[2][m_2] ) );
                    end );
                deduped_9_2 := HomalgIdentityMatrix( (deduped_15_2 - RowRankOfMatrix( deduped_11_2 )), hoisted_1_1 ) * LeftDivide( SyzygiesOfColumns( deduped_11_2 ), UnionOfRows( hoisted_1_1, deduped_10_2, List( hoisted_3_1, function ( logic_new_func_x_3 )
                              local deduped_1_3;
                              deduped_1_3 := (Sum( hoisted_6_2{[ 1 .. logic_new_func_x_3 - 1 ]} ) + 1);
                              return (hoisted_7_2[logic_new_func_x_3] * CertainRows( hoisted_8_2, [ deduped_1_3 .. (deduped_1_3 - 1 + hoisted_6_2[logic_new_func_x_3]) ] ));
                          end ) ) );
                return CreateCapCategoryMorphismWithAttributes( hoisted_6_1, CreateCapCategoryObjectWithAttributes( hoisted_6_1, RankOfObject, NumberRows( deduped_9_2 ) ), CreateCapCategoryObjectWithAttributes( hoisted_6_1, RankOfObject, NumberColumns( deduped_9_2 ) ), UnderlyingMatrix, deduped_9_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddPushoutFunctorialWithGivenPushouts( cat,
        
########
function ( cat_1, P_1, morphisms_1, L_1, morphismsp_1, Pp_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1;
    deduped_17_1 := Length( morphismsp_1 );
    deduped_16_1 := Length( morphisms_1 );
    deduped_15_1 := Range( cat_1 );
    deduped_14_1 := ValuesOfPreSheaf( Pp_1 )[1];
    hoisted_13_1 := deduped_14_1;
    hoisted_12_1 := deduped_15_1;
    hoisted_11_1 := [ 1 .. Length( L_1 ) ];
    hoisted_10_1 := [ 2 .. deduped_17_1 ];
    hoisted_9_1 := [ 1 .. deduped_17_1 - 1 ];
    hoisted_8_1 := [ 1 .. deduped_17_1 ];
    hoisted_7_1 := deduped_17_1;
    hoisted_6_1 := List( deduped_14_1, RankOfObject );
    hoisted_5_1 := [ 2 .. deduped_16_1 ];
    hoisted_4_1 := [ 1 .. deduped_16_1 - 1 ];
    hoisted_3_1 := [ 1 .. deduped_16_1 ];
    hoisted_2_1 := deduped_16_1;
    hoisted_1_1 := UnderlyingRing( deduped_15_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Pp_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2, deduped_11_2, deduped_12_2, deduped_13_2, deduped_14_2, deduped_15_2;
              deduped_15_2 := List( morphismsp_1, function ( logic_new_func_x_3 )
                      return RankOfObject( Range( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) ) );
                  end );
              deduped_14_2 := List( morphisms_1, function ( logic_new_func_x_3 )
                      return RankOfObject( Range( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) ) );
                  end );
              deduped_13_2 := Sum( deduped_15_2 );
              deduped_12_2 := Sum( deduped_14_2 );
              hoisted_5_2 := deduped_15_2;
              hoisted_4_2 := List( morphismsp_1, function ( logic_new_func_x_3 )
                      return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                  end );
              deduped_11_2 := List( hoisted_8_1, function ( logic_new_func_x_3 )
                      local deduped_1_3;
                      deduped_1_3 := hoisted_5_2[logic_new_func_x_3];
                      return hoisted_4_2[logic_new_func_x_3] * UnionOfColumns( HomalgZeroMatrix( deduped_1_3, Sum( hoisted_5_2{[ 1 .. (logic_new_func_x_3 - 1) ]} ), hoisted_1_1 ), HomalgIdentityMatrix( deduped_1_3, hoisted_1_1 ), HomalgZeroMatrix( deduped_1_3, Sum( hoisted_5_2{[ (logic_new_func_x_3 + 1) .. hoisted_7_1 ]} ), hoisted_1_1 ) );
                  end );
              hoisted_2_2 := deduped_14_2;
              hoisted_1_2 := List( morphisms_1, function ( logic_new_func_x_3 )
                      return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                  end );
              deduped_10_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                      local deduped_1_3;
                      deduped_1_3 := hoisted_2_2[logic_new_func_x_3];
                      return hoisted_1_2[logic_new_func_x_3] * UnionOfColumns( HomalgZeroMatrix( deduped_1_3, Sum( hoisted_2_2{[ 1 .. (logic_new_func_x_3 - 1) ]} ), hoisted_1_1 ), HomalgIdentityMatrix( deduped_1_3, hoisted_1_1 ), HomalgZeroMatrix( deduped_1_3, Sum( hoisted_2_2{[ (logic_new_func_x_3 + 1) .. hoisted_2_1 ]} ), hoisted_1_1 ) );
                  end );
              deduped_9_2 := UnionOfRows( hoisted_1_1, deduped_13_2, deduped_11_2{hoisted_9_1} ) + (- UnionOfRows( hoisted_1_1, deduped_13_2, deduped_11_2{hoisted_10_1} ));
              deduped_8_2 := UnionOfRows( hoisted_1_1, deduped_12_2, deduped_10_2{hoisted_4_1} ) + (- UnionOfRows( hoisted_1_1, deduped_12_2, deduped_10_2{hoisted_5_1} ));
              hoisted_6_2 := SyzygiesOfColumns( deduped_9_2 ) * HomalgIdentityMatrix( (deduped_13_2 - RowRankOfMatrix( deduped_9_2 )), hoisted_1_1 );
              hoisted_3_2 := List( L_1, function ( logic_new_func_x_3 )
                      return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                  end );
              deduped_7_2 := HomalgIdentityMatrix( (deduped_12_2 - RowRankOfMatrix( deduped_8_2 )), hoisted_1_1 ) * LeftDivide( SyzygiesOfColumns( deduped_8_2 ), UnionOfRows( hoisted_1_1, hoisted_6_1[o_2], List( hoisted_11_1, function ( logic_new_func_x_3 )
                            local deduped_1_3;
                            deduped_1_3 := (Sum( hoisted_5_2{[ 1 .. logic_new_func_x_3 - 1 ]} ) + 1);
                            return (hoisted_3_2[logic_new_func_x_3] * CertainRows( hoisted_6_2, [ deduped_1_3 .. (deduped_1_3 - 1 + hoisted_5_2[logic_new_func_x_3]) ] ));
                        end ) ) );
              return CreateCapCategoryMorphismWithAttributes( hoisted_12_1, CreateCapCategoryObjectWithAttributes( hoisted_12_1, RankOfObject, NumberRows( deduped_7_2 ) ), hoisted_13_1[o_2], UnderlyingMatrix, deduped_7_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddRightDistributivityExpandingWithGivenObjects( cat,
        
########
function ( cat_1, s_1, L_1, a_1, r_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, deduped_8_1, deduped_9_1, deduped_10_1;
    deduped_10_1 := Length( L_1 );
    deduped_9_1 := Range( cat_1 );
    deduped_8_1 := ValuesOfPreSheaf( s_1 )[1];
    hoisted_7_1 := deduped_9_1;
    hoisted_6_1 := [ 1 .. deduped_10_1 ];
    hoisted_5_1 := List( ValuesOfPreSheaf( a_1 )[1], RankOfObject );
    hoisted_4_1 := deduped_10_1;
    hoisted_3_1 := UnderlyingRing( deduped_9_1 );
    hoisted_2_1 := List( deduped_8_1, RankOfObject );
    hoisted_1_1 := deduped_8_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              hoisted_2_2 := HomalgIdentityMatrix( hoisted_5_1[o_2], hoisted_3_1 );
              hoisted_1_2 := List( L_1, function ( logic_new_func_x_3 )
                      return RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][o_2] ) );
                  end );
              deduped_3_2 := UnionOfColumns( hoisted_3_1, hoisted_2_1[o_2], List( hoisted_6_1, function ( logic_new_func_x_3 )
                        local deduped_1_3;
                        deduped_1_3 := hoisted_1_2[logic_new_func_x_3];
                        return KroneckerMat( UnionOfRows( HomalgZeroMatrix( Sum( hoisted_1_2{[ 1 .. logic_new_func_x_3 - 1 ]} ), deduped_1_3, hoisted_3_1 ), HomalgIdentityMatrix( deduped_1_3, hoisted_3_1 ), HomalgZeroMatrix( Sum( hoisted_1_2{[ logic_new_func_x_3 + 1 .. hoisted_4_1 ]} ), deduped_1_3, hoisted_3_1 ) ), hoisted_2_2 );
                    end ) );
              return CreateCapCategoryMorphismWithAttributes( hoisted_7_1, hoisted_1_1[o_2], CreateCapCategoryObjectWithAttributes( hoisted_7_1, RankOfObject, NumberColumns( deduped_3_2 ) ), UnderlyingMatrix, deduped_3_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddRightDistributivityFactoringWithGivenObjects( cat,
        
########
function ( cat_1, s_1, L_1, a_1, r_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, deduped_8_1, deduped_9_1, deduped_10_1;
    deduped_10_1 := Length( L_1 );
    deduped_9_1 := Range( cat_1 );
    deduped_8_1 := ValuesOfPreSheaf( r_1 )[1];
    hoisted_7_1 := deduped_8_1;
    hoisted_6_1 := deduped_9_1;
    hoisted_5_1 := [ 1 .. deduped_10_1 ];
    hoisted_4_1 := List( ValuesOfPreSheaf( a_1 )[1], RankOfObject );
    hoisted_3_1 := deduped_10_1;
    hoisted_2_1 := UnderlyingRing( deduped_9_1 );
    hoisted_1_1 := List( deduped_8_1, RankOfObject );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              hoisted_2_2 := HomalgIdentityMatrix( hoisted_4_1[o_2], hoisted_2_1 );
              hoisted_1_2 := List( L_1, function ( logic_new_func_x_3 )
                      return RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][o_2] ) );
                  end );
              deduped_3_2 := UnionOfRows( hoisted_2_1, hoisted_1_1[o_2], List( hoisted_5_1, function ( logic_new_func_x_3 )
                        local deduped_1_3;
                        deduped_1_3 := hoisted_1_2[logic_new_func_x_3];
                        return KroneckerMat( UnionOfColumns( HomalgZeroMatrix( deduped_1_3, Sum( hoisted_1_2{[ 1 .. logic_new_func_x_3 - 1 ]} ), hoisted_2_1 ), HomalgIdentityMatrix( deduped_1_3, hoisted_2_1 ), HomalgZeroMatrix( deduped_1_3, Sum( hoisted_1_2{[ logic_new_func_x_3 + 1 .. hoisted_3_1 ]} ), hoisted_2_1 ) ), hoisted_2_2 );
                    end ) );
              return CreateCapCategoryMorphismWithAttributes( hoisted_6_1, CreateCapCategoryObjectWithAttributes( hoisted_6_1, RankOfObject, NumberRows( deduped_3_2 ) ), hoisted_7_1[o_2], UnderlyingMatrix, deduped_3_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddRightUnitorInverseWithGivenTensorProduct( cat,
        
########
function ( cat_1, a_1, r_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1;
    deduped_6_1 := Range( cat_1 );
    deduped_5_1 := ValuesOfPreSheaf( a_1 )[1];
    hoisted_4_1 := deduped_6_1;
    hoisted_3_1 := UnderlyingRing( deduped_6_1 );
    hoisted_2_1 := List( deduped_5_1, RankOfObject );
    hoisted_1_1 := deduped_5_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, r_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_1_1[o_2];
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, deduped_1_2, deduped_1_2, UnderlyingMatrix, HomalgIdentityMatrix( hoisted_2_1[o_2], hoisted_3_1 ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddRightUnitorWithGivenTensorProduct( cat,
        
########
function ( cat_1, a_1, s_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1;
    deduped_6_1 := Range( cat_1 );
    deduped_5_1 := ValuesOfPreSheaf( a_1 )[1];
    hoisted_4_1 := deduped_6_1;
    hoisted_3_1 := UnderlyingRing( deduped_6_1 );
    hoisted_2_1 := List( deduped_5_1, RankOfObject );
    hoisted_1_1 := deduped_5_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, a_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local deduped_1_2;
              deduped_1_2 := hoisted_1_1[o_2];
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, deduped_1_2, deduped_1_2, UnderlyingMatrix, HomalgIdentityMatrix( hoisted_2_1[o_2], hoisted_3_1 ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddSubtractionForMorphisms( cat,
        
########
function ( cat_1, a_1, b_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1;
    deduped_6_1 := ValuesOnAllObjects( a_1 );
    hoisted_5_1 := Range( cat_1 );
    hoisted_4_1 := List( ValuesOnAllObjects( b_1 ), function ( logic_new_func_x_2 )
            return - UnderlyingMatrix( logic_new_func_x_2 );
        end );
    hoisted_3_1 := List( deduped_6_1, UnderlyingMatrix );
    hoisted_2_1 := List( deduped_6_1, Range );
    hoisted_1_1 := List( deduped_6_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( a_1 ), Range( a_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, hoisted_3_1[o_2] + hoisted_4_1[o_2] );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddTensorProductOnMorphismsWithGivenTensorProducts( cat,
        
########
function ( cat_1, s_1, alpha_1, beta_1, r_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1;
    hoisted_5_1 := Range( cat_1 );
    hoisted_4_1 := List( ValuesOnAllObjects( beta_1 ), UnderlyingMatrix );
    hoisted_3_1 := List( ValuesOnAllObjects( alpha_1 ), UnderlyingMatrix );
    hoisted_2_1 := ValuesOfPreSheaf( r_1 )[1];
    hoisted_1_1 := ValuesOfPreSheaf( s_1 )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, KroneckerMat( hoisted_3_1[o_2], hoisted_4_1[o_2] ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddTensorProductOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := ValuesOfPreSheaf( arg3_1 );
    deduped_8_1 := ValuesOfPreSheaf( arg2_1 );
    deduped_7_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_6_1 := Range( cat_1 );
    hoisted_5_1 := List( deduped_9_1[2], UnderlyingMatrix );
    hoisted_4_1 := List( deduped_8_1[2], UnderlyingMatrix );
    hoisted_3_1 := deduped_6_1;
    hoisted_2_1 := List( deduped_9_1[1], RankOfObject );
    hoisted_1_1 := List( deduped_8_1[1], RankOfObject );
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, Source( cat_1 ), Range, deduped_6_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_7_1[1] ], function ( o_2 )
                return CreateCapCategoryObjectWithAttributes( hoisted_3_1, RankOfObject, hoisted_1_1[o_2] * hoisted_2_1[o_2] );
            end ), LazyHList( [ 1 .. Length( deduped_7_1[2] ) ], function ( m_2 )
                local morphism_attr_1_2;
                morphism_attr_1_2 := KroneckerMat( hoisted_4_1[m_2], hoisted_5_1[m_2] );
                return CreateCapCategoryMorphismWithAttributes( hoisted_3_1, CreateCapCategoryObjectWithAttributes( hoisted_3_1, RankOfObject, NumberRows( morphism_attr_1_2 ) ), CreateCapCategoryObjectWithAttributes( hoisted_3_1, RankOfObject, NumberColumns( morphism_attr_1_2 ) ), UnderlyingMatrix, morphism_attr_1_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddTensorUnit( cat,
        
########
function ( cat_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_4_1 := Range( cat_1 );
    hoisted_3_1 := HomalgIdentityMatrix( 1, UnderlyingRing( deduped_4_1 ) );
    hoisted_2_1 := deduped_4_1;
    hoisted_1_1 := CreateCapCategoryObjectWithAttributes( deduped_4_1, RankOfObject, 1 );
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, Source( cat_1 ), Range, deduped_4_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_5_1[1] ], function ( o_2 )
                return hoisted_1_1;
            end ), LazyHList( [ 1 .. Length( deduped_5_1[2] ) ], function ( m_2 )
                local morphism_attr_1_2;
                morphism_attr_1_2 := hoisted_3_1;
                return CreateCapCategoryMorphismWithAttributes( hoisted_2_1, hoisted_1_1, hoisted_1_1, UnderlyingMatrix, morphism_attr_1_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddTerminalObject( cat,
        
########
function ( cat_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_4_1 := Range( cat_1 );
    hoisted_3_1 := HomalgIdentityMatrix( 0, UnderlyingRing( deduped_4_1 ) );
    hoisted_2_1 := deduped_4_1;
    hoisted_1_1 := CreateCapCategoryObjectWithAttributes( deduped_4_1, RankOfObject, 0 );
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, Source( cat_1 ), Range, deduped_4_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_5_1[1] ], function ( o_2 )
                return hoisted_1_1;
            end ), LazyHList( [ 1 .. Length( deduped_5_1[2] ) ], function ( m_2 )
                local morphism_attr_1_2;
                morphism_attr_1_2 := hoisted_3_1;
                return CreateCapCategoryMorphismWithAttributes( hoisted_2_1, hoisted_1_1, hoisted_1_1, UnderlyingMatrix, morphism_attr_1_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromCoproductWithGivenCoproduct( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1;
    deduped_6_1 := Range( cat_1 );
    deduped_5_1 := ValuesOfPreSheaf( T_1 )[1];
    hoisted_4_1 := deduped_5_1;
    hoisted_3_1 := deduped_6_1;
    hoisted_2_1 := List( deduped_5_1, RankOfObject );
    hoisted_1_1 := UnderlyingRing( deduped_6_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local deduped_1_2;
              deduped_1_2 := HomalgIdentityMatrix( Sum( List( objects_1, function ( logic_new_func_x_3 )
                            return RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][o_2] ) );
                        end ) ), hoisted_1_1 ) * UnionOfRows( hoisted_1_1, hoisted_2_1[o_2], List( tau_1, function ( logic_new_func_x_3 )
                          return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                      end ) );
              return CreateCapCategoryMorphismWithAttributes( hoisted_3_1, CreateCapCategoryObjectWithAttributes( hoisted_3_1, RankOfObject, NumberRows( deduped_1_2 ) ), hoisted_4_1[o_2], UnderlyingMatrix, deduped_1_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromDirectSumWithGivenDirectSum( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := Range( cat_1 );
    deduped_6_1 := ValuesOfPreSheaf( T_1 )[1];
    hoisted_5_1 := deduped_7_1;
    hoisted_4_1 := UnderlyingRing( deduped_7_1 );
    hoisted_3_1 := List( deduped_6_1, RankOfObject );
    hoisted_2_1 := deduped_6_1;
    hoisted_1_1 := ValuesOfPreSheaf( P_1 )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, UnionOfRows( hoisted_4_1, hoisted_3_1[o_2], List( tau_1, function ( logic_new_func_x_3 )
                          return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                      end ) ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromImageWithGivenImageObject( cat,
        
########
function ( cat_1, alpha_1, tau_1, I_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1;
    deduped_8_1 := Range( cat_1 );
    deduped_7_1 := ValuesOnAllObjects( alpha_1 );
    hoisted_6_1 := deduped_8_1;
    hoisted_5_1 := ValuesOnAllObjects( CAP_JIT_INCOMPLETE_LOGIC( tau_1[2] ) );
    hoisted_4_1 := List( deduped_7_1, function ( logic_new_func_x_2 )
            return SyzygiesOfRows( SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) ) );
        end );
    hoisted_3_1 := UnderlyingRing( deduped_8_1 );
    hoisted_2_1 := List( deduped_7_1, function ( logic_new_func_x_2 )
            return RowRankOfMatrix( SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) ) );
        end );
    hoisted_1_1 := List( deduped_7_1, function ( logic_new_func_x_2 )
            return RankOfObject( Range( logic_new_func_x_2 ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, I_1, Range( CAP_JIT_INCOMPLETE_LOGIC( tau_1[1] ) ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local deduped_1_2, deduped_2_2;
              deduped_2_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_5_1[o_2] );
              deduped_1_2 := RightDivide( HomalgIdentityMatrix( (hoisted_1_1[o_2] - hoisted_2_1[o_2]), hoisted_3_1 ) * hoisted_4_1[o_2], UnderlyingMatrix( deduped_2_2 ) );
              return CreateCapCategoryMorphismWithAttributes( hoisted_6_1, CreateCapCategoryObjectWithAttributes( hoisted_6_1, RankOfObject, NumberRows( deduped_1_2 ) ), Source( deduped_2_2 ), UnderlyingMatrix, deduped_1_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromInitialObjectWithGivenInitialObject( cat,
        
########
function ( cat_1, T_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := Range( cat_1 );
    deduped_8_1 := ValuesOfPreSheaf( T_1 )[1];
    deduped_7_1 := ValuesOfPreSheaf( P_1 )[1];
    hoisted_6_1 := deduped_9_1;
    hoisted_5_1 := UnderlyingRing( deduped_9_1 );
    hoisted_4_1 := List( deduped_8_1, RankOfObject );
    hoisted_3_1 := List( deduped_7_1, RankOfObject );
    hoisted_2_1 := deduped_8_1;
    hoisted_1_1 := deduped_7_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_6_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, HomalgZeroMatrix( hoisted_3_1[o_2], hoisted_4_1[o_2], hoisted_5_1 ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromPushoutWithGivenPushout( cat,
        
########
function ( cat_1, morphisms_1, T_1, tau_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, deduped_9_1, deduped_10_1, deduped_11_1;
    deduped_11_1 := Length( morphisms_1 );
    deduped_10_1 := Range( cat_1 );
    deduped_9_1 := ValuesOfPreSheaf( T_1 )[1];
    hoisted_8_1 := deduped_9_1;
    hoisted_7_1 := deduped_10_1;
    hoisted_6_1 := List( deduped_9_1, RankOfObject );
    hoisted_5_1 := [ 2 .. deduped_11_1 ];
    hoisted_4_1 := [ 1 .. deduped_11_1 - 1 ];
    hoisted_3_1 := [ 1 .. deduped_11_1 ];
    hoisted_2_1 := deduped_11_1;
    hoisted_1_1 := UnderlyingRing( deduped_10_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := List( morphisms_1, function ( logic_new_func_x_3 )
                      return RankOfObject( Range( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) ) );
                  end );
              deduped_6_2 := Sum( deduped_7_2 );
              hoisted_2_2 := deduped_7_2;
              hoisted_1_2 := List( morphisms_1, function ( logic_new_func_x_3 )
                      return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                  end );
              deduped_5_2 := List( hoisted_3_1, function ( logic_new_func_x_3 )
                      local deduped_1_3;
                      deduped_1_3 := hoisted_2_2[logic_new_func_x_3];
                      return hoisted_1_2[logic_new_func_x_3] * UnionOfColumns( HomalgZeroMatrix( deduped_1_3, Sum( hoisted_2_2{[ 1 .. (logic_new_func_x_3 - 1) ]} ), hoisted_1_1 ), HomalgIdentityMatrix( deduped_1_3, hoisted_1_1 ), HomalgZeroMatrix( deduped_1_3, Sum( hoisted_2_2{[ (logic_new_func_x_3 + 1) .. hoisted_2_1 ]} ), hoisted_1_1 ) );
                  end );
              deduped_4_2 := UnionOfRows( hoisted_1_1, deduped_6_2, deduped_5_2{hoisted_4_1} ) + (- UnionOfRows( hoisted_1_1, deduped_6_2, deduped_5_2{hoisted_5_1} ));
              deduped_3_2 := HomalgIdentityMatrix( (deduped_6_2 - RowRankOfMatrix( deduped_4_2 )), hoisted_1_1 ) * LeftDivide( SyzygiesOfColumns( deduped_4_2 ), UnionOfRows( hoisted_1_1, hoisted_6_1[o_2], List( tau_1, function ( logic_new_func_x_3 )
                            return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                        end ) ) );
              return CreateCapCategoryMorphismWithAttributes( hoisted_7_1, CreateCapCategoryObjectWithAttributes( hoisted_7_1, RankOfObject, NumberRows( deduped_3_2 ) ), hoisted_8_1[o_2], UnderlyingMatrix, deduped_3_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromZeroObjectWithGivenZeroObject( cat,
        
########
function ( cat_1, T_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := Range( cat_1 );
    deduped_6_1 := ValuesOfPreSheaf( T_1 )[1];
    hoisted_5_1 := deduped_7_1;
    hoisted_4_1 := UnderlyingRing( deduped_7_1 );
    hoisted_3_1 := List( deduped_6_1, RankOfObject );
    hoisted_2_1 := deduped_6_1;
    hoisted_1_1 := ValuesOfPreSheaf( P_1 )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, HomalgZeroMatrix( 0, hoisted_3_1[o_2], hoisted_4_1 ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1;
    deduped_6_1 := Range( cat_1 );
    deduped_5_1 := ValuesOfPreSheaf( T_1 )[1];
    hoisted_4_1 := deduped_6_1;
    hoisted_3_1 := UnderlyingRing( deduped_6_1 );
    hoisted_2_1 := List( deduped_5_1, RankOfObject );
    hoisted_1_1 := deduped_5_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local deduped_1_2;
              deduped_1_2 := UnionOfColumns( hoisted_3_1, hoisted_2_1[o_2], List( tau_1, function ( logic_new_func_x_3 )
                          return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                      end ) ) * HomalgIdentityMatrix( Sum( List( objects_1, function ( logic_new_func_x_3 )
                            return RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][o_2] ) );
                        end ) ), hoisted_3_1 );
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, hoisted_1_1[o_2], CreateCapCategoryObjectWithAttributes( hoisted_4_1, RankOfObject, NumberColumns( deduped_1_2 ) ), UnderlyingMatrix, deduped_1_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoDirectSumWithGivenDirectSum( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := Range( cat_1 );
    deduped_6_1 := ValuesOfPreSheaf( T_1 )[1];
    hoisted_5_1 := deduped_7_1;
    hoisted_4_1 := UnderlyingRing( deduped_7_1 );
    hoisted_3_1 := List( deduped_6_1, RankOfObject );
    hoisted_2_1 := ValuesOfPreSheaf( P_1 )[1];
    hoisted_1_1 := deduped_6_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, UnionOfColumns( hoisted_4_1, hoisted_3_1[o_2], List( tau_1, function ( logic_new_func_x_3 )
                          return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                      end ) ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoFiberProductWithGivenFiberProduct( cat,
        
########
function ( cat_1, morphisms_1, T_1, tau_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, deduped_9_1, deduped_10_1, deduped_11_1;
    deduped_11_1 := Length( morphisms_1 );
    deduped_10_1 := Range( cat_1 );
    deduped_9_1 := ValuesOfPreSheaf( T_1 )[1];
    hoisted_8_1 := deduped_10_1;
    hoisted_7_1 := [ 2 .. deduped_11_1 ];
    hoisted_6_1 := [ 1 .. deduped_11_1 - 1 ];
    hoisted_5_1 := [ 1 .. deduped_11_1 ];
    hoisted_4_1 := deduped_11_1;
    hoisted_3_1 := UnderlyingRing( deduped_10_1 );
    hoisted_2_1 := List( deduped_9_1, RankOfObject );
    hoisted_1_1 := deduped_9_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := List( morphisms_1, function ( logic_new_func_x_3 )
                      return RankOfObject( Source( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) ) );
                  end );
              deduped_6_2 := Sum( deduped_7_2 );
              hoisted_2_2 := List( morphisms_1, function ( logic_new_func_x_3 )
                      return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                  end );
              hoisted_1_2 := deduped_7_2;
              deduped_5_2 := List( hoisted_5_1, function ( logic_new_func_x_3 )
                      local deduped_1_3;
                      deduped_1_3 := hoisted_1_2[logic_new_func_x_3];
                      return UnionOfRows( HomalgZeroMatrix( Sum( hoisted_1_2{[ 1 .. (logic_new_func_x_3 - 1) ]} ), deduped_1_3, hoisted_3_1 ), HomalgIdentityMatrix( deduped_1_3, hoisted_3_1 ), HomalgZeroMatrix( Sum( hoisted_1_2{[ (logic_new_func_x_3 + 1) .. hoisted_4_1 ]} ), deduped_1_3, hoisted_3_1 ) ) * hoisted_2_2[logic_new_func_x_3];
                  end );
              deduped_4_2 := UnionOfColumns( hoisted_3_1, deduped_6_2, deduped_5_2{hoisted_6_1} ) + (- UnionOfColumns( hoisted_3_1, deduped_6_2, deduped_5_2{hoisted_7_1} ));
              deduped_3_2 := RightDivide( UnionOfColumns( hoisted_3_1, hoisted_2_1[o_2], List( tau_1, function ( logic_new_func_x_3 )
                            return UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                        end ) ), SyzygiesOfRows( deduped_4_2 ) ) * HomalgIdentityMatrix( (deduped_6_2 - RowRankOfMatrix( deduped_4_2 )), hoisted_3_1 );
              return CreateCapCategoryMorphismWithAttributes( hoisted_8_1, hoisted_1_1[o_2], CreateCapCategoryObjectWithAttributes( hoisted_8_1, RankOfObject, NumberColumns( deduped_3_2 ) ), UnderlyingMatrix, deduped_3_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( cat,
        
########
function ( cat_1, T_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := Range( cat_1 );
    deduped_8_1 := ValuesOfPreSheaf( P_1 )[1];
    deduped_7_1 := ValuesOfPreSheaf( T_1 )[1];
    hoisted_6_1 := deduped_9_1;
    hoisted_5_1 := UnderlyingRing( deduped_9_1 );
    hoisted_4_1 := List( deduped_8_1, RankOfObject );
    hoisted_3_1 := List( deduped_7_1, RankOfObject );
    hoisted_2_1 := deduped_8_1;
    hoisted_1_1 := deduped_7_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_6_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, HomalgZeroMatrix( hoisted_3_1[o_2], hoisted_4_1[o_2], hoisted_5_1 ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoZeroObjectWithGivenZeroObject( cat,
        
########
function ( cat_1, T_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := Range( cat_1 );
    deduped_6_1 := ValuesOfPreSheaf( T_1 )[1];
    hoisted_5_1 := deduped_7_1;
    hoisted_4_1 := UnderlyingRing( deduped_7_1 );
    hoisted_3_1 := List( deduped_6_1, RankOfObject );
    hoisted_2_1 := ValuesOfPreSheaf( P_1 )[1];
    hoisted_1_1 := deduped_6_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, HomalgZeroMatrix( hoisted_3_1[o_2], 0, hoisted_4_1 ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddZeroMorphism( cat,
        
########
function ( cat_1, a_1, b_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := Range( cat_1 );
    deduped_8_1 := ValuesOfPreSheaf( b_1 )[1];
    deduped_7_1 := ValuesOfPreSheaf( a_1 )[1];
    hoisted_6_1 := deduped_9_1;
    hoisted_5_1 := UnderlyingRing( deduped_9_1 );
    hoisted_4_1 := List( deduped_8_1, RankOfObject );
    hoisted_3_1 := List( deduped_7_1, RankOfObject );
    hoisted_2_1 := deduped_8_1;
    hoisted_1_1 := deduped_7_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, b_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningPairOfUnderlyingQuiver( cat_1 )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_6_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, HomalgZeroMatrix( hoisted_3_1[o_2], hoisted_4_1[o_2], hoisted_5_1 ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddZeroObject( cat,
        
########
function ( cat_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := DefiningPairOfUnderlyingQuiver( cat_1 );
    deduped_4_1 := Range( cat_1 );
    hoisted_3_1 := HomalgZeroMatrix( 0, 0, UnderlyingRing( deduped_4_1 ) );
    hoisted_2_1 := deduped_4_1;
    hoisted_1_1 := CreateCapCategoryObjectWithAttributes( deduped_4_1, RankOfObject, 0 );
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, Source( cat_1 ), Range, deduped_4_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_5_1[1] ], function ( o_2 )
                return hoisted_1_1;
            end ), LazyHList( [ 1 .. Length( deduped_5_1[2] ) ], function ( m_2 )
                local morphism_attr_1_2;
                morphism_attr_1_2 := hoisted_3_1;
                return CreateCapCategoryMorphismWithAttributes( hoisted_2_1, hoisted_1_1, hoisted_1_1, UnderlyingMatrix, morphism_attr_1_2 );
            end ) ) );
end
########
        
    , 100 );
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
end );

BindGlobal( "PreSheavesOfFreeAlgebroidInCategoryOfRowsPrecompiled", function ( A )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function ( A )
    return PreSheaves( A, CategoryOfRows( CommutativeRingOfLinearCategory( A ) : FinalizeCategory := true,
          no_precompiled_code := false ) );
end;
        
        
    
    cat := category_constructor( A : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_PreSheavesOfFreeAlgebroidInCategoryOfRowsPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
