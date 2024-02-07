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
    deduped_6_1 := Target( cat_1 );
    deduped_5_1 := Source( cat_1 );
    deduped_4_1 := CreateCapCategoryObjectWithAttributes( deduped_6_1, Length, BigInt( 0 ) );
    deduped_3_1 := DefiningTripleOfUnderlyingQuiver( deduped_5_1 );
    hoisted_2_1 := CreateCapCategoryMorphismWithAttributes( deduped_6_1, deduped_4_1, deduped_4_1, AsList, [  ] );
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, deduped_5_1, Target, deduped_6_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_3_1[1] ], function ( o_2 )
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
    deduped_6_1 := Target( cat_1 );
    deduped_5_1 := Source( cat_1 );
    deduped_4_1 := DefiningTripleOfUnderlyingQuiver( deduped_5_1 );
    hoisted_3_1 := [ 1 .. Length( objects_1 ) ];
    hoisted_2_1 := deduped_4_1[3];
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, deduped_5_1, Target, deduped_6_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_4_1[1] ], function ( o_2 )
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
    hoisted_4_1 := Target( cat_1 );
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
    hoisted_3_1 := Target( cat_1 );
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
    local deduped_1_1, deduped_2_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_10_1, deduped_12_1, deduped_13_1, deduped_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, deduped_19_1, deduped_20_1, deduped_21_1, hoisted_22_1, deduped_24_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, deduped_29_1, deduped_31_1, deduped_32_1, hoisted_33_1, hoisted_34_1, hoisted_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1;
    deduped_49_1 := ValuesOfPreSheaf( arg3_1 );
    deduped_48_1 := ValuesOfPreSheaf( arg2_1 );
    deduped_47_1 := Source( cat_1 );
    deduped_46_1 := deduped_48_1[2];
    deduped_45_1 := SetOfObjects( deduped_47_1 );
    deduped_44_1 := DefiningTripleOfUnderlyingQuiver( deduped_47_1 );
    deduped_43_1 := [ 0 .. deduped_44_1[2] - 1 ];
    deduped_42_1 := [ 0 .. deduped_44_1[1] - 1 ];
    deduped_1_1 := List( deduped_48_1[1], Length );
    deduped_41_1 := List( deduped_42_1, function ( o_2 )
            return deduped_1_1[1 + o_2];
        end );
    deduped_5_1 := deduped_44_1[3];
    deduped_7_1 := List( deduped_43_1, function ( m_2 )
            return deduped_5_1[1 + m_2][1];
        end );
    deduped_6_1 := List( deduped_43_1, function ( m_2 )
            return deduped_5_1[1 + m_2][2];
        end );
    deduped_8_1 := List( deduped_43_1, function ( m_2 )
            local deduped_1_2, deduped_2_2;
            deduped_2_2 := 1 + m_2;
            deduped_1_2 := deduped_1_1[1 + deduped_6_1[deduped_2_2]];
            return NTuple( 2, deduped_1_2, ListWithIdenticalEntries( deduped_1_2, deduped_45_1[1 + deduped_7_1[deduped_2_2]] ) );
        end );
    deduped_40_1 := [ 0 .. Sum( List( deduped_43_1, function ( i_2 )
                    return deduped_8_1[1 + i_2][1];
                end ) ) - 1 ];
    deduped_4_1 := List( deduped_49_1[1], Length );
    deduped_2_1 := List( deduped_45_1, UnderlyingVertex );
    deduped_39_1 := Concatenation( List( deduped_42_1, function ( o_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + o_2;
              hoisted_1_2 := deduped_2_1[deduped_2_2];
              return ListWithIdenticalEntries( deduped_1_1[deduped_2_2], deduped_4_1[SafeUniquePositionProperty( deduped_45_1, function ( obj_3 )
                         return UnderlyingVertex( obj_3 ) = hoisted_1_2;
                     end )] );
          end ) );
    deduped_38_1 := [ 0 .. Sum( List( deduped_43_1, function ( m_2 )
                    return deduped_1_1[1 + deduped_5_1[(1 + m_2)][2]];
                end ) ) - 1 ];
    deduped_37_1 := Product( deduped_39_1 );
    deduped_36_1 := [ 0 .. deduped_37_1 - 1 ];
    deduped_20_1 := SetOfGeneratingMorphisms( deduped_47_1 );
    deduped_32_1 := List( deduped_43_1, function ( m_2 )
            local deduped_1_2, deduped_2_2;
            deduped_2_2 := 1 + m_2;
            deduped_1_2 := deduped_1_1[1 + deduped_6_1[deduped_2_2]];
            return NTuple( 2, [ 0 .. deduped_1_2 - 1 ], ListWithIdenticalEntries( deduped_1_2, deduped_20_1[deduped_2_2] ) );
        end );
    deduped_13_1 := UnderlyingQuiverAlgebra( deduped_47_1 );
    deduped_12_1 := List( deduped_42_1, function ( o_2 )
            local deduped_1_2, deduped_2_2;
            deduped_2_2 := 1 + o_2;
            deduped_1_2 := deduped_1_1[deduped_2_2];
            return NTuple( 2, deduped_1_2, ListWithIdenticalEntries( deduped_1_2, deduped_45_1[deduped_2_2] ) );
        end );
    deduped_31_1 := List( deduped_43_1, function ( i_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := deduped_6_1[1 + i_2];
            deduped_2_2 := 1 + deduped_3_2;
            deduped_1_2 := Sum( deduped_41_1{[ 1 .. deduped_3_2 ]} );
            return NTuple( 2, [ deduped_1_2 .. deduped_1_2 + deduped_41_1[deduped_2_2] - 1 ], List( deduped_12_1[deduped_2_2][2], function ( objC_3 )
                      return CreateCapCategoryMorphismWithAttributes( deduped_47_1, objC_3, objC_3, UnderlyingQuiverAlgebraElement, PathAsAlgebraElement( deduped_13_1, QuiverVertexAsIdentityPath( UnderlyingVertex( objC_3 ) ) ) );
                  end ) );
        end );
    deduped_24_1 := Sum( deduped_41_1 );
    hoisted_34_1 := Concatenation( List( deduped_43_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + i_2;
              hoisted_2_2 := deduped_31_1[deduped_3_2][1];
              hoisted_1_2 := deduped_32_1[deduped_3_2][1];
              return List( [ 0 .. deduped_8_1[deduped_3_2][1] - 1 ], function ( i_3 )
                      local hoisted_3_3, deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3;
                      deduped_7_3 := hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                      deduped_6_3 := 1 + deduped_7_3;
                      deduped_5_3 := deduped_39_1[deduped_6_3];
                      deduped_4_3 := Product( deduped_39_1{[ 1 .. deduped_7_3 ]} );
                      hoisted_3_3 := DivIntWithGivenQuotient( deduped_37_1, deduped_4_3, deduped_5_3 * Product( deduped_39_1{[ (deduped_6_3 + 1) .. deduped_24_1 ]} ) );
                      return List( deduped_36_1, function ( i_4 )
                              return RemIntWithDomain( QuoIntWithDomain( i_4, deduped_4_3, deduped_37_1 ), deduped_5_3, hoisted_3_3 );
                          end );
                  end );
          end ) );
    deduped_21_1 := List( deduped_49_1[2], AsList );
    hoisted_33_1 := Concatenation( List( deduped_43_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2;
              deduped_10_2 := 1 + i_2;
              deduped_9_2 := deduped_32_1[deduped_10_2];
              deduped_8_2 := deduped_9_2[2];
              deduped_7_2 := deduped_31_1[deduped_10_2][2];
              hoisted_6_2 := List( deduped_8_2, function ( logic_new_func_x_3 )
                      return QuiverVertexAsIdentityPath( UnderlyingVertex( Source( logic_new_func_x_3 ) ) );
                  end );
              hoisted_5_2 := List( deduped_7_2, UnderlyingQuiverAlgebraElement );
              hoisted_4_2 := List( deduped_8_2, UnderlyingQuiverAlgebraElement );
              hoisted_3_2 := List( deduped_8_2, function ( logic_new_func_x_3 )
                      return UnderlyingVertex( Source( logic_new_func_x_3 ) );
                  end );
              hoisted_2_2 := List( deduped_7_2, function ( logic_new_func_x_3 )
                      return UnderlyingVertex( Target( logic_new_func_x_3 ) );
                  end );
              hoisted_1_2 := deduped_9_2[1];
              return List( [ 0 .. deduped_8_1[deduped_10_2][1] - 1 ], function ( i_3 )
                      local deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3, deduped_8_3;
                      deduped_8_3 := 1 + i_3;
                      deduped_7_3 := hoisted_3_2[deduped_8_3];
                      deduped_6_3 := 1 + hoisted_1_2[deduped_8_3];
                      deduped_5_3 := hoisted_2_2[deduped_6_3];
                      deduped_4_3 := hoisted_4_2[deduped_8_3] * hoisted_5_2[deduped_6_3];
                      if CAP_JIT_EXPR_CASE_WRAPPER( function (  )
                                  if deduped_5_3 = deduped_7_3 then
                                      return deduped_4_3 = PathAsAlgebraElement( deduped_13_1, hoisted_6_2[deduped_8_3] );
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_4_1[SafeUniquePositionProperty( deduped_45_1, function ( obj_4 )
                                         return (UnderlyingVertex( obj_4 ) = deduped_7_3);
                                     end )] - 1 ];
                      else
                          return deduped_21_1[SafeUniquePositionProperty( deduped_20_1, function ( mor_4 )
                                   if UnderlyingVertex( Source( mor_4 ) ) = deduped_7_3 and UnderlyingVertex( Range( mor_4 ) ) = deduped_5_3 then
                                       return UnderlyingQuiverAlgebraElement( mor_4 ) = deduped_4_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    deduped_10_1 := Concatenation( List( deduped_43_1, function ( i_2 )
              return ListWithIdenticalEntries( deduped_8_1[1 + i_2][1], deduped_37_1 );
          end ) );
    hoisted_35_1 := List( deduped_40_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_33_1[deduped_3_2];
            hoisted_1_2 := hoisted_34_1[deduped_3_2];
            return List( [ 0 .. deduped_10_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_28_1 := Concatenation( List( deduped_43_1, function ( m_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + m_2;
              hoisted_1_2 := deduped_2_1[1 + deduped_7_1[deduped_2_2]];
              return ListWithIdenticalEntries( deduped_1_1[1 + deduped_6_1[deduped_2_2]], deduped_4_1[SafeUniquePositionProperty( deduped_45_1, function ( obj_3 )
                         return UnderlyingVertex( obj_3 ) = hoisted_1_2;
                     end )] );
          end ) );
    deduped_29_1 := List( deduped_38_1, function ( j_2 )
            return Product( hoisted_28_1{[ 1 .. j_2 ]} );
        end );
    hoisted_18_1 := List( deduped_45_1, function ( logic_new_func_x_2 )
            return QuiverVertexAsIdentityPath( UnderlyingVertex( logic_new_func_x_2 ) );
        end );
    hoisted_17_1 := List( deduped_46_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_16_1 := List( deduped_46_1, AsList );
    deduped_19_1 := List( deduped_43_1, function ( m_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := 1 + m_2;
            deduped_2_2 := 1 + deduped_7_1[deduped_3_2];
            deduped_1_2 := deduped_45_1[deduped_2_2];
            return NTuple( 2, hoisted_16_1[deduped_3_2], ListWithIdenticalEntries( hoisted_17_1[deduped_3_2], CreateCapCategoryMorphismWithAttributes( deduped_47_1, deduped_1_2, deduped_1_2, UnderlyingQuiverAlgebraElement, PathAsAlgebraElement( deduped_13_1, hoisted_18_1[deduped_2_2] ) ) ) );
        end );
    deduped_15_1 := List( deduped_43_1, function ( i_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := deduped_7_1[1 + i_2];
            deduped_2_2 := 1 + deduped_3_2;
            deduped_1_2 := Sum( deduped_41_1{[ 1 .. deduped_3_2 ]} );
            return NTuple( 2, [ deduped_1_2 .. deduped_1_2 + deduped_41_1[deduped_2_2] - 1 ], List( deduped_12_1[deduped_2_2][2], function ( objC_3 )
                      return CreateCapCategoryMorphismWithAttributes( deduped_47_1, objC_3, objC_3, UnderlyingQuiverAlgebraElement, PathAsAlgebraElement( deduped_13_1, QuiverVertexAsIdentityPath( UnderlyingVertex( objC_3 ) ) ) );
                  end ) );
        end );
    hoisted_26_1 := Concatenation( List( deduped_43_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + i_2;
              hoisted_2_2 := deduped_15_1[deduped_3_2][1];
              hoisted_1_2 := deduped_19_1[deduped_3_2][1];
              return List( [ 0 .. deduped_8_1[deduped_3_2][1] - 1 ], function ( i_3 )
                      local hoisted_3_3, deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3;
                      deduped_7_3 := hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                      deduped_6_3 := 1 + deduped_7_3;
                      deduped_5_3 := deduped_39_1[deduped_6_3];
                      deduped_4_3 := Product( deduped_39_1{[ 1 .. deduped_7_3 ]} );
                      hoisted_3_3 := DivIntWithGivenQuotient( deduped_37_1, deduped_4_3, deduped_5_3 * Product( deduped_39_1{[ (deduped_6_3 + 1) .. deduped_24_1 ]} ) );
                      return List( deduped_36_1, function ( i_4 )
                              return RemIntWithDomain( QuoIntWithDomain( i_4, deduped_4_3, deduped_37_1 ), deduped_5_3, hoisted_3_3 );
                          end );
                  end );
          end ) );
    hoisted_22_1 := Concatenation( List( deduped_43_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2;
              deduped_10_2 := 1 + i_2;
              deduped_9_2 := deduped_19_1[deduped_10_2];
              deduped_8_2 := deduped_9_2[2];
              deduped_7_2 := deduped_15_1[deduped_10_2][2];
              hoisted_6_2 := List( deduped_8_2, function ( logic_new_func_x_3 )
                      return QuiverVertexAsIdentityPath( UnderlyingVertex( Source( logic_new_func_x_3 ) ) );
                  end );
              hoisted_5_2 := List( deduped_7_2, UnderlyingQuiverAlgebraElement );
              hoisted_4_2 := List( deduped_8_2, UnderlyingQuiverAlgebraElement );
              hoisted_3_2 := List( deduped_8_2, function ( logic_new_func_x_3 )
                      return UnderlyingVertex( Source( logic_new_func_x_3 ) );
                  end );
              hoisted_2_2 := List( deduped_7_2, function ( logic_new_func_x_3 )
                      return UnderlyingVertex( Target( logic_new_func_x_3 ) );
                  end );
              hoisted_1_2 := deduped_9_2[1];
              return List( [ 0 .. deduped_8_1[deduped_10_2][1] - 1 ], function ( i_3 )
                      local deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3, deduped_8_3;
                      deduped_8_3 := 1 + i_3;
                      deduped_7_3 := hoisted_3_2[deduped_8_3];
                      deduped_6_3 := 1 + hoisted_1_2[deduped_8_3];
                      deduped_5_3 := hoisted_2_2[deduped_6_3];
                      deduped_4_3 := hoisted_4_2[deduped_8_3] * hoisted_5_2[deduped_6_3];
                      if CAP_JIT_EXPR_CASE_WRAPPER( function (  )
                                  if deduped_5_3 = deduped_7_3 then
                                      return deduped_4_3 = PathAsAlgebraElement( deduped_13_1, hoisted_6_2[deduped_8_3] );
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_4_1[SafeUniquePositionProperty( deduped_45_1, function ( obj_4 )
                                         return (UnderlyingVertex( obj_4 ) = deduped_7_3);
                                     end )] - 1 ];
                      else
                          return deduped_21_1[SafeUniquePositionProperty( deduped_20_1, function ( mor_4 )
                                   if UnderlyingVertex( Source( mor_4 ) ) = deduped_7_3 and UnderlyingVertex( Range( mor_4 ) ) = deduped_5_3 then
                                       return UnderlyingQuiverAlgebraElement( mor_4 ) = deduped_4_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_27_1 := List( deduped_40_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_22_1[deduped_3_2];
            hoisted_1_2 := hoisted_26_1[deduped_3_2];
            return List( [ 0 .. deduped_10_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( Target( cat_1 ), Length, Length( Filtered( deduped_36_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_38_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_27_1[deduped_1_3][deduped_1_2] * deduped_29_1[deduped_1_3];
                        end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_38_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_35_1[deduped_1_3][deduped_1_2] * deduped_29_1[deduped_1_3];
                        end ) );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddHomomorphismStructureOnMorphismsWithGivenObjects( cat,
        
########
function ( cat_1, source_1, alpha_1, beta_1, range_1 )
    local deduped_1_1, deduped_2_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_10_1, deduped_12_1, deduped_13_1, deduped_15_1, hoisted_16_1, hoisted_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, hoisted_22_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, deduped_29_1, deduped_31_1, deduped_32_1, hoisted_33_1, hoisted_34_1, hoisted_35_1, deduped_36_1, deduped_37_1, hoisted_38_1, hoisted_39_1, hoisted_43_1, hoisted_44_1, hoisted_47_1, deduped_48_1, hoisted_49_1, hoisted_50_1, deduped_51_1, deduped_52_1, hoisted_53_1, deduped_56_1, hoisted_58_1, hoisted_59_1, hoisted_60_1, hoisted_61_1, deduped_62_1, deduped_63_1, deduped_64_1, hoisted_65_1, hoisted_66_1, deduped_67_1, hoisted_68_1, hoisted_69_1, hoisted_70_1, hoisted_71_1, deduped_72_1, deduped_74_1, deduped_75_1, hoisted_76_1, hoisted_77_1, hoisted_78_1, hoisted_79_1, hoisted_80_1, hoisted_81_1, deduped_82_1, deduped_83_1, deduped_84_1, deduped_85_1, deduped_86_1, deduped_87_1, deduped_88_1, deduped_89_1, deduped_90_1, deduped_91_1, deduped_92_1, deduped_93_1, deduped_94_1, deduped_95_1, deduped_96_1, deduped_97_1, deduped_98_1, deduped_99_1, deduped_100_1, deduped_101_1, deduped_102_1, deduped_103_1, deduped_104_1, deduped_105_1, deduped_106_1, deduped_107_1, deduped_108_1, deduped_109_1, deduped_110_1, deduped_111_1, deduped_112_1;
    deduped_112_1 := Source( cat_1 );
    deduped_111_1 := ListOfValues( ValuesOnAllObjects( alpha_1 ) );
    deduped_110_1 := ValuesOfPreSheaf( Source( beta_1 ) );
    deduped_109_1 := ValuesOfPreSheaf( Target( alpha_1 ) );
    deduped_108_1 := DefiningTripleOfUnderlyingQuiver( deduped_112_1 );
    deduped_107_1 := ValuesOfPreSheaf( Target( beta_1 ) );
    deduped_106_1 := SetOfObjects( deduped_112_1 );
    deduped_105_1 := ValuesOfPreSheaf( Source( alpha_1 ) );
    deduped_104_1 := deduped_109_1[2];
    deduped_103_1 := deduped_105_1[2];
    deduped_102_1 := deduped_108_1[1];
    deduped_101_1 := [ 1 .. deduped_102_1 ];
    deduped_100_1 := [ 0 .. deduped_102_1 - 1 ];
    deduped_99_1 := [ 0 .. deduped_108_1[2] - 1 ];
    deduped_36_1 := List( deduped_109_1[1], Length );
    deduped_98_1 := List( deduped_100_1, function ( o_2 )
            return deduped_36_1[1 + o_2];
        end );
    deduped_1_1 := List( deduped_105_1[1], Length );
    deduped_97_1 := List( deduped_100_1, function ( o_2 )
            return deduped_1_1[1 + o_2];
        end );
    deduped_96_1 := Sum( deduped_97_1 );
    deduped_5_1 := deduped_108_1[3];
    deduped_7_1 := List( deduped_99_1, function ( m_2 )
            return deduped_5_1[1 + m_2][1];
        end );
    deduped_6_1 := List( deduped_99_1, function ( m_2 )
            return deduped_5_1[1 + m_2][2];
        end );
    deduped_62_1 := List( deduped_99_1, function ( m_2 )
            local deduped_1_2, deduped_2_2;
            deduped_2_2 := 1 + m_2;
            deduped_1_2 := deduped_36_1[1 + deduped_6_1[deduped_2_2]];
            return NTuple( 2, deduped_1_2, ListWithIdenticalEntries( deduped_1_2, deduped_106_1[1 + deduped_7_1[deduped_2_2]] ) );
        end );
    deduped_95_1 := [ 0 .. Sum( List( deduped_99_1, function ( i_2 )
                    return deduped_62_1[1 + i_2][1];
                end ) ) - 1 ];
    deduped_94_1 := [ 0 .. deduped_96_1 - 1 ];
    deduped_8_1 := List( deduped_99_1, function ( m_2 )
            local deduped_1_2, deduped_2_2;
            deduped_2_2 := 1 + m_2;
            deduped_1_2 := deduped_1_1[1 + deduped_6_1[deduped_2_2]];
            return NTuple( 2, deduped_1_2, ListWithIdenticalEntries( deduped_1_2, deduped_106_1[1 + deduped_7_1[deduped_2_2]] ) );
        end );
    deduped_93_1 := [ 0 .. Sum( List( deduped_99_1, function ( i_2 )
                    return deduped_8_1[1 + i_2][1];
                end ) ) - 1 ];
    deduped_37_1 := List( deduped_110_1[1], Length );
    deduped_2_1 := List( deduped_106_1, UnderlyingVertex );
    deduped_92_1 := Concatenation( List( deduped_100_1, function ( o_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + o_2;
              hoisted_1_2 := deduped_2_1[deduped_2_2];
              return ListWithIdenticalEntries( deduped_36_1[deduped_2_2], deduped_37_1[SafeUniquePositionProperty( deduped_106_1, function ( obj_3 )
                         return UnderlyingVertex( obj_3 ) = hoisted_1_2;
                     end )] );
          end ) );
    deduped_91_1 := Concatenation( List( deduped_100_1, function ( o_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + o_2;
              hoisted_1_2 := deduped_2_1[deduped_2_2];
              return ListWithIdenticalEntries( deduped_1_1[deduped_2_2], deduped_37_1[SafeUniquePositionProperty( deduped_106_1, function ( obj_3 )
                         return UnderlyingVertex( obj_3 ) = hoisted_1_2;
                     end )] );
          end ) );
    deduped_4_1 := List( deduped_107_1[1], Length );
    deduped_90_1 := Concatenation( List( deduped_100_1, function ( o_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + o_2;
              hoisted_1_2 := deduped_2_1[deduped_2_2];
              return ListWithIdenticalEntries( deduped_1_1[deduped_2_2], deduped_4_1[SafeUniquePositionProperty( deduped_106_1, function ( obj_3 )
                         return UnderlyingVertex( obj_3 ) = hoisted_1_2;
                     end )] );
          end ) );
    deduped_89_1 := [ 0 .. Sum( List( deduped_99_1, function ( m_2 )
                    return deduped_36_1[1 + deduped_5_1[(1 + m_2)][2]];
                end ) ) - 1 ];
    deduped_88_1 := [ 0 .. Sum( List( deduped_99_1, function ( m_2 )
                    return deduped_1_1[1 + deduped_5_1[(1 + m_2)][2]];
                end ) ) - 1 ];
    deduped_87_1 := Product( deduped_92_1 );
    deduped_86_1 := Product( deduped_91_1 );
    deduped_85_1 := Product( deduped_90_1 );
    deduped_84_1 := [ 0 .. deduped_87_1 - 1 ];
    deduped_83_1 := [ 0 .. deduped_86_1 - 1 ];
    deduped_82_1 := [ 0 .. deduped_85_1 - 1 ];
    deduped_20_1 := SetOfGeneratingMorphisms( deduped_112_1 );
    deduped_32_1 := List( deduped_99_1, function ( m_2 )
            local deduped_1_2, deduped_2_2;
            deduped_2_2 := 1 + m_2;
            deduped_1_2 := deduped_1_1[1 + deduped_6_1[deduped_2_2]];
            return NTuple( 2, [ 0 .. deduped_1_2 - 1 ], ListWithIdenticalEntries( deduped_1_2, deduped_20_1[deduped_2_2] ) );
        end );
    deduped_13_1 := UnderlyingQuiverAlgebra( deduped_112_1 );
    deduped_12_1 := List( deduped_100_1, function ( o_2 )
            local deduped_1_2, deduped_2_2;
            deduped_2_2 := 1 + o_2;
            deduped_1_2 := deduped_1_1[deduped_2_2];
            return NTuple( 2, deduped_1_2, ListWithIdenticalEntries( deduped_1_2, deduped_106_1[deduped_2_2] ) );
        end );
    deduped_31_1 := List( deduped_99_1, function ( i_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := deduped_6_1[1 + i_2];
            deduped_2_2 := 1 + deduped_3_2;
            deduped_1_2 := Sum( deduped_97_1{[ 1 .. deduped_3_2 ]} );
            return NTuple( 2, [ deduped_1_2 .. deduped_1_2 + deduped_97_1[deduped_2_2] - 1 ], List( deduped_12_1[deduped_2_2][2], function ( objC_3 )
                      return CreateCapCategoryMorphismWithAttributes( deduped_112_1, objC_3, objC_3, UnderlyingQuiverAlgebraElement, PathAsAlgebraElement( deduped_13_1, QuiverVertexAsIdentityPath( UnderlyingVertex( objC_3 ) ) ) );
                  end ) );
        end );
    hoisted_34_1 := Concatenation( List( deduped_99_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + i_2;
              hoisted_2_2 := deduped_31_1[deduped_3_2][1];
              hoisted_1_2 := deduped_32_1[deduped_3_2][1];
              return List( [ 0 .. deduped_8_1[deduped_3_2][1] - 1 ], function ( i_3 )
                      local hoisted_3_3, deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3;
                      deduped_7_3 := hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                      deduped_6_3 := 1 + deduped_7_3;
                      deduped_5_3 := deduped_90_1[deduped_6_3];
                      deduped_4_3 := Product( deduped_90_1{[ 1 .. deduped_7_3 ]} );
                      hoisted_3_3 := DivIntWithGivenQuotient( deduped_85_1, deduped_4_3, deduped_5_3 * Product( deduped_90_1{[ (deduped_6_3 + 1) .. deduped_96_1 ]} ) );
                      return List( deduped_82_1, function ( i_4 )
                              return RemIntWithDomain( QuoIntWithDomain( i_4, deduped_4_3, deduped_85_1 ), deduped_5_3, hoisted_3_3 );
                          end );
                  end );
          end ) );
    deduped_21_1 := List( deduped_107_1[2], AsList );
    hoisted_33_1 := Concatenation( List( deduped_99_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2;
              deduped_10_2 := 1 + i_2;
              deduped_9_2 := deduped_32_1[deduped_10_2];
              deduped_8_2 := deduped_9_2[2];
              deduped_7_2 := deduped_31_1[deduped_10_2][2];
              hoisted_6_2 := List( deduped_8_2, function ( logic_new_func_x_3 )
                      return QuiverVertexAsIdentityPath( UnderlyingVertex( Source( logic_new_func_x_3 ) ) );
                  end );
              hoisted_5_2 := List( deduped_7_2, UnderlyingQuiverAlgebraElement );
              hoisted_4_2 := List( deduped_8_2, UnderlyingQuiverAlgebraElement );
              hoisted_3_2 := List( deduped_8_2, function ( logic_new_func_x_3 )
                      return UnderlyingVertex( Source( logic_new_func_x_3 ) );
                  end );
              hoisted_2_2 := List( deduped_7_2, function ( logic_new_func_x_3 )
                      return UnderlyingVertex( Target( logic_new_func_x_3 ) );
                  end );
              hoisted_1_2 := deduped_9_2[1];
              return List( [ 0 .. deduped_8_1[deduped_10_2][1] - 1 ], function ( i_3 )
                      local deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3, deduped_8_3;
                      deduped_8_3 := 1 + i_3;
                      deduped_7_3 := hoisted_3_2[deduped_8_3];
                      deduped_6_3 := 1 + hoisted_1_2[deduped_8_3];
                      deduped_5_3 := hoisted_2_2[deduped_6_3];
                      deduped_4_3 := hoisted_4_2[deduped_8_3] * hoisted_5_2[deduped_6_3];
                      if CAP_JIT_EXPR_CASE_WRAPPER( function (  )
                                  if deduped_5_3 = deduped_7_3 then
                                      return deduped_4_3 = PathAsAlgebraElement( deduped_13_1, hoisted_6_2[deduped_8_3] );
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_4_1[SafeUniquePositionProperty( deduped_106_1, function ( obj_4 )
                                         return (UnderlyingVertex( obj_4 ) = deduped_7_3);
                                     end )] - 1 ];
                      else
                          return deduped_21_1[SafeUniquePositionProperty( deduped_20_1, function ( mor_4 )
                                   if UnderlyingVertex( Source( mor_4 ) ) = deduped_7_3 and UnderlyingVertex( Range( mor_4 ) ) = deduped_5_3 then
                                       return UnderlyingQuiverAlgebraElement( mor_4 ) = deduped_4_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    deduped_10_1 := Concatenation( List( deduped_99_1, function ( i_2 )
              return ListWithIdenticalEntries( deduped_8_1[1 + i_2][1], deduped_85_1 );
          end ) );
    hoisted_35_1 := List( deduped_93_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_33_1[deduped_3_2];
            hoisted_1_2 := hoisted_34_1[deduped_3_2];
            return List( [ 0 .. deduped_10_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_28_1 := Concatenation( List( deduped_99_1, function ( m_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + m_2;
              hoisted_1_2 := deduped_2_1[1 + deduped_7_1[deduped_2_2]];
              return ListWithIdenticalEntries( deduped_1_1[1 + deduped_6_1[deduped_2_2]], deduped_4_1[SafeUniquePositionProperty( deduped_106_1, function ( obj_3 )
                         return UnderlyingVertex( obj_3 ) = hoisted_1_2;
                     end )] );
          end ) );
    deduped_29_1 := List( deduped_88_1, function ( j_2 )
            return Product( hoisted_28_1{[ 1 .. j_2 ]} );
        end );
    deduped_18_1 := List( deduped_106_1, function ( logic_new_func_x_2 )
            return QuiverVertexAsIdentityPath( UnderlyingVertex( logic_new_func_x_2 ) );
        end );
    hoisted_17_1 := List( deduped_103_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_16_1 := List( deduped_103_1, AsList );
    deduped_19_1 := List( deduped_99_1, function ( m_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := 1 + m_2;
            deduped_2_2 := 1 + deduped_7_1[deduped_3_2];
            deduped_1_2 := deduped_106_1[deduped_2_2];
            return NTuple( 2, hoisted_16_1[deduped_3_2], ListWithIdenticalEntries( hoisted_17_1[deduped_3_2], CreateCapCategoryMorphismWithAttributes( deduped_112_1, deduped_1_2, deduped_1_2, UnderlyingQuiverAlgebraElement, PathAsAlgebraElement( deduped_13_1, deduped_18_1[deduped_2_2] ) ) ) );
        end );
    deduped_15_1 := List( deduped_99_1, function ( i_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := deduped_7_1[1 + i_2];
            deduped_2_2 := 1 + deduped_3_2;
            deduped_1_2 := Sum( deduped_97_1{[ 1 .. deduped_3_2 ]} );
            return NTuple( 2, [ deduped_1_2 .. deduped_1_2 + deduped_97_1[deduped_2_2] - 1 ], List( deduped_12_1[deduped_2_2][2], function ( objC_3 )
                      return CreateCapCategoryMorphismWithAttributes( deduped_112_1, objC_3, objC_3, UnderlyingQuiverAlgebraElement, PathAsAlgebraElement( deduped_13_1, QuiverVertexAsIdentityPath( UnderlyingVertex( objC_3 ) ) ) );
                  end ) );
        end );
    hoisted_26_1 := Concatenation( List( deduped_99_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + i_2;
              hoisted_2_2 := deduped_15_1[deduped_3_2][1];
              hoisted_1_2 := deduped_19_1[deduped_3_2][1];
              return List( [ 0 .. deduped_8_1[deduped_3_2][1] - 1 ], function ( i_3 )
                      local hoisted_3_3, deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3;
                      deduped_7_3 := hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                      deduped_6_3 := 1 + deduped_7_3;
                      deduped_5_3 := deduped_90_1[deduped_6_3];
                      deduped_4_3 := Product( deduped_90_1{[ 1 .. deduped_7_3 ]} );
                      hoisted_3_3 := DivIntWithGivenQuotient( deduped_85_1, deduped_4_3, deduped_5_3 * Product( deduped_90_1{[ (deduped_6_3 + 1) .. deduped_96_1 ]} ) );
                      return List( deduped_82_1, function ( i_4 )
                              return RemIntWithDomain( QuoIntWithDomain( i_4, deduped_4_3, deduped_85_1 ), deduped_5_3, hoisted_3_3 );
                          end );
                  end );
          end ) );
    hoisted_22_1 := Concatenation( List( deduped_99_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2;
              deduped_10_2 := 1 + i_2;
              deduped_9_2 := deduped_19_1[deduped_10_2];
              deduped_8_2 := deduped_9_2[2];
              deduped_7_2 := deduped_15_1[deduped_10_2][2];
              hoisted_6_2 := List( deduped_8_2, function ( logic_new_func_x_3 )
                      return QuiverVertexAsIdentityPath( UnderlyingVertex( Source( logic_new_func_x_3 ) ) );
                  end );
              hoisted_5_2 := List( deduped_7_2, UnderlyingQuiverAlgebraElement );
              hoisted_4_2 := List( deduped_8_2, UnderlyingQuiverAlgebraElement );
              hoisted_3_2 := List( deduped_8_2, function ( logic_new_func_x_3 )
                      return UnderlyingVertex( Source( logic_new_func_x_3 ) );
                  end );
              hoisted_2_2 := List( deduped_7_2, function ( logic_new_func_x_3 )
                      return UnderlyingVertex( Target( logic_new_func_x_3 ) );
                  end );
              hoisted_1_2 := deduped_9_2[1];
              return List( [ 0 .. deduped_8_1[deduped_10_2][1] - 1 ], function ( i_3 )
                      local deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3, deduped_8_3;
                      deduped_8_3 := 1 + i_3;
                      deduped_7_3 := hoisted_3_2[deduped_8_3];
                      deduped_6_3 := 1 + hoisted_1_2[deduped_8_3];
                      deduped_5_3 := hoisted_2_2[deduped_6_3];
                      deduped_4_3 := hoisted_4_2[deduped_8_3] * hoisted_5_2[deduped_6_3];
                      if CAP_JIT_EXPR_CASE_WRAPPER( function (  )
                                  if deduped_5_3 = deduped_7_3 then
                                      return deduped_4_3 = PathAsAlgebraElement( deduped_13_1, hoisted_6_2[deduped_8_3] );
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_4_1[SafeUniquePositionProperty( deduped_106_1, function ( obj_4 )
                                         return (UnderlyingVertex( obj_4 ) = deduped_7_3);
                                     end )] - 1 ];
                      else
                          return deduped_21_1[SafeUniquePositionProperty( deduped_20_1, function ( mor_4 )
                                   if UnderlyingVertex( Source( mor_4 ) ) = deduped_7_3 and UnderlyingVertex( Range( mor_4 ) ) = deduped_5_3 then
                                       return UnderlyingQuiverAlgebraElement( mor_4 ) = deduped_4_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_27_1 := List( deduped_93_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_22_1[deduped_3_2];
            hoisted_1_2 := hoisted_26_1[deduped_3_2];
            return List( [ 0 .. deduped_10_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_81_1 := Filtered( deduped_82_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_88_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_27_1[deduped_1_3][deduped_1_2] * deduped_29_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_88_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_35_1[deduped_1_3][deduped_1_2] * deduped_29_1[deduped_1_3];
                    end ) );
        end );
    hoisted_44_1 := List( deduped_94_1, function ( j_2 )
            return Product( deduped_90_1{[ 1 .. j_2 ]} );
        end );
    hoisted_38_1 := List( ValuesOnAllObjects( beta_1 ), AsList );
    hoisted_39_1 := Concatenation( List( deduped_100_1, function ( o_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + o_2;
              hoisted_1_2 := deduped_2_1[deduped_2_2];
              return ListWithIdenticalEntries( deduped_1_1[deduped_2_2], hoisted_38_1[SafeUniquePositionProperty( deduped_106_1, function ( obj_3 )
                         return UnderlyingVertex( obj_3 ) = hoisted_1_2;
                     end )] );
          end ) );
    hoisted_43_1 := List( [ 1 .. deduped_96_1 ], function ( i_2 )
            local hoisted_3_2, hoisted_4_2, deduped_5_2, deduped_6_2;
            deduped_6_2 := deduped_91_1[i_2];
            deduped_5_2 := Product( deduped_91_1{[ 1 .. i_2 - 1 ]} );
            hoisted_4_2 := hoisted_39_1[i_2];
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_86_1, deduped_5_2, deduped_6_2 * Product( deduped_91_1{[ (i_2 + 1) .. deduped_96_1 ]} ) );
            return List( deduped_83_1, function ( i_3 )
                    return hoisted_4_2[1 + RemIntWithDomain( QuoIntWithDomain( i_3, deduped_5_2, deduped_86_1 ), deduped_6_2, hoisted_3_2 )];
                end );
        end );
    hoisted_61_1 := List( deduped_83_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_94_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_43_1[deduped_1_3][hoisted_1_2] * hoisted_44_1[deduped_1_3];
                end );
        end );
    hoisted_60_1 := List( deduped_94_1, function ( j_2 )
            return Product( deduped_91_1{[ 1 .. j_2 ]} );
        end );
    deduped_56_1 := Sum( deduped_98_1 );
    hoisted_50_1 := List( deduped_111_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_49_1 := List( deduped_111_1, AsList );
    deduped_51_1 := List( deduped_100_1, function ( o_2 )
            local deduped_1_2, deduped_2_2;
            deduped_2_2 := 1 + o_2;
            deduped_1_2 := deduped_106_1[deduped_2_2];
            return NTuple( 2, hoisted_49_1[deduped_2_2], ListWithIdenticalEntries( hoisted_50_1[deduped_2_2], CreateCapCategoryMorphismWithAttributes( deduped_112_1, deduped_1_2, deduped_1_2, UnderlyingQuiverAlgebraElement, PathAsAlgebraElement( deduped_13_1, deduped_18_1[deduped_2_2] ) ) ) );
        end );
    hoisted_58_1 := Concatenation( List( deduped_101_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := Sum( deduped_98_1{[ 1 .. i_2 - 1 ]} );
              hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_98_1[i_2] - 1 ];
              hoisted_1_2 := deduped_51_1[i_2][1];
              return List( [ 0 .. deduped_12_1[i_2][1] - 1 ], function ( i_3 )
                      local hoisted_3_3, deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3;
                      deduped_7_3 := hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                      deduped_6_3 := 1 + deduped_7_3;
                      deduped_5_3 := deduped_92_1[deduped_6_3];
                      deduped_4_3 := Product( deduped_92_1{[ 1 .. deduped_7_3 ]} );
                      hoisted_3_3 := DivIntWithGivenQuotient( deduped_87_1, deduped_4_3, deduped_5_3 * Product( deduped_92_1{[ (deduped_6_3 + 1) .. deduped_56_1 ]} ) );
                      return List( deduped_84_1, function ( i_4 )
                              return RemIntWithDomain( QuoIntWithDomain( i_4, deduped_4_3, deduped_87_1 ), deduped_5_3, hoisted_3_3 );
                          end );
                  end );
          end ) );
    deduped_52_1 := List( deduped_110_1[2], AsList );
    deduped_48_1 := List( deduped_100_1, function ( o_2 )
            local deduped_1_2, deduped_2_2;
            deduped_2_2 := 1 + o_2;
            deduped_1_2 := deduped_36_1[deduped_2_2];
            return NTuple( 2, deduped_1_2, ListWithIdenticalEntries( deduped_1_2, deduped_106_1[deduped_2_2] ) );
        end );
    hoisted_53_1 := Concatenation( List( deduped_101_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2, deduped_8_2, deduped_9_2;
              deduped_9_2 := deduped_51_1[i_2];
              deduped_8_2 := deduped_9_2[2];
              deduped_7_2 := deduped_48_1[i_2][2];
              hoisted_6_2 := List( deduped_8_2, function ( logic_new_func_x_3 )
                      return QuiverVertexAsIdentityPath( UnderlyingVertex( Source( logic_new_func_x_3 ) ) );
                  end );
              hoisted_5_2 := List( deduped_7_2, function ( objC_3 )
                      return PathAsAlgebraElement( deduped_13_1, QuiverVertexAsIdentityPath( UnderlyingVertex( objC_3 ) ) );
                  end );
              hoisted_4_2 := List( deduped_8_2, UnderlyingQuiverAlgebraElement );
              hoisted_3_2 := List( deduped_8_2, function ( logic_new_func_x_3 )
                      return UnderlyingVertex( Source( logic_new_func_x_3 ) );
                  end );
              hoisted_2_2 := List( deduped_7_2, UnderlyingVertex );
              hoisted_1_2 := deduped_9_2[1];
              return List( [ 0 .. deduped_12_1[i_2][1] - 1 ], function ( i_3 )
                      local deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3, deduped_8_3;
                      deduped_8_3 := 1 + i_3;
                      deduped_7_3 := hoisted_3_2[deduped_8_3];
                      deduped_6_3 := 1 + hoisted_1_2[deduped_8_3];
                      deduped_5_3 := hoisted_2_2[deduped_6_3];
                      deduped_4_3 := hoisted_4_2[deduped_8_3] * hoisted_5_2[deduped_6_3];
                      if CAP_JIT_EXPR_CASE_WRAPPER( function (  )
                                  if deduped_5_3 = deduped_7_3 then
                                      return deduped_4_3 = PathAsAlgebraElement( deduped_13_1, hoisted_6_2[deduped_8_3] );
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_37_1[SafeUniquePositionProperty( deduped_106_1, function ( obj_4 )
                                         return (UnderlyingVertex( obj_4 ) = deduped_7_3);
                                     end )] - 1 ];
                      else
                          return deduped_52_1[SafeUniquePositionProperty( deduped_20_1, function ( mor_4 )
                                   if UnderlyingVertex( Source( mor_4 ) ) = deduped_7_3 and UnderlyingVertex( Range( mor_4 ) ) = deduped_5_3 then
                                       return UnderlyingQuiverAlgebraElement( mor_4 ) = deduped_4_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_47_1 := Concatenation( List( deduped_101_1, function ( i_2 )
              return ListWithIdenticalEntries( deduped_12_1[i_2][1], deduped_87_1 );
          end ) );
    hoisted_59_1 := List( [ 0 .. Sum( List( deduped_101_1, function ( i_2 )
                      return deduped_12_1[i_2][1];
                  end ) ) - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_53_1[deduped_3_2];
            hoisted_1_2 := hoisted_58_1[deduped_3_2];
            return List( [ 0 .. hoisted_47_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_80_1 := List( deduped_84_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return hoisted_61_1[1 + Sum( deduped_94_1, function ( j_3 )
                       local deduped_1_3;
                       deduped_1_3 := (1 + j_3);
                       return hoisted_59_1[deduped_1_3][hoisted_1_2] * hoisted_60_1[deduped_1_3];
                   end )];
        end );
    deduped_75_1 := List( deduped_99_1, function ( m_2 )
            local deduped_1_2, deduped_2_2;
            deduped_2_2 := 1 + m_2;
            deduped_1_2 := deduped_36_1[1 + deduped_6_1[deduped_2_2]];
            return NTuple( 2, [ 0 .. deduped_1_2 - 1 ], ListWithIdenticalEntries( deduped_1_2, deduped_20_1[deduped_2_2] ) );
        end );
    deduped_74_1 := List( deduped_99_1, function ( i_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := deduped_6_1[1 + i_2];
            deduped_2_2 := 1 + deduped_3_2;
            deduped_1_2 := Sum( deduped_98_1{[ 1 .. deduped_3_2 ]} );
            return NTuple( 2, [ deduped_1_2 .. deduped_1_2 + deduped_98_1[deduped_2_2] - 1 ], List( deduped_48_1[deduped_2_2][2], function ( objC_3 )
                      return CreateCapCategoryMorphismWithAttributes( deduped_112_1, objC_3, objC_3, UnderlyingQuiverAlgebraElement, PathAsAlgebraElement( deduped_13_1, QuiverVertexAsIdentityPath( UnderlyingVertex( objC_3 ) ) ) );
                  end ) );
        end );
    hoisted_77_1 := Concatenation( List( deduped_99_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + i_2;
              hoisted_2_2 := deduped_74_1[deduped_3_2][1];
              hoisted_1_2 := deduped_75_1[deduped_3_2][1];
              return List( [ 0 .. deduped_62_1[deduped_3_2][1] - 1 ], function ( i_3 )
                      local hoisted_3_3, deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3;
                      deduped_7_3 := hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                      deduped_6_3 := 1 + deduped_7_3;
                      deduped_5_3 := deduped_92_1[deduped_6_3];
                      deduped_4_3 := Product( deduped_92_1{[ 1 .. deduped_7_3 ]} );
                      hoisted_3_3 := DivIntWithGivenQuotient( deduped_87_1, deduped_4_3, deduped_5_3 * Product( deduped_92_1{[ (deduped_6_3 + 1) .. deduped_56_1 ]} ) );
                      return List( deduped_84_1, function ( i_4 )
                              return RemIntWithDomain( QuoIntWithDomain( i_4, deduped_4_3, deduped_87_1 ), deduped_5_3, hoisted_3_3 );
                          end );
                  end );
          end ) );
    hoisted_76_1 := Concatenation( List( deduped_99_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2;
              deduped_10_2 := 1 + i_2;
              deduped_9_2 := deduped_75_1[deduped_10_2];
              deduped_8_2 := deduped_9_2[2];
              deduped_7_2 := deduped_74_1[deduped_10_2][2];
              hoisted_6_2 := List( deduped_8_2, function ( logic_new_func_x_3 )
                      return QuiverVertexAsIdentityPath( UnderlyingVertex( Source( logic_new_func_x_3 ) ) );
                  end );
              hoisted_5_2 := List( deduped_7_2, UnderlyingQuiverAlgebraElement );
              hoisted_4_2 := List( deduped_8_2, UnderlyingQuiverAlgebraElement );
              hoisted_3_2 := List( deduped_8_2, function ( logic_new_func_x_3 )
                      return UnderlyingVertex( Source( logic_new_func_x_3 ) );
                  end );
              hoisted_2_2 := List( deduped_7_2, function ( logic_new_func_x_3 )
                      return UnderlyingVertex( Target( logic_new_func_x_3 ) );
                  end );
              hoisted_1_2 := deduped_9_2[1];
              return List( [ 0 .. deduped_62_1[deduped_10_2][1] - 1 ], function ( i_3 )
                      local deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3, deduped_8_3;
                      deduped_8_3 := 1 + i_3;
                      deduped_7_3 := hoisted_3_2[deduped_8_3];
                      deduped_6_3 := 1 + hoisted_1_2[deduped_8_3];
                      deduped_5_3 := hoisted_2_2[deduped_6_3];
                      deduped_4_3 := hoisted_4_2[deduped_8_3] * hoisted_5_2[deduped_6_3];
                      if CAP_JIT_EXPR_CASE_WRAPPER( function (  )
                                  if deduped_5_3 = deduped_7_3 then
                                      return deduped_4_3 = PathAsAlgebraElement( deduped_13_1, hoisted_6_2[deduped_8_3] );
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_37_1[SafeUniquePositionProperty( deduped_106_1, function ( obj_4 )
                                         return (UnderlyingVertex( obj_4 ) = deduped_7_3);
                                     end )] - 1 ];
                      else
                          return deduped_52_1[SafeUniquePositionProperty( deduped_20_1, function ( mor_4 )
                                   if UnderlyingVertex( Source( mor_4 ) ) = deduped_7_3 and UnderlyingVertex( Range( mor_4 ) ) = deduped_5_3 then
                                       return UnderlyingQuiverAlgebraElement( mor_4 ) = deduped_4_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    deduped_63_1 := Concatenation( List( deduped_99_1, function ( i_2 )
              return ListWithIdenticalEntries( deduped_62_1[1 + i_2][1], deduped_87_1 );
          end ) );
    hoisted_78_1 := List( deduped_95_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_76_1[deduped_3_2];
            hoisted_1_2 := hoisted_77_1[deduped_3_2];
            return List( [ 0 .. deduped_63_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_71_1 := Concatenation( List( deduped_99_1, function ( m_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + m_2;
              hoisted_1_2 := deduped_2_1[1 + deduped_7_1[deduped_2_2]];
              return ListWithIdenticalEntries( deduped_36_1[1 + deduped_6_1[deduped_2_2]], deduped_37_1[SafeUniquePositionProperty( deduped_106_1, function ( obj_3 )
                         return UnderlyingVertex( obj_3 ) = hoisted_1_2;
                     end )] );
          end ) );
    deduped_72_1 := List( deduped_89_1, function ( j_2 )
            return Product( hoisted_71_1{[ 1 .. j_2 ]} );
        end );
    hoisted_66_1 := List( deduped_104_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_65_1 := List( deduped_104_1, AsList );
    deduped_67_1 := List( deduped_99_1, function ( m_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := 1 + m_2;
            deduped_2_2 := 1 + deduped_7_1[deduped_3_2];
            deduped_1_2 := deduped_106_1[deduped_2_2];
            return NTuple( 2, hoisted_65_1[deduped_3_2], ListWithIdenticalEntries( hoisted_66_1[deduped_3_2], CreateCapCategoryMorphismWithAttributes( deduped_112_1, deduped_1_2, deduped_1_2, UnderlyingQuiverAlgebraElement, PathAsAlgebraElement( deduped_13_1, deduped_18_1[deduped_2_2] ) ) ) );
        end );
    deduped_64_1 := List( deduped_99_1, function ( i_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := deduped_7_1[1 + i_2];
            deduped_2_2 := 1 + deduped_3_2;
            deduped_1_2 := Sum( deduped_98_1{[ 1 .. deduped_3_2 ]} );
            return NTuple( 2, [ deduped_1_2 .. deduped_1_2 + deduped_98_1[deduped_2_2] - 1 ], List( deduped_48_1[deduped_2_2][2], function ( objC_3 )
                      return CreateCapCategoryMorphismWithAttributes( deduped_112_1, objC_3, objC_3, UnderlyingQuiverAlgebraElement, PathAsAlgebraElement( deduped_13_1, QuiverVertexAsIdentityPath( UnderlyingVertex( objC_3 ) ) ) );
                  end ) );
        end );
    hoisted_69_1 := Concatenation( List( deduped_99_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + i_2;
              hoisted_2_2 := deduped_64_1[deduped_3_2][1];
              hoisted_1_2 := deduped_67_1[deduped_3_2][1];
              return List( [ 0 .. deduped_62_1[deduped_3_2][1] - 1 ], function ( i_3 )
                      local hoisted_3_3, deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3;
                      deduped_7_3 := hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                      deduped_6_3 := 1 + deduped_7_3;
                      deduped_5_3 := deduped_92_1[deduped_6_3];
                      deduped_4_3 := Product( deduped_92_1{[ 1 .. deduped_7_3 ]} );
                      hoisted_3_3 := DivIntWithGivenQuotient( deduped_87_1, deduped_4_3, deduped_5_3 * Product( deduped_92_1{[ (deduped_6_3 + 1) .. deduped_56_1 ]} ) );
                      return List( deduped_84_1, function ( i_4 )
                              return RemIntWithDomain( QuoIntWithDomain( i_4, deduped_4_3, deduped_87_1 ), deduped_5_3, hoisted_3_3 );
                          end );
                  end );
          end ) );
    hoisted_68_1 := Concatenation( List( deduped_99_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2;
              deduped_10_2 := 1 + i_2;
              deduped_9_2 := deduped_67_1[deduped_10_2];
              deduped_8_2 := deduped_9_2[2];
              deduped_7_2 := deduped_64_1[deduped_10_2][2];
              hoisted_6_2 := List( deduped_8_2, function ( logic_new_func_x_3 )
                      return QuiverVertexAsIdentityPath( UnderlyingVertex( Source( logic_new_func_x_3 ) ) );
                  end );
              hoisted_5_2 := List( deduped_7_2, UnderlyingQuiverAlgebraElement );
              hoisted_4_2 := List( deduped_8_2, UnderlyingQuiverAlgebraElement );
              hoisted_3_2 := List( deduped_8_2, function ( logic_new_func_x_3 )
                      return UnderlyingVertex( Source( logic_new_func_x_3 ) );
                  end );
              hoisted_2_2 := List( deduped_7_2, function ( logic_new_func_x_3 )
                      return UnderlyingVertex( Target( logic_new_func_x_3 ) );
                  end );
              hoisted_1_2 := deduped_9_2[1];
              return List( [ 0 .. deduped_62_1[deduped_10_2][1] - 1 ], function ( i_3 )
                      local deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3, deduped_8_3;
                      deduped_8_3 := 1 + i_3;
                      deduped_7_3 := hoisted_3_2[deduped_8_3];
                      deduped_6_3 := 1 + hoisted_1_2[deduped_8_3];
                      deduped_5_3 := hoisted_2_2[deduped_6_3];
                      deduped_4_3 := hoisted_4_2[deduped_8_3] * hoisted_5_2[deduped_6_3];
                      if CAP_JIT_EXPR_CASE_WRAPPER( function (  )
                                  if deduped_5_3 = deduped_7_3 then
                                      return deduped_4_3 = PathAsAlgebraElement( deduped_13_1, hoisted_6_2[deduped_8_3] );
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_37_1[SafeUniquePositionProperty( deduped_106_1, function ( obj_4 )
                                         return (UnderlyingVertex( obj_4 ) = deduped_7_3);
                                     end )] - 1 ];
                      else
                          return deduped_52_1[SafeUniquePositionProperty( deduped_20_1, function ( mor_4 )
                                   if UnderlyingVertex( Source( mor_4 ) ) = deduped_7_3 and UnderlyingVertex( Range( mor_4 ) ) = deduped_5_3 then
                                       return UnderlyingQuiverAlgebraElement( mor_4 ) = deduped_4_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_70_1 := List( deduped_95_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_68_1[deduped_3_2];
            hoisted_1_2 := hoisted_69_1[deduped_3_2];
            return List( [ 0 .. deduped_63_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_79_1 := Filtered( deduped_84_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_89_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_70_1[deduped_1_3][deduped_1_2] * deduped_72_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_89_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_78_1[deduped_1_3][deduped_1_2] * deduped_72_1[deduped_1_3];
                    end ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( Target( cat_1 ), source_1, range_1, AsList, List( [ 0 .. Length( source_1 ) - 1 ], function ( x_2 )
              return -1 + BigInt( SafePosition( hoisted_81_1, CAP_JIT_INCOMPLETE_LOGIC( hoisted_80_1[(1 + hoisted_79_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))])] ) ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local deduped_3_1, deduped_4_1, deduped_5_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_13_1, deduped_15_1, deduped_16_1, deduped_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, deduped_22_1, deduped_23_1, deduped_24_1, hoisted_25_1, deduped_27_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, deduped_32_1, deduped_34_1, deduped_35_1, hoisted_36_1, hoisted_37_1, hoisted_38_1, deduped_39_1, hoisted_40_1, hoisted_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1;
    deduped_61_1 := ValuesOfPreSheaf( range_1 );
    deduped_60_1 := ValuesOfPreSheaf( source_1 );
    deduped_59_1 := Source( cat_1 );
    deduped_58_1 := deduped_60_1[2];
    deduped_57_1 := SetOfObjects( deduped_59_1 );
    deduped_56_1 := deduped_61_1[1];
    deduped_55_1 := deduped_60_1[1];
    deduped_54_1 := DefiningTripleOfUnderlyingQuiver( deduped_59_1 );
    deduped_53_1 := ListOfValues( deduped_55_1 );
    deduped_52_1 := deduped_54_1[1];
    deduped_51_1 := [ 1 .. deduped_52_1 ];
    deduped_50_1 := [ 0 .. deduped_52_1 - 1 ];
    deduped_49_1 := [ 0 .. deduped_54_1[2] - 1 ];
    deduped_4_1 := List( deduped_55_1, Length );
    deduped_48_1 := List( deduped_50_1, function ( o_2 )
            return deduped_4_1[1 + o_2];
        end );
    deduped_8_1 := deduped_54_1[3];
    deduped_10_1 := List( deduped_49_1, function ( m_2 )
            return deduped_8_1[1 + m_2][1];
        end );
    deduped_9_1 := List( deduped_49_1, function ( m_2 )
            return deduped_8_1[1 + m_2][2];
        end );
    deduped_11_1 := List( deduped_49_1, function ( m_2 )
            local deduped_1_2, deduped_2_2;
            deduped_2_2 := 1 + m_2;
            deduped_1_2 := deduped_4_1[1 + deduped_9_1[deduped_2_2]];
            return NTuple( 2, deduped_1_2, ListWithIdenticalEntries( deduped_1_2, deduped_57_1[1 + deduped_10_1[deduped_2_2]] ) );
        end );
    deduped_47_1 := [ 0 .. Sum( List( deduped_49_1, function ( i_2 )
                    return deduped_11_1[1 + i_2][1];
                end ) ) - 1 ];
    deduped_7_1 := List( deduped_56_1, Length );
    deduped_5_1 := List( deduped_57_1, UnderlyingVertex );
    deduped_46_1 := Concatenation( List( deduped_50_1, function ( o_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + o_2;
              hoisted_1_2 := deduped_5_1[deduped_2_2];
              return ListWithIdenticalEntries( deduped_4_1[deduped_2_2], deduped_7_1[SafeUniquePositionProperty( deduped_57_1, function ( obj_3 )
                         return UnderlyingVertex( obj_3 ) = hoisted_1_2;
                     end )] );
          end ) );
    deduped_45_1 := [ 0 .. Sum( List( deduped_49_1, function ( m_2 )
                    return deduped_4_1[1 + deduped_8_1[(1 + m_2)][2]];
                end ) ) - 1 ];
    deduped_44_1 := Product( deduped_46_1 );
    deduped_43_1 := [ 0 .. deduped_44_1 - 1 ];
    hoisted_42_1 := Target( cat_1 );
    deduped_23_1 := SetOfGeneratingMorphisms( deduped_59_1 );
    deduped_35_1 := List( deduped_49_1, function ( m_2 )
            local deduped_1_2, deduped_2_2;
            deduped_2_2 := 1 + m_2;
            deduped_1_2 := deduped_4_1[1 + deduped_9_1[deduped_2_2]];
            return NTuple( 2, [ 0 .. deduped_1_2 - 1 ], ListWithIdenticalEntries( deduped_1_2, deduped_23_1[deduped_2_2] ) );
        end );
    deduped_16_1 := UnderlyingQuiverAlgebra( deduped_59_1 );
    deduped_15_1 := List( deduped_50_1, function ( o_2 )
            local deduped_1_2, deduped_2_2;
            deduped_2_2 := 1 + o_2;
            deduped_1_2 := deduped_4_1[deduped_2_2];
            return NTuple( 2, deduped_1_2, ListWithIdenticalEntries( deduped_1_2, deduped_57_1[deduped_2_2] ) );
        end );
    deduped_34_1 := List( deduped_49_1, function ( i_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := deduped_9_1[1 + i_2];
            deduped_2_2 := 1 + deduped_3_2;
            deduped_1_2 := Sum( deduped_48_1{[ 1 .. deduped_3_2 ]} );
            return NTuple( 2, [ deduped_1_2 .. deduped_1_2 + deduped_48_1[deduped_2_2] - 1 ], List( deduped_15_1[deduped_2_2][2], function ( objC_3 )
                      return CreateCapCategoryMorphismWithAttributes( deduped_59_1, objC_3, objC_3, UnderlyingQuiverAlgebraElement, PathAsAlgebraElement( deduped_16_1, QuiverVertexAsIdentityPath( UnderlyingVertex( objC_3 ) ) ) );
                  end ) );
        end );
    deduped_27_1 := Sum( deduped_48_1 );
    hoisted_37_1 := Concatenation( List( deduped_49_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + i_2;
              hoisted_2_2 := deduped_34_1[deduped_3_2][1];
              hoisted_1_2 := deduped_35_1[deduped_3_2][1];
              return List( [ 0 .. deduped_11_1[deduped_3_2][1] - 1 ], function ( i_3 )
                      local hoisted_3_3, deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3;
                      deduped_7_3 := hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                      deduped_6_3 := 1 + deduped_7_3;
                      deduped_5_3 := deduped_46_1[deduped_6_3];
                      deduped_4_3 := Product( deduped_46_1{[ 1 .. deduped_7_3 ]} );
                      hoisted_3_3 := DivIntWithGivenQuotient( deduped_44_1, deduped_4_3, deduped_5_3 * Product( deduped_46_1{[ (deduped_6_3 + 1) .. deduped_27_1 ]} ) );
                      return List( deduped_43_1, function ( i_4 )
                              return RemIntWithDomain( QuoIntWithDomain( i_4, deduped_4_3, deduped_44_1 ), deduped_5_3, hoisted_3_3 );
                          end );
                  end );
          end ) );
    deduped_24_1 := List( deduped_61_1[2], AsList );
    hoisted_36_1 := Concatenation( List( deduped_49_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2;
              deduped_10_2 := 1 + i_2;
              deduped_9_2 := deduped_35_1[deduped_10_2];
              deduped_8_2 := deduped_9_2[2];
              deduped_7_2 := deduped_34_1[deduped_10_2][2];
              hoisted_6_2 := List( deduped_8_2, function ( logic_new_func_x_3 )
                      return QuiverVertexAsIdentityPath( UnderlyingVertex( Source( logic_new_func_x_3 ) ) );
                  end );
              hoisted_5_2 := List( deduped_7_2, UnderlyingQuiverAlgebraElement );
              hoisted_4_2 := List( deduped_8_2, UnderlyingQuiverAlgebraElement );
              hoisted_3_2 := List( deduped_8_2, function ( logic_new_func_x_3 )
                      return UnderlyingVertex( Source( logic_new_func_x_3 ) );
                  end );
              hoisted_2_2 := List( deduped_7_2, function ( logic_new_func_x_3 )
                      return UnderlyingVertex( Target( logic_new_func_x_3 ) );
                  end );
              hoisted_1_2 := deduped_9_2[1];
              return List( [ 0 .. deduped_11_1[deduped_10_2][1] - 1 ], function ( i_3 )
                      local deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3, deduped_8_3;
                      deduped_8_3 := 1 + i_3;
                      deduped_7_3 := hoisted_3_2[deduped_8_3];
                      deduped_6_3 := 1 + hoisted_1_2[deduped_8_3];
                      deduped_5_3 := hoisted_2_2[deduped_6_3];
                      deduped_4_3 := hoisted_4_2[deduped_8_3] * hoisted_5_2[deduped_6_3];
                      if CAP_JIT_EXPR_CASE_WRAPPER( function (  )
                                  if deduped_5_3 = deduped_7_3 then
                                      return deduped_4_3 = PathAsAlgebraElement( deduped_16_1, hoisted_6_2[deduped_8_3] );
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_7_1[SafeUniquePositionProperty( deduped_57_1, function ( obj_4 )
                                         return (UnderlyingVertex( obj_4 ) = deduped_7_3);
                                     end )] - 1 ];
                      else
                          return deduped_24_1[SafeUniquePositionProperty( deduped_23_1, function ( mor_4 )
                                   if UnderlyingVertex( Source( mor_4 ) ) = deduped_7_3 and UnderlyingVertex( Range( mor_4 ) ) = deduped_5_3 then
                                       return UnderlyingQuiverAlgebraElement( mor_4 ) = deduped_4_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    deduped_13_1 := Concatenation( List( deduped_49_1, function ( i_2 )
              return ListWithIdenticalEntries( deduped_11_1[1 + i_2][1], deduped_44_1 );
          end ) );
    hoisted_38_1 := List( deduped_47_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_36_1[deduped_3_2];
            hoisted_1_2 := hoisted_37_1[deduped_3_2];
            return List( [ 0 .. deduped_13_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_31_1 := Concatenation( List( deduped_49_1, function ( m_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + m_2;
              hoisted_1_2 := deduped_5_1[1 + deduped_10_1[deduped_2_2]];
              return ListWithIdenticalEntries( deduped_4_1[1 + deduped_9_1[deduped_2_2]], deduped_7_1[SafeUniquePositionProperty( deduped_57_1, function ( obj_3 )
                         return UnderlyingVertex( obj_3 ) = hoisted_1_2;
                     end )] );
          end ) );
    deduped_32_1 := List( deduped_45_1, function ( j_2 )
            return Product( hoisted_31_1{[ 1 .. j_2 ]} );
        end );
    hoisted_21_1 := List( deduped_57_1, function ( logic_new_func_x_2 )
            return QuiverVertexAsIdentityPath( UnderlyingVertex( logic_new_func_x_2 ) );
        end );
    hoisted_20_1 := List( deduped_58_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_19_1 := List( deduped_58_1, AsList );
    deduped_22_1 := List( deduped_49_1, function ( m_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := 1 + m_2;
            deduped_2_2 := 1 + deduped_10_1[deduped_3_2];
            deduped_1_2 := deduped_57_1[deduped_2_2];
            return NTuple( 2, hoisted_19_1[deduped_3_2], ListWithIdenticalEntries( hoisted_20_1[deduped_3_2], CreateCapCategoryMorphismWithAttributes( deduped_59_1, deduped_1_2, deduped_1_2, UnderlyingQuiverAlgebraElement, PathAsAlgebraElement( deduped_16_1, hoisted_21_1[deduped_2_2] ) ) ) );
        end );
    deduped_18_1 := List( deduped_49_1, function ( i_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := deduped_10_1[1 + i_2];
            deduped_2_2 := 1 + deduped_3_2;
            deduped_1_2 := Sum( deduped_48_1{[ 1 .. deduped_3_2 ]} );
            return NTuple( 2, [ deduped_1_2 .. deduped_1_2 + deduped_48_1[deduped_2_2] - 1 ], List( deduped_15_1[deduped_2_2][2], function ( objC_3 )
                      return CreateCapCategoryMorphismWithAttributes( deduped_59_1, objC_3, objC_3, UnderlyingQuiverAlgebraElement, PathAsAlgebraElement( deduped_16_1, QuiverVertexAsIdentityPath( UnderlyingVertex( objC_3 ) ) ) );
                  end ) );
        end );
    hoisted_29_1 := Concatenation( List( deduped_49_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + i_2;
              hoisted_2_2 := deduped_18_1[deduped_3_2][1];
              hoisted_1_2 := deduped_22_1[deduped_3_2][1];
              return List( [ 0 .. deduped_11_1[deduped_3_2][1] - 1 ], function ( i_3 )
                      local hoisted_3_3, deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3;
                      deduped_7_3 := hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                      deduped_6_3 := 1 + deduped_7_3;
                      deduped_5_3 := deduped_46_1[deduped_6_3];
                      deduped_4_3 := Product( deduped_46_1{[ 1 .. deduped_7_3 ]} );
                      hoisted_3_3 := DivIntWithGivenQuotient( deduped_44_1, deduped_4_3, deduped_5_3 * Product( deduped_46_1{[ (deduped_6_3 + 1) .. deduped_27_1 ]} ) );
                      return List( deduped_43_1, function ( i_4 )
                              return RemIntWithDomain( QuoIntWithDomain( i_4, deduped_4_3, deduped_44_1 ), deduped_5_3, hoisted_3_3 );
                          end );
                  end );
          end ) );
    hoisted_25_1 := Concatenation( List( deduped_49_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2;
              deduped_10_2 := 1 + i_2;
              deduped_9_2 := deduped_22_1[deduped_10_2];
              deduped_8_2 := deduped_9_2[2];
              deduped_7_2 := deduped_18_1[deduped_10_2][2];
              hoisted_6_2 := List( deduped_8_2, function ( logic_new_func_x_3 )
                      return QuiverVertexAsIdentityPath( UnderlyingVertex( Source( logic_new_func_x_3 ) ) );
                  end );
              hoisted_5_2 := List( deduped_7_2, UnderlyingQuiverAlgebraElement );
              hoisted_4_2 := List( deduped_8_2, UnderlyingQuiverAlgebraElement );
              hoisted_3_2 := List( deduped_8_2, function ( logic_new_func_x_3 )
                      return UnderlyingVertex( Source( logic_new_func_x_3 ) );
                  end );
              hoisted_2_2 := List( deduped_7_2, function ( logic_new_func_x_3 )
                      return UnderlyingVertex( Target( logic_new_func_x_3 ) );
                  end );
              hoisted_1_2 := deduped_9_2[1];
              return List( [ 0 .. deduped_11_1[deduped_10_2][1] - 1 ], function ( i_3 )
                      local deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3, deduped_8_3;
                      deduped_8_3 := 1 + i_3;
                      deduped_7_3 := hoisted_3_2[deduped_8_3];
                      deduped_6_3 := 1 + hoisted_1_2[deduped_8_3];
                      deduped_5_3 := hoisted_2_2[deduped_6_3];
                      deduped_4_3 := hoisted_4_2[deduped_8_3] * hoisted_5_2[deduped_6_3];
                      if CAP_JIT_EXPR_CASE_WRAPPER( function (  )
                                  if deduped_5_3 = deduped_7_3 then
                                      return deduped_4_3 = PathAsAlgebraElement( deduped_16_1, hoisted_6_2[deduped_8_3] );
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_7_1[SafeUniquePositionProperty( deduped_57_1, function ( obj_4 )
                                         return (UnderlyingVertex( obj_4 ) = deduped_7_3);
                                     end )] - 1 ];
                      else
                          return deduped_24_1[SafeUniquePositionProperty( deduped_23_1, function ( mor_4 )
                                   if UnderlyingVertex( Source( mor_4 ) ) = deduped_7_3 and UnderlyingVertex( Range( mor_4 ) ) = deduped_5_3 then
                                       return UnderlyingQuiverAlgebraElement( mor_4 ) = deduped_4_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_30_1 := List( deduped_47_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_25_1[deduped_3_2];
            hoisted_1_2 := hoisted_29_1[deduped_3_2];
            return List( [ 0 .. deduped_13_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_40_1 := CAP_JIT_INCOMPLETE_LOGIC( Filtered( deduped_43_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_45_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_30_1[deduped_1_3][deduped_1_2] * deduped_32_1[deduped_1_3];
                        end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_45_1, function ( j_3 )
                            local deduped_1_3;
                            deduped_1_3 := 1 + j_3;
                            return hoisted_38_1[deduped_1_3][deduped_1_2] * deduped_32_1[deduped_1_3];
                        end ) );
            end )[1 + AsList( alpha_1 )[(1 + CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. (Length( Source( alpha_1 ) ) - 1) ][1] ))]] );
    deduped_3_1 := List( deduped_53_1, Length );
    deduped_39_1 := List( deduped_51_1, function ( i_2 )
            return Product( deduped_46_1{[ 1 + Sum( deduped_3_1{[ 1 .. (i_2 - 1) ]} ) .. Sum( deduped_3_1{[ 1 .. i_2 ]} ) ]} );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, ValuesOnAllObjects, List( deduped_51_1, function ( i_2 )
              local hoisted_1_2, hoisted_3_2, deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
              deduped_6_2 := deduped_3_1[i_2];
              deduped_5_2 := deduped_39_1[deduped_7_2];
              deduped_4_2 := Product( deduped_39_1{[ 1 .. deduped_7_2 - 1 ]} );
              hoisted_3_2 := deduped_7_1[i_2];
              hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( QuoIntWithDomain( hoisted_40_1, deduped_4_2, deduped_44_1 ), deduped_5_2, DivIntWithGivenQuotient( deduped_44_1, deduped_4_2, deduped_5_2 * Product( deduped_39_1{[ (deduped_7_2 + 1) .. deduped_52_1 ]} ) ) ) );
              return CreateCapCategoryMorphismWithAttributes( hoisted_42_1, deduped_53_1[i_2], deduped_56_1[i_2], AsList, List( [ 0 .. deduped_6_2 - 1 ], function ( i_3 )
                        return DigitInPositionalNotation( hoisted_1_2, i_3, deduped_6_2, hoisted_3_2 );
                    end ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_10_1, deduped_12_1, deduped_13_1, deduped_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, deduped_19_1, deduped_20_1, deduped_21_1, hoisted_22_1, deduped_24_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, deduped_29_1, deduped_31_1, deduped_32_1, hoisted_33_1, hoisted_34_1, hoisted_35_1, deduped_38_1, deduped_39_1, hoisted_41_1, hoisted_43_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1;
    deduped_64_1 := ValuesOfPreSheaf( arg3_1 );
    deduped_63_1 := ValuesOfPreSheaf( arg2_1 );
    deduped_62_1 := Source( cat_1 );
    deduped_61_1 := deduped_63_1[2];
    deduped_60_1 := deduped_64_1[1];
    deduped_59_1 := SetOfObjects( deduped_62_1 );
    deduped_58_1 := deduped_63_1[1];
    deduped_57_1 := DefiningTripleOfUnderlyingQuiver( deduped_62_1 );
    deduped_56_1 := ListOfValues( deduped_58_1 );
    deduped_55_1 := deduped_57_1[1];
    deduped_54_1 := [ 1 .. deduped_55_1 ];
    deduped_53_1 := [ 0 .. deduped_57_1[2] - 1 ];
    deduped_52_1 := [ 0 .. deduped_55_1 - 1 ];
    deduped_1_1 := List( deduped_58_1, Length );
    deduped_51_1 := List( deduped_52_1, function ( o_2 )
            return deduped_1_1[1 + o_2];
        end );
    deduped_5_1 := deduped_57_1[3];
    deduped_7_1 := List( deduped_53_1, function ( m_2 )
            return deduped_5_1[1 + m_2][1];
        end );
    deduped_6_1 := List( deduped_53_1, function ( m_2 )
            return deduped_5_1[1 + m_2][2];
        end );
    deduped_8_1 := List( deduped_53_1, function ( m_2 )
            local deduped_1_2, deduped_2_2;
            deduped_2_2 := 1 + m_2;
            deduped_1_2 := deduped_1_1[1 + deduped_6_1[deduped_2_2]];
            return NTuple( 2, deduped_1_2, ListWithIdenticalEntries( deduped_1_2, deduped_59_1[1 + deduped_7_1[deduped_2_2]] ) );
        end );
    deduped_50_1 := [ 0 .. Sum( List( deduped_53_1, function ( i_2 )
                    return deduped_8_1[1 + i_2][1];
                end ) ) - 1 ];
    deduped_4_1 := List( deduped_60_1, Length );
    deduped_2_1 := List( deduped_59_1, UnderlyingVertex );
    deduped_49_1 := Concatenation( List( deduped_52_1, function ( o_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + o_2;
              hoisted_1_2 := deduped_2_1[deduped_2_2];
              return ListWithIdenticalEntries( deduped_1_1[deduped_2_2], deduped_4_1[SafeUniquePositionProperty( deduped_59_1, function ( obj_3 )
                         return UnderlyingVertex( obj_3 ) = hoisted_1_2;
                     end )] );
          end ) );
    deduped_48_1 := [ 0 .. Sum( List( deduped_53_1, function ( m_2 )
                    return deduped_1_1[1 + deduped_5_1[(1 + m_2)][2]];
                end ) ) - 1 ];
    deduped_47_1 := Product( deduped_49_1 );
    deduped_46_1 := [ 0 .. deduped_47_1 - 1 ];
    deduped_20_1 := SetOfGeneratingMorphisms( deduped_62_1 );
    deduped_32_1 := List( deduped_53_1, function ( m_2 )
            local deduped_1_2, deduped_2_2;
            deduped_2_2 := 1 + m_2;
            deduped_1_2 := deduped_1_1[1 + deduped_6_1[deduped_2_2]];
            return NTuple( 2, [ 0 .. deduped_1_2 - 1 ], ListWithIdenticalEntries( deduped_1_2, deduped_20_1[deduped_2_2] ) );
        end );
    deduped_13_1 := UnderlyingQuiverAlgebra( deduped_62_1 );
    deduped_12_1 := List( deduped_52_1, function ( o_2 )
            local deduped_1_2, deduped_2_2;
            deduped_2_2 := 1 + o_2;
            deduped_1_2 := deduped_1_1[deduped_2_2];
            return NTuple( 2, deduped_1_2, ListWithIdenticalEntries( deduped_1_2, deduped_59_1[deduped_2_2] ) );
        end );
    deduped_31_1 := List( deduped_53_1, function ( i_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := deduped_6_1[1 + i_2];
            deduped_2_2 := 1 + deduped_3_2;
            deduped_1_2 := Sum( deduped_51_1{[ 1 .. deduped_3_2 ]} );
            return NTuple( 2, [ deduped_1_2 .. deduped_1_2 + deduped_51_1[deduped_2_2] - 1 ], List( deduped_12_1[deduped_2_2][2], function ( objC_3 )
                      return CreateCapCategoryMorphismWithAttributes( deduped_62_1, objC_3, objC_3, UnderlyingQuiverAlgebraElement, PathAsAlgebraElement( deduped_13_1, QuiverVertexAsIdentityPath( UnderlyingVertex( objC_3 ) ) ) );
                  end ) );
        end );
    deduped_24_1 := Sum( deduped_51_1 );
    hoisted_34_1 := Concatenation( List( deduped_53_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + i_2;
              hoisted_2_2 := deduped_31_1[deduped_3_2][1];
              hoisted_1_2 := deduped_32_1[deduped_3_2][1];
              return List( [ 0 .. deduped_8_1[deduped_3_2][1] - 1 ], function ( i_3 )
                      local hoisted_3_3, deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3;
                      deduped_7_3 := hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                      deduped_6_3 := 1 + deduped_7_3;
                      deduped_5_3 := deduped_49_1[deduped_6_3];
                      deduped_4_3 := Product( deduped_49_1{[ 1 .. deduped_7_3 ]} );
                      hoisted_3_3 := DivIntWithGivenQuotient( deduped_47_1, deduped_4_3, deduped_5_3 * Product( deduped_49_1{[ (deduped_6_3 + 1) .. deduped_24_1 ]} ) );
                      return List( deduped_46_1, function ( i_4 )
                              return RemIntWithDomain( QuoIntWithDomain( i_4, deduped_4_3, deduped_47_1 ), deduped_5_3, hoisted_3_3 );
                          end );
                  end );
          end ) );
    deduped_21_1 := List( deduped_64_1[2], AsList );
    hoisted_33_1 := Concatenation( List( deduped_53_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2;
              deduped_10_2 := 1 + i_2;
              deduped_9_2 := deduped_32_1[deduped_10_2];
              deduped_8_2 := deduped_9_2[2];
              deduped_7_2 := deduped_31_1[deduped_10_2][2];
              hoisted_6_2 := List( deduped_8_2, function ( logic_new_func_x_3 )
                      return QuiverVertexAsIdentityPath( UnderlyingVertex( Source( logic_new_func_x_3 ) ) );
                  end );
              hoisted_5_2 := List( deduped_7_2, UnderlyingQuiverAlgebraElement );
              hoisted_4_2 := List( deduped_8_2, UnderlyingQuiverAlgebraElement );
              hoisted_3_2 := List( deduped_8_2, function ( logic_new_func_x_3 )
                      return UnderlyingVertex( Source( logic_new_func_x_3 ) );
                  end );
              hoisted_2_2 := List( deduped_7_2, function ( logic_new_func_x_3 )
                      return UnderlyingVertex( Target( logic_new_func_x_3 ) );
                  end );
              hoisted_1_2 := deduped_9_2[1];
              return List( [ 0 .. deduped_8_1[deduped_10_2][1] - 1 ], function ( i_3 )
                      local deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3, deduped_8_3;
                      deduped_8_3 := 1 + i_3;
                      deduped_7_3 := hoisted_3_2[deduped_8_3];
                      deduped_6_3 := 1 + hoisted_1_2[deduped_8_3];
                      deduped_5_3 := hoisted_2_2[deduped_6_3];
                      deduped_4_3 := hoisted_4_2[deduped_8_3] * hoisted_5_2[deduped_6_3];
                      if CAP_JIT_EXPR_CASE_WRAPPER( function (  )
                                  if deduped_5_3 = deduped_7_3 then
                                      return deduped_4_3 = PathAsAlgebraElement( deduped_13_1, hoisted_6_2[deduped_8_3] );
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_4_1[SafeUniquePositionProperty( deduped_59_1, function ( obj_4 )
                                         return (UnderlyingVertex( obj_4 ) = deduped_7_3);
                                     end )] - 1 ];
                      else
                          return deduped_21_1[SafeUniquePositionProperty( deduped_20_1, function ( mor_4 )
                                   if UnderlyingVertex( Source( mor_4 ) ) = deduped_7_3 and UnderlyingVertex( Range( mor_4 ) ) = deduped_5_3 then
                                       return UnderlyingQuiverAlgebraElement( mor_4 ) = deduped_4_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    deduped_10_1 := Concatenation( List( deduped_53_1, function ( i_2 )
              return ListWithIdenticalEntries( deduped_8_1[1 + i_2][1], deduped_47_1 );
          end ) );
    hoisted_35_1 := List( deduped_50_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_33_1[deduped_3_2];
            hoisted_1_2 := hoisted_34_1[deduped_3_2];
            return List( [ 0 .. deduped_10_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_28_1 := Concatenation( List( deduped_53_1, function ( m_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + m_2;
              hoisted_1_2 := deduped_2_1[1 + deduped_7_1[deduped_2_2]];
              return ListWithIdenticalEntries( deduped_1_1[1 + deduped_6_1[deduped_2_2]], deduped_4_1[SafeUniquePositionProperty( deduped_59_1, function ( obj_3 )
                         return UnderlyingVertex( obj_3 ) = hoisted_1_2;
                     end )] );
          end ) );
    deduped_29_1 := List( deduped_48_1, function ( j_2 )
            return Product( hoisted_28_1{[ 1 .. j_2 ]} );
        end );
    hoisted_18_1 := List( deduped_59_1, function ( logic_new_func_x_2 )
            return QuiverVertexAsIdentityPath( UnderlyingVertex( logic_new_func_x_2 ) );
        end );
    hoisted_17_1 := List( deduped_61_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_16_1 := List( deduped_61_1, AsList );
    deduped_19_1 := List( deduped_53_1, function ( m_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := 1 + m_2;
            deduped_2_2 := 1 + deduped_7_1[deduped_3_2];
            deduped_1_2 := deduped_59_1[deduped_2_2];
            return NTuple( 2, hoisted_16_1[deduped_3_2], ListWithIdenticalEntries( hoisted_17_1[deduped_3_2], CreateCapCategoryMorphismWithAttributes( deduped_62_1, deduped_1_2, deduped_1_2, UnderlyingQuiverAlgebraElement, PathAsAlgebraElement( deduped_13_1, hoisted_18_1[deduped_2_2] ) ) ) );
        end );
    deduped_15_1 := List( deduped_53_1, function ( i_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := deduped_7_1[1 + i_2];
            deduped_2_2 := 1 + deduped_3_2;
            deduped_1_2 := Sum( deduped_51_1{[ 1 .. deduped_3_2 ]} );
            return NTuple( 2, [ deduped_1_2 .. deduped_1_2 + deduped_51_1[deduped_2_2] - 1 ], List( deduped_12_1[deduped_2_2][2], function ( objC_3 )
                      return CreateCapCategoryMorphismWithAttributes( deduped_62_1, objC_3, objC_3, UnderlyingQuiverAlgebraElement, PathAsAlgebraElement( deduped_13_1, QuiverVertexAsIdentityPath( UnderlyingVertex( objC_3 ) ) ) );
                  end ) );
        end );
    hoisted_26_1 := Concatenation( List( deduped_53_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + i_2;
              hoisted_2_2 := deduped_15_1[deduped_3_2][1];
              hoisted_1_2 := deduped_19_1[deduped_3_2][1];
              return List( [ 0 .. deduped_8_1[deduped_3_2][1] - 1 ], function ( i_3 )
                      local hoisted_3_3, deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3;
                      deduped_7_3 := hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                      deduped_6_3 := 1 + deduped_7_3;
                      deduped_5_3 := deduped_49_1[deduped_6_3];
                      deduped_4_3 := Product( deduped_49_1{[ 1 .. deduped_7_3 ]} );
                      hoisted_3_3 := DivIntWithGivenQuotient( deduped_47_1, deduped_4_3, deduped_5_3 * Product( deduped_49_1{[ (deduped_6_3 + 1) .. deduped_24_1 ]} ) );
                      return List( deduped_46_1, function ( i_4 )
                              return RemIntWithDomain( QuoIntWithDomain( i_4, deduped_4_3, deduped_47_1 ), deduped_5_3, hoisted_3_3 );
                          end );
                  end );
          end ) );
    hoisted_22_1 := Concatenation( List( deduped_53_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, hoisted_6_2, deduped_7_2, deduped_8_2, deduped_9_2, deduped_10_2;
              deduped_10_2 := 1 + i_2;
              deduped_9_2 := deduped_19_1[deduped_10_2];
              deduped_8_2 := deduped_9_2[2];
              deduped_7_2 := deduped_15_1[deduped_10_2][2];
              hoisted_6_2 := List( deduped_8_2, function ( logic_new_func_x_3 )
                      return QuiverVertexAsIdentityPath( UnderlyingVertex( Source( logic_new_func_x_3 ) ) );
                  end );
              hoisted_5_2 := List( deduped_7_2, UnderlyingQuiverAlgebraElement );
              hoisted_4_2 := List( deduped_8_2, UnderlyingQuiverAlgebraElement );
              hoisted_3_2 := List( deduped_8_2, function ( logic_new_func_x_3 )
                      return UnderlyingVertex( Source( logic_new_func_x_3 ) );
                  end );
              hoisted_2_2 := List( deduped_7_2, function ( logic_new_func_x_3 )
                      return UnderlyingVertex( Target( logic_new_func_x_3 ) );
                  end );
              hoisted_1_2 := deduped_9_2[1];
              return List( [ 0 .. deduped_8_1[deduped_10_2][1] - 1 ], function ( i_3 )
                      local deduped_4_3, deduped_5_3, deduped_6_3, deduped_7_3, deduped_8_3;
                      deduped_8_3 := 1 + i_3;
                      deduped_7_3 := hoisted_3_2[deduped_8_3];
                      deduped_6_3 := 1 + hoisted_1_2[deduped_8_3];
                      deduped_5_3 := hoisted_2_2[deduped_6_3];
                      deduped_4_3 := hoisted_4_2[deduped_8_3] * hoisted_5_2[deduped_6_3];
                      if CAP_JIT_EXPR_CASE_WRAPPER( function (  )
                                  if deduped_5_3 = deduped_7_3 then
                                      return deduped_4_3 = PathAsAlgebraElement( deduped_13_1, hoisted_6_2[deduped_8_3] );
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_4_1[SafeUniquePositionProperty( deduped_59_1, function ( obj_4 )
                                         return (UnderlyingVertex( obj_4 ) = deduped_7_3);
                                     end )] - 1 ];
                      else
                          return deduped_21_1[SafeUniquePositionProperty( deduped_20_1, function ( mor_4 )
                                   if UnderlyingVertex( Source( mor_4 ) ) = deduped_7_3 and UnderlyingVertex( Range( mor_4 ) ) = deduped_5_3 then
                                       return UnderlyingQuiverAlgebraElement( mor_4 ) = deduped_4_3;
                                   else
                                       return false;
                                   fi;
                                   return;
                               end )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_27_1 := List( deduped_50_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_22_1[deduped_3_2];
            hoisted_1_2 := hoisted_26_1[deduped_3_2];
            return List( [ 0 .. deduped_10_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_45_1 := Filtered( deduped_46_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_48_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_27_1[deduped_1_3][deduped_1_2] * deduped_29_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_48_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_35_1[deduped_1_3][deduped_1_2] * deduped_29_1[deduped_1_3];
                    end ) );
        end );
    hoisted_43_1 := Target( cat_1 );
    deduped_38_1 := List( deduped_56_1, Length );
    deduped_39_1 := List( deduped_54_1, function ( i_2 )
            return Product( deduped_49_1{[ 1 + Sum( deduped_38_1{[ 1 .. (i_2 - 1) ]} ) .. Sum( deduped_38_1{[ 1 .. i_2 ]} ) ]} );
        end );
    hoisted_41_1 := List( deduped_54_1, function ( i_2 )
            local hoisted_3_2, deduped_4_2, deduped_5_2;
            deduped_5_2 := deduped_39_1[i_2];
            deduped_4_2 := Product( deduped_39_1{[ 1 .. i_2 - 1 ]} );
            hoisted_3_2 := DivIntWithGivenQuotient( deduped_47_1, deduped_4_2, deduped_5_2 * Product( deduped_39_1{[ (i_2 + 1) .. deduped_55_1 ]} ) );
            return List( deduped_46_1, function ( i_3 )
                    return RemIntWithDomain( QuoIntWithDomain( i_3, deduped_4_2, deduped_47_1 ), deduped_5_2, hoisted_3_2 );
                end );
        end );
    return List( [ 0 .. Length( deduped_45_1 ) - 1 ], function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + deduped_45_1[(1 + i_2)];
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, ValuesOnAllObjects, List( deduped_54_1, function ( i_3 )
                      local hoisted_1_3, hoisted_3_3, deduped_4_3;
                      deduped_4_3 := deduped_38_1[i_3];
                      hoisted_3_3 := deduped_4_1[i_3];
                      hoisted_1_3 := hoisted_41_1[i_3][hoisted_1_2];
                      return CreateCapCategoryMorphismWithAttributes( hoisted_43_1, deduped_56_1[i_3], deduped_60_1[i_3], AsList, List( [ 0 .. deduped_4_3 - 1 ], function ( i_4 )
                                return DigitInPositionalNotation( hoisted_1_3, i_4, deduped_4_3, hoisted_3_3 );
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
    sFinSets := SkeletalCategoryOfFiniteSets(  : FinalizeCategory := true,
        overhead := true );
    return PreSheaves( FreeCategory( quiver : range_of_HomStructure := sFinSets,
          FinalizeCategory := true ), sFinSets );
end;
        
        
    
    cat := category_constructor( quiver : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_PreSheavesOfFpCategoryInSkeletalFinSetsPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
