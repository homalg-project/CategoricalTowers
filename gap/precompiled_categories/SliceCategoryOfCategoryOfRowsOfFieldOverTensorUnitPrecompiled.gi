# SPDX-License-Identifier: GPL-2.0-or-later
# SubcategoriesForCAP: Subcategory and other related constructors for CAP categories
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_SliceCategoryOfCategoryOfRowsOfFieldOverTensorUnitPrecompiled", function ( cat )
    
    ##
    AddAdditionForMorphisms( cat,
        
########
function ( cat_1, a_1, b_1 )
    local cap_jit_deduplicated_expression_1_1, cap_jit_deduplicated_expression_2_1;
    cap_jit_deduplicated_expression_1_1 := UnderlyingCell( a_1 );
    cap_jit_deduplicated_expression_2_1 := UnderlyingCell( b_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, Source( a_1 ), Range( a_1 ), UnderlyingCell, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), AmbientCategory( cat_1 ), Source( cap_jit_deduplicated_expression_1_1 ), Range( cap_jit_deduplicated_expression_2_1 ), UnderlyingMatrix, UnderlyingMatrix( cap_jit_deduplicated_expression_1_1 ) + UnderlyingMatrix( cap_jit_deduplicated_expression_2_1 ) ) );
end
########
        
    );
    
    ##
    AddAdditiveInverseForMorphisms( cat,
        
########
function ( cat_1, a_1 )
    local cap_jit_deduplicated_expression_1_1;
    cap_jit_deduplicated_expression_1_1 := UnderlyingCell( a_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, Source( a_1 ), Range( a_1 ), UnderlyingCell, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), AmbientCategory( cat_1 ), Source( cap_jit_deduplicated_expression_1_1 ), Range( cap_jit_deduplicated_expression_1_1 ), UnderlyingMatrix, - UnderlyingMatrix( cap_jit_deduplicated_expression_1_1 ) ) );
end
########
        
    );
    
    ##
    AddColiftAlongEpimorphism( cat,
        
########
function ( cat_1, epsilon_1, tau_1 )
    local cap_jit_deduplicated_expression_1_1, cap_jit_deduplicated_expression_2_1;
    cap_jit_deduplicated_expression_1_1 := UnderlyingCell( epsilon_1 );
    cap_jit_deduplicated_expression_2_1 := UnderlyingCell( tau_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, Range( epsilon_1 ), Range( tau_1 ), UnderlyingCell, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), AmbientCategory( cat_1 ), Range( cap_jit_deduplicated_expression_1_1 ), Range( cap_jit_deduplicated_expression_2_1 ), UnderlyingMatrix, LeftDivide( UnderlyingMatrix( cap_jit_deduplicated_expression_1_1 ), UnderlyingMatrix( cap_jit_deduplicated_expression_2_1 ) ) ) );
end
########
        
    );
    
    ##
    AddCoproduct( cat,
        
########
function ( cat_1, arg2_1 )
    local cap_jit_morphism_attribute_1_1, cap_jit_deduplicated_expression_1_1;
    if Length( arg2_1 ) = 1 then
        return arg2_1[1];
    else
        cap_jit_deduplicated_expression_1_1 := AmbientCategory( cat_1 );
        cap_jit_morphism_attribute_1_1 := UnionOfRows( UnderlyingRing( cap_jit_deduplicated_expression_1_1 ), 1, List( arg2_1, function ( logic_new_func_x_2 )
                  return UnderlyingMatrix( UnderlyingMorphism( logic_new_func_x_2 ) );
              end ) );
        return ObjectifyObjectForCAPWithAttributes( rec(
               ), cat_1, UnderlyingMorphism, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                 ), cap_jit_deduplicated_expression_1_1, ObjectifyObjectForCAPWithAttributes( rec(
                   ), cap_jit_deduplicated_expression_1_1, RankOfObject, NrRows( cap_jit_morphism_attribute_1_1 ) ), BaseObject( cat_1 ), UnderlyingMatrix, cap_jit_morphism_attribute_1_1 ) );
    fi;
    return;
