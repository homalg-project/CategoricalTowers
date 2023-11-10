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
    local hoisted_1_1, hoisted_2_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := PairOfIntAndList( arg2_1 );
    deduped_8_1 := PairOfIntAndList( arg3_1 );
    deduped_7_1 := deduped_9_1[1];
    deduped_6_1 := deduped_8_1[1];
    hoisted_5_1 := [ 0 .. deduped_7_1 - 1 ];
    hoisted_4_1 := List( deduped_8_1[2], IndexOfObject );
    hoisted_2_1 := DataTables( UnderlyingCategory( cat_1 ) )[2][5];
    hoisted_1_1 := List( deduped_9_1[2], IndexOfObject );
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, Sum( List( [ 0 .. deduped_6_1 ^ deduped_7_1 - 1 ], function ( m_2 )
                return Product( List( hoisted_5_1, function ( i_3 )
                          return hoisted_2_1[1 + hoisted_1_1[(1 + i_3)]][1 + hoisted_4_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( m_2, deduped_6_1 ^ CAP_JIT_INCOMPLETE_LOGIC( i_3 ) ), deduped_6_1 ) ))]];
                      end ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddHomomorphismStructureOnMorphismsWithGivenObjects( cat,
        
########
function ( cat_1, source_1, alpha_1, beta_1, range_1 )
    local deduped_1_1, deduped_2_1, deduped_4_1, deduped_6_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_12_1, hoisted_13_1, deduped_14_1, deduped_15_1, hoisted_16_1, deduped_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1;
    deduped_43_1 := PairOfLists( beta_1 );
    deduped_42_1 := PairOfLists( alpha_1 );
    deduped_41_1 := PairOfIntAndList( Source( beta_1 ) );
    deduped_40_1 := PairOfIntAndList( Target( alpha_1 ) );
    deduped_39_1 := PairOfIntAndList( Target( beta_1 ) );
    deduped_38_1 := PairOfIntAndList( Source( alpha_1 ) );
    deduped_37_1 := deduped_40_1[1];
    deduped_36_1 := deduped_41_1[1];
    deduped_35_1 := deduped_38_1[1];
    deduped_34_1 := deduped_39_1[2];
    deduped_33_1 := deduped_39_1[1];
    deduped_32_1 := DataTables( UnderlyingCategory( cat_1 ) )[2];
    deduped_31_1 := deduped_38_1[2];
    deduped_30_1 := [ 0 .. deduped_35_1 - 1 ];
    deduped_29_1 := [ 0 .. deduped_33_1 ^ deduped_35_1 - 1 ];
    deduped_28_1 := [ 0 .. deduped_36_1 ^ deduped_37_1 - 1 ];
    deduped_4_1 := List( deduped_34_1, IndexOfObject );
    deduped_2_1 := deduped_32_1[5];
    deduped_1_1 := List( deduped_31_1, IndexOfObject );
    hoisted_27_1 := List( deduped_29_1, function ( m_2 )
            return List( deduped_30_1, function ( i_3 )
                    return deduped_2_1[1 + deduped_1_1[(1 + i_3)]][1 + deduped_4_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( m_2, deduped_33_1 ^ CAP_JIT_INCOMPLETE_LOGIC( i_3 ) ), deduped_33_1 ) ))]];
                end );
        end );
    hoisted_26_1 := BigInt( 1 );
    hoisted_25_1 := deduped_32_1[7];
    deduped_15_1 := deduped_32_1[1];
    hoisted_24_1 := List( deduped_34_1, function ( objC_2 )
            return deduped_15_1[1 + IndexOfObject( objC_2 )];
        end );
    hoisted_23_1 := List( deduped_43_1[2], IndexOfMorphism );
    deduped_12_1 := deduped_42_1[1];
    hoisted_22_1 := List( deduped_30_1, function ( i_2 )
            return deduped_12_1[1 + i_2];
        end );
    deduped_9_1 := [ 0 .. deduped_37_1 - 1 ];
    deduped_8_1 := List( deduped_41_1[2], IndexOfObject );
    deduped_6_1 := List( deduped_40_1[2], IndexOfObject );
    hoisted_21_1 := List( deduped_28_1, function ( m_2 )
            return List( deduped_9_1, function ( i_3 )
                    return deduped_2_1[1 + deduped_6_1[(1 + i_3)]][1 + deduped_8_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( m_2, deduped_36_1 ^ CAP_JIT_INCOMPLETE_LOGIC( i_3 ) ), deduped_36_1 ) ))]];
                end );
        end );
    hoisted_20_1 := deduped_32_1[8];
    hoisted_18_1 := List( deduped_42_1[2], IndexOfMorphism );
    deduped_17_1 := deduped_32_1[4];
    hoisted_16_1 := List( deduped_31_1, function ( objC_2 )
            return deduped_15_1[1 + IndexOfObject( objC_2 )];
        end );
    hoisted_19_1 := List( deduped_30_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return deduped_17_1[1 + hoisted_16_1[deduped_1_2]][1 + hoisted_18_1[deduped_1_2]];
        end );
    deduped_14_1 := List( deduped_29_1, function ( m_2 )
            return Product( List( deduped_30_1, function ( i_3 )
                      return deduped_2_1[1 + deduped_1_1[(1 + i_3)]][1 + deduped_4_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( m_2, deduped_33_1 ^ CAP_JIT_INCOMPLETE_LOGIC( i_3 ) ), deduped_33_1 ) ))]];
                  end ) );
        end );
    hoisted_13_1 := deduped_43_1[1];
    deduped_10_1 := List( deduped_28_1, function ( m_2 )
            return Product( List( deduped_9_1, function ( i_3 )
                      return deduped_2_1[1 + deduped_6_1[(1 + i_3)]][1 + deduped_8_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( m_2, deduped_36_1 ^ CAP_JIT_INCOMPLETE_LOGIC( i_3 ) ), deduped_36_1 ) ))]];
                  end ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), source_1, range_1, AsList, Concatenation( List( [ 0 .. Length( source_1 ) - 1 ], function ( i_2 )
                local deduped_2_2, deduped_3_2, deduped_4_2, hoisted_5_2, hoisted_6_2, hoisted_7_2, deduped_8_2, deduped_9_2, deduped_10_2, deduped_11_2, deduped_12_2, deduped_13_2, deduped_14_2;
                deduped_12_2 := BigInt( SafeFirst( deduped_28_1, function ( i_3 )
                          return Sum( deduped_10_1{[ 1 .. 1 + i_3 ]} ) > i_2;
                      end ) );
                deduped_2_2 := List( deduped_9_1, function ( i_3 )
                        return REM_INT( QUO_INT( deduped_12_2, deduped_36_1 ^ i_3 ), deduped_36_1 );
                    end );
                deduped_3_2 := List( deduped_30_1, function ( i_3 )
                        return hoisted_13_1[1 + deduped_2_2[(1 + deduped_12_1[(1 + i_3)])]];
                    end );
                deduped_14_2 := Sum( deduped_30_1, function ( i_3 )
                        return deduped_3_2[(1 + i_3)] * deduped_33_1 ^ i_3;
                    end );
                deduped_13_2 := 1 + deduped_14_2;
                deduped_11_2 := Sum( deduped_14_1{[ 1 .. deduped_14_2 ]} );
                deduped_10_2 := 1 + deduped_12_2;
                deduped_9_2 := deduped_10_1[deduped_10_2];
                deduped_8_2 := Sum( deduped_10_1{[ 1 .. deduped_12_2 ]} );
                hoisted_7_2 := hoisted_27_1[deduped_13_2];
                hoisted_5_2 := CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. deduped_9_2 - 1 ][BigInt( SafePosition( [ deduped_8_2 .. deduped_8_2 + deduped_9_2 - 1 ], i_2 ) )] );
                deduped_4_2 := hoisted_21_1[deduped_10_2];
                hoisted_6_2 := List( deduped_9_1, function ( i_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + i_3;
                        return hoisted_20_1[1 + deduped_6_1[deduped_1_3]][1 + deduped_8_1[(1 + deduped_2_2[deduped_1_3])]][1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( hoisted_5_2, Product( deduped_4_2{[ 1 .. i_3 ]} ) ), deduped_4_2[deduped_1_3] ) )];
                    end );
                return [ [ deduped_11_2 .. deduped_11_2 + deduped_14_1[deduped_13_2] - 1 ][1 + Sum( deduped_30_1, function ( j_3 )
                               local deduped_1_3, deduped_2_3;
                               deduped_2_3 := CAP_JIT_INCOMPLETE_LOGIC( j_3 );
                               deduped_1_3 := (1 + deduped_2_3);
                               return CAP_JIT_INCOMPLETE_LOGIC( hoisted_25_1[(1 + deduped_17_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_17_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_17_1[(1 + hoisted_19_1[deduped_1_3])][(1 + hoisted_6_2[(1 + hoisted_22_1[deduped_1_3])])] ))][(1 + hoisted_23_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_2_2[(1 + deduped_12_1[deduped_1_3])] ))])] ))][(1 + hoisted_24_1[(1 + deduped_3_2[(1 + deduped_2_3)])])])] )[hoisted_26_1] * CAP_JIT_INCOMPLETE_LOGIC( Product( hoisted_7_2{[ 1 .. deduped_2_3 ]} ) );
                           end )] ];
            end ) ) );
