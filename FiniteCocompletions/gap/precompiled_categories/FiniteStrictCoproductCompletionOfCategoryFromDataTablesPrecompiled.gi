# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_FiniteStrictCoproductCompletionOfCategoryFromDataTablesPrecompiled", function ( cat )
    
    ##
    AddHomomorphismStructureOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1;
    deduped_10_1 := PairOfIntAndList( arg2_1 );
    deduped_9_1 := PairOfIntAndList( arg3_1 );
    deduped_8_1 := deduped_10_1[1];
    deduped_7_1 := deduped_9_1[1];
    hoisted_6_1 := [ 0 .. deduped_8_1 - 1 ];
    hoisted_5_1 := List( deduped_9_1[2], IndexOfObject );
    hoisted_2_1 := DataTables( UnderlyingCategory( cat_1 ) )[2][5];
    hoisted_1_1 := List( deduped_10_1[2], IndexOfObject );
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Cardinality, Sum( List( [ 0 .. deduped_7_1 ^ deduped_8_1 - 1 ], function ( m_2 )
                return Product( List( hoisted_6_1, function ( i_3 )
                          return hoisted_2_1[1 + hoisted_1_1[1 + i_3]][1 + hoisted_5_1[1 + CAP_JIT_INCOMPLETE_LOGIC( DigitInPositionalNotation( m_2, CAP_JIT_INCOMPLETE_LOGIC( i_3 ), deduped_8_1, deduped_7_1 ) )]];
                      end ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.HomomorphismStructureOnObjects :=
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1, deduped_5_1, hoisted_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1;
    deduped_10_1 := PairOfIntAndList( arg2_1 );
    deduped_9_1 := PairOfIntAndList( arg3_1 );
    deduped_8_1 := deduped_10_1[1];
    deduped_7_1 := deduped_9_1[1];
    hoisted_6_1 := List( deduped_9_1[2], IndexOfObject );
    deduped_5_1 := [ 0 .. deduped_8_1 - 1 ];
    hoisted_2_1 := DataTables( UnderlyingCategory( cat_1 ) )[2][5];
    hoisted_1_1 := List( deduped_10_1[2], IndexOfObject );
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Cardinality, Sum( List( [ 0 .. deduped_7_1 ^ deduped_8_1 - 1 ], function ( m_2 )
                local hoisted_1_2;
                hoisted_1_2 := List( deduped_5_1, function ( i_3 )
                        return DigitInPositionalNotation( m_2, i_3, deduped_8_1, deduped_7_1 );
                    end );
                return Product( List( deduped_5_1, function ( i_3 )
                          local deduped_1_3;
                          deduped_1_3 := 1 + i_3;
                          return hoisted_2_1[1 + hoisted_1_1[deduped_1_3]][1 + hoisted_6_1[1 + hoisted_1_2[deduped_1_3]]];
                      end ) );
            end ) ) );
end
########
        
    ;
    
    ##
    AddHomomorphismStructureOnMorphismsWithGivenObjects( cat,
        
########
function ( cat_1, source_1, alpha_1, beta_1, range_1 )
    local deduped_1_1, deduped_2_1, deduped_5_1, deduped_7_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_14_1, hoisted_15_1, deduped_16_1, deduped_17_1, hoisted_18_1, deduped_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1;
    deduped_46_1 := PairOfLists( beta_1 );
    deduped_45_1 := PairOfLists( alpha_1 );
    deduped_44_1 := PairOfIntAndList( Source( beta_1 ) );
    deduped_43_1 := PairOfIntAndList( Target( alpha_1 ) );
    deduped_42_1 := PairOfIntAndList( Target( beta_1 ) );
    deduped_41_1 := PairOfIntAndList( Source( alpha_1 ) );
    deduped_40_1 := deduped_44_1[1];
    deduped_39_1 := deduped_43_1[1];
    deduped_38_1 := deduped_42_1[2];
    deduped_37_1 := deduped_42_1[1];
    deduped_36_1 := deduped_41_1[1];
    deduped_35_1 := DataTables( UnderlyingCategory( cat_1 ) )[2];
    deduped_34_1 := deduped_41_1[2];
    deduped_33_1 := [ 0 .. deduped_36_1 - 1 ];
    deduped_32_1 := [ 0 .. deduped_37_1 ^ deduped_36_1 - 1 ];
    deduped_31_1 := [ 0 .. deduped_40_1 ^ deduped_39_1 - 1 ];
    hoisted_30_1 := [ 1 .. deduped_36_1 ];
    deduped_5_1 := List( deduped_38_1, IndexOfObject );
    deduped_2_1 := deduped_35_1[5];
    deduped_1_1 := List( deduped_34_1, IndexOfObject );
    hoisted_29_1 := List( deduped_32_1, function ( m_2 )
            return List( deduped_33_1, function ( i_3 )
                    return deduped_2_1[1 + deduped_1_1[1 + i_3]][1 + deduped_5_1[1 + CAP_JIT_INCOMPLETE_LOGIC( DigitInPositionalNotation( m_2, CAP_JIT_INCOMPLETE_LOGIC( i_3 ), deduped_36_1, deduped_37_1 ) )]];
                end );
        end );
    hoisted_28_1 := BigInt( 1 );
    hoisted_27_1 := deduped_35_1[7];
    deduped_17_1 := deduped_35_1[1];
    hoisted_26_1 := List( deduped_38_1, function ( objC_2 )
            return deduped_17_1[1 + IndexOfObject( objC_2 )];
        end );
    hoisted_25_1 := List( deduped_46_1[2], IndexOfMorphism );
    deduped_14_1 := deduped_45_1[1];
    hoisted_24_1 := List( deduped_33_1, function ( i_2 )
            return deduped_14_1[1 + i_2];
        end );
    deduped_11_1 := [ 0 .. deduped_39_1 - 1 ];
    deduped_10_1 := List( deduped_44_1[2], IndexOfObject );
    deduped_7_1 := List( deduped_43_1[2], IndexOfObject );
    hoisted_23_1 := List( deduped_31_1, function ( m_2 )
            return List( deduped_11_1, function ( i_3 )
                    return deduped_2_1[1 + deduped_7_1[1 + i_3]][1 + deduped_10_1[1 + CAP_JIT_INCOMPLETE_LOGIC( DigitInPositionalNotation( m_2, CAP_JIT_INCOMPLETE_LOGIC( i_3 ), deduped_39_1, deduped_40_1 ) )]];
                end );
        end );
    hoisted_22_1 := deduped_35_1[8];
    hoisted_20_1 := List( deduped_45_1[2], IndexOfMorphism );
    deduped_19_1 := deduped_35_1[4];
    hoisted_18_1 := List( deduped_34_1, function ( objC_2 )
            return deduped_17_1[1 + IndexOfObject( objC_2 )];
        end );
    hoisted_21_1 := List( deduped_33_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return deduped_19_1[1 + hoisted_18_1[deduped_1_2]][1 + hoisted_20_1[deduped_1_2]];
        end );
    deduped_16_1 := List( deduped_32_1, function ( m_2 )
            return Product( List( deduped_33_1, function ( i_3 )
                      return deduped_2_1[1 + deduped_1_1[1 + i_3]][1 + deduped_5_1[1 + CAP_JIT_INCOMPLETE_LOGIC( DigitInPositionalNotation( m_2, CAP_JIT_INCOMPLETE_LOGIC( i_3 ), deduped_36_1, deduped_37_1 ) )]];
                  end ) );
        end );
    hoisted_15_1 := deduped_46_1[1];
    deduped_12_1 := List( deduped_31_1, function ( m_2 )
            return Product( List( deduped_11_1, function ( i_3 )
                      return deduped_2_1[1 + deduped_7_1[1 + i_3]][1 + deduped_10_1[1 + CAP_JIT_INCOMPLETE_LOGIC( DigitInPositionalNotation( m_2, CAP_JIT_INCOMPLETE_LOGIC( i_3 ), deduped_39_1, deduped_40_1 ) )]];
                  end ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), source_1, range_1, AsList, Concatenation( List( [ 0 .. Cardinality( source_1 ) - 1 ], function ( i_2 )
                local deduped_2_2, deduped_3_2, deduped_4_2, hoisted_5_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, deduped_10_2, deduped_11_2, deduped_12_2, deduped_13_2, deduped_14_2, deduped_15_2, deduped_16_2;
                deduped_14_2 := BigInt( SafeFirst( deduped_31_1, function ( i_3 )
                          return Sum( deduped_12_1{[ 1 .. 1 + i_3 ]} ) > i_2;
                      end ) );
                deduped_2_2 := List( deduped_11_1, function ( i_3 )
                        return DigitInPositionalNotation( deduped_14_2, i_3, deduped_39_1, deduped_40_1 );
                    end );
                deduped_3_2 := List( deduped_33_1, function ( i_3 )
                        return hoisted_15_1[1 + deduped_2_2[1 + deduped_14_1[1 + i_3]]];
                    end );
                deduped_16_2 := Sum( deduped_33_1, function ( i_3 )
                        return deduped_3_2[1 + i_3] * deduped_37_1 ^ i_3;
                    end );
                deduped_15_2 := 1 + deduped_16_2;
                deduped_13_2 := Sum( deduped_16_1{[ 1 .. deduped_16_2 ]} );
                deduped_12_2 := 1 + deduped_14_2;
                deduped_11_2 := deduped_12_1[deduped_12_2];
                deduped_10_2 := Sum( deduped_12_1{[ 1 .. deduped_14_2 ]} );
                hoisted_9_2 := hoisted_29_1[deduped_15_2];
                hoisted_5_2 := CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. deduped_11_2 - 1 ][BigInt( SafePosition( [ deduped_10_2 .. deduped_10_2 + deduped_11_2 - 1 ], i_2 ) )] );
                deduped_4_2 := hoisted_23_1[deduped_12_2];
                hoisted_7_2 := List( deduped_11_1, function ( i_3 )
                        local deduped_1_3, deduped_2_3, deduped_3_3;
                        deduped_3_3 := 1 + i_3;
                        deduped_2_3 := deduped_4_2[deduped_3_3];
                        deduped_1_3 := Product( deduped_4_2{[ 1 .. i_3 ]} );
                        return hoisted_22_1[1 + deduped_7_1[deduped_3_3]][1 + deduped_10_1[1 + deduped_2_2[deduped_3_3]]][1 + CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( QuoIntWithDomain( hoisted_5_2, deduped_1_3, deduped_11_2 ), deduped_2_3, DivIntWithGivenQuotient( deduped_11_2, deduped_1_3, deduped_2_3 * Product( deduped_4_2{[ deduped_3_3 + 1 .. deduped_39_1 ]} ) ) ) )];
                    end );
                hoisted_8_2 := List( deduped_33_1, function ( i_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( i_3 );
                        return hoisted_27_1[1 + deduped_19_1[1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_19_1[1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_19_1[1 + hoisted_21_1[deduped_1_3]][1 + hoisted_7_2[1 + hoisted_24_1[deduped_1_3]]] )][1 + hoisted_25_1[1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_2_2[1 + deduped_14_1[deduped_1_3]] )]] )][1 + hoisted_26_1[1 + deduped_3_2[1 + i_3]]]];
                    end );
                return [ [ deduped_13_2 .. deduped_13_2 + deduped_16_1[deduped_15_2] - 1 ][1 + Sum( hoisted_30_1, function ( j_3 )
                               return hoisted_8_2[j_3][hoisted_28_1] * CAP_JIT_INCOMPLETE_LOGIC( Product( hoisted_9_2{[ 1 .. CAP_JIT_INCOMPLETE_LOGIC( j_3 ) - 1 ]} ) );
                           end )] ];
            end ) ) );