end
########
        
    );
    
    ##
    AddDirectProduct( cat,
        
########
function ( cat_1, arg2_1 )
    local cap_jit_morphism_attribute_1_1, cap_jit_deduplicated_expression_1_1;
    if Length( arg2_1 ) = 1 then
        return arg2_1[1];
    else
        cap_jit_deduplicated_expression_1_1 := AmbientCategory( cat_1 );
        cap_jit_morphism_attribute_1_1 := Iterated( List( arg2_1, function ( logic_new_func_x_2 )
                  return UnderlyingMatrix( UnderlyingMorphism( logic_new_func_x_2 ) );
              end ), function ( I_2, J_2 )
                return ReducedSyzygiesOfRows( I_2, J_2 ) * I_2;
            end );
        return ObjectifyObjectForCAPWithAttributes( rec(
               ), cat_1, UnderlyingMorphism, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                 ), cap_jit_deduplicated_expression_1_1, ObjectifyObjectForCAPWithAttributes( rec(
                   ), cap_jit_deduplicated_expression_1_1, RankOfObject, NrRows( cap_jit_morphism_attribute_1_1 ) ), ObjectifyObjectForCAPWithAttributes( rec(
                   ), cap_jit_deduplicated_expression_1_1, RankOfObject, NrColumns( cap_jit_morphism_attribute_1_1 ) ), UnderlyingMatrix, cap_jit_morphism_attribute_1_1 ) );
    fi;
    return;
end
########
        
    );
    
    ##
    AddIdentityMorphism( cat,
        
########
function ( cat_1, a_1 )
    local cap_jit_deduplicated_expression_1_1, cap_jit_deduplicated_expression_2_1;
    cap_jit_deduplicated_expression_1_1 := Source( UnderlyingMorphism( a_1 ) );
    cap_jit_deduplicated_expression_2_1 := AmbientCategory( cat_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, a_1, a_1, UnderlyingCell, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), cap_jit_deduplicated_expression_2_1, cap_jit_deduplicated_expression_1_1, cap_jit_deduplicated_expression_1_1, UnderlyingMatrix, HomalgIdentityMatrix( RankOfObject( cap_jit_deduplicated_expression_1_1 ), UnderlyingRing( cap_jit_deduplicated_expression_2_1 ) ) ) );
end
########
        
    );
    
    ##
    AddInitialObject( cat,
        
########
function ( cat_1 )
    local cap_jit_morphism_attribute_1_1, cap_jit_deduplicated_expression_1_1;
    cap_jit_deduplicated_expression_1_1 := AmbientCategory( cat_1 );
    cap_jit_morphism_attribute_1_1 := HomalgZeroMatrix( 0, 1, UnderlyingRing( cap_jit_deduplicated_expression_1_1 ) );
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), cat_1, UnderlyingMorphism, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), cap_jit_deduplicated_expression_1_1, ObjectifyObjectForCAPWithAttributes( rec(
               ), cap_jit_deduplicated_expression_1_1, RankOfObject, 0 ), BaseObject( cat_1 ), UnderlyingMatrix, cap_jit_morphism_attribute_1_1 ) );
end
########
        
    );
    
    ##
    AddInverseForMorphisms( cat,
        
########
function ( cat_1, alpha_1 )
    local cap_jit_deduplicated_expression_1_1, cap_jit_deduplicated_expression_2_1, cap_jit_deduplicated_expression_3_1;
    cap_jit_deduplicated_expression_3_1 := UnderlyingCell( alpha_1 );
    cap_jit_deduplicated_expression_1_1 := Range( cap_jit_deduplicated_expression_3_1 );
    cap_jit_deduplicated_expression_2_1 := AmbientCategory( cat_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, Range( alpha_1 ), Source( alpha_1 ), UnderlyingCell, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), cap_jit_deduplicated_expression_2_1, cap_jit_deduplicated_expression_1_1, Source( cap_jit_deduplicated_expression_3_1 ), UnderlyingMatrix, RightDivide( HomalgIdentityMatrix( RankOfObject( cap_jit_deduplicated_expression_1_1 ), UnderlyingRing( cap_jit_deduplicated_expression_2_1 ) ), UnderlyingMatrix( cap_jit_deduplicated_expression_3_1 ) ) ) );
