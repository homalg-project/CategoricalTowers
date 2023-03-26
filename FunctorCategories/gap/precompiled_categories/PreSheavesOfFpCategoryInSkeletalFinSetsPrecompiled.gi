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
    deduped_4_1 := CreateCapCategoryObjectWithAttributes( deduped_6_1, Length, 0 );
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
function ( cat_1, arg2_1 )
    local hoisted_2_1, hoisted_3_1, deduped_4_1, deduped_5_1, deduped_6_1;
    deduped_6_1 := Range( cat_1 );
    deduped_5_1 := Source( cat_1 );
    deduped_4_1 := DefiningTripleOfUnderlyingQuiver( deduped_5_1 );
    hoisted_3_1 := [ 1 .. Length( arg2_1 ) ];
    hoisted_2_1 := deduped_4_1[3];
    return CreateCapCategoryObjectWithAttributes( cat_1, Source, deduped_5_1, Range, deduped_6_1, ValuesOfPreSheaf, NTuple( 2, LazyHList( [ 1 .. deduped_4_1[1] ], function ( o_2 )
                return CreateCapCategoryObjectWithAttributes( deduped_6_1, Length, Sum( List( arg2_1, function ( logic_new_func_x_3 )
                            return Length( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][o_2] ) );
                        end ) ) );
            end ), LazyHList( [ 1 .. deduped_4_1[2] ], function ( m_2 )
                local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
                deduped_4_2 := hoisted_2_1[m_2];
                deduped_3_2 := List( arg2_1, function ( logic_new_func_x_3 )
                        return Length( Range( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[2][m_2] ) ) );
                    end );
                hoisted_2_2 := 1 + deduped_4_2[1];
                hoisted_1_2 := 1 + deduped_4_2[2];
                return CreateCapCategoryMorphismWithAttributes( deduped_6_1, CreateCapCategoryObjectWithAttributes( deduped_6_1, Length, Sum( List( arg2_1, function ( logic_new_func_x_3 )
                              return Length( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][hoisted_1_2] ) );
                          end ) ) ), CreateCapCategoryObjectWithAttributes( deduped_6_1, Length, Sum( List( arg2_1, function ( logic_new_func_x_3 )
                              return Length( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][hoisted_2_2] ) );
                          end ) ) ), AsList, Concatenation( List( hoisted_3_1, function ( logic_new_func_x_3 )
                            local hoisted_1_3, hoisted_2_3, deduped_3_3, deduped_4_3;
                            deduped_4_3 := Sum( deduped_3_2{[ 1 .. logic_new_func_x_3 - 1 ]} );
                            deduped_3_3 := CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( CAP_JIT_INCOMPLETE_LOGIC( arg2_1[logic_new_func_x_3] ) )[2][m_2] );
                            hoisted_2_3 := [ deduped_4_3 .. deduped_4_3 + deduped_3_2[logic_new_func_x_3] - 1 ];
                            hoisted_1_3 := AsList( deduped_3_3 );
                            return List( [ 0 .. Length( Source( deduped_3_3 ) ) - 1 ], function ( i_4 )
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
              deduped_2_2 := List( objects_1, function ( logic_new_func_x_3 )
                      return Length( CAP_JIT_INCOMPLETE_LOGIC( ValuesOfPreSheaf( logic_new_func_x_3 )[1][o_2] ) );
                  end );
              deduped_1_2 := Sum( deduped_2_2{hoisted_3_1} );
              return CreateCapCategoryMorphismWithAttributes( hoisted_4_1, hoisted_1_1[o_2], hoisted_2_1[o_2], AsList, [ deduped_1_2 .. deduped_1_2 + deduped_2_2[k_1] - 1 ] );
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
              return CreateCapCategoryMorphismWithAttributes( hoisted_3_1, hoisted_1_1[o_2], hoisted_2_1[o_2], AsList, Concatenation( List( tau_1, function ( logic_new_func_x_3 )
                          return AsList( CAP_JIT_INCOMPLETE_LOGIC( ValuesOnAllObjects( logic_new_func_x_3 )[o_2] ) );
                      end ) ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddHomomorphismStructureOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, hoisted_9_1, hoisted_10_1, deduped_11_1, deduped_13_1, deduped_14_1, hoisted_15_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, deduped_21_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1;
    deduped_35_1 := ValuesOfPreSheaf( arg3_1 );
    deduped_34_1 := ValuesOfPreSheaf( arg2_1 );
    deduped_33_1 := Source( cat_1 );
    deduped_32_1 := deduped_34_1[2];
    deduped_31_1 := DefiningTripleOfUnderlyingQuiver( deduped_33_1 );
    deduped_30_1 := [ 0 .. deduped_31_1[2] - 1 ];
    deduped_29_1 := [ 0 .. deduped_31_1[1] - 1 ];
    deduped_3_1 := List( deduped_35_1[1], Length );
    deduped_2_1 := SetOfObjects( deduped_33_1 );
    deduped_1_1 := List( deduped_34_1[1], Length );
    deduped_28_1 := Concatenation( List( deduped_29_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + logic_new_func_x_2;
              return List( ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] ), function ( logic_new_func_x_3 )
                      return deduped_3_1[SafePosition( deduped_2_1, logic_new_func_x_3 )];
                  end );
          end ) );
    deduped_4_1 := List( deduped_32_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    deduped_27_1 := [ 0 .. Sum( List( deduped_30_1, function ( logic_new_func_x_2 )
                    return Length( [ 0 .. deduped_4_1[1 + logic_new_func_x_2] - 1 ] );
                end ) ) - 1 ];
    deduped_26_1 := [ 0 .. Product( deduped_28_1 ) - 1 ];
    deduped_7_1 := List( deduped_29_1, function ( i_2 )
            return Sum( List( [ 1 .. i_2 ], function ( j_3 )
                      return deduped_1_1[j_3];
                  end ) );
        end );
    deduped_6_1 := deduped_31_1[3];
    hoisted_24_1 := Concatenation( List( deduped_30_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + logic_new_func_x_2;
              hoisted_1_2 := deduped_7_1[1 + deduped_6_1[deduped_2_2][2]];
              return List( [ 0 .. deduped_4_1[deduped_2_2] - 1 ], function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := logic_new_func_x_3 + hoisted_1_2;
                      hoisted_2_3 := deduped_28_1[1 + deduped_3_3];
                      hoisted_1_3 := Product( deduped_28_1{[ 1 .. deduped_3_3 ]} );
                      return List( deduped_26_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    deduped_14_1 := List( deduped_35_1[2], AsList );
    deduped_13_1 := SetOfGeneratingMorphisms( deduped_33_1 );
    deduped_11_1 := UnderlyingQuiverAlgebra( deduped_33_1 );
    hoisted_23_1 := Concatenation( List( deduped_30_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + logic_new_func_x_2;
              return List( ListWithIdenticalEntries( deduped_4_1[deduped_1_2], deduped_13_1[deduped_1_2] ), function ( logic_new_func_x_3 )
                      local deduped_1_3, deduped_2_3;
                      deduped_2_3 := Source( logic_new_func_x_3 );
                      deduped_1_3 := UnderlyingVertex( deduped_2_3 );
                      if IdFunc( function (  )
                                  if true and UnderlyingVertex( Range( logic_new_func_x_3 ) ) = deduped_1_3 then
                                      return UnderlyingQuiverAlgebraElement( logic_new_func_x_3 ) = PathAsAlgebraElement( deduped_11_1, QuiverVertexAsIdentityPath( deduped_1_3 ) );
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_3_1[SafePosition( deduped_2_1, deduped_2_3 )] - 1 ];
                      else
                          return deduped_14_1[SafeUniquePosition( deduped_13_1, logic_new_func_x_3 )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_25_1 := List( deduped_27_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_23_1[deduped_3_2];
            hoisted_1_2 := hoisted_24_1[deduped_3_2];
            return List( deduped_26_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_8_1 := Concatenation( List( deduped_29_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] );
          end ) );
    deduped_5_1 := List( deduped_32_1, AsList );
    hoisted_20_1 := Concatenation( List( deduped_30_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + logic_new_func_x_2;
              hoisted_2_2 := deduped_7_1[1 + deduped_6_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_5_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( logic_new_func_x_3 )
                      return deduped_3_1[SafePosition( deduped_2_1, deduped_8_1[1 + (hoisted_1_2[1 + logic_new_func_x_3] + hoisted_2_2)] )];
                  end );
          end ) );
    deduped_21_1 := List( deduped_27_1, function ( j_2 )
            return Product( hoisted_20_1{[ 1 .. j_2 ]} );
        end );
    hoisted_18_1 := Concatenation( List( deduped_30_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + logic_new_func_x_2;
              hoisted_2_2 := deduped_7_1[1 + deduped_6_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_5_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := hoisted_1_2[1 + logic_new_func_x_3] + hoisted_2_2;
                      hoisted_2_3 := deduped_28_1[1 + deduped_3_3];
                      hoisted_1_3 := Product( deduped_28_1{[ 1 .. deduped_3_3 ]} );
                      return List( deduped_26_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_10_1 := Concatenation( List( deduped_29_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + logic_new_func_x_2;
              return List( ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] ), function ( logic_new_func_x_3 )
                      return QuiverVertexAsIdentityPath( UnderlyingVertex( logic_new_func_x_3 ) );
                  end );
          end ) );
    if true and true then
        hoisted_9_1 := true;
    else
        hoisted_9_1 := false;
    fi;
    hoisted_15_1 := Concatenation( List( deduped_30_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + logic_new_func_x_2;
              hoisted_2_2 := deduped_7_1[1 + deduped_6_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_5_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( logic_new_func_x_3 )
                      local deduped_1_3, deduped_2_3;
                      deduped_2_3 := 1 + (hoisted_1_2[1 + logic_new_func_x_3] + hoisted_2_2);
                      deduped_1_3 := deduped_8_1[deduped_2_3];
                      if hoisted_9_1 then
                          return [ 0 .. deduped_3_1[SafePosition( deduped_2_1, deduped_1_3 )] - 1 ];
                      else
                          return deduped_14_1[SafeUniquePosition( deduped_13_1, CreateCapCategoryMorphismWithAttributes( deduped_33_1, deduped_1_3, deduped_1_3, UnderlyingQuiverAlgebraElement, PathAsAlgebraElement( deduped_11_1, hoisted_10_1[deduped_2_3] ) ) )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_19_1 := List( deduped_27_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_15_1[deduped_3_2];
            hoisted_1_2 := hoisted_18_1[deduped_3_2];
            return List( deduped_26_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( Range( cat_1 ), Length, Length( Filtered( deduped_26_1, function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return Sum( deduped_27_1, function ( j_3 )
                          local deduped_1_3;
                          deduped_1_3 := 1 + j_3;
                          return hoisted_19_1[deduped_1_3][deduped_1_2] * deduped_21_1[deduped_1_3];
                      end ) = Sum( deduped_27_1, function ( j_3 )
                          local deduped_1_3;
                          deduped_1_3 := 1 + j_3;
                          return hoisted_25_1[deduped_1_3][deduped_1_2] * deduped_21_1[deduped_1_3];
                      end );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddHomomorphismStructureOnMorphismsWithGivenObjects( cat,
        
########
function ( cat_1, source_1, alpha_1, beta_1, range_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, hoisted_10_1, deduped_11_1, deduped_13_1, deduped_14_1, hoisted_15_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, deduped_21_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, deduped_26_1, deduped_27_1, hoisted_28_1, hoisted_29_1, hoisted_32_1, hoisted_33_1, deduped_35_1, deduped_36_1, hoisted_37_1, deduped_38_1, hoisted_42_1, hoisted_43_1, hoisted_44_1, hoisted_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, hoisted_50_1, hoisted_51_1, hoisted_52_1, hoisted_53_1, hoisted_54_1, deduped_55_1, hoisted_57_1, hoisted_58_1, hoisted_59_1, hoisted_60_1, hoisted_61_1, hoisted_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1, deduped_68_1, deduped_69_1, deduped_70_1, deduped_71_1, deduped_72_1, deduped_73_1, deduped_74_1, deduped_75_1, deduped_76_1, deduped_77_1, deduped_78_1, deduped_79_1, deduped_80_1, deduped_81_1, deduped_82_1, deduped_83_1, deduped_84_1;
    deduped_84_1 := Source( cat_1 );
    deduped_83_1 := ListOfValues( ValuesOnAllObjects( alpha_1 ) );
    deduped_82_1 := ValuesOfPreSheaf( Source( beta_1 ) );
    deduped_81_1 := ValuesOfPreSheaf( Range( alpha_1 ) );
    deduped_80_1 := DefiningTripleOfUnderlyingQuiver( deduped_84_1 );
    deduped_79_1 := ValuesOfPreSheaf( Range( beta_1 ) );
    deduped_78_1 := ValuesOfPreSheaf( Source( alpha_1 ) );
    deduped_77_1 := deduped_81_1[2];
    deduped_76_1 := deduped_78_1[2];
    deduped_75_1 := [ 1 .. Length( deduped_83_1 ) ];
    deduped_74_1 := [ 0 .. deduped_80_1[2] - 1 ];
    deduped_73_1 := [ 0 .. deduped_80_1[1] - 1 ];
    deduped_27_1 := List( deduped_82_1[1], Length );
    deduped_26_1 := List( deduped_81_1[1], Length );
    deduped_2_1 := SetOfObjects( deduped_84_1 );
    deduped_72_1 := Concatenation( List( deduped_73_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + logic_new_func_x_2;
              return List( ListWithIdenticalEntries( deduped_26_1[deduped_1_2], deduped_2_1[deduped_1_2] ), function ( logic_new_func_x_3 )
                      return deduped_27_1[SafePosition( deduped_2_1, logic_new_func_x_3 )];
                  end );
          end ) );
    deduped_1_1 := List( deduped_78_1[1], Length );
    deduped_71_1 := Sum( List( deduped_73_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + logic_new_func_x_2;
              return Length( ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] ) );
          end ) );
    deduped_70_1 := Concatenation( List( deduped_73_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + logic_new_func_x_2;
              return List( ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] ), function ( logic_new_func_x_3 )
                      return deduped_27_1[SafePosition( deduped_2_1, logic_new_func_x_3 )];
                  end );
          end ) );
    deduped_3_1 := List( deduped_79_1[1], Length );
    deduped_69_1 := Concatenation( List( deduped_73_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + logic_new_func_x_2;
              return List( ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] ), function ( logic_new_func_x_3 )
                      return deduped_3_1[SafePosition( deduped_2_1, logic_new_func_x_3 )];
                  end );
          end ) );
    deduped_68_1 := [ 0 .. deduped_71_1 - 1 ];
    deduped_46_1 := List( deduped_77_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    deduped_67_1 := [ 0 .. Sum( List( deduped_74_1, function ( logic_new_func_x_2 )
                    return Length( [ 0 .. deduped_46_1[1 + logic_new_func_x_2] - 1 ] );
                end ) ) - 1 ];
    deduped_4_1 := List( deduped_76_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    deduped_66_1 := [ 0 .. Sum( List( deduped_74_1, function ( logic_new_func_x_2 )
                    return Length( [ 0 .. deduped_4_1[1 + logic_new_func_x_2] - 1 ] );
                end ) ) - 1 ];
    deduped_65_1 := [ 0 .. Product( deduped_72_1 ) - 1 ];
    deduped_64_1 := [ 0 .. Product( deduped_70_1 ) - 1 ];
    deduped_63_1 := [ 0 .. Product( deduped_69_1 ) - 1 ];
    deduped_7_1 := List( deduped_73_1, function ( i_2 )
            return Sum( List( [ 1 .. i_2 ], function ( j_3 )
                      return deduped_1_1[j_3];
                  end ) );
        end );
    deduped_6_1 := deduped_80_1[3];
    hoisted_24_1 := Concatenation( List( deduped_74_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + logic_new_func_x_2;
              hoisted_1_2 := deduped_7_1[1 + deduped_6_1[deduped_2_2][2]];
              return List( [ 0 .. deduped_4_1[deduped_2_2] - 1 ], function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := logic_new_func_x_3 + hoisted_1_2;
                      hoisted_2_3 := deduped_69_1[1 + deduped_3_3];
                      hoisted_1_3 := Product( deduped_69_1{[ 1 .. deduped_3_3 ]} );
                      return List( deduped_63_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    deduped_14_1 := List( deduped_79_1[2], AsList );
    deduped_13_1 := SetOfGeneratingMorphisms( deduped_84_1 );
    deduped_11_1 := UnderlyingQuiverAlgebra( deduped_84_1 );
    hoisted_23_1 := Concatenation( List( deduped_74_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + logic_new_func_x_2;
              return List( ListWithIdenticalEntries( deduped_4_1[deduped_1_2], deduped_13_1[deduped_1_2] ), function ( logic_new_func_x_3 )
                      local deduped_1_3, deduped_2_3;
                      deduped_2_3 := Source( logic_new_func_x_3 );
                      deduped_1_3 := UnderlyingVertex( deduped_2_3 );
                      if IdFunc( function (  )
                                  if true and UnderlyingVertex( Range( logic_new_func_x_3 ) ) = deduped_1_3 then
                                      return UnderlyingQuiverAlgebraElement( logic_new_func_x_3 ) = PathAsAlgebraElement( deduped_11_1, QuiverVertexAsIdentityPath( deduped_1_3 ) );
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_3_1[SafePosition( deduped_2_1, deduped_2_3 )] - 1 ];
                      else
                          return deduped_14_1[SafeUniquePosition( deduped_13_1, logic_new_func_x_3 )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_25_1 := List( deduped_66_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_23_1[deduped_3_2];
            hoisted_1_2 := hoisted_24_1[deduped_3_2];
            return List( deduped_63_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_8_1 := Concatenation( List( deduped_73_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] );
          end ) );
    deduped_5_1 := List( deduped_76_1, AsList );
    hoisted_20_1 := Concatenation( List( deduped_74_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + logic_new_func_x_2;
              hoisted_2_2 := deduped_7_1[1 + deduped_6_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_5_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( logic_new_func_x_3 )
                      return deduped_3_1[SafePosition( deduped_2_1, deduped_8_1[1 + (hoisted_1_2[1 + logic_new_func_x_3] + hoisted_2_2)] )];
                  end );
          end ) );
    deduped_21_1 := List( deduped_66_1, function ( j_2 )
            return Product( hoisted_20_1{[ 1 .. j_2 ]} );
        end );
    hoisted_18_1 := Concatenation( List( deduped_74_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + logic_new_func_x_2;
              hoisted_2_2 := deduped_7_1[1 + deduped_6_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_5_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := hoisted_1_2[1 + logic_new_func_x_3] + hoisted_2_2;
                      hoisted_2_3 := deduped_69_1[1 + deduped_3_3];
                      hoisted_1_3 := Product( deduped_69_1{[ 1 .. deduped_3_3 ]} );
                      return List( deduped_63_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_10_1 := Concatenation( List( deduped_73_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + logic_new_func_x_2;
              return List( ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] ), function ( logic_new_func_x_3 )
                      return QuiverVertexAsIdentityPath( UnderlyingVertex( logic_new_func_x_3 ) );
                  end );
          end ) );
    if true and true then
        deduped_9_1 := true;
    else
        deduped_9_1 := false;
    fi;
    hoisted_15_1 := Concatenation( List( deduped_74_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + logic_new_func_x_2;
              hoisted_2_2 := deduped_7_1[1 + deduped_6_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_5_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( logic_new_func_x_3 )
                      local deduped_1_3, deduped_2_3;
                      deduped_2_3 := 1 + (hoisted_1_2[1 + logic_new_func_x_3] + hoisted_2_2);
                      deduped_1_3 := deduped_8_1[deduped_2_3];
                      if deduped_9_1 then
                          return [ 0 .. deduped_3_1[SafePosition( deduped_2_1, deduped_1_3 )] - 1 ];
                      else
                          return deduped_14_1[SafeUniquePosition( deduped_13_1, CreateCapCategoryMorphismWithAttributes( deduped_84_1, deduped_1_3, deduped_1_3, UnderlyingQuiverAlgebraElement, PathAsAlgebraElement( deduped_11_1, hoisted_10_1[deduped_2_3] ) ) )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_19_1 := List( deduped_66_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_15_1[deduped_3_2];
            hoisted_1_2 := hoisted_18_1[deduped_3_2];
            return List( deduped_63_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_62_1 := Filtered( deduped_63_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return Sum( deduped_66_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_19_1[deduped_1_3][deduped_1_2] * deduped_21_1[deduped_1_3];
                  end ) = Sum( deduped_66_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_25_1[deduped_1_3][deduped_1_2] * deduped_21_1[deduped_1_3];
                  end );
        end );
    hoisted_33_1 := List( deduped_68_1, function ( j_2 )
            return Product( deduped_69_1{[ 1 .. j_2 ]} );
        end );
    hoisted_28_1 := List( ValuesOnAllObjects( beta_1 ), AsList );
    hoisted_29_1 := Concatenation( List( deduped_73_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + logic_new_func_x_2;
              return List( ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] ), function ( logic_new_func_x_3 )
                      return hoisted_28_1[SafePosition( deduped_2_1, logic_new_func_x_3 )];
                  end );
          end ) );
    hoisted_32_1 := List( [ 1 .. deduped_71_1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_29_1[logic_new_func_x_2];
            hoisted_2_2 := deduped_70_1[logic_new_func_x_2];
            hoisted_1_2 := Product( deduped_70_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( deduped_64_1, function ( logic_new_func_x_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( logic_new_func_x_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    hoisted_45_1 := List( deduped_64_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_68_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_32_1[deduped_1_3][hoisted_1_2] * hoisted_33_1[deduped_1_3];
                end );
        end );
    hoisted_44_1 := List( deduped_68_1, function ( j_2 )
            return Product( deduped_70_1{[ 1 .. j_2 ]} );
        end );
    deduped_38_1 := List( deduped_83_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_35_1 := List( deduped_83_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_42_1 := Concatenation( List( deduped_75_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := Sum( deduped_38_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
              hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_38_1[logic_new_func_x_2] - 1 ];
              hoisted_1_2 := AsList( CAP_JIT_INCOMPLETE_LOGIC( deduped_83_1[logic_new_func_x_2] ) );
              return List( [ 0 .. deduped_35_1[logic_new_func_x_2] - 1 ], function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := hoisted_2_2[1 + hoisted_1_2[(1 + logic_new_func_x_3)]];
                      hoisted_2_3 := deduped_72_1[1 + deduped_3_3];
                      hoisted_1_3 := Product( deduped_72_1{[ 1 .. deduped_3_3 ]} );
                      return List( deduped_65_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    deduped_36_1 := List( deduped_82_1[2], AsList );
    hoisted_37_1 := Concatenation( List( deduped_73_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + logic_new_func_x_2;
              return List( ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] ), function ( logic_new_func_x_3 )
                      if deduped_9_1 then
                          return [ 0 .. deduped_27_1[SafePosition( deduped_2_1, logic_new_func_x_3 )] - 1 ];
                      else
                          return deduped_36_1[SafeUniquePosition( deduped_13_1, CreateCapCategoryMorphismWithAttributes( deduped_84_1, logic_new_func_x_3, logic_new_func_x_3, UnderlyingQuiverAlgebraElement, PathAsAlgebraElement( deduped_11_1, QuiverVertexAsIdentityPath( UnderlyingVertex( logic_new_func_x_3 ) ) ) ) )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_43_1 := List( [ 0 .. Sum( List( deduped_75_1, function ( logic_new_func_x_2 )
                      return Length( [ 0 .. deduped_35_1[logic_new_func_x_2] - 1 ] );
                  end ) ) - 1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_37_1[deduped_3_2];
            hoisted_1_2 := hoisted_42_1[deduped_3_2];
            return List( deduped_65_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_61_1 := List( deduped_65_1, function ( logic_new_func_x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + logic_new_func_x_2;
            return hoisted_45_1[1 + Sum( deduped_68_1, function ( j_3 )
                       local deduped_1_3;
                       deduped_1_3 := (1 + j_3);
                       return hoisted_43_1[deduped_1_3][hoisted_1_2] * hoisted_44_1[deduped_1_3];
                   end )];
        end );
    deduped_48_1 := List( deduped_73_1, function ( i_2 )
            return Sum( List( [ 1 .. i_2 ], function ( j_3 )
                      return deduped_26_1[j_3];
                  end ) );
        end );
    hoisted_58_1 := Concatenation( List( deduped_74_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + logic_new_func_x_2;
              hoisted_1_2 := deduped_48_1[1 + deduped_6_1[deduped_2_2][2]];
              return List( [ 0 .. deduped_46_1[deduped_2_2] - 1 ], function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := logic_new_func_x_3 + hoisted_1_2;
                      hoisted_2_3 := deduped_72_1[1 + deduped_3_3];
                      hoisted_1_3 := Product( deduped_72_1{[ 1 .. deduped_3_3 ]} );
                      return List( deduped_65_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_57_1 := Concatenation( List( deduped_74_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + logic_new_func_x_2;
              return List( ListWithIdenticalEntries( deduped_46_1[deduped_1_2], deduped_13_1[deduped_1_2] ), function ( logic_new_func_x_3 )
                      local deduped_1_3, deduped_2_3;
                      deduped_2_3 := Source( logic_new_func_x_3 );
                      deduped_1_3 := UnderlyingVertex( deduped_2_3 );
                      if IdFunc( function (  )
                                  if true and UnderlyingVertex( Range( logic_new_func_x_3 ) ) = deduped_1_3 then
                                      return UnderlyingQuiverAlgebraElement( logic_new_func_x_3 ) = PathAsAlgebraElement( deduped_11_1, QuiverVertexAsIdentityPath( deduped_1_3 ) );
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_27_1[SafePosition( deduped_2_1, deduped_2_3 )] - 1 ];
                      else
                          return deduped_36_1[SafeUniquePosition( deduped_13_1, logic_new_func_x_3 )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_59_1 := List( deduped_67_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_57_1[deduped_3_2];
            hoisted_1_2 := hoisted_58_1[deduped_3_2];
            return List( deduped_65_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_49_1 := Concatenation( List( deduped_73_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return ListWithIdenticalEntries( deduped_26_1[deduped_1_2], deduped_2_1[deduped_1_2] );
          end ) );
    deduped_47_1 := List( deduped_77_1, AsList );
    hoisted_54_1 := Concatenation( List( deduped_74_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + logic_new_func_x_2;
              hoisted_2_2 := deduped_48_1[1 + deduped_6_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_47_1[deduped_3_2];
              return List( [ 0 .. deduped_46_1[deduped_3_2] - 1 ], function ( logic_new_func_x_3 )
                      return deduped_27_1[SafePosition( deduped_2_1, deduped_49_1[1 + (hoisted_1_2[1 + logic_new_func_x_3] + hoisted_2_2)] )];
                  end );
          end ) );
    deduped_55_1 := List( deduped_67_1, function ( j_2 )
            return Product( hoisted_54_1{[ 1 .. j_2 ]} );
        end );
    hoisted_52_1 := Concatenation( List( deduped_74_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + logic_new_func_x_2;
              hoisted_2_2 := deduped_48_1[1 + deduped_6_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_47_1[deduped_3_2];
              return List( [ 0 .. deduped_46_1[deduped_3_2] - 1 ], function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := hoisted_1_2[1 + logic_new_func_x_3] + hoisted_2_2;
                      hoisted_2_3 := deduped_72_1[1 + deduped_3_3];
                      hoisted_1_3 := Product( deduped_72_1{[ 1 .. deduped_3_3 ]} );
                      return List( deduped_65_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_50_1 := Concatenation( List( deduped_73_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + logic_new_func_x_2;
              return List( ListWithIdenticalEntries( deduped_26_1[deduped_1_2], deduped_2_1[deduped_1_2] ), function ( logic_new_func_x_3 )
                      return QuiverVertexAsIdentityPath( UnderlyingVertex( logic_new_func_x_3 ) );
                  end );
          end ) );
    hoisted_51_1 := Concatenation( List( deduped_74_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + logic_new_func_x_2;
              hoisted_2_2 := deduped_48_1[1 + deduped_6_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_47_1[deduped_3_2];
              return List( [ 0 .. deduped_46_1[deduped_3_2] - 1 ], function ( logic_new_func_x_3 )
                      local deduped_1_3, deduped_2_3;
                      deduped_2_3 := 1 + (hoisted_1_2[1 + logic_new_func_x_3] + hoisted_2_2);
                      deduped_1_3 := deduped_49_1[deduped_2_3];
                      if deduped_9_1 then
                          return [ 0 .. deduped_27_1[SafePosition( deduped_2_1, deduped_1_3 )] - 1 ];
                      else
                          return deduped_36_1[SafeUniquePosition( deduped_13_1, CreateCapCategoryMorphismWithAttributes( deduped_84_1, deduped_1_3, deduped_1_3, UnderlyingQuiverAlgebraElement, PathAsAlgebraElement( deduped_11_1, hoisted_50_1[deduped_2_3] ) ) )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_53_1 := List( deduped_67_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_51_1[deduped_3_2];
            hoisted_1_2 := hoisted_52_1[deduped_3_2];
            return List( deduped_65_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_60_1 := Filtered( deduped_65_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return Sum( deduped_67_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_53_1[deduped_1_3][deduped_1_2] * deduped_55_1[deduped_1_3];
                  end ) = Sum( deduped_67_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_59_1[deduped_1_3][deduped_1_2] * deduped_55_1[deduped_1_3];
                  end );
        end );
    return CreateCapCategoryMorphismWithAttributes( Range( cat_1 ), source_1, range_1, AsList, List( [ 0 .. Length( source_1 ) - 1 ], function ( x_2 )
              return -1 + SafePosition( hoisted_62_1, hoisted_61_1[(1 + hoisted_60_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))])] );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local deduped_3_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_9_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, hoisted_16_1, hoisted_17_1, deduped_18_1, deduped_20_1, deduped_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, deduped_26_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, hoisted_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1;
    deduped_50_1 := ValuesOfPreSheaf( range_1 );
    deduped_49_1 := ValuesOfPreSheaf( source_1 );
    deduped_48_1 := Source( cat_1 );
    deduped_47_1 := deduped_49_1[2];
    deduped_46_1 := Length( Source( alpha_1 ) );
    deduped_45_1 := deduped_50_1[1];
    deduped_44_1 := deduped_49_1[1];
    deduped_43_1 := DefiningTripleOfUnderlyingQuiver( deduped_48_1 );
    deduped_42_1 := ListOfValues( deduped_44_1 );
    deduped_41_1 := deduped_43_1[1];
    deduped_40_1 := [ 1 .. deduped_41_1 ];
    deduped_39_1 := [ 0 .. deduped_43_1[2] - 1 ];
    deduped_38_1 := [ 0 .. deduped_41_1 - 1 ];
    deduped_7_1 := SetOfObjects( deduped_48_1 );
    deduped_6_1 := List( deduped_44_1, Length );
    deduped_5_1 := List( deduped_45_1, Length );
    deduped_37_1 := Concatenation( List( deduped_38_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + logic_new_func_x_2;
              return List( ListWithIdenticalEntries( deduped_6_1[deduped_1_2], deduped_7_1[deduped_1_2] ), function ( logic_new_func_x_3 )
                      return deduped_5_1[SafePosition( deduped_7_1, logic_new_func_x_3 )];
                  end );
          end ) );
    deduped_11_1 := List( deduped_47_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    deduped_36_1 := [ 0 .. Sum( List( deduped_39_1, function ( logic_new_func_x_2 )
                    return Length( [ 0 .. deduped_11_1[1 + logic_new_func_x_2] - 1 ] );
                end ) ) - 1 ];
    deduped_35_1 := [ 0 .. Product( deduped_37_1 ) - 1 ];
    hoisted_34_1 := Range( cat_1 );
    hoisted_33_1 := [ 0 .. deduped_46_1 - 1 ];
    deduped_14_1 := List( deduped_38_1, function ( i_2 )
            return Sum( List( [ 1 .. i_2 ], function ( j_3 )
                      return deduped_6_1[j_3];
                  end ) );
        end );
    deduped_13_1 := deduped_43_1[3];
    hoisted_29_1 := Concatenation( List( deduped_39_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + logic_new_func_x_2;
              hoisted_1_2 := deduped_14_1[1 + deduped_13_1[deduped_2_2][2]];
              return List( [ 0 .. deduped_11_1[deduped_2_2] - 1 ], function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := logic_new_func_x_3 + hoisted_1_2;
                      hoisted_2_3 := deduped_37_1[1 + deduped_3_3];
                      hoisted_1_3 := Product( deduped_37_1{[ 1 .. deduped_3_3 ]} );
                      return List( deduped_35_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    deduped_21_1 := List( deduped_50_1[2], AsList );
    deduped_20_1 := SetOfGeneratingMorphisms( deduped_48_1 );
    deduped_18_1 := UnderlyingQuiverAlgebra( deduped_48_1 );
    hoisted_28_1 := Concatenation( List( deduped_39_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + logic_new_func_x_2;
              return List( ListWithIdenticalEntries( deduped_11_1[deduped_1_2], deduped_20_1[deduped_1_2] ), function ( logic_new_func_x_3 )
                      local deduped_1_3, deduped_2_3;
                      deduped_2_3 := Source( logic_new_func_x_3 );
                      deduped_1_3 := UnderlyingVertex( deduped_2_3 );
                      if IdFunc( function (  )
                                  if true and UnderlyingVertex( Range( logic_new_func_x_3 ) ) = deduped_1_3 then
                                      return UnderlyingQuiverAlgebraElement( logic_new_func_x_3 ) = PathAsAlgebraElement( deduped_18_1, QuiverVertexAsIdentityPath( deduped_1_3 ) );
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_5_1[SafePosition( deduped_7_1, deduped_2_3 )] - 1 ];
                      else
                          return deduped_21_1[SafeUniquePosition( deduped_20_1, logic_new_func_x_3 )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_30_1 := List( deduped_36_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_28_1[deduped_3_2];
            hoisted_1_2 := hoisted_29_1[deduped_3_2];
            return List( deduped_35_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_15_1 := Concatenation( List( deduped_38_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return ListWithIdenticalEntries( deduped_6_1[deduped_1_2], deduped_7_1[deduped_1_2] );
          end ) );
    deduped_12_1 := List( deduped_47_1, AsList );
    hoisted_25_1 := Concatenation( List( deduped_39_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + logic_new_func_x_2;
              hoisted_2_2 := deduped_14_1[1 + deduped_13_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_12_1[deduped_3_2];
              return List( [ 0 .. deduped_11_1[deduped_3_2] - 1 ], function ( logic_new_func_x_3 )
                      return deduped_5_1[SafePosition( deduped_7_1, deduped_15_1[1 + (hoisted_1_2[1 + logic_new_func_x_3] + hoisted_2_2)] )];
                  end );
          end ) );
    deduped_26_1 := List( deduped_36_1, function ( j_2 )
            return Product( hoisted_25_1{[ 1 .. j_2 ]} );
        end );
    hoisted_23_1 := Concatenation( List( deduped_39_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + logic_new_func_x_2;
              hoisted_2_2 := deduped_14_1[1 + deduped_13_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_12_1[deduped_3_2];
              return List( [ 0 .. deduped_11_1[deduped_3_2] - 1 ], function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := hoisted_1_2[1 + logic_new_func_x_3] + hoisted_2_2;
                      hoisted_2_3 := deduped_37_1[1 + deduped_3_3];
                      hoisted_1_3 := Product( deduped_37_1{[ 1 .. deduped_3_3 ]} );
                      return List( deduped_35_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_17_1 := Concatenation( List( deduped_38_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + logic_new_func_x_2;
              return List( ListWithIdenticalEntries( deduped_6_1[deduped_1_2], deduped_7_1[deduped_1_2] ), function ( logic_new_func_x_3 )
                      return QuiverVertexAsIdentityPath( UnderlyingVertex( logic_new_func_x_3 ) );
                  end );
          end ) );
    if true and true then
        hoisted_16_1 := true;
    else
        hoisted_16_1 := false;
    fi;
    hoisted_22_1 := Concatenation( List( deduped_39_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + logic_new_func_x_2;
              hoisted_2_2 := deduped_14_1[1 + deduped_13_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_12_1[deduped_3_2];
              return List( [ 0 .. deduped_11_1[deduped_3_2] - 1 ], function ( logic_new_func_x_3 )
                      local deduped_1_3, deduped_2_3;
                      deduped_2_3 := 1 + (hoisted_1_2[1 + logic_new_func_x_3] + hoisted_2_2);
                      deduped_1_3 := deduped_15_1[deduped_2_3];
                      if hoisted_16_1 then
                          return [ 0 .. deduped_5_1[SafePosition( deduped_7_1, deduped_1_3 )] - 1 ];
                      else
                          return deduped_21_1[SafeUniquePosition( deduped_20_1, CreateCapCategoryMorphismWithAttributes( deduped_48_1, deduped_1_3, deduped_1_3, UnderlyingQuiverAlgebraElement, PathAsAlgebraElement( deduped_18_1, hoisted_17_1[deduped_2_3] ) ) )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_24_1 := List( deduped_36_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_22_1[deduped_3_2];
            hoisted_1_2 := hoisted_23_1[deduped_3_2];
            return List( deduped_35_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_32_1 := Filtered( deduped_35_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return Sum( deduped_36_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_24_1[deduped_1_3][deduped_1_2] * deduped_26_1[deduped_1_3];
                  end ) = Sum( deduped_36_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_30_1[deduped_1_3][deduped_1_2] * deduped_26_1[deduped_1_3];
                  end );
        end );
    hoisted_31_1 := AsList( alpha_1 );
    deduped_3_1 := List( deduped_42_1, Length );
    deduped_9_1 := List( deduped_40_1, function ( logic_new_func_x_2 )
            return Product( deduped_37_1{[ 1 + Sum( deduped_3_1{[ 1 .. (logic_new_func_x_2 - 1) ]} ) .. Sum( deduped_3_1{[ 1 .. logic_new_func_x_2 ]} ) ]} );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, ValuesOnAllObjects, List( deduped_40_1, function ( i_2 )
              local hoisted_3_2, deduped_4_2, hoisted_5_2, hoisted_6_2, hoisted_8_2, hoisted_9_2, deduped_10_2, deduped_11_2, deduped_12_2, deduped_13_2;
              deduped_13_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
              deduped_12_2 := deduped_5_1[i_2];
              deduped_11_2 := deduped_3_1[i_2];
              deduped_10_2 := deduped_12_2 ^ deduped_11_2;
              hoisted_8_2 := List( [ 0 .. deduped_10_2 * deduped_11_2 - 1 ], function ( i_3 )
                      return REM_INT( QUO_INT( i_3, deduped_12_2 ^ QUO_INT( i_3, deduped_10_2 ) ), deduped_12_2 );
                  end );
              deduped_4_2 := deduped_9_1[deduped_13_2];
              hoisted_3_2 := Product( deduped_9_1{[ 1 .. deduped_13_2 - 1 ]} );
              hoisted_5_2 := List( deduped_35_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_3_2 ), deduped_4_2 );
                  end );
              hoisted_6_2 := List( hoisted_33_1, function ( logic_new_func_x_3 )
                      return hoisted_5_2[1 + hoisted_32_1[(1 + hoisted_31_1[(1 + logic_new_func_x_3)])]];
                  end );
              hoisted_9_2 := List( [ 0 .. deduped_46_1 * deduped_11_2 - 1 ], function ( logic_new_func_x_3 )
                      local deduped_1_3;
                      deduped_1_3 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_3 );
                      return hoisted_8_2[1 + (hoisted_6_2[1 + REM_INT( deduped_1_3, deduped_46_1 )] + REM_INT( QUO_INT( deduped_1_3, deduped_46_1 ), deduped_11_2 ) * deduped_4_2)];
                  end );
              return CreateCapCategoryMorphismWithAttributes( hoisted_34_1, deduped_42_1[i_2], deduped_45_1[i_2], AsList, List( [ 0 .. deduped_11_2 - 1 ], function ( i_3 )
                        return hoisted_9_2[1 + i_3];
                    end ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, hoisted_9_1, hoisted_10_1, deduped_11_1, deduped_13_1, deduped_14_1, hoisted_15_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, deduped_21_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, deduped_28_1, deduped_29_1, hoisted_30_1, hoisted_33_1, hoisted_34_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1;
    deduped_52_1 := ValuesOfPreSheaf( arg3_1 );
    deduped_51_1 := ValuesOfPreSheaf( arg2_1 );
    deduped_50_1 := Source( cat_1 );
    deduped_49_1 := deduped_51_1[2];
    deduped_48_1 := deduped_52_1[1];
    deduped_47_1 := deduped_51_1[1];
    deduped_46_1 := DefiningTripleOfUnderlyingQuiver( deduped_50_1 );
    deduped_45_1 := ListOfValues( deduped_47_1 );
    deduped_44_1 := deduped_46_1[1];
    deduped_43_1 := [ 1 .. deduped_44_1 ];
    deduped_42_1 := [ 0 .. deduped_46_1[2] - 1 ];
    deduped_41_1 := [ 0 .. deduped_44_1 - 1 ];
    deduped_3_1 := List( deduped_48_1, Length );
    deduped_2_1 := SetOfObjects( deduped_50_1 );
    deduped_1_1 := List( deduped_47_1, Length );
    deduped_40_1 := Concatenation( List( deduped_41_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + logic_new_func_x_2;
              return List( ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] ), function ( logic_new_func_x_3 )
                      return deduped_3_1[SafePosition( deduped_2_1, logic_new_func_x_3 )];
                  end );
          end ) );
    deduped_4_1 := List( deduped_49_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    deduped_39_1 := [ 0 .. Sum( List( deduped_42_1, function ( logic_new_func_x_2 )
                    return Length( [ 0 .. deduped_4_1[1 + logic_new_func_x_2] - 1 ] );
                end ) ) - 1 ];
    deduped_38_1 := [ 0 .. Product( deduped_40_1 ) - 1 ];
    deduped_7_1 := List( deduped_41_1, function ( i_2 )
            return Sum( List( [ 1 .. i_2 ], function ( j_3 )
                      return deduped_1_1[j_3];
                  end ) );
        end );
    deduped_6_1 := deduped_46_1[3];
    hoisted_24_1 := Concatenation( List( deduped_42_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, deduped_2_2;
              deduped_2_2 := 1 + logic_new_func_x_2;
              hoisted_1_2 := deduped_7_1[1 + deduped_6_1[deduped_2_2][2]];
              return List( [ 0 .. deduped_4_1[deduped_2_2] - 1 ], function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := logic_new_func_x_3 + hoisted_1_2;
                      hoisted_2_3 := deduped_40_1[1 + deduped_3_3];
                      hoisted_1_3 := Product( deduped_40_1{[ 1 .. deduped_3_3 ]} );
                      return List( deduped_38_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    deduped_14_1 := List( deduped_52_1[2], AsList );
    deduped_13_1 := SetOfGeneratingMorphisms( deduped_50_1 );
    deduped_11_1 := UnderlyingQuiverAlgebra( deduped_50_1 );
    hoisted_23_1 := Concatenation( List( deduped_42_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + logic_new_func_x_2;
              return List( ListWithIdenticalEntries( deduped_4_1[deduped_1_2], deduped_13_1[deduped_1_2] ), function ( logic_new_func_x_3 )
                      local deduped_1_3, deduped_2_3;
                      deduped_2_3 := Source( logic_new_func_x_3 );
                      deduped_1_3 := UnderlyingVertex( deduped_2_3 );
                      if IdFunc( function (  )
                                  if true and UnderlyingVertex( Range( logic_new_func_x_3 ) ) = deduped_1_3 then
                                      return UnderlyingQuiverAlgebraElement( logic_new_func_x_3 ) = PathAsAlgebraElement( deduped_11_1, QuiverVertexAsIdentityPath( deduped_1_3 ) );
                                  else
                                      return false;
                                  fi;
                                  return;
                              end )(  ) then
                          return [ 0 .. deduped_3_1[SafePosition( deduped_2_1, deduped_2_3 )] - 1 ];
                      else
                          return deduped_14_1[SafeUniquePosition( deduped_13_1, logic_new_func_x_3 )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_25_1 := List( deduped_39_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_23_1[deduped_3_2];
            hoisted_1_2 := hoisted_24_1[deduped_3_2];
            return List( deduped_38_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_8_1 := Concatenation( List( deduped_41_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] );
          end ) );
    deduped_5_1 := List( deduped_49_1, AsList );
    hoisted_20_1 := Concatenation( List( deduped_42_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + logic_new_func_x_2;
              hoisted_2_2 := deduped_7_1[1 + deduped_6_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_5_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( logic_new_func_x_3 )
                      return deduped_3_1[SafePosition( deduped_2_1, deduped_8_1[1 + (hoisted_1_2[1 + logic_new_func_x_3] + hoisted_2_2)] )];
                  end );
          end ) );
    deduped_21_1 := List( deduped_39_1, function ( j_2 )
            return Product( hoisted_20_1{[ 1 .. j_2 ]} );
        end );
    hoisted_18_1 := Concatenation( List( deduped_42_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + logic_new_func_x_2;
              hoisted_2_2 := deduped_7_1[1 + deduped_6_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_5_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( logic_new_func_x_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := hoisted_1_2[1 + logic_new_func_x_3] + hoisted_2_2;
                      hoisted_2_3 := deduped_40_1[1 + deduped_3_3];
                      hoisted_1_3 := Product( deduped_40_1{[ 1 .. deduped_3_3 ]} );
                      return List( deduped_38_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_10_1 := Concatenation( List( deduped_41_1, function ( logic_new_func_x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + logic_new_func_x_2;
              return List( ListWithIdenticalEntries( deduped_1_1[deduped_1_2], deduped_2_1[deduped_1_2] ), function ( logic_new_func_x_3 )
                      return QuiverVertexAsIdentityPath( UnderlyingVertex( logic_new_func_x_3 ) );
                  end );
          end ) );
    if true and true then
        hoisted_9_1 := true;
    else
        hoisted_9_1 := false;
    fi;
    hoisted_15_1 := Concatenation( List( deduped_42_1, function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + logic_new_func_x_2;
              hoisted_2_2 := deduped_7_1[1 + deduped_6_1[deduped_3_2][1]];
              hoisted_1_2 := deduped_5_1[deduped_3_2];
              return List( [ 0 .. deduped_4_1[deduped_3_2] - 1 ], function ( logic_new_func_x_3 )
                      local deduped_1_3, deduped_2_3;
                      deduped_2_3 := 1 + (hoisted_1_2[1 + logic_new_func_x_3] + hoisted_2_2);
                      deduped_1_3 := deduped_8_1[deduped_2_3];
                      if hoisted_9_1 then
                          return [ 0 .. deduped_3_1[SafePosition( deduped_2_1, deduped_1_3 )] - 1 ];
                      else
                          return deduped_14_1[SafeUniquePosition( deduped_13_1, CreateCapCategoryMorphismWithAttributes( deduped_50_1, deduped_1_3, deduped_1_3, UnderlyingQuiverAlgebraElement, PathAsAlgebraElement( deduped_11_1, hoisted_10_1[deduped_2_3] ) ) )];
                      fi;
                      return;
                  end );
          end ) );
    hoisted_19_1 := List( deduped_39_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + logic_new_func_x_2;
            hoisted_2_2 := hoisted_15_1[deduped_3_2];
            hoisted_1_2 := hoisted_18_1[deduped_3_2];
            return List( deduped_38_1, function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_37_1 := Filtered( deduped_38_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return Sum( deduped_39_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_19_1[deduped_1_3][deduped_1_2] * deduped_21_1[deduped_1_3];
                  end ) = Sum( deduped_39_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_25_1[deduped_1_3][deduped_1_2] * deduped_21_1[deduped_1_3];
                  end );
        end );
    deduped_36_1 := Length( deduped_37_1 );
    hoisted_34_1 := Range( cat_1 );
    deduped_28_1 := List( deduped_45_1, Length );
    deduped_29_1 := List( deduped_43_1, function ( logic_new_func_x_2 )
            return Product( deduped_40_1{[ 1 + Sum( deduped_28_1{[ 1 .. (logic_new_func_x_2 - 1) ]} ) .. Sum( deduped_28_1{[ 1 .. logic_new_func_x_2 ]} ) ]} );
        end );
    hoisted_33_1 := List( deduped_43_1, function ( logic_new_func_x_2 )
            return deduped_29_1[logic_new_func_x_2];
        end );
    hoisted_30_1 := List( deduped_43_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_2_2 := deduped_29_1[logic_new_func_x_2];
            hoisted_1_2 := Product( deduped_29_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( deduped_38_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    return List( [ 0 .. deduped_36_1 - 1 ], function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2;
            deduped_2_2 := CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 );
            hoisted_1_2 := 1 + deduped_37_1[(1 + REM_INT( QUO_INT( deduped_2_2, deduped_36_1 ^ QUO_INT( deduped_2_2, deduped_36_1 ) ), deduped_36_1 ))];
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, ValuesOnAllObjects, List( deduped_43_1, function ( i_3 )
                      local hoisted_4_3, hoisted_5_3, hoisted_6_3, deduped_7_3, deduped_8_3, deduped_9_3;
                      deduped_9_3 := deduped_3_1[i_3];
                      deduped_8_3 := deduped_28_1[i_3];
                      deduped_7_3 := deduped_9_3 ^ deduped_8_3;
                      hoisted_6_3 := List( [ 0 .. deduped_7_3 * deduped_8_3 - 1 ], function ( i_4 )
                              return REM_INT( QUO_INT( i_4, deduped_9_3 ^ QUO_INT( i_4, deduped_7_3 ) ), deduped_9_3 );
                          end );
                      hoisted_5_3 := hoisted_30_1[i_3][hoisted_1_2];
                      hoisted_4_3 := hoisted_33_1[i_3];
                      return CreateCapCategoryMorphismWithAttributes( hoisted_34_1, deduped_45_1[i_3], deduped_48_1[i_3], AsList, List( [ 0 .. deduped_8_3 - 1 ], function ( logic_new_func_x_4 )
                                return hoisted_6_3[1 + (hoisted_5_3 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_4 ), deduped_8_3 ) * hoisted_4_3)];
                            end ) );
                  end ) );
        end );
end
########
        
    , 501 : IsPrecompiledDerivation := true );
    
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