end
########
        
    , 2303 : IsPrecompiledDerivation := true );
    
    ##
    cat!.cached_precompiled_functions.HomomorphismStructureOnMorphismsWithGivenObjects :=
        
########
function ( cat_1, source_1, alpha_1, beta_1, range_1 )
    local deduped_1_1, deduped_2_1, deduped_6_1, deduped_7_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_14_1, hoisted_15_1, deduped_16_1, deduped_17_1, hoisted_18_1, deduped_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1;
    deduped_46_1 := PairOfLists( beta_1 );
    deduped_45_1 := PairOfLists( alpha_1 );
    deduped_44_1 := PairOfIntAndList( Source( beta_1 ) );
    deduped_43_1 := PairOfIntAndList( Target( alpha_1 ) );
    deduped_42_1 := PairOfIntAndList( Target( beta_1 ) );
    deduped_41_1 := PairOfIntAndList( Source( alpha_1 ) );
    deduped_40_1 := deduped_44_1[1];
    deduped_39_1 := deduped_43_1[1];
    deduped_38_1 := deduped_42_1[2];
    deduped_37_1 := deduped_42_1[1];
    deduped_36_1 := deduped_41_1[1];
    deduped_35_1 := DataTables( UnderlyingCategory( cat_1 ) )[2];
    deduped_34_1 := deduped_41_1[2];
    deduped_33_1 := [ 0 .. deduped_36_1 - 1 ];
    deduped_32_1 := [ 0 .. deduped_37_1 ^ deduped_36_1 - 1 ];
    deduped_31_1 := [ 0 .. deduped_40_1 ^ deduped_39_1 - 1 ];
    deduped_30_1 := [ 1 .. deduped_36_1 ];
    deduped_6_1 := List( deduped_38_1, IndexOfObject );
    deduped_2_1 := deduped_35_1[5];
    deduped_1_1 := List( deduped_34_1, IndexOfObject );
    hoisted_29_1 := List( deduped_32_1, function ( m_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_33_1, function ( i_3 )
                    return DigitInPositionalNotation( m_2, i_3, deduped_36_1, deduped_37_1 );
                end );
            return List( deduped_33_1, function ( i_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + i_3;
                    return deduped_2_1[1 + deduped_1_1[deduped_1_3]][1 + deduped_6_1[1 + hoisted_1_2[deduped_1_3]]];
                end );
        end );
    hoisted_28_1 := BigInt( 1 );
    hoisted_27_1 := deduped_35_1[7];
    deduped_17_1 := deduped_35_1[1];
    hoisted_26_1 := List( deduped_38_1, function ( objC_2 )
            return deduped_17_1[1 + IndexOfObject( objC_2 )];
        end );
    hoisted_25_1 := List( deduped_46_1[2], IndexOfMorphism );
    deduped_14_1 := deduped_45_1[1];
    hoisted_24_1 := List( deduped_33_1, function ( i_2 )
            return deduped_14_1[1 + i_2];
        end );
    deduped_11_1 := List( deduped_44_1[2], IndexOfObject );
    deduped_10_1 := [ 0 .. deduped_39_1 - 1 ];
    deduped_7_1 := List( deduped_43_1[2], IndexOfObject );
    hoisted_23_1 := List( deduped_31_1, function ( m_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_10_1, function ( i_3 )
                    return DigitInPositionalNotation( m_2, i_3, deduped_39_1, deduped_40_1 );
                end );
            return List( deduped_10_1, function ( i_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + i_3;
                    return deduped_2_1[1 + deduped_7_1[deduped_1_3]][1 + deduped_11_1[1 + hoisted_1_2[deduped_1_3]]];
                end );
        end );
    hoisted_22_1 := deduped_35_1[8];
    hoisted_20_1 := List( deduped_45_1[2], IndexOfMorphism );
    deduped_19_1 := deduped_35_1[4];
    hoisted_18_1 := List( deduped_34_1, function ( objC_2 )
            return deduped_17_1[1 + IndexOfObject( objC_2 )];
        end );
    hoisted_21_1 := List( deduped_33_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return deduped_19_1[1 + hoisted_18_1[deduped_1_2]][1 + hoisted_20_1[deduped_1_2]];
        end );
    deduped_16_1 := List( deduped_32_1, function ( m_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_33_1, function ( i_3 )
                    return DigitInPositionalNotation( m_2, i_3, deduped_36_1, deduped_37_1 );
                end );
            return Product( List( deduped_33_1, function ( i_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + i_3;
                      return deduped_2_1[1 + deduped_1_1[deduped_1_3]][1 + deduped_6_1[1 + hoisted_1_2[deduped_1_3]]];
                  end ) );
        end );
    hoisted_15_1 := deduped_46_1[1];
    deduped_12_1 := List( deduped_31_1, function ( m_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_10_1, function ( i_3 )
                    return DigitInPositionalNotation( m_2, i_3, deduped_39_1, deduped_40_1 );
                end );
            return Product( List( deduped_10_1, function ( i_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + i_3;
                      return deduped_2_1[1 + deduped_7_1[deduped_1_3]][1 + deduped_11_1[1 + hoisted_1_2[deduped_1_3]]];
                  end ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), source_1, range_1, AsList, Concatenation( List( [ 0 .. Cardinality( source_1 ) - 1 ], function ( i_2 )
                local deduped_2_2, deduped_3_2, deduped_4_2, hoisted_6_2, hoisted_7_2, hoisted_8_2, hoisted_9_2, hoisted_10_2, hoisted_11_2, hoisted_12_2, hoisted_13_2, hoisted_14_2, deduped_15_2, deduped_16_2, deduped_17_2, deduped_18_2, deduped_19_2, deduped_20_2, deduped_21_2;
                deduped_19_2 := BigInt( SafeFirst( deduped_31_1, function ( i_3 )
                          return Sum( deduped_12_1{[ 1 .. 1 + i_3 ]} ) > i_2;
                      end ) );
                deduped_2_2 := List( deduped_10_1, function ( i_3 )
                        return DigitInPositionalNotation( deduped_19_2, i_3, deduped_39_1, deduped_40_1 );
                    end );
                deduped_3_2 := List( deduped_33_1, function ( i_3 )
                        return hoisted_15_1[1 + deduped_2_2[1 + deduped_14_1[1 + i_3]]];
                    end );
                deduped_21_2 := Sum( deduped_33_1, function ( i_3 )
                        return deduped_3_2[1 + i_3] * deduped_37_1 ^ i_3;
                    end );
                deduped_20_2 := 1 + deduped_21_2;
                deduped_18_2 := Sum( deduped_16_1{[ 1 .. deduped_21_2 ]} );
                deduped_17_2 := 1 + deduped_19_2;
                deduped_16_2 := deduped_12_1[deduped_17_2];
                deduped_15_2 := Sum( deduped_12_1{[ 1 .. deduped_19_2 ]} );
                hoisted_13_2 := hoisted_29_1[deduped_20_2];
                hoisted_14_2 := List( deduped_30_1, function ( j_3 )
                        return Product( hoisted_13_2{[ 1 .. j_3 - 1 ]} );
                    end );
                hoisted_10_2 := List( deduped_33_1, function ( i_3 )
                        return deduped_2_2[1 + deduped_14_1[1 + i_3]];
                    end );
                hoisted_7_2 := BigInt( SafePosition( [ deduped_15_2 .. deduped_15_2 + deduped_16_2 - 1 ], i_2 ) );
                hoisted_6_2 := [ 0 .. deduped_16_2 - 1 ];
                deduped_4_2 := hoisted_23_1[deduped_17_2];
                hoisted_8_2 := List( deduped_10_1, function ( i_3 )
                        local hoisted_3_3, deduped_4_3, deduped_5_3, deduped_6_3;
                        deduped_6_3 := 1 + i_3;
                        deduped_5_3 := deduped_4_2[deduped_6_3];
                        deduped_4_3 := Product( deduped_4_2{[ 1 .. i_3 ]} );
                        hoisted_3_3 := DivIntWithGivenQuotient( deduped_16_2, deduped_4_3, deduped_5_3 * Product( deduped_4_2{[ deduped_6_3 + 1 .. deduped_39_1 ]} ) );
                        return hoisted_22_1[1 + deduped_7_1[deduped_6_3]][1 + deduped_11_1[1 + deduped_2_2[deduped_6_3]]][1 + List( hoisted_6_2, function ( i_4 )
                                     return RemIntWithDomain( QuoIntWithDomain( i_4, deduped_4_3, deduped_16_2 ), deduped_5_3, hoisted_3_3 );
                                 end )[hoisted_7_2]];
                    end );
                hoisted_9_2 := List( deduped_33_1, function ( i_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + i_3;
                        return deduped_19_1[1 + hoisted_21_1[deduped_1_3]][1 + hoisted_8_2[1 + hoisted_24_1[deduped_1_3]]];
                    end );
                hoisted_11_2 := List( deduped_33_1, function ( i_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + i_3;
                        return deduped_19_1[1 + hoisted_9_2[deduped_1_3]][1 + hoisted_25_1[1 + hoisted_10_2[deduped_1_3]]];
                    end );
                hoisted_12_2 := List( deduped_33_1, function ( i_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + i_3;
                        return hoisted_27_1[1 + deduped_19_1[1 + hoisted_11_2[deduped_1_3]][1 + hoisted_26_1[1 + deduped_3_2[deduped_1_3]]]];
                    end );
                return [ [ deduped_18_2 .. deduped_18_2 + deduped_16_1[deduped_20_2] - 1 ][1 + Sum( deduped_30_1, function ( j_3 )
                               return hoisted_12_2[j_3][hoisted_28_1] * hoisted_14_2[j_3];
                           end )] ];
            end ) ) );
end
########
        
    ;
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local deduped_1_1, deduped_2_1, deduped_5_1, hoisted_8_1, hoisted_10_1, hoisted_12_1, hoisted_13_1, hoisted_15_1, deduped_16_1, hoisted_17_1, hoisted_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1;
    deduped_34_1 := AsList( alpha_1 );
    deduped_33_1 := PairOfIntAndList( range_1 );
    deduped_32_1 := UnderlyingCategory( cat_1 );
    deduped_31_1 := PairOfIntAndList( source_1 );
    deduped_30_1 := deduped_33_1[1];
    deduped_29_1 := DataTables( deduped_32_1 );
    deduped_28_1 := deduped_31_1[1];
    deduped_27_1 := deduped_29_1[2];
    deduped_26_1 := [ 0 .. deduped_28_1 - 1 ];
    deduped_25_1 := [ 0 .. deduped_30_1 ^ deduped_28_1 - 1 ];
    deduped_5_1 := List( deduped_33_1[2], IndexOfObject );
    deduped_2_1 := deduped_27_1[5];
    deduped_1_1 := List( deduped_31_1[2], IndexOfObject );
    deduped_22_1 := List( deduped_25_1, function ( m_2 )
            return Product( List( deduped_26_1, function ( i_3 )
                      return deduped_2_1[1 + deduped_1_1[1 + i_3]][1 + deduped_5_1[1 + CAP_JIT_INCOMPLETE_LOGIC( DigitInPositionalNotation( m_2, CAP_JIT_INCOMPLETE_LOGIC( i_3 ), deduped_28_1, deduped_30_1 ) )]];
                  end ) );
        end );
    hoisted_8_1 := deduped_34_1[1];
    deduped_23_1 := BigInt( SafeFirst( deduped_25_1, function ( i_2 )
              return Sum( deduped_22_1{[ 1 .. 1 + i_2 ]} ) > hoisted_8_1;
          end ) );
    deduped_24_1 := List( deduped_26_1, function ( i_2 )
            return DigitInPositionalNotation( deduped_23_1, i_2, deduped_28_1, deduped_30_1 );
        end );
    deduped_21_1 := deduped_22_1[1 + deduped_23_1];
    deduped_20_1 := Sum( deduped_22_1{[ 1 .. deduped_23_1 ]} );
    hoisted_12_1 := deduped_27_1[3];
    hoisted_10_1 := deduped_27_1[2];
    hoisted_19_1 := List( [ 0 .. deduped_29_1[1][2] - 1 ], function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return CreateCapCategoryMorphismWithAttributes( deduped_32_1, CreateCapCategoryObjectWithAttributes( deduped_32_1, IndexOfObject, hoisted_10_1[deduped_1_2] ), CreateCapCategoryObjectWithAttributes( deduped_32_1, IndexOfObject, hoisted_12_1[deduped_1_2] ), IndexOfMorphism, i_2 );
        end );
    hoisted_17_1 := CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. deduped_21_1 - 1 ][BigInt( SafePosition( [ deduped_20_1 .. deduped_20_1 + deduped_21_1 - 1 ], deduped_34_1[1 + CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. Cardinality( Source( alpha_1 ) ) - 1 ][1] )] ) )] );
    hoisted_15_1 := CAP_JIT_INCOMPLETE_LOGIC( deduped_23_1 );
    deduped_16_1 := CAP_JIT_INCOMPLETE_LOGIC( List( deduped_26_1, function ( i_2 )
              return deduped_2_1[1 + deduped_1_1[1 + i_2]][1 + deduped_5_1[1 + CAP_JIT_INCOMPLETE_LOGIC( DigitInPositionalNotation( hoisted_15_1, CAP_JIT_INCOMPLETE_LOGIC( i_2 ), deduped_28_1, deduped_30_1 ) )]];
          end ) );
    hoisted_13_1 := deduped_27_1[8];
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, PairOfLists, NTuple( 2, deduped_24_1, List( deduped_26_1, function ( i_2 )
                local deduped_1_2, deduped_2_2, deduped_3_2;
                deduped_3_2 := 1 + i_2;
                deduped_2_2 := deduped_16_1[deduped_3_2];
                deduped_1_2 := Product( deduped_16_1{[ 1 .. i_2 ]} );
                return hoisted_19_1[1 + hoisted_13_1[1 + deduped_1_1[deduped_3_2]][1 + deduped_5_1[1 + deduped_24_1[deduped_3_2]]][1 + CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( QuoIntWithDomain( hoisted_17_1, deduped_1_2, deduped_21_1 ), deduped_2_2, DivIntWithGivenQuotient( deduped_21_1, deduped_1_2, deduped_2_2 * Product( deduped_16_1{[ deduped_3_2 + 1 .. deduped_28_1 ]} ) ) ) )]];
            end ) ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism :=
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local deduped_1_1, deduped_2_1, deduped_6_1, hoisted_8_1, hoisted_10_1, hoisted_12_1, hoisted_13_1, deduped_15_1, hoisted_17_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1;
    deduped_37_1 := AsList( alpha_1 );
    deduped_36_1 := PairOfIntAndList( range_1 );
    deduped_35_1 := UnderlyingCategory( cat_1 );
    deduped_34_1 := PairOfIntAndList( source_1 );
    deduped_33_1 := deduped_36_1[1];
    deduped_32_1 := DataTables( deduped_35_1 );
    deduped_31_1 := deduped_34_1[1];
    deduped_30_1 := deduped_32_1[2];
    deduped_29_1 := [ 0 .. deduped_31_1 - 1 ];
    deduped_28_1 := [ 0 .. deduped_33_1 ^ deduped_31_1 - 1 ];
    deduped_6_1 := List( deduped_36_1[2], IndexOfObject );
    deduped_2_1 := deduped_30_1[5];
    deduped_1_1 := List( deduped_34_1[2], IndexOfObject );
    deduped_24_1 := List( deduped_28_1, function ( m_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_29_1, function ( i_3 )
                    return DigitInPositionalNotation( m_2, i_3, deduped_31_1, deduped_33_1 );
                end );
            return Product( List( deduped_29_1, function ( i_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + i_3;
                      return deduped_2_1[1 + deduped_1_1[deduped_1_3]][1 + deduped_6_1[1 + hoisted_1_2[deduped_1_3]]];
                  end ) );
        end );
    hoisted_8_1 := deduped_37_1[1];
    deduped_26_1 := BigInt( SafeFirst( deduped_28_1, function ( i_2 )
              return Sum( deduped_24_1{[ 1 .. 1 + i_2 ]} ) > hoisted_8_1;
          end ) );
    deduped_27_1 := List( deduped_29_1, function ( i_2 )
            return DigitInPositionalNotation( deduped_26_1, i_2, deduped_31_1, deduped_33_1 );
        end );
    deduped_25_1 := 1 + deduped_26_1;
    deduped_23_1 := deduped_24_1[deduped_25_1];
    deduped_22_1 := Sum( deduped_24_1{[ 1 .. deduped_26_1 ]} );
    hoisted_12_1 := deduped_30_1[3];
    hoisted_10_1 := deduped_30_1[2];
    hoisted_21_1 := List( [ 0 .. deduped_32_1[1][2] - 1 ], function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return CreateCapCategoryMorphismWithAttributes( deduped_35_1, CreateCapCategoryObjectWithAttributes( deduped_35_1, IndexOfObject, hoisted_10_1[deduped_1_2] ), CreateCapCategoryObjectWithAttributes( deduped_35_1, IndexOfObject, hoisted_12_1[deduped_1_2] ), IndexOfMorphism, i_2 );
        end );
    hoisted_20_1 := [ 0 .. Cardinality( Source( alpha_1 ) ) - 1 ];
    hoisted_19_1 := [ deduped_22_1 .. deduped_22_1 + deduped_23_1 - 1 ];
    hoisted_17_1 := [ 0 .. deduped_23_1 - 1 ];
    deduped_15_1 := List( deduped_28_1, function ( m_2 )
              local hoisted_1_2;
              hoisted_1_2 := List( deduped_29_1, function ( i_3 )
                      return DigitInPositionalNotation( m_2, i_3, deduped_31_1, deduped_33_1 );
                  end );
              return List( deduped_29_1, function ( i_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + i_3;
                      return deduped_2_1[1 + deduped_1_1[deduped_1_3]][1 + deduped_6_1[1 + hoisted_1_2[deduped_1_3]]];
                  end );
          end )[deduped_25_1];
    hoisted_13_1 := deduped_30_1[8];
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, PairOfLists, NTuple( 2, deduped_27_1, List( deduped_29_1, function ( i_2 )
                local hoisted_3_2, hoisted_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
                deduped_7_2 := 1 + i_2;
                deduped_6_2 := deduped_15_1[deduped_7_2];
                deduped_5_2 := Product( deduped_15_1{[ 1 .. i_2 ]} );
                hoisted_3_2 := DivIntWithGivenQuotient( deduped_23_1, deduped_5_2, deduped_6_2 * Product( deduped_15_1{[ deduped_7_2 + 1 .. deduped_31_1 ]} ) );
                hoisted_4_2 := List( hoisted_17_1, function ( i_3 )
                        return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_5_2, deduped_23_1 ), deduped_6_2, hoisted_3_2 );
                    end );
                return hoisted_21_1[1 + hoisted_13_1[1 + deduped_1_1[deduped_7_2]][1 + deduped_6_1[1 + deduped_27_1[deduped_7_2]]][1 + List( hoisted_20_1, function ( x_3 )
                                return hoisted_4_2[BigInt( SafePosition( hoisted_19_1, deduped_37_1[1 + x_3] ) )];
                            end )[1]]];
            end ) ) );
end
########
        
    ;
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1, deduped_5_1, deduped_6_1, hoisted_9_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1;
    deduped_23_1 := UnderlyingCategory( cat_1 );
    deduped_22_1 := PairOfIntAndList( arg2_1 );
    deduped_21_1 := PairOfIntAndList( arg3_1 );
    deduped_20_1 := DataTables( deduped_23_1 );
    deduped_19_1 := deduped_22_1[1];
    deduped_18_1 := deduped_21_1[1];
    deduped_17_1 := deduped_20_1[2];
    deduped_16_1 := [ 0 .. deduped_18_1 ^ deduped_19_1 - 1 ];
    deduped_6_1 := [ 0 .. deduped_19_1 - 1 ];
    deduped_5_1 := List( deduped_21_1[2], IndexOfObject );
    deduped_2_1 := deduped_17_1[5];
    deduped_1_1 := List( deduped_22_1[2], IndexOfObject );
    deduped_15_1 := List( deduped_16_1, function ( m_2 )
            return Product( List( deduped_6_1, function ( i_3 )
                      return deduped_2_1[1 + deduped_1_1[1 + i_3]][1 + deduped_5_1[1 + CAP_JIT_INCOMPLETE_LOGIC( DigitInPositionalNotation( m_2, CAP_JIT_INCOMPLETE_LOGIC( i_3 ), deduped_19_1, deduped_18_1 ) )]];
                  end ) );
        end );
    hoisted_11_1 := deduped_17_1[3];
    hoisted_9_1 := deduped_17_1[2];
    hoisted_14_1 := List( [ 0 .. deduped_20_1[1][2] - 1 ], function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return CreateCapCategoryMorphismWithAttributes( deduped_23_1, CreateCapCategoryObjectWithAttributes( deduped_23_1, IndexOfObject, hoisted_9_1[deduped_1_2] ), CreateCapCategoryObjectWithAttributes( deduped_23_1, IndexOfObject, hoisted_11_1[deduped_1_2] ), IndexOfMorphism, i_2 );
        end );
    hoisted_13_1 := List( deduped_16_1, function ( m_2 )
            return List( deduped_6_1, function ( i_3 )
                    return deduped_2_1[1 + deduped_1_1[1 + i_3]][1 + deduped_5_1[1 + CAP_JIT_INCOMPLETE_LOGIC( DigitInPositionalNotation( m_2, CAP_JIT_INCOMPLETE_LOGIC( i_3 ), deduped_19_1, deduped_18_1 ) )]];
                end );
        end );
    hoisted_12_1 := deduped_17_1[8];
    return List( [ 0 .. Sum( deduped_15_1 ) - 1 ], function ( i_2 )
            local deduped_3_2, hoisted_4_2, deduped_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2;
            deduped_9_2 := BigInt( SafeFirst( deduped_16_1, function ( i_3 )
                      return Sum( deduped_15_1{[ 1 .. 1 + i_3 ]} ) > i_2;
                  end ) );
            deduped_10_2 := List( deduped_6_1, function ( i_3 )
                    return DigitInPositionalNotation( deduped_9_2, i_3, deduped_19_1, deduped_18_1 );
                end );
            deduped_8_2 := 1 + deduped_9_2;
            deduped_7_2 := deduped_15_1[deduped_8_2];
            deduped_6_2 := Sum( deduped_15_1{[ 1 .. deduped_9_2 ]} );
            hoisted_4_2 := CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. deduped_7_2 - 1 ][BigInt( SafePosition( [ deduped_6_2 .. deduped_6_2 + deduped_7_2 - 1 ], i_2 ) )] );
            deduped_3_2 := hoisted_13_1[deduped_8_2];
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, PairOfLists, NTuple( 2, deduped_10_2, List( deduped_6_1, function ( i_3 )
                        local deduped_1_3, deduped_2_3, deduped_3_3;
                        deduped_3_3 := 1 + i_3;
                        deduped_2_3 := deduped_3_2[deduped_3_3];
                        deduped_1_3 := Product( deduped_3_2{[ 1 .. i_3 ]} );
                        return hoisted_14_1[1 + hoisted_12_1[1 + deduped_1_1[deduped_3_3]][1 + deduped_5_1[1 + deduped_10_2[deduped_3_3]]][1 + CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( QuoIntWithDomain( hoisted_4_2, deduped_1_3, deduped_7_2 ), deduped_2_3, DivIntWithGivenQuotient( deduped_7_2, deduped_1_3, deduped_2_3 * Product( deduped_3_2{[ deduped_3_3 + 1 .. deduped_19_1 ]} ) ) ) )]];
                    end ) ) );
        end );