end
########
        
    );
    
    ##
    AddIsAutomorphism( cat,
        
########
function ( cat_1, arg2_1 )
    local cap_jit_deduplicated_expression_1_1, cap_jit_deduplicated_expression_2_1, cap_jit_deduplicated_expression_3_1;
    cap_jit_deduplicated_expression_3_1 := UnderlyingCell( arg2_1 );
    cap_jit_deduplicated_expression_2_1 := UnderlyingMatrix( cap_jit_deduplicated_expression_3_1 );
    cap_jit_deduplicated_expression_1_1 := RowRankOfMatrix( cap_jit_deduplicated_expression_2_1 );
    return RankOfObject( Source( cap_jit_deduplicated_expression_3_1 ) ) = RankOfObject( Range( cap_jit_deduplicated_expression_3_1 ) ) and (NumberRows( cap_jit_deduplicated_expression_2_1 ) - cap_jit_deduplicated_expression_1_1 = 0 and NumberColumns( cap_jit_deduplicated_expression_2_1 ) - cap_jit_deduplicated_expression_1_1 = 0);
end
########
        
    );
    
    ##
    AddIsColiftableAlongEpimorphism( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return IsZero( DecideZeroColumns( UnderlyingMatrix( UnderlyingCell( arg3_1 ) ), UnderlyingMatrix( UnderlyingCell( arg2_1 ) ) ) );
end
########
        
    );
    
    ##
    AddIsCongruentForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return UnderlyingMatrix( UnderlyingCell( arg3_1 ) ) = UnderlyingMatrix( UnderlyingCell( arg2_1 ) );
end
########
        
    );
    
    ##
    AddIsEqualForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return UnderlyingMatrix( UnderlyingCell( arg3_1 ) ) = UnderlyingMatrix( UnderlyingCell( arg2_1 ) );
end
########
        
    );
    
    ##
    AddIsEqualForObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local cap_jit_deduplicated_expression_1_1, cap_jit_deduplicated_expression_2_1;
    cap_jit_deduplicated_expression_1_1 := UnderlyingMorphism( arg2_1 );
    cap_jit_deduplicated_expression_2_1 := UnderlyingMorphism( arg3_1 );
    return RankOfObject( Source( cap_jit_deduplicated_expression_1_1 ) ) = RankOfObject( Source( cap_jit_deduplicated_expression_2_1 ) ) and UnderlyingMatrix( cap_jit_deduplicated_expression_1_1 ) = UnderlyingMatrix( cap_jit_deduplicated_expression_2_1 );
