# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_PreSheavesOfCategoryFromDataTablesInSkeletalFinSetsPrecompiled", function ( cat )
    
    ##
    AddInitialObject( cat,
        
########
function ( cat_1 )
    local hoisted_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1;
    deduped_6_1 := Range( cat_1 );
    deduped_5_1 := Source( cat_1 );
    deduped_4_1 := CreateCapCategoryObjectWithAttributes( deduped_6_1, Length, BigInt( 0 ) );
    deduped_3_1 := DefiningTripleOfUnderlyingQuiver( deduped_5_1 );
    hoisted_2_1 := CreateCapCategoryMorphismWithAttributes( deduped_6_1, deduped_4_1, deduped_4_1, AsList, [  ] );
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, deduped_5_1, Range, deduped_6_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_3_1[1] ], function ( o_2 )
                return deduped_4_1;
            end ), LazyHList( [ 1 .. deduped_3_1[2] ], function ( m_2 )
                return hoisted_2_1;
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddCoproduct( cat,
        
########
function ( cat_1, objects_1 )
    local hoisted_2_1, hoisted_3_1, deduped_4_1, deduped_5_1, deduped_6_1;
    deduped_6_1 := Range( cat_1 );
    deduped_5_1 := Source( cat_1 );
    deduped_4_1 := DefiningTripleOfUnderlyingQuiver( deduped_5_1 );
    hoisted_3_1 := [ 1 .. Length( objects_1 ) ];
    hoisted_2_1 := deduped_4_1[3];
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, deduped_5_1, Range, deduped_6_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_4_1[1] ], function ( o_2 )
                return CreateCapCategoryObjectWithAttributes( deduped_6_1, Length, Sum( List( objects_1, function ( F_3 )
                            return CAP_JIT_INCOMPLETE_LOGIC( Length( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( F_3 )[1][o_2] ) ) );
                        end ) ) );
            end ), LazyHList( [ 1 .. deduped_4_1[2] ], function ( m_2 )
                local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
                deduped_4_2 := hoisted_2_1[m_2];
                deduped_3_2 := List( objects_1, function ( F_3 )
                        return CAP_JIT_INCOMPLETE_LOGIC( Length( Range( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( F_3 )[2][m_2] ) ) ) );
                    end );
                hoisted_2_2 := 1 + deduped_4_2[1];
                hoisted_1_2 := 1 + deduped_4_2[2];
                return CreateCapCategoryMorphismWithAttributes( deduped_6_1, CreateCapCategoryObjectWithAttributes( deduped_6_1, Length, Sum( List( objects_1, function ( F_3 )
                              return CAP_JIT_INCOMPLETE_LOGIC( Length( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( F_3 )[1][hoisted_1_2] ) ) );
                          end ) ) ), CreateCapCategoryObjectWithAttributes( deduped_6_1, Length, Sum( List( objects_1, function ( F_3 )
                              return CAP_JIT_INCOMPLETE_LOGIC( Length( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( F_3 )[1][hoisted_2_2] ) ) );
                          end ) ) ), AsList, Concatenation( List( hoisted_3_1, function ( i_3 )
                            local hoisted_1_3, hoisted_2_3, deduped_3_3, deduped_4_3;
                            deduped_4_3 := Sum( deduped_3_2{[ 1 .. i_3 - 1 ]} );
                            deduped_3_3 := CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( CAP_JIT_INCOMPLETE_LOGIC( objects_1[i_3] ) )[2][m_2] );
                            hoisted_2_3 := [ deduped_4_3 .. deduped_4_3 + deduped_3_2[i_3] - 1 ];
                            hoisted_1_3 := CAP_JIT_INCOMPLETE_LOGIC( AsList( deduped_3_3 ) );
                            return List( [ 0 .. CAP_JIT_INCOMPLETE_LOGIC( Length( Source( deduped_3_3 ) ) ) - 1 ], function ( i_4 )
                                    return hoisted_2_3[1 + hoisted_1_3[(1 + i_4)]];
                                end );
                        end ) ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInjectionOfCofactorOfCoproductWithGivenCoproduct( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1;
    deduped_5_1 := objects_1[k_1];
    hoisted_4_1 := Range( cat_1 );
    hoisted_3_1 := [ 1 .. k_1 - 1 ];
    hoisted_2_1 := ValuesOfPreSheaf( P_1 )[1];
    hoisted_1_1 := ValuesOfPreSheaf( CAP_JIT_INCOMPLETE_LOGIC( deduped_5_1 ) )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_5_1, P_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              local deduped_1_2, deduped_2_2;
              deduped_2_2 := List( objects_1, function ( F_3 )
                      return CAP_JIT_INCOMPLETE_LOGIC( Length( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( F_3 )[1][o_2] ) ) );
                  end );
              deduped_1_2 := Sum( deduped_2_2{hoisted_3_1} );
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, CAP_JIT_INCOMPLETE_LOGIC( hoisted_1_1[o_2] ), hoisted_2_1[o_2], AsList, [ deduped_1_2 .. deduped_1_2 + deduped_2_2[k_1] - 1 ] );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromCoproductWithGivenCoproduct( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1;
    hoisted_3_1 := Range( cat_1 );
    hoisted_2_1 := ValuesOfPreSheaf( T_1 )[1];
    hoisted_1_1 := ValuesOfPreSheaf( P_1 )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, ValuesOnAllObjects, LazyHList( [ 1 .. DefiningTripleOfUnderlyingQuiver( Source( cat_1 ) )[1] ], function ( o_2 )
              return CreateCapCategoryMorphismWithAttributes( hoisted_3_1, hoisted_1_1[o_2], hoisted_2_1[o_2], AsList, Concatenation( List( tau_1, function ( eta_3 )
                          return CAP_JIT_INCOMPLETE_LOGIC( AsList( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( eta_3 )[o_2] ) ) );
                      end ) ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddHomomorphismStructureOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, hoisted_17_1, deduped_18_1, deduped_19_1, hoisted_20_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, deduped_26_1, hoisted_28_1, hoisted_29_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1;
    deduped_49_1 := ValuesOfPreSheaf( arg3_1 );
    deduped_48_1 := ValuesOfPreSheaf( arg2_1 );
    deduped_47_1 := Source( cat_1 );
    deduped_46_1 := IndicesOfGeneratingMorphisms( deduped_47_1 );
    deduped_45_1 := deduped_48_1[2];
    deduped_44_1 := DataTables( deduped_47_1 );
    deduped_43_1 := DefiningTripleOfUnderlyingQuiver( deduped_47_1 );
    deduped_42_1 := deduped_44_1[2];
    deduped_41_1 := deduped_44_1[1];
    deduped_40_1 := [ 0 .. deduped_43_1[2] - 1 ];
    deduped_39_1 := [ 0 .. deduped_43_1[1] - 1 ];
    deduped_38_1 := [ 0 .. deduped_41_1[2] - 1 ];
    deduped_3_1 := List( deduped_49_1[1], Length );
    deduped_2_1 := [ 0 .. deduped_41_1[1] - 1 ];
    deduped_1_1 := List( deduped_48_1[1], Length );
    deduped_37_1 := Concatenation( List( deduped_39_1, function ( i_2 )
              return ListWithIdenticalEntries( deduped_1_1[1 + i_2], deduped_3_1[SafeUniquePosition( deduped_2_1, i_2 )] );
          end ) );
    deduped_36_1 := Product( deduped_37_1 );
    deduped_4_1 := List( deduped_45_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    deduped_35_1 := [ 0 .. Sum( List( deduped_40_1, function ( j_2 )
                    return deduped_4_1[1 + j_2];
                end ) ) - 1 ];
    deduped_34_1 := [ 0 .. deduped_36_1 - 1 ];
    deduped_10_1 := List( deduped_39_1, function ( i_2 )
            return Sum( List( [ 1 .. i_2 ], function ( j_3 )
                      return deduped_1_1[j_3];
                  end ) );
        end );
    deduped_9_1 := deduped_43_1[3];
    hoisted_32_1 := Concatenation( List( deduped_40_1, function ( j_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + j_2;
              hoisted_1_2 := deduped_10_1[1 + deduped_9_1[deduped_2_2][2]];
              return List( [ 0 .. deduped_4_1[deduped_2_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (i_3 + hoisted_1_2);
                      hoisted_2_3 := deduped_37_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_37_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_34_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    deduped_14_1 := deduped_42_1[3];
    deduped_15_1 := List( deduped_38_1, function ( i_2 )
            return deduped_14_1[1 + i_2];
        end );
    hoisted_29_1 := List( deduped_46_1, function ( i_2 )
            return deduped_15_1[1 + i_2];
        end );
    deduped_7_1 := deduped_42_1[2];
    deduped_13_1 := List( deduped_38_1, function ( i_2 )
            return deduped_7_1[1 + i_2];
        end );
    hoisted_28_1 := List( deduped_46_1, function ( i_2 )
            return deduped_13_1[1 + i_2];
        end );
    deduped_19_1 := List( deduped_49_1[2], AsList );
    hoisted_17_1 := List( deduped_38_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return CreateCapCategoryMorphismWithAttributes( deduped_47_1, CreateCapCategoryObjectWithAttributes( deduped_47_1, IndexOfObject, deduped_7_1[deduped_1_2] ), CreateCapCategoryObjectWithAttributes( deduped_47_1, IndexOfObject, deduped_14_1[deduped_1_2] ), IndexOfMorphism, i_2 );
        end );
    deduped_18_1 := List( deduped_46_1, function ( i_2 )
            return hoisted_17_1[1 + i_2];
        end );
    deduped_12_1 := deduped_42_1[1];
    hoisted_31_1 := Concatenation( List( deduped_40_1, function ( j_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2;
              deduped_10_2 := 1 + j_2;
              deduped_9_2 := deduped_4_1[deduped_10_2];
              deduped_8_2 := deduped_46_1[deduped_10_2];
              deduped_7_2 := hoisted_29_1[deduped_10_2];
              deduped_6_2 := hoisted_28_1[deduped_10_2];
              deduped_5_2 := deduped_12_1[1 + deduped_6_2];
              deduped_4_2 := 1 + deduped_5_2;
              if IdFunc( function (  )
                          if deduped_6_2 = deduped_13_1[deduped_4_2] and deduped_7_2 = deduped_15_1[deduped_4_2] then
                              return deduped_8_2 = deduped_5_2;
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return ListWithIdenticalEntries( deduped_9_2, [ 0 .. deduped_3_1[SafeUniquePosition( deduped_2_1, deduped_6_2 )] - 1 ] );
              else
                  return ListWithIdenticalEntries( deduped_9_2, deduped_19_1[SafeUniquePositionProperty( deduped_18_1, function ( mor_3 )
                             if IndexOfObject( Source( mor_3 ) ) = deduped_6_2 and IndexOfObject( Range( mor_3 ) ) = deduped_7_2 then
                                 return IndexOfMorphism( mor_3 ) = deduped_8_2;
                             else
                                 return false;
                             fi;
                             return;
                         end )] );
              fi;
              return;
          end ) );
    deduped_6_1 := Concatenation( List( deduped_40_1, function ( j_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_4_1[1 + j_2] - 1 ] ), deduped_36_1 );
          end ) );
    hoisted_33_1 := List( deduped_35_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_31_1[deduped_3_2];
            hoisted_1_2 := hoisted_32_1[deduped_3_2];
            return List( [ 0 .. deduped_6_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_11_1 := Concatenation( List( deduped_39_1, function ( i_2 )
              return ListWithIdenticalEntries( deduped_1_1[1 + i_2], i_2 );
          end ) );
    deduped_8_1 := List( deduped_45_1, AsList );
    hoisted_25_1 := Concatenation( List( deduped_40_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_10_1[1 + deduped_9_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_8_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( i_3 )
                      return deduped_3_1[SafeUniquePosition( deduped_2_1, deduped_11_1[1 + (hoisted_1_2[1 + i_3] + hoisted_2_2)] )];
                  end );
          end ) );
    deduped_26_1 := List( deduped_35_1, function ( j_2 )
            return Product( hoisted_25_1{[ 1 .. j_2 ]} );
        end );
    hoisted_23_1 := Concatenation( List( deduped_40_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_10_1[1 + deduped_9_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_8_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (hoisted_1_2[1 + i_3] + hoisted_2_2);
                      hoisted_2_3 := deduped_37_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_37_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_34_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_20_1 := Concatenation( List( deduped_40_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_10_1[1 + deduped_9_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_8_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( i_3 )
                      local deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3, deduped_8_3, deduped_9_3;
                      deduped_9_3 := deduped_12_1[1 + deduped_11_1[(1 + (hoisted_1_2[1 + i_3] + hoisted_2_2))]];
                      deduped_8_3 := 1 + deduped_9_3;
                      deduped_7_3 := deduped_15_1[deduped_8_3];
                      deduped_6_3 := deduped_13_1[deduped_8_3];
                      deduped_5_3 := deduped_12_1[1 + deduped_6_3];
                      deduped_4_3 := 1 + deduped_5_3;
                      if IdFunc( function (  )
                                  if deduped_6_3 = deduped_13_1[deduped_4_3] and deduped_7_3 = deduped_15_1[deduped_4_3] then
                                      return deduped_9_3 = deduped_5_3;
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_3_1[SafeUniquePosition( deduped_2_1, deduped_6_3 )] - 1 ];
                      else
                          return deduped_19_1[SafeUniquePositionProperty( deduped_18_1, function ( mor_4 )
                                   if IndexOfObject( Source( mor_4 ) ) = deduped_6_3 and IndexOfObject( Range( mor_4 ) ) = deduped_7_3 then
                                       return IndexOfMorphism( mor_4 ) = deduped_9_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_24_1 := List( deduped_35_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_20_1[deduped_3_2];
            hoisted_1_2 := hoisted_23_1[deduped_3_2];
            return List( [ 0 .. deduped_6_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( Range( cat_1 ), Length, Length( Filtered( deduped_34_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_35_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_24_1[deduped_1_3][deduped_1_2] * deduped_26_1[deduped_1_3];
                        end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_35_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_33_1[deduped_1_3][deduped_1_2] * deduped_26_1[deduped_1_3];
                        end ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddHomomorphismStructureOnMorphismsWithGivenObjects( cat,
        
########
function ( cat_1, source_1, alpha_1, beta_1, range_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, hoisted_17_1, deduped_18_1, deduped_19_1, hoisted_20_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, deduped_26_1, deduped_28_1, deduped_29_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, deduped_34_1, deduped_35_1, hoisted_36_1, hoisted_37_1, hoisted_40_1, hoisted_41_1, deduped_43_1, hoisted_45_1, deduped_46_1, hoisted_47_1, deduped_48_1, hoisted_52_1, hoisted_53_1, hoisted_54_1, hoisted_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, hoisted_61_1, hoisted_62_1, hoisted_63_1, hoisted_64_1, deduped_65_1, hoisted_67_1, hoisted_68_1, hoisted_69_1, hoisted_70_1, hoisted_71_1, hoisted_72_1, deduped_73_1, deduped_74_1, deduped_75_1, deduped_76_1, deduped_77_1, deduped_78_1, deduped_79_1, deduped_80_1, deduped_81_1, deduped_82_1, deduped_83_1, deduped_84_1, deduped_85_1, deduped_86_1, deduped_87_1, deduped_88_1, deduped_89_1, deduped_90_1, deduped_91_1, deduped_92_1, deduped_93_1, deduped_94_1, deduped_95_1, deduped_96_1, deduped_97_1, deduped_98_1, deduped_99_1, deduped_100_1, deduped_101_1;
    deduped_101_1 := Source( cat_1 );
    deduped_100_1 := ListOfValues( ValuesOnAllObjects( alpha_1 ) );
    deduped_99_1 := ValuesOfPreSheaf( Source( beta_1 ) );
    deduped_98_1 := ValuesOfPreSheaf( Range( alpha_1 ) );
    deduped_97_1 := IndicesOfGeneratingMorphisms( deduped_101_1 );
    deduped_96_1 := DefiningTripleOfUnderlyingQuiver( deduped_101_1 );
    deduped_95_1 := ValuesOfPreSheaf( Range( beta_1 ) );
    deduped_94_1 := DataTables( deduped_101_1 );
    deduped_93_1 := ValuesOfPreSheaf( Source( alpha_1 ) );
    deduped_92_1 := deduped_98_1[2];
    deduped_91_1 := deduped_94_1[2];
    deduped_90_1 := deduped_93_1[2];
    deduped_89_1 := deduped_94_1[1];
    deduped_88_1 := [ 1 .. Length( deduped_100_1 ) ];
    deduped_87_1 := [ 0 .. deduped_96_1[2] - 1 ];
    deduped_86_1 := [ 0 .. deduped_96_1[1] - 1 ];
    deduped_85_1 := [ 0 .. deduped_89_1[2] - 1 ];
    deduped_35_1 := List( deduped_99_1[1], Length );
    deduped_34_1 := List( deduped_98_1[1], Length );
    deduped_2_1 := [ 0 .. deduped_89_1[1] - 1 ];
    deduped_84_1 := Concatenation( List( deduped_86_1, function ( i_2 )
              return ListWithIdenticalEntries( deduped_34_1[1 + i_2], deduped_35_1[SafeUniquePosition( deduped_2_1, i_2 )] );
          end ) );
    deduped_1_1 := List( deduped_93_1[1], Length );
    deduped_83_1 := Sum( List( deduped_86_1, function ( i_2 )
              return deduped_1_1[1 + i_2];
          end ) );
    deduped_82_1 := Concatenation( List( deduped_86_1, function ( i_2 )
              return ListWithIdenticalEntries( deduped_1_1[1 + i_2], deduped_35_1[SafeUniquePosition( deduped_2_1, i_2 )] );
          end ) );
    deduped_3_1 := List( deduped_95_1[1], Length );
    deduped_81_1 := Concatenation( List( deduped_86_1, function ( i_2 )
              return ListWithIdenticalEntries( deduped_1_1[1 + i_2], deduped_3_1[SafeUniquePosition( deduped_2_1, i_2 )] );
          end ) );
    deduped_80_1 := Product( deduped_84_1 );
    deduped_79_1 := Product( deduped_81_1 );
    deduped_56_1 := List( deduped_92_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    deduped_78_1 := [ 0 .. Sum( List( deduped_87_1, function ( j_2 )
                    return deduped_56_1[1 + j_2];
                end ) ) - 1 ];
    deduped_77_1 := [ 0 .. deduped_83_1 - 1 ];
    deduped_4_1 := List( deduped_90_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    deduped_76_1 := [ 0 .. Sum( List( deduped_87_1, function ( j_2 )
                    return deduped_4_1[1 + j_2];
                end ) ) - 1 ];
    deduped_75_1 := [ 0 .. deduped_80_1 - 1 ];
    deduped_74_1 := [ 0 .. Product( deduped_82_1 ) - 1 ];
    deduped_73_1 := [ 0 .. deduped_79_1 - 1 ];
    deduped_10_1 := List( deduped_86_1, function ( i_2 )
            return Sum( List( [ 1 .. i_2 ], function ( j_3 )
                      return deduped_1_1[j_3];
                  end ) );
        end );
    deduped_9_1 := deduped_96_1[3];
    hoisted_32_1 := Concatenation( List( deduped_87_1, function ( j_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + j_2;
              hoisted_1_2 := deduped_10_1[1 + deduped_9_1[deduped_2_2][2]];
              return List( [ 0 .. deduped_4_1[deduped_2_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (i_3 + hoisted_1_2);
                      hoisted_2_3 := deduped_81_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_81_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_73_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    deduped_14_1 := deduped_91_1[3];
    deduped_15_1 := List( deduped_85_1, function ( i_2 )
            return deduped_14_1[1 + i_2];
        end );
    deduped_29_1 := List( deduped_97_1, function ( i_2 )
            return deduped_15_1[1 + i_2];
        end );
    deduped_7_1 := deduped_91_1[2];
    deduped_13_1 := List( deduped_85_1, function ( i_2 )
            return deduped_7_1[1 + i_2];
        end );
    deduped_28_1 := List( deduped_97_1, function ( i_2 )
            return deduped_13_1[1 + i_2];
        end );
    deduped_19_1 := List( deduped_95_1[2], AsList );
    hoisted_17_1 := List( deduped_85_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return CreateCapCategoryMorphismWithAttributes( deduped_101_1, CreateCapCategoryObjectWithAttributes( deduped_101_1, IndexOfObject, deduped_7_1[deduped_1_2] ), CreateCapCategoryObjectWithAttributes( deduped_101_1, IndexOfObject, deduped_14_1[deduped_1_2] ), IndexOfMorphism, i_2 );
        end );
    deduped_18_1 := List( deduped_97_1, function ( i_2 )
            return hoisted_17_1[1 + i_2];
        end );
    deduped_12_1 := deduped_91_1[1];
    hoisted_31_1 := Concatenation( List( deduped_87_1, function ( j_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2;
              deduped_10_2 := 1 + j_2;
              deduped_9_2 := deduped_4_1[deduped_10_2];
              deduped_8_2 := deduped_97_1[deduped_10_2];
              deduped_7_2 := deduped_29_1[deduped_10_2];
              deduped_6_2 := deduped_28_1[deduped_10_2];
              deduped_5_2 := deduped_12_1[1 + deduped_6_2];
              deduped_4_2 := 1 + deduped_5_2;
              if IdFunc( function (  )
                          if deduped_6_2 = deduped_13_1[deduped_4_2] and deduped_7_2 = deduped_15_1[deduped_4_2] then
                              return deduped_8_2 = deduped_5_2;
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return ListWithIdenticalEntries( deduped_9_2, [ 0 .. deduped_3_1[SafeUniquePosition( deduped_2_1, deduped_6_2 )] - 1 ] );
              else
                  return ListWithIdenticalEntries( deduped_9_2, deduped_19_1[SafeUniquePositionProperty( deduped_18_1, function ( mor_3 )
                             if IndexOfObject( Source( mor_3 ) ) = deduped_6_2 and IndexOfObject( Range( mor_3 ) ) = deduped_7_2 then
                                 return IndexOfMorphism( mor_3 ) = deduped_8_2;
                             else
                                 return false;
                             fi;
                             return;
                         end )] );
              fi;
              return;
          end ) );
    deduped_6_1 := Concatenation( List( deduped_87_1, function ( j_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_4_1[1 + j_2] - 1 ] ), deduped_79_1 );
          end ) );
    hoisted_33_1 := List( deduped_76_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_31_1[deduped_3_2];
            hoisted_1_2 := hoisted_32_1[deduped_3_2];
            return List( [ 0 .. deduped_6_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_11_1 := Concatenation( List( deduped_86_1, function ( i_2 )
              return ListWithIdenticalEntries( deduped_1_1[1 + i_2], i_2 );
          end ) );
    deduped_8_1 := List( deduped_90_1, AsList );
    hoisted_25_1 := Concatenation( List( deduped_87_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_10_1[1 + deduped_9_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_8_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( i_3 )
                      return deduped_3_1[SafeUniquePosition( deduped_2_1, deduped_11_1[1 + (hoisted_1_2[1 + i_3] + hoisted_2_2)] )];
                  end );
          end ) );
    deduped_26_1 := List( deduped_76_1, function ( j_2 )
            return Product( hoisted_25_1{[ 1 .. j_2 ]} );
        end );
    hoisted_23_1 := Concatenation( List( deduped_87_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_10_1[1 + deduped_9_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_8_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (hoisted_1_2[1 + i_3] + hoisted_2_2);
                      hoisted_2_3 := deduped_81_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_81_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_73_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_20_1 := Concatenation( List( deduped_87_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_10_1[1 + deduped_9_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_8_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( i_3 )
                      local deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3, deduped_8_3, deduped_9_3;
                      deduped_9_3 := deduped_12_1[1 + deduped_11_1[(1 + (hoisted_1_2[1 + i_3] + hoisted_2_2))]];
                      deduped_8_3 := 1 + deduped_9_3;
                      deduped_7_3 := deduped_15_1[deduped_8_3];
                      deduped_6_3 := deduped_13_1[deduped_8_3];
                      deduped_5_3 := deduped_12_1[1 + deduped_6_3];
                      deduped_4_3 := 1 + deduped_5_3;
                      if IdFunc( function (  )
                                  if deduped_6_3 = deduped_13_1[deduped_4_3] and deduped_7_3 = deduped_15_1[deduped_4_3] then
                                      return deduped_9_3 = deduped_5_3;
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_3_1[SafeUniquePosition( deduped_2_1, deduped_6_3 )] - 1 ];
                      else
                          return deduped_19_1[SafeUniquePositionProperty( deduped_18_1, function ( mor_4 )
                                   if IndexOfObject( Source( mor_4 ) ) = deduped_6_3 and IndexOfObject( Range( mor_4 ) ) = deduped_7_3 then
                                       return IndexOfMorphism( mor_4 ) = deduped_9_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_24_1 := List( deduped_76_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_20_1[deduped_3_2];
            hoisted_1_2 := hoisted_23_1[deduped_3_2];
            return List( [ 0 .. deduped_6_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_72_1 := Filtered( deduped_73_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_76_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_24_1[deduped_1_3][deduped_1_2] * deduped_26_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_76_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_33_1[deduped_1_3][deduped_1_2] * deduped_26_1[deduped_1_3];
                    end ) );
        end );
    hoisted_41_1 := List( deduped_77_1, function ( j_2 )
            return Product( deduped_81_1{[ 1 .. j_2 ]} );
        end );
    hoisted_36_1 := List( ValuesOnAllObjects( beta_1 ), AsList );
    hoisted_37_1 := Concatenation( List( deduped_86_1, function ( i_2 )
              return ListWithIdenticalEntries( deduped_1_1[1 + i_2], hoisted_36_1[SafeUniquePosition( deduped_2_1, i_2 )] );
          end ) );
    hoisted_40_1 := List( [ 1 .. deduped_83_1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_37_1[i_2];
            hoisted_2_2 := deduped_82_1[i_2];
            hoisted_1_2 := Product( deduped_82_1{[ 1 .. i_2 - 1 ]} );
            return List( deduped_74_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    hoisted_55_1 := List( deduped_74_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_77_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_40_1[deduped_1_3][hoisted_1_2] * hoisted_41_1[deduped_1_3];
                end );
        end );
    hoisted_54_1 := List( deduped_77_1, function ( j_2 )
            return Product( deduped_82_1{[ 1 .. j_2 ]} );
        end );
    deduped_48_1 := List( deduped_100_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_43_1 := List( deduped_100_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_52_1 := Concatenation( List( deduped_88_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := Sum( deduped_48_1{[ 1 .. i_2 - 1 ]} );
              hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_48_1[i_2] - 1 ];
              hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( AsList( CAP_JIT_INCOMPLETE_LOGIC( deduped_100_1[i_2] ) ) );
              return List( [ 0 .. deduped_43_1[i_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + hoisted_2_2[(1 + hoisted_1_2[(1 + i_3)])];
                      hoisted_2_3 := deduped_84_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_84_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_75_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    deduped_46_1 := List( deduped_99_1[2], AsList );
    hoisted_47_1 := Concatenation( List( deduped_86_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2, deduped_11_2;
              deduped_11_2 := 1 + i_2;
              deduped_10_2 := deduped_1_1[deduped_11_2];
              deduped_9_2 := deduped_12_1[deduped_11_2];
              deduped_8_2 := 1 + deduped_9_2;
              deduped_7_2 := deduped_15_1[deduped_8_2];
              deduped_6_2 := deduped_13_1[deduped_8_2];
              deduped_5_2 := deduped_12_1[1 + deduped_6_2];
              deduped_4_2 := 1 + deduped_5_2;
              if IdFunc( function (  )
                          if deduped_6_2 = deduped_13_1[deduped_4_2] and deduped_7_2 = deduped_15_1[deduped_4_2] then
                              return deduped_9_2 = deduped_5_2;
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return ListWithIdenticalEntries( deduped_10_2, [ 0 .. deduped_35_1[SafeUniquePosition( deduped_2_1, deduped_6_2 )] - 1 ] );
              else
                  return ListWithIdenticalEntries( deduped_10_2, deduped_46_1[SafeUniquePositionProperty( deduped_18_1, function ( mor_3 )
                             if IndexOfObject( Source( mor_3 ) ) = deduped_6_2 and IndexOfObject( Range( mor_3 ) ) = deduped_7_2 then
                                 return IndexOfMorphism( mor_3 ) = deduped_9_2;
                             else
                                 return false;
                             fi;
                             return;
                         end )] );
              fi;
              return;
          end ) );
    hoisted_45_1 := Concatenation( List( deduped_88_1, function ( i_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_43_1[i_2] - 1 ] ), deduped_80_1 );
          end ) );
    hoisted_53_1 := List( [ 0 .. Sum( List( deduped_88_1, function ( i_2 )
                      return Length( [ 0 .. deduped_43_1[i_2] - 1 ] );
                  end ) ) - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_47_1[deduped_3_2];
            hoisted_1_2 := hoisted_52_1[deduped_3_2];
            return List( [ 0 .. hoisted_45_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_71_1 := List( deduped_75_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return hoisted_55_1[1 + Sum( deduped_77_1, function ( j_3 )
                       local deduped_1_3;
                       deduped_1_3 := (1 + j_3);
                       return hoisted_53_1[deduped_1_3][hoisted_1_2] * hoisted_54_1[deduped_1_3];
                   end )];
        end );
    deduped_59_1 := List( deduped_86_1, function ( i_2 )
            return Sum( List( [ 1 .. i_2 ], function ( j_3 )
                      return deduped_34_1[j_3];
                  end ) );
        end );
    hoisted_68_1 := Concatenation( List( deduped_87_1, function ( j_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + j_2;
              hoisted_1_2 := deduped_59_1[1 + deduped_9_1[deduped_2_2][2]];
              return List( [ 0 .. deduped_56_1[deduped_2_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (i_3 + hoisted_1_2);
                      hoisted_2_3 := deduped_84_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_84_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_75_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_67_1 := Concatenation( List( deduped_87_1, function ( j_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2;
              deduped_10_2 := 1 + j_2;
              deduped_9_2 := deduped_56_1[deduped_10_2];
              deduped_8_2 := deduped_97_1[deduped_10_2];
              deduped_7_2 := deduped_29_1[deduped_10_2];
              deduped_6_2 := deduped_28_1[deduped_10_2];
              deduped_5_2 := deduped_12_1[1 + deduped_6_2];
              deduped_4_2 := 1 + deduped_5_2;
              if IdFunc( function (  )
                          if deduped_6_2 = deduped_13_1[deduped_4_2] and deduped_7_2 = deduped_15_1[deduped_4_2] then
                              return deduped_8_2 = deduped_5_2;
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return ListWithIdenticalEntries( deduped_9_2, [ 0 .. deduped_35_1[SafeUniquePosition( deduped_2_1, deduped_6_2 )] - 1 ] );
              else
                  return ListWithIdenticalEntries( deduped_9_2, deduped_46_1[SafeUniquePositionProperty( deduped_18_1, function ( mor_3 )
                             if IndexOfObject( Source( mor_3 ) ) = deduped_6_2 and IndexOfObject( Range( mor_3 ) ) = deduped_7_2 then
                                 return IndexOfMorphism( mor_3 ) = deduped_8_2;
                             else
                                 return false;
                             fi;
                             return;
                         end )] );
              fi;
              return;
          end ) );
    deduped_57_1 := Concatenation( List( deduped_87_1, function ( j_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_56_1[1 + j_2] - 1 ] ), deduped_80_1 );
          end ) );
    hoisted_69_1 := List( deduped_78_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_67_1[deduped_3_2];
            hoisted_1_2 := hoisted_68_1[deduped_3_2];
            return List( [ 0 .. deduped_57_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_60_1 := Concatenation( List( deduped_86_1, function ( i_2 )
              return ListWithIdenticalEntries( deduped_34_1[1 + i_2], i_2 );
          end ) );
    deduped_58_1 := List( deduped_92_1, AsList );
    hoisted_64_1 := Concatenation( List( deduped_87_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_59_1[1 + deduped_9_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_58_1[deduped_3_2];
              return List( [ 0 .. deduped_56_1[deduped_3_2] - 1 ], function ( i_3 )
                      return deduped_35_1[SafeUniquePosition( deduped_2_1, deduped_60_1[1 + (hoisted_1_2[1 + i_3] + hoisted_2_2)] )];
                  end );
          end ) );
    deduped_65_1 := List( deduped_78_1, function ( j_2 )
            return Product( hoisted_64_1{[ 1 .. j_2 ]} );
        end );
    hoisted_62_1 := Concatenation( List( deduped_87_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_59_1[1 + deduped_9_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_58_1[deduped_3_2];
              return List( [ 0 .. deduped_56_1[deduped_3_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (hoisted_1_2[1 + i_3] + hoisted_2_2);
                      hoisted_2_3 := deduped_84_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_84_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_75_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_61_1 := Concatenation( List( deduped_87_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_59_1[1 + deduped_9_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_58_1[deduped_3_2];
              return List( [ 0 .. deduped_56_1[deduped_3_2] - 1 ], function ( i_3 )
                      local deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3, deduped_8_3, deduped_9_3;
                      deduped_9_3 := deduped_12_1[1 + deduped_60_1[(1 + (hoisted_1_2[1 + i_3] + hoisted_2_2))]];
                      deduped_8_3 := 1 + deduped_9_3;
                      deduped_7_3 := deduped_15_1[deduped_8_3];
                      deduped_6_3 := deduped_13_1[deduped_8_3];
                      deduped_5_3 := deduped_12_1[1 + deduped_6_3];
                      deduped_4_3 := 1 + deduped_5_3;
                      if IdFunc( function (  )
                                  if deduped_6_3 = deduped_13_1[deduped_4_3] and deduped_7_3 = deduped_15_1[deduped_4_3] then
                                      return deduped_9_3 = deduped_5_3;
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_35_1[SafeUniquePosition( deduped_2_1, deduped_6_3 )] - 1 ];
                      else
                          return deduped_46_1[SafeUniquePositionProperty( deduped_18_1, function ( mor_4 )
                                   if IndexOfObject( Source( mor_4 ) ) = deduped_6_3 and IndexOfObject( Range( mor_4 ) ) = deduped_7_3 then
                                       return IndexOfMorphism( mor_4 ) = deduped_9_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_63_1 := List( deduped_78_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_61_1[deduped_3_2];
            hoisted_1_2 := hoisted_62_1[deduped_3_2];
            return List( [ 0 .. deduped_57_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_70_1 := Filtered( deduped_75_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_78_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_63_1[deduped_1_3][deduped_1_2] * deduped_65_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_78_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_69_1[deduped_1_3][deduped_1_2] * deduped_65_1[deduped_1_3];
                    end ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( Range( cat_1 ), source_1, range_1, AsList, List( [ 0 .. Length( source_1 ) - 1 ], function ( x_2 )
              return -1 + BigInt( SafePosition( hoisted_72_1, CAP_JIT_INCOMPLETE_LOGIC( hoisted_71_1[(1 + hoisted_70_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))])] ) ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, hoisted_20_1, deduped_21_1, deduped_22_1, hoisted_23_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, deduped_29_1, hoisted_31_1, hoisted_32_1, hoisted_34_1, hoisted_35_1, hoisted_36_1, deduped_37_1, hoisted_38_1, hoisted_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1;
    deduped_60_1 := ValuesOfPreSheaf( range_1 );
    deduped_59_1 := ValuesOfPreSheaf( source_1 );
    deduped_58_1 := Source( cat_1 );
    deduped_57_1 := IndicesOfGeneratingMorphisms( deduped_58_1 );
    deduped_56_1 := deduped_59_1[2];
    deduped_55_1 := DataTables( deduped_58_1 );
    deduped_54_1 := deduped_60_1[1];
    deduped_53_1 := deduped_59_1[1];
    deduped_52_1 := DefiningTripleOfUnderlyingQuiver( deduped_58_1 );
    deduped_51_1 := deduped_55_1[2];
    deduped_50_1 := deduped_55_1[1];
    deduped_49_1 := ListOfValues( deduped_53_1 );
    deduped_48_1 := deduped_52_1[1];
    deduped_47_1 := [ 1 .. deduped_48_1 ];
    deduped_46_1 := [ 0 .. deduped_52_1[2] - 1 ];
    deduped_45_1 := [ 0 .. deduped_48_1 - 1 ];
    deduped_44_1 := [ 0 .. deduped_50_1[2] - 1 ];
    deduped_6_1 := List( deduped_54_1, Length );
    deduped_5_1 := [ 0 .. deduped_50_1[1] - 1 ];
    deduped_4_1 := List( deduped_53_1, Length );
    deduped_43_1 := Concatenation( List( deduped_45_1, function ( i_2 )
              return ListWithIdenticalEntries( deduped_4_1[1 + i_2], deduped_6_1[SafeUniquePosition( deduped_5_1, i_2 )] );
          end ) );
    deduped_42_1 := Product( deduped_43_1 );
    deduped_7_1 := List( deduped_56_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    deduped_41_1 := [ 0 .. Sum( List( deduped_46_1, function ( j_2 )
                    return deduped_7_1[1 + j_2];
                end ) ) - 1 ];
    deduped_40_1 := [ 0 .. deduped_42_1 - 1 ];
    hoisted_39_1 := Range( cat_1 );
    deduped_13_1 := List( deduped_45_1, function ( i_2 )
            return Sum( List( [ 1 .. i_2 ], function ( j_3 )
                      return deduped_4_1[j_3];
                  end ) );
        end );
    deduped_12_1 := deduped_52_1[3];
    hoisted_35_1 := Concatenation( List( deduped_46_1, function ( j_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + j_2;
              hoisted_1_2 := deduped_13_1[1 + deduped_12_1[deduped_2_2][2]];
              return List( [ 0 .. deduped_7_1[deduped_2_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (i_3 + hoisted_1_2);
                      hoisted_2_3 := deduped_43_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_43_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_40_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    deduped_17_1 := deduped_51_1[3];
    deduped_18_1 := List( deduped_44_1, function ( i_2 )
            return deduped_17_1[1 + i_2];
        end );
    hoisted_32_1 := List( deduped_57_1, function ( i_2 )
            return deduped_18_1[1 + i_2];
        end );
    deduped_10_1 := deduped_51_1[2];
    deduped_16_1 := List( deduped_44_1, function ( i_2 )
            return deduped_10_1[1 + i_2];
        end );
    hoisted_31_1 := List( deduped_57_1, function ( i_2 )
            return deduped_16_1[1 + i_2];
        end );
    deduped_22_1 := List( deduped_60_1[2], AsList );
    hoisted_20_1 := List( deduped_44_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return CreateCapCategoryMorphismWithAttributes( deduped_58_1, CreateCapCategoryObjectWithAttributes( deduped_58_1, IndexOfObject, deduped_10_1[deduped_1_2] ), CreateCapCategoryObjectWithAttributes( deduped_58_1, IndexOfObject, deduped_17_1[deduped_1_2] ), IndexOfMorphism, i_2 );
        end );
    deduped_21_1 := List( deduped_57_1, function ( i_2 )
            return hoisted_20_1[1 + i_2];
        end );
    deduped_15_1 := deduped_51_1[1];
    hoisted_34_1 := Concatenation( List( deduped_46_1, function ( j_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2;
              deduped_10_2 := 1 + j_2;
              deduped_9_2 := deduped_7_1[deduped_10_2];
              deduped_8_2 := deduped_57_1[deduped_10_2];
              deduped_7_2 := hoisted_32_1[deduped_10_2];
              deduped_6_2 := hoisted_31_1[deduped_10_2];
              deduped_5_2 := deduped_15_1[1 + deduped_6_2];
              deduped_4_2 := 1 + deduped_5_2;
              if IdFunc( function (  )
                          if deduped_6_2 = deduped_16_1[deduped_4_2] and deduped_7_2 = deduped_18_1[deduped_4_2] then
                              return deduped_8_2 = deduped_5_2;
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return ListWithIdenticalEntries( deduped_9_2, [ 0 .. deduped_6_1[SafeUniquePosition( deduped_5_1, deduped_6_2 )] - 1 ] );
              else
                  return ListWithIdenticalEntries( deduped_9_2, deduped_22_1[SafeUniquePositionProperty( deduped_21_1, function ( mor_3 )
                             if IndexOfObject( Source( mor_3 ) ) = deduped_6_2 and IndexOfObject( Range( mor_3 ) ) = deduped_7_2 then
                                 return IndexOfMorphism( mor_3 ) = deduped_8_2;
                             else
                                 return false;
                             fi;
                             return;
                         end )] );
              fi;
              return;
          end ) );
    deduped_9_1 := Concatenation( List( deduped_46_1, function ( j_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_7_1[1 + j_2] - 1 ] ), deduped_42_1 );
          end ) );
    hoisted_36_1 := List( deduped_41_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_34_1[deduped_3_2];
            hoisted_1_2 := hoisted_35_1[deduped_3_2];
            return List( [ 0 .. deduped_9_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_14_1 := Concatenation( List( deduped_45_1, function ( i_2 )
              return ListWithIdenticalEntries( deduped_4_1[1 + i_2], i_2 );
          end ) );
    deduped_11_1 := List( deduped_56_1, AsList );
    hoisted_28_1 := Concatenation( List( deduped_46_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_13_1[1 + deduped_12_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_11_1[deduped_3_2];
              return List( [ 0 .. deduped_7_1[deduped_3_2] - 1 ], function ( i_3 )
                      return deduped_6_1[SafeUniquePosition( deduped_5_1, deduped_14_1[1 + (hoisted_1_2[1 + i_3] + hoisted_2_2)] )];
                  end );
          end ) );
    deduped_29_1 := List( deduped_41_1, function ( j_2 )
            return Product( hoisted_28_1{[ 1 .. j_2 ]} );
        end );
    hoisted_26_1 := Concatenation( List( deduped_46_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_13_1[1 + deduped_12_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_11_1[deduped_3_2];
              return List( [ 0 .. deduped_7_1[deduped_3_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (hoisted_1_2[1 + i_3] + hoisted_2_2);
                      hoisted_2_3 := deduped_43_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_43_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_40_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_23_1 := Concatenation( List( deduped_46_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_13_1[1 + deduped_12_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_11_1[deduped_3_2];
              return List( [ 0 .. deduped_7_1[deduped_3_2] - 1 ], function ( i_3 )
                      local deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3, deduped_8_3, deduped_9_3;
                      deduped_9_3 := deduped_15_1[1 + deduped_14_1[(1 + (hoisted_1_2[1 + i_3] + hoisted_2_2))]];
                      deduped_8_3 := 1 + deduped_9_3;
                      deduped_7_3 := deduped_18_1[deduped_8_3];
                      deduped_6_3 := deduped_16_1[deduped_8_3];
                      deduped_5_3 := deduped_15_1[1 + deduped_6_3];
                      deduped_4_3 := 1 + deduped_5_3;
                      if IdFunc( function (  )
                                  if deduped_6_3 = deduped_16_1[deduped_4_3] and deduped_7_3 = deduped_18_1[deduped_4_3] then
                                      return deduped_9_3 = deduped_5_3;
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_6_1[SafeUniquePosition( deduped_5_1, deduped_6_3 )] - 1 ];
                      else
                          return deduped_22_1[SafeUniquePositionProperty( deduped_21_1, function ( mor_4 )
                                   if IndexOfObject( Source( mor_4 ) ) = deduped_6_3 and IndexOfObject( Range( mor_4 ) ) = deduped_7_3 then
                                       return IndexOfMorphism( mor_4 ) = deduped_9_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_27_1 := List( deduped_41_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_23_1[deduped_3_2];
            hoisted_1_2 := hoisted_26_1[deduped_3_2];
            return List( [ 0 .. deduped_9_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_38_1 := CAP_JIT_INCOMPLETE_LOGIC( Filtered( deduped_40_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_41_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_27_1[deduped_1_3][deduped_1_2] * deduped_29_1[deduped_1_3];
                        end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_41_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_36_1[deduped_1_3][deduped_1_2] * deduped_29_1[deduped_1_3];
                        end ) );
            end )[1 + AsList( alpha_1 )[(1 + CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. (Length( Source( alpha_1 ) ) - 1) ][1] ))]] );
    deduped_3_1 := List( deduped_49_1, Length );
    deduped_37_1 := List( deduped_47_1, function ( i_2 )
            return Product( deduped_43_1{[ 1 + Sum( deduped_3_1{[ 1 .. (i_2 - 1) ]} ) .. Sum( deduped_3_1{[ 1 .. i_2 ]} ) ]} );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, ValuesOnAllObjects, List( deduped_47_1, function ( i_2 )
              local deduped_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
              hoisted_2_2 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( hoisted_38_1, Product( deduped_37_1{[ 1 .. deduped_3_2 - 1 ]} ) ), deduped_37_1[deduped_3_2] ) );
              deduped_1_2 := deduped_6_1[i_2];
              return CreateCapCategoryMorphismWithAttributes( hoisted_39_1, deduped_49_1[i_2], deduped_54_1[i_2], AsList, List( [ 0 .. deduped_3_1[i_2] - 1 ], function ( i_3 )
                        return REM_INT( QUO_INT( hoisted_2_2, deduped_1_2 ^ i_3 ), deduped_1_2 );
                    end ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, hoisted_17_1, deduped_18_1, deduped_19_1, hoisted_20_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, deduped_26_1, hoisted_28_1, hoisted_29_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, deduped_36_1, deduped_37_1, hoisted_38_1, hoisted_41_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1;
    deduped_65_1 := ValuesOfPreSheaf( arg3_1 );
    deduped_64_1 := ValuesOfPreSheaf( arg2_1 );
    deduped_63_1 := Source( cat_1 );
    deduped_62_1 := IndicesOfGeneratingMorphisms( deduped_63_1 );
    deduped_61_1 := deduped_64_1[2];
    deduped_60_1 := deduped_65_1[1];
    deduped_59_1 := DataTables( deduped_63_1 );
    deduped_58_1 := deduped_64_1[1];
    deduped_57_1 := DefiningTripleOfUnderlyingQuiver( deduped_63_1 );
    deduped_56_1 := ListOfValues( deduped_58_1 );
    deduped_55_1 := deduped_59_1[2];
    deduped_54_1 := deduped_59_1[1];
    deduped_53_1 := deduped_57_1[1];
    deduped_52_1 := [ 1 .. deduped_53_1 ];
    deduped_51_1 := [ 0 .. deduped_57_1[2] - 1 ];
    deduped_50_1 := [ 0 .. deduped_53_1 - 1 ];
    deduped_49_1 := [ 0 .. deduped_54_1[2] - 1 ];
    deduped_3_1 := List( deduped_60_1, Length );
    deduped_2_1 := [ 0 .. deduped_54_1[1] - 1 ];
    deduped_1_1 := List( deduped_58_1, Length );
    deduped_48_1 := Concatenation( List( deduped_50_1, function ( i_2 )
              return ListWithIdenticalEntries( deduped_1_1[1 + i_2], deduped_3_1[SafeUniquePosition( deduped_2_1, i_2 )] );
          end ) );
    deduped_47_1 := Product( deduped_48_1 );
    deduped_4_1 := List( deduped_61_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    deduped_46_1 := [ 0 .. Sum( List( deduped_51_1, function ( j_2 )
                    return deduped_4_1[1 + j_2];
                end ) ) - 1 ];
    deduped_45_1 := [ 0 .. deduped_47_1 - 1 ];
    deduped_10_1 := List( deduped_50_1, function ( i_2 )
            return Sum( List( [ 1 .. i_2 ], function ( j_3 )
                      return deduped_1_1[j_3];
                  end ) );
        end );
    deduped_9_1 := deduped_57_1[3];
    hoisted_32_1 := Concatenation( List( deduped_51_1, function ( j_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + j_2;
              hoisted_1_2 := deduped_10_1[1 + deduped_9_1[deduped_2_2][2]];
              return List( [ 0 .. deduped_4_1[deduped_2_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (i_3 + hoisted_1_2);
                      hoisted_2_3 := deduped_48_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_48_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_45_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    deduped_14_1 := deduped_55_1[3];
    deduped_15_1 := List( deduped_49_1, function ( i_2 )
            return deduped_14_1[1 + i_2];
        end );
    hoisted_29_1 := List( deduped_62_1, function ( i_2 )
            return deduped_15_1[1 + i_2];
        end );
    deduped_7_1 := deduped_55_1[2];
    deduped_13_1 := List( deduped_49_1, function ( i_2 )
            return deduped_7_1[1 + i_2];
        end );
    hoisted_28_1 := List( deduped_62_1, function ( i_2 )
            return deduped_13_1[1 + i_2];
        end );
    deduped_19_1 := List( deduped_65_1[2], AsList );
    hoisted_17_1 := List( deduped_49_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return CreateCapCategoryMorphismWithAttributes( deduped_63_1, CreateCapCategoryObjectWithAttributes( deduped_63_1, IndexOfObject, deduped_7_1[deduped_1_2] ), CreateCapCategoryObjectWithAttributes( deduped_63_1, IndexOfObject, deduped_14_1[deduped_1_2] ), IndexOfMorphism, i_2 );
        end );
    deduped_18_1 := List( deduped_62_1, function ( i_2 )
            return hoisted_17_1[1 + i_2];
        end );
    deduped_12_1 := deduped_55_1[1];
    hoisted_31_1 := Concatenation( List( deduped_51_1, function ( j_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2;
              deduped_10_2 := 1 + j_2;
              deduped_9_2 := deduped_4_1[deduped_10_2];
              deduped_8_2 := deduped_62_1[deduped_10_2];
              deduped_7_2 := hoisted_29_1[deduped_10_2];
              deduped_6_2 := hoisted_28_1[deduped_10_2];
              deduped_5_2 := deduped_12_1[1 + deduped_6_2];
              deduped_4_2 := 1 + deduped_5_2;
              if IdFunc( function (  )
                          if deduped_6_2 = deduped_13_1[deduped_4_2] and deduped_7_2 = deduped_15_1[deduped_4_2] then
                              return deduped_8_2 = deduped_5_2;
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return ListWithIdenticalEntries( deduped_9_2, [ 0 .. deduped_3_1[SafeUniquePosition( deduped_2_1, deduped_6_2 )] - 1 ] );
              else
                  return ListWithIdenticalEntries( deduped_9_2, deduped_19_1[SafeUniquePositionProperty( deduped_18_1, function ( mor_3 )
                             if IndexOfObject( Source( mor_3 ) ) = deduped_6_2 and IndexOfObject( Range( mor_3 ) ) = deduped_7_2 then
                                 return IndexOfMorphism( mor_3 ) = deduped_8_2;
                             else
                                 return false;
                             fi;
                             return;
                         end )] );
              fi;
              return;
          end ) );
    deduped_6_1 := Concatenation( List( deduped_51_1, function ( j_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_4_1[1 + j_2] - 1 ] ), deduped_47_1 );
          end ) );
    hoisted_33_1 := List( deduped_46_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_31_1[deduped_3_2];
            hoisted_1_2 := hoisted_32_1[deduped_3_2];
            return List( [ 0 .. deduped_6_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_11_1 := Concatenation( List( deduped_50_1, function ( i_2 )
              return ListWithIdenticalEntries( deduped_1_1[1 + i_2], i_2 );
          end ) );
    deduped_8_1 := List( deduped_61_1, AsList );
    hoisted_25_1 := Concatenation( List( deduped_51_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_10_1[1 + deduped_9_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_8_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( i_3 )
                      return deduped_3_1[SafeUniquePosition( deduped_2_1, deduped_11_1[1 + (hoisted_1_2[1 + i_3] + hoisted_2_2)] )];
                  end );
          end ) );
    deduped_26_1 := List( deduped_46_1, function ( j_2 )
            return Product( hoisted_25_1{[ 1 .. j_2 ]} );
        end );
    hoisted_23_1 := Concatenation( List( deduped_51_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_10_1[1 + deduped_9_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_8_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (hoisted_1_2[1 + i_3] + hoisted_2_2);
                      hoisted_2_3 := deduped_48_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_48_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_45_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_20_1 := Concatenation( List( deduped_51_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_10_1[1 + deduped_9_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_8_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( i_3 )
                      local deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3, deduped_8_3, deduped_9_3;
                      deduped_9_3 := deduped_12_1[1 + deduped_11_1[(1 + (hoisted_1_2[1 + i_3] + hoisted_2_2))]];
                      deduped_8_3 := 1 + deduped_9_3;
                      deduped_7_3 := deduped_15_1[deduped_8_3];
                      deduped_6_3 := deduped_13_1[deduped_8_3];
                      deduped_5_3 := deduped_12_1[1 + deduped_6_3];
                      deduped_4_3 := 1 + deduped_5_3;
                      if IdFunc( function (  )
                                  if deduped_6_3 = deduped_13_1[deduped_4_3] and deduped_7_3 = deduped_15_1[deduped_4_3] then
                                      return deduped_9_3 = deduped_5_3;
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_3_1[SafeUniquePosition( deduped_2_1, deduped_6_3 )] - 1 ];
                      else
                          return deduped_19_1[SafeUniquePositionProperty( deduped_18_1, function ( mor_4 )
                                   if IndexOfObject( Source( mor_4 ) ) = deduped_6_3 and IndexOfObject( Range( mor_4 ) ) = deduped_7_3 then
                                       return IndexOfMorphism( mor_4 ) = deduped_9_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_24_1 := List( deduped_46_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_20_1[deduped_3_2];
            hoisted_1_2 := hoisted_23_1[deduped_3_2];
            return List( [ 0 .. deduped_6_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_44_1 := Filtered( deduped_45_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_46_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_24_1[deduped_1_3][deduped_1_2] * deduped_26_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_46_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_33_1[deduped_1_3][deduped_1_2] * deduped_26_1[deduped_1_3];
                    end ) );
        end );
    deduped_43_1 := Length( deduped_44_1 );
    hoisted_41_1 := Range( cat_1 );
    deduped_36_1 := List( deduped_56_1, Length );
    deduped_37_1 := List( deduped_52_1, function ( i_2 )
            return Product( deduped_48_1{[ 1 + Sum( deduped_36_1{[ 1 .. (i_2 - 1) ]} ) .. Sum( deduped_36_1{[ 1 .. i_2 ]} ) ]} );
        end );
    hoisted_38_1 := List( deduped_52_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := deduped_37_1[i_2];
            hoisted_1_2 := Product( deduped_37_1{[ 1 .. i_2 - 1 ]} );
            return List( deduped_45_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    return List( [ 0 .. deduped_43_1 - 1 ], function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + deduped_44_1[(1 + REM_INT( i_2, deduped_43_1 ))];
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, ValuesOnAllObjects, List( deduped_52_1, function ( i_3 )
                      local deduped_1_3, hoisted_2_3;
                      hoisted_2_3 := hoisted_38_1[i_3][hoisted_1_2];
                      deduped_1_3 := deduped_3_1[i_3];
                      return CreateCapCategoryMorphismWithAttributes( hoisted_41_1, deduped_56_1[i_3], deduped_60_1[i_3], AsList, List( [ 0 .. deduped_36_1[i_3] - 1 ], function ( i_4 )
                                return REM_INT( QUO_INT( hoisted_2_3, deduped_1_3 ^ i_4 ), deduped_1_3 );
                            end ) );
                  end ) );
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

BindGlobal( "PreSheavesOfCategoryFromDataTablesInSkeletalFinSetsPrecompiled", function ( quiver )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function ( quiver )
    local sFinSets;
    sFinSets := CategoryOfSkeletalFinSets(  : FinalizeCategory := true,
        overhead := true );
    return PreSheaves( CategoryFromDataTables( FreeCategory( quiver : range_of_HomStructure := sFinSets,
            FinalizeCategory := true ) : FinalizeCategory := true ), sFinSets );
end;
        
        
    
    cat := category_constructor( quiver : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_PreSheavesOfCategoryFromDataTablesInSkeletalFinSetsPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
