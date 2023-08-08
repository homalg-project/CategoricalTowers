# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_FinQuiversAsCCCPrecompiled", function ( cat )
    
    ##
    AddExponentialOnObjects( cat,
        
########
function ( cat_1, a_1, b_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, hoisted_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, hoisted_14_1, deduped_15_1, hoisted_16_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, deduped_22_1, hoisted_24_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, hoisted_32_1, deduped_33_1, deduped_35_1, hoisted_37_1, deduped_38_1, deduped_39_1, hoisted_41_1, hoisted_42_1, deduped_44_1, deduped_46_1, hoisted_47_1, deduped_48_1, hoisted_50_1, hoisted_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1, deduped_58_1, deduped_59_1, deduped_60_1, deduped_61_1, deduped_62_1, deduped_63_1, deduped_64_1, deduped_65_1, deduped_66_1, deduped_67_1, deduped_68_1, deduped_69_1, deduped_70_1, deduped_71_1, deduped_72_1, deduped_73_1, deduped_74_1, deduped_75_1, deduped_76_1, deduped_77_1, deduped_78_1, deduped_79_1, deduped_80_1, deduped_81_1, deduped_82_1, deduped_83_1, deduped_84_1, deduped_85_1, deduped_86_1, deduped_87_1, deduped_88_1, deduped_89_1;
    deduped_89_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_88_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( b_1 );
    deduped_87_1 := UnderlyingCategory( cat_1 );
    deduped_86_1 := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( a_1 );
    deduped_85_1 := deduped_88_1[3];
    deduped_84_1 := deduped_86_1[3];
    deduped_83_1 := deduped_88_1[2];
    deduped_82_1 := deduped_88_1[1];
    deduped_81_1 := CreateCapCategoryObjectWithAttributes( deduped_87_1, IndexOfObject, 1 );
    deduped_80_1 := deduped_86_1[2];
    deduped_79_1 := CreateCapCategoryObjectWithAttributes( deduped_87_1, IndexOfObject, 0 );
    deduped_78_1 := deduped_86_1[1];
    deduped_77_1 := CreateCapCategoryObjectWithAttributes( deduped_89_1, Length, deduped_78_1 );
    deduped_76_1 := CreateCapCategoryMorphismWithAttributes( deduped_87_1, deduped_79_1, deduped_81_1, IndexOfMorphism, 2 );
    deduped_75_1 := CreateCapCategoryMorphismWithAttributes( deduped_87_1, deduped_79_1, deduped_81_1, IndexOfMorphism, 1 );
    deduped_74_1 := ListWithIdenticalEntries( deduped_80_1, deduped_81_1 );
    deduped_73_1 := 2 * deduped_78_1;
    deduped_72_1 := ListWithIdenticalEntries( deduped_78_1, deduped_79_1 );
    deduped_71_1 := [ 0 .. deduped_78_1 - 1 ];
    deduped_70_1 := [ 0 .. deduped_80_1 - 1 ];
    deduped_69_1 := CreateCapCategoryMorphismWithAttributes( deduped_89_1, CreateCapCategoryObjectWithAttributes( deduped_89_1, Length, 0 ), CreateCapCategoryObjectWithAttributes( deduped_89_1, Length, deduped_80_1 ), AsList, [  ] );
    deduped_68_1 := CreateCapCategoryObjectWithAttributes( deduped_89_1, Length, deduped_73_1 );
    deduped_67_1 := ListWithIdenticalEntries( deduped_73_1, deduped_79_1 );
    deduped_66_1 := [ 0 .. deduped_80_1 + deduped_80_1 - 1 ];
    deduped_2_1 := [ deduped_82_1, deduped_83_1 ];
    deduped_1_1 := [ deduped_79_1, deduped_81_1 ];
    deduped_65_1 := List( deduped_72_1, function ( objB_2 )
            local hoisted_1_2;
            hoisted_1_2 := IndexOfObject( objB_2 );
            return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                     return IndexOfObject( obj_3 ) = hoisted_1_2;
                 end )];
        end );
    deduped_64_1 := ListOfValues( [ CreateCapCategoryMorphismWithAttributes( deduped_89_1, deduped_77_1, deduped_68_1, AsList, List( deduped_71_1, function ( i_2 )
                    return 1 + i_2 * 2;
                end ) ), deduped_69_1 ] );
    deduped_63_1 := ListOfValues( [ CreateCapCategoryMorphismWithAttributes( deduped_89_1, deduped_77_1, deduped_68_1, AsList, List( deduped_71_1, function ( i_2 )
                    return i_2 * 2;
                end ) ), deduped_69_1 ] );
    deduped_61_1 := Concatenation( List( deduped_67_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_74_1, function ( objB_2 )
              local hoisted_1_2;
              hoisted_1_2 := IndexOfObject( objB_2 );
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ) );
    deduped_60_1 := Product( deduped_61_1 );
    deduped_55_1 := [ 0 .. deduped_60_1 - 1 ];
    deduped_62_1 := List( deduped_70_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + (i_2 + deduped_73_1);
            hoisted_2_2 := deduped_61_1[deduped_3_2];
            hoisted_1_2 := Product( deduped_61_1{[ 1 .. deduped_3_2 - 1 ]} );
            return List( deduped_55_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
        end );
    deduped_59_1 := [ 1 .. Length( deduped_64_1 ) ];
    deduped_58_1 := [ 1 .. Length( deduped_63_1 ) ];
    deduped_57_1 := [ 0 .. Product( deduped_65_1 ) - 1 ];
    deduped_56_1 := ListWithIdenticalEntries( Length( deduped_70_1 ), deduped_60_1 );
    deduped_54_1 := Filtered( deduped_57_1, function ( x_2 )
            return true;
        end );
    hoisted_26_1 := Concatenation( deduped_62_1, deduped_62_1 );
    deduped_13_1 := [ List( deduped_85_1, function ( a_2 )
                return a_2[1];
            end ), List( deduped_85_1, function ( a_2 )
                return a_2[2];
            end ) ];
    deduped_12_1 := [ deduped_75_1, deduped_76_1 ];
    deduped_11_1 := [ 0, 1, 2, 3 ];
    deduped_10_1 := [ 0, 1, 1, 1 ];
    deduped_9_1 := [ 0, 0, 0, 1 ];
    deduped_8_1 := [ 0, 3 ];
    hoisted_24_1 := Concatenation( List( ListWithIdenticalEntries( deduped_80_1, deduped_75_1 ), function ( morB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := IndexOfMorphism( morB_2 );
              deduped_6_2 := IndexOfObject( Range( morB_2 ) );
              deduped_5_2 := IndexOfObject( Source( morB_2 ) );
              deduped_4_2 := 1 + deduped_8_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_9_1[deduped_4_2] and deduped_6_2 = deduped_10_1[deduped_4_2] then
                              return deduped_7_2 = deduped_11_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePositionProperty( deduped_12_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( ListWithIdenticalEntries( deduped_80_1, deduped_76_1 ), function ( morB_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2;
              deduped_7_2 := IndexOfMorphism( morB_2 );
              deduped_6_2 := IndexOfObject( Range( morB_2 ) );
              deduped_5_2 := IndexOfObject( Source( morB_2 ) );
              deduped_4_2 := 1 + deduped_8_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_9_1[deduped_4_2] and deduped_6_2 = deduped_10_1[deduped_4_2] then
                              return deduped_7_2 = deduped_11_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePositionProperty( deduped_12_1, function ( mor_3 )
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
    deduped_3_1 := Concatenation( deduped_56_1, deduped_56_1 );
    hoisted_27_1 := List( deduped_66_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_24_1[deduped_3_2];
            hoisted_1_2 := hoisted_26_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    hoisted_14_1 := List( deduped_84_1, function ( a_2 )
            return a_2[2];
        end );
    deduped_15_1 := List( deduped_70_1, function ( i_2 )
            return 1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_14_1[(1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), deduped_80_1 ))] ) * 2;
        end );
    deduped_7_1 := Concatenation( List( deduped_67_1, IndexOfObject ), List( deduped_74_1, IndexOfObject ) );
    hoisted_5_1 := List( deduped_84_1, function ( a_2 )
            return a_2[1];
        end );
    deduped_6_1 := List( deduped_70_1, function ( i_2 )
            return CAP_JIT_INCOMPLETE_LOGIC( hoisted_5_1[(1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), deduped_80_1 ))] ) * 2;
        end );
    hoisted_21_1 := Concatenation( List( deduped_70_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_7_1[1 + deduped_6_1[(1 + i_2)]];
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ), List( deduped_70_1, function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := deduped_7_1[1 + deduped_15_1[(1 + i_2)]];
              return deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                       return IndexOfObject( obj_3 ) = hoisted_1_2;
                   end )];
          end ) );
    deduped_22_1 := List( deduped_66_1, function ( j_2 )
            return Product( hoisted_21_1{[ 1 .. j_2 ]} );
        end );
    hoisted_19_1 := Concatenation( List( deduped_70_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_6_1[(1 + i_2)];
              hoisted_2_2 := deduped_61_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_61_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_55_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ), List( deduped_70_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := 1 + deduped_15_1[(1 + i_2)];
              hoisted_2_2 := deduped_61_1[deduped_3_2];
              hoisted_1_2 := Product( deduped_61_1{[ 1 .. deduped_3_2 - 1 ]} );
              return List( deduped_55_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                  end );
          end ) );
    hoisted_16_1 := Concatenation( List( deduped_70_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_8_1[(1 + deduped_7_1[(1 + deduped_6_1[(1 + i_2)])])];
              deduped_7_2 := deduped_11_1[deduped_8_2];
              deduped_6_2 := deduped_10_1[deduped_8_2];
              deduped_5_2 := deduped_9_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_8_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_9_1[deduped_4_2] and deduped_6_2 = deduped_10_1[deduped_4_2] then
                              return deduped_7_2 = deduped_11_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePositionProperty( deduped_12_1, function ( mor_3 )
                           if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                               return IndexOfMorphism( mor_3 ) = deduped_7_2;
                           else
                               return false;
                           fi;
                           return;
                       end )];
              fi;
              return;
          end ), List( deduped_70_1, function ( i_2 )
              local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
              deduped_8_2 := 1 + deduped_8_1[(1 + deduped_7_1[(1 + deduped_15_1[(1 + i_2)])])];
              deduped_7_2 := deduped_11_1[deduped_8_2];
              deduped_6_2 := deduped_10_1[deduped_8_2];
              deduped_5_2 := deduped_9_1[deduped_8_2];
              deduped_4_2 := 1 + deduped_8_1[(1 + deduped_5_2)];
              if IdFunc( function (  )
                          if deduped_5_2 = deduped_9_1[deduped_4_2] and deduped_6_2 = deduped_10_1[deduped_4_2] then
                              return deduped_7_2 = deduped_11_1[deduped_4_2];
                          else
                              return false;
                          fi;
                          return;
                      end )(  ) then
                  return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                                 return (IndexOfObject( obj_3 ) = deduped_5_2);
                             end )] - 1 ];
              else
                  return deduped_13_1[SafeUniquePositionProperty( deduped_12_1, function ( mor_3 )
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
    hoisted_20_1 := List( deduped_66_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := hoisted_16_1[deduped_3_2];
            hoisted_1_2 := hoisted_19_1[deduped_3_2];
            return List( [ 0 .. deduped_3_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_53_1 := Filtered( deduped_55_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_66_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_20_1[deduped_1_3][deduped_1_2] * deduped_22_1[deduped_1_3];
                    end ) ) = CAP_JIT_INCOMPLETE_LOGIC( Sum( deduped_66_1, function ( j_3 )
                        local deduped_1_3;
                        deduped_1_3 := 1 + j_3;
                        return hoisted_27_1[deduped_1_3][deduped_1_2] * deduped_22_1[deduped_1_3];
                    end ) );
        end );
    deduped_52_1 := Length( deduped_53_1 );
    deduped_48_1 := List( deduped_64_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_46_1 := List( deduped_64_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_50_1 := Concatenation( List( deduped_59_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := Sum( deduped_48_1{[ 1 .. i_2 - 1 ]} );
              hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_48_1[i_2] - 1 ];
              hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( AsList( CAP_JIT_INCOMPLETE_LOGIC( deduped_64_1[i_2] ) ) );
              return List( [ 0 .. deduped_46_1[i_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + hoisted_2_2[(1 + hoisted_1_2[(1 + i_3)])];
                      hoisted_2_3 := deduped_61_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_61_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_55_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_47_1 := Concatenation( List( deduped_59_1, function ( i_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_46_1[i_2] - 1 ] ), deduped_60_1 );
          end ) );
    deduped_38_1 := List( deduped_72_1, function ( objB_2 )
            local deduped_4_2, deduped_5_2, deduped_6_2, deduped_7_2, deduped_8_2;
            deduped_8_2 := 1 + deduped_8_1[(1 + IndexOfObject( objB_2 ))];
            deduped_7_2 := deduped_11_1[deduped_8_2];
            deduped_6_2 := deduped_10_1[deduped_8_2];
            deduped_5_2 := deduped_9_1[deduped_8_2];
            deduped_4_2 := 1 + deduped_8_1[(1 + deduped_5_2)];
            if IdFunc( function (  )
                        if deduped_5_2 = deduped_9_1[deduped_4_2] and deduped_6_2 = deduped_10_1[deduped_4_2] then
                            return deduped_7_2 = deduped_11_1[deduped_4_2];
                        else
                            return false;
                        fi;
                        return;
                    end )(  ) then
                return [ 0 .. deduped_2_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                               return (IndexOfObject( obj_3 ) = deduped_5_2);
                           end )] - 1 ];
            else
                return deduped_13_1[SafeUniquePositionProperty( deduped_12_1, function ( mor_3 )
                         if IndexOfObject( Source( mor_3 ) ) = deduped_5_2 and IndexOfObject( Range( mor_3 ) ) = deduped_6_2 then
                             return IndexOfMorphism( mor_3 ) = deduped_7_2;
                         else
                             return false;
                         fi;
                         return;
                     end )];
            fi;
            return;
        end );
    hoisted_51_1 := List( [ 0 .. Sum( List( deduped_59_1, function ( i_2 )
                      return Length( [ 0 .. deduped_46_1[i_2] - 1 ] );
                  end ) ) - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := deduped_38_1[deduped_3_2];
            hoisted_1_2 := hoisted_50_1[deduped_3_2];
            return List( [ 0 .. hoisted_47_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    deduped_33_1 := List( deduped_71_1, function ( j_2 )
            return Product( deduped_65_1{[ 1 .. j_2 ]} );
        end );
    hoisted_28_1 := [ [ 0 .. deduped_82_1 - 1 ], [ 0 .. deduped_83_1 - 1 ] ];
    hoisted_29_1 := List( deduped_72_1, function ( objB_2 )
            local hoisted_1_2;
            hoisted_1_2 := IndexOfObject( objB_2 );
            return hoisted_28_1[SafeUniquePositionProperty( deduped_1_1, function ( obj_3 )
                     return IndexOfObject( obj_3 ) = hoisted_1_2;
                 end )];
        end );
    hoisted_32_1 := List( [ 1 .. deduped_78_1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_29_1[i_2];
            hoisted_2_2 := deduped_65_1[i_2];
            hoisted_1_2 := Product( deduped_65_1{[ 1 .. i_2 - 1 ]} );
            return List( deduped_57_1, function ( i_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    deduped_44_1 := List( deduped_57_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( deduped_71_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_32_1[deduped_1_3][hoisted_1_2] * deduped_33_1[deduped_1_3];
                end );
        end );
    deduped_39_1 := List( deduped_63_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_35_1 := List( deduped_63_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_41_1 := Concatenation( List( deduped_58_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := Sum( deduped_39_1{[ 1 .. i_2 - 1 ]} );
              hoisted_2_2 := [ deduped_3_2 .. deduped_3_2 + deduped_39_1[i_2] - 1 ];
              hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( AsList( CAP_JIT_INCOMPLETE_LOGIC( deduped_63_1[i_2] ) ) );
              return List( [ 0 .. deduped_35_1[i_2] - 1 ], function ( i_3 )
                      local hoisted_1_3, hoisted_2_3, deduped_3_3;
                      deduped_3_3 := 1 + hoisted_2_2[(1 + hoisted_1_2[(1 + i_3)])];
                      hoisted_2_3 := deduped_61_1[deduped_3_3];
                      hoisted_1_3 := Product( deduped_61_1{[ 1 .. deduped_3_3 - 1 ]} );
                      return List( deduped_55_1, function ( i_4 )
                              return REM_INT( QUO_INT( i_4, hoisted_1_3 ), hoisted_2_3 );
                          end );
                  end );
          end ) );
    hoisted_37_1 := Concatenation( List( deduped_58_1, function ( i_2 )
              return ListWithIdenticalEntries( Length( [ 0 .. deduped_35_1[i_2] - 1 ] ), deduped_60_1 );
          end ) );
    hoisted_42_1 := List( [ 0 .. Sum( List( deduped_58_1, function ( i_2 )
                      return Length( [ 0 .. deduped_35_1[i_2] - 1 ] );
                  end ) ) - 1 ], function ( i_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2;
            deduped_3_2 := 1 + i_2;
            hoisted_2_2 := deduped_38_1[deduped_3_2];
            hoisted_1_2 := hoisted_41_1[deduped_3_2];
            return List( [ 0 .. hoisted_37_1[deduped_3_2] - 1 ], function ( i_3 )
                    return hoisted_2_2[1 + hoisted_1_2[(1 + i_3)]];
                end );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfQuiverEnrichedOverSkeletalFinSets, NTuple( 3, Length( deduped_54_1 ), deduped_52_1, List( [ 0 .. deduped_52_1 - 1 ], function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + CAP_JIT_INCOMPLETE_LOGIC( deduped_53_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( x_2 ))] );
                return NTuple( 2, -1 + BigInt( SafePosition( deduped_54_1, CAP_JIT_INCOMPLETE_LOGIC( deduped_44_1[(1 + Sum( deduped_71_1, function ( j_3 )
                                     local deduped_1_3;
                                     deduped_1_3 := (1 + j_3);
                                     return hoisted_42_1[deduped_1_3][deduped_1_2] * deduped_33_1[deduped_1_3];
                                 end ))] ) ) ), -1 + BigInt( SafePosition( deduped_54_1, CAP_JIT_INCOMPLETE_LOGIC( deduped_44_1[(1 + Sum( deduped_71_1, function ( j_3 )
                                     local deduped_1_3;
                                     deduped_1_3 := (1 + j_3);
                                     return hoisted_51_1[deduped_1_3][deduped_1_2] * deduped_33_1[deduped_1_3];
                                 end ))] ) ) ) );
            end ) ) );
end
########
        
    , 100 );
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        #Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
end );

BindGlobal( "FinQuiversAsCCCPrecompiled", function (  )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function (  )
    return CategoryOfQuiversEnrichedOver( CategoryOfSkeletalFinSets(  : FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_FinQuiversAsCCCPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