end
########
        
    , 1503 : IsPrecompiledDerivation := true );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local deduped_1_1, deduped_2_1, deduped_4_1, hoisted_7_1, hoisted_9_1, hoisted_11_1, hoisted_12_1, hoisted_14_1, deduped_15_1, hoisted_16_1, hoisted_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1;
    deduped_32_1 := AsList( alpha_1 );
    deduped_31_1 := PairOfIntAndList( range_1 );
    deduped_30_1 := UnderlyingCategory( cat_1 );
    deduped_29_1 := PairOfIntAndList( source_1 );
    deduped_28_1 := deduped_31_1[1];
    deduped_27_1 := DataTables( deduped_30_1 );
    deduped_26_1 := deduped_29_1[1];
    deduped_25_1 := deduped_27_1[2];
    deduped_24_1 := [ 0 .. deduped_26_1 - 1 ];
    deduped_23_1 := [ 0 .. deduped_28_1 ^ deduped_26_1 - 1 ];
    deduped_4_1 := List( deduped_31_1[2], IndexOfObject );
    deduped_2_1 := deduped_25_1[5];
    deduped_1_1 := List( deduped_29_1[2], IndexOfObject );
    deduped_20_1 := List( deduped_23_1, function ( m_2 )
            return Product( List( deduped_24_1, function ( i_3 )
                      return deduped_2_1[1 + deduped_1_1[(1 + i_3)]][1 + deduped_4_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( m_2, deduped_28_1 ^ CAP_JIT_INCOMPLETE_LOGIC( i_3 ) ), deduped_28_1 ) ))]];
                  end ) );
        end );
    hoisted_7_1 := deduped_32_1[1];
    deduped_21_1 := BigInt( SafeFirst( deduped_23_1, function ( i_2 )
              return Sum( deduped_20_1{[ 1 .. 1 + i_2 ]} ) > hoisted_7_1;
          end ) );
    deduped_22_1 := List( deduped_24_1, function ( i_2 )
            return REM_INT( QUO_INT( deduped_21_1, deduped_28_1 ^ i_2 ), deduped_28_1 );
        end );
    deduped_19_1 := deduped_20_1[1 + deduped_21_1];
    deduped_18_1 := Sum( deduped_20_1{[ 1 .. deduped_21_1 ]} );
    hoisted_11_1 := deduped_25_1[3];
    hoisted_9_1 := deduped_25_1[2];
    hoisted_17_1 := List( [ 0 .. deduped_27_1[1][2] - 1 ], function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return CreateCapCategoryMorphismWithAttributes( deduped_30_1, CreateCapCategoryObjectWithAttributes( deduped_30_1, IndexOfObject, hoisted_9_1[deduped_1_2] ), CreateCapCategoryObjectWithAttributes( deduped_30_1, IndexOfObject, hoisted_11_1[deduped_1_2] ), IndexOfMorphism, i_2 );
        end );
    hoisted_16_1 := CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. deduped_19_1 - 1 ][BigInt( SafePosition( [ deduped_18_1 .. deduped_18_1 + deduped_19_1 - 1 ], deduped_32_1[1 + CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. (Length( Source( alpha_1 ) ) - 1) ][1] )] ) )] );
    hoisted_14_1 := CAP_JIT_INCOMPLETE_LOGIC( deduped_21_1 );
    deduped_15_1 := CAP_JIT_INCOMPLETE_LOGIC( List( deduped_24_1, function ( i_2 )
              return deduped_2_1[1 + deduped_1_1[(1 + i_2)]][1 + deduped_4_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( hoisted_14_1, deduped_28_1 ^ CAP_JIT_INCOMPLETE_LOGIC( i_2 ) ), deduped_28_1 ) ))]];
          end ) );
    hoisted_12_1 := deduped_25_1[8];
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, PairOfLists, NTuple( 2, deduped_22_1, List( deduped_24_1, function ( i_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + i_2;
                return hoisted_17_1[1 + hoisted_12_1[(1 + deduped_1_1[deduped_1_2])][(1 + deduped_4_1[(1 + deduped_22_1[deduped_1_2])])][(1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( hoisted_16_1, Product( deduped_15_1{[ 1 .. i_2 ]} ) ), deduped_15_1[deduped_1_2] ) ))]];
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1, deduped_4_1, deduped_5_1, hoisted_9_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1;
    deduped_24_1 := UnderlyingCategory( cat_1 );
    deduped_23_1 := PairOfIntAndList( arg2_1 );
    deduped_22_1 := PairOfIntAndList( arg3_1 );
    deduped_21_1 := DataTables( deduped_24_1 );
    deduped_20_1 := deduped_23_1[1];
    deduped_19_1 := deduped_22_1[1];
    deduped_18_1 := deduped_21_1[2];
    deduped_17_1 := [ 0 .. deduped_19_1 ^ deduped_20_1 - 1 ];
    deduped_5_1 := [ 0 .. deduped_20_1 - 1 ];
    deduped_4_1 := List( deduped_22_1[2], IndexOfObject );
    deduped_2_1 := deduped_18_1[5];
    deduped_1_1 := List( deduped_23_1[2], IndexOfObject );
    deduped_16_1 := List( deduped_17_1, function ( m_2 )
            return Product( List( deduped_5_1, function ( i_3 )
                      return deduped_2_1[1 + deduped_1_1[(1 + i_3)]][1 + deduped_4_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( m_2, deduped_19_1 ^ CAP_JIT_INCOMPLETE_LOGIC( i_3 ) ), deduped_19_1 ) ))]];
                  end ) );
        end );
    deduped_15_1 := Sum( deduped_16_1 );
    hoisted_11_1 := deduped_18_1[3];
    hoisted_9_1 := deduped_18_1[2];
    hoisted_14_1 := List( [ 0 .. deduped_21_1[1][2] - 1 ], function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return CreateCapCategoryMorphismWithAttributes( deduped_24_1, CreateCapCategoryObjectWithAttributes( deduped_24_1, IndexOfObject, hoisted_9_1[deduped_1_2] ), CreateCapCategoryObjectWithAttributes( deduped_24_1, IndexOfObject, hoisted_11_1[deduped_1_2] ), IndexOfMorphism, i_2 );
        end );
    hoisted_13_1 := List( deduped_17_1, function ( m_2 )
            return List( deduped_5_1, function ( i_3 )
                    return deduped_2_1[1 + deduped_1_1[(1 + i_3)]][1 + deduped_4_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( m_2, deduped_19_1 ^ CAP_JIT_INCOMPLETE_LOGIC( i_3 ) ), deduped_19_1 ) ))]];
                end );
        end );
    hoisted_12_1 := deduped_18_1[8];
    return List( [ 0 .. deduped_15_1 - 1 ], function ( i_2 )
            local deduped_4_2, hoisted_5_2, deduped_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2, deduped_11_2;
            deduped_11_2 := REM_INT( i_2, deduped_15_1 );
            deduped_9_2 := BigInt( SafeFirst( deduped_17_1, function ( i_3 )
                      return Sum( deduped_16_1{[ 1 .. 1 + i_3 ]} ) > deduped_11_2;
                  end ) );
            deduped_10_2 := List( deduped_5_1, function ( i_3 )
                    return REM_INT( QUO_INT( deduped_9_2, deduped_19_1 ^ i_3 ), deduped_19_1 );
                end );
            deduped_8_2 := 1 + deduped_9_2;
            deduped_7_2 := deduped_16_1[deduped_8_2];
            deduped_6_2 := Sum( deduped_16_1{[ 1 .. deduped_9_2 ]} );
            hoisted_5_2 := CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. deduped_7_2 - 1 ][BigInt( SafePosition( [ deduped_6_2 .. deduped_6_2 + deduped_7_2 - 1 ], deduped_11_2 ) )] );
            deduped_4_2 := hoisted_13_1[deduped_8_2];
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, PairOfLists, NTuple( 2, deduped_10_2, List( deduped_5_1, function ( i_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + i_3;
                        return hoisted_14_1[1 + hoisted_12_1[(1 + deduped_1_1[deduped_1_3])][(1 + deduped_4_1[(1 + deduped_10_2[deduped_1_3])])][(1 + CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( hoisted_5_2, Product( deduped_4_2{[ 1 .. i_3 ]} ) ), deduped_4_2[deduped_1_3] ) ))]];
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