end
########
        
    );
    
    ##
    AddIsHomSetInhabited( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return IsZero( DecideZeroRows( UnderlyingMatrix( UnderlyingMorphism( arg2_1 ) ), UnderlyingMatrix( UnderlyingMorphism( arg3_1 ) ) ) );
end
########
        
    );
    
    ##
    AddIsInitial( cat,
        
########
function ( cat_1, arg2_1 )
    return RankOfObject( Source( UnderlyingMorphism( arg2_1 ) ) ) = 0;
end
########
        
    );
    
    ##
    AddIsIsomorphism( cat,
        
########
function ( cat_1, arg2_1 )
    local cap_jit_deduplicated_expression_1_1, cap_jit_deduplicated_expression_2_1;
    cap_jit_deduplicated_expression_2_1 := UnderlyingMatrix( UnderlyingCell( arg2_1 ) );
    cap_jit_deduplicated_expression_1_1 := RowRankOfMatrix( cap_jit_deduplicated_expression_2_1 );
    return NumberRows( cap_jit_deduplicated_expression_2_1 ) - cap_jit_deduplicated_expression_1_1 = 0 and NumberColumns( cap_jit_deduplicated_expression_2_1 ) - cap_jit_deduplicated_expression_1_1 = 0;
end
########
        
    );
    
    ##
    AddIsLiftable( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return IsZero( DecideZeroRows( UnderlyingMatrix( UnderlyingCell( arg2_1 ) ), UnderlyingMatrix( UnderlyingCell( arg3_1 ) ) ) );
end
########
        
    );
    
    ##
    AddIsLiftableAlongMonomorphism( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return IsZero( DecideZeroRows( UnderlyingMatrix( UnderlyingCell( arg3_1 ) ), UnderlyingMatrix( UnderlyingCell( arg2_1 ) ) ) );
end
########
        
    );
    
    ##
    AddIsOne( cat,
        
########
function ( cat_1, arg2_1 )
    local cap_jit_deduplicated_expression_1_1;
    cap_jit_deduplicated_expression_1_1 := UnderlyingCell( arg2_1 );
    return HomalgIdentityMatrix( RankOfObject( Source( cap_jit_deduplicated_expression_1_1 ) ), UnderlyingRing( AmbientCategory( cat_1 ) ) ) = UnderlyingMatrix( cap_jit_deduplicated_expression_1_1 );
end
########
        
    );
    
    ##
    AddIsSplitEpimorphism( cat,
        
########
function ( cat_1, arg2_1 )
    local cap_jit_deduplicated_expression_1_1;
    cap_jit_deduplicated_expression_1_1 := UnderlyingCell( arg2_1 );
    return IsZero( DecideZeroRows( HomalgIdentityMatrix( RankOfObject( Range( cap_jit_deduplicated_expression_1_1 ) ), UnderlyingRing( AmbientCategory( cat_1 ) ) ), UnderlyingMatrix( cap_jit_deduplicated_expression_1_1 ) ) );
end
########
        
    );
    
    ##
    AddIsTerminal( cat,
        
########
function ( cat_1, arg2_1 )
    local cap_jit_deduplicated_expression_1_1, cap_jit_deduplicated_expression_2_1;
    cap_jit_deduplicated_expression_2_1 := UnderlyingMatrix( UnderlyingMorphism( arg2_1 ) );
    cap_jit_deduplicated_expression_1_1 := RowRankOfMatrix( cap_jit_deduplicated_expression_2_1 );
    return NumberRows( cap_jit_deduplicated_expression_2_1 ) - cap_jit_deduplicated_expression_1_1 = 0 and NumberColumns( cap_jit_deduplicated_expression_2_1 ) - cap_jit_deduplicated_expression_1_1 = 0;
end
########
        
    );
    
    ##
    AddIsWeakInitial( cat,
        
########
function ( cat_1, arg2_1 )
    return IsZero( UnderlyingMatrix( UnderlyingMorphism( arg2_1 ) ) );
end
########
        
    );
    
    ##
    AddIsWeakTerminal( cat,
        
########
function ( cat_1, arg2_1 )
    local cap_jit_deduplicated_expression_1_1;
    cap_jit_deduplicated_expression_1_1 := UnderlyingMorphism( arg2_1 );
    return IsZero( DecideZeroRows( HomalgIdentityMatrix( RankOfObject( Range( cap_jit_deduplicated_expression_1_1 ) ), UnderlyingRing( AmbientCategory( cat_1 ) ) ), UnderlyingMatrix( cap_jit_deduplicated_expression_1_1 ) ) );
end
########
        
    );
    
    ##
    AddIsWellDefinedForMorphisms( cat,
        
########
function ( cat_1, arg2_1 )
    local cap_jit_deduplicated_expression_1_1, cap_jit_deduplicated_expression_2_1, cap_jit_deduplicated_expression_3_1;
    cap_jit_deduplicated_expression_1_1 := UnderlyingMorphism( Source( arg2_1 ) );
    cap_jit_deduplicated_expression_2_1 := UnderlyingMorphism( Range( arg2_1 ) );
    cap_jit_deduplicated_expression_3_1 := UnderlyingCell( arg2_1 );
    return RankOfObject( Source( cap_jit_deduplicated_expression_1_1 ) ) = RankOfObject( Source( cap_jit_deduplicated_expression_3_1 ) ) and RankOfObject( Source( cap_jit_deduplicated_expression_2_1 ) ) = RankOfObject( Range( cap_jit_deduplicated_expression_3_1 ) ) and UnderlyingMatrix( cap_jit_deduplicated_expression_1_1 ) = UnderlyingMatrix( cap_jit_deduplicated_expression_3_1 ) * UnderlyingMatrix( cap_jit_deduplicated_expression_2_1 );
end
########
        
    );
    
    ##
    AddIsWellDefinedForObjects( cat,
        
########
function ( cat_1, arg2_1 )
    local cap_jit_deduplicated_expression_1_1, cap_jit_deduplicated_expression_2_1, cap_jit_deduplicated_expression_3_1, cap_jit_deduplicated_expression_4_1, cap_jit_deduplicated_expression_5_1;
    cap_jit_deduplicated_expression_4_1 := UnderlyingMorphism( arg2_1 );
    cap_jit_deduplicated_expression_1_1 := Range( cap_jit_deduplicated_expression_4_1 );
    cap_jit_deduplicated_expression_2_1 := Source( cap_jit_deduplicated_expression_4_1 );
    cap_jit_deduplicated_expression_3_1 := UnderlyingMatrix( cap_jit_deduplicated_expression_4_1 );
    cap_jit_deduplicated_expression_5_1 := AmbientCategory( cat_1 );
    return IS_IDENTICAL_OBJ( cap_jit_deduplicated_expression_1_1, BaseObject( cat_1 ) ) and function (  )
              if not IS_IDENTICAL_OBJ( cap_jit_deduplicated_expression_5_1, CapCategory( cap_jit_deduplicated_expression_2_1 ) ) then
                  return false;
              elif not IS_IDENTICAL_OBJ( cap_jit_deduplicated_expression_5_1, CapCategory( cap_jit_deduplicated_expression_4_1 ) ) then
                  return false;
              elif not IS_IDENTICAL_OBJ( cap_jit_deduplicated_expression_5_1, CapCategory( cap_jit_deduplicated_expression_1_1 ) ) then
                  return false;
              elif NumberRows( cap_jit_deduplicated_expression_3_1 ) <> RankOfObject( cap_jit_deduplicated_expression_2_1 ) then
                  return false;
              elif NumberColumns( cap_jit_deduplicated_expression_3_1 ) <> RankOfObject( cap_jit_deduplicated_expression_1_1 ) then
                  return false;
              else
                  return true;
              fi;
              return;
          end(  );
end
########
        
    );
    
    ##
    AddLift( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local cap_jit_deduplicated_expression_1_1, cap_jit_deduplicated_expression_2_1;
    cap_jit_deduplicated_expression_1_1 := UnderlyingCell( alpha_1 );
    cap_jit_deduplicated_expression_2_1 := UnderlyingCell( beta_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, Source( alpha_1 ), Source( beta_1 ), UnderlyingCell, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), AmbientCategory( cat_1 ), Source( cap_jit_deduplicated_expression_1_1 ), Source( cap_jit_deduplicated_expression_2_1 ), UnderlyingMatrix, RightDivide( UnderlyingMatrix( cap_jit_deduplicated_expression_1_1 ), UnderlyingMatrix( cap_jit_deduplicated_expression_2_1 ) ) ) );