end
########
        
    , 802 : IsPrecompiledDerivation := true );
    
    ##
    cat!.cached_precompiled_functions.MorphismsOfExternalHom :=
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1, deduped_5_1, deduped_6_1, hoisted_9_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1;
    deduped_23_1 := UnderlyingCategory( cat_1 );
    deduped_22_1 := PairOfIntAndList( arg2_1 );
    deduped_21_1 := PairOfIntAndList( arg3_1 );
    deduped_20_1 := DataTables( deduped_23_1 );
    deduped_19_1 := deduped_22_1[1];
    deduped_18_1 := deduped_21_1[1];
    deduped_17_1 := deduped_20_1[2];
    deduped_16_1 := [ 0 .. deduped_18_1 ^ deduped_19_1 - 1 ];
    deduped_6_1 := List( deduped_21_1[2], IndexOfObject );
    deduped_5_1 := [ 0 .. deduped_19_1 - 1 ];
    deduped_2_1 := deduped_17_1[5];
    deduped_1_1 := List( deduped_22_1[2], IndexOfObject );
    deduped_15_1 := List( deduped_16_1, function ( m_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_5_1, function ( i_3 )
                    return DigitInPositionalNotation( m_2, i_3, deduped_19_1, deduped_18_1 );
                end );
            return Product( List( deduped_5_1, function ( i_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + i_3;
                      return deduped_2_1[1 + deduped_1_1[deduped_1_3]][1 + deduped_6_1[1 + hoisted_1_2[deduped_1_3]]];
                  end ) );
        end );
    hoisted_11_1 := deduped_17_1[3];
    hoisted_9_1 := deduped_17_1[2];
    hoisted_14_1 := List( [ 0 .. deduped_20_1[1][2] - 1 ], function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return CreateCapCategoryMorphismWithAttributes( deduped_23_1, CreateCapCategoryObjectWithAttributes( deduped_23_1, IndexOfObject, hoisted_9_1[deduped_1_2] ), CreateCapCategoryObjectWithAttributes( deduped_23_1, IndexOfObject, hoisted_11_1[deduped_1_2] ), IndexOfMorphism, i_2 );
        end );
    hoisted_13_1 := List( deduped_16_1, function ( m_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( deduped_5_1, function ( i_3 )
                    return DigitInPositionalNotation( m_2, i_3, deduped_19_1, deduped_18_1 );
                end );
            return List( deduped_5_1, function ( i_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + i_3;
                    return deduped_2_1[1 + deduped_1_1[deduped_1_3]][1 + deduped_6_1[1 + hoisted_1_2[deduped_1_3]]];
                end );
        end );
    hoisted_12_1 := deduped_17_1[8];
    return List( [ 0 .. Sum( deduped_15_1 ) - 1 ], function ( i_2 )
            local deduped_3_2, hoisted_5_2, hoisted_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2, deduped_11_2;
            deduped_10_2 := BigInt( SafeFirst( deduped_16_1, function ( i_3 )
                      return Sum( deduped_15_1{[ 1 .. 1 + i_3 ]} ) > i_2;
                  end ) );
            deduped_11_2 := List( deduped_5_1, function ( i_3 )
                    return DigitInPositionalNotation( deduped_10_2, i_3, deduped_19_1, deduped_18_1 );
                end );
            deduped_9_2 := 1 + deduped_10_2;
            deduped_8_2 := deduped_15_1[deduped_9_2];
            deduped_7_2 := Sum( deduped_15_1{[ 1 .. deduped_10_2 ]} );
            hoisted_6_2 := BigInt( SafePosition( [ deduped_7_2 .. deduped_7_2 + deduped_8_2 - 1 ], i_2 ) );
            hoisted_5_2 := [ 0 .. deduped_8_2 - 1 ];
            deduped_3_2 := hoisted_13_1[deduped_9_2];
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, PairOfLists, NTuple( 2, deduped_11_2, List( deduped_5_1, function ( i_3 )
                        local hoisted_3_3, deduped_4_3, deduped_5_3, deduped_6_3;
                        deduped_6_3 := 1 + i_3;
                        deduped_5_3 := deduped_3_2[deduped_6_3];
                        deduped_4_3 := Product( deduped_3_2{[ 1 .. i_3 ]} );
                        hoisted_3_3 := DivIntWithGivenQuotient( deduped_8_2, deduped_4_3, deduped_5_3 * Product( deduped_3_2{[ deduped_6_3 + 1 .. deduped_19_1 ]} ) );
                        return hoisted_14_1[1 + hoisted_12_1[1 + deduped_1_1[deduped_6_3]][1 + deduped_6_1[1 + deduped_11_2[deduped_6_3]]][1 + List( hoisted_5_2, function ( i_4 )
                                        return RemIntWithDomain( QuoIntWithDomain( i_4, deduped_4_3, deduped_8_2 ), deduped_5_3, hoisted_3_3 );
                                    end )[hoisted_6_2]]];
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

BindGlobal( "FiniteStrictCoproductCompletionOfCategoryFromDataTablesPrecompiled", function ( quiver )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function ( quiver )
    local sFinSets;
    sFinSets := SkeletalCategoryOfFiniteSets(  : FinalizeCategory := true,
        overhead := true );
    return FiniteStrictCoproductCompletion( CategoryFromDataTables( FreeCategory( quiver : range_of_HomStructure := sFinSets,
            FinalizeCategory := true ) : FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor( quiver : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_FiniteStrictCoproductCompletionOfCategoryFromDataTablesPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
