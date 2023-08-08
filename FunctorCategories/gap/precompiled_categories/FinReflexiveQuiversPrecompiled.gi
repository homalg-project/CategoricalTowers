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
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, hoisted_15_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, deduped_21_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1;
    deduped_47_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_46_1 := UnderlyingCategory( cat_1 );
    deduped_45_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_44_1 := deduped_45_1[4];
    deduped_43_1 := deduped_47_1[4];
    deduped_42_1 := CreateCapCategoryObjectWithAttributes( deduped_46_1, IndexOfObject, 1 );
    deduped_41_1 := deduped_45_1[2];
    deduped_40_1 := CreateCapCategoryObjectWithAttributes( deduped_46_1, IndexOfObject, 0 );
    deduped_39_1 := deduped_45_1[1];
    deduped_38_1 := CreateCapCategoryMorphismWithAttributes( deduped_46_1, deduped_40_1, deduped_42_1, IndexOfMorphism, 3 );
    deduped_37_1 := CreateCapCategoryMorphismWithAttributes( deduped_46_1, deduped_40_1, deduped_42_1, IndexOfMorphism, 2 );
    deduped_36_1 := CreateCapCategoryMorphismWithAttributes( deduped_46_1, deduped_42_1, deduped_40_1, IndexOfMorphism, 1 );
    deduped_35_1 := ListWithIdenticalEntries( deduped_41_1, deduped_42_1 );
    deduped_34_1 := ListWithIdenticalEntries( deduped_39_1, deduped_40_1 );
    deduped_33_1 := [ 0 .. deduped_41_1 - 1 ];
    deduped_32_1 := [ 0 .. deduped_39_1 - 1 ];
    deduped_31_1 := [ 0 .. Sum( [ deduped_39_1, deduped_41_1, deduped_41_1 ] ) - 1 ];
    deduped_2_1 := [ deduped_47_1[1], deduped_47_1[2] ];
    deduped_1_1 := [ 0, 1 ];
    deduped_30_1 := Concatenation( List( deduped_34_1, function ( objB_2 )
              return deduped_2_1[SafeUniquePosition( deduped_1_1, IndexOfObject( objB_2 ) )];
          end ), List( deduped_35_1, function ( objB_2 )
              return deduped_2_1[SafeUniquePosition( deduped_1_1, IndexOfObject( objB_2 ) )];
          end ) );
    deduped_29_1 := Product( deduped_30_1 );
    deduped_26_1 := [ 0 .. deduped_29_1 - 1 ];
    deduped_28_1 := List( deduped_33_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + (i_2 + deduped_39_1);
            hoisted_2_2 := deduped_30_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_30_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_26_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_27_1 := ListWithIdenticalEntries( Length( deduped_33_1 ), deduped_29_1 );
    hoisted_24_1 := Concatenation( List( deduped_32_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + i_2;
              hoisted_2_2 := deduped_30_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_30_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_26_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), deduped_28_1, deduped_28_1 );
    deduped_12_1 := [ deduped_47_1[3], List( deduped_43_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_43_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_11_1 := [ deduped_36_1, deduped_37_1, deduped_38_1 ];
    deduped_10_1 := [ 0, 1, 2, 3, 4, 5, 6 ];
    deduped_9_1 := [ 0, 0, 1, 1, 1, 1, 1 ];
    deduped_8_1 := [ 0, 1, 0, 0, 1, 1, 1 ];
    deduped_7_1 := [ 0, 4 ];
    hoisted_23_1 := Concatenation( List( ListWithIdenticalEntries( deduped_39_1, deduped_36_1 ), function ( morB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := IndexOfMorphism( morB_2 );
              deduped_6_2 := IndexOfObject( Range( morB_2 ) );
              deduped_5_2 := IndexOfObject( Source( morB_2 ) );
              deduped_4_2 := 1 + deduped_7_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_8_1[deduped_4_2] and deduped_6_2 = deduped_9_1[deduped_4_2] then
                              return deduped_7_2 = deduped_10_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_5_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePositionProperty( deduped_11_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_41_1, deduped_37_1 ), function ( morB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := IndexOfMorphism( morB_2 );
              deduped_6_2 := IndexOfObject( Range( morB_2 ) );
              deduped_5_2 := IndexOfObject( Source( morB_2 ) );
              deduped_4_2 := 1 + deduped_7_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_8_1[deduped_4_2] and deduped_6_2 = deduped_9_1[deduped_4_2] then
                              return deduped_7_2 = deduped_10_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_5_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePositionProperty( deduped_11_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_41_1, deduped_38_1 ), function ( morB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := IndexOfMorphism( morB_2 );
              deduped_6_2 := IndexOfObject( Range( morB_2 ) );
              deduped_5_2 := IndexOfObject( Source( morB_2 ) );
              deduped_4_2 := 1 + deduped_7_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_8_1[deduped_4_2] and deduped_6_2 = deduped_9_1[deduped_4_2] then
                              return deduped_7_2 = deduped_10_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_5_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePositionProperty( deduped_11_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ) );
    deduped_3_1 := Concatenation( ListWithIdenticalEntries( Length( deduped_32_1 ), deduped_29_1 ), deduped_27_1, deduped_27_1 );
    hoisted_25_1 := List( deduped_31_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_23_1[deduped_3_2];
            hoisted_1_2 := hoisted_24_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_14_1 := List( deduped_44_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_13_1 := List( deduped_44_1, function ( a_2 )
            return a_2[1];
        end );
    deduped_6_1 := Concatenation( List( deduped_34_1, IndexOfObject ), List( deduped_35_1, IndexOfObject ) );
    deduped_4_1 := deduped_45_1[3];
    hoisted_20_1 := Concatenation( List( deduped_32_1, function ( i_2 )
              return deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_6_1[1 + (deduped_4_1[1 + i_2] + deduped_39_1)] )];
          end ), List( deduped_33_1, function ( i_2 )
              return deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_6_1[1 + deduped_13_1[(1 + i_2)]] )];
          end ), List( deduped_33_1, function ( i_2 )
              return deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_6_1[1 + deduped_14_1[(1 + i_2)]] )];
          end ) );
    deduped_21_1 := List( deduped_31_1, function ( j_2 )
            return Product( hoisted_20_1{[ 1 .. j_2 ]} );
        end );
    hoisted_18_1 := Concatenation( List( deduped_32_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + (deduped_4_1[1 + i_2] + deduped_39_1);
              hoisted_2_2 := deduped_30_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_30_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_26_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_33_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_13_1[(1 + i_2)];
              hoisted_2_2 := deduped_30_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_30_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_26_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_33_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_14_1[(1 + i_2)];
              hoisted_2_2 := deduped_30_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_30_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_26_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_15_1 := Concatenation( List( deduped_32_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_7_1[(1 + deduped_6_1[(1 + (deduped_4_1[1 + i_2] + deduped_39_1))])];
              deduped_7_2 := deduped_10_1[deduped_8_2];
              deduped_6_2 := deduped_9_1[deduped_8_2];
              deduped_5_2 := deduped_8_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_7_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_8_1[deduped_4_2] and deduped_6_2 = deduped_9_1[deduped_4_2] then
                              return deduped_7_2 = deduped_10_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_5_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePositionProperty( deduped_11_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( deduped_33_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_7_1[(1 + deduped_6_1[(1 + deduped_13_1[(1 + i_2)])])];
              deduped_7_2 := deduped_10_1[deduped_8_2];
              deduped_6_2 := deduped_9_1[deduped_8_2];
              deduped_5_2 := deduped_8_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_7_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_8_1[deduped_4_2] and deduped_6_2 = deduped_9_1[deduped_4_2] then
                              return deduped_7_2 = deduped_10_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_5_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePositionProperty( deduped_11_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( deduped_33_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_7_1[(1 + deduped_6_1[(1 + deduped_14_1[(1 + i_2)])])];
              deduped_7_2 := deduped_10_1[deduped_8_2];
              deduped_6_2 := deduped_9_1[deduped_8_2];
              deduped_5_2 := deduped_8_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_7_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_8_1[deduped_4_2] and deduped_6_2 = deduped_9_1[deduped_4_2] then
                              return deduped_7_2 = deduped_10_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_5_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePositionProperty( deduped_11_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ) );
    hoisted_19_1 := List( deduped_31_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_15_1[deduped_3_2];
            hoisted_1_2 := hoisted_18_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, Length( Filtered( deduped_26_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_31_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_19_1[deduped_1_3][deduped_1_2] * deduped_21_1[deduped_1_3];
                        end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_31_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_25_1[deduped_1_3][deduped_1_2] * deduped_21_1[deduped_1_3];
                        end ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, hoisted_15_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, deduped_21_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_27_1, hoisted_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1;
    deduped_55_1 := UnderlyingCategory( cat_1 );
    deduped_54_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( range_1 );
    deduped_53_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( source_1 );
    deduped_52_1 := deduped_53_1[4];
    deduped_51_1 := deduped_54_1[4];
    deduped_50_1 := CreateCapCategoryObjectWithAttributes( deduped_55_1, IndexOfObject, 1 );
    deduped_49_1 := CreateCapCategoryObjectWithAttributes( deduped_55_1, IndexOfObject, 0 );
    deduped_48_1 := deduped_54_1[2];
    deduped_47_1 := deduped_54_1[1];
    deduped_46_1 := deduped_53_1[2];
    deduped_45_1 := deduped_53_1[1];
    deduped_44_1 := CreateCapCategoryMorphismWithAttributes( deduped_55_1, deduped_49_1, deduped_50_1, IndexOfMorphism, 3 );
    deduped_43_1 := CreateCapCategoryMorphismWithAttributes( deduped_55_1, deduped_49_1, deduped_50_1, IndexOfMorphism, 2 );
    deduped_42_1 := CreateCapCategoryMorphismWithAttributes( deduped_55_1, deduped_50_1, deduped_49_1, IndexOfMorphism, 1 );
    deduped_41_1 := ListWithIdenticalEntries( deduped_46_1, deduped_50_1 );
    deduped_40_1 := ListWithIdenticalEntries( deduped_45_1, deduped_49_1 );
    deduped_39_1 := [ 0 .. deduped_46_1 - 1 ];
    deduped_38_1 := [ 0 .. deduped_45_1 - 1 ];
    deduped_37_1 := [ 0 .. Sum( [ deduped_45_1, deduped_46_1, deduped_46_1 ] ) - 1 ];
    deduped_2_1 := [ deduped_47_1, deduped_48_1 ];
    deduped_1_1 := [ 0, 1 ];
    deduped_36_1 := Concatenation( List( deduped_40_1, function ( objB_2 )
              return deduped_2_1[SafeUniquePosition( deduped_1_1, IndexOfObject( objB_2 ) )];
          end ), List( deduped_41_1, function ( objB_2 )
              return deduped_2_1[SafeUniquePosition( deduped_1_1, IndexOfObject( objB_2 ) )];
          end ) );
    deduped_35_1 := Product( deduped_36_1 );
    deduped_31_1 := [ 0 .. deduped_35_1 - 1 ];
    deduped_34_1 := List( deduped_39_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + (i_2 + deduped_45_1);
            hoisted_2_2 := deduped_36_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_36_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_31_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_33_1 := Product( deduped_36_1{[ 1 .. deduped_45_1 ]} );
    deduped_32_1 := ListWithIdenticalEntries( Length( deduped_39_1 ), deduped_35_1 );
    hoisted_24_1 := Concatenation( List( deduped_38_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + i_2;
              hoisted_2_2 := deduped_36_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_36_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_31_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), deduped_34_1, deduped_34_1 );
    deduped_12_1 := [ deduped_54_1[3], List( deduped_51_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_51_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_11_1 := [ deduped_42_1, deduped_43_1, deduped_44_1 ];
    deduped_10_1 := [ 0, 1, 2, 3, 4, 5, 6 ];
    deduped_9_1 := [ 0, 0, 1, 1, 1, 1, 1 ];
    deduped_8_1 := [ 0, 1, 0, 0, 1, 1, 1 ];
    deduped_7_1 := [ 0, 4 ];
    hoisted_23_1 := Concatenation( List( ListWithIdenticalEntries( deduped_45_1, deduped_42_1 ), function ( morB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := IndexOfMorphism( morB_2 );
              deduped_6_2 := IndexOfObject( Range( morB_2 ) );
              deduped_5_2 := IndexOfObject( Source( morB_2 ) );
              deduped_4_2 := 1 + deduped_7_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_8_1[deduped_4_2] and deduped_6_2 = deduped_9_1[deduped_4_2] then
                              return deduped_7_2 = deduped_10_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_5_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePositionProperty( deduped_11_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_46_1, deduped_43_1 ), function ( morB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := IndexOfMorphism( morB_2 );
              deduped_6_2 := IndexOfObject( Range( morB_2 ) );
              deduped_5_2 := IndexOfObject( Source( morB_2 ) );
              deduped_4_2 := 1 + deduped_7_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_8_1[deduped_4_2] and deduped_6_2 = deduped_9_1[deduped_4_2] then
                              return deduped_7_2 = deduped_10_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_5_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePositionProperty( deduped_11_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_46_1, deduped_44_1 ), function ( morB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := IndexOfMorphism( morB_2 );
              deduped_6_2 := IndexOfObject( Range( morB_2 ) );
              deduped_5_2 := IndexOfObject( Source( morB_2 ) );
              deduped_4_2 := 1 + deduped_7_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_8_1[deduped_4_2] and deduped_6_2 = deduped_9_1[deduped_4_2] then
                              return deduped_7_2 = deduped_10_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_5_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePositionProperty( deduped_11_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ) );
    deduped_3_1 := Concatenation( ListWithIdenticalEntries( Length( deduped_38_1 ), deduped_35_1 ), deduped_32_1, deduped_32_1 );
    hoisted_25_1 := List( deduped_37_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_23_1[deduped_3_2];
            hoisted_1_2 := hoisted_24_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_14_1 := List( deduped_52_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_13_1 := List( deduped_52_1, function ( a_2 )
            return a_2[1];
        end );
    deduped_6_1 := Concatenation( List( deduped_40_1, IndexOfObject ), List( deduped_41_1, IndexOfObject ) );
    deduped_4_1 := deduped_53_1[3];
    hoisted_20_1 := Concatenation( List( deduped_38_1, function ( i_2 )
              return deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_6_1[1 + (deduped_4_1[1 + i_2] + deduped_45_1)] )];
          end ), List( deduped_39_1, function ( i_2 )
              return deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_6_1[1 + deduped_13_1[(1 + i_2)]] )];
          end ), List( deduped_39_1, function ( i_2 )
              return deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_6_1[1 + deduped_14_1[(1 + i_2)]] )];
          end ) );
    deduped_21_1 := List( deduped_37_1, function ( j_2 )
            return Product( hoisted_20_1{[ 1 .. j_2 ]} );
        end );
    hoisted_18_1 := Concatenation( List( deduped_38_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + (deduped_4_1[1 + i_2] + deduped_45_1);
              hoisted_2_2 := deduped_36_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_36_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_31_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_39_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_13_1[(1 + i_2)];
              hoisted_2_2 := deduped_36_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_36_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_31_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_39_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_14_1[(1 + i_2)];
              hoisted_2_2 := deduped_36_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_36_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_31_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_15_1 := Concatenation( List( deduped_38_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_7_1[(1 + deduped_6_1[(1 + (deduped_4_1[1 + i_2] + deduped_45_1))])];
              deduped_7_2 := deduped_10_1[deduped_8_2];
              deduped_6_2 := deduped_9_1[deduped_8_2];
              deduped_5_2 := deduped_8_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_7_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_8_1[deduped_4_2] and deduped_6_2 = deduped_9_1[deduped_4_2] then
                              return deduped_7_2 = deduped_10_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_5_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePositionProperty( deduped_11_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( deduped_39_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_7_1[(1 + deduped_6_1[(1 + deduped_13_1[(1 + i_2)])])];
              deduped_7_2 := deduped_10_1[deduped_8_2];
              deduped_6_2 := deduped_9_1[deduped_8_2];
              deduped_5_2 := deduped_8_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_7_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_8_1[deduped_4_2] and deduped_6_2 = deduped_9_1[deduped_4_2] then
                              return deduped_7_2 = deduped_10_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_5_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePositionProperty( deduped_11_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( deduped_39_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_7_1[(1 + deduped_6_1[(1 + deduped_14_1[(1 + i_2)])])];
              deduped_7_2 := deduped_10_1[deduped_8_2];
              deduped_6_2 := deduped_9_1[deduped_8_2];
              deduped_5_2 := deduped_8_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_7_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_8_1[deduped_4_2] and deduped_6_2 = deduped_9_1[deduped_4_2] then
                              return deduped_7_2 = deduped_10_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_5_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePositionProperty( deduped_11_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ) );
    hoisted_19_1 := List( deduped_37_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_15_1[deduped_3_2];
            hoisted_1_2 := hoisted_18_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_30_1 := CAP_JIT_INCOMPLETE_LOGIC( Filtered( deduped_31_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_37_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_19_1[deduped_1_3][deduped_1_2] * deduped_21_1[deduped_1_3];
                        end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_37_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_25_1[deduped_1_3][deduped_1_2] * deduped_21_1[deduped_1_3];
                        end ) );
            end )[1 + AsList( alpha_1 )[(1 + CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. (Length( Source( alpha_1 ) ) - 1) ][1] ))]] );
    hoisted_29_1 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( deduped_30_1, deduped_33_1 ), Product( deduped_36_1{[ 1 + deduped_45_1 .. Sum( [ deduped_45_1, deduped_46_1 ]{[ 1, 2 ]} ) ]} ) ) );
    hoisted_27_1 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( deduped_30_1, deduped_33_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, DefiningPairOfReflexiveQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( deduped_38_1, function ( i_2 )
                return REM_INT( QUO_INT( hoisted_27_1, deduped_47_1 ^ i_2 ), deduped_47_1 );
            end ), List( deduped_39_1, function ( i_2 )
                return REM_INT( QUO_INT( hoisted_29_1, deduped_48_1 ^ i_2 ), deduped_48_1 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, hoisted_15_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, deduped_21_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, deduped_28_1, hoisted_31_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1;
    deduped_59_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_58_1 := UnderlyingCategory( cat_1 );
    deduped_57_1 := DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_56_1 := deduped_57_1[4];
    deduped_55_1 := deduped_59_1[4];
    deduped_54_1 := deduped_59_1[2];
    deduped_53_1 := deduped_59_1[1];
    deduped_52_1 := CreateCapCategoryObjectWithAttributes( deduped_58_1, IndexOfObject, 1 );
    deduped_51_1 := deduped_57_1[2];
    deduped_50_1 := CreateCapCategoryObjectWithAttributes( deduped_58_1, IndexOfObject, 0 );
    deduped_49_1 := deduped_57_1[1];
    deduped_48_1 := CreateCapCategoryMorphismWithAttributes( deduped_58_1, deduped_50_1, deduped_52_1, IndexOfMorphism, 3 );
    deduped_47_1 := CreateCapCategoryMorphismWithAttributes( deduped_58_1, deduped_50_1, deduped_52_1, IndexOfMorphism, 2 );
    deduped_46_1 := CreateCapCategoryMorphismWithAttributes( deduped_58_1, deduped_52_1, deduped_50_1, IndexOfMorphism, 1 );
    deduped_45_1 := ListWithIdenticalEntries( deduped_51_1, deduped_52_1 );
    deduped_44_1 := ListWithIdenticalEntries( deduped_49_1, deduped_50_1 );
    deduped_43_1 := [ 0 .. deduped_51_1 - 1 ];
    deduped_42_1 := [ 0 .. deduped_49_1 - 1 ];
    deduped_41_1 := [ 0 .. Sum( [ deduped_49_1, deduped_51_1, deduped_51_1 ] ) - 1 ];
    deduped_2_1 := [ deduped_53_1, deduped_54_1 ];
    deduped_1_1 := [ 0, 1 ];
    deduped_40_1 := Concatenation( List( deduped_44_1, function ( objB_2 )
              return deduped_2_1[SafeUniquePosition( deduped_1_1, IndexOfObject( objB_2 ) )];
          end ), List( deduped_45_1, function ( objB_2 )
              return deduped_2_1[SafeUniquePosition( deduped_1_1, IndexOfObject( objB_2 ) )];
          end ) );
    deduped_39_1 := Product( deduped_40_1 );
    deduped_36_1 := [ 0 .. deduped_39_1 - 1 ];
    deduped_38_1 := List( deduped_43_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + (i_2 + deduped_49_1);
            hoisted_2_2 := deduped_40_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_40_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_36_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_37_1 := ListWithIdenticalEntries( Length( deduped_43_1 ), deduped_39_1 );
    hoisted_24_1 := Concatenation( List( deduped_42_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + i_2;
              hoisted_2_2 := deduped_40_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_40_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_36_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), deduped_38_1, deduped_38_1 );
    deduped_12_1 := [ deduped_59_1[3], List( deduped_55_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_55_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_11_1 := [ deduped_46_1, deduped_47_1, deduped_48_1 ];
    deduped_10_1 := [ 0, 1, 2, 3, 4, 5, 6 ];
    deduped_9_1 := [ 0, 0, 1, 1, 1, 1, 1 ];
    deduped_8_1 := [ 0, 1, 0, 0, 1, 1, 1 ];
    deduped_7_1 := [ 0, 4 ];
    hoisted_23_1 := Concatenation( List( ListWithIdenticalEntries( deduped_49_1, deduped_46_1 ), function ( morB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := IndexOfMorphism( morB_2 );
              deduped_6_2 := IndexOfObject( Range( morB_2 ) );
              deduped_5_2 := IndexOfObject( Source( morB_2 ) );
              deduped_4_2 := 1 + deduped_7_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_8_1[deduped_4_2] and deduped_6_2 = deduped_9_1[deduped_4_2] then
                              return deduped_7_2 = deduped_10_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_5_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePositionProperty( deduped_11_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_51_1, deduped_47_1 ), function ( morB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := IndexOfMorphism( morB_2 );
              deduped_6_2 := IndexOfObject( Range( morB_2 ) );
              deduped_5_2 := IndexOfObject( Source( morB_2 ) );
              deduped_4_2 := 1 + deduped_7_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_8_1[deduped_4_2] and deduped_6_2 = deduped_9_1[deduped_4_2] then
                              return deduped_7_2 = deduped_10_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_5_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePositionProperty( deduped_11_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_51_1, deduped_48_1 ), function ( morB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := IndexOfMorphism( morB_2 );
              deduped_6_2 := IndexOfObject( Range( morB_2 ) );
              deduped_5_2 := IndexOfObject( Source( morB_2 ) );
              deduped_4_2 := 1 + deduped_7_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_8_1[deduped_4_2] and deduped_6_2 = deduped_9_1[deduped_4_2] then
                              return deduped_7_2 = deduped_10_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_5_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePositionProperty( deduped_11_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ) );
    deduped_3_1 := Concatenation( ListWithIdenticalEntries( Length( deduped_42_1 ), deduped_39_1 ), deduped_37_1, deduped_37_1 );
    hoisted_25_1 := List( deduped_41_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_23_1[deduped_3_2];
            hoisted_1_2 := hoisted_24_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_14_1 := List( deduped_56_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_13_1 := List( deduped_56_1, function ( a_2 )
            return a_2[1];
        end );
    deduped_6_1 := Concatenation( List( deduped_44_1, IndexOfObject ), List( deduped_45_1, IndexOfObject ) );
    deduped_4_1 := deduped_57_1[3];
    hoisted_20_1 := Concatenation( List( deduped_42_1, function ( i_2 )
              return deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_6_1[1 + (deduped_4_1[1 + i_2] + deduped_49_1)] )];
          end ), List( deduped_43_1, function ( i_2 )
              return deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_6_1[1 + deduped_13_1[(1 + i_2)]] )];
          end ), List( deduped_43_1, function ( i_2 )
              return deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_6_1[1 + deduped_14_1[(1 + i_2)]] )];
          end ) );
    deduped_21_1 := List( deduped_41_1, function ( j_2 )
            return Product( hoisted_20_1{[ 1 .. j_2 ]} );
        end );
    hoisted_18_1 := Concatenation( List( deduped_42_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + (deduped_4_1[1 + i_2] + deduped_49_1);
              hoisted_2_2 := deduped_40_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_40_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_36_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_43_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_13_1[(1 + i_2)];
              hoisted_2_2 := deduped_40_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_40_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_36_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_43_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_14_1[(1 + i_2)];
              hoisted_2_2 := deduped_40_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_40_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_36_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_15_1 := Concatenation( List( deduped_42_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_7_1[(1 + deduped_6_1[(1 + (deduped_4_1[1 + i_2] + deduped_49_1))])];
              deduped_7_2 := deduped_10_1[deduped_8_2];
              deduped_6_2 := deduped_9_1[deduped_8_2];
              deduped_5_2 := deduped_8_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_7_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_8_1[deduped_4_2] and deduped_6_2 = deduped_9_1[deduped_4_2] then
                              return deduped_7_2 = deduped_10_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_5_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePositionProperty( deduped_11_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( deduped_43_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_7_1[(1 + deduped_6_1[(1 + deduped_13_1[(1 + i_2)])])];
              deduped_7_2 := deduped_10_1[deduped_8_2];
              deduped_6_2 := deduped_9_1[deduped_8_2];
              deduped_5_2 := deduped_8_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_7_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_8_1[deduped_4_2] and deduped_6_2 = deduped_9_1[deduped_4_2] then
                              return deduped_7_2 = deduped_10_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_5_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePositionProperty( deduped_11_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( deduped_43_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_7_1[(1 + deduped_6_1[(1 + deduped_14_1[(1 + i_2)])])];
              deduped_7_2 := deduped_10_1[deduped_8_2];
              deduped_6_2 := deduped_9_1[deduped_8_2];
              deduped_5_2 := deduped_8_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_7_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_8_1[deduped_4_2] and deduped_6_2 = deduped_9_1[deduped_4_2] then
                              return deduped_7_2 = deduped_10_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePosition( deduped_1_1, deduped_5_2 )] - 1 ];
              else
                  return deduped_12_1[SafeUniquePositionProperty( deduped_11_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ) );
    hoisted_19_1 := List( deduped_41_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_15_1[deduped_3_2];
            hoisted_1_2 := hoisted_18_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_35_1 := Filtered( deduped_36_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_41_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_19_1[deduped_1_3][deduped_1_2] * deduped_21_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_41_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_25_1[deduped_1_3][deduped_1_2] * deduped_21_1[deduped_1_3];
                    end ) );
        end );
    deduped_34_1 := Length( deduped_35_1 );
    hoisted_31_1 := Product( deduped_40_1{[ 1 + deduped_49_1 .. Sum( [ deduped_49_1, deduped_51_1 ]{[ 1, 2 ]} ) ]} );
    deduped_28_1 := Product( deduped_40_1{[ 1 .. deduped_49_1 ]} );
    return List( [ 0 .. deduped_34_1 - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_35_1[1 + REM_INT( i_2, deduped_34_1 )] );
            hoisted_2_2 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( deduped_3_2, deduped_28_1 ), hoisted_31_1 ) );
            hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( deduped_3_2, deduped_28_1 ) );
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfReflexiveQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( deduped_42_1, function ( i_3 )
                        return REM_INT( QUO_INT( hoisted_1_2, deduped_53_1 ^ i_3 ), deduped_53_1 );
                    end ), List( deduped_43_1, function ( i_3 )
                        return REM_INT( QUO_INT( hoisted_2_2, deduped_54_1 ^ i_3 ), deduped_54_1 );
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
