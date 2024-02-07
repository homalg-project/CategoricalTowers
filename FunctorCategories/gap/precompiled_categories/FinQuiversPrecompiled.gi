# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_FinQuiversPrecompiled", function ( cat )
    
    ##
    AddInitialObject( cat,
        
########
function ( cat_1 )
    local deduped_1_1;
    deduped_1_1 := BigInt( 0 );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfQuiverEnrichedOverSkeletalFinSets, NTuple( 3, deduped_1_1, deduped_1_1, [  ] ) );
end
########
        
    , 100 );
    
    ##
    AddCoproduct( cat,
        
########
function ( cat_1, objects_1 )
    local deduped_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := [ 1 .. Length( objects_1 ) ];
    deduped_4_1 := List( objects_1, function ( x_2 )
            return DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( x_2 )[2];
        end );
    deduped_3_1 := List( objects_1, function ( x_2 )
            return DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( x_2 )[1];
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfQuiverEnrichedOverSkeletalFinSets, NTuple( 3, Sum( deduped_3_1 ), Sum( deduped_4_1 ), ListN( Concatenation( List( deduped_5_1, function ( i_2 )
                    local hoisted_1_2, hoisted_2_2, deduped_3_2;
                    deduped_3_2 := Sum( deduped_3_1{[ 1 .. i_2 - 1 ]} );
                    hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_3_1[i_2] - 1 ];
                    hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( List( DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( CAP_JIT_INCOMPLETE_LOGIC( objects_1[i_2] ) )[3], function ( a_3 )
                              return a_3[1];
                          end ) );
                    return List( [ 0 .. deduped_4_1[i_2] - 1 ], function ( i_3 )
                            return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                        end );
                end ) ), Concatenation( List( deduped_5_1, function ( i_2 )
                    local hoisted_1_2, hoisted_2_2, deduped_3_2;
                    deduped_3_2 := Sum( deduped_3_1{[ 1 .. i_2 - 1 ]} );
                    hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_3_1[i_2] - 1 ];
                    hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( List( DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( CAP_JIT_INCOMPLETE_LOGIC( objects_1[i_2] ) )[3], function ( a_3 )
                              return a_3[2];
                          end ) );
                    return List( [ 0 .. deduped_4_1[i_2] - 1 ], function ( i_3 )
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
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, BigInt( 1 ) );
end
########
        
    , 100 );
    
    ##
    AddHomomorphismStructureOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, hoisted_2_1, hoisted_3_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, deduped_12_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1;
    deduped_39_1 := UnderlyingCategory( cat_1 );
    deduped_38_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_37_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_36_1 := CreateCapCategoryObjectWithAttributes( deduped_39_1, IndexOfObject, 1 );
    deduped_35_1 := CreateCapCategoryObjectWithAttributes( deduped_39_1, IndexOfObject, 0 );
    deduped_34_1 := deduped_38_1[3];
    deduped_33_1 := deduped_37_1[3];
    deduped_32_1 := deduped_37_1[2];
    deduped_31_1 := deduped_38_1[1];
    deduped_30_1 := deduped_37_1[1];
    deduped_29_1 := ListWithIdenticalEntries( deduped_32_1, deduped_31_1 );
    deduped_28_1 := deduped_30_1 + deduped_32_1;
    deduped_27_1 := [ 0 .. deduped_32_1 - 1 ];
    deduped_26_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_39_1, deduped_35_1, deduped_36_1, IndexOfMorphism, 1 ), CreateCapCategoryMorphismWithAttributes( deduped_39_1, deduped_35_1, deduped_36_1, IndexOfMorphism, 2 ) ];
    deduped_25_1 := [ List( deduped_34_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_34_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_24_1 := Concatenation( ListWithIdenticalEntries( deduped_30_1, deduped_31_1 ), ListWithIdenticalEntries( deduped_32_1, deduped_38_1[2] ) );
    deduped_23_1 := [ 0 .. deduped_32_1 + deduped_32_1 - 1 ];
    deduped_22_1 := ListWithIdenticalEntries( deduped_32_1, [ 0 .. deduped_31_1 - 1 ] );
    deduped_21_1 := Product( deduped_24_1 );
    deduped_20_1 := ListWithIdenticalEntries( deduped_32_1, deduped_21_1 );
    deduped_19_1 := [ 0 .. deduped_21_1 - 1 ];
    hoisted_15_1 := [ deduped_30_1 .. deduped_28_1 - 1 ];
    deduped_18_1 := List( deduped_27_1, function ( i_2 )
            local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := hoisted_15_1[1 + i_2];
            deduped_6_2 := 1 + deduped_7_2;
            deduped_5_2 := deduped_24_1[deduped_6_2];
            deduped_4_2 := Product( deduped_24_1{[ 1 .. deduped_7_2 ]} );
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_21_1, deduped_4_2, deduped_5_2 * Product( deduped_24_1{[ (deduped_6_2 + 1) .. deduped_28_1 ]} ) );
            return List( deduped_19_1, function ( i_3 )
                    return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_21_1 ), deduped_5_2, hoisted_3_2 );
                end );
        end );
    hoisted_16_1 := Concatenation( deduped_18_1, deduped_18_1 );
    hoisted_14_1 := Concatenation( ListWithIdenticalEntries( deduped_32_1, deduped_25_1[SafeUniquePositionProperty( deduped_26_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                     return IndexOfMorphism( mor_2 ) = 1;
                 else
                     return false;
                 fi;
                 return;
             end )] ), ListWithIdenticalEntries( deduped_32_1, deduped_25_1[SafeUniquePositionProperty( deduped_26_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                     return IndexOfMorphism( mor_2 ) = 2;
                 else
                     return false;
                 fi;
                 return;
             end )] ) );
    deduped_1_1 := Concatenation( deduped_20_1, deduped_20_1 );
    hoisted_17_1 := List( deduped_23_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_14_1[deduped_3_2];
            hoisted_1_2 := hoisted_16_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_11_1 := Concatenation( deduped_29_1, deduped_29_1 );
    deduped_12_1 := List( deduped_23_1, function ( j_2 )
            return Product( hoisted_11_1{[ 1 .. j_2 ]} );
        end );
    hoisted_8_1 := List( deduped_33_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_3_1 := List( deduped_33_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_9_1 := Concatenation( List( deduped_27_1, function ( i_2 )
              local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := hoisted_3_1[1 + i_2];
              deduped_6_2 := 1 + deduped_7_2;
              deduped_5_2 := deduped_24_1[deduped_6_2];
              deduped_4_2 := Product( deduped_24_1{[ 1 .. deduped_7_2 ]} );
              hoisted_3_2 := DivIntWithGivenQuotient( deduped_21_1, deduped_4_2, deduped_5_2 * Product( deduped_24_1{[ (deduped_6_2 + 1) .. deduped_28_1 ]} ) );
              return List( deduped_19_1, function ( i_3 )
                      return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_21_1 ), deduped_5_2, hoisted_3_2 );
                  end );
          end ), List( deduped_27_1, function ( i_2 )
              local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := hoisted_8_1[1 + i_2];
              deduped_6_2 := 1 + deduped_7_2;
              deduped_5_2 := deduped_24_1[deduped_6_2];
              deduped_4_2 := Product( deduped_24_1{[ 1 .. deduped_7_2 ]} );
              hoisted_3_2 := DivIntWithGivenQuotient( deduped_21_1, deduped_4_2, deduped_5_2 * Product( deduped_24_1{[ (deduped_6_2 + 1) .. deduped_28_1 ]} ) );
              return List( deduped_19_1, function ( i_3 )
                      return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_21_1 ), deduped_5_2, hoisted_3_2 );
                  end );
          end ) );
    hoisted_2_1 := Concatenation( deduped_22_1, deduped_22_1 );
    hoisted_10_1 := List( deduped_23_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_2_1[deduped_3_2];
            hoisted_1_2 := hoisted_9_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, Length( Filtered( deduped_19_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_23_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_10_1[deduped_1_3][deduped_1_2] * deduped_12_1[deduped_1_3];
                        end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_23_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_17_1[deduped_1_3][deduped_1_2] * deduped_12_1[deduped_1_3];
                        end ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local deduped_1_1, hoisted_2_1, hoisted_3_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, deduped_12_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_21_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1;
    deduped_48_1 := UnderlyingCategory( cat_1 );
    deduped_47_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( range_1 );
    deduped_46_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( source_1 );
    deduped_45_1 := CreateCapCategoryObjectWithAttributes( deduped_48_1, IndexOfObject, 1 );
    deduped_44_1 := CreateCapCategoryObjectWithAttributes( deduped_48_1, IndexOfObject, 0 );
    deduped_43_1 := deduped_47_1[3];
    deduped_42_1 := deduped_46_1[3];
    deduped_41_1 := deduped_47_1[2];
    deduped_40_1 := deduped_47_1[1];
    deduped_39_1 := deduped_46_1[2];
    deduped_38_1 := deduped_46_1[1];
    deduped_37_1 := ListWithIdenticalEntries( deduped_39_1, deduped_40_1 );
    deduped_36_1 := deduped_38_1 + deduped_39_1;
    deduped_35_1 := [ 0 .. deduped_39_1 - 1 ];
    deduped_34_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_48_1, deduped_44_1, deduped_45_1, IndexOfMorphism, 1 ), CreateCapCategoryMorphismWithAttributes( deduped_48_1, deduped_44_1, deduped_45_1, IndexOfMorphism, 2 ) ];
    deduped_33_1 := [ List( deduped_43_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_43_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_32_1 := Concatenation( ListWithIdenticalEntries( deduped_38_1, deduped_40_1 ), ListWithIdenticalEntries( deduped_39_1, deduped_41_1 ) );
    deduped_31_1 := [ 0 .. deduped_39_1 + deduped_39_1 - 1 ];
    deduped_30_1 := ListWithIdenticalEntries( deduped_39_1, [ 0 .. deduped_40_1 - 1 ] );
    deduped_29_1 := Product( deduped_32_1 );
    deduped_28_1 := Product( deduped_32_1{[ 1 .. deduped_38_1 ]} );
    deduped_27_1 := ListWithIdenticalEntries( deduped_39_1, deduped_29_1 );
    deduped_26_1 := [ 0 .. deduped_29_1 - 1 ];
    hoisted_15_1 := [ deduped_38_1 .. deduped_36_1 - 1 ];
    deduped_25_1 := List( deduped_35_1, function ( i_2 )
            local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := hoisted_15_1[1 + i_2];
            deduped_6_2 := 1 + deduped_7_2;
            deduped_5_2 := deduped_32_1[deduped_6_2];
            deduped_4_2 := Product( deduped_32_1{[ 1 .. deduped_7_2 ]} );
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_29_1, deduped_4_2, deduped_5_2 * Product( deduped_32_1{[ (deduped_6_2 + 1) .. deduped_36_1 ]} ) );
            return List( deduped_26_1, function ( i_3 )
                    return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_29_1 ), deduped_5_2, hoisted_3_2 );
                end );
        end );
    hoisted_16_1 := Concatenation( deduped_25_1, deduped_25_1 );
    hoisted_14_1 := Concatenation( ListWithIdenticalEntries( deduped_39_1, deduped_33_1[SafeUniquePositionProperty( deduped_34_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                     return IndexOfMorphism( mor_2 ) = 1;
                 else
                     return false;
                 fi;
                 return;
             end )] ), ListWithIdenticalEntries( deduped_39_1, deduped_33_1[SafeUniquePositionProperty( deduped_34_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                     return IndexOfMorphism( mor_2 ) = 2;
                 else
                     return false;
                 fi;
                 return;
             end )] ) );
    deduped_1_1 := Concatenation( deduped_27_1, deduped_27_1 );
    hoisted_17_1 := List( deduped_31_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_14_1[deduped_3_2];
            hoisted_1_2 := hoisted_16_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_11_1 := Concatenation( deduped_37_1, deduped_37_1 );
    deduped_12_1 := List( deduped_31_1, function ( j_2 )
            return Product( hoisted_11_1{[ 1 .. j_2 ]} );
        end );
    hoisted_8_1 := List( deduped_42_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_3_1 := List( deduped_42_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_9_1 := Concatenation( List( deduped_35_1, function ( i_2 )
              local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := hoisted_3_1[1 + i_2];
              deduped_6_2 := 1 + deduped_7_2;
              deduped_5_2 := deduped_32_1[deduped_6_2];
              deduped_4_2 := Product( deduped_32_1{[ 1 .. deduped_7_2 ]} );
              hoisted_3_2 := DivIntWithGivenQuotient( deduped_29_1, deduped_4_2, deduped_5_2 * Product( deduped_32_1{[ (deduped_6_2 + 1) .. deduped_36_1 ]} ) );
              return List( deduped_26_1, function ( i_3 )
                      return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_29_1 ), deduped_5_2, hoisted_3_2 );
                  end );
          end ), List( deduped_35_1, function ( i_2 )
              local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := hoisted_8_1[1 + i_2];
              deduped_6_2 := 1 + deduped_7_2;
              deduped_5_2 := deduped_32_1[deduped_6_2];
              deduped_4_2 := Product( deduped_32_1{[ 1 .. deduped_7_2 ]} );
              hoisted_3_2 := DivIntWithGivenQuotient( deduped_29_1, deduped_4_2, deduped_5_2 * Product( deduped_32_1{[ (deduped_6_2 + 1) .. deduped_36_1 ]} ) );
              return List( deduped_26_1, function ( i_3 )
                      return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_29_1 ), deduped_5_2, hoisted_3_2 );
                  end );
          end ) );
    hoisted_2_1 := Concatenation( deduped_30_1, deduped_30_1 );
    hoisted_10_1 := List( deduped_31_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_2_1[deduped_3_2];
            hoisted_1_2 := hoisted_9_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_24_1 := CAP_JIT_INCOMPLETE_LOGIC( Filtered( deduped_26_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_31_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_10_1[deduped_1_3][deduped_1_2] * deduped_12_1[deduped_1_3];
                        end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_31_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_17_1[deduped_1_3][deduped_1_2] * deduped_12_1[deduped_1_3];
                        end ) );
            end )[1 + AsList( alpha_1 )[(1 + CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. (Length( Source( alpha_1 ) ) - 1) ][1] ))]] );
    hoisted_21_1 := CAP_JIT_INCOMPLETE_LOGIC( QuoIntWithDomain( deduped_24_1, deduped_28_1, deduped_29_1 ) );
    hoisted_18_1 := CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( deduped_24_1, deduped_28_1, deduped_29_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, DefiningPairOfQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( [ 0 .. deduped_38_1 - 1 ], function ( i_2 )
                return DigitInPositionalNotation( hoisted_18_1, i_2, deduped_38_1, deduped_40_1 );
            end ), List( deduped_35_1, function ( i_2 )
                return DigitInPositionalNotation( hoisted_21_1, i_2, deduped_39_1, deduped_41_1 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, hoisted_2_1, hoisted_3_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, deduped_12_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, deduped_19_1, hoisted_22_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1;
    deduped_49_1 := UnderlyingCategory( cat_1 );
    deduped_48_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_47_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_46_1 := CreateCapCategoryObjectWithAttributes( deduped_49_1, IndexOfObject, 1 );
    deduped_45_1 := CreateCapCategoryObjectWithAttributes( deduped_49_1, IndexOfObject, 0 );
    deduped_44_1 := deduped_48_1[3];
    deduped_43_1 := deduped_47_1[3];
    deduped_42_1 := deduped_48_1[2];
    deduped_41_1 := deduped_47_1[2];
    deduped_40_1 := deduped_48_1[1];
    deduped_39_1 := deduped_47_1[1];
    deduped_38_1 := ListWithIdenticalEntries( deduped_41_1, deduped_40_1 );
    deduped_37_1 := deduped_39_1 + deduped_41_1;
    deduped_36_1 := [ 0 .. deduped_41_1 - 1 ];
    deduped_35_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_49_1, deduped_45_1, deduped_46_1, IndexOfMorphism, 1 ), CreateCapCategoryMorphismWithAttributes( deduped_49_1, deduped_45_1, deduped_46_1, IndexOfMorphism, 2 ) ];
    deduped_34_1 := [ List( deduped_44_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_44_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_33_1 := Concatenation( ListWithIdenticalEntries( deduped_39_1, deduped_40_1 ), ListWithIdenticalEntries( deduped_41_1, deduped_42_1 ) );
    deduped_32_1 := [ 0 .. deduped_41_1 + deduped_41_1 - 1 ];
    deduped_31_1 := ListWithIdenticalEntries( deduped_41_1, [ 0 .. deduped_40_1 - 1 ] );
    deduped_30_1 := Product( deduped_33_1 );
    deduped_29_1 := ListWithIdenticalEntries( deduped_41_1, deduped_30_1 );
    deduped_28_1 := [ 0 .. deduped_30_1 - 1 ];
    hoisted_15_1 := [ deduped_39_1 .. deduped_37_1 - 1 ];
    deduped_26_1 := List( deduped_36_1, function ( i_2 )
            local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := hoisted_15_1[1 + i_2];
            deduped_6_2 := 1 + deduped_7_2;
            deduped_5_2 := deduped_33_1[deduped_6_2];
            deduped_4_2 := Product( deduped_33_1{[ 1 .. deduped_7_2 ]} );
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_30_1, deduped_4_2, deduped_5_2 * Product( deduped_33_1{[ (deduped_6_2 + 1) .. deduped_37_1 ]} ) );
            return List( deduped_28_1, function ( i_3 )
                    return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_30_1 ), deduped_5_2, hoisted_3_2 );
                end );
        end );
    hoisted_16_1 := Concatenation( deduped_26_1, deduped_26_1 );
    hoisted_14_1 := Concatenation( ListWithIdenticalEntries( deduped_41_1, deduped_34_1[SafeUniquePositionProperty( deduped_35_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                     return IndexOfMorphism( mor_2 ) = 1;
                 else
                     return false;
                 fi;
                 return;
             end )] ), ListWithIdenticalEntries( deduped_41_1, deduped_34_1[SafeUniquePositionProperty( deduped_35_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                     return IndexOfMorphism( mor_2 ) = 2;
                 else
                     return false;
                 fi;
                 return;
             end )] ) );
    deduped_1_1 := Concatenation( deduped_29_1, deduped_29_1 );
    hoisted_17_1 := List( deduped_32_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_14_1[deduped_3_2];
            hoisted_1_2 := hoisted_16_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_11_1 := Concatenation( deduped_38_1, deduped_38_1 );
    deduped_12_1 := List( deduped_32_1, function ( j_2 )
            return Product( hoisted_11_1{[ 1 .. j_2 ]} );
        end );
    hoisted_8_1 := List( deduped_43_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_3_1 := List( deduped_43_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_9_1 := Concatenation( List( deduped_36_1, function ( i_2 )
              local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := hoisted_3_1[1 + i_2];
              deduped_6_2 := 1 + deduped_7_2;
              deduped_5_2 := deduped_33_1[deduped_6_2];
              deduped_4_2 := Product( deduped_33_1{[ 1 .. deduped_7_2 ]} );
              hoisted_3_2 := DivIntWithGivenQuotient( deduped_30_1, deduped_4_2, deduped_5_2 * Product( deduped_33_1{[ (deduped_6_2 + 1) .. deduped_37_1 ]} ) );
              return List( deduped_28_1, function ( i_3 )
                      return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_30_1 ), deduped_5_2, hoisted_3_2 );
                  end );
          end ), List( deduped_36_1, function ( i_2 )
              local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := hoisted_8_1[1 + i_2];
              deduped_6_2 := 1 + deduped_7_2;
              deduped_5_2 := deduped_33_1[deduped_6_2];
              deduped_4_2 := Product( deduped_33_1{[ 1 .. deduped_7_2 ]} );
              hoisted_3_2 := DivIntWithGivenQuotient( deduped_30_1, deduped_4_2, deduped_5_2 * Product( deduped_33_1{[ (deduped_6_2 + 1) .. deduped_37_1 ]} ) );
              return List( deduped_28_1, function ( i_3 )
                      return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_30_1 ), deduped_5_2, hoisted_3_2 );
                  end );
          end ) );
    hoisted_2_1 := Concatenation( deduped_31_1, deduped_31_1 );
    hoisted_10_1 := List( deduped_32_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_2_1[deduped_3_2];
            hoisted_1_2 := hoisted_9_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_27_1 := Filtered( deduped_28_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_32_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_10_1[deduped_1_3][deduped_1_2] * deduped_12_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_32_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_17_1[deduped_1_3][deduped_1_2] * deduped_12_1[deduped_1_3];
                    end ) );
        end );
    hoisted_22_1 := [ 0 .. deduped_39_1 - 1 ];
    deduped_19_1 := Product( deduped_33_1{[ 1 .. deduped_39_1 ]} );
    return List( [ 0 .. Length( deduped_27_1 ) - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_27_1[1 + i_2] );
            hoisted_2_2 := CAP_JIT_INCOMPLETE_LOGIC( QuoIntWithDomain( deduped_3_2, deduped_19_1, deduped_30_1 ) );
            hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( deduped_3_2, deduped_19_1, deduped_30_1 ) );
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( hoisted_22_1, function ( i_3 )
                        return DigitInPositionalNotation( hoisted_1_2, i_3, deduped_39_1, deduped_40_1 );
                    end ), List( deduped_36_1, function ( i_3 )
                        return DigitInPositionalNotation( hoisted_2_2, i_3, deduped_41_1, deduped_42_1 );
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

BindGlobal( "FinQuiversPrecompiled", function (  )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function (  )
    return CategoryOfQuiversEnrichedOver( SkeletalCategoryOfFiniteSets(  : FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_FinQuiversPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
