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
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, hoisted_13_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, deduped_19_1, hoisted_21_1, hoisted_23_1, hoisted_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1;
    deduped_44_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_43_1 := UnderlyingCategory( cat_1 );
    deduped_42_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_41_1 := deduped_44_1[3];
    deduped_40_1 := deduped_42_1[3];
    deduped_39_1 := CreateCapCategoryObjectWithAttributes( deduped_43_1, IndexOfObject, 1 );
    deduped_38_1 := deduped_42_1[2];
    deduped_37_1 := CreateCapCategoryObjectWithAttributes( deduped_43_1, IndexOfObject, 0 );
    deduped_36_1 := deduped_42_1[1];
    deduped_35_1 := CreateCapCategoryMorphismWithAttributes( deduped_43_1, deduped_37_1, deduped_39_1, IndexOfMorphism, 2 );
    deduped_34_1 := CreateCapCategoryMorphismWithAttributes( deduped_43_1, deduped_37_1, deduped_39_1, IndexOfMorphism, 1 );
    deduped_33_1 := ListWithIdenticalEntries( deduped_38_1, deduped_39_1 );
    deduped_32_1 := ListWithIdenticalEntries( deduped_36_1, deduped_37_1 );
    deduped_31_1 := [ 0 .. deduped_38_1 - 1 ];
    deduped_30_1 := [ 0 .. deduped_38_1 + deduped_38_1 - 1 ];
    deduped_2_1 := [ deduped_44_1[1], deduped_44_1[2] ];
    deduped_1_1 := [ deduped_37_1, deduped_39_1 ];
    deduped_28_1 := Concatenation( List( deduped_32_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_33_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ) );
    deduped_27_1 := Product( deduped_28_1 );
    deduped_25_1 := [ 0 .. deduped_27_1 - 1 ];
    deduped_29_1 := List( deduped_31_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + (i_2 + deduped_36_1);
            hoisted_2_2 := deduped_28_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_28_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_25_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_26_1 := ListWithIdenticalEntries( Length( deduped_31_1 ), deduped_27_1 );
    hoisted_23_1 := Concatenation( deduped_29_1, deduped_29_1 );
    deduped_11_1 := [ List( deduped_41_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_41_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_10_1 := [ deduped_34_1, deduped_35_1 ];
    deduped_9_1 := [ 0, 1, 2, 3 ];
    deduped_8_1 := [ 0, 1, 1, 1 ];
    deduped_7_1 := [ 0, 0, 0, 1 ];
    deduped_6_1 := [ 0, 3 ];
    hoisted_21_1 := Concatenation( List( ListWithIdenticalEntries( deduped_38_1, deduped_34_1 ), function ( morB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := IndexOfMorphism( morB_2 );
              deduped_6_2 := IndexOfObject( Range( morB_2 ) );
              deduped_5_2 := IndexOfObject( Source( morB_2 ) );
              deduped_4_2 := 1 + deduped_6_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_7_1[deduped_4_2] and deduped_6_2 = deduped_8_1[deduped_4_2] then
                              return deduped_7_2 = deduped_9_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_11_1[SafeUniquePositionProperty( deduped_10_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_38_1, deduped_35_1 ), function ( morB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := IndexOfMorphism( morB_2 );
              deduped_6_2 := IndexOfObject( Range( morB_2 ) );
              deduped_5_2 := IndexOfObject( Source( morB_2 ) );
              deduped_4_2 := 1 + deduped_6_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_7_1[deduped_4_2] and deduped_6_2 = deduped_8_1[deduped_4_2] then
                              return deduped_7_2 = deduped_9_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_11_1[SafeUniquePositionProperty( deduped_10_1, function ( mor_3 )
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
    deduped_3_1 := Concatenation( deduped_26_1, deduped_26_1 );
    hoisted_24_1 := List( deduped_30_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_21_1[deduped_3_2];
            hoisted_1_2 := hoisted_23_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_12_1 := List( deduped_40_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_5_1 := Concatenation( List( deduped_32_1, IndexOfObject ), List( deduped_33_1, IndexOfObject ) );
    deduped_4_1 := List( deduped_40_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_18_1 := Concatenation( List( deduped_31_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_5_1[1 + deduped_4_1[(1 + i_2)]];
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_31_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_5_1[1 + deduped_12_1[(1 + i_2)]];
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ) );
    deduped_19_1 := List( deduped_30_1, function ( j_2 )
            return Product( hoisted_18_1{[ 1 .. j_2 ]} );
        end );
    hoisted_16_1 := Concatenation( List( deduped_31_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_4_1[(1 + i_2)];
              hoisted_2_2 := deduped_28_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_28_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_25_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_31_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_12_1[(1 + i_2)];
              hoisted_2_2 := deduped_28_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_28_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_25_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_13_1 := Concatenation( List( deduped_31_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_6_1[(1 + deduped_5_1[(1 + deduped_4_1[(1 + i_2)])])];
              deduped_7_2 := deduped_9_1[deduped_8_2];
              deduped_6_2 := deduped_8_1[deduped_8_2];
              deduped_5_2 := deduped_7_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_6_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_7_1[deduped_4_2] and deduped_6_2 = deduped_8_1[deduped_4_2] then
                              return deduped_7_2 = deduped_9_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_11_1[SafeUniquePositionProperty( deduped_10_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( deduped_31_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_6_1[(1 + deduped_5_1[(1 + deduped_12_1[(1 + i_2)])])];
              deduped_7_2 := deduped_9_1[deduped_8_2];
              deduped_6_2 := deduped_8_1[deduped_8_2];
              deduped_5_2 := deduped_7_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_6_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_7_1[deduped_4_2] and deduped_6_2 = deduped_8_1[deduped_4_2] then
                              return deduped_7_2 = deduped_9_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_11_1[SafeUniquePositionProperty( deduped_10_1, function ( mor_3 )
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
    hoisted_17_1 := List( deduped_30_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_13_1[deduped_3_2];
            hoisted_1_2 := hoisted_16_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, Length( Filtered( deduped_25_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_30_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_17_1[deduped_1_3][deduped_1_2] * deduped_19_1[deduped_1_3];
                        end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_30_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_24_1[deduped_1_3][deduped_1_2] * deduped_19_1[deduped_1_3];
                        end ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, hoisted_13_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, deduped_19_1, hoisted_21_1, hoisted_23_1, hoisted_24_1, hoisted_26_1, hoisted_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1;
    deduped_55_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( range_1 );
    deduped_54_1 := UnderlyingCategory( cat_1 );
    deduped_53_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( source_1 );
    deduped_52_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_51_1 := deduped_55_1[3];
    deduped_50_1 := deduped_53_1[3];
    deduped_49_1 := deduped_55_1[2];
    deduped_48_1 := deduped_55_1[1];
    deduped_47_1 := CreateCapCategoryObjectWithAttributes( deduped_54_1, IndexOfObject, 1 );
    deduped_46_1 := CreateCapCategoryObjectWithAttributes( deduped_54_1, IndexOfObject, 0 );
    deduped_45_1 := deduped_53_1[2];
    deduped_44_1 := deduped_53_1[1];
    deduped_43_1 := CreateCapCategoryMorphismWithAttributes( deduped_54_1, deduped_46_1, deduped_47_1, IndexOfMorphism, 2 );
    deduped_42_1 := CreateCapCategoryMorphismWithAttributes( deduped_54_1, deduped_46_1, deduped_47_1, IndexOfMorphism, 1 );
    deduped_41_1 := ListWithIdenticalEntries( deduped_45_1, deduped_47_1 );
    deduped_40_1 := ListWithIdenticalEntries( deduped_44_1, deduped_46_1 );
    deduped_39_1 := [ 0 .. deduped_45_1 - 1 ];
    deduped_38_1 := [ 0 .. deduped_45_1 + deduped_45_1 - 1 ];
    deduped_37_1 := List( ListOfValues( [ CreateCapCategoryObjectWithAttributes( deduped_52_1, Length, deduped_44_1 ), CreateCapCategoryObjectWithAttributes( deduped_52_1, Length, deduped_45_1 ) ] ), Length );
    deduped_36_1 := deduped_37_1[1];
    deduped_2_1 := [ deduped_48_1, deduped_49_1 ];
    deduped_1_1 := [ deduped_46_1, deduped_47_1 ];
    deduped_34_1 := Concatenation( List( deduped_40_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_41_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ) );
    deduped_33_1 := Product( deduped_34_1 );
    deduped_30_1 := [ 0 .. deduped_33_1 - 1 ];
    deduped_35_1 := List( deduped_39_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + (i_2 + deduped_44_1);
            hoisted_2_2 := deduped_34_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_34_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_30_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_32_1 := Product( deduped_34_1{[ 1 .. deduped_36_1 ]} );
    deduped_31_1 := ListWithIdenticalEntries( Length( deduped_39_1 ), deduped_33_1 );
    hoisted_23_1 := Concatenation( deduped_35_1, deduped_35_1 );
    deduped_11_1 := [ List( deduped_51_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_51_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_10_1 := [ deduped_42_1, deduped_43_1 ];
    deduped_9_1 := [ 0, 1, 2, 3 ];
    deduped_8_1 := [ 0, 1, 1, 1 ];
    deduped_7_1 := [ 0, 0, 0, 1 ];
    deduped_6_1 := [ 0, 3 ];
    hoisted_21_1 := Concatenation( List( ListWithIdenticalEntries( deduped_45_1, deduped_42_1 ), function ( morB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := IndexOfMorphism( morB_2 );
              deduped_6_2 := IndexOfObject( Range( morB_2 ) );
              deduped_5_2 := IndexOfObject( Source( morB_2 ) );
              deduped_4_2 := 1 + deduped_6_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_7_1[deduped_4_2] and deduped_6_2 = deduped_8_1[deduped_4_2] then
                              return deduped_7_2 = deduped_9_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_11_1[SafeUniquePositionProperty( deduped_10_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_45_1, deduped_43_1 ), function ( morB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := IndexOfMorphism( morB_2 );
              deduped_6_2 := IndexOfObject( Range( morB_2 ) );
              deduped_5_2 := IndexOfObject( Source( morB_2 ) );
              deduped_4_2 := 1 + deduped_6_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_7_1[deduped_4_2] and deduped_6_2 = deduped_8_1[deduped_4_2] then
                              return deduped_7_2 = deduped_9_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_11_1[SafeUniquePositionProperty( deduped_10_1, function ( mor_3 )
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
    deduped_3_1 := Concatenation( deduped_31_1, deduped_31_1 );
    hoisted_24_1 := List( deduped_38_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_21_1[deduped_3_2];
            hoisted_1_2 := hoisted_23_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_12_1 := List( deduped_50_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_5_1 := Concatenation( List( deduped_40_1, IndexOfObject ), List( deduped_41_1, IndexOfObject ) );
    deduped_4_1 := List( deduped_50_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_18_1 := Concatenation( List( deduped_39_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_5_1[1 + deduped_4_1[(1 + i_2)]];
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_39_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_5_1[1 + deduped_12_1[(1 + i_2)]];
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ) );
    deduped_19_1 := List( deduped_38_1, function ( j_2 )
            return Product( hoisted_18_1{[ 1 .. j_2 ]} );
        end );
    hoisted_16_1 := Concatenation( List( deduped_39_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_4_1[(1 + i_2)];
              hoisted_2_2 := deduped_34_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_34_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_30_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_39_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_12_1[(1 + i_2)];
              hoisted_2_2 := deduped_34_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_34_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_30_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_13_1 := Concatenation( List( deduped_39_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_6_1[(1 + deduped_5_1[(1 + deduped_4_1[(1 + i_2)])])];
              deduped_7_2 := deduped_9_1[deduped_8_2];
              deduped_6_2 := deduped_8_1[deduped_8_2];
              deduped_5_2 := deduped_7_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_6_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_7_1[deduped_4_2] and deduped_6_2 = deduped_8_1[deduped_4_2] then
                              return deduped_7_2 = deduped_9_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_11_1[SafeUniquePositionProperty( deduped_10_1, function ( mor_3 )
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
              deduped_8_2 := 1 + deduped_6_1[(1 + deduped_5_1[(1 + deduped_12_1[(1 + i_2)])])];
              deduped_7_2 := deduped_9_1[deduped_8_2];
              deduped_6_2 := deduped_8_1[deduped_8_2];
              deduped_5_2 := deduped_7_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_6_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_7_1[deduped_4_2] and deduped_6_2 = deduped_8_1[deduped_4_2] then
                              return deduped_7_2 = deduped_9_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_11_1[SafeUniquePositionProperty( deduped_10_1, function ( mor_3 )
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
    hoisted_17_1 := List( deduped_38_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_13_1[deduped_3_2];
            hoisted_1_2 := hoisted_16_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_29_1 := CAP_JIT_INCOMPLETE_LOGIC( Filtered( deduped_30_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_38_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_17_1[deduped_1_3][deduped_1_2] * deduped_19_1[deduped_1_3];
                        end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_38_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_24_1[deduped_1_3][deduped_1_2] * deduped_19_1[deduped_1_3];
                        end ) );
            end )[1 + AsList( alpha_1 )[(1 + CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. (Length( Source( alpha_1 ) ) - 1) ][1] ))]] );
    hoisted_28_1 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( deduped_29_1, deduped_32_1 ), Product( deduped_34_1{[ 1 + deduped_36_1 .. Sum( deduped_37_1{[ 1, 2 ]} ) ]} ) ) );
    hoisted_26_1 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( deduped_29_1, deduped_32_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, DefiningPairOfQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( [ 0 .. deduped_36_1 - 1 ], function ( i_2 )
                return REM_INT( QUO_INT( hoisted_26_1, deduped_48_1 ^ i_2 ), deduped_48_1 );
            end ), List( [ 0 .. deduped_37_1[2] - 1 ], function ( i_2 )
                return REM_INT( QUO_INT( hoisted_28_1, deduped_49_1 ^ i_2 ), deduped_49_1 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, hoisted_13_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, deduped_19_1, hoisted_21_1, hoisted_23_1, hoisted_24_1, deduped_27_1, hoisted_29_1, hoisted_30_1, hoisted_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1;
    deduped_59_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_58_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( arg3_1 );
    deduped_57_1 := UnderlyingCategory( cat_1 );
    deduped_56_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( arg2_1 );
    deduped_55_1 := deduped_58_1[3];
    deduped_54_1 := deduped_56_1[3];
    deduped_53_1 := deduped_58_1[2];
    deduped_52_1 := deduped_58_1[1];
    deduped_51_1 := CreateCapCategoryObjectWithAttributes( deduped_57_1, IndexOfObject, 1 );
    deduped_50_1 := deduped_56_1[2];
    deduped_49_1 := CreateCapCategoryObjectWithAttributes( deduped_57_1, IndexOfObject, 0 );
    deduped_48_1 := deduped_56_1[1];
    deduped_47_1 := CreateCapCategoryMorphismWithAttributes( deduped_57_1, deduped_49_1, deduped_51_1, IndexOfMorphism, 2 );
    deduped_46_1 := CreateCapCategoryMorphismWithAttributes( deduped_57_1, deduped_49_1, deduped_51_1, IndexOfMorphism, 1 );
    deduped_45_1 := ListWithIdenticalEntries( deduped_50_1, deduped_51_1 );
    deduped_44_1 := ListWithIdenticalEntries( deduped_48_1, deduped_49_1 );
    deduped_43_1 := [ 0 .. deduped_50_1 - 1 ];
    deduped_42_1 := [ 0 .. deduped_50_1 + deduped_50_1 - 1 ];
    deduped_41_1 := List( ListOfValues( [ CreateCapCategoryObjectWithAttributes( deduped_59_1, Length, deduped_48_1 ), CreateCapCategoryObjectWithAttributes( deduped_59_1, Length, deduped_50_1 ) ] ), Length );
    deduped_40_1 := deduped_41_1[1];
    deduped_2_1 := [ deduped_52_1, deduped_53_1 ];
    deduped_1_1 := [ deduped_49_1, deduped_51_1 ];
    deduped_38_1 := Concatenation( List( deduped_44_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_45_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ) );
    deduped_37_1 := Product( deduped_38_1 );
    deduped_35_1 := [ 0 .. deduped_37_1 - 1 ];
    deduped_39_1 := List( deduped_43_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + (i_2 + deduped_48_1);
            hoisted_2_2 := deduped_38_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_38_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_35_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_36_1 := ListWithIdenticalEntries( Length( deduped_43_1 ), deduped_37_1 );
    hoisted_23_1 := Concatenation( deduped_39_1, deduped_39_1 );
    deduped_11_1 := [ List( deduped_55_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_55_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_10_1 := [ deduped_46_1, deduped_47_1 ];
    deduped_9_1 := [ 0, 1, 2, 3 ];
    deduped_8_1 := [ 0, 1, 1, 1 ];
    deduped_7_1 := [ 0, 0, 0, 1 ];
    deduped_6_1 := [ 0, 3 ];
    hoisted_21_1 := Concatenation( List( ListWithIdenticalEntries( deduped_50_1, deduped_46_1 ), function ( morB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := IndexOfMorphism( morB_2 );
              deduped_6_2 := IndexOfObject( Range( morB_2 ) );
              deduped_5_2 := IndexOfObject( Source( morB_2 ) );
              deduped_4_2 := 1 + deduped_6_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_7_1[deduped_4_2] and deduped_6_2 = deduped_8_1[deduped_4_2] then
                              return deduped_7_2 = deduped_9_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_11_1[SafeUniquePositionProperty( deduped_10_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_50_1, deduped_47_1 ), function ( morB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := IndexOfMorphism( morB_2 );
              deduped_6_2 := IndexOfObject( Range( morB_2 ) );
              deduped_5_2 := IndexOfObject( Source( morB_2 ) );
              deduped_4_2 := 1 + deduped_6_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_7_1[deduped_4_2] and deduped_6_2 = deduped_8_1[deduped_4_2] then
                              return deduped_7_2 = deduped_9_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_11_1[SafeUniquePositionProperty( deduped_10_1, function ( mor_3 )
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
    deduped_3_1 := Concatenation( deduped_36_1, deduped_36_1 );
    hoisted_24_1 := List( deduped_42_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_21_1[deduped_3_2];
            hoisted_1_2 := hoisted_23_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_12_1 := List( deduped_54_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_5_1 := Concatenation( List( deduped_44_1, IndexOfObject ), List( deduped_45_1, IndexOfObject ) );
    deduped_4_1 := List( deduped_54_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_18_1 := Concatenation( List( deduped_43_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_5_1[1 + deduped_4_1[(1 + i_2)]];
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_43_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_5_1[1 + deduped_12_1[(1 + i_2)]];
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ) );
    deduped_19_1 := List( deduped_42_1, function ( j_2 )
            return Product( hoisted_18_1{[ 1 .. j_2 ]} );
        end );
    hoisted_16_1 := Concatenation( List( deduped_43_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_4_1[(1 + i_2)];
              hoisted_2_2 := deduped_38_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_38_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_35_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_43_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_12_1[(1 + i_2)];
              hoisted_2_2 := deduped_38_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_38_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_35_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_13_1 := Concatenation( List( deduped_43_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_6_1[(1 + deduped_5_1[(1 + deduped_4_1[(1 + i_2)])])];
              deduped_7_2 := deduped_9_1[deduped_8_2];
              deduped_6_2 := deduped_8_1[deduped_8_2];
              deduped_5_2 := deduped_7_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_6_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_7_1[deduped_4_2] and deduped_6_2 = deduped_8_1[deduped_4_2] then
                              return deduped_7_2 = deduped_9_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_11_1[SafeUniquePositionProperty( deduped_10_1, function ( mor_3 )
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
              deduped_8_2 := 1 + deduped_6_1[(1 + deduped_5_1[(1 + deduped_12_1[(1 + i_2)])])];
              deduped_7_2 := deduped_9_1[deduped_8_2];
              deduped_6_2 := deduped_8_1[deduped_8_2];
              deduped_5_2 := deduped_7_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_6_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_7_1[deduped_4_2] and deduped_6_2 = deduped_8_1[deduped_4_2] then
                              return deduped_7_2 = deduped_9_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_11_1[SafeUniquePositionProperty( deduped_10_1, function ( mor_3 )
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
    hoisted_17_1 := List( deduped_42_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_13_1[deduped_3_2];
            hoisted_1_2 := hoisted_16_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_34_1 := Filtered( deduped_35_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_42_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_17_1[deduped_1_3][deduped_1_2] * deduped_19_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_42_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_24_1[deduped_1_3][deduped_1_2] * deduped_19_1[deduped_1_3];
                    end ) );
        end );
    deduped_33_1 := Length( deduped_34_1 );
    hoisted_32_1 := [ 0 .. deduped_41_1[2] - 1 ];
    hoisted_30_1 := Product( deduped_38_1{[ 1 + deduped_40_1 .. Sum( deduped_41_1{[ 1, 2 ]} ) ]} );
    hoisted_29_1 := [ 0 .. deduped_40_1 - 1 ];
    deduped_27_1 := Product( deduped_38_1{[ 1 .. deduped_40_1 ]} );
    return List( [ 0 .. deduped_33_1 - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( deduped_34_1[1 + REM_INT( i_2, deduped_33_1 )] );
            hoisted_2_2 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( deduped_3_2, deduped_27_1 ), hoisted_30_1 ) );
            hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( deduped_3_2, deduped_27_1 ) );
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, DefiningPairOfQuiverMorphismEnrichedOverSkeletalFinSets, NTuple( 2, List( hoisted_29_1, function ( i_3 )
                        return REM_INT( QUO_INT( hoisted_1_2, deduped_52_1 ^ i_3 ), deduped_52_1 );
                    end ), List( hoisted_32_1, function ( i_3 )
                        return REM_INT( QUO_INT( hoisted_2_2, deduped_53_1 ^ i_3 ), deduped_53_1 );
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
    return CategoryOfQuiversEnrichedOver( CategoryOfSkeletalFinSets(  : FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_FinQuiversPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
