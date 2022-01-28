# SPDX-License-Identifier: GPL-2.0-or-later
# Algebroids: Algebroids and bialgebroids as preadditive categories generated by enhanced quivers
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_AdditiveClosureOfAlgebroidOfFiniteDimensionalQuotientOfPathAlgebraOfRightQuiverOverFieldPrecompiled", function ( cat )
    
    ##
    AddAdditionForMorphisms( cat,
        
########
function ( cat_1, a_1, b_1 )
    local hoisted_3_1, hoisted_4_1, deduped_5_1;
    deduped_5_1 := Source( a_1 );
    hoisted_4_1 := [ 1 .. NumberColumns( a_1 ) ];
    hoisted_3_1 := UnderlyingCategory( cat_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, deduped_5_1, Range( a_1 ), MorphismMatrix, List( [ 1 .. Length( ObjectList( deduped_5_1 ) ) ], function ( i_2 )
              return List( hoisted_4_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := MatElm( a_1, i_2, j_3 );
                      return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                             ), hoisted_3_1, Source( deduped_1_3 ), Range( deduped_1_3 ), UnderlyingQuiverAlgebraElement, UnderlyingQuiverAlgebraElement( deduped_1_3 ) + UnderlyingQuiverAlgebraElement( MatElm( b_1, i_2, j_3 ) ) );
                  end );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddAdditiveInverseForMorphisms( cat,
        
########
function ( cat_1, a_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1;
    deduped_3_1 := Source( a_1 );
    hoisted_2_1 := [ 1 .. NumberColumns( a_1 ) ];
    hoisted_1_1 := UnderlyingCategory( cat_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, deduped_3_1, Range( a_1 ), MorphismMatrix, List( [ 1 .. Length( ObjectList( deduped_3_1 ) ) ], function ( i_2 )
              return List( hoisted_2_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := MatElm( a_1, i_2, j_3 );
                      return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                             ), hoisted_1_1, Source( deduped_1_3 ), Range( deduped_1_3 ), UnderlyingQuiverAlgebraElement, - UnderlyingQuiverAlgebraElement( deduped_1_3 ) );
                  end );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddComponentOfMorphismFromDirectSum( cat,
        
########
function ( cat_1, alpha_1, S_1, i_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := List( S_1, function ( s_2 )
            return Length( ObjectList( s_2 ) );
        end );
    deduped_1_1 := Sum( deduped_2_1{[ 1 .. i_1 - 1 ]} ) + 1;
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, S_1[i_1], Range( alpha_1 ), MorphismMatrix, MorphismMatrix( alpha_1 ){[ deduped_1_1 .. deduped_1_1 - 1 + deduped_2_1[i_1] ]} );
end
########
        
    , 100 );
    
    ##
    AddComponentOfMorphismIntoDirectSum( cat,
        
########
function ( cat_1, alpha_1, S_1, i_1 )
    local hoisted_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := List( S_1, function ( s_2 )
            return Length( ObjectList( s_2 ) );
        end );
    deduped_2_1 := Sum( deduped_3_1{[ 1 .. i_1 - 1 ]} ) + 1;
    hoisted_1_1 := [ deduped_2_1 .. deduped_2_1 - 1 + deduped_3_1[i_1] ];
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, Source( alpha_1 ), S_1[i_1], MorphismMatrix, List( MorphismMatrix( alpha_1 ), function ( row_2 )
              return row_2{hoisted_1_1};
          end ) );
end
########
        
    , 100 );
    
    ##
    AddDirectSum( cat,
        
########
function ( cat_1, arg2_1 )
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), cat_1, ObjectList, Concatenation( List( arg2_1, ObjectList ) ) );
end
########
        
    , 100 );
    
    ##
    AddDistinguishedObjectOfHomomorphismStructure( cat,
        
########
function ( cat_1 )
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), RangeCategoryOfHomomorphismStructure( cat_1 ), Dimension, 1 );
end
########
        
    , 100 );
    
    ##
    AddHomomorphismStructureOnMorphismsWithGivenObjects( cat,
        
########
function ( cat_1, source_1, alpha_1, beta_1, range_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1;
    deduped_23_1 := Range( beta_1 );
    deduped_22_1 := Source( beta_1 );
    deduped_21_1 := UnderlyingCategory( cat_1 );
    deduped_20_1 := Source( alpha_1 );
    deduped_19_1 := Range( alpha_1 );
    deduped_18_1 := Dimension( range_1 );
    deduped_17_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_16_1 := BasisPathsByVertexIndex( deduped_21_1 );
    deduped_15_1 := [ 1 .. Length( ObjectList( deduped_20_1 ) ) ];
    deduped_14_1 := [ 1 .. Length( ObjectList( deduped_19_1 ) ) ];
    hoisted_13_1 := deduped_15_1;
    hoisted_12_1 := HomStructureOnBasisPaths( deduped_21_1 );
    hoisted_11_1 := deduped_16_1;
    hoisted_8_1 := [ 1 .. Length( ObjectList( deduped_23_1 ) ) ];
    hoisted_7_1 := deduped_23_1;
    hoisted_6_1 := deduped_20_1;
    hoisted_2_1 := List( deduped_16_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, Length );
        end );
    hoisted_9_1 := List( deduped_15_1, function ( logic_new_func_x_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_2_1[VertexIndex( UnderlyingVertex( hoisted_6_1[logic_new_func_x_2] ) )];
            return List( hoisted_8_1, function ( logic_new_func_x_3 )
                    return hoisted_1_2[VertexIndex( UnderlyingVertex( hoisted_7_1[logic_new_func_x_3] ) )];
                end );
        end );
    hoisted_10_1 := List( deduped_15_1, function ( logic_new_func_x_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_9_1[logic_new_func_x_2];
            return Sum( List( hoisted_8_1, function ( logic_new_func_x_3 )
                      return hoisted_1_2[logic_new_func_x_3];
                  end ) );
        end );
    hoisted_4_1 := [ 1 .. Length( ObjectList( deduped_22_1 ) ) ];
    hoisted_3_1 := deduped_22_1;
    hoisted_1_1 := deduped_19_1;
    hoisted_5_1 := List( deduped_14_1, function ( logic_new_func_x_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_2_1[VertexIndex( UnderlyingVertex( hoisted_1_1[logic_new_func_x_2] ) )];
            return List( hoisted_4_1, function ( logic_new_func_x_3 )
                    return hoisted_1_2[VertexIndex( UnderlyingVertex( hoisted_3_1[logic_new_func_x_3] ) )];
                end );
        end );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), deduped_17_1, source_1, range_1, UnderlyingMatrix, HomalgMatrixListList( UnionOfRowsListList( deduped_18_1, List( deduped_14_1, function ( logic_new_func_x_2 )
                  local hoisted_1_2, hoisted_2_2;
                  hoisted_1_2 := hoisted_5_1[logic_new_func_x_2];
                  hoisted_2_2 := Sum( hoisted_4_1, function ( logic_new_func_x_3 )
                          return hoisted_1_2[logic_new_func_x_3];
                      end );
                  return UnionOfColumnsListList( Sum( List( hoisted_4_1, function ( logic_new_func_x_3 )
                              return hoisted_1_2[logic_new_func_x_3];
                          end ) ), List( hoisted_13_1, function ( logic_new_func_x_3 )
                            local hoisted_1_3, hoisted_2_3, hoisted_3_3, hoisted_4_3, hoisted_5_3, hoisted_6_3, deduped_7_3, deduped_8_3, deduped_9_3, deduped_10_3, deduped_11_3;
                            deduped_11_3 := hoisted_10_1[logic_new_func_x_3];
                            deduped_10_3 := MatElm( alpha_1, logic_new_func_x_3, logic_new_func_x_2 );
                            deduped_9_3 := UnderlyingQuiverAlgebraElement( deduped_10_3 );
                            if IsZero( deduped_9_3 ) then
                                return NullMatImmutable( hoisted_2_2, deduped_11_3 );
                            else
                                deduped_8_3 := VertexIndex( UnderlyingVertex( Range( deduped_10_3 ) ) );
                                deduped_7_3 := VertexIndex( UnderlyingVertex( Source( deduped_10_3 ) ) );
                                hoisted_6_3 := [ 1 .. hoisted_2_1[deduped_7_3][deduped_8_3] ];
                                hoisted_5_3 := deduped_7_3;
                                hoisted_4_3 := hoisted_12_1[deduped_8_3];
                                hoisted_3_3 := CoefficientsOfPaths( hoisted_11_1[deduped_7_3][deduped_8_3], deduped_9_3 );
                                hoisted_1_3 := hoisted_9_1[logic_new_func_x_3];
                                hoisted_2_3 := Sum( hoisted_8_1, function ( logic_new_func_x_4 )
                                        return hoisted_1_3[logic_new_func_x_4];
                                    end );
                                return UnionOfRowsListList( deduped_11_3, List( hoisted_4_1, function ( logic_new_func_x_4 )
                                          local hoisted_1_4, deduped_2_4;
                                          deduped_2_4 := hoisted_1_2[logic_new_func_x_4];
                                          if deduped_2_4 = 0 then
                                              return NullMatImmutable( deduped_2_4, hoisted_2_3 );
                                          else
                                              hoisted_1_4 := deduped_2_4;
                                              return UnionOfColumnsListList( deduped_2_4, List( hoisted_8_1, function ( logic_new_func_x_5 )
                                                        local hoisted_1_5, hoisted_2_5, hoisted_3_5, deduped_4_5, deduped_5_5, deduped_6_5, deduped_7_5, deduped_8_5;
                                                        deduped_8_5 := hoisted_1_3[logic_new_func_x_5];
                                                        deduped_7_5 := MatElm( beta_1, logic_new_func_x_4, logic_new_func_x_5 );
                                                        deduped_6_5 := UnderlyingQuiverAlgebraElement( deduped_7_5 );
                                                        if IsZero( deduped_6_5 ) or deduped_8_5 = 0 then
                                                            return NullMatImmutable( hoisted_1_4, deduped_8_5 );
                                                        else
                                                            deduped_5_5 := VertexIndex( UnderlyingVertex( Range( deduped_7_5 ) ) );
                                                            deduped_4_5 := VertexIndex( UnderlyingVertex( Source( deduped_7_5 ) ) );
                                                            hoisted_3_5 := [ 1 .. hoisted_2_1[deduped_4_5][deduped_5_5] ];
                                                            hoisted_2_5 := hoisted_4_3[deduped_4_5][hoisted_5_3][deduped_5_5];
                                                            hoisted_1_5 := CoefficientsOfPaths( hoisted_11_1[deduped_4_5][deduped_5_5], deduped_6_5 );
                                                            return Sum( hoisted_6_3, function ( p_6 )
                                                                    local hoisted_1_6, hoisted_2_6;
                                                                    hoisted_2_6 := hoisted_2_5[p_6];
                                                                    hoisted_1_6 := hoisted_3_3[p_6];
                                                                    return Sum( hoisted_3_5, function ( q_7 )
                                                                            return hoisted_1_6 * hoisted_1_5[q_7] * hoisted_2_6[q_7];
                                                                        end );
                                                                end );
                                                        fi;
                                                        return;
                                                    end ) );
                                          fi;
                                          return;
                                      end ) );
                            fi;
                            return;
                        end ) );
              end ) ), Dimension( source_1 ), deduped_18_1, UnderlyingRing( deduped_17_1 ) ) );
end
########
        
    , 100 );
    
    ##
    AddHomomorphismStructureOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_3_1, hoisted_4_1;
    hoisted_4_1 := ObjectList( arg3_1 );
    hoisted_3_1 := List( BasisPathsByVertexIndex( UnderlyingCategory( cat_1 ) ), function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, Length );
        end );
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), RangeCategoryOfHomomorphismStructure( cat_1 ), Dimension, Sum( Concatenation( List( ObjectList( arg2_1 ), function ( logic_new_func_x_2 )
                  local hoisted_1_2;
                  hoisted_1_2 := hoisted_3_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )];
                  return List( hoisted_4_1, function ( logic_new_func_x_3 )
                          return hoisted_1_2[VertexIndex( UnderlyingVertex( logic_new_func_x_3 ) )];
                      end );
              end ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddIdentityMorphism( cat,
        
########
function ( cat_1, a_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1;
    deduped_10_1 := UnderlyingCategory( cat_1 );
    deduped_9_1 := ObjectList( a_1 );
    deduped_8_1 := UnderlyingQuiverAlgebra( deduped_10_1 );
    deduped_7_1 := [ 1 .. Length( deduped_9_1 ) ];
    hoisted_6_1 := deduped_7_1;
    hoisted_5_1 := ZeroImmutable( deduped_8_1 );
    hoisted_4_1 := deduped_10_1;
    hoisted_3_1 := deduped_8_1;
    hoisted_2_1 := List( deduped_9_1, UnderlyingVertex );
    hoisted_1_1 := deduped_9_1;
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, a_1, a_1, MorphismMatrix, List( deduped_7_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2;
              deduped_3_2 := hoisted_1_1[i_2];
              hoisted_2_2 := deduped_3_2;
              hoisted_1_2 := ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                     ), hoisted_4_1, deduped_3_2, deduped_3_2, UnderlyingQuiverAlgebraElement, PathAsAlgebraElement( hoisted_3_1, hoisted_2_1[i_2] ) );
              return List( hoisted_6_1, function ( j_3 )
                      if i_2 = j_3 then
                          return hoisted_1_2;
                      else
                          return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                                 ), hoisted_4_1, hoisted_2_2, hoisted_1_1[j_3], UnderlyingQuiverAlgebraElement, hoisted_5_1 );
                      fi;
                      return;
                  end );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects( cat,
        
########
function ( cat_1, source_1, alpha_1, range_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := Dimension( source_1 );
    deduped_6_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_5_1 := BasisPathsByVertexIndex( UnderlyingCategory( cat_1 ) );
    hoisted_4_1 := deduped_7_1;
    hoisted_3_1 := [ 1 .. Length( ObjectList( Range( alpha_1 ) ) ) ];
    hoisted_2_1 := deduped_5_1;
    hoisted_1_1 := List( deduped_5_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, Length );
        end );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), deduped_6_1, source_1, range_1, UnderlyingMatrix, HomalgMatrixListList( UnionOfColumnsListList( deduped_7_1, List( [ 1 .. Length( ObjectList( Source( alpha_1 ) ) ) ], function ( logic_new_func_x_2 )
                  return UnionOfColumnsListList( hoisted_4_1, List( hoisted_3_1, function ( logic_new_func_x_3 )
                            local deduped_1_3, deduped_2_3, deduped_3_3, deduped_4_3;
                            deduped_4_3 := MatElm( alpha_1, logic_new_func_x_2, logic_new_func_x_3 );
                            deduped_3_3 := VertexIndex( UnderlyingVertex( Range( deduped_4_3 ) ) );
                            deduped_2_3 := VertexIndex( UnderlyingVertex( Source( deduped_4_3 ) ) );
                            deduped_1_3 := hoisted_1_1[deduped_2_3][deduped_3_3];
                            if deduped_1_3 = 0 then
                                return NullMatImmutable( 1, deduped_1_3 );
                            else
                                return [ CoefficientsOfPaths( hoisted_2_1[deduped_2_3][deduped_3_3], Representative( UnderlyingQuiverAlgebraElement( deduped_4_3 ) ) ) ];
                            fi;
                            return;
                        end ) );
              end ) ), deduped_7_1, Dimension( range_1 ), UnderlyingRing( deduped_6_1 ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1;
    deduped_19_1 := ObjectList( arg3_1 );
    deduped_18_1 := UnderlyingCategory( cat_1 );
    deduped_17_1 := ObjectList( arg2_1 );
    deduped_16_1 := Length( deduped_19_1 );
    deduped_15_1 := BasisPathsByVertexIndex( deduped_18_1 );
    deduped_14_1 := [ 1 .. Length( deduped_17_1 ) ];
    hoisted_13_1 := deduped_18_1;
    hoisted_12_1 := UnderlyingQuiverAlgebra( deduped_18_1 );
    hoisted_11_1 := List( deduped_19_1, function ( logic_new_func_x_2 )
            return VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) );
        end );
    hoisted_10_1 := deduped_15_1;
    hoisted_9_1 := List( deduped_17_1, function ( logic_new_func_x_2 )
            return VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) );
        end );
    hoisted_7_1 := [ 1 .. deduped_16_1 ];
    hoisted_6_1 := EntriesOfHomalgMatrixAsListList( UnderlyingMatrix( arg4_1 ) );
    hoisted_3_1 := List( deduped_15_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, Length );
        end );
    hoisted_2_1 := deduped_19_1;
    hoisted_5_1 := Concatenation( List( deduped_17_1, function ( logic_new_func_x_2 )
              local hoisted_1_2;
              hoisted_1_2 := hoisted_3_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )];
              return List( hoisted_2_1, function ( logic_new_func_x_3 )
                      return hoisted_1_2[VertexIndex( UnderlyingVertex( logic_new_func_x_3 ) )];
                  end );
          end ) );
    hoisted_4_1 := deduped_16_1;
    hoisted_8_1 := List( deduped_14_1, function ( logic_new_func_x_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_4_1 * (logic_new_func_x_2 - 1);
            return List( hoisted_7_1, function ( logic_new_func_x_3 )
                    local hoisted_1_3, deduped_2_3, deduped_3_3;
                    deduped_3_3 := hoisted_1_2 + logic_new_func_x_3;
                    deduped_2_3 := Sum( hoisted_5_1{[ 1 .. deduped_3_3 - 1 ]} ) + 1;
                    hoisted_1_3 := [ deduped_2_3 .. deduped_2_3 - 1 + hoisted_5_1[deduped_3_3] ];
                    return List( hoisted_6_1, function ( logic_new_func_x_4 )
                            return logic_new_func_x_4{hoisted_1_3};
                        end );
                end );
        end );
    hoisted_1_1 := deduped_17_1;
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, arg2_1, arg3_1, MorphismMatrix, List( deduped_14_1, function ( i_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2;
              hoisted_3_2 := hoisted_1_1[i_2];
              hoisted_2_2 := hoisted_10_1[hoisted_9_1[i_2]];
              hoisted_1_2 := hoisted_8_1[i_2];
              return List( hoisted_7_1, function ( j_3 )
                      return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                             ), hoisted_13_1, hoisted_3_2, hoisted_2_1[j_3], UnderlyingQuiverAlgebraElement, QuiverAlgebraElement( hoisted_12_1, hoisted_1_2[j_3][1], hoisted_2_2[hoisted_11_1[j_3]] ) );
                  end );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddIsCongruentForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := Length( ObjectList( Range( arg2_1 ) ) );
    deduped_4_1 := Length( ObjectList( Source( arg2_1 ) ) );
    if deduped_4_1 <> Length( ObjectList( Source( arg3_1 ) ) ) then
        return false;
    elif deduped_5_1 <> Length( ObjectList( Range( arg3_1 ) ) ) then
        return false;
    elif deduped_4_1 = 0 or deduped_5_1 = 0 then
        return true;
    else
        hoisted_3_1 := [ 1 .. deduped_5_1 ];
        return ForAll( [ 1 .. deduped_4_1 ], function ( i_2 )
                return ForAll( hoisted_3_1, function ( j_3 )
                        return UnderlyingQuiverAlgebraElement( MatElm( arg2_1, i_2, j_3 ) ) = UnderlyingQuiverAlgebraElement( MatElm( arg3_1, i_2, j_3 ) );
                    end );
            end );
    fi;
    return;
end
########
        
    , 100 );
    
    ##
    AddIsEqualForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := Length( ObjectList( Range( arg2_1 ) ) );
    deduped_4_1 := Length( ObjectList( Source( arg2_1 ) ) );
    if deduped_4_1 <> Length( ObjectList( Source( arg3_1 ) ) ) then
        return false;
    elif deduped_5_1 <> Length( ObjectList( Range( arg3_1 ) ) ) then
        return false;
    elif deduped_4_1 = 0 or deduped_5_1 = 0 then
        return true;
    else
        hoisted_3_1 := [ 1 .. deduped_5_1 ];
        return ForAll( [ 1 .. deduped_4_1 ], function ( i_2 )
                return ForAll( hoisted_3_1, function ( j_3 )
                        return UnderlyingQuiverAlgebraElement( MatElm( arg2_1, i_2, j_3 ) ) = UnderlyingQuiverAlgebraElement( MatElm( arg3_1, i_2, j_3 ) );
                    end );
            end );
    fi;
    return;
