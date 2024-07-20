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
    deduped_1_1 := BigInt( 0 );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets, NTuple( 4, deduped_1_1, deduped_1_1, CapJitTypedExpression( [  ], function (  )
                return rec(
                    filter := IsList,
                    element_type := rec(
                        filter := IsInt ) );
            end ), CapJitTypedExpression( [  ], function (  )
                return rec(
                    filter := IsList,
                    element_type := rec(
                        filter := IsNTuple,
                        element_types := [ rec(
                                filter := IsInt ), rec(
                                filter := IsInt ) ] ) );
            end ) ) );
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
            return DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( x_2 )[2];
        end );
    deduped_3_1 := List( objects_1, function ( x_2 )
            return DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( x_2 )[1];
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets, NTuple( 4, Sum( deduped_3_1 ), Sum( deduped_4_1 ), Concatenation( List( deduped_5_1, function ( i_2 )
                  local hoisted_1_2, hoisted_2_2, deduped_3_2;
                  deduped_3_2 := Sum( deduped_4_1{[ 1 .. i_2 - 1 ]} );
                  hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_4_1[i_2] - 1 ];
                  hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( CAP_JIT_INCOMPLETE_LOGIC( objects_1[i_2] ) )[3] );
                  return List( [ 0 .. deduped_3_1[i_2] - 1 ], function ( i_3 )
                          return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                      end );
              end ) ), ListN( Concatenation( List( deduped_5_1, function ( i_2 )
                    local hoisted_1_2, hoisted_2_2, deduped_3_2;
                    deduped_3_2 := Sum( deduped_3_1{[ 1 .. i_2 - 1 ]} );
                    hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_3_1[i_2] - 1 ];
                    hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( List( DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( CAP_JIT_INCOMPLETE_LOGIC( objects_1[i_2] ) )[4], function ( a_3 )
                              return a_3[1];
                          end ) );
                    return List( [ 0 .. deduped_4_1[i_2] - 1 ], function ( i_3 )
                            return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                        end );
                end ) ), Concatenation( List( deduped_5_1, function ( i_2 )
                    local hoisted_1_2, hoisted_2_2, deduped_3_2;
                    deduped_3_2 := Sum( deduped_3_1{[ 1 .. i_2 - 1 ]} );
                    hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_3_1[i_2] - 1 ];
                    hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( List( DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( CAP_JIT_INCOMPLETE_LOGIC( objects_1[i_2] ) )[4], function ( a_3 )
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
    local deduped_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, deduped_14_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1;
    deduped_42_1 := UnderlyingCategory( cat_1 );
    deduped_41_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_40_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_39_1 := CreateCapCategoryObjectWithAttributes( deduped_42_1, IndexOfObject, 0 );
    deduped_38_1 := CreateCapCategoryObjectWithAttributes( deduped_42_1, IndexOfObject, 1 );
    deduped_37_1 := deduped_41_1[4];
    deduped_36_1 := deduped_40_1[4];
    deduped_35_1 := deduped_41_1[2];
    deduped_34_1 := deduped_40_1[2];
    deduped_33_1 := deduped_41_1[1];
    deduped_32_1 := deduped_40_1[1];
    deduped_31_1 := ListWithIdenticalEntries( deduped_34_1, deduped_33_1 );
    deduped_30_1 := deduped_32_1 + deduped_34_1;
    deduped_29_1 := [ 0 .. deduped_34_1 - 1 ];
    deduped_28_1 := [ 0 .. deduped_32_1 - 1 ];
    deduped_27_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_42_1, deduped_38_1, deduped_39_1, IndexOfMorphism, 1 ), CreateCapCategoryMorphismWithAttributes( deduped_42_1, deduped_39_1, deduped_38_1, IndexOfMorphism, 2 ), CreateCapCategoryMorphismWithAttributes( deduped_42_1, deduped_39_1, deduped_38_1, IndexOfMorphism, 3 ) ];
    deduped_26_1 := [ deduped_41_1[3], List( deduped_37_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_37_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_25_1 := Concatenation( ListWithIdenticalEntries( deduped_32_1, deduped_33_1 ), ListWithIdenticalEntries( deduped_34_1, deduped_35_1 ) );
    deduped_24_1 := ListWithIdenticalEntries( deduped_34_1, [ 0 .. deduped_33_1 - 1 ] );
    deduped_23_1 := Product( deduped_25_1 );
    deduped_22_1 := [ 0 .. Sum( [ deduped_32_1, deduped_34_1, deduped_34_1 ] ) - 1 ];
    deduped_21_1 := ListWithIdenticalEntries( deduped_34_1, deduped_23_1 );
    deduped_20_1 := [ 0 .. deduped_23_1 - 1 ];
    deduped_4_1 := [ deduped_32_1 .. deduped_30_1 - 1 ];
    deduped_19_1 := List( deduped_29_1, function ( i_2 )
            local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := deduped_4_1[1 + i_2];
            deduped_6_2 := 1 + deduped_7_2;
            deduped_5_2 := deduped_25_1[deduped_6_2];
            deduped_4_2 := Product( deduped_25_1{[ 1 .. deduped_7_2 ]} );
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_23_1, deduped_4_2, deduped_5_2 * Product( deduped_25_1{[ (deduped_6_2 + 1) .. deduped_30_1 ]} ) );
            return List( deduped_20_1, function ( i_3 )
                    return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_23_1 ), deduped_5_2, hoisted_3_2 );
                end );
        end );
    hoisted_17_1 := Concatenation( List( deduped_28_1, function ( i_2 )
              local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2;
              deduped_6_2 := 1 + i_2;
              deduped_5_2 := deduped_25_1[deduped_6_2];
              deduped_4_2 := Product( deduped_25_1{[ 1 .. i_2 ]} );
              hoisted_3_2 := DivIntWithGivenQuotient( deduped_23_1, deduped_4_2, deduped_5_2 * Product( deduped_25_1{[ (deduped_6_2 + 1) .. deduped_30_1 ]} ) );
              return List( deduped_20_1, function ( i_3 )
                      return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_23_1 ), deduped_5_2, hoisted_3_2 );
                  end );
          end ), deduped_19_1, deduped_19_1 );
    hoisted_16_1 := Concatenation( ListWithIdenticalEntries( deduped_32_1, deduped_26_1[SafeUniquePositionProperty( deduped_27_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 1 and IndexOfObject( Range( mor_2 ) ) = 0 then
                     return IndexOfMorphism( mor_2 ) = 1;
                 else
                     return false;
                 fi;
                 return;
             end )] ), ListWithIdenticalEntries( deduped_34_1, deduped_26_1[SafeUniquePositionProperty( deduped_27_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                     return IndexOfMorphism( mor_2 ) = 2;
                 else
                     return false;
                 fi;
                 return;
             end )] ), ListWithIdenticalEntries( deduped_34_1, deduped_26_1[SafeUniquePositionProperty( deduped_27_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                     return IndexOfMorphism( mor_2 ) = 3;
                 else
                     return false;
                 fi;
                 return;
             end )] ) );
    deduped_1_1 := Concatenation( ListWithIdenticalEntries( deduped_32_1, deduped_23_1 ), deduped_21_1, deduped_21_1 );
    hoisted_18_1 := List( deduped_22_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_16_1[deduped_3_2];
            hoisted_1_2 := hoisted_17_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_13_1 := Concatenation( ListWithIdenticalEntries( deduped_32_1, deduped_35_1 ), deduped_31_1, deduped_31_1 );
    deduped_14_1 := List( deduped_22_1, function ( j_2 )
            return Product( hoisted_13_1{[ 1 .. j_2 ]} );
        end );
    hoisted_10_1 := List( deduped_36_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_9_1 := List( deduped_36_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_3_1 := deduped_40_1[3];
    hoisted_11_1 := Concatenation( List( deduped_28_1, function ( i_2 )
              local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := deduped_4_1[1 + hoisted_3_1[(1 + i_2)]];
              deduped_6_2 := 1 + deduped_7_2;
              deduped_5_2 := deduped_25_1[deduped_6_2];
              deduped_4_2 := Product( deduped_25_1{[ 1 .. deduped_7_2 ]} );
              hoisted_3_2 := DivIntWithGivenQuotient( deduped_23_1, deduped_4_2, deduped_5_2 * Product( deduped_25_1{[ (deduped_6_2 + 1) .. deduped_30_1 ]} ) );
              return List( deduped_20_1, function ( i_3 )
                      return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_23_1 ), deduped_5_2, hoisted_3_2 );
                  end );
          end ), List( deduped_29_1, function ( i_2 )
              local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := hoisted_9_1[1 + i_2];
              deduped_6_2 := 1 + deduped_7_2;
              deduped_5_2 := deduped_25_1[deduped_6_2];
              deduped_4_2 := Product( deduped_25_1{[ 1 .. deduped_7_2 ]} );
              hoisted_3_2 := DivIntWithGivenQuotient( deduped_23_1, deduped_4_2, deduped_5_2 * Product( deduped_25_1{[ (deduped_6_2 + 1) .. deduped_30_1 ]} ) );
              return List( deduped_20_1, function ( i_3 )
                      return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_23_1 ), deduped_5_2, hoisted_3_2 );
                  end );
          end ), List( deduped_29_1, function ( i_2 )
              local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := hoisted_10_1[1 + i_2];
              deduped_6_2 := 1 + deduped_7_2;
              deduped_5_2 := deduped_25_1[deduped_6_2];
              deduped_4_2 := Product( deduped_25_1{[ 1 .. deduped_7_2 ]} );
              hoisted_3_2 := DivIntWithGivenQuotient( deduped_23_1, deduped_4_2, deduped_5_2 * Product( deduped_25_1{[ (deduped_6_2 + 1) .. deduped_30_1 ]} ) );
              return List( deduped_20_1, function ( i_3 )
                      return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_23_1 ), deduped_5_2, hoisted_3_2 );
                  end );
          end ) );
    hoisted_2_1 := Concatenation( ListWithIdenticalEntries( deduped_32_1, [ 0 .. deduped_35_1 - 1 ] ), deduped_24_1, deduped_24_1 );
    hoisted_12_1 := List( deduped_22_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_2_1[deduped_3_2];
            hoisted_1_2 := hoisted_11_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, Length( Filtered( deduped_20_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_22_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_12_1[deduped_1_3][deduped_1_2] * deduped_14_1[deduped_1_3];
                        end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_22_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_18_1[deduped_1_3][deduped_1_2] * deduped_14_1[deduped_1_3];
                        end ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local deduped_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, deduped_14_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_22_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1;
    deduped_50_1 := UnderlyingCategory( cat_1 );
    deduped_49_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( range_1 );
    deduped_48_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( source_1 );
    deduped_47_1 := CreateCapCategoryObjectWithAttributes( deduped_50_1, IndexOfObject, 0 );
    deduped_46_1 := CreateCapCategoryObjectWithAttributes( deduped_50_1, IndexOfObject, 1 );
    deduped_45_1 := deduped_49_1[4];
    deduped_44_1 := deduped_48_1[4];
    deduped_43_1 := deduped_49_1[2];
    deduped_42_1 := deduped_49_1[1];
    deduped_41_1 := deduped_48_1[2];
    deduped_40_1 := deduped_48_1[1];
    deduped_39_1 := ListWithIdenticalEntries( deduped_41_1, deduped_42_1 );
    deduped_38_1 := deduped_40_1 + deduped_41_1;
    deduped_37_1 := [ 0 .. deduped_41_1 - 1 ];
    deduped_36_1 := [ 0 .. deduped_40_1 - 1 ];
    deduped_35_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_50_1, deduped_46_1, deduped_47_1, IndexOfMorphism, 1 ), CreateCapCategoryMorphismWithAttributes( deduped_50_1, deduped_47_1, deduped_46_1, IndexOfMorphism, 2 ), CreateCapCategoryMorphismWithAttributes( deduped_50_1, deduped_47_1, deduped_46_1, IndexOfMorphism, 3 ) ];
    deduped_34_1 := [ deduped_49_1[3], List( deduped_45_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_45_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_33_1 := Concatenation( ListWithIdenticalEntries( deduped_40_1, deduped_42_1 ), ListWithIdenticalEntries( deduped_41_1, deduped_43_1 ) );
    deduped_32_1 := ListWithIdenticalEntries( deduped_41_1, [ 0 .. deduped_42_1 - 1 ] );
    deduped_31_1 := Product( deduped_33_1 );
    deduped_30_1 := [ 0 .. Sum( [ deduped_40_1, deduped_41_1, deduped_41_1 ] ) - 1 ];
    deduped_29_1 := Product( deduped_33_1{[ 1 .. deduped_40_1 ]} );
    deduped_28_1 := ListWithIdenticalEntries( deduped_41_1, deduped_31_1 );
    deduped_27_1 := [ 0 .. deduped_31_1 - 1 ];
    deduped_4_1 := [ deduped_40_1 .. deduped_38_1 - 1 ];
    deduped_26_1 := List( deduped_37_1, function ( i_2 )
            local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := deduped_4_1[1 + i_2];
            deduped_6_2 := 1 + deduped_7_2;
            deduped_5_2 := deduped_33_1[deduped_6_2];
            deduped_4_2 := Product( deduped_33_1{[ 1 .. deduped_7_2 ]} );
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_31_1, deduped_4_2, deduped_5_2 * Product( deduped_33_1{[ (deduped_6_2 + 1) .. deduped_38_1 ]} ) );
            return List( deduped_27_1, function ( i_3 )
                    return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_31_1 ), deduped_5_2, hoisted_3_2 );
                end );
        end );
    hoisted_17_1 := Concatenation( List( deduped_36_1, function ( i_2 )
              local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2;
              deduped_6_2 := 1 + i_2;
              deduped_5_2 := deduped_33_1[deduped_6_2];
              deduped_4_2 := Product( deduped_33_1{[ 1 .. i_2 ]} );
              hoisted_3_2 := DivIntWithGivenQuotient( deduped_31_1, deduped_4_2, deduped_5_2 * Product( deduped_33_1{[ (deduped_6_2 + 1) .. deduped_38_1 ]} ) );
              return List( deduped_27_1, function ( i_3 )
                      return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_31_1 ), deduped_5_2, hoisted_3_2 );
                  end );
          end ), deduped_26_1, deduped_26_1 );
    hoisted_16_1 := Concatenation( ListWithIdenticalEntries( deduped_40_1, deduped_34_1[SafeUniquePositionProperty( deduped_35_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 1 and IndexOfObject( Range( mor_2 ) ) = 0 then
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
             end )] ), ListWithIdenticalEntries( deduped_41_1, deduped_34_1[SafeUniquePositionProperty( deduped_35_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                     return IndexOfMorphism( mor_2 ) = 3;
                 else
                     return false;
                 fi;
                 return;
             end )] ) );
    deduped_1_1 := Concatenation( ListWithIdenticalEntries( deduped_40_1, deduped_31_1 ), deduped_28_1, deduped_28_1 );
    hoisted_18_1 := List( deduped_30_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_16_1[deduped_3_2];
            hoisted_1_2 := hoisted_17_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_13_1 := Concatenation( ListWithIdenticalEntries( deduped_40_1, deduped_43_1 ), deduped_39_1, deduped_39_1 );
    deduped_14_1 := List( deduped_30_1, function ( j_2 )
            return Product( hoisted_13_1{[ 1 .. j_2 ]} );
        end );
    hoisted_10_1 := List( deduped_44_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_9_1 := List( deduped_44_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_3_1 := deduped_48_1[3];
    hoisted_11_1 := Concatenation( List( deduped_36_1, function ( i_2 )
              local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := deduped_4_1[1 + hoisted_3_1[(1 + i_2)]];
              deduped_6_2 := 1 + deduped_7_2;
              deduped_5_2 := deduped_33_1[deduped_6_2];
              deduped_4_2 := Product( deduped_33_1{[ 1 .. deduped_7_2 ]} );
              hoisted_3_2 := DivIntWithGivenQuotient( deduped_31_1, deduped_4_2, deduped_5_2 * Product( deduped_33_1{[ (deduped_6_2 + 1) .. deduped_38_1 ]} ) );
              return List( deduped_27_1, function ( i_3 )
                      return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_31_1 ), deduped_5_2, hoisted_3_2 );
                  end );
          end ), List( deduped_37_1, function ( i_2 )
              local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := hoisted_9_1[1 + i_2];
              deduped_6_2 := 1 + deduped_7_2;
              deduped_5_2 := deduped_33_1[deduped_6_2];
              deduped_4_2 := Product( deduped_33_1{[ 1 .. deduped_7_2 ]} );
              hoisted_3_2 := DivIntWithGivenQuotient( deduped_31_1, deduped_4_2, deduped_5_2 * Product( deduped_33_1{[ (deduped_6_2 + 1) .. deduped_38_1 ]} ) );
              return List( deduped_27_1, function ( i_3 )
                      return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_31_1 ), deduped_5_2, hoisted_3_2 );
                  end );
          end ), List( deduped_37_1, function ( i_2 )
              local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := hoisted_10_1[1 + i_2];
              deduped_6_2 := 1 + deduped_7_2;
              deduped_5_2 := deduped_33_1[deduped_6_2];
              deduped_4_2 := Product( deduped_33_1{[ 1 .. deduped_7_2 ]} );
              hoisted_3_2 := DivIntWithGivenQuotient( deduped_31_1, deduped_4_2, deduped_5_2 * Product( deduped_33_1{[ (deduped_6_2 + 1) .. deduped_38_1 ]} ) );
              return List( deduped_27_1, function ( i_3 )
                      return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_31_1 ), deduped_5_2, hoisted_3_2 );
                  end );
          end ) );
    hoisted_2_1 := Concatenation( ListWithIdenticalEntries( deduped_40_1, [ 0 .. deduped_43_1 - 1 ] ), deduped_32_1, deduped_32_1 );
    hoisted_12_1 := List( deduped_30_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_2_1[deduped_3_2];
            hoisted_1_2 := hoisted_11_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_25_1 := CAP_JIT_INCOMPLETE_LOGIC( Filtered( deduped_27_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_30_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_12_1[deduped_1_3][deduped_1_2] * deduped_14_1[deduped_1_3];
                        end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_30_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_18_1[deduped_1_3][deduped_1_2] * deduped_14_1[deduped_1_3];
                        end ) );
            end )[1 + AsList( alpha_1 )[(1 + CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. (Length( Source( alpha_1 ) ) - 1) ][1] ))]] );
    hoisted_22_1 := CAP_JIT_INCOMPLETE_LOGIC( QuoIntWithDomain( deduped_25_1, deduped_29_1, deduped_31_1 ) );
    hoisted_19_1 := CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( deduped_25_1, deduped_29_1, deduped_31_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, DefiningPairOfReflexiveQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( deduped_36_1, function ( i_2 )
                return DigitInPositionalNotation( hoisted_19_1, i_2, deduped_40_1, deduped_42_1 );
            end ), List( deduped_37_1, function ( i_2 )
                return DigitInPositionalNotation( hoisted_22_1, i_2, deduped_41_1, deduped_43_1 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, deduped_14_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, deduped_20_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1;
    deduped_51_1 := UnderlyingCategory( cat_1 );
    deduped_50_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_49_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_48_1 := CreateCapCategoryObjectWithAttributes( deduped_51_1, IndexOfObject, 0 );
    deduped_47_1 := CreateCapCategoryObjectWithAttributes( deduped_51_1, IndexOfObject, 1 );
    deduped_46_1 := deduped_50_1[4];
    deduped_45_1 := deduped_49_1[4];
    deduped_44_1 := deduped_50_1[2];
    deduped_43_1 := deduped_49_1[2];
    deduped_42_1 := deduped_50_1[1];
    deduped_41_1 := deduped_49_1[1];
    deduped_40_1 := ListWithIdenticalEntries( deduped_43_1, deduped_42_1 );
    deduped_39_1 := deduped_41_1 + deduped_43_1;
    deduped_38_1 := [ 0 .. deduped_43_1 - 1 ];
    deduped_37_1 := [ 0 .. deduped_41_1 - 1 ];
    deduped_36_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_51_1, deduped_47_1, deduped_48_1, IndexOfMorphism, 1 ), CreateCapCategoryMorphismWithAttributes( deduped_51_1, deduped_48_1, deduped_47_1, IndexOfMorphism, 2 ), CreateCapCategoryMorphismWithAttributes( deduped_51_1, deduped_48_1, deduped_47_1, IndexOfMorphism, 3 ) ];
    deduped_35_1 := [ deduped_50_1[3], List( deduped_46_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_46_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_34_1 := Concatenation( ListWithIdenticalEntries( deduped_41_1, deduped_42_1 ), ListWithIdenticalEntries( deduped_43_1, deduped_44_1 ) );
    deduped_33_1 := ListWithIdenticalEntries( deduped_43_1, [ 0 .. deduped_42_1 - 1 ] );
    deduped_32_1 := Product( deduped_34_1 );
    deduped_31_1 := [ 0 .. Sum( [ deduped_41_1, deduped_43_1, deduped_43_1 ] ) - 1 ];
    deduped_30_1 := ListWithIdenticalEntries( deduped_43_1, deduped_32_1 );
    deduped_29_1 := [ 0 .. deduped_32_1 - 1 ];
    deduped_4_1 := [ deduped_41_1 .. deduped_39_1 - 1 ];
    deduped_27_1 := List( deduped_38_1, function ( i_2 )
            local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := deduped_4_1[1 + i_2];
            deduped_6_2 := 1 + deduped_7_2;
            deduped_5_2 := deduped_34_1[deduped_6_2];
            deduped_4_2 := Product( deduped_34_1{[ 1 .. deduped_7_2 ]} );
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_32_1, deduped_4_2, deduped_5_2 * Product( deduped_34_1{[ (deduped_6_2 + 1) .. deduped_39_1 ]} ) );
            return List( deduped_29_1, function ( i_3 )
                    return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_32_1 ), deduped_5_2, hoisted_3_2 );
                end );
        end );
    hoisted_17_1 := Concatenation( List( deduped_37_1, function ( i_2 )
              local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2;
              deduped_6_2 := 1 + i_2;
              deduped_5_2 := deduped_34_1[deduped_6_2];
              deduped_4_2 := Product( deduped_34_1{[ 1 .. i_2 ]} );
              hoisted_3_2 := DivIntWithGivenQuotient( deduped_32_1, deduped_4_2, deduped_5_2 * Product( deduped_34_1{[ (deduped_6_2 + 1) .. deduped_39_1 ]} ) );
              return List( deduped_29_1, function ( i_3 )
                      return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_32_1 ), deduped_5_2, hoisted_3_2 );
                  end );
          end ), deduped_27_1, deduped_27_1 );
    hoisted_16_1 := Concatenation( ListWithIdenticalEntries( deduped_41_1, deduped_35_1[SafeUniquePositionProperty( deduped_36_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 1 and IndexOfObject( Range( mor_2 ) ) = 0 then
                     return IndexOfMorphism( mor_2 ) = 1;
                 else
                     return false;
                 fi;
                 return;
             end )] ), ListWithIdenticalEntries( deduped_43_1, deduped_35_1[SafeUniquePositionProperty( deduped_36_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                     return IndexOfMorphism( mor_2 ) = 2;
                 else
                     return false;
                 fi;
                 return;
             end )] ), ListWithIdenticalEntries( deduped_43_1, deduped_35_1[SafeUniquePositionProperty( deduped_36_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                     return IndexOfMorphism( mor_2 ) = 3;
                 else
                     return false;
                 fi;
                 return;
             end )] ) );
    deduped_1_1 := Concatenation( ListWithIdenticalEntries( deduped_41_1, deduped_32_1 ), deduped_30_1, deduped_30_1 );
    hoisted_18_1 := List( deduped_31_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_16_1[deduped_3_2];
            hoisted_1_2 := hoisted_17_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_13_1 := Concatenation( ListWithIdenticalEntries( deduped_41_1, deduped_44_1 ), deduped_40_1, deduped_40_1 );
    deduped_14_1 := List( deduped_31_1, function ( j_2 )
            return Product( hoisted_13_1{[ 1 .. j_2 ]} );
        end );
    hoisted_10_1 := List( deduped_45_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_9_1 := List( deduped_45_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_3_1 := deduped_49_1[3];
    hoisted_11_1 := Concatenation( List( deduped_37_1, function ( i_2 )
              local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := deduped_4_1[1 + hoisted_3_1[(1 + i_2)]];
              deduped_6_2 := 1 + deduped_7_2;
              deduped_5_2 := deduped_34_1[deduped_6_2];
              deduped_4_2 := Product( deduped_34_1{[ 1 .. deduped_7_2 ]} );
              hoisted_3_2 := DivIntWithGivenQuotient( deduped_32_1, deduped_4_2, deduped_5_2 * Product( deduped_34_1{[ (deduped_6_2 + 1) .. deduped_39_1 ]} ) );
              return List( deduped_29_1, function ( i_3 )
                      return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_32_1 ), deduped_5_2, hoisted_3_2 );
                  end );
          end ), List( deduped_38_1, function ( i_2 )
              local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := hoisted_9_1[1 + i_2];
              deduped_6_2 := 1 + deduped_7_2;
              deduped_5_2 := deduped_34_1[deduped_6_2];
              deduped_4_2 := Product( deduped_34_1{[ 1 .. deduped_7_2 ]} );
              hoisted_3_2 := DivIntWithGivenQuotient( deduped_32_1, deduped_4_2, deduped_5_2 * Product( deduped_34_1{[ (deduped_6_2 + 1) .. deduped_39_1 ]} ) );
              return List( deduped_29_1, function ( i_3 )
                      return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_32_1 ), deduped_5_2, hoisted_3_2 );
                  end );
          end ), List( deduped_38_1, function ( i_2 )
              local hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := hoisted_10_1[1 + i_2];
              deduped_6_2 := 1 + deduped_7_2;
              deduped_5_2 := deduped_34_1[deduped_6_2];
              deduped_4_2 := Product( deduped_34_1{[ 1 .. deduped_7_2 ]} );
              hoisted_3_2 := DivIntWithGivenQuotient( deduped_32_1, deduped_4_2, deduped_5_2 * Product( deduped_34_1{[ (deduped_6_2 + 1) .. deduped_39_1 ]} ) );
              return List( deduped_29_1, function ( i_3 )
                      return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_32_1 ), deduped_5_2, hoisted_3_2 );
                  end );
          end ) );
    hoisted_2_1 := Concatenation( ListWithIdenticalEntries( deduped_41_1, [ 0 .. deduped_44_1 - 1 ] ), deduped_33_1, deduped_33_1 );
    hoisted_12_1 := List( deduped_31_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_2_1[deduped_3_2];
            hoisted_1_2 := hoisted_11_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_28_1 := Filtered( deduped_29_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_31_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_12_1[deduped_1_3][deduped_1_2] * deduped_14_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_31_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_18_1[deduped_1_3][deduped_1_2] * deduped_14_1[deduped_1_3];
                    end ) );
        end );
    deduped_20_1 := Product( deduped_34_1{[ 1 .. deduped_41_1 ]} );
    return List( [ 0 .. Length( deduped_28_1 ) - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_28_1[1 + i_2] );
            hoisted_2_2 := CAP_JIT_INCOMPLETE_LOGIC( QuoIntWithDomain( deduped_3_2, deduped_20_1, deduped_32_1 ) );
            hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( deduped_3_2, deduped_20_1, deduped_32_1 ) );
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfReflexiveQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( deduped_37_1, function ( i_3 )
                        return DigitInPositionalNotation( hoisted_1_2, i_3, deduped_41_1, deduped_42_1 );
                    end ), List( deduped_38_1, function ( i_3 )
                        return DigitInPositionalNotation( hoisted_2_2, i_3, deduped_43_1, deduped_44_1 );
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

BindGlobal( "FinReflexiveQuiversPrecompiled", function (  )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function (  )
    return CategoryOfReflexiveQuiversEnrichedOver( SkeletalCategoryOfFiniteSets(  : FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_FinReflexiveQuiversPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
