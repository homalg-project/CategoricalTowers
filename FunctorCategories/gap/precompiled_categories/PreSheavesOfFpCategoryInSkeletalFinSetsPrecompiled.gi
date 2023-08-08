# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_PreSheavesOfFpCategoryInSkeletalFinSetsPrecompiled", function ( cat )
    
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
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, hoisted_11_1, hoisted_12_1, deduped_13_1, deduped_14_1, deduped_15_1, hoisted_16_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, deduped_22_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1;
    deduped_37_1 := ValuesOfPreSheaf( arg3_1 );
    deduped_36_1 := ValuesOfPreSheaf( arg2_1 );
    deduped_35_1 := Source( cat_1 );
    deduped_34_1 := deduped_36_1[2];
    deduped_33_1 := DefiningTripleOfUnderlyingQuiver( deduped_35_1 );
    deduped_32_1 := [ 0 .. deduped_33_1[2] - 1 ];
    deduped_31_1 := [ 0 .. deduped_33_1[1] - 1 ];
    deduped_4_1 := List( deduped_34_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    deduped_30_1 := [ 0 .. Sum( List( deduped_32_1, function ( j_2 )
                    return deduped_4_1[1 + j_2];
                end ) ) - 1 ];
    deduped_3_1 := List( deduped_37_1[1], Length );
    deduped_2_1 := SetOfObjects( deduped_35_1 );
    deduped_1_1 := List( deduped_36_1[1], Length );
    deduped_29_1 := Concatenation( List( deduped_31_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return List( ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] ), function ( objB_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := UnderlyingVertex( objB_3 );
                      return deduped_3_1[SafeUniquePositionProperty( deduped_2_1, function ( obj_4 )
                               return UnderlyingVertex( obj_4 ) = hoisted_1_3;
                           end )];
                  end );
          end ) );
    deduped_28_1 := Product( deduped_29_1 );
    deduped_27_1 := [ 0 .. deduped_28_1 - 1 ];
    deduped_9_1 := List( deduped_31_1, function ( i_2 )
            return Sum( List( [ 1 .. i_2 ], function ( j_3 )
                      return deduped_1_1[j_3];
                  end ) );
        end );
    deduped_8_1 := deduped_33_1[3];
    hoisted_25_1 := Concatenation( List( deduped_32_1, function ( j_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + j_2;
              hoisted_1_2 := deduped_9_1[1 + deduped_8_1[deduped_2_2][2]];
              return List( [ 0 .. deduped_4_1[deduped_2_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (i_3 + hoisted_1_2);
                      hoisted_2_3 := deduped_29_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_29_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_27_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    deduped_15_1 := List( deduped_37_1[2], AsList );
    deduped_14_1 := SetOfGeneratingMorphisms( deduped_35_1 );
    deduped_13_1 := UnderlyingQuiverAlgebra( deduped_35_1 );
    hoisted_24_1 := Concatenation( List( deduped_32_1, function ( j_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + j_2;
              return List( ListWithIdenticalEntries( deduped_4_1[deduped_1_2], deduped_14_1[deduped_1_2] ), function ( morB_3 )
                      local deduped_4_3, deduped_5_3, deduped_6_3;
                      deduped_6_3 := UnderlyingQuiverAlgebraElement( morB_3 );
                      deduped_5_3 := UnderlyingVertex( Source( morB_3 ) );
                      deduped_4_3 := UnderlyingVertex( Range( morB_3 ) );
                      if IdFunc( function (  )
                                  if true and deduped_4_3 = deduped_5_3 then
                                      return deduped_6_3 = PathAsAlgebraElement( deduped_13_1, QuiverVertexAsIdentityPath( deduped_5_3 ) );
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_3_1[SafeUniquePositionProperty( deduped_2_1, function ( obj_4 )
                                         return (UnderlyingVertex( obj_4 ) = deduped_5_3);
                                     end )] - 1 ];
                      else
                          return deduped_15_1[SafeUniquePositionProperty( deduped_14_1, function ( mor_4 )
                                   if UnderlyingVertex( Source( mor_4 ) ) = deduped_5_3 and UnderlyingVertex( Range( mor_4 ) ) = deduped_4_3 then
                                       return UnderlyingQuiverAlgebraElement( mor_4 ) = deduped_6_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    deduped_6_1 := Concatenation( List( deduped_32_1, function ( j_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_4_1[1 + j_2] - 1 ] ), deduped_28_1 );
          end ) );
    hoisted_26_1 := List( deduped_30_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_24_1[deduped_3_2];
            hoisted_1_2 := hoisted_25_1[deduped_3_2];
            return List( [ 0 .. deduped_6_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_10_1 := Concatenation( List( deduped_31_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return List( ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] ), UnderlyingVertex );
          end ) );
    deduped_7_1 := List( deduped_34_1, AsList );
    hoisted_21_1 := Concatenation( List( deduped_32_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_9_1[1 + deduped_8_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_7_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := deduped_10_1[1 + (hoisted_1_2[1 + i_3] + hoisted_2_2)];
                      return deduped_3_1[SafeUniquePositionProperty( deduped_2_1, function ( obj_4 )
                               return UnderlyingVertex( obj_4 ) = hoisted_1_3;
                           end )];
                  end );
          end ) );
    deduped_22_1 := List( deduped_30_1, function ( j_2 )
            return Product( hoisted_21_1{[ 1 .. j_2 ]} );
        end );
    hoisted_19_1 := Concatenation( List( deduped_32_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_9_1[1 + deduped_8_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_7_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (hoisted_1_2[1 + i_3] + hoisted_2_2);
                      hoisted_2_3 := deduped_29_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_29_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_27_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_12_1 := Concatenation( List( deduped_31_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return List( ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] ), function ( logic_new_func_x_3 )
                      return QuiverVertexAsIdentityPath( UnderlyingVertex( logic_new_func_x_3 ) );
                  end );
          end ) );
    if true and true then
        hoisted_11_1 := true;
    else
        hoisted_11_1 := false;
    fi;
    hoisted_16_1 := Concatenation( List( deduped_32_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_9_1[1 + deduped_8_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_7_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( i_3 )
                      local deduped_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (hoisted_1_2[1 + i_3] + hoisted_2_2);
                      deduped_1_3 := deduped_10_1[deduped_3_3];
                      if hoisted_11_1 then
                          return [ 0 .. deduped_3_1[SafeUniquePositionProperty( deduped_2_1, function ( obj_4 )
                                         return (UnderlyingVertex( obj_4 ) = deduped_1_3);
                                     end )] - 1 ];
                      else
                          hoisted_2_3 := PathAsAlgebraElement( deduped_13_1, hoisted_12_1[deduped_3_3] );
                          return deduped_15_1[SafeUniquePositionProperty( deduped_14_1, function ( mor_4 )
                                   if UnderlyingVertex( Source( mor_4 ) ) = deduped_1_3 and UnderlyingVertex( Range( mor_4 ) ) = deduped_1_3 then
                                       return UnderlyingQuiverAlgebraElement( mor_4 ) = hoisted_2_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_20_1 := List( deduped_30_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_16_1[deduped_3_2];
            hoisted_1_2 := hoisted_19_1[deduped_3_2];
            return List( [ 0 .. deduped_6_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( Range( cat_1 ), Length, Length( Filtered( deduped_27_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_30_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_20_1[deduped_1_3][deduped_1_2] * deduped_22_1[deduped_1_3];
                        end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_30_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_26_1[deduped_1_3][deduped_1_2] * deduped_22_1[deduped_1_3];
                        end ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddHomomorphismStructureOnMorphismsWithGivenObjects( cat,
        
########
function ( cat_1, source_1, alpha_1, beta_1, range_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, hoisted_12_1, deduped_13_1, deduped_14_1, deduped_15_1, hoisted_16_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, deduped_22_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, deduped_27_1, deduped_28_1, hoisted_29_1, hoisted_30_1, hoisted_33_1, hoisted_34_1, deduped_36_1, hoisted_38_1, deduped_39_1, hoisted_40_1, deduped_41_1, hoisted_45_1, hoisted_46_1, hoisted_47_1, hoisted_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, hoisted_54_1, hoisted_55_1, hoisted_56_1, hoisted_57_1, hoisted_58_1, deduped_59_1, hoisted_61_1, hoisted_62_1, hoisted_63_1, hoisted_64_1, hoisted_65_1, hoisted_66_1, deduped_67_1, deduped_68_1, deduped_69_1, deduped_70_1, deduped_71_1, deduped_72_1, deduped_73_1, deduped_74_1, deduped_75_1, deduped_76_1, deduped_77_1, deduped_78_1, deduped_79_1, deduped_80_1, deduped_81_1, deduped_82_1, deduped_83_1, deduped_84_1, deduped_85_1, deduped_86_1, deduped_87_1, deduped_88_1, deduped_89_1, deduped_90_1;
    deduped_90_1 := Source( cat_1 );
    deduped_89_1 := ListOfValues( ValuesOnAllObjects( alpha_1 ) );
    deduped_88_1 := ValuesOfPreSheaf( Source( beta_1 ) );
    deduped_87_1 := ValuesOfPreSheaf( Range( alpha_1 ) );
    deduped_86_1 := DefiningTripleOfUnderlyingQuiver( deduped_90_1 );
    deduped_85_1 := ValuesOfPreSheaf( Range( beta_1 ) );
    deduped_84_1 := ValuesOfPreSheaf( Source( alpha_1 ) );
    deduped_83_1 := deduped_87_1[2];
    deduped_82_1 := deduped_84_1[2];
    deduped_81_1 := [ 1 .. Length( deduped_89_1 ) ];
    deduped_80_1 := [ 0 .. deduped_86_1[2] - 1 ];
    deduped_79_1 := [ 0 .. deduped_86_1[1] - 1 ];
    deduped_1_1 := List( deduped_84_1[1], Length );
    deduped_78_1 := Sum( List( deduped_79_1, function ( i_2 )
              return deduped_1_1[1 + i_2];
          end ) );
    deduped_49_1 := List( deduped_83_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    deduped_77_1 := [ 0 .. Sum( List( deduped_80_1, function ( j_2 )
                    return deduped_49_1[1 + j_2];
                end ) ) - 1 ];
    deduped_76_1 := [ 0 .. deduped_78_1 - 1 ];
    deduped_4_1 := List( deduped_82_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    deduped_75_1 := [ 0 .. Sum( List( deduped_80_1, function ( j_2 )
                    return deduped_4_1[1 + j_2];
                end ) ) - 1 ];
    deduped_28_1 := List( deduped_88_1[1], Length );
    deduped_27_1 := List( deduped_87_1[1], Length );
    deduped_2_1 := SetOfObjects( deduped_90_1 );
    deduped_74_1 := Concatenation( List( deduped_79_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return List( ListWithIdenticalEntries( deduped_27_1[deduped_1_2], deduped_2_1[deduped_1_2] ), function ( objB_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := UnderlyingVertex( objB_3 );
                      return deduped_28_1[SafeUniquePositionProperty( deduped_2_1, function ( obj_4 )
                               return UnderlyingVertex( obj_4 ) = hoisted_1_3;
                           end )];
                  end );
          end ) );
    deduped_73_1 := Concatenation( List( deduped_79_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return List( ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] ), function ( objB_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := UnderlyingVertex( objB_3 );
                      return deduped_28_1[SafeUniquePositionProperty( deduped_2_1, function ( obj_4 )
                               return UnderlyingVertex( obj_4 ) = hoisted_1_3;
                           end )];
                  end );
          end ) );
    deduped_3_1 := List( deduped_85_1[1], Length );
    deduped_72_1 := Concatenation( List( deduped_79_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return List( ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] ), function ( objB_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := UnderlyingVertex( objB_3 );
                      return deduped_3_1[SafeUniquePositionProperty( deduped_2_1, function ( obj_4 )
                               return UnderlyingVertex( obj_4 ) = hoisted_1_3;
                           end )];
                  end );
          end ) );
    deduped_71_1 := Product( deduped_74_1 );
    deduped_70_1 := Product( deduped_72_1 );
    deduped_69_1 := [ 0 .. deduped_71_1 - 1 ];
    deduped_68_1 := [ 0 .. Product( deduped_73_1 ) - 1 ];
    deduped_67_1 := [ 0 .. deduped_70_1 - 1 ];
    deduped_9_1 := List( deduped_79_1, function ( i_2 )
            return Sum( List( [ 1 .. i_2 ], function ( j_3 )
                      return deduped_1_1[j_3];
                  end ) );
        end );
    deduped_8_1 := deduped_86_1[3];
    hoisted_25_1 := Concatenation( List( deduped_80_1, function ( j_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + j_2;
              hoisted_1_2 := deduped_9_1[1 + deduped_8_1[deduped_2_2][2]];
              return List( [ 0 .. deduped_4_1[deduped_2_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (i_3 + hoisted_1_2);
                      hoisted_2_3 := deduped_72_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_72_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_67_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    deduped_15_1 := List( deduped_85_1[2], AsList );
    deduped_14_1 := SetOfGeneratingMorphisms( deduped_90_1 );
    deduped_13_1 := UnderlyingQuiverAlgebra( deduped_90_1 );
    hoisted_24_1 := Concatenation( List( deduped_80_1, function ( j_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + j_2;
              return List( ListWithIdenticalEntries( deduped_4_1[deduped_1_2], deduped_14_1[deduped_1_2] ), function ( morB_3 )
                      local deduped_4_3, deduped_5_3, deduped_6_3;
                      deduped_6_3 := UnderlyingQuiverAlgebraElement( morB_3 );
                      deduped_5_3 := UnderlyingVertex( Source( morB_3 ) );
                      deduped_4_3 := UnderlyingVertex( Range( morB_3 ) );
                      if IdFunc( function (  )
                                  if true and deduped_4_3 = deduped_5_3 then
                                      return deduped_6_3 = PathAsAlgebraElement( deduped_13_1, QuiverVertexAsIdentityPath( deduped_5_3 ) );
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_3_1[SafeUniquePositionProperty( deduped_2_1, function ( obj_4 )
                                         return (UnderlyingVertex( obj_4 ) = deduped_5_3);
                                     end )] - 1 ];
                      else
                          return deduped_15_1[SafeUniquePositionProperty( deduped_14_1, function ( mor_4 )
                                   if UnderlyingVertex( Source( mor_4 ) ) = deduped_5_3 and UnderlyingVertex( Range( mor_4 ) ) = deduped_4_3 then
                                       return UnderlyingQuiverAlgebraElement( mor_4 ) = deduped_6_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    deduped_6_1 := Concatenation( List( deduped_80_1, function ( j_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_4_1[1 + j_2] - 1 ] ), deduped_70_1 );
          end ) );
    hoisted_26_1 := List( deduped_75_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_24_1[deduped_3_2];
            hoisted_1_2 := hoisted_25_1[deduped_3_2];
            return List( [ 0 .. deduped_6_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_10_1 := Concatenation( List( deduped_79_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return List( ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] ), UnderlyingVertex );
          end ) );
    deduped_7_1 := List( deduped_82_1, AsList );
    hoisted_21_1 := Concatenation( List( deduped_80_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_9_1[1 + deduped_8_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_7_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := deduped_10_1[1 + (hoisted_1_2[1 + i_3] + hoisted_2_2)];
                      return deduped_3_1[SafeUniquePositionProperty( deduped_2_1, function ( obj_4 )
                               return UnderlyingVertex( obj_4 ) = hoisted_1_3;
                           end )];
                  end );
          end ) );
    deduped_22_1 := List( deduped_75_1, function ( j_2 )
            return Product( hoisted_21_1{[ 1 .. j_2 ]} );
        end );
    hoisted_19_1 := Concatenation( List( deduped_80_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_9_1[1 + deduped_8_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_7_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (hoisted_1_2[1 + i_3] + hoisted_2_2);
                      hoisted_2_3 := deduped_72_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_72_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_67_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_12_1 := Concatenation( List( deduped_79_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return List( ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] ), function ( logic_new_func_x_3 )
                      return QuiverVertexAsIdentityPath( UnderlyingVertex( logic_new_func_x_3 ) );
                  end );
          end ) );
    if true and true then
        deduped_11_1 := true;
    else
        deduped_11_1 := false;
    fi;
    hoisted_16_1 := Concatenation( List( deduped_80_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_9_1[1 + deduped_8_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_7_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( i_3 )
                      local deduped_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (hoisted_1_2[1 + i_3] + hoisted_2_2);
                      deduped_1_3 := deduped_10_1[deduped_3_3];
                      if deduped_11_1 then
                          return [ 0 .. deduped_3_1[SafeUniquePositionProperty( deduped_2_1, function ( obj_4 )
                                         return (UnderlyingVertex( obj_4 ) = deduped_1_3);
                                     end )] - 1 ];
                      else
                          hoisted_2_3 := PathAsAlgebraElement( deduped_13_1, hoisted_12_1[deduped_3_3] );
                          return deduped_15_1[SafeUniquePositionProperty( deduped_14_1, function ( mor_4 )
                                   if UnderlyingVertex( Source( mor_4 ) ) = deduped_1_3 and UnderlyingVertex( Range( mor_4 ) ) = deduped_1_3 then
                                       return UnderlyingQuiverAlgebraElement( mor_4 ) = hoisted_2_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_20_1 := List( deduped_75_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_16_1[deduped_3_2];
            hoisted_1_2 := hoisted_19_1[deduped_3_2];
            return List( [ 0 .. deduped_6_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_66_1 := Filtered( deduped_67_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_75_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_20_1[deduped_1_3][deduped_1_2] * deduped_22_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_75_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_26_1[deduped_1_3][deduped_1_2] * deduped_22_1[deduped_1_3];
                    end ) );
        end );
    hoisted_34_1 := List( deduped_76_1, function ( j_2 )
            return Product( deduped_72_1{[ 1 .. j_2 ]} );
        end );
    hoisted_29_1 := List( ValuesOnAllObjects( beta_1 ), AsList );
    hoisted_30_1 := Concatenation( List( deduped_79_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return List( ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] ), function ( objB_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := UnderlyingVertex( objB_3 );
                      return hoisted_29_1[SafeUniquePositionProperty( deduped_2_1, function ( obj_4 )
                               return UnderlyingVertex( obj_4 ) = hoisted_1_3;
                           end )];
                  end );
          end ) );
    hoisted_33_1 := List( [ 1 .. deduped_78_1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_30_1[i_2];
            hoisted_2_2 := deduped_73_1[i_2];
            hoisted_1_2 := Product( deduped_73_1{[ 1 .. i_2 - 1 ]} );
            return List( deduped_68_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    hoisted_48_1 := List( deduped_68_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_76_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_33_1[deduped_1_3][hoisted_1_2] * hoisted_34_1[deduped_1_3];
                end );
        end );
    hoisted_47_1 := List( deduped_76_1, function ( j_2 )
            return Product( deduped_73_1{[ 1 .. j_2 ]} );
        end );
    deduped_41_1 := List( deduped_89_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_36_1 := List( deduped_89_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_45_1 := Concatenation( List( deduped_81_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := Sum( deduped_41_1{[ 1 .. i_2 - 1 ]} );
              hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_41_1[i_2] - 1 ];
              hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( AsList( CAP_JIT_INCOMPLETE_LOGIC( deduped_89_1[i_2] ) ) );
              return List( [ 0 .. deduped_36_1[i_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + hoisted_2_2[(1 + hoisted_1_2[(1 + i_3)])];
                      hoisted_2_3 := deduped_74_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_74_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_69_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    deduped_39_1 := List( deduped_88_1[2], AsList );
    hoisted_40_1 := Concatenation( List( deduped_79_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return List( ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] ), function ( objB_3 )
                      local hoisted_2_3, deduped_3_3;
                      deduped_3_3 := UnderlyingVertex( objB_3 );
                      if deduped_11_1 then
                          return [ 0 .. deduped_28_1[SafeUniquePositionProperty( deduped_2_1, function ( obj_4 )
                                         return (UnderlyingVertex( obj_4 ) = deduped_3_3);
                                     end )] - 1 ];
                      else
                          hoisted_2_3 := PathAsAlgebraElement( deduped_13_1, QuiverVertexAsIdentityPath( deduped_3_3 ) );
                          return deduped_39_1[SafeUniquePositionProperty( deduped_14_1, function ( mor_4 )
                                   if UnderlyingVertex( Source( mor_4 ) ) = deduped_3_3 and UnderlyingVertex( Range( mor_4 ) ) = deduped_3_3 then
                                       return UnderlyingQuiverAlgebraElement( mor_4 ) = hoisted_2_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_38_1 := Concatenation( List( deduped_81_1, function ( i_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_36_1[i_2] - 1 ] ), deduped_71_1 );
          end ) );
    hoisted_46_1 := List( [ 0 .. Sum( List( deduped_81_1, function ( i_2 )
                      return Length( [ 0 .. deduped_36_1[i_2] - 1 ] );
                  end ) ) - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_40_1[deduped_3_2];
            hoisted_1_2 := hoisted_45_1[deduped_3_2];
            return List( [ 0 .. hoisted_38_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_65_1 := List( deduped_69_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return hoisted_48_1[1 + Sum( deduped_76_1, function ( j_3 )
                       local deduped_1_3;
                       deduped_1_3 := (1 + j_3);
                       return hoisted_46_1[deduped_1_3][hoisted_1_2] * hoisted_47_1[deduped_1_3];
                   end )];
        end );
    deduped_52_1 := List( deduped_79_1, function ( i_2 )
            return Sum( List( [ 1 .. i_2 ], function ( j_3 )
                      return deduped_27_1[j_3];
                  end ) );
        end );
    hoisted_62_1 := Concatenation( List( deduped_80_1, function ( j_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + j_2;
              hoisted_1_2 := deduped_52_1[1 + deduped_8_1[deduped_2_2][2]];
              return List( [ 0 .. deduped_49_1[deduped_2_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (i_3 + hoisted_1_2);
                      hoisted_2_3 := deduped_74_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_74_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_69_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_61_1 := Concatenation( List( deduped_80_1, function ( j_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + j_2;
              return List( ListWithIdenticalEntries( deduped_49_1[deduped_1_2], deduped_14_1[deduped_1_2] ), function ( morB_3 )
                      local deduped_4_3, deduped_5_3, deduped_6_3;
                      deduped_6_3 := UnderlyingQuiverAlgebraElement( morB_3 );
                      deduped_5_3 := UnderlyingVertex( Source( morB_3 ) );
                      deduped_4_3 := UnderlyingVertex( Range( morB_3 ) );
                      if IdFunc( function (  )
                                  if true and deduped_4_3 = deduped_5_3 then
                                      return deduped_6_3 = PathAsAlgebraElement( deduped_13_1, QuiverVertexAsIdentityPath( deduped_5_3 ) );
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_28_1[SafeUniquePositionProperty( deduped_2_1, function ( obj_4 )
                                         return (UnderlyingVertex( obj_4 ) = deduped_5_3);
                                     end )] - 1 ];
                      else
                          return deduped_39_1[SafeUniquePositionProperty( deduped_14_1, function ( mor_4 )
                                   if UnderlyingVertex( Source( mor_4 ) ) = deduped_5_3 and UnderlyingVertex( Range( mor_4 ) ) = deduped_4_3 then
                                       return UnderlyingQuiverAlgebraElement( mor_4 ) = deduped_6_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    deduped_50_1 := Concatenation( List( deduped_80_1, function ( j_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_49_1[1 + j_2] - 1 ] ), deduped_71_1 );
          end ) );
    hoisted_63_1 := List( deduped_77_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_61_1[deduped_3_2];
            hoisted_1_2 := hoisted_62_1[deduped_3_2];
            return List( [ 0 .. deduped_50_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_53_1 := Concatenation( List( deduped_79_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return List( ListWithIdenticalEntries( deduped_27_1[deduped_1_2], deduped_2_1[deduped_1_2] ), UnderlyingVertex );
          end ) );
    deduped_51_1 := List( deduped_83_1, AsList );
    hoisted_58_1 := Concatenation( List( deduped_80_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_52_1[1 + deduped_8_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_51_1[deduped_3_2];
              return List( [ 0 .. deduped_49_1[deduped_3_2] - 1 ], function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := deduped_53_1[1 + (hoisted_1_2[1 + i_3] + hoisted_2_2)];
                      return deduped_28_1[SafeUniquePositionProperty( deduped_2_1, function ( obj_4 )
                               return UnderlyingVertex( obj_4 ) = hoisted_1_3;
                           end )];
                  end );
          end ) );
    deduped_59_1 := List( deduped_77_1, function ( j_2 )
            return Product( hoisted_58_1{[ 1 .. j_2 ]} );
        end );
    hoisted_56_1 := Concatenation( List( deduped_80_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_52_1[1 + deduped_8_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_51_1[deduped_3_2];
              return List( [ 0 .. deduped_49_1[deduped_3_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (hoisted_1_2[1 + i_3] + hoisted_2_2);
                      hoisted_2_3 := deduped_74_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_74_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_69_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_54_1 := Concatenation( List( deduped_79_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return List( ListWithIdenticalEntries( deduped_27_1[deduped_1_2], deduped_2_1[deduped_1_2] ), function ( logic_new_func_x_3 )
                      return QuiverVertexAsIdentityPath( UnderlyingVertex( logic_new_func_x_3 ) );
                  end );
          end ) );
    hoisted_55_1 := Concatenation( List( deduped_80_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_52_1[1 + deduped_8_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_51_1[deduped_3_2];
              return List( [ 0 .. deduped_49_1[deduped_3_2] - 1 ], function ( i_3 )
                      local deduped_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (hoisted_1_2[1 + i_3] + hoisted_2_2);
                      deduped_1_3 := deduped_53_1[deduped_3_3];
                      if deduped_11_1 then
                          return [ 0 .. deduped_28_1[SafeUniquePositionProperty( deduped_2_1, function ( obj_4 )
                                         return (UnderlyingVertex( obj_4 ) = deduped_1_3);
                                     end )] - 1 ];
                      else
                          hoisted_2_3 := PathAsAlgebraElement( deduped_13_1, hoisted_54_1[deduped_3_3] );
                          return deduped_39_1[SafeUniquePositionProperty( deduped_14_1, function ( mor_4 )
                                   if UnderlyingVertex( Source( mor_4 ) ) = deduped_1_3 and UnderlyingVertex( Range( mor_4 ) ) = deduped_1_3 then
                                       return UnderlyingQuiverAlgebraElement( mor_4 ) = hoisted_2_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_57_1 := List( deduped_77_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_55_1[deduped_3_2];
            hoisted_1_2 := hoisted_56_1[deduped_3_2];
            return List( [ 0 .. deduped_50_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_64_1 := Filtered( deduped_69_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_77_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_57_1[deduped_1_3][deduped_1_2] * deduped_59_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_77_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_63_1[deduped_1_3][deduped_1_2] * deduped_59_1[deduped_1_3];
                    end ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( Range( cat_1 ), source_1, range_1, AsList, List( [ 0 .. Length( source_1 ) - 1 ], function ( x_2 )
              return -1 + BigInt( SafePosition( hoisted_66_1, CAP_JIT_INCOMPLETE_LOGIC( hoisted_65_1[(1 + hoisted_64_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))])] ) ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, hoisted_14_1, hoisted_15_1, deduped_16_1, deduped_17_1, deduped_18_1, hoisted_19_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, deduped_25_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, deduped_30_1, hoisted_31_1, hoisted_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1;
    deduped_48_1 := ValuesOfPreSheaf( range_1 );
    deduped_47_1 := ValuesOfPreSheaf( source_1 );
    deduped_46_1 := Source( cat_1 );
    deduped_45_1 := deduped_47_1[2];
    deduped_44_1 := deduped_48_1[1];
    deduped_43_1 := deduped_47_1[1];
    deduped_42_1 := DefiningTripleOfUnderlyingQuiver( deduped_46_1 );
    deduped_41_1 := ListOfValues( deduped_43_1 );
    deduped_40_1 := deduped_42_1[1];
    deduped_39_1 := [ 1 .. deduped_40_1 ];
    deduped_38_1 := [ 0 .. deduped_42_1[2] - 1 ];
    deduped_37_1 := [ 0 .. deduped_40_1 - 1 ];
    deduped_7_1 := List( deduped_45_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    deduped_36_1 := [ 0 .. Sum( List( deduped_38_1, function ( j_2 )
                    return deduped_7_1[1 + j_2];
                end ) ) - 1 ];
    deduped_6_1 := List( deduped_44_1, Length );
    deduped_5_1 := SetOfObjects( deduped_46_1 );
    deduped_4_1 := List( deduped_43_1, Length );
    deduped_35_1 := Concatenation( List( deduped_37_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return List( ListWithIdenticalEntries( deduped_4_1[deduped_1_2], deduped_5_1[deduped_1_2] ), function ( objB_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := UnderlyingVertex( objB_3 );
                      return deduped_6_1[SafeUniquePositionProperty( deduped_5_1, function ( obj_4 )
                               return UnderlyingVertex( obj_4 ) = hoisted_1_3;
                           end )];
                  end );
          end ) );
    deduped_34_1 := Product( deduped_35_1 );
    deduped_33_1 := [ 0 .. deduped_34_1 - 1 ];
    hoisted_32_1 := Range( cat_1 );
    deduped_12_1 := List( deduped_37_1, function ( i_2 )
            return Sum( List( [ 1 .. i_2 ], function ( j_3 )
                      return deduped_4_1[j_3];
                  end ) );
        end );
    deduped_11_1 := deduped_42_1[3];
    hoisted_28_1 := Concatenation( List( deduped_38_1, function ( j_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + j_2;
              hoisted_1_2 := deduped_12_1[1 + deduped_11_1[deduped_2_2][2]];
              return List( [ 0 .. deduped_7_1[deduped_2_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (i_3 + hoisted_1_2);
                      hoisted_2_3 := deduped_35_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_35_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_33_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    deduped_18_1 := List( deduped_48_1[2], AsList );
    deduped_17_1 := SetOfGeneratingMorphisms( deduped_46_1 );
    deduped_16_1 := UnderlyingQuiverAlgebra( deduped_46_1 );
    hoisted_27_1 := Concatenation( List( deduped_38_1, function ( j_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + j_2;
              return List( ListWithIdenticalEntries( deduped_7_1[deduped_1_2], deduped_17_1[deduped_1_2] ), function ( morB_3 )
                      local deduped_4_3, deduped_5_3, deduped_6_3;
                      deduped_6_3 := UnderlyingQuiverAlgebraElement( morB_3 );
                      deduped_5_3 := UnderlyingVertex( Source( morB_3 ) );
                      deduped_4_3 := UnderlyingVertex( Range( morB_3 ) );
                      if IdFunc( function (  )
                                  if true and deduped_4_3 = deduped_5_3 then
                                      return deduped_6_3 = PathAsAlgebraElement( deduped_16_1, QuiverVertexAsIdentityPath( deduped_5_3 ) );
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_6_1[SafeUniquePositionProperty( deduped_5_1, function ( obj_4 )
                                         return (UnderlyingVertex( obj_4 ) = deduped_5_3);
                                     end )] - 1 ];
                      else
                          return deduped_18_1[SafeUniquePositionProperty( deduped_17_1, function ( mor_4 )
                                   if UnderlyingVertex( Source( mor_4 ) ) = deduped_5_3 and UnderlyingVertex( Range( mor_4 ) ) = deduped_4_3 then
                                       return UnderlyingQuiverAlgebraElement( mor_4 ) = deduped_6_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    deduped_9_1 := Concatenation( List( deduped_38_1, function ( j_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_7_1[1 + j_2] - 1 ] ), deduped_34_1 );
          end ) );
    hoisted_29_1 := List( deduped_36_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_27_1[deduped_3_2];
            hoisted_1_2 := hoisted_28_1[deduped_3_2];
            return List( [ 0 .. deduped_9_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_13_1 := Concatenation( List( deduped_37_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return List( ListWithIdenticalEntries( deduped_4_1[deduped_1_2], deduped_5_1[deduped_1_2] ), UnderlyingVertex );
          end ) );
    deduped_10_1 := List( deduped_45_1, AsList );
    hoisted_24_1 := Concatenation( List( deduped_38_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_12_1[1 + deduped_11_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_10_1[deduped_3_2];
              return List( [ 0 .. deduped_7_1[deduped_3_2] - 1 ], function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := deduped_13_1[1 + (hoisted_1_2[1 + i_3] + hoisted_2_2)];
                      return deduped_6_1[SafeUniquePositionProperty( deduped_5_1, function ( obj_4 )
                               return UnderlyingVertex( obj_4 ) = hoisted_1_3;
                           end )];
                  end );
          end ) );
    deduped_25_1 := List( deduped_36_1, function ( j_2 )
            return Product( hoisted_24_1{[ 1 .. j_2 ]} );
        end );
    hoisted_22_1 := Concatenation( List( deduped_38_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_12_1[1 + deduped_11_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_10_1[deduped_3_2];
              return List( [ 0 .. deduped_7_1[deduped_3_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (hoisted_1_2[1 + i_3] + hoisted_2_2);
                      hoisted_2_3 := deduped_35_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_35_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_33_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_15_1 := Concatenation( List( deduped_37_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return List( ListWithIdenticalEntries( deduped_4_1[deduped_1_2], deduped_5_1[deduped_1_2] ), function ( logic_new_func_x_3 )
                      return QuiverVertexAsIdentityPath( UnderlyingVertex( logic_new_func_x_3 ) );
                  end );
          end ) );
    if true and true then
        hoisted_14_1 := true;
    else
        hoisted_14_1 := false;
    fi;
    hoisted_19_1 := Concatenation( List( deduped_38_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_12_1[1 + deduped_11_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_10_1[deduped_3_2];
              return List( [ 0 .. deduped_7_1[deduped_3_2] - 1 ], function ( i_3 )
                      local deduped_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (hoisted_1_2[1 + i_3] + hoisted_2_2);
                      deduped_1_3 := deduped_13_1[deduped_3_3];
                      if hoisted_14_1 then
                          return [ 0 .. deduped_6_1[SafeUniquePositionProperty( deduped_5_1, function ( obj_4 )
                                         return (UnderlyingVertex( obj_4 ) = deduped_1_3);
                                     end )] - 1 ];
                      else
                          hoisted_2_3 := PathAsAlgebraElement( deduped_16_1, hoisted_15_1[deduped_3_3] );
                          return deduped_18_1[SafeUniquePositionProperty( deduped_17_1, function ( mor_4 )
                                   if UnderlyingVertex( Source( mor_4 ) ) = deduped_1_3 and UnderlyingVertex( Range( mor_4 ) ) = deduped_1_3 then
                                       return UnderlyingQuiverAlgebraElement( mor_4 ) = hoisted_2_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_23_1 := List( deduped_36_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_19_1[deduped_3_2];
            hoisted_1_2 := hoisted_22_1[deduped_3_2];
            return List( [ 0 .. deduped_9_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_31_1 := CAP_JIT_INCOMPLETE_LOGIC( Filtered( deduped_33_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_36_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_23_1[deduped_1_3][deduped_1_2] * deduped_25_1[deduped_1_3];
                        end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_36_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_29_1[deduped_1_3][deduped_1_2] * deduped_25_1[deduped_1_3];
                        end ) );
            end )[1 + AsList( alpha_1 )[(1 + CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. (Length( Source( alpha_1 ) ) - 1) ][1] ))]] );
    deduped_3_1 := List( deduped_41_1, Length );
    deduped_30_1 := List( deduped_39_1, function ( i_2 )
            return Product( deduped_35_1{[ 1 + Sum( deduped_3_1{[ 1 .. (i_2 - 1) ]} ) .. Sum( deduped_3_1{[ 1 .. i_2 ]} ) ]} );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, ValuesOnAllObjects, List( deduped_39_1, function ( i_2 )
              local deduped_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
              hoisted_2_2 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( QUO_INT( hoisted_31_1, Product( deduped_30_1{[ 1 .. deduped_3_2 - 1 ]} ) ), deduped_30_1[deduped_3_2] ) );
              deduped_1_2 := deduped_6_1[i_2];
              return CreateCapCategoryMorphismWithAttributes( hoisted_32_1, deduped_41_1[i_2], deduped_44_1[i_2], AsList, List( [ 0 .. deduped_3_1[i_2] - 1 ], function ( i_3 )
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
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, hoisted_11_1, hoisted_12_1, deduped_13_1, deduped_14_1, deduped_15_1, hoisted_16_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, deduped_22_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, deduped_29_1, deduped_30_1, hoisted_31_1, hoisted_34_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1;
    deduped_53_1 := ValuesOfPreSheaf( arg3_1 );
    deduped_52_1 := ValuesOfPreSheaf( arg2_1 );
    deduped_51_1 := Source( cat_1 );
    deduped_50_1 := deduped_52_1[2];
    deduped_49_1 := deduped_53_1[1];
    deduped_48_1 := deduped_52_1[1];
    deduped_47_1 := DefiningTripleOfUnderlyingQuiver( deduped_51_1 );
    deduped_46_1 := ListOfValues( deduped_48_1 );
    deduped_45_1 := deduped_47_1[1];
    deduped_44_1 := [ 1 .. deduped_45_1 ];
    deduped_43_1 := [ 0 .. deduped_47_1[2] - 1 ];
    deduped_42_1 := [ 0 .. deduped_45_1 - 1 ];
    deduped_4_1 := List( deduped_50_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    deduped_41_1 := [ 0 .. Sum( List( deduped_43_1, function ( j_2 )
                    return deduped_4_1[1 + j_2];
                end ) ) - 1 ];
    deduped_3_1 := List( deduped_49_1, Length );
    deduped_2_1 := SetOfObjects( deduped_51_1 );
    deduped_1_1 := List( deduped_48_1, Length );
    deduped_40_1 := Concatenation( List( deduped_42_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return List( ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] ), function ( objB_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := UnderlyingVertex( objB_3 );
                      return deduped_3_1[SafeUniquePositionProperty( deduped_2_1, function ( obj_4 )
                               return UnderlyingVertex( obj_4 ) = hoisted_1_3;
                           end )];
                  end );
          end ) );
    deduped_39_1 := Product( deduped_40_1 );
    deduped_38_1 := [ 0 .. deduped_39_1 - 1 ];
    deduped_9_1 := List( deduped_42_1, function ( i_2 )
            return Sum( List( [ 1 .. i_2 ], function ( j_3 )
                      return deduped_1_1[j_3];
                  end ) );
        end );
    deduped_8_1 := deduped_47_1[3];
    hoisted_25_1 := Concatenation( List( deduped_43_1, function ( j_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + j_2;
              hoisted_1_2 := deduped_9_1[1 + deduped_8_1[deduped_2_2][2]];
              return List( [ 0 .. deduped_4_1[deduped_2_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (i_3 + hoisted_1_2);
                      hoisted_2_3 := deduped_40_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_40_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_38_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    deduped_15_1 := List( deduped_53_1[2], AsList );
    deduped_14_1 := SetOfGeneratingMorphisms( deduped_51_1 );
    deduped_13_1 := UnderlyingQuiverAlgebra( deduped_51_1 );
    hoisted_24_1 := Concatenation( List( deduped_43_1, function ( j_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + j_2;
              return List( ListWithIdenticalEntries( deduped_4_1[deduped_1_2], deduped_14_1[deduped_1_2] ), function ( morB_3 )
                      local deduped_4_3, deduped_5_3, deduped_6_3;
                      deduped_6_3 := UnderlyingQuiverAlgebraElement( morB_3 );
                      deduped_5_3 := UnderlyingVertex( Source( morB_3 ) );
                      deduped_4_3 := UnderlyingVertex( Range( morB_3 ) );
                      if IdFunc( function (  )
                                  if true and deduped_4_3 = deduped_5_3 then
                                      return deduped_6_3 = PathAsAlgebraElement( deduped_13_1, QuiverVertexAsIdentityPath( deduped_5_3 ) );
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_3_1[SafeUniquePositionProperty( deduped_2_1, function ( obj_4 )
                                         return (UnderlyingVertex( obj_4 ) = deduped_5_3);
                                     end )] - 1 ];
                      else
                          return deduped_15_1[SafeUniquePositionProperty( deduped_14_1, function ( mor_4 )
                                   if UnderlyingVertex( Source( mor_4 ) ) = deduped_5_3 and UnderlyingVertex( Range( mor_4 ) ) = deduped_4_3 then
                                       return UnderlyingQuiverAlgebraElement( mor_4 ) = deduped_6_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    deduped_6_1 := Concatenation( List( deduped_43_1, function ( j_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_4_1[1 + j_2] - 1 ] ), deduped_39_1 );
          end ) );
    hoisted_26_1 := List( deduped_41_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_24_1[deduped_3_2];
            hoisted_1_2 := hoisted_25_1[deduped_3_2];
            return List( [ 0 .. deduped_6_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_10_1 := Concatenation( List( deduped_42_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return List( ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] ), UnderlyingVertex );
          end ) );
    deduped_7_1 := List( deduped_50_1, AsList );
    hoisted_21_1 := Concatenation( List( deduped_43_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_9_1[1 + deduped_8_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_7_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( i_3 )
                      local hoisted_1_3;
                      hoisted_1_3 := deduped_10_1[1 + (hoisted_1_2[1 + i_3] + hoisted_2_2)];
                      return deduped_3_1[SafeUniquePositionProperty( deduped_2_1, function ( obj_4 )
                               return UnderlyingVertex( obj_4 ) = hoisted_1_3;
                           end )];
                  end );
          end ) );
    deduped_22_1 := List( deduped_41_1, function ( j_2 )
            return Product( hoisted_21_1{[ 1 .. j_2 ]} );
        end );
    hoisted_19_1 := Concatenation( List( deduped_43_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_9_1[1 + deduped_8_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_7_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (hoisted_1_2[1 + i_3] + hoisted_2_2);
                      hoisted_2_3 := deduped_40_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_40_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_38_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_12_1 := Concatenation( List( deduped_42_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return List( ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] ), function ( logic_new_func_x_3 )
                      return QuiverVertexAsIdentityPath( UnderlyingVertex( logic_new_func_x_3 ) );
                  end );
          end ) );
    if true and true then
        hoisted_11_1 := true;
    else
        hoisted_11_1 := false;
    fi;
    hoisted_16_1 := Concatenation( List( deduped_43_1, function ( j_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + j_2;
              hoisted_2_2 := deduped_9_1[1 + deduped_8_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_7_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( i_3 )
                      local deduped_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + (hoisted_1_2[1 + i_3] + hoisted_2_2);
                      deduped_1_3 := deduped_10_1[deduped_3_3];
                      if hoisted_11_1 then
                          return [ 0 .. deduped_3_1[SafeUniquePositionProperty( deduped_2_1, function ( obj_4 )
                                         return (UnderlyingVertex( obj_4 ) = deduped_1_3);
                                     end )] - 1 ];
                      else
                          hoisted_2_3 := PathAsAlgebraElement( deduped_13_1, hoisted_12_1[deduped_3_3] );
                          return deduped_15_1[SafeUniquePositionProperty( deduped_14_1, function ( mor_4 )
                                   if UnderlyingVertex( Source( mor_4 ) ) = deduped_1_3 and UnderlyingVertex( Range( mor_4 ) ) = deduped_1_3 then
                                       return UnderlyingQuiverAlgebraElement( mor_4 ) = hoisted_2_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_20_1 := List( deduped_41_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_16_1[deduped_3_2];
            hoisted_1_2 := hoisted_19_1[deduped_3_2];
            return List( [ 0 .. deduped_6_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_37_1 := Filtered( deduped_38_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_41_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_20_1[deduped_1_3][deduped_1_2] * deduped_22_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_41_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_26_1[deduped_1_3][deduped_1_2] * deduped_22_1[deduped_1_3];
                    end ) );
        end );
    deduped_36_1 := Length( deduped_37_1 );
    hoisted_34_1 := Range( cat_1 );
    deduped_29_1 := List( deduped_46_1, Length );
    deduped_30_1 := List( deduped_44_1, function ( i_2 )
            return Product( deduped_40_1{[ 1 + Sum( deduped_29_1{[ 1 .. (i_2 - 1) ]} ) .. Sum( deduped_29_1{[ 1 .. i_2 ]} ) ]} );
        end );
    hoisted_31_1 := List( deduped_44_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := deduped_30_1[i_2];
            hoisted_1_2 := Product( deduped_30_1{[ 1 .. i_2 - 1 ]} );
            return List( deduped_38_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    return List( [ 0 .. deduped_36_1 - 1 ], function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + deduped_37_1[(1 + REM_INT( i_2, deduped_36_1 ))];
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, ValuesOnAllObjects, List( deduped_44_1, function ( i_3 )
                      local deduped_1_3, hoisted_2_3;
                      hoisted_2_3 := hoisted_31_1[i_3][hoisted_1_2];
                      deduped_1_3 := deduped_3_1[i_3];
                      return CreateCapCategoryMorphismWithAttributes( hoisted_34_1, deduped_46_1[i_3], deduped_49_1[i_3], AsList, List( [ 0 .. deduped_29_1[i_3] - 1 ], function ( i_4 )
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

BindGlobal( "PreSheavesOfFpCategoryInSkeletalFinSetsPrecompiled", function ( quiver )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function ( quiver )
    local sFinSets;
    sFinSets := CategoryOfSkeletalFinSets(  : FinalizeCategory := true,
        overhead := true );
    return PreSheaves( FreeCategory( quiver : range_of_HomStructure := sFinSets,
          FinalizeCategory := true ), sFinSets );
end;
        
        
    
    cat := category_constructor( quiver : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_PreSheavesOfFpCategoryInSkeletalFinSetsPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
