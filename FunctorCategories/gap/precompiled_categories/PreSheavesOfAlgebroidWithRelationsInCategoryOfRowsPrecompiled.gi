# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_PreSheavesOfAlgebroidWithRelationsInCategoryOfRowsPrecompiled", function ( cat )
    
    ##
    AddAdditionForMorphisms( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1;
    deduped_6_1 := ValuesOnAllObjects( alpha_1 );
    hoisted_5_1 := Target( cat_1 );
    hoisted_4_1 := List( ValuesOnAllObjects( beta_1 ), UnderlyingMatrix );
    hoisted_3_1 := List( deduped_6_1, UnderlyingMatrix );
    hoisted_2_1 := List( deduped_6_1, Range );
    hoisted_1_1 := List( deduped_6_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), Range( alpha_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, hoisted_3_1[o_2] + hoisted_4_1[o_2] );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddAdditiveInverseForMorphisms( cat,
        
########
function ( cat_1, alpha_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1;
    deduped_5_1 := ValuesOnAllObjects( alpha_1 );
    hoisted_4_1 := Target( cat_1 );
    hoisted_3_1 := List( deduped_5_1, function ( logic_new_func_x_2 )
            return - UnderlyingMatrix( logic_new_func_x_2 );
        end );
    hoisted_2_1 := List( deduped_5_1, Range );
    hoisted_1_1 := List( deduped_5_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), Range( alpha_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, hoisted_3_1[o_2] );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddBasisOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, deduped_4_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_10_1, deduped_11_1, hoisted_16_1, hoisted_21_1, hoisted_22_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1;
    deduped_40_1 := ValuesOfPreSheaf( arg3_1 );
    deduped_39_1 := ValuesOfPreSheaf( arg2_1 );
    deduped_38_1 := Source( cat_1 );
    deduped_37_1 := CommutativeRingOfLinearCategory( cat_1 );
    deduped_36_1 := deduped_40_1[1];
    deduped_35_1 := deduped_39_1[1];
    deduped_34_1 := deduped_40_1[2];
    deduped_33_1 := deduped_39_1[2];
    deduped_32_1 := SetOfObjectsAsUnresolvableAttribute( deduped_38_1 );
    deduped_31_1 := SetOfGeneratingMorphismsAsUnresolvableAttribute( deduped_38_1 );
    deduped_30_1 := Length( deduped_32_1 );
    deduped_29_1 := [ 1 .. deduped_30_1 ];
    deduped_28_1 := [ 1 .. Length( deduped_31_1 ) ];
    hoisted_2_1 := List( deduped_34_1, function ( logic_new_func_x_2 )
            return RankOfObject( Target( logic_new_func_x_2 ) );
        end );
    hoisted_1_1 := List( deduped_33_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    deduped_27_1 := List( deduped_28_1, function ( i_2 )
            return hoisted_1_1[i_2] * hoisted_2_1[i_2];
        end );
    deduped_4_1 := List( deduped_36_1, RankOfObject );
    deduped_3_1 := List( deduped_35_1, RankOfObject );
    deduped_11_1 := List( deduped_29_1, function ( i_2 )
            return deduped_3_1[i_2] * deduped_4_1[i_2];
        end );
    hoisted_10_1 := List( deduped_34_1, UnderlyingMatrix );
    hoisted_8_1 := List( deduped_33_1, function ( logic_new_func_x_2 )
            return TransposedMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_7_1 := List( deduped_31_1, Target );
    hoisted_6_1 := List( deduped_31_1, Source );
    deduped_26_1 := SyzygiesOfRows( UnionOfRows( deduped_37_1, Sum( deduped_27_1 ), List( deduped_29_1, function ( i_2 )
                local deduped_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2, deduped_6_2;
                deduped_6_2 := deduped_4_1[i_2];
                deduped_5_2 := deduped_3_1[i_2];
                hoisted_4_2 := deduped_11_1[i_2];
                hoisted_3_2 := TransposedMatrix( HomalgIdentityMatrix( deduped_5_2, deduped_37_1 ) );
                hoisted_2_2 := HomalgIdentityMatrix( deduped_6_2, deduped_37_1 );
                deduped_1_2 := deduped_32_1[i_2];
                return UnionOfColumns( deduped_37_1, deduped_5_2 * deduped_6_2, List( deduped_28_1, function ( j_3 )
                          local deduped_1_3, deduped_2_3, deduped_3_3, deduped_4_3;
                          deduped_4_3 := deduped_1_2 = hoisted_7_1[j_3];
                          deduped_3_3 := deduped_1_2 = hoisted_6_1[j_3];
                          deduped_2_3 := KroneckerMat( hoisted_8_1[j_3], hoisted_2_2 );
                          deduped_1_3 := - KroneckerMat( hoisted_3_2, hoisted_10_1[j_3] );
                          if deduped_3_3 and deduped_4_3 then
                              return deduped_2_3 + deduped_1_3;
                          elif not deduped_3_3 and deduped_4_3 then
                              return deduped_1_3;
                          elif deduped_3_3 and not deduped_4_3 then
                              return deduped_2_3;
                          else
                              return HomalgZeroMatrix( hoisted_4_2, deduped_27_1[j_3], deduped_37_1 );
                          fi;
                          return;
                      end ) );
            end ) ) );
    deduped_25_1 := NumberRows( deduped_26_1 );
    deduped_24_1 := [ 1 .. deduped_25_1 ];
    hoisted_22_1 := Target( cat_1 );
    hoisted_16_1 := HomalgIdentityMatrix( deduped_25_1, deduped_37_1 );
    hoisted_21_1 := List( [ 1 .. Length( deduped_35_1 ) ], function ( i_2 )
            local hoisted_1_2, deduped_2_2;
            deduped_2_2 := deduped_11_1[i_2];
            hoisted_1_2 := deduped_26_1 * UnionOfRows( deduped_37_1, deduped_2_2, [ HomalgZeroMatrix( Sum( deduped_11_1{[ 1 .. (i_2 - 1) ]} ), deduped_2_2, deduped_37_1 ), HomalgIdentityMatrix( deduped_2_2, deduped_37_1 ), HomalgZeroMatrix( Sum( deduped_11_1{[ (i_2 + 1) .. deduped_30_1 ]} ), deduped_2_2, deduped_37_1 ) ] );
            return List( deduped_24_1, function ( i_3 )
                    return ConvertRowToMatrix( CertainRows( hoisted_16_1, [ i_3 ] ), 1, deduped_25_1 ) * hoisted_1_2;
                end );
        end );
    return List( deduped_24_1, function ( j_2 )
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, ValuesOnAllObjects, LazyHList( deduped_29_1, function ( i_3 )
                      return CreateCapCategoryMorphismWithAttributes( hoisted_22_1, deduped_35_1[i_3], deduped_36_1[i_3], UnderlyingMatrix, ConvertRowToMatrix( hoisted_21_1[i_3][j_2], deduped_3_1[i_3], deduped_4_1[i_3] ) );
                  end ) );
        end );
end
########
        
    , 100 );
    
    ##
    AddCoimageObject( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, hoisted_3_1, deduped_4_1, hoisted_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := ValuesOnAllObjects( arg2_1 );
    deduped_8_1 := Target( cat_1 );
    deduped_7_1 := Source( cat_1 );
    deduped_6_1 := DefiningTripleOfUnderlyingQuiver( deduped_7_1 );
    hoisted_5_1 := List( ValuesOfPreSheaf( Source( arg2_1 ) )[2], UnderlyingMatrix );
    deduped_4_1 := List( deduped_9_1, function ( logic_new_func_x_2 )
            return BasisOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_3_1 := deduped_6_1[3];
    hoisted_1_1 := List( deduped_9_1, function ( logic_new_func_x_2 )
            return ColumnRankOfMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, deduped_7_1, Target, deduped_8_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_6_1[1] ], function ( o_2 )
                return CreateCapCategoryObjectWithAttributes( deduped_8_1, RankOfObject, hoisted_1_1[o_2] );
            end ), LazyHList( [ 1 .. deduped_6_1[2] ], function ( m_2 )
                local morphism_attr_1_2, deduped_2_2;
                deduped_2_2 := hoisted_3_1[m_2];
                morphism_attr_1_2 := UniqueLeftDivide( deduped_4_1[1 + deduped_2_2[2]], hoisted_5_1[m_2] * deduped_4_1[(1 + deduped_2_2[1])] );
                return CreateCapCategoryMorphismWithAttributes( deduped_8_1, CreateCapCategoryObjectWithAttributes( deduped_8_1, RankOfObject, NumberRows( morphism_attr_1_2 ) ), CreateCapCategoryObjectWithAttributes( deduped_8_1, RankOfObject, NumberColumns( morphism_attr_1_2 ) ), UnderlyingMatrix, morphism_attr_1_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.CoimageObject :=
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1, hoisted_3_1, deduped_4_1, hoisted_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := ValuesOnAllObjects( arg2_1 );
    deduped_8_1 := Target( cat_1 );
    deduped_7_1 := Source( cat_1 );
    deduped_6_1 := DefiningTripleOfUnderlyingQuiver( deduped_7_1 );
    hoisted_5_1 := List( ValuesOfPreSheaf( Source( arg2_1 ) )[2], UnderlyingMatrix );
    deduped_4_1 := List( deduped_9_1, function ( logic_new_func_x_2 )
            return BasisOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_3_1 := deduped_6_1[3];
    deduped_1_1 := List( deduped_9_1, function ( logic_new_func_x_2 )
            return ColumnRankOfMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, deduped_7_1, Target, deduped_8_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_6_1[1] ], function ( o_2 )
                return CreateCapCategoryObjectWithAttributes( deduped_8_1, RankOfObject, deduped_1_1[o_2] );
            end ), LazyHList( [ 1 .. deduped_6_1[2] ], function ( m_2 )
                local deduped_1_2, deduped_2_2, deduped_3_2;
                deduped_3_2 := hoisted_3_1[m_2];
                deduped_2_2 := 1 + deduped_3_2[1];
                deduped_1_2 := 1 + deduped_3_2[2];
                return CreateCapCategoryMorphismWithAttributes( deduped_8_1, CreateCapCategoryObjectWithAttributes( deduped_8_1, RankOfObject, deduped_1_1[deduped_1_2] ), CreateCapCategoryObjectWithAttributes( deduped_8_1, RankOfObject, deduped_1_1[deduped_2_2] ), UnderlyingMatrix, UniqueLeftDivide( deduped_4_1[deduped_1_2], hoisted_5_1[m_2] * deduped_4_1[deduped_2_2] ) );
            end ) ) );
end
########
        
    ;
    
    ##
    AddCoimageProjectionWithGivenCoimageObject( cat,
        
########
function ( cat_1, alpha_1, C_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1;
    deduped_5_1 := ValuesOnAllObjects( alpha_1 );
    hoisted_4_1 := Target( cat_1 );
    hoisted_3_1 := List( deduped_5_1, function ( logic_new_func_x_2 )
            return BasisOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_2_1 := ValuesOfPreSheaf( C_1 )[1];
    hoisted_1_1 := List( deduped_5_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), C_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, hoisted_3_1[o_2] );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCokernelColiftWithGivenCokernelObject( cat,
        
########
function ( cat_1, alpha_1, T_1, tau_1, P_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, hoisted_4_1, deduped_5_1;
    deduped_5_1 := ValuesOnAllObjects( tau_1 );
    hoisted_4_1 := List( deduped_5_1, Range );
    deduped_3_1 := Target( cat_1 );
    hoisted_2_1 := List( deduped_5_1, UnderlyingMatrix );
    hoisted_1_1 := List( ValuesOnAllObjects( alpha_1 ), function ( logic_new_func_x_2 )
            return SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Range( tau_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              local morphism_attr_1_2;
              morphism_attr_1_2 := UniqueLeftDivide( hoisted_1_1[o_2], hoisted_2_1[o_2] );
              return CreateCapCategoryMorphismWithAttributes( deduped_3_1, CreateCapCategoryObjectWithAttributes( deduped_3_1, RankOfObject, NumberRows( morphism_attr_1_2 ) ), hoisted_4_1[o_2], UnderlyingMatrix, morphism_attr_1_2 );
          end ) );
end
########
        
    , 201 : IsPrecompiledDerivation := true );
    
    ##
    cat!.cached_precompiled_functions.CokernelColiftWithGivenCokernelObject :=
        
########
function ( cat_1, alpha_1, T_1, tau_1, P_1 )
    local hoisted_1_1, deduped_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := ValuesOnAllObjects( tau_1 );
    deduped_6_1 := ValuesOnAllObjects( alpha_1 );
    hoisted_5_1 := List( deduped_7_1, UnderlyingMatrix );
    hoisted_4_1 := List( deduped_6_1, function ( logic_new_func_x_2 )
            return SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_3_1 := List( deduped_7_1, Range );
    deduped_2_1 := Target( cat_1 );
    hoisted_1_1 := List( deduped_6_1, function ( logic_new_func_x_2 )
            return NumberColumns( SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Range( tau_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( deduped_2_1, CreateCapCategoryObjectWithAttributes( deduped_2_1, RankOfObject, hoisted_1_1[o_2] ), hoisted_3_1[o_2], UnderlyingMatrix, UniqueLeftDivide( hoisted_4_1[o_2], hoisted_5_1[o_2] ) );
          end ) );
end
########
        
    ;
    
    ##
    AddCokernelObject( cat,
        
########
function ( cat_1, alpha_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_4_1, deduped_5_1, hoisted_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1;
    deduped_10_1 := ValuesOnAllObjects( alpha_1 );
    deduped_9_1 := Target( cat_1 );
    deduped_8_1 := Source( cat_1 );
    deduped_7_1 := DefiningTripleOfUnderlyingQuiver( deduped_8_1 );
    hoisted_6_1 := List( ValuesOfPreSheaf( Target( alpha_1 ) )[2], UnderlyingMatrix );
    deduped_5_1 := List( deduped_10_1, function ( logic_new_func_x_2 )
            return SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_4_1 := deduped_7_1[3];
    hoisted_2_1 := List( deduped_10_1, function ( logic_new_func_x_2 )
            return RowRankOfMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_1_1 := List( deduped_10_1, function ( logic_new_func_x_2 )
            return RankOfObject( Range( logic_new_func_x_2 ) );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, deduped_8_1, Target, deduped_9_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_7_1[1] ], function ( o_2 )
                return CreateCapCategoryObjectWithAttributes( deduped_9_1, RankOfObject, hoisted_1_1[o_2] - hoisted_2_1[o_2] );
            end ), LazyHList( [ 1 .. deduped_7_1[2] ], function ( m_2 )
                local morphism_attr_1_2, deduped_2_2;
                deduped_2_2 := hoisted_4_1[m_2];
                morphism_attr_1_2 := UniqueLeftDivide( deduped_5_1[1 + deduped_2_2[2]], hoisted_6_1[m_2] * deduped_5_1[(1 + deduped_2_2[1])] );
                return CreateCapCategoryMorphismWithAttributes( deduped_9_1, CreateCapCategoryObjectWithAttributes( deduped_9_1, RankOfObject, NumberRows( morphism_attr_1_2 ) ), CreateCapCategoryObjectWithAttributes( deduped_9_1, RankOfObject, NumberColumns( morphism_attr_1_2 ) ), UnderlyingMatrix, morphism_attr_1_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.CokernelObject :=
        
########
function ( cat_1, alpha_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_4_1, deduped_5_1, deduped_6_1, hoisted_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1;
    deduped_11_1 := ValuesOnAllObjects( alpha_1 );
    deduped_10_1 := Target( cat_1 );
    deduped_9_1 := Source( cat_1 );
    deduped_8_1 := DefiningTripleOfUnderlyingQuiver( deduped_9_1 );
    hoisted_7_1 := List( ValuesOfPreSheaf( Target( alpha_1 ) )[2], UnderlyingMatrix );
    deduped_6_1 := List( deduped_11_1, function ( logic_new_func_x_2 )
            return SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    deduped_5_1 := List( deduped_11_1, function ( logic_new_func_x_2 )
            return NumberColumns( SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) ) );
        end );
    hoisted_4_1 := deduped_8_1[3];
    hoisted_2_1 := List( deduped_11_1, function ( logic_new_func_x_2 )
            return RowRankOfMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_1_1 := List( deduped_11_1, function ( logic_new_func_x_2 )
            return RankOfObject( Range( logic_new_func_x_2 ) );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, deduped_9_1, Target, deduped_10_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_8_1[1] ], function ( o_2 )
                return CreateCapCategoryObjectWithAttributes( deduped_10_1, RankOfObject, hoisted_1_1[o_2] - hoisted_2_1[o_2] );
            end ), LazyHList( [ 1 .. deduped_8_1[2] ], function ( m_2 )
                local deduped_1_2, deduped_2_2, deduped_3_2;
                deduped_3_2 := hoisted_4_1[m_2];
                deduped_2_2 := 1 + deduped_3_2[1];
                deduped_1_2 := 1 + deduped_3_2[2];
                return CreateCapCategoryMorphismWithAttributes( deduped_10_1, CreateCapCategoryObjectWithAttributes( deduped_10_1, RankOfObject, deduped_5_1[deduped_1_2] ), CreateCapCategoryObjectWithAttributes( deduped_10_1, RankOfObject, deduped_5_1[deduped_2_2] ), UnderlyingMatrix, UniqueLeftDivide( deduped_6_1[deduped_1_2], hoisted_7_1[m_2] * deduped_6_1[deduped_2_2] ) );
            end ) ) );
end
########
        
    ;
    
    ##
    AddCokernelProjectionWithGivenCokernelObject( cat,
        
########
function ( cat_1, alpha_1, P_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, deduped_4_1;
    deduped_4_1 := ValuesOnAllObjects( alpha_1 );
    deduped_3_1 := Target( cat_1 );
    hoisted_2_1 := List( deduped_4_1, function ( logic_new_func_x_2 )
            return SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_1_1 := List( deduped_4_1, Range );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Range( alpha_1 ), P_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              local morphism_attr_1_2;
              morphism_attr_1_2 := hoisted_2_1[o_2];
              return CreateCapCategoryMorphismWithAttributes( deduped_3_1, hoisted_1_1[o_2], CreateCapCategoryObjectWithAttributes( deduped_3_1, RankOfObject, NumberColumns( morphism_attr_1_2 ) ), UnderlyingMatrix, morphism_attr_1_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.CokernelProjectionWithGivenCokernelObject :=
        
########
function ( cat_1, alpha_1, P_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, hoisted_4_1, deduped_5_1;
    deduped_5_1 := ValuesOnAllObjects( alpha_1 );
    hoisted_4_1 := List( deduped_5_1, function ( logic_new_func_x_2 )
            return SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    deduped_3_1 := Target( cat_1 );
    hoisted_2_1 := List( deduped_5_1, function ( logic_new_func_x_2 )
            return NumberColumns( SyzygiesOfColumns( UnderlyingMatrix( logic_new_func_x_2 ) ) );
        end );
    hoisted_1_1 := List( deduped_5_1, Range );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Range( alpha_1 ), P_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( deduped_3_1, hoisted_1_1[o_2], CreateCapCategoryObjectWithAttributes( deduped_3_1, RankOfObject, hoisted_2_1[o_2] ), UnderlyingMatrix, hoisted_4_1[o_2] );
          end ) );
end
########
        
    ;
    
    ##
    AddColiftAlongEpimorphism( cat,
        
########
function ( cat_1, epsilon_1, tau_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := ValuesOnAllObjects( tau_1 );
    deduped_6_1 := ValuesOnAllObjects( epsilon_1 );
    hoisted_5_1 := Target( cat_1 );
    hoisted_4_1 := List( deduped_7_1, UnderlyingMatrix );
    hoisted_3_1 := List( deduped_6_1, UnderlyingMatrix );
    hoisted_2_1 := List( deduped_7_1, Range );
    hoisted_1_1 := List( deduped_6_1, Range );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Range( epsilon_1 ), Range( tau_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, UniqueLeftDivide( hoisted_3_1[o_2], hoisted_4_1[o_2] ) );
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
    hoisted_5_1 := Target( cat_1 );
    hoisted_4_1 := [ 1 .. i_1 - 1 ];
    hoisted_3_1 := List( deduped_7_1, UnderlyingMatrix );
    hoisted_2_1 := List( deduped_7_1, Range );
    hoisted_1_1 := ValuesOfPreSheaf( CAP_JIT_INCOMPLETE_LOGIC( deduped_6_1 ) )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_6_1, Range( alpha_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              local deduped_1_2, deduped_2_2;
              deduped_2_2 := List( S_1, function ( F_3 )
                      return CAP_JIT_INCOMPLETE_LOGIC( RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( F_3 )[1][o_2] ) ) );
                  end );
              deduped_1_2 := Sum( deduped_2_2{hoisted_4_1} );
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, CAP_JIT_INCOMPLETE_LOGIC( hoisted_1_1[o_2] ), hoisted_2_1[o_2], UnderlyingMatrix, CertainRows( hoisted_3_1[o_2], [ deduped_1_2 + 1 .. deduped_1_2 + deduped_2_2[i_1] ] ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.ComponentOfMorphismFromDirectSum :=
        
########
function ( cat_1, alpha_1, S_1, i_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1;
    deduped_5_1 := ValuesOnAllObjects( alpha_1 );
    hoisted_4_1 := Target( cat_1 );
    hoisted_3_1 := [ 1 .. i_1 - 1 ];
    hoisted_2_1 := List( deduped_5_1, UnderlyingMatrix );
    hoisted_1_1 := List( deduped_5_1, Range );
    return CreateCapCategoryMorphismWithAttributes( cat_1, S_1[i_1], Range( alpha_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              local deduped_1_2, deduped_2_2;
              deduped_2_2 := List( S_1, function ( F_3 )
                      return List( ValuesOfPreSheaf( F_3 )[1], RankOfObject )[o_2];
                  end );
              deduped_1_2 := Sum( deduped_2_2{hoisted_3_1} );
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, List( S_1, function ( F_3 )
                          return ValuesOfPreSheaf( F_3 )[1][o_2];
                      end )[i_1], hoisted_1_1[o_2], UnderlyingMatrix, CertainRows( hoisted_2_1[o_2], [ deduped_1_2 + 1 .. deduped_1_2 + deduped_2_2[i_1] ] ) );
          end ) );
end
########
        
    ;
    
    ##
    AddComponentOfMorphismIntoDirectSum( cat,
        
########
function ( cat_1, alpha_1, S_1, i_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := ValuesOnAllObjects( alpha_1 );
    deduped_6_1 := S_1[i_1];
    hoisted_5_1 := Target( cat_1 );
    hoisted_4_1 := [ 1 .. i_1 - 1 ];
    hoisted_2_1 := ValuesOfPreSheaf( CAP_JIT_INCOMPLETE_LOGIC( deduped_6_1 ) )[1];
    hoisted_1_1 := List( deduped_7_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), deduped_6_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              local deduped_1_2, deduped_2_2;
              deduped_2_2 := List( S_1, function ( F_3 )
                      return CAP_JIT_INCOMPLETE_LOGIC( RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( F_3 )[1][o_2] ) ) );
                  end );
              deduped_1_2 := Sum( deduped_2_2{hoisted_4_1} );
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], CAP_JIT_INCOMPLETE_LOGIC( hoisted_2_1[o_2] ), UnderlyingMatrix, CAP_JIT_INCOMPLETE_LOGIC( CertainColumns( UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( deduped_7_1[o_2] ) ), [ deduped_1_2 + 1 .. deduped_1_2 + deduped_2_2[i_1] ] ) ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.ComponentOfMorphismIntoDirectSum :=
        
########
function ( cat_1, alpha_1, S_1, i_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_4_1, deduped_5_1;
    deduped_5_1 := ValuesOnAllObjects( alpha_1 );
    hoisted_4_1 := Target( cat_1 );
    hoisted_2_1 := [ 1 .. i_1 - 1 ];
    hoisted_1_1 := List( deduped_5_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), S_1[i_1], ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              local hoisted_1_2, deduped_2_2, deduped_3_2;
              deduped_3_2 := List( S_1, function ( F_3 )
                      return List( ValuesOfPreSheaf( F_3 )[1], RankOfObject )[o_2];
                  end );
              deduped_2_2 := Sum( deduped_3_2{hoisted_2_1} );
              hoisted_1_2 := [ deduped_2_2 + 1 .. deduped_2_2 + deduped_3_2[i_1] ];
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, hoisted_1_1[o_2], List( S_1, function ( F_3 )
                          return ValuesOfPreSheaf( F_3 )[1][o_2];
                      end )[i_1], UnderlyingMatrix, List( deduped_5_1, function ( logic_new_func_x_3 )
                          return CertainColumns( UnderlyingMatrix( logic_new_func_x_3 ), hoisted_1_2 );
                      end )[o_2] );
          end ) );
end
########
        
    ;
    
    ##
    AddDirectSum( cat,
        
########
function ( cat_1, objects_1 )
    local hoisted_2_1, deduped_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := Target( cat_1 );
    deduped_4_1 := Source( cat_1 );
    deduped_3_1 := DefiningTripleOfUnderlyingQuiver( deduped_4_1 );
    hoisted_2_1 := CommutativeRingOfLinearCategory( cat_1 );
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, deduped_4_1, Target, deduped_5_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_3_1[1] ], function ( o_2 )
                return CreateCapCategoryObjectWithAttributes( deduped_5_1, RankOfObject, Sum( List( objects_1, function ( F_3 )
                            return CAP_JIT_INCOMPLETE_LOGIC( RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( F_3 )[1][o_2] ) ) );
                        end ) ) );
            end ), LazyHList( [ 1 .. deduped_3_1[2] ], function ( m_2 )
                local deduped_1_2;
                deduped_1_2 := DiagMat( hoisted_2_1, List( objects_1, function ( F_3 )
                          return CAP_JIT_INCOMPLETE_LOGIC( UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( F_3 )[2][m_2] ) ) );
                      end ) );
                return CreateCapCategoryMorphismWithAttributes( deduped_5_1, CreateCapCategoryObjectWithAttributes( deduped_5_1, RankOfObject, NumberRows( deduped_1_2 ) ), CreateCapCategoryObjectWithAttributes( deduped_5_1, RankOfObject, NumberColumns( deduped_1_2 ) ), UnderlyingMatrix, deduped_1_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.DirectSum :=
        
########
function ( cat_1, objects_1 )
    local hoisted_2_1, hoisted_3_1, deduped_4_1, deduped_5_1, deduped_6_1;
    deduped_6_1 := Target( cat_1 );
    deduped_5_1 := Source( cat_1 );
    deduped_4_1 := DefiningTripleOfUnderlyingQuiver( deduped_5_1 );
    hoisted_3_1 := CommutativeRingOfLinearCategory( cat_1 );
    hoisted_2_1 := deduped_4_1[3];
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, deduped_5_1, Target, deduped_6_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_4_1[1] ], function ( o_2 )
                return CreateCapCategoryObjectWithAttributes( deduped_6_1, RankOfObject, Sum( List( objects_1, function ( F_3 )
                            return List( ValuesOfPreSheaf( F_3 )[1], RankOfObject )[o_2];
                        end ) ) );
            end ), LazyHList( [ 1 .. deduped_4_1[2] ], function ( m_2 )
                local hoisted_1_2, hoisted_2_2, deduped_3_2;
                deduped_3_2 := hoisted_2_1[m_2];
                hoisted_2_2 := 1 + deduped_3_2[1];
                hoisted_1_2 := 1 + deduped_3_2[2];
                return CreateCapCategoryMorphismWithAttributes( deduped_6_1, CreateCapCategoryObjectWithAttributes( deduped_6_1, RankOfObject, Sum( List( objects_1, function ( F_3 )
                              return List( ValuesOfPreSheaf( F_3 )[1], RankOfObject )[hoisted_1_2];
                          end ) ) ), CreateCapCategoryObjectWithAttributes( deduped_6_1, RankOfObject, Sum( List( objects_1, function ( F_3 )
                              return List( ValuesOfPreSheaf( F_3 )[1], RankOfObject )[hoisted_2_2];
                          end ) ) ), UnderlyingMatrix, DiagMat( hoisted_3_1, List( objects_1, function ( F_3 )
                            return List( ValuesOfPreSheaf( F_3 )[2], UnderlyingMatrix )[m_2];
                        end ) ) );
            end ) ) );
end
########
        
    ;
    
    ##
    AddDirectSumFunctorialWithGivenDirectSums( cat,
        
########
function ( cat_1, P_1, objects_1, L_1, objectsp_1, Pp_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1;
    hoisted_4_1 := Target( cat_1 );
    hoisted_3_1 := CommutativeRingOfLinearCategory( cat_1 );
    hoisted_2_1 := ValuesOfPreSheaf( Pp_1 )[1];
    hoisted_1_1 := ValuesOfPreSheaf( P_1 )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Pp_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, DiagMat( hoisted_3_1, List( L_1, function ( eta_3 )
                          return CAP_JIT_INCOMPLETE_LOGIC( UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( eta_3 )[o_2] ) ) );
                      end ) ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.DirectSumFunctorialWithGivenDirectSums :=
        
########
function ( cat_1, P_1, objects_1, L_1, objectsp_1, Pp_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1;
    hoisted_4_1 := Target( cat_1 );
    hoisted_3_1 := CommutativeRingOfLinearCategory( cat_1 );
    hoisted_2_1 := ValuesOfPreSheaf( Pp_1 )[1];
    hoisted_1_1 := ValuesOfPreSheaf( P_1 )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Pp_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, DiagMat( hoisted_3_1, List( L_1, function ( eta_3 )
                          return List( ValuesOnAllObjects( eta_3 ), UnderlyingMatrix )[o_2];
                      end ) ) );
          end ) );
end
########
        
    ;
    
    ##
    AddDistinguishedObjectOfHomomorphismStructure( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( Target( cat_1 ), RankOfObject, 1 );
end
########
        
    , 100 );
    
    ##
    AddHomomorphismStructureOnMorphismsWithGivenObjects( cat,
        
########
function ( cat_1, source_1, alpha_1, beta_1, range_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, deduped_4_1, deduped_6_1, deduped_7_1, hoisted_8_1, hoisted_10_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, deduped_17_1, deduped_18_1, hoisted_19_1, hoisted_20_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1;
    deduped_39_1 := Source( cat_1 );
    deduped_38_1 := CommutativeRingOfLinearCategory( cat_1 );
    deduped_37_1 := Target( cat_1 );
    deduped_36_1 := ValuesOfPreSheaf( Target( beta_1 ) );
    deduped_35_1 := ValuesOfPreSheaf( Source( alpha_1 ) );
    deduped_34_1 := ValuesOfPreSheaf( Source( beta_1 ) );
    deduped_33_1 := ValuesOfPreSheaf( Target( alpha_1 ) );
    deduped_32_1 := SetOfObjectsAsUnresolvableAttribute( deduped_39_1 );
    deduped_31_1 := SetOfGeneratingMorphismsAsUnresolvableAttribute( deduped_39_1 );
    deduped_30_1 := deduped_36_1[2];
    deduped_29_1 := deduped_35_1[2];
    deduped_28_1 := deduped_34_1[2];
    deduped_27_1 := deduped_33_1[2];
    deduped_26_1 := [ 1 .. Length( deduped_32_1 ) ];
    deduped_25_1 := [ 1 .. Length( deduped_31_1 ) ];
    hoisted_16_1 := List( deduped_30_1, function ( logic_new_func_x_2 )
            return RankOfObject( Target( logic_new_func_x_2 ) );
        end );
    hoisted_15_1 := List( deduped_29_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    deduped_24_1 := List( deduped_25_1, function ( i_2 )
            return hoisted_15_1[i_2] * hoisted_16_1[i_2];
        end );
    hoisted_2_1 := List( deduped_28_1, function ( logic_new_func_x_2 )
            return RankOfObject( Target( logic_new_func_x_2 ) );
        end );
    hoisted_1_1 := List( deduped_27_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    deduped_23_1 := List( deduped_25_1, function ( i_2 )
            return hoisted_1_1[i_2] * hoisted_2_1[i_2];
        end );
    hoisted_20_1 := List( deduped_30_1, UnderlyingMatrix );
    hoisted_19_1 := List( deduped_29_1, function ( logic_new_func_x_2 )
            return TransposedMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    deduped_18_1 := List( deduped_36_1[1], RankOfObject );
    deduped_17_1 := List( deduped_35_1[1], RankOfObject );
    hoisted_14_1 := List( ValuesOnAllObjects( beta_1 ), UnderlyingMatrix );
    hoisted_13_1 := List( ValuesOnAllObjects( alpha_1 ), function ( logic_new_func_x_2 )
            return TransposedMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_10_1 := List( deduped_28_1, UnderlyingMatrix );
    hoisted_8_1 := List( deduped_27_1, function ( logic_new_func_x_2 )
            return TransposedMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    deduped_7_1 := List( deduped_31_1, Target );
    deduped_6_1 := List( deduped_31_1, Source );
    deduped_4_1 := List( deduped_34_1[1], RankOfObject );
    deduped_3_1 := List( deduped_33_1[1], RankOfObject );
    deduped_22_1 := UniqueRightDivide( SyzygiesOfRows( UnionOfRows( deduped_38_1, Sum( deduped_23_1 ), List( deduped_26_1, function ( i_2 )
                    local deduped_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
                    deduped_7_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
                    deduped_6_2 := deduped_4_1[i_2];
                    deduped_5_2 := deduped_3_1[i_2];
                    hoisted_4_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_3_1[deduped_7_2] * deduped_4_1[deduped_7_2] );
                    hoisted_3_2 := TransposedMatrix( HomalgIdentityMatrix( deduped_5_2, deduped_38_1 ) );
                    hoisted_2_2 := HomalgIdentityMatrix( deduped_6_2, deduped_38_1 );
                    deduped_1_2 := deduped_32_1[i_2];
                    return UnionOfColumns( deduped_38_1, deduped_5_2 * deduped_6_2, List( deduped_25_1, function ( j_3 )
                              local deduped_1_3, deduped_2_3, deduped_3_3, deduped_4_3;
                              deduped_4_3 := (deduped_1_2 = deduped_7_1[j_3]);
                              deduped_3_3 := (deduped_1_2 = deduped_6_1[j_3]);
                              deduped_2_3 := KroneckerMat( hoisted_8_1[j_3], hoisted_2_2 );
                              deduped_1_3 := (- KroneckerMat( hoisted_3_2, hoisted_10_1[j_3] ));
                              if (deduped_3_3 and deduped_4_3) then
                                  return (deduped_2_3 + deduped_1_3);
                              elif (not deduped_3_3 and deduped_4_3) then
                                  return deduped_1_3;
                              elif (deduped_3_3 and not deduped_4_3) then
                                  return deduped_2_3;
                              else
                                  return HomalgZeroMatrix( hoisted_4_2, deduped_23_1[j_3], deduped_38_1 );
                              fi;
                              return;
                          end ) );
                end ) ) ) * DiagMat( deduped_38_1, List( deduped_26_1, function ( i_2 )
                  return KroneckerMat( hoisted_13_1[i_2], hoisted_14_1[i_2] );
              end ) ), SyzygiesOfRows( UnionOfRows( deduped_38_1, Sum( deduped_24_1 ), List( deduped_26_1, function ( i_2 )
                  local deduped_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
                  deduped_7_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
                  deduped_6_2 := deduped_18_1[i_2];
                  deduped_5_2 := deduped_17_1[i_2];
                  hoisted_4_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_17_1[deduped_7_2] * deduped_18_1[deduped_7_2] );
                  hoisted_3_2 := TransposedMatrix( HomalgIdentityMatrix( deduped_5_2, deduped_38_1 ) );
                  hoisted_2_2 := HomalgIdentityMatrix( deduped_6_2, deduped_38_1 );
                  deduped_1_2 := deduped_32_1[i_2];
                  return UnionOfColumns( deduped_38_1, deduped_5_2 * deduped_6_2, List( deduped_25_1, function ( j_3 )
                            local deduped_1_3, deduped_2_3, deduped_3_3, deduped_4_3;
                            deduped_4_3 := deduped_1_2 = deduped_7_1[j_3];
                            deduped_3_3 := deduped_1_2 = deduped_6_1[j_3];
                            deduped_2_3 := KroneckerMat( hoisted_19_1[j_3], hoisted_2_2 );
                            deduped_1_3 := - KroneckerMat( hoisted_3_2, hoisted_20_1[j_3] );
                            if deduped_3_3 and deduped_4_3 then
                                return deduped_2_3 + deduped_1_3;
                            elif not deduped_3_3 and deduped_4_3 then
                                return deduped_1_3;
                            elif deduped_3_3 and not deduped_4_3 then
                                return deduped_2_3;
                            else
                                return HomalgZeroMatrix( hoisted_4_2, deduped_24_1[j_3], deduped_38_1 );
                            fi;
                            return;
                        end ) );
              end ) ) ) );
    return CreateCapCategoryMorphismWithAttributes( deduped_37_1, CreateCapCategoryObjectWithAttributes( deduped_37_1, RankOfObject, NumberRows( deduped_22_1 ) ), CreateCapCategoryObjectWithAttributes( deduped_37_1, RankOfObject, NumberColumns( deduped_22_1 ) ), UnderlyingMatrix, deduped_22_1 );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.HomomorphismStructureOnMorphismsWithGivenObjects :=
        
########
function ( cat_1, source_1, alpha_1, beta_1, range_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, deduped_4_1, deduped_6_1, deduped_7_1, hoisted_8_1, hoisted_10_1, hoisted_11_1, hoisted_14_1, hoisted_15_1, deduped_16_1, deduped_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_22_1, hoisted_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1;
    deduped_42_1 := Source( cat_1 );
    deduped_41_1 := CommutativeRingOfLinearCategory( cat_1 );
    deduped_40_1 := Target( cat_1 );
    deduped_39_1 := ValuesOfPreSheaf( Target( beta_1 ) );
    deduped_38_1 := ValuesOfPreSheaf( Source( alpha_1 ) );
    deduped_37_1 := ValuesOfPreSheaf( Source( beta_1 ) );
    deduped_36_1 := ValuesOfPreSheaf( Target( alpha_1 ) );
    deduped_35_1 := SetOfObjectsAsUnresolvableAttribute( deduped_42_1 );
    deduped_34_1 := SetOfGeneratingMorphismsAsUnresolvableAttribute( deduped_42_1 );
    deduped_33_1 := deduped_39_1[2];
    deduped_32_1 := deduped_38_1[2];
    deduped_31_1 := deduped_37_1[2];
    deduped_30_1 := deduped_36_1[2];
    deduped_29_1 := [ 1 .. Length( deduped_35_1 ) ];
    deduped_28_1 := [ 1 .. Length( deduped_34_1 ) ];
    hoisted_15_1 := List( deduped_33_1, function ( logic_new_func_x_2 )
            return RankOfObject( Target( logic_new_func_x_2 ) );
        end );
    hoisted_14_1 := List( deduped_32_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    deduped_27_1 := List( deduped_28_1, function ( i_2 )
            return hoisted_14_1[i_2] * hoisted_15_1[i_2];
        end );
    hoisted_2_1 := List( deduped_31_1, function ( logic_new_func_x_2 )
            return RankOfObject( Target( logic_new_func_x_2 ) );
        end );
    hoisted_1_1 := List( deduped_30_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    deduped_26_1 := List( deduped_28_1, function ( i_2 )
            return hoisted_1_1[i_2] * hoisted_2_1[i_2];
        end );
    deduped_17_1 := List( deduped_39_1[1], RankOfObject );
    deduped_16_1 := List( deduped_38_1[1], RankOfObject );
    hoisted_20_1 := List( deduped_29_1, function ( i_2 )
            return deduped_16_1[i_2] * deduped_17_1[i_2];
        end );
    hoisted_19_1 := List( deduped_33_1, UnderlyingMatrix );
    hoisted_18_1 := List( deduped_32_1, function ( logic_new_func_x_2 )
            return TransposedMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    deduped_7_1 := List( deduped_34_1, Target );
    deduped_6_1 := List( deduped_34_1, Source );
    deduped_25_1 := SyzygiesOfRows( UnionOfRows( deduped_41_1, Sum( deduped_27_1 ), List( deduped_29_1, function ( i_2 )
                local deduped_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2, deduped_6_2;
                deduped_6_2 := deduped_17_1[i_2];
                deduped_5_2 := deduped_16_1[i_2];
                hoisted_4_2 := hoisted_20_1[i_2];
                hoisted_3_2 := TransposedMatrix( HomalgIdentityMatrix( deduped_5_2, deduped_41_1 ) );
                hoisted_2_2 := HomalgIdentityMatrix( deduped_6_2, deduped_41_1 );
                deduped_1_2 := deduped_35_1[i_2];
                return UnionOfColumns( deduped_41_1, deduped_5_2 * deduped_6_2, List( deduped_28_1, function ( j_3 )
                          local deduped_1_3, deduped_2_3, deduped_3_3, deduped_4_3;
                          deduped_4_3 := deduped_1_2 = deduped_7_1[j_3];
                          deduped_3_3 := deduped_1_2 = deduped_6_1[j_3];
                          deduped_2_3 := KroneckerMat( hoisted_18_1[j_3], hoisted_2_2 );
                          deduped_1_3 := - KroneckerMat( hoisted_3_2, hoisted_19_1[j_3] );
                          if deduped_3_3 and deduped_4_3 then
                              return deduped_2_3 + deduped_1_3;
                          elif not deduped_3_3 and deduped_4_3 then
                              return deduped_1_3;
                          elif deduped_3_3 and not deduped_4_3 then
                              return deduped_2_3;
                          else
                              return HomalgZeroMatrix( hoisted_4_2, deduped_27_1[j_3], deduped_41_1 );
                          fi;
                          return;
                      end ) );
            end ) ) );
    deduped_4_1 := List( deduped_37_1[1], RankOfObject );
    deduped_3_1 := List( deduped_36_1[1], RankOfObject );
    hoisted_11_1 := List( deduped_29_1, function ( i_2 )
            return deduped_3_1[i_2] * deduped_4_1[i_2];
        end );
    hoisted_10_1 := List( deduped_31_1, UnderlyingMatrix );
    hoisted_8_1 := List( deduped_30_1, function ( logic_new_func_x_2 )
            return TransposedMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    deduped_24_1 := SyzygiesOfRows( UnionOfRows( deduped_41_1, Sum( deduped_26_1 ), List( deduped_29_1, function ( i_2 )
                local deduped_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2, deduped_6_2;
                deduped_6_2 := deduped_4_1[i_2];
                deduped_5_2 := deduped_3_1[i_2];
                hoisted_4_2 := hoisted_11_1[i_2];
                hoisted_3_2 := TransposedMatrix( HomalgIdentityMatrix( deduped_5_2, deduped_41_1 ) );
                hoisted_2_2 := HomalgIdentityMatrix( deduped_6_2, deduped_41_1 );
                deduped_1_2 := deduped_35_1[i_2];
                return UnionOfColumns( deduped_41_1, deduped_5_2 * deduped_6_2, List( deduped_28_1, function ( j_3 )
                          local deduped_1_3, deduped_2_3, deduped_3_3, deduped_4_3;
                          deduped_4_3 := deduped_1_2 = deduped_7_1[j_3];
                          deduped_3_3 := deduped_1_2 = deduped_6_1[j_3];
                          deduped_2_3 := KroneckerMat( hoisted_8_1[j_3], hoisted_2_2 );
                          deduped_1_3 := - KroneckerMat( hoisted_3_2, hoisted_10_1[j_3] );
                          if deduped_3_3 and deduped_4_3 then
                              return deduped_2_3 + deduped_1_3;
                          elif not deduped_3_3 and deduped_4_3 then
                              return deduped_1_3;
                          elif deduped_3_3 and not deduped_4_3 then
                              return deduped_2_3;
                          else
                              return HomalgZeroMatrix( hoisted_4_2, deduped_26_1[j_3], deduped_41_1 );
                          fi;
                          return;
                      end ) );
            end ) ) );
    hoisted_23_1 := List( ValuesOnAllObjects( beta_1 ), UnderlyingMatrix );
    hoisted_22_1 := List( ValuesOnAllObjects( alpha_1 ), function ( logic_new_func_x_2 )
            return TransposedMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( deduped_40_1, CreateCapCategoryObjectWithAttributes( deduped_40_1, RankOfObject, NumberRows( deduped_24_1 ) ), CreateCapCategoryObjectWithAttributes( deduped_40_1, RankOfObject, NumberRows( deduped_25_1 ) ), UnderlyingMatrix, UniqueRightDivide( deduped_24_1 * DiagMat( deduped_41_1, List( deduped_29_1, function ( i_2 )
                    return KroneckerMat( hoisted_22_1[i_2], hoisted_23_1[i_2] );
                end ) ), deduped_25_1 ) );
end
########
        
    ;
    
    ##
    AddHomomorphismStructureOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1, hoisted_3_1, hoisted_4_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_10_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1;
    deduped_25_1 := ValuesOfPreSheaf( arg3_1 );
    deduped_24_1 := ValuesOfPreSheaf( arg2_1 );
    deduped_23_1 := CommutativeRingOfLinearCategory( cat_1 );
    deduped_22_1 := Source( cat_1 );
    deduped_21_1 := deduped_25_1[2];
    deduped_20_1 := deduped_24_1[2];
    deduped_19_1 := SetOfGeneratingMorphismsAsUnresolvableAttribute( deduped_22_1 );
    deduped_18_1 := SetOfObjectsAsUnresolvableAttribute( deduped_22_1 );
    deduped_17_1 := [ 1 .. Length( deduped_19_1 ) ];
    deduped_16_1 := [ 1 .. Length( deduped_18_1 ) ];
    hoisted_4_1 := List( deduped_21_1, function ( logic_new_func_x_2 )
            return RankOfObject( Target( logic_new_func_x_2 ) );
        end );
    hoisted_3_1 := List( deduped_20_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    deduped_15_1 := List( deduped_17_1, function ( i_2 )
            return hoisted_3_1[i_2] * hoisted_4_1[i_2];
        end );
    deduped_2_1 := List( deduped_25_1[1], RankOfObject );
    deduped_1_1 := List( deduped_24_1[1], RankOfObject );
    deduped_14_1 := List( deduped_16_1, function ( i_2 )
            return deduped_1_1[i_2] * deduped_2_1[i_2];
        end );
    hoisted_10_1 := List( deduped_21_1, UnderlyingMatrix );
    hoisted_8_1 := List( deduped_20_1, function ( logic_new_func_x_2 )
            return TransposedMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_7_1 := List( deduped_19_1, Target );
    hoisted_6_1 := List( deduped_19_1, Source );
    return CreateCapCategoryObjectWithAttributes( Target( cat_1 ), RankOfObject, Sum( deduped_14_1 ) - RowRankOfMatrix( UnionOfRows( deduped_23_1, Sum( deduped_15_1 ), List( deduped_16_1, function ( i_2 )
                    local deduped_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2, deduped_6_2;
                    deduped_6_2 := deduped_2_1[i_2];
                    deduped_5_2 := deduped_1_1[i_2];
                    hoisted_4_2 := deduped_14_1[i_2];
                    hoisted_3_2 := TransposedMatrix( HomalgIdentityMatrix( deduped_5_2, deduped_23_1 ) );
                    hoisted_2_2 := HomalgIdentityMatrix( deduped_6_2, deduped_23_1 );
                    deduped_1_2 := deduped_18_1[i_2];
                    return UnionOfColumns( deduped_23_1, deduped_5_2 * deduped_6_2, List( deduped_17_1, function ( j_3 )
                              local deduped_1_3, deduped_2_3, deduped_3_3, deduped_4_3;
                              deduped_4_3 := (deduped_1_2 = hoisted_7_1[j_3]);
                              deduped_3_3 := (deduped_1_2 = hoisted_6_1[j_3]);
                              deduped_2_3 := KroneckerMat( hoisted_8_1[j_3], hoisted_2_2 );
                              deduped_1_3 := (- KroneckerMat( hoisted_3_2, hoisted_10_1[j_3] ));
                              if (deduped_3_3 and deduped_4_3) then
                                  return (deduped_2_3 + deduped_1_3);
                              elif (not deduped_3_3 and deduped_4_3) then
                                  return deduped_1_3;
                              elif (deduped_3_3 and not deduped_4_3) then
                                  return deduped_2_3;
                              else
                                  return HomalgZeroMatrix( hoisted_4_2, deduped_15_1[j_3], deduped_23_1 );
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
    local hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1;
    deduped_5_1 := ValuesOfPreSheaf( a_1 )[1];
    hoisted_4_1 := Target( cat_1 );
    hoisted_3_1 := CommutativeRingOfLinearCategory( cat_1 );
    hoisted_2_1 := List( deduped_5_1, RankOfObject );
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              local deduped_1_2;
              deduped_1_2 := deduped_5_1[o_2];
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, deduped_1_2, deduped_1_2, UnderlyingMatrix, HomalgIdentityMatrix( hoisted_2_1[o_2], hoisted_3_1 ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddImageEmbeddingWithGivenImageObject( cat,
        
########
function ( cat_1, alpha_1, I_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1;
    deduped_5_1 := ValuesOnAllObjects( alpha_1 );
    hoisted_4_1 := Target( cat_1 );
    hoisted_3_1 := List( deduped_5_1, function ( logic_new_func_x_2 )
            return BasisOfRows( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_2_1 := List( deduped_5_1, Range );
    hoisted_1_1 := ValuesOfPreSheaf( I_1 )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, I_1, Range( alpha_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, hoisted_3_1[o_2] );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddImageObject( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, hoisted_3_1, deduped_4_1, hoisted_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := ValuesOnAllObjects( arg2_1 );
    deduped_8_1 := Target( cat_1 );
    deduped_7_1 := Source( cat_1 );
    deduped_6_1 := DefiningTripleOfUnderlyingQuiver( deduped_7_1 );
    hoisted_5_1 := List( ValuesOfPreSheaf( Target( arg2_1 ) )[2], UnderlyingMatrix );
    deduped_4_1 := List( deduped_9_1, function ( logic_new_func_x_2 )
            return BasisOfRows( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_3_1 := deduped_6_1[3];
    hoisted_1_1 := List( deduped_9_1, function ( logic_new_func_x_2 )
            return RowRankOfMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, deduped_7_1, Target, deduped_8_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_6_1[1] ], function ( o_2 )
                return CreateCapCategoryObjectWithAttributes( deduped_8_1, RankOfObject, hoisted_1_1[o_2] );
            end ), LazyHList( [ 1 .. deduped_6_1[2] ], function ( m_2 )
                local morphism_attr_1_2, deduped_2_2;
                deduped_2_2 := hoisted_3_1[m_2];
                morphism_attr_1_2 := UniqueRightDivide( deduped_4_1[(1 + deduped_2_2[2])] * hoisted_5_1[m_2], deduped_4_1[1 + deduped_2_2[1]] );
                return CreateCapCategoryMorphismWithAttributes( deduped_8_1, CreateCapCategoryObjectWithAttributes( deduped_8_1, RankOfObject, NumberRows( morphism_attr_1_2 ) ), CreateCapCategoryObjectWithAttributes( deduped_8_1, RankOfObject, NumberColumns( morphism_attr_1_2 ) ), UnderlyingMatrix, morphism_attr_1_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.ImageObject :=
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1, hoisted_3_1, deduped_4_1, hoisted_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := ValuesOnAllObjects( arg2_1 );
    deduped_8_1 := Target( cat_1 );
    deduped_7_1 := Source( cat_1 );
    deduped_6_1 := DefiningTripleOfUnderlyingQuiver( deduped_7_1 );
    hoisted_5_1 := List( ValuesOfPreSheaf( Target( arg2_1 ) )[2], UnderlyingMatrix );
    deduped_4_1 := List( deduped_9_1, function ( logic_new_func_x_2 )
            return BasisOfRows( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_3_1 := deduped_6_1[3];
    deduped_1_1 := List( deduped_9_1, function ( logic_new_func_x_2 )
            return RowRankOfMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, deduped_7_1, Target, deduped_8_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_6_1[1] ], function ( o_2 )
                return CreateCapCategoryObjectWithAttributes( deduped_8_1, RankOfObject, deduped_1_1[o_2] );
            end ), LazyHList( [ 1 .. deduped_6_1[2] ], function ( m_2 )
                local deduped_1_2, deduped_2_2, deduped_3_2;
                deduped_3_2 := hoisted_3_1[m_2];
                deduped_2_2 := 1 + deduped_3_2[1];
                deduped_1_2 := 1 + deduped_3_2[2];
                return CreateCapCategoryMorphismWithAttributes( deduped_8_1, CreateCapCategoryObjectWithAttributes( deduped_8_1, RankOfObject, deduped_1_1[deduped_1_2] ), CreateCapCategoryObjectWithAttributes( deduped_8_1, RankOfObject, deduped_1_1[deduped_2_2] ), UnderlyingMatrix, UniqueRightDivide( deduped_4_1[deduped_1_2] * hoisted_5_1[m_2], deduped_4_1[deduped_2_2] ) );
            end ) ) );
end
########
        
    ;
    
    ##
    AddInjectionOfCofactorOfDirectSumWithGivenDirectSum( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1;
    deduped_7_1 := objects_1[k_1];
    hoisted_6_1 := Target( cat_1 );
    hoisted_5_1 := [ k_1 + 1 .. Length( objects_1 ) ];
    deduped_4_1 := CommutativeRingOfLinearCategory( cat_1 );
    hoisted_3_1 := [ 1 .. k_1 - 1 ];
    hoisted_2_1 := ValuesOfPreSheaf( P_1 )[1];
    hoisted_1_1 := ValuesOfPreSheaf( CAP_JIT_INCOMPLETE_LOGIC( deduped_7_1 ) )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_7_1, P_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              local deduped_1_2, deduped_2_2;
              deduped_2_2 := List( objects_1, function ( F_3 )
                      return CAP_JIT_INCOMPLETE_LOGIC( RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( F_3 )[1][o_2] ) ) );
                  end );
              deduped_1_2 := deduped_2_2[k_1];
              return CreateCapCategoryMorphismWithAttributes( hoisted_6_1, CAP_JIT_INCOMPLETE_LOGIC( hoisted_1_1[o_2] ), hoisted_2_1[o_2], UnderlyingMatrix, UnionOfColumns( deduped_4_1, deduped_1_2, [ HomalgZeroMatrix( deduped_1_2, Sum( deduped_2_2{hoisted_3_1} ), deduped_4_1 ), HomalgIdentityMatrix( deduped_1_2, deduped_4_1 ), HomalgZeroMatrix( deduped_1_2, Sum( deduped_2_2{hoisted_5_1} ), deduped_4_1 ) ] ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.InjectionOfCofactorOfDirectSumWithGivenDirectSum :=
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, hoisted_4_1, hoisted_5_1;
    hoisted_5_1 := Target( cat_1 );
    hoisted_4_1 := [ k_1 + 1 .. Length( objects_1 ) ];
    deduped_3_1 := CommutativeRingOfLinearCategory( cat_1 );
    hoisted_2_1 := [ 1 .. k_1 - 1 ];
    hoisted_1_1 := ValuesOfPreSheaf( P_1 )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, objects_1[k_1], P_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              local deduped_1_2, deduped_2_2;
              deduped_2_2 := List( objects_1, function ( F_3 )
                      return List( ValuesOfPreSheaf( F_3 )[1], RankOfObject )[o_2];
                  end );
              deduped_1_2 := deduped_2_2[k_1];
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, List( objects_1, function ( F_3 )
                          return ValuesOfPreSheaf( F_3 )[1][o_2];
                      end )[k_1], hoisted_1_1[o_2], UnderlyingMatrix, UnionOfColumns( deduped_3_1, deduped_1_2, [ HomalgZeroMatrix( deduped_1_2, Sum( deduped_2_2{hoisted_2_1} ), deduped_3_1 ), HomalgIdentityMatrix( deduped_1_2, deduped_3_1 ), HomalgZeroMatrix( deduped_1_2, Sum( deduped_2_2{hoisted_4_1} ), deduped_3_1 ) ] ) );
          end ) );
end
########
        
    ;
    
    ##
    AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( cat,
        
########
function ( cat_1, alpha_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, deduped_4_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_10_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1;
    deduped_24_1 := Source( cat_1 );
    deduped_23_1 := CommutativeRingOfLinearCategory( cat_1 );
    deduped_22_1 := Target( cat_1 );
    deduped_21_1 := ValuesOfPreSheaf( Target( alpha_1 ) );
    deduped_20_1 := ValuesOfPreSheaf( Source( alpha_1 ) );
    deduped_19_1 := SetOfObjectsAsUnresolvableAttribute( deduped_24_1 );
    deduped_18_1 := SetOfGeneratingMorphismsAsUnresolvableAttribute( deduped_24_1 );
    deduped_17_1 := deduped_21_1[2];
    deduped_16_1 := deduped_20_1[2];
    deduped_15_1 := [ 1 .. Length( deduped_18_1 ) ];
    hoisted_2_1 := List( deduped_17_1, function ( logic_new_func_x_2 )
            return RankOfObject( Target( logic_new_func_x_2 ) );
        end );
    hoisted_1_1 := List( deduped_16_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    deduped_14_1 := List( deduped_15_1, function ( i_2 )
            return hoisted_1_1[i_2] * hoisted_2_1[i_2];
        end );
    hoisted_10_1 := List( deduped_17_1, UnderlyingMatrix );
    hoisted_8_1 := List( deduped_16_1, function ( logic_new_func_x_2 )
            return TransposedMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_7_1 := List( deduped_18_1, Target );
    hoisted_6_1 := List( deduped_18_1, Source );
    deduped_4_1 := List( deduped_21_1[1], RankOfObject );
    deduped_3_1 := List( deduped_20_1[1], RankOfObject );
    deduped_13_1 := UniqueRightDivide( UnionOfColumns( deduped_23_1, 1, List( ListOfValues( ValuesOnAllObjects( alpha_1 ) ), function ( eta_o_2 )
                return ConvertMatrixToRow( UnderlyingMatrix( eta_o_2 ) );
            end ) ), SyzygiesOfRows( UnionOfRows( deduped_23_1, Sum( deduped_14_1 ), List( [ 1 .. Length( deduped_19_1 ) ], function ( i_2 )
                  local deduped_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
                  deduped_7_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
                  deduped_6_2 := deduped_4_1[i_2];
                  deduped_5_2 := deduped_3_1[i_2];
                  hoisted_4_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_3_1[deduped_7_2] * deduped_4_1[deduped_7_2] );
                  hoisted_3_2 := TransposedMatrix( HomalgIdentityMatrix( deduped_5_2, deduped_23_1 ) );
                  hoisted_2_2 := HomalgIdentityMatrix( deduped_6_2, deduped_23_1 );
                  deduped_1_2 := deduped_19_1[i_2];
                  return UnionOfColumns( deduped_23_1, deduped_5_2 * deduped_6_2, List( deduped_15_1, function ( j_3 )
                            local deduped_1_3, deduped_2_3, deduped_3_3, deduped_4_3;
                            deduped_4_3 := deduped_1_2 = hoisted_7_1[j_3];
                            deduped_3_3 := deduped_1_2 = hoisted_6_1[j_3];
                            deduped_2_3 := KroneckerMat( hoisted_8_1[j_3], hoisted_2_2 );
                            deduped_1_3 := - KroneckerMat( hoisted_3_2, hoisted_10_1[j_3] );
                            if deduped_3_3 and deduped_4_3 then
                                return deduped_2_3 + deduped_1_3;
                            elif not deduped_3_3 and deduped_4_3 then
                                return deduped_1_3;
                            elif deduped_3_3 and not deduped_4_3 then
                                return deduped_2_3;
                            else
                                return HomalgZeroMatrix( hoisted_4_2, deduped_14_1[j_3], deduped_23_1 );
                            fi;
                            return;
                        end ) );
              end ) ) ) );
    return CreateCapCategoryMorphismWithAttributes( deduped_22_1, CreateCapCategoryObjectWithAttributes( deduped_22_1, RankOfObject, 1 ), CreateCapCategoryObjectWithAttributes( deduped_22_1, RankOfObject, NumberColumns( deduped_13_1 ) ), UnderlyingMatrix, deduped_13_1 );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure :=
        
########
function ( cat_1, alpha_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, deduped_4_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_10_1, hoisted_11_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1;
    deduped_26_1 := Source( cat_1 );
    deduped_25_1 := CommutativeRingOfLinearCategory( cat_1 );
    deduped_24_1 := Target( cat_1 );
    deduped_23_1 := ValuesOfPreSheaf( Target( alpha_1 ) );
    deduped_22_1 := ValuesOfPreSheaf( Source( alpha_1 ) );
    deduped_21_1 := SetOfObjectsAsUnresolvableAttribute( deduped_26_1 );
    deduped_20_1 := SetOfGeneratingMorphismsAsUnresolvableAttribute( deduped_26_1 );
    deduped_19_1 := deduped_23_1[2];
    deduped_18_1 := deduped_22_1[2];
    deduped_17_1 := [ 1 .. Length( deduped_21_1 ) ];
    deduped_16_1 := [ 1 .. Length( deduped_20_1 ) ];
    hoisted_2_1 := List( deduped_19_1, function ( logic_new_func_x_2 )
            return RankOfObject( Target( logic_new_func_x_2 ) );
        end );
    hoisted_1_1 := List( deduped_18_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    deduped_15_1 := List( deduped_16_1, function ( i_2 )
            return hoisted_1_1[i_2] * hoisted_2_1[i_2];
        end );
    deduped_4_1 := List( deduped_23_1[1], RankOfObject );
    deduped_3_1 := List( deduped_22_1[1], RankOfObject );
    hoisted_11_1 := List( deduped_17_1, function ( i_2 )
            return deduped_3_1[i_2] * deduped_4_1[i_2];
        end );
    hoisted_10_1 := List( deduped_19_1, UnderlyingMatrix );
    hoisted_8_1 := List( deduped_18_1, function ( logic_new_func_x_2 )
            return TransposedMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_7_1 := List( deduped_20_1, Target );
    hoisted_6_1 := List( deduped_20_1, Source );
    deduped_14_1 := SyzygiesOfRows( UnionOfRows( deduped_25_1, Sum( deduped_15_1 ), List( deduped_17_1, function ( i_2 )
                local deduped_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2, deduped_6_2;
                deduped_6_2 := deduped_4_1[i_2];
                deduped_5_2 := deduped_3_1[i_2];
                hoisted_4_2 := hoisted_11_1[i_2];
                hoisted_3_2 := TransposedMatrix( HomalgIdentityMatrix( deduped_5_2, deduped_25_1 ) );
                hoisted_2_2 := HomalgIdentityMatrix( deduped_6_2, deduped_25_1 );
                deduped_1_2 := deduped_21_1[i_2];
                return UnionOfColumns( deduped_25_1, deduped_5_2 * deduped_6_2, List( deduped_16_1, function ( j_3 )
                          local deduped_1_3, deduped_2_3, deduped_3_3, deduped_4_3;
                          deduped_4_3 := deduped_1_2 = hoisted_7_1[j_3];
                          deduped_3_3 := deduped_1_2 = hoisted_6_1[j_3];
                          deduped_2_3 := KroneckerMat( hoisted_8_1[j_3], hoisted_2_2 );
                          deduped_1_3 := - KroneckerMat( hoisted_3_2, hoisted_10_1[j_3] );
                          if deduped_3_3 and deduped_4_3 then
                              return deduped_2_3 + deduped_1_3;
                          elif not deduped_3_3 and deduped_4_3 then
                              return deduped_1_3;
                          elif deduped_3_3 and not deduped_4_3 then
                              return deduped_2_3;
                          else
                              return HomalgZeroMatrix( hoisted_4_2, deduped_15_1[j_3], deduped_25_1 );
                          fi;
                          return;
                      end ) );
            end ) ) );
    return CreateCapCategoryMorphismWithAttributes( deduped_24_1, CreateCapCategoryObjectWithAttributes( deduped_24_1, RankOfObject, 1 ), CreateCapCategoryObjectWithAttributes( deduped_24_1, RankOfObject, NumberRows( deduped_14_1 ) ), UnderlyingMatrix, UniqueRightDivide( UnionOfColumns( deduped_25_1, 1, List( ListOfValues( ValuesOnAllObjects( alpha_1 ) ), function ( eta_o_2 )
                  return ConvertMatrixToRow( UnderlyingMatrix( eta_o_2 ) );
              end ) ), deduped_14_1 ) );
end
########
        
    ;
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_12_1, deduped_13_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1;
    deduped_33_1 := CommutativeRingOfLinearCategory( cat_1 );
    deduped_32_1 := ValuesOfPreSheaf( range_1 );
    deduped_31_1 := ValuesOfPreSheaf( source_1 );
    deduped_30_1 := Source( cat_1 );
    deduped_29_1 := SetOfGeneratingMorphismsAsUnresolvableAttribute( deduped_30_1 );
    deduped_28_1 := deduped_32_1[2];
    deduped_27_1 := deduped_31_1[2];
    deduped_26_1 := deduped_32_1[1];
    deduped_25_1 := deduped_31_1[1];
    deduped_24_1 := SetOfObjectsAsUnresolvableAttribute( deduped_30_1 );
    deduped_23_1 := Length( deduped_24_1 );
    deduped_22_1 := [ 1 .. Length( deduped_29_1 ) ];
    deduped_21_1 := [ 1 .. deduped_23_1 ];
    hoisted_4_1 := List( deduped_28_1, function ( logic_new_func_x_2 )
            return RankOfObject( Target( logic_new_func_x_2 ) );
        end );
    hoisted_3_1 := List( deduped_27_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    deduped_20_1 := List( deduped_22_1, function ( i_2 )
            return hoisted_3_1[i_2] * hoisted_4_1[i_2];
        end );
    hoisted_19_1 := Target( cat_1 );
    deduped_6_1 := List( deduped_26_1, RankOfObject );
    deduped_5_1 := List( deduped_25_1, RankOfObject );
    deduped_13_1 := List( deduped_21_1, function ( i_2 )
            return deduped_5_1[i_2] * deduped_6_1[i_2];
        end );
    hoisted_12_1 := List( deduped_28_1, UnderlyingMatrix );
    hoisted_10_1 := List( deduped_27_1, function ( logic_new_func_x_2 )
            return TransposedMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_9_1 := List( deduped_29_1, Target );
    hoisted_8_1 := List( deduped_29_1, Source );
    hoisted_17_1 := UnderlyingMatrix( alpha_1 ) * SyzygiesOfRows( UnionOfRows( deduped_33_1, Sum( deduped_20_1 ), List( deduped_21_1, function ( i_2 )
                  local deduped_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2, deduped_6_2;
                  deduped_6_2 := deduped_6_1[i_2];
                  deduped_5_2 := deduped_5_1[i_2];
                  hoisted_4_2 := deduped_13_1[i_2];
                  hoisted_3_2 := TransposedMatrix( HomalgIdentityMatrix( deduped_5_2, deduped_33_1 ) );
                  hoisted_2_2 := HomalgIdentityMatrix( deduped_6_2, deduped_33_1 );
                  deduped_1_2 := deduped_24_1[i_2];
                  return UnionOfColumns( deduped_33_1, (deduped_5_2 * deduped_6_2), List( deduped_22_1, function ( j_3 )
                            local deduped_1_3, deduped_2_3, deduped_3_3, deduped_4_3;
                            deduped_4_3 := (deduped_1_2 = hoisted_9_1[j_3]);
                            deduped_3_3 := (deduped_1_2 = hoisted_8_1[j_3]);
                            deduped_2_3 := KroneckerMat( hoisted_10_1[j_3], hoisted_2_2 );
                            deduped_1_3 := (- KroneckerMat( hoisted_3_2, hoisted_12_1[j_3] ));
                            if (deduped_3_3 and deduped_4_3) then
                                return (deduped_2_3 + deduped_1_3);
                            elif (not deduped_3_3 and deduped_4_3) then
                                return deduped_1_3;
                            elif (deduped_3_3 and not deduped_4_3) then
                                return deduped_2_3;
                            else
                                return HomalgZeroMatrix( hoisted_4_2, deduped_20_1[j_3], deduped_33_1 );
                            fi;
                            return;
                        end ) );
              end ) ) );
    hoisted_18_1 := List( deduped_21_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_13_1[i_2];
            return hoisted_17_1 * UnionOfRows( deduped_33_1, deduped_1_2, [ HomalgZeroMatrix( Sum( deduped_13_1{[ 1 .. (i_2 - 1) ]} ), deduped_1_2, deduped_33_1 ), HomalgIdentityMatrix( deduped_1_2, deduped_33_1 ), HomalgZeroMatrix( Sum( deduped_13_1{[ (i_2 + 1) .. deduped_23_1 ]} ), deduped_1_2, deduped_33_1 ) ] );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, ValuesOnAllObjects, LazyHList( deduped_21_1, function ( i_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_19_1, deduped_25_1[i_2], deduped_26_1[i_2], UnderlyingMatrix, ConvertRowToMatrix( hoisted_18_1[i_2], deduped_5_1[i_2], deduped_6_1[i_2] ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddInverseForMorphisms( cat,
        
########
function ( cat_1, alpha_1 )
    local hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := ValuesOnAllObjects( alpha_1 );
    deduped_8_1 := Range( alpha_1 );
    deduped_7_1 := ValuesOfPreSheaf( deduped_8_1 )[1];
    hoisted_6_1 := Target( cat_1 );
    hoisted_5_1 := List( deduped_9_1, UnderlyingMatrix );
    hoisted_4_1 := CommutativeRingOfLinearCategory( cat_1 );
    hoisted_3_1 := List( deduped_7_1, RankOfObject );
    hoisted_2_1 := List( deduped_9_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_8_1, Source( alpha_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_6_1, deduped_7_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, UniqueRightDivide( HomalgIdentityMatrix( hoisted_3_1[o_2], hoisted_4_1 ), hoisted_5_1[o_2] ) );
          end ) );
end
########
        
    , 201 : IsPrecompiledDerivation := true );
    
    ##
    AddIsColiftableAlongEpimorphism( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return ForAll( SetOfObjectsAsUnresolvableAttribute( Source( cat_1 ) ), function ( object_2 )
            return IsZero( DecideZeroColumns( UnderlyingMatrix( arg3_1( object_2 ) ), UnderlyingMatrix( arg2_1( object_2 ) ) ) );
        end );
end
########
        
    , 100 );
    
    ##
    AddIsCongruentForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return ForAll( SetOfObjectsAsUnresolvableAttribute( Source( cat_1 ) ), function ( o_2 )
            return UnderlyingMatrix( arg2_1( o_2 ) ) = UnderlyingMatrix( arg3_1( o_2 ) );
        end );
end
########
        
    , 100 );
    
    ##
    AddIsEqualForObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1;
    deduped_1_1 := Source( cat_1 );
    return ForAll( SetOfObjectsAsUnresolvableAttribute( deduped_1_1 ), function ( o_2 )
              return RankOfObject( arg2_1( o_2 ) ) = RankOfObject( arg3_1( o_2 ) );
          end ) and ForAll( SetOfGeneratingMorphismsAsUnresolvableAttribute( deduped_1_1 ), function ( m_2 )
              return UnderlyingMatrix( arg2_1( m_2 ) ) = UnderlyingMatrix( arg3_1( m_2 ) );
          end );
end
########
        
    , 100 );
    
    ##
    AddIsLiftableAlongMonomorphism( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return ForAll( SetOfObjectsAsUnresolvableAttribute( Source( cat_1 ) ), function ( object_2 )
            return IsZero( DecideZeroRows( UnderlyingMatrix( arg3_1( object_2 ) ), UnderlyingMatrix( arg2_1( object_2 ) ) ) );
        end );
end
########
        
    , 100 );
    
    ##
    AddIsWellDefinedForMorphisms( cat,
        
########
function ( cat_1, alpha_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1;
    deduped_3_1 := Source( cat_1 );
    hoisted_2_1 := Target( alpha_1 );
    hoisted_1_1 := Source( alpha_1 );
    return ForAll( SetOfObjectsAsUnresolvableAttribute( deduped_3_1 ), function ( o_2 )
              local deduped_1_2, deduped_2_2;
              deduped_2_2 := alpha_1( o_2 );
              deduped_1_2 := UnderlyingMatrix( deduped_2_2 );
              if not IsHomalgMatrix( deduped_1_2 ) then
                  return false;
              elif not NumberRows( deduped_1_2 ) = RankOfObject( Source( deduped_2_2 ) ) then
                  return false;
              elif not NumberColumns( deduped_1_2 ) = RankOfObject( Range( deduped_2_2 ) ) then
                  return false;
              else
                  return true;
              fi;
              return;
          end ) and ForAll( SetOfGeneratingMorphismsAsUnresolvableAttribute( deduped_3_1 ), function ( m_2 )
              local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2;
              deduped_4_2 := hoisted_2_1( m_2 );
              deduped_3_2 := hoisted_1_1( m_2 );
              deduped_2_2 := alpha_1( Target( m_2 ) );
              deduped_1_2 := alpha_1( Source( m_2 ) );
              return (RankOfObject( Target( deduped_3_2 ) ) = RankOfObject( Source( deduped_1_2 ) ) and RankOfObject( Target( deduped_2_2 ) ) = RankOfObject( Source( deduped_4_2 ) ) and UnderlyingMatrix( deduped_3_2 ) * UnderlyingMatrix( deduped_1_2 ) = UnderlyingMatrix( deduped_2_2 ) * UnderlyingMatrix( deduped_4_2 ));
          end );
end
########
        
    , 100 );
    
    ##
    AddKernelEmbeddingWithGivenKernelObject( cat,
        
########
function ( cat_1, alpha_1, P_1 )
    local hoisted_1_1, deduped_2_1, hoisted_3_1, deduped_4_1;
    deduped_4_1 := ValuesOnAllObjects( alpha_1 );
    hoisted_3_1 := List( deduped_4_1, Source );
    deduped_2_1 := Target( cat_1 );
    hoisted_1_1 := List( deduped_4_1, function ( logic_new_func_x_2 )
            return SyzygiesOfRows( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Source( alpha_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              local morphism_attr_1_2;
              morphism_attr_1_2 := hoisted_1_1[o_2];
              return CreateCapCategoryMorphismWithAttributes( deduped_2_1, CreateCapCategoryObjectWithAttributes( deduped_2_1, RankOfObject, NumberRows( morphism_attr_1_2 ) ), hoisted_3_1[o_2], UnderlyingMatrix, morphism_attr_1_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.KernelEmbeddingWithGivenKernelObject :=
        
########
function ( cat_1, alpha_1, P_1 )
    local hoisted_1_1, deduped_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1;
    deduped_5_1 := ValuesOnAllObjects( alpha_1 );
    hoisted_4_1 := List( deduped_5_1, function ( logic_new_func_x_2 )
            return SyzygiesOfRows( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_3_1 := List( deduped_5_1, Source );
    deduped_2_1 := Target( cat_1 );
    hoisted_1_1 := List( deduped_5_1, function ( logic_new_func_x_2 )
            return NumberRows( SyzygiesOfRows( UnderlyingMatrix( logic_new_func_x_2 ) ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Source( alpha_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( deduped_2_1, CreateCapCategoryObjectWithAttributes( deduped_2_1, RankOfObject, hoisted_1_1[o_2] ), hoisted_3_1[o_2], UnderlyingMatrix, hoisted_4_1[o_2] );
          end ) );
end
########
        
    ;
    
    ##
    AddKernelLiftWithGivenKernelObject( cat,
        
########
function ( cat_1, alpha_1, T_1, tau_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := ValuesOnAllObjects( tau_1 );
    deduped_4_1 := Target( cat_1 );
    hoisted_3_1 := List( ValuesOnAllObjects( alpha_1 ), function ( logic_new_func_x_2 )
            return SyzygiesOfRows( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_2_1 := List( deduped_5_1, UnderlyingMatrix );
    hoisted_1_1 := List( deduped_5_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( tau_1 ), P_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              local morphism_attr_1_2;
              morphism_attr_1_2 := UniqueRightDivide( hoisted_2_1[o_2], hoisted_3_1[o_2] );
              return CreateCapCategoryMorphismWithAttributes( deduped_4_1, hoisted_1_1[o_2], CreateCapCategoryObjectWithAttributes( deduped_4_1, RankOfObject, NumberColumns( morphism_attr_1_2 ) ), UnderlyingMatrix, morphism_attr_1_2 );
          end ) );
end
########
        
    , 201 : IsPrecompiledDerivation := true );
    
    ##
    cat!.cached_precompiled_functions.KernelLiftWithGivenKernelObject :=
        
########
function ( cat_1, alpha_1, T_1, tau_1, P_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := ValuesOnAllObjects( alpha_1 );
    deduped_6_1 := ValuesOnAllObjects( tau_1 );
    hoisted_5_1 := List( deduped_7_1, function ( logic_new_func_x_2 )
            return SyzygiesOfRows( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_4_1 := List( deduped_6_1, UnderlyingMatrix );
    deduped_3_1 := Target( cat_1 );
    hoisted_2_1 := List( deduped_7_1, function ( logic_new_func_x_2 )
            return NumberRows( SyzygiesOfRows( UnderlyingMatrix( logic_new_func_x_2 ) ) );
        end );
    hoisted_1_1 := List( deduped_6_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( tau_1 ), P_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( deduped_3_1, hoisted_1_1[o_2], CreateCapCategoryObjectWithAttributes( deduped_3_1, RankOfObject, hoisted_2_1[o_2] ), UnderlyingMatrix, UniqueRightDivide( hoisted_4_1[o_2], hoisted_5_1[o_2] ) );
          end ) );
end
########
        
    ;
    
    ##
    AddKernelObject( cat,
        
########
function ( cat_1, alpha_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_4_1, deduped_5_1, hoisted_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1;
    deduped_10_1 := ValuesOnAllObjects( alpha_1 );
    deduped_9_1 := Target( cat_1 );
    deduped_8_1 := Source( cat_1 );
    deduped_7_1 := DefiningTripleOfUnderlyingQuiver( deduped_8_1 );
    hoisted_6_1 := List( ValuesOfPreSheaf( Source( alpha_1 ) )[2], UnderlyingMatrix );
    deduped_5_1 := List( deduped_10_1, function ( logic_new_func_x_2 )
            return SyzygiesOfRows( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_4_1 := deduped_7_1[3];
    hoisted_2_1 := List( deduped_10_1, function ( logic_new_func_x_2 )
            return RowRankOfMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_1_1 := List( deduped_10_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, deduped_8_1, Target, deduped_9_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_7_1[1] ], function ( o_2 )
                return CreateCapCategoryObjectWithAttributes( deduped_9_1, RankOfObject, hoisted_1_1[o_2] - hoisted_2_1[o_2] );
            end ), LazyHList( [ 1 .. deduped_7_1[2] ], function ( m_2 )
                local morphism_attr_1_2, deduped_2_2;
                deduped_2_2 := hoisted_4_1[m_2];
                morphism_attr_1_2 := UniqueRightDivide( deduped_5_1[(1 + deduped_2_2[2])] * hoisted_6_1[m_2], deduped_5_1[1 + deduped_2_2[1]] );
                return CreateCapCategoryMorphismWithAttributes( deduped_9_1, CreateCapCategoryObjectWithAttributes( deduped_9_1, RankOfObject, NumberRows( morphism_attr_1_2 ) ), CreateCapCategoryObjectWithAttributes( deduped_9_1, RankOfObject, NumberColumns( morphism_attr_1_2 ) ), UnderlyingMatrix, morphism_attr_1_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.KernelObject :=
        
########
function ( cat_1, alpha_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_4_1, deduped_5_1, deduped_6_1, hoisted_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1;
    deduped_11_1 := ValuesOnAllObjects( alpha_1 );
    deduped_10_1 := Target( cat_1 );
    deduped_9_1 := Source( cat_1 );
    deduped_8_1 := DefiningTripleOfUnderlyingQuiver( deduped_9_1 );
    hoisted_7_1 := List( ValuesOfPreSheaf( Source( alpha_1 ) )[2], UnderlyingMatrix );
    deduped_6_1 := List( deduped_11_1, function ( logic_new_func_x_2 )
            return SyzygiesOfRows( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    deduped_5_1 := List( deduped_11_1, function ( logic_new_func_x_2 )
            return NumberRows( SyzygiesOfRows( UnderlyingMatrix( logic_new_func_x_2 ) ) );
        end );
    hoisted_4_1 := deduped_8_1[3];
    hoisted_2_1 := List( deduped_11_1, function ( logic_new_func_x_2 )
            return RowRankOfMatrix( UnderlyingMatrix( logic_new_func_x_2 ) );
        end );
    hoisted_1_1 := List( deduped_11_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( logic_new_func_x_2 ) );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, deduped_9_1, Target, deduped_10_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_8_1[1] ], function ( o_2 )
                return CreateCapCategoryObjectWithAttributes( deduped_10_1, RankOfObject, hoisted_1_1[o_2] - hoisted_2_1[o_2] );
            end ), LazyHList( [ 1 .. deduped_8_1[2] ], function ( m_2 )
                local deduped_1_2, deduped_2_2, deduped_3_2;
                deduped_3_2 := hoisted_4_1[m_2];
                deduped_2_2 := 1 + deduped_3_2[1];
                deduped_1_2 := 1 + deduped_3_2[2];
                return CreateCapCategoryMorphismWithAttributes( deduped_10_1, CreateCapCategoryObjectWithAttributes( deduped_10_1, RankOfObject, deduped_5_1[deduped_1_2] ), CreateCapCategoryObjectWithAttributes( deduped_10_1, RankOfObject, deduped_5_1[deduped_2_2] ), UnderlyingMatrix, UniqueRightDivide( deduped_6_1[deduped_1_2] * hoisted_7_1[m_2], deduped_6_1[deduped_2_2] ) );
            end ) ) );
end
########
        
    ;
    
    ##
    AddLiftAlongMonomorphism( cat,
        
########
function ( cat_1, iota_1, tau_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := ValuesOnAllObjects( iota_1 );
    deduped_6_1 := ValuesOnAllObjects( tau_1 );
    hoisted_5_1 := Target( cat_1 );
    hoisted_4_1 := List( deduped_7_1, UnderlyingMatrix );
    hoisted_3_1 := List( deduped_6_1, UnderlyingMatrix );
    hoisted_2_1 := List( deduped_7_1, Source );
    hoisted_1_1 := List( deduped_6_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( tau_1 ), Source( iota_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, UniqueRightDivide( hoisted_3_1[o_2], hoisted_4_1[o_2] ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismBetweenDirectSumsWithGivenDirectSums( cat,
        
########
function ( cat_1, S_1, source_diagram_1, mat_1, range_diagram_1, T_1 )
    local hoisted_1_1, hoisted_3_1, deduped_4_1, hoisted_5_1, deduped_6_1;
    deduped_6_1 := ValuesOfPreSheaf( T_1 )[1];
    hoisted_5_1 := Target( cat_1 );
    deduped_4_1 := CommutativeRingOfLinearCategory( cat_1 );
    hoisted_3_1 := List( deduped_6_1, RankOfObject );
    hoisted_1_1 := ValuesOfPreSheaf( S_1 )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, S_1, T_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], deduped_6_1[o_2], UnderlyingMatrix, UnionOfRows( deduped_4_1, hoisted_3_1[o_2], ListN( List( source_diagram_1, function ( Si_3 )
                            return ValuesOfPreSheaf( Si_3 )[1][o_2];
                        end ), List( mat_1, function ( row_3 )
                            return List( row_3, function ( m_4 )
                                    return ValuesOnAllObjects( m_4 )[o_2];
                                end );
                        end ), function ( source_3, row_3 )
                          return UnionOfColumns( deduped_4_1, RankOfObject( source_3 ), List( row_3, UnderlyingMatrix ) );
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
    AddMultiplyWithElementOfCommutativeRingForMorphisms( cat,
        
########
function ( cat_1, r_1, alpha_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1;
    deduped_5_1 := ValuesOnAllObjects( alpha_1 );
    hoisted_4_1 := Target( cat_1 );
    hoisted_3_1 := List( deduped_5_1, UnderlyingMatrix );
    hoisted_2_1 := List( deduped_5_1, Range );
    hoisted_1_1 := List( deduped_5_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), Target( alpha_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, r_1 * hoisted_3_1[o_2] );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddObjectConstructor( cat,
        
########
function ( cat_1, arg2_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, Source( cat_1 ), Target, Target( cat_1 ), ValuesOfPreSheaf, arg2_1 );
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
    AddPreCompose( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := ValuesOnAllObjects( beta_1 );
    deduped_6_1 := ValuesOnAllObjects( alpha_1 );
    hoisted_5_1 := Target( cat_1 );
    hoisted_4_1 := List( deduped_7_1, UnderlyingMatrix );
    hoisted_3_1 := List( deduped_6_1, UnderlyingMatrix );
    hoisted_2_1 := List( deduped_7_1, Range );
    hoisted_1_1 := List( deduped_6_1, Source );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), Range( beta_1 ), ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, hoisted_3_1[o_2] * hoisted_4_1[o_2] );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddProjectionInFactorOfDirectSumWithGivenDirectSum( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1;
    deduped_7_1 := objects_1[k_1];
    hoisted_6_1 := Target( cat_1 );
    hoisted_5_1 := [ k_1 + 1 .. Length( objects_1 ) ];
    deduped_4_1 := CommutativeRingOfLinearCategory( cat_1 );
    hoisted_3_1 := [ 1 .. k_1 - 1 ];
    hoisted_2_1 := ValuesOfPreSheaf( CAP_JIT_INCOMPLETE_LOGIC( deduped_7_1 ) )[1];
    hoisted_1_1 := ValuesOfPreSheaf( P_1 )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, deduped_7_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              local deduped_1_2, deduped_2_2;
              deduped_2_2 := List( objects_1, function ( F_3 )
                      return CAP_JIT_INCOMPLETE_LOGIC( RankOfObject( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( F_3 )[1][o_2] ) ) );
                  end );
              deduped_1_2 := deduped_2_2[k_1];
              return CreateCapCategoryMorphismWithAttributes( hoisted_6_1, hoisted_1_1[o_2], CAP_JIT_INCOMPLETE_LOGIC( hoisted_2_1[o_2] ), UnderlyingMatrix, UnionOfRows( deduped_4_1, deduped_1_2, [ HomalgZeroMatrix( Sum( deduped_2_2{hoisted_3_1} ), deduped_1_2, deduped_4_1 ), HomalgIdentityMatrix( deduped_1_2, deduped_4_1 ), HomalgZeroMatrix( Sum( deduped_2_2{hoisted_5_1} ), deduped_1_2, deduped_4_1 ) ] ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.ProjectionInFactorOfDirectSumWithGivenDirectSum :=
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, hoisted_4_1, hoisted_5_1;
    hoisted_5_1 := Target( cat_1 );
    hoisted_4_1 := [ k_1 + 1 .. Length( objects_1 ) ];
    deduped_3_1 := CommutativeRingOfLinearCategory( cat_1 );
    hoisted_2_1 := [ 1 .. k_1 - 1 ];
    hoisted_1_1 := ValuesOfPreSheaf( P_1 )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, objects_1[k_1], ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              local deduped_1_2, deduped_2_2;
              deduped_2_2 := List( objects_1, function ( F_3 )
                      return List( ValuesOfPreSheaf( F_3 )[1], RankOfObject )[o_2];
                  end );
              deduped_1_2 := deduped_2_2[k_1];
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], List( objects_1, function ( F_3 )
                          return ValuesOfPreSheaf( F_3 )[1][o_2];
                      end )[k_1], UnderlyingMatrix, UnionOfRows( deduped_3_1, deduped_1_2, [ HomalgZeroMatrix( Sum( deduped_2_2{hoisted_2_1} ), deduped_1_2, deduped_3_1 ), HomalgIdentityMatrix( deduped_1_2, deduped_3_1 ), HomalgZeroMatrix( Sum( deduped_2_2{hoisted_4_1} ), deduped_1_2, deduped_3_1 ) ] ) );
          end ) );
end
########
        
    ;
    
    ##
    AddUniversalMorphismFromDirectSumWithGivenDirectSum( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local hoisted_1_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1;
    deduped_6_1 := ValuesOfPreSheaf( T_1 )[1];
    hoisted_5_1 := Target( cat_1 );
    hoisted_4_1 := CommutativeRingOfLinearCategory( cat_1 );
    hoisted_3_1 := List( deduped_6_1, RankOfObject );
    hoisted_1_1 := ValuesOfPreSheaf( P_1 )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], deduped_6_1[o_2], UnderlyingMatrix, UnionOfRows( hoisted_4_1, hoisted_3_1[o_2], List( tau_1, function ( eta_3 )
                          return CAP_JIT_INCOMPLETE_LOGIC( UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( eta_3 )[o_2] ) ) );
                      end ) ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.UniversalMorphismFromDirectSumWithGivenDirectSum :=
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local hoisted_1_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1;
    deduped_6_1 := ValuesOfPreSheaf( T_1 )[1];
    hoisted_5_1 := Target( cat_1 );
    hoisted_4_1 := CommutativeRingOfLinearCategory( cat_1 );
    hoisted_3_1 := List( deduped_6_1, RankOfObject );
    hoisted_1_1 := ValuesOfPreSheaf( P_1 )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], deduped_6_1[o_2], UnderlyingMatrix, UnionOfRows( hoisted_4_1, hoisted_3_1[o_2], List( tau_1, function ( eta_3 )
                          return List( ValuesOnAllObjects( eta_3 ), UnderlyingMatrix )[o_2];
                      end ) ) );
          end ) );
end
########
        
    ;
    
    ##
    AddUniversalMorphismFromZeroObjectWithGivenZeroObject( cat,
        
########
function ( cat_1, T_1, P_1 )
    local hoisted_1_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1;
    deduped_6_1 := ValuesOfPreSheaf( T_1 )[1];
    hoisted_5_1 := Target( cat_1 );
    hoisted_4_1 := CommutativeRingOfLinearCategory( cat_1 );
    hoisted_3_1 := List( deduped_6_1, RankOfObject );
    hoisted_1_1 := ValuesOfPreSheaf( P_1 )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, hoisted_1_1[o_2], deduped_6_1[o_2], UnderlyingMatrix, HomalgZeroMatrix( 0, hoisted_3_1[o_2], hoisted_4_1 ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoDirectSumWithGivenDirectSum( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1;
    deduped_6_1 := ValuesOfPreSheaf( T_1 )[1];
    hoisted_5_1 := Target( cat_1 );
    hoisted_4_1 := CommutativeRingOfLinearCategory( cat_1 );
    hoisted_3_1 := List( deduped_6_1, RankOfObject );
    hoisted_2_1 := ValuesOfPreSheaf( P_1 )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, deduped_6_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, UnionOfColumns( hoisted_4_1, hoisted_3_1[o_2], List( tau_1, function ( eta_3 )
                          return CAP_JIT_INCOMPLETE_LOGIC( UnderlyingMatrix( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( eta_3 )[o_2] ) ) );
                      end ) ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.UniversalMorphismIntoDirectSumWithGivenDirectSum :=
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1;
    deduped_6_1 := ValuesOfPreSheaf( T_1 )[1];
    hoisted_5_1 := Target( cat_1 );
    hoisted_4_1 := CommutativeRingOfLinearCategory( cat_1 );
    hoisted_3_1 := List( deduped_6_1, RankOfObject );
    hoisted_2_1 := ValuesOfPreSheaf( P_1 )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, deduped_6_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, UnionOfColumns( hoisted_4_1, hoisted_3_1[o_2], List( tau_1, function ( eta_3 )
                          return List( ValuesOnAllObjects( eta_3 ), UnderlyingMatrix )[o_2];
                      end ) ) );
          end ) );
end
########
        
    ;
    
    ##
    AddUniversalMorphismIntoZeroObjectWithGivenZeroObject( cat,
        
########
function ( cat_1, T_1, P_1 )
    local hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1;
    deduped_6_1 := ValuesOfPreSheaf( T_1 )[1];
    hoisted_5_1 := Target( cat_1 );
    hoisted_4_1 := CommutativeRingOfLinearCategory( cat_1 );
    hoisted_3_1 := List( deduped_6_1, RankOfObject );
    hoisted_2_1 := ValuesOfPreSheaf( P_1 )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_5_1, deduped_6_1[o_2], hoisted_2_1[o_2], UnderlyingMatrix, HomalgZeroMatrix( hoisted_3_1[o_2], 0, hoisted_4_1 ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddZeroMorphism( cat,
        
########
function ( cat_1, a_1, b_1 )
    local hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1;
    deduped_8_1 := ValuesOfPreSheaf( b_1 )[1];
    deduped_7_1 := ValuesOfPreSheaf( a_1 )[1];
    hoisted_6_1 := Target( cat_1 );
    hoisted_5_1 := CommutativeRingOfLinearCategory( cat_1 );
    hoisted_4_1 := List( deduped_8_1, RankOfObject );
    hoisted_3_1 := List( deduped_7_1, RankOfObject );
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, b_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_6_1, deduped_7_1[o_2], deduped_8_1[o_2], UnderlyingMatrix, HomalgZeroMatrix( hoisted_3_1[o_2], hoisted_4_1[o_2], hoisted_5_1 ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddZeroObject( cat,
        
########
function ( cat_1 )
    local hoisted_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1;
    deduped_6_1 := Target( cat_1 );
    deduped_5_1 := Source( cat_1 );
    deduped_4_1 := CreateCapCategoryObjectWithAttributes( deduped_6_1, RankOfObject, 0 );
    deduped_3_1 := DefiningTripleOfUnderlyingQuiver( deduped_5_1 );
    hoisted_2_1 := CreateCapCategoryMorphismWithAttributes( deduped_6_1, deduped_4_1, deduped_4_1, UnderlyingMatrix, HomalgZeroMatrix( 0, 0, CommutativeRingOfLinearCategory( cat_1 ) ) );
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, deduped_5_1, Target, deduped_6_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_3_1[1] ], function ( o_2 )
                return deduped_4_1;
            end ), LazyHList( [ 1 .. deduped_3_1[2] ], function ( m_2 )
                return hoisted_2_1;
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

BindGlobal( "PreSheavesOfAlgebroidWithRelationsInCategoryOfRowsPrecompiled", function ( A )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function ( A )
    return PreSheaves( A, CategoryOfRows( CommutativeRingOfLinearCategory( A ) : FinalizeCategory := true,
          no_precompiled_code := false ) );
end;
        
        
    
    cat := category_constructor( A : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_PreSheavesOfAlgebroidWithRelationsInCategoryOfRowsPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