end
########
        
    );
    
    ##
    AddLiftAlongMonomorphism( cat,
        
########
function ( cat_1, iota_1, tau_1 )
    local cap_jit_deduplicated_expression_1_1, cap_jit_deduplicated_expression_2_1;
    cap_jit_deduplicated_expression_1_1 := UnderlyingCell( tau_1 );
    cap_jit_deduplicated_expression_2_1 := UnderlyingCell( iota_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, Source( tau_1 ), Source( iota_1 ), UnderlyingCell, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), AmbientCategory( cat_1 ), Source( cap_jit_deduplicated_expression_1_1 ), Source( cap_jit_deduplicated_expression_2_1 ), UnderlyingMatrix, RightDivide( UnderlyingMatrix( cap_jit_deduplicated_expression_1_1 ), UnderlyingMatrix( cap_jit_deduplicated_expression_2_1 ) ) ) );
end
########
        
    );
    
    ##
    AddMorphismConstructor( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, arg2_1, arg4_1, UnderlyingCell, arg3_1 );
end
########
        
    );
    
    ##
    AddMorphismDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return UnderlyingCell( arg2_1 );
end
########
        
    );
    
    ##
    AddObjectConstructor( cat,
        
########
function ( cat_1, arg2_1 )
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), cat_1, UnderlyingMorphism, arg2_1 );
end
########
        
    );
    
    ##
    AddObjectDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return UnderlyingMorphism( arg2_1 );
end
########
        
    );
    
    ##
    AddPostCompose( cat,
        
########
function ( cat_1, beta_1, alpha_1 )
    local cap_jit_deduplicated_expression_1_1, cap_jit_deduplicated_expression_2_1;
    cap_jit_deduplicated_expression_1_1 := UnderlyingCell( alpha_1 );
    cap_jit_deduplicated_expression_2_1 := UnderlyingCell( beta_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, Source( alpha_1 ), Range( beta_1 ), UnderlyingCell, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), AmbientCategory( cat_1 ), Source( cap_jit_deduplicated_expression_1_1 ), Range( cap_jit_deduplicated_expression_2_1 ), UnderlyingMatrix, UnderlyingMatrix( cap_jit_deduplicated_expression_1_1 ) * UnderlyingMatrix( cap_jit_deduplicated_expression_2_1 ) ) );
end
########
        
    );
    
    ##
    AddPreCompose( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local cap_jit_deduplicated_expression_1_1, cap_jit_deduplicated_expression_2_1;
    cap_jit_deduplicated_expression_1_1 := UnderlyingCell( alpha_1 );
    cap_jit_deduplicated_expression_2_1 := UnderlyingCell( beta_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, Source( alpha_1 ), Range( beta_1 ), UnderlyingCell, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), AmbientCategory( cat_1 ), Source( cap_jit_deduplicated_expression_1_1 ), Range( cap_jit_deduplicated_expression_2_1 ), UnderlyingMatrix, UnderlyingMatrix( cap_jit_deduplicated_expression_1_1 ) * UnderlyingMatrix( cap_jit_deduplicated_expression_2_1 ) ) );