end
########
        
    , 100 );
    
    ##
    AddIsEqualForObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := ObjectList( arg3_1 );
    deduped_6_1 := ObjectList( arg2_1 );
    deduped_5_1 := Length( deduped_6_1 );
    if deduped_5_1 <> Length( deduped_7_1 ) then
        return false;
    else
        hoisted_4_1 := List( deduped_7_1, UnderlyingVertex );
        hoisted_3_1 := List( deduped_6_1, UnderlyingVertex );
        return ForAll( [ 1 .. deduped_5_1 ], function ( i_2 )
                return hoisted_3_1[i_2] = hoisted_4_1[i_2];
            end );
    fi;
    return;
end
########
        
    , 100 );
    
    ##
    AddIsWellDefinedForMorphisms( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1;
    deduped_10_1 := MorphismMatrix( arg2_1 );
    deduped_9_1 := ObjectList( Range( arg2_1 ) );
    deduped_8_1 := ObjectList( Source( arg2_1 ) );
    deduped_7_1 := Length( deduped_9_1 );
    deduped_6_1 := Length( deduped_8_1 );
    deduped_5_1 := [ 1 .. deduped_6_1 ];
    hoisted_4_1 := List( deduped_9_1, UnderlyingVertex );
    hoisted_3_1 := List( deduped_8_1, UnderlyingVertex );
    hoisted_2_1 := UnderlyingCategory( cat_1 );
    hoisted_1_1 := [ 1 .. deduped_7_1 ];
    if IsMatrixObj( deduped_10_1 ) and not (deduped_6_1 = NumberRows( deduped_10_1 ) and deduped_7_1 = NumberColumns( deduped_10_1 )) then
        return false;
    elif not ForAll( deduped_5_1, function ( i_2 )
                 return ForAll( hoisted_1_1, function ( j_3 )
                         return IsCapCategoryMorphism( MatElm( arg2_1, i_2, j_3 ) );
                     end );
             end ) then
        return false;
    elif not ForAll( deduped_5_1, function ( i_2 )
                 return ForAll( hoisted_1_1, function ( j_3 )
                         return IS_IDENTICAL_OBJ( hoisted_2_1, CapCategory( MatElm( arg2_1, i_2, j_3 ) ) );
                     end );
             end ) then
        return false;
    elif not ForAll( deduped_5_1, function ( i_2 )
                 local hoisted_1_2;
                 hoisted_1_2 := hoisted_3_1[i_2];
                 return ForAll( hoisted_1_1, function ( j_3 )
                         local deduped_1_3;
                         deduped_1_3 := MatElm( arg2_1, i_2, j_3 );
                         return (UnderlyingVertex( Source( deduped_1_3 ) ) = hoisted_1_2 and UnderlyingVertex( Range( deduped_1_3 ) ) = hoisted_4_1[j_3]);
                     end );
             end ) then
        return false;
    else
        return true;
    fi;
    return;
end
########
        
    , 100 );
    
    ##
    AddIsWellDefinedForObjects( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1;
    hoisted_1_1 := UnderlyingCategory( cat_1 );
    if not ForAll( ObjectList( arg2_1 ), function ( obj_2 )
                 return IS_IDENTICAL_OBJ( hoisted_1_1, CapCategory( obj_2 ) );
             end ) then
        return false;
    else
        return true;
    fi;
    return;
end
########
        
    , 100 );
    
    ##
    AddIsZeroForMorphisms( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1;
    hoisted_1_1 := [ 1 .. NumberColumns( arg2_1 ) ];
    return ForAll( [ 1 .. Length( ObjectList( Source( arg2_1 ) ) ) ], function ( i_2 )
            return ForAll( hoisted_1_1, function ( j_3 )
                    return IsZero( UnderlyingQuiverAlgebraElement( MatElm( arg2_1, i_2, j_3 ) ) );
                end );
        end );
end
########
        
    , 100 );
    
    ##
    AddMultiplyWithElementOfCommutativeRingForMorphisms( cat,
        
########
function ( cat_1, r_1, a_1 )
    local hoisted_1_1, hoisted_2_1;
    hoisted_2_1 := [ 1 .. NumberColumns( a_1 ) ];
    hoisted_1_1 := UnderlyingCategory( cat_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, Source( a_1 ), Range( a_1 ), MorphismMatrix, List( [ 1 .. NumberRows( a_1 ) ], function ( i_2 )
              return List( hoisted_2_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := MatElm( a_1, i_2, j_3 );
                      return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                             ), hoisted_1_1, Source( deduped_1_3 ), Range( deduped_1_3 ), UnderlyingQuiverAlgebraElement, r_1 * UnderlyingQuiverAlgebraElement( deduped_1_3 ) );
                  end );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddPreCompose( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1;
    deduped_15_1 := UnderlyingCategory( cat_1 );
    deduped_14_1 := Range( beta_1 );
    deduped_13_1 := Source( alpha_1 );
    deduped_10_1 := Length( ObjectList( Range( alpha_1 ) ) );
    hoisted_5_1 := deduped_15_1;
    if ForAny( [ deduped_10_1, Length( ObjectList( Source( beta_1 ) ) ) ], IsZero ) then
        deduped_12_1 := ObjectList( deduped_14_1 );
        deduped_11_1 := ObjectList( deduped_13_1 );
        hoisted_7_1 := [ 1 .. Length( deduped_12_1 ) ];
        hoisted_6_1 := ZeroImmutable( UnderlyingQuiverAlgebra( deduped_15_1 ) );
        hoisted_4_1 := deduped_12_1;
        hoisted_3_1 := deduped_11_1;
        return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
               ), cat_1, deduped_13_1, deduped_14_1, MorphismMatrix, List( [ 1 .. Length( deduped_11_1 ) ], function ( i_2 )
                  local hoisted_1_2;
                  hoisted_1_2 := hoisted_3_1[i_2];
                  return List( hoisted_7_1, function ( j_3 )
                          return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                                 ), hoisted_5_1, hoisted_1_2, hoisted_4_1[j_3], UnderlyingQuiverAlgebraElement, hoisted_6_1 );
                      end );
              end ) );
    else
        hoisted_9_1 := [ 1 .. NumberColumns( beta_1 ) ];
        hoisted_8_1 := [ 1 .. deduped_10_1 ];
        return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
               ), cat_1, deduped_13_1, deduped_14_1, MorphismMatrix, List( [ 1 .. NumberRows( alpha_1 ) ], function ( i_2 )
                  return List( hoisted_9_1, function ( j_3 )
                          return Iterated( List( hoisted_8_1, function ( k_4 )
                                    local deduped_1_4, deduped_2_4;
                                    deduped_2_4 := MatElm( beta_1, k_4, j_3 );
                                    deduped_1_4 := MatElm( alpha_1, i_2, k_4 );
                                    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                                           ), hoisted_5_1, Source( deduped_1_4 ), Range( deduped_2_4 ), UnderlyingQuiverAlgebraElement, UnderlyingQuiverAlgebraElement( deduped_1_4 ) * UnderlyingQuiverAlgebraElement( deduped_2_4 ) );
                                end ), function ( alpha_4, beta_4 )
                                  return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                                         ), hoisted_5_1, Source( alpha_4 ), Range( alpha_4 ), UnderlyingQuiverAlgebraElement, UnderlyingQuiverAlgebraElement( alpha_4 ) + UnderlyingQuiverAlgebraElement( beta_4 ) );
                              end );
                      end );
              end ) );
    fi;
    return;
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromDirectSumWithGivenDirectSum( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, P_1, T_1, MorphismMatrix, UnionOfRowsListList( Length( ObjectList( T_1 ) ), List( tau_1, function ( tau_2 )
                return MorphismMatrix( tau_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoDirectSumWithGivenDirectSum( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, T_1, P_1, MorphismMatrix, UnionOfColumnsListList( Length( ObjectList( T_1 ) ), List( tau_1, function ( tau_2 )
                return MorphismMatrix( tau_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddZeroMorphism( cat,
        
########
function ( cat_1, a_1, b_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1, deduped_8_1;
    deduped_8_1 := UnderlyingCategory( cat_1 );
    deduped_7_1 := ObjectList( b_1 );
    deduped_6_1 := ObjectList( a_1 );
    hoisted_5_1 := [ 1 .. Length( deduped_7_1 ) ];
    hoisted_4_1 := ZeroImmutable( UnderlyingQuiverAlgebra( deduped_8_1 ) );
    hoisted_3_1 := deduped_8_1;
    hoisted_2_1 := deduped_7_1;
    hoisted_1_1 := deduped_6_1;
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, a_1, b_1, MorphismMatrix, List( [ 1 .. Length( deduped_6_1 ) ], function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := hoisted_1_1[i_2];
              return List( hoisted_5_1, function ( j_3 )
                      return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                             ), hoisted_3_1, hoisted_1_2, hoisted_2_1[j_3], UnderlyingQuiverAlgebraElement, hoisted_4_1 );
                  end );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddZeroObject( cat,
        
########
function ( cat_1 )
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), cat_1, ObjectList, [  ] );
end
########
        
    , 100 );
    
end );

BindGlobal( "AdditiveClosureOfAlgebroidOfFiniteDimensionalQuotientOfPathAlgebraOfRightQuiverOverFieldPrecompiled", function ( Rq )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function ( Rq )
    return AdditiveClosure( Algebroid( Rq, false : FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor( Rq : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_AdditiveClosureOfAlgebroidOfFiniteDimensionalQuotientOfPathAlgebraOfRightQuiverOverFieldPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
