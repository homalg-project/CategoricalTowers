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
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := [  ];
    deduped_1_1 := BigInt( 0 );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets, NTuple( 4, deduped_1_1, deduped_1_1, deduped_2_1, deduped_2_1 ) );
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
    local deduped_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, deduped_12_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1;
    deduped_39_1 := UnderlyingCategory( cat_1 );
    deduped_38_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_37_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_36_1 := CreateCapCategoryObjectWithAttributes( deduped_39_1, IndexOfObject, 0 );
    deduped_35_1 := CreateCapCategoryObjectWithAttributes( deduped_39_1, IndexOfObject, 1 );
    deduped_34_1 := deduped_38_1[4];
    deduped_33_1 := deduped_37_1[4];
    deduped_32_1 := deduped_38_1[2];
    deduped_31_1 := deduped_37_1[2];
    deduped_30_1 := deduped_38_1[1];
    deduped_29_1 := deduped_37_1[1];
    deduped_28_1 := ListWithIdenticalEntries( deduped_31_1, deduped_30_1 );
    deduped_27_1 := [ 0 .. deduped_31_1 - 1 ];
    deduped_26_1 := [ 0 .. deduped_29_1 - 1 ];
    deduped_25_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_39_1, deduped_35_1, deduped_36_1, IndexOfMorphism, 1 ), CreateCapCategoryMorphismWithAttributes( deduped_39_1, deduped_36_1, deduped_35_1, IndexOfMorphism, 2 ), CreateCapCategoryMorphismWithAttributes( deduped_39_1, deduped_36_1, deduped_35_1, IndexOfMorphism, 3 ) ];
    deduped_24_1 := [ deduped_38_1[3], List( deduped_34_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_34_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_23_1 := Concatenation( ListWithIdenticalEntries( deduped_29_1, deduped_30_1 ), ListWithIdenticalEntries( deduped_31_1, deduped_32_1 ) );
    deduped_22_1 := ListWithIdenticalEntries( deduped_31_1, [ 0 .. deduped_30_1 - 1 ] );
    deduped_21_1 := Product( deduped_23_1 );
    deduped_20_1 := [ 0 .. Sum( [ deduped_29_1, deduped_31_1, deduped_31_1 ] ) - 1 ];
    deduped_19_1 := ListWithIdenticalEntries( deduped_31_1, deduped_21_1 );
    deduped_18_1 := [ 0 .. deduped_21_1 - 1 ];
    deduped_4_1 := [ deduped_29_1 .. deduped_29_1 + deduped_31_1 - 1 ];
    deduped_17_1 := List( deduped_27_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := deduped_4_1[1 + i_2];
            hoisted_2_2 := deduped_23_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_23_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_18_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_15_1 := Concatenation( List( deduped_26_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2;
              hoisted_2_2 := deduped_23_1[1 + i_2];
              hoisted_1_2 := Product( deduped_23_1{[ 1 .. i_2 ]} );
              return List( deduped_18_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), deduped_17_1, deduped_17_1 );
    hoisted_14_1 := Concatenation( ListWithIdenticalEntries( deduped_29_1, deduped_24_1[SafeUniquePositionProperty( deduped_25_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 1 and IndexOfObject( Range( mor_2 ) ) = 0 then
                     return IndexOfMorphism( mor_2 ) = 1;
                 else
                     return false;
                 fi;
                 return;
             end )] ), ListWithIdenticalEntries( deduped_31_1, deduped_24_1[SafeUniquePositionProperty( deduped_25_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                     return IndexOfMorphism( mor_2 ) = 2;
                 else
                     return false;
                 fi;
                 return;
             end )] ), ListWithIdenticalEntries( deduped_31_1, deduped_24_1[SafeUniquePositionProperty( deduped_25_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                     return IndexOfMorphism( mor_2 ) = 3;
                 else
                     return false;
                 fi;
                 return;
             end )] ) );
    deduped_1_1 := Concatenation( ListWithIdenticalEntries( deduped_29_1, deduped_21_1 ), deduped_19_1, deduped_19_1 );
    hoisted_16_1 := List( deduped_20_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_14_1[deduped_3_2];
            hoisted_1_2 := hoisted_15_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_11_1 := Concatenation( ListWithIdenticalEntries( deduped_29_1, deduped_32_1 ), deduped_28_1, deduped_28_1 );
    deduped_12_1 := List( deduped_20_1, function ( j_2 )
            return Product( hoisted_11_1{[ 1 .. j_2 ]} );
        end );
    hoisted_8_1 := List( deduped_33_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_7_1 := List( deduped_33_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_3_1 := deduped_37_1[3];
    hoisted_9_1 := Concatenation( List( deduped_26_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_4_1[1 + hoisted_3_1[(1 + i_2)]];
              hoisted_2_2 := deduped_23_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_23_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_18_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_27_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := hoisted_7_1[1 + i_2];
              hoisted_2_2 := deduped_23_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_23_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_18_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_27_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := hoisted_8_1[1 + i_2];
              hoisted_2_2 := deduped_23_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_23_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_18_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_2_1 := Concatenation( ListWithIdenticalEntries( deduped_29_1, [ 0 .. deduped_32_1 - 1 ] ), deduped_22_1, deduped_22_1 );
    hoisted_10_1 := List( deduped_20_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_2_1[deduped_3_2];
            hoisted_1_2 := hoisted_9_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, Length( Filtered( deduped_18_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_20_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_10_1[deduped_1_3][deduped_1_2] * deduped_12_1[deduped_1_3];
                        end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_20_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_16_1[deduped_1_3][deduped_1_2] * deduped_12_1[deduped_1_3];
                        end ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local deduped_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, deduped_12_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_18_1, hoisted_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1;
    deduped_45_1 := UnderlyingCategory( cat_1 );
    deduped_44_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( range_1 );
    deduped_43_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( source_1 );
    deduped_42_1 := CreateCapCategoryObjectWithAttributes( deduped_45_1, IndexOfObject, 0 );
    deduped_41_1 := CreateCapCategoryObjectWithAttributes( deduped_45_1, IndexOfObject, 1 );
    deduped_40_1 := deduped_44_1[4];
    deduped_39_1 := deduped_43_1[4];
    deduped_38_1 := deduped_44_1[2];
    deduped_37_1 := deduped_44_1[1];
    deduped_36_1 := deduped_43_1[2];
    deduped_35_1 := deduped_43_1[1];
    deduped_34_1 := ListWithIdenticalEntries( deduped_36_1, deduped_37_1 );
    deduped_33_1 := [ 0 .. deduped_36_1 - 1 ];
    deduped_32_1 := [ 0 .. deduped_35_1 - 1 ];
    deduped_31_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_45_1, deduped_41_1, deduped_42_1, IndexOfMorphism, 1 ), CreateCapCategoryMorphismWithAttributes( deduped_45_1, deduped_42_1, deduped_41_1, IndexOfMorphism, 2 ), CreateCapCategoryMorphismWithAttributes( deduped_45_1, deduped_42_1, deduped_41_1, IndexOfMorphism, 3 ) ];
    deduped_30_1 := [ deduped_44_1[3], List( deduped_40_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_40_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_29_1 := Concatenation( ListWithIdenticalEntries( deduped_35_1, deduped_37_1 ), ListWithIdenticalEntries( deduped_36_1, deduped_38_1 ) );
    deduped_28_1 := ListWithIdenticalEntries( deduped_36_1, [ 0 .. deduped_37_1 - 1 ] );
    deduped_27_1 := Product( deduped_29_1 );
    deduped_26_1 := [ 0 .. Sum( [ deduped_35_1, deduped_36_1, deduped_36_1 ] ) - 1 ];
    deduped_25_1 := Product( deduped_29_1{[ 1 .. deduped_35_1 ]} );
    deduped_24_1 := ListWithIdenticalEntries( deduped_36_1, deduped_27_1 );
    deduped_23_1 := [ 0 .. deduped_27_1 - 1 ];
    deduped_4_1 := [ deduped_35_1 .. deduped_35_1 + deduped_36_1 - 1 ];
    deduped_22_1 := List( deduped_33_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := deduped_4_1[1 + i_2];
            hoisted_2_2 := deduped_29_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_29_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_23_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_15_1 := Concatenation( List( deduped_32_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2;
              hoisted_2_2 := deduped_29_1[1 + i_2];
              hoisted_1_2 := Product( deduped_29_1{[ 1 .. i_2 ]} );
              return List( deduped_23_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), deduped_22_1, deduped_22_1 );
    hoisted_14_1 := Concatenation( ListWithIdenticalEntries( deduped_35_1, deduped_30_1[SafeUniquePositionProperty( deduped_31_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 1 and IndexOfObject( Range( mor_2 ) ) = 0 then
                     return IndexOfMorphism( mor_2 ) = 1;
                 else
                     return false;
                 fi;
                 return;
             end )] ), ListWithIdenticalEntries( deduped_36_1, deduped_30_1[SafeUniquePositionProperty( deduped_31_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                     return IndexOfMorphism( mor_2 ) = 2;
                 else
                     return false;
                 fi;
                 return;
             end )] ), ListWithIdenticalEntries( deduped_36_1, deduped_30_1[SafeUniquePositionProperty( deduped_31_1, function ( mor_2 )
                 if IndexOfObject( Source( mor_2 ) ) = 0 and IndexOfObject( Range( mor_2 ) ) = 1 then
                     return IndexOfMorphism( mor_2 ) = 3;
                 else
                     return false;
                 fi;
                 return;
             end )] ) );
    deduped_1_1 := Concatenation( ListWithIdenticalEntries( deduped_35_1, deduped_27_1 ), deduped_24_1, deduped_24_1 );
    hoisted_16_1 := List( deduped_26_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_14_1[deduped_3_2];
            hoisted_1_2 := hoisted_15_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_11_1 := Concatenation( ListWithIdenticalEntries( deduped_35_1, deduped_38_1 ), deduped_34_1, deduped_34_1 );
    deduped_12_1 := List( deduped_26_1, function ( j_2 )
            return Product( hoisted_11_1{[ 1 .. j_2 ]} );
        end );
    hoisted_8_1 := List( deduped_39_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_7_1 := List( deduped_39_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_3_1 := deduped_43_1[3];
    hoisted_9_1 := Concatenation( List( deduped_32_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_4_1[1 + hoisted_3_1[(1 + i_2)]];
              hoisted_2_2 := deduped_29_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_29_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_23_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_33_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := hoisted_7_1[1 + i_2];
              hoisted_2_2 := deduped_29_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_29_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_23_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_33_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := hoisted_8_1[1 + i_2];
              hoisted_2_2 := deduped_29_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_29_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_23_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_2_1 := Concatenation( ListWithIdenticalEntries( deduped_35_1, [ 0 .. deduped_38_1 - 1 ] ), deduped_28_1, deduped_28_1 );
    hoisted_10_1 := List( deduped_26_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_2_1[deduped_3_2];
            hoisted_1_2 := hoisted_9_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_21_1 := CAP_JIT_INCOMPLETE_LOGIC( Filtered( deduped_23_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_26_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_10_1[deduped_1_3][deduped_1_2] * deduped_12_1[deduped_1_3];
                        end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_26_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_16_1[deduped_1_3][deduped_1_2] * deduped_12_1[deduped_1_3];
                        end ) );
            end )[1 + AsList( alpha_1 )[(1 + CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. (Length( Source( alpha_1 ) ) - 1) ][1] ))]] );
    hoisted_20_1 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( deduped_21_1, deduped_25_1 ), Product( deduped_29_1{[ 1 + deduped_35_1 .. Sum( [ deduped_35_1, deduped_36_1 ]{[ 1, 2 ]} ) ]} ) ) );
    hoisted_18_1 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( deduped_21_1, deduped_25_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, DefiningPairOfReflexiveQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( deduped_32_1, function ( i_2 )
                return REM_INT( QUO_INT( hoisted_18_1, deduped_37_1 ^ i_2 ), deduped_37_1 );
            end ), List( deduped_33_1, function ( i_2 )
                return REM_INT( QUO_INT( hoisted_20_1, deduped_38_1 ^ i_2 ), deduped_38_1 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, deduped_12_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, deduped_19_1, hoisted_22_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1;
    deduped_49_1 := UnderlyingCategory( cat_1 );
    deduped_48_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_47_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_46_1 := CreateCapCategoryObjectWithAttributes( deduped_49_1, IndexOfObject, 0 );
    deduped_45_1 := CreateCapCategoryObjectWithAttributes( deduped_49_1, IndexOfObject, 1 );
    deduped_44_1 := deduped_48_1[4];
    deduped_43_1 := deduped_47_1[4];
    deduped_42_1 := deduped_48_1[2];
    deduped_41_1 := deduped_47_1[2];
    deduped_40_1 := deduped_48_1[1];
    deduped_39_1 := deduped_47_1[1];
    deduped_38_1 := ListWithIdenticalEntries( deduped_41_1, deduped_40_1 );
    deduped_37_1 := [ 0 .. deduped_41_1 - 1 ];
    deduped_36_1 := [ 0 .. deduped_39_1 - 1 ];
    deduped_35_1 := [ CreateCapCategoryMorphismWithAttributes( deduped_49_1, deduped_45_1, deduped_46_1, IndexOfMorphism, 1 ), CreateCapCategoryMorphismWithAttributes( deduped_49_1, deduped_46_1, deduped_45_1, IndexOfMorphism, 2 ), CreateCapCategoryMorphismWithAttributes( deduped_49_1, deduped_46_1, deduped_45_1, IndexOfMorphism, 3 ) ];
    deduped_34_1 := [ deduped_48_1[3], List( deduped_44_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_44_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_33_1 := Concatenation( ListWithIdenticalEntries( deduped_39_1, deduped_40_1 ), ListWithIdenticalEntries( deduped_41_1, deduped_42_1 ) );
    deduped_32_1 := ListWithIdenticalEntries( deduped_41_1, [ 0 .. deduped_40_1 - 1 ] );
    deduped_31_1 := Product( deduped_33_1 );
    deduped_30_1 := [ 0 .. Sum( [ deduped_39_1, deduped_41_1, deduped_41_1 ] ) - 1 ];
    deduped_29_1 := ListWithIdenticalEntries( deduped_41_1, deduped_31_1 );
    deduped_28_1 := [ 0 .. deduped_31_1 - 1 ];
    deduped_4_1 := [ deduped_39_1 .. deduped_39_1 + deduped_41_1 - 1 ];
    deduped_27_1 := List( deduped_37_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := deduped_4_1[1 + i_2];
            hoisted_2_2 := deduped_33_1[1 + deduped_3_2];
            hoisted_1_2 := Product( deduped_33_1{[ 1 .. deduped_3_2 ]} );
            return List( deduped_28_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    hoisted_15_1 := Concatenation( List( deduped_36_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2;
              hoisted_2_2 := deduped_33_1[1 + i_2];
              hoisted_1_2 := Product( deduped_33_1{[ 1 .. i_2 ]} );
              return List( deduped_28_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), deduped_27_1, deduped_27_1 );
    hoisted_14_1 := Concatenation( ListWithIdenticalEntries( deduped_39_1, deduped_34_1[SafeUniquePositionProperty( deduped_35_1, function ( mor_2 )
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
    deduped_1_1 := Concatenation( ListWithIdenticalEntries( deduped_39_1, deduped_31_1 ), deduped_29_1, deduped_29_1 );
    hoisted_16_1 := List( deduped_30_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_14_1[deduped_3_2];
            hoisted_1_2 := hoisted_15_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_11_1 := Concatenation( ListWithIdenticalEntries( deduped_39_1, deduped_42_1 ), deduped_38_1, deduped_38_1 );
    deduped_12_1 := List( deduped_30_1, function ( j_2 )
            return Product( hoisted_11_1{[ 1 .. j_2 ]} );
        end );
    hoisted_8_1 := List( deduped_43_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_7_1 := List( deduped_43_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_3_1 := deduped_47_1[3];
    hoisted_9_1 := Concatenation( List( deduped_36_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := deduped_4_1[1 + hoisted_3_1[(1 + i_2)]];
              hoisted_2_2 := deduped_33_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_33_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_28_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_37_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := hoisted_7_1[1 + i_2];
              hoisted_2_2 := deduped_33_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_33_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_28_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_37_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := hoisted_8_1[1 + i_2];
              hoisted_2_2 := deduped_33_1[1 + deduped_3_2];
              hoisted_1_2 := Product( deduped_33_1{[ 1 .. deduped_3_2 ]} );
              return List( deduped_28_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_2_1 := Concatenation( ListWithIdenticalEntries( deduped_39_1, [ 0 .. deduped_42_1 - 1 ] ), deduped_32_1, deduped_32_1 );
    hoisted_10_1 := List( deduped_30_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_2_1[deduped_3_2];
            hoisted_1_2 := hoisted_9_1[deduped_3_2];
            return List( [ 0 .. deduped_1_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_26_1 := Filtered( deduped_28_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_30_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_10_1[deduped_1_3][deduped_1_2] * deduped_12_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_30_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_16_1[deduped_1_3][deduped_1_2] * deduped_12_1[deduped_1_3];
                    end ) );
        end );
    deduped_25_1 := Length( deduped_26_1 );
    hoisted_22_1 := Product( deduped_33_1{[ 1 + deduped_39_1 .. Sum( [ deduped_39_1, deduped_41_1 ]{[ 1, 2 ]} ) ]} );
    deduped_19_1 := Product( deduped_33_1{[ 1 .. deduped_39_1 ]} );
    return List( [ 0 .. deduped_25_1 - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_26_1[1 + REM_INT( i_2, deduped_25_1 )] );
            hoisted_2_2 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( deduped_3_2, deduped_19_1 ), hoisted_22_1 ) );
            hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( deduped_3_2, deduped_19_1 ) );
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfReflexiveQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( deduped_36_1, function ( i_3 )
                        return REM_INT( QUO_INT( hoisted_1_2, deduped_40_1 ^ i_3 ), deduped_40_1 );
                    end ), List( deduped_37_1, function ( i_3 )
                        return REM_INT( QUO_INT( hoisted_2_2, deduped_42_1 ^ i_3 ), deduped_42_1 );
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
    return CategoryOfReflexiveQuiversEnrichedOver( CategoryOfSkeletalFinSets(  : FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_FinReflexiveQuiversPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