end
########
        
    );
    
    ##
    AddSubtractionForMorphisms( cat,
        
########
function ( cat_1, a_1, b_1 )
    local cap_jit_deduplicated_expression_1_1, cap_jit_deduplicated_expression_2_1;
    cap_jit_deduplicated_expression_1_1 := UnderlyingCell( a_1 );
    cap_jit_deduplicated_expression_2_1 := UnderlyingCell( b_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, Source( a_1 ), Range( a_1 ), UnderlyingCell, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), AmbientCategory( cat_1 ), Source( cap_jit_deduplicated_expression_1_1 ), Range( cap_jit_deduplicated_expression_2_1 ), UnderlyingMatrix, UnderlyingMatrix( cap_jit_deduplicated_expression_1_1 ) + (- UnderlyingMatrix( cap_jit_deduplicated_expression_2_1 )) ) );
end
########
        
    );
    
    ##
    AddTerminalObject( cat,
        
########
function ( cat_1 )
    local cap_jit_deduplicated_expression_1_1, cap_jit_deduplicated_expression_2_1;
    cap_jit_deduplicated_expression_1_1 := AmbientCategory( cat_1 );
    cap_jit_deduplicated_expression_2_1 := BaseObject( cat_1 );
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), cat_1, UnderlyingMorphism, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), cap_jit_deduplicated_expression_1_1, cap_jit_deduplicated_expression_2_1, cap_jit_deduplicated_expression_2_1, UnderlyingMatrix, HomalgIdentityMatrix( 1, UnderlyingRing( cap_jit_deduplicated_expression_1_1 ) ) ) );
end
########
        
    );
    
    ##
    AddUniversalMorphismFromInitialObjectWithGivenInitialObject( cat,
        
########
function ( cat_1, T_1, P_1 )
    local cap_jit_deduplicated_expression_1_1, cap_jit_deduplicated_expression_2_1, cap_jit_deduplicated_expression_3_1;
    cap_jit_deduplicated_expression_1_1 := Source( UnderlyingMorphism( P_1 ) );
    cap_jit_deduplicated_expression_2_1 := Source( UnderlyingMorphism( T_1 ) );
    cap_jit_deduplicated_expression_3_1 := AmbientCategory( cat_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, P_1, T_1, UnderlyingCell, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), cap_jit_deduplicated_expression_3_1, cap_jit_deduplicated_expression_1_1, cap_jit_deduplicated_expression_2_1, UnderlyingMatrix, HomalgZeroMatrix( RankOfObject( cap_jit_deduplicated_expression_1_1 ), RankOfObject( cap_jit_deduplicated_expression_2_1 ), UnderlyingRing( cap_jit_deduplicated_expression_3_1 ) ) ) );
end
########
        
    );
    
    ##
    AddUniversalMorphismIntoTerminalObject( cat,
        
########
function ( cat_1, T_1 )
    local cap_jit_deduplicated_expression_1_1, cap_jit_deduplicated_expression_2_1;
    cap_jit_deduplicated_expression_1_1 := AmbientCategory( cat_1 );
    cap_jit_deduplicated_expression_2_1 := BaseObject( cat_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, T_1, ObjectifyObjectForCAPWithAttributes( rec(
             ), cat_1, UnderlyingMorphism, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
               ), cap_jit_deduplicated_expression_1_1, cap_jit_deduplicated_expression_2_1, cap_jit_deduplicated_expression_2_1, UnderlyingMatrix, HomalgIdentityMatrix( 1, UnderlyingRing( cap_jit_deduplicated_expression_1_1 ) ) ) ), UnderlyingCell, UnderlyingMorphism( T_1 ) );
end
########
        
    );
    
end );

BindGlobal( "SliceCategoryOfCategoryOfRowsOfFieldOverTensorUnitPrecompiled", function ( field )
  local category_constructor, cat;
    
    category_constructor := 
        
        
        function ( field )
    return SliceCategory( TensorUnit( CategoryOfRows( field : FinalizeCategory := true ) ) );
end;
        
        
    
    cat := category_constructor( field : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_SliceCategoryOfCategoryOfRowsOfFieldOverTensorUnitPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
