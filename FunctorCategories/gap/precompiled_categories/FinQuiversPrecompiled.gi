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
    local deduped_1_1, hoisted_2_1, hoisted_3_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, deduped_10_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1;
    deduped_36_1 := UnderlyingCategory( cat_1 );
    deduped_35_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_34_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_33_1 := CreateCapCategoryObjectWithAttributes( deduped_36_1, IndexOfObject, 1 );
    deduped_32_1 := CreateCapCategoryObjectWithAttributes( deduped_36_1, IndexOfObject, 0 );
    deduped_31_1 := deduped_35_1[3];
    deduped_30_1 := deduped_34_1[3];
    deduped_29_1 := deduped_34_1[2];
    deduped_28_1 := deduped_35_1[1];
    deduped_27_1 := deduped_34_1[1];
    deduped_26_1 := ListWithIdenticalEntries( deduped_29_1, deduped_28_1 );
    deduped_25_1 := [ 0 .. deduped_29_1 - 1 ];
    deduped_24_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_36_1, deduped_32_1, deduped_33_1, IndexOfMorphism, 1 ), CreateCapCategoryMorphismWithAttributes( deduped_36_1, deduped_32_1, deduped_33_1, IndexOfMorphism, 2 ) ];
    deduped_23_1 := [ List( deduped_31_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_31_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_22_1 := Concatenation( ListWithIdenticalEntries( deduped_27_1, deduped_28_1 ), ListWithIdenticalEntries( deduped_29_1, deduped_35_1[2] ) );
    deduped_21_1 := [ 0 .. deduped_29_1 + deduped_29_1 - 1 ];
    deduped_20_1 := ListWithIdenticalEntries( deduped_29_1, [ 0 .. deduped_28_1 - 1 ] );
    deduped_19_1 := Product( deduped_22_1 );
    deduped_18_1 := ListWithIdenticalEntries( deduped_29_1, deduped_19_1 );
    deduped_17_1 := [ 0 .. deduped_19_1 - 1 ];
    hoisted_13_1 := [ deduped_27_1 .. deduped_27_1 + deduped_29_1 - 1 ];
    deduped_16_1 := List( deduped_25_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := hoisted_13_1[1 + i_2];
            hoisted_2_2 := deduped_22_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_22_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_17_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_14_1 := Concatenation( deduped_16_1, deduped_16_1 );
    hoisted_12_1 := Concatenation( ListWithIdenticalEntries( deduped_29_1, deduped_23_1[SafeUniquePositionProperty( deduped_24_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                     return IndexOfMorphism( mor_2 ) = 1;
                 else
                     return false;
                 fi;
                 return;
             end )] ), ListWithIdenticalEntries( deduped_29_1, deduped_23_1[SafeUniquePositionProperty( deduped_24_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                     return IndexOfMorphism( mor_2 ) = 2;
                 else
                     return false;
                 fi;
                 return;
             end )] ) );
    deduped_1_1 := Concatenation( deduped_18_1, deduped_18_1 );
    hoisted_15_1 := List( deduped_21_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_12_1[deduped_3_2];
            hoisted_1_2 := hoisted_14_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_9_1 := Concatenation( deduped_26_1, deduped_26_1 );
    deduped_10_1 := List( deduped_21_1, function ( j_2 )
            return Product( hoisted_9_1{[ 1 .. j_2 ]} );
        end );
    hoisted_6_1 := List( deduped_30_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_3_1 := List( deduped_30_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_7_1 := Concatenation( List( deduped_25_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := hoisted_3_1[1 + i_2];
              hoisted_2_2 := deduped_22_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_22_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_17_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_25_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := hoisted_6_1[1 + i_2];
              hoisted_2_2 := deduped_22_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_22_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_17_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_2_1 := Concatenation( deduped_20_1, deduped_20_1 );
    hoisted_8_1 := List( deduped_21_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_2_1[deduped_3_2];
            hoisted_1_2 := hoisted_7_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, Length( Filtered( deduped_17_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_21_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_8_1[deduped_1_3][deduped_1_2] * deduped_10_1[deduped_1_3];
                        end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_21_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_15_1[deduped_1_3][deduped_1_2] * deduped_10_1[deduped_1_3];
                        end ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local deduped_1_1, hoisted_2_1, hoisted_3_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, deduped_10_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_17_1, hoisted_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1;
    deduped_43_1 := UnderlyingCategory( cat_1 );
    deduped_42_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( range_1 );
    deduped_41_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( source_1 );
    deduped_40_1 := CreateCapCategoryObjectWithAttributes( deduped_43_1, IndexOfObject, 1 );
    deduped_39_1 := CreateCapCategoryObjectWithAttributes( deduped_43_1, IndexOfObject, 0 );
    deduped_38_1 := deduped_42_1[3];
    deduped_37_1 := deduped_41_1[3];
    deduped_36_1 := deduped_42_1[2];
    deduped_35_1 := deduped_42_1[1];
    deduped_34_1 := deduped_41_1[2];
    deduped_33_1 := deduped_41_1[1];
    deduped_32_1 := ListWithIdenticalEntries( deduped_34_1, deduped_35_1 );
    deduped_31_1 := [ 0 .. deduped_34_1 - 1 ];
    deduped_30_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_43_1, deduped_39_1, deduped_40_1, IndexOfMorphism, 1 ), CreateCapCategoryMorphismWithAttributes( deduped_43_1, deduped_39_1, deduped_40_1, IndexOfMorphism, 2 ) ];
    deduped_29_1 := [ List( deduped_38_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_38_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_28_1 := Concatenation( ListWithIdenticalEntries( deduped_33_1, deduped_35_1 ), ListWithIdenticalEntries( deduped_34_1, deduped_36_1 ) );
    deduped_27_1 := [ 0 .. deduped_34_1 + deduped_34_1 - 1 ];
    deduped_26_1 := ListWithIdenticalEntries( deduped_34_1, [ 0 .. deduped_35_1 - 1 ] );
    deduped_25_1 := Product( deduped_28_1 );
    deduped_24_1 := Product( deduped_28_1{[ 1 .. deduped_33_1 ]} );
    deduped_23_1 := ListWithIdenticalEntries( deduped_34_1, deduped_25_1 );
    deduped_22_1 := [ 0 .. deduped_25_1 - 1 ];
    hoisted_13_1 := [ deduped_33_1 .. deduped_33_1 + deduped_34_1 - 1 ];
    deduped_21_1 := List( deduped_31_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := hoisted_13_1[1 + i_2];
            hoisted_2_2 := deduped_28_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_28_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_22_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_14_1 := Concatenation( deduped_21_1, deduped_21_1 );
    hoisted_12_1 := Concatenation( ListWithIdenticalEntries( deduped_34_1, deduped_29_1[SafeUniquePositionProperty( deduped_30_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                     return IndexOfMorphism( mor_2 ) = 1;
                 else
                     return false;
                 fi;
                 return;
             end )] ), ListWithIdenticalEntries( deduped_34_1, deduped_29_1[SafeUniquePositionProperty( deduped_30_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                     return IndexOfMorphism( mor_2 ) = 2;
                 else
                     return false;
                 fi;
                 return;
             end )] ) );
    deduped_1_1 := Concatenation( deduped_23_1, deduped_23_1 );
    hoisted_15_1 := List( deduped_27_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_12_1[deduped_3_2];
            hoisted_1_2 := hoisted_14_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_9_1 := Concatenation( deduped_32_1, deduped_32_1 );
    deduped_10_1 := List( deduped_27_1, function ( j_2 )
            return Product( hoisted_9_1{[ 1 .. j_2 ]} );
        end );
    hoisted_6_1 := List( deduped_37_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_3_1 := List( deduped_37_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_7_1 := Concatenation( List( deduped_31_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := hoisted_3_1[1 + i_2];
              hoisted_2_2 := deduped_28_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_28_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_22_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_31_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := hoisted_6_1[1 + i_2];
              hoisted_2_2 := deduped_28_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_28_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_22_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_2_1 := Concatenation( deduped_26_1, deduped_26_1 );
    hoisted_8_1 := List( deduped_27_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_2_1[deduped_3_2];
            hoisted_1_2 := hoisted_7_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_20_1 := CAP_JIT_INCOMPLETE_LOGIC( Filtered( deduped_22_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_27_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_8_1[deduped_1_3][deduped_1_2] * deduped_10_1[deduped_1_3];
                        end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_27_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_15_1[deduped_1_3][deduped_1_2] * deduped_10_1[deduped_1_3];
                        end ) );
            end )[1 + AsList( alpha_1 )[(1 + CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. (Length( Source( alpha_1 ) ) - 1) ][1] ))]] );
    hoisted_19_1 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( deduped_20_1, deduped_24_1 ), Product( deduped_28_1{[ 1 + deduped_33_1 .. Sum( [ deduped_33_1, deduped_34_1 ]{[ 1, 2 ]} ) ]} ) ) );
    hoisted_17_1 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( deduped_20_1, deduped_24_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, DefiningPairOfQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( [ 0 .. deduped_33_1 - 1 ], function ( i_2 )
                return REM_INT( QUO_INT( hoisted_17_1, deduped_35_1 ^ i_2 ), deduped_35_1 );
            end ), List( deduped_31_1, function ( i_2 )
                return REM_INT( QUO_INT( hoisted_19_1, deduped_36_1 ^ i_2 ), deduped_36_1 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, hoisted_2_1, hoisted_3_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, deduped_10_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, deduped_18_1, hoisted_20_1, hoisted_21_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1;
    deduped_47_1 := UnderlyingCategory( cat_1 );
    deduped_46_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_45_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_44_1 := CreateCapCategoryObjectWithAttributes( deduped_47_1, IndexOfObject, 1 );
    deduped_43_1 := CreateCapCategoryObjectWithAttributes( deduped_47_1, IndexOfObject, 0 );
    deduped_42_1 := deduped_46_1[3];
    deduped_41_1 := deduped_45_1[3];
    deduped_40_1 := deduped_46_1[2];
    deduped_39_1 := deduped_45_1[2];
    deduped_38_1 := deduped_46_1[1];
    deduped_37_1 := deduped_45_1[1];
    deduped_36_1 := ListWithIdenticalEntries( deduped_39_1, deduped_38_1 );
    deduped_35_1 := [ 0 .. deduped_39_1 - 1 ];
    deduped_34_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_47_1, deduped_43_1, deduped_44_1, IndexOfMorphism, 1 ), CreateCapCategoryMorphismWithAttributes( deduped_47_1, deduped_43_1, deduped_44_1, IndexOfMorphism, 2 ) ];
    deduped_33_1 := [ List( deduped_42_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_42_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_32_1 := Concatenation( ListWithIdenticalEntries( deduped_37_1, deduped_38_1 ), ListWithIdenticalEntries( deduped_39_1, deduped_40_1 ) );
    deduped_31_1 := [ 0 .. deduped_39_1 + deduped_39_1 - 1 ];
    deduped_30_1 := ListWithIdenticalEntries( deduped_39_1, [ 0 .. deduped_38_1 - 1 ] );
    deduped_29_1 := Product( deduped_32_1 );
    deduped_28_1 := ListWithIdenticalEntries( deduped_39_1, deduped_29_1 );
    deduped_27_1 := [ 0 .. deduped_29_1 - 1 ];
    hoisted_13_1 := [ deduped_37_1 .. deduped_37_1 + deduped_39_1 - 1 ];
    deduped_26_1 := List( deduped_35_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := hoisted_13_1[1 + i_2];
            hoisted_2_2 := deduped_32_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_32_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_27_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_14_1 := Concatenation( deduped_26_1, deduped_26_1 );
    hoisted_12_1 := Concatenation( ListWithIdenticalEntries( deduped_39_1, deduped_33_1[SafeUniquePositionProperty( deduped_34_1, function ( mor_2 )
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
    deduped_1_1 := Concatenation( deduped_28_1, deduped_28_1 );
    hoisted_15_1 := List( deduped_31_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_12_1[deduped_3_2];
            hoisted_1_2 := hoisted_14_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_9_1 := Concatenation( deduped_36_1, deduped_36_1 );
    deduped_10_1 := List( deduped_31_1, function ( j_2 )
            return Product( hoisted_9_1{[ 1 .. j_2 ]} );
        end );
    hoisted_6_1 := List( deduped_41_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_3_1 := List( deduped_41_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_7_1 := Concatenation( List( deduped_35_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := hoisted_3_1[1 + i_2];
              hoisted_2_2 := deduped_32_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_32_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_27_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_35_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := hoisted_6_1[1 + i_2];
              hoisted_2_2 := deduped_32_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_32_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_27_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_2_1 := Concatenation( deduped_30_1, deduped_30_1 );
    hoisted_8_1 := List( deduped_31_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_2_1[deduped_3_2];
            hoisted_1_2 := hoisted_7_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_25_1 := Filtered( deduped_27_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_31_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_8_1[deduped_1_3][deduped_1_2] * deduped_10_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_31_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_15_1[deduped_1_3][deduped_1_2] * deduped_10_1[deduped_1_3];
                    end ) );
        end );
    deduped_24_1 := Length( deduped_25_1 );
    hoisted_21_1 := Product( deduped_32_1{[ 1 + deduped_37_1 .. Sum( [ deduped_37_1, deduped_39_1 ]{[ 1, 2 ]} ) ]} );
    hoisted_20_1 := [ 0 .. deduped_37_1 - 1 ];
    deduped_18_1 := Product( deduped_32_1{[ 1 .. deduped_37_1 ]} );
    return List( [ 0 .. deduped_24_1 - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_25_1[1 + REM_INT( i_2, deduped_24_1 )] );
            hoisted_2_2 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( deduped_3_2, deduped_18_1 ), hoisted_21_1 ) );
            hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( deduped_3_2, deduped_18_1 ) );
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( hoisted_20_1, function ( i_3 )
                        return REM_INT( QUO_INT( hoisted_1_2, deduped_38_1 ^ i_3 ), deduped_38_1 );
                    end ), List( deduped_35_1, function ( i_3 )
                        return REM_INT( QUO_INT( hoisted_2_2, deduped_40_1 ^ i_3 ), deduped_40_1 );
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
