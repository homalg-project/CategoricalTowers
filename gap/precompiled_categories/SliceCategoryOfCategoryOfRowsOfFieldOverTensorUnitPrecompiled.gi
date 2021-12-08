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
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := UnderlyingCell( b_1 );
    deduped_1_1 := UnderlyingCell( a_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, Source( a_1 ), Range( a_1 ), UnderlyingCell, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), AmbientCategory( cat_1 ), Source( deduped_1_1 ), Range( deduped_2_1 ), UnderlyingMatrix, UnderlyingMatrix( deduped_1_1 ) + UnderlyingMatrix( deduped_2_1 ) ) );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddAdditiveInverseForMorphisms( cat,
        
########
function ( cat_1, a_1 )
    local deduped_1_1;
    deduped_1_1 := UnderlyingCell( a_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, Source( a_1 ), Range( a_1 ), UnderlyingCell, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), AmbientCategory( cat_1 ), Source( deduped_1_1 ), Range( deduped_1_1 ), UnderlyingMatrix, - UnderlyingMatrix( deduped_1_1 ) ) );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddColiftAlongEpimorphism( cat,
        
########
function ( cat_1, epsilon_1, tau_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := UnderlyingCell( tau_1 );
    deduped_1_1 := UnderlyingCell( epsilon_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, Range( epsilon_1 ), Range( tau_1 ), UnderlyingCell, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), AmbientCategory( cat_1 ), Range( deduped_1_1 ), Range( deduped_2_1 ), UnderlyingMatrix, LeftDivide( UnderlyingMatrix( deduped_1_1 ), UnderlyingMatrix( deduped_2_1 ) ) ) );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddCoproduct( cat,
        
########
function ( cat_1, arg2_1 )
    local morphism_attr_1_1, deduped_2_1, deduped_3_1;
    if Length( arg2_1 ) = 1 then
        return arg2_1[1];
    else
        deduped_3_1 := BaseObject( cat_1 );
        deduped_2_1 := AmbientCategory( cat_1 );
        morphism_attr_1_1 := UnionOfRows( UnderlyingRing( deduped_2_1 ), RankOfObject( deduped_3_1 ), List( arg2_1, function ( logic_new_func_x_2 )
                  return UnderlyingMatrix( UnderlyingMorphism( logic_new_func_x_2 ) );
              end ) );
        return ObjectifyObjectForCAPWithAttributes( rec(
               ), cat_1, UnderlyingMorphism, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                 ), deduped_2_1, ObjectifyObjectForCAPWithAttributes( rec(
                   ), deduped_2_1, RankOfObject, NrRows( morphism_attr_1_1 ) ), deduped_3_1, UnderlyingMatrix, morphism_attr_1_1 ) );
    fi;
    return;
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddDirectProduct( cat,
        
########
function ( cat_1, arg2_1 )
    local morphism_attr_1_1, deduped_2_1;
    if Length( arg2_1 ) = 1 then
        return arg2_1[1];
    else
        deduped_2_1 := AmbientCategory( cat_1 );
        morphism_attr_1_1 := Iterated( List( arg2_1, function ( logic_new_func_x_2 )
                  return UnderlyingMatrix( UnderlyingMorphism( logic_new_func_x_2 ) );
              end ), function ( I_2, J_2 )
                return ReducedSyzygiesOfRows( I_2, J_2 ) * I_2;
            end );
        return ObjectifyObjectForCAPWithAttributes( rec(
               ), cat_1, UnderlyingMorphism, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                 ), deduped_2_1, ObjectifyObjectForCAPWithAttributes( rec(
                   ), deduped_2_1, RankOfObject, NrRows( morphism_attr_1_1 ) ), ObjectifyObjectForCAPWithAttributes( rec(
                   ), deduped_2_1, RankOfObject, NrColumns( morphism_attr_1_1 ) ), UnderlyingMatrix, morphism_attr_1_1 ) );
    fi;
    return;
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddIdentityMorphism( cat,
        
########
function ( cat_1, a_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := AmbientCategory( cat_1 );
    deduped_1_1 := Source( UnderlyingMorphism( a_1 ) );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, a_1, a_1, UnderlyingCell, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), deduped_2_1, deduped_1_1, deduped_1_1, UnderlyingMatrix, HomalgIdentityMatrix( RankOfObject( deduped_1_1 ), UnderlyingRing( deduped_2_1 ) ) ) );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddInitialObject( cat,
        
########
function ( cat_1 )
    local morphism_attr_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := BaseObject( cat_1 );
    deduped_2_1 := AmbientCategory( cat_1 );
    morphism_attr_1_1 := HomalgZeroMatrix( 0, RankOfObject( deduped_3_1 ), UnderlyingRing( deduped_2_1 ) );
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), cat_1, UnderlyingMorphism, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), deduped_2_1, ObjectifyObjectForCAPWithAttributes( rec(
               ), deduped_2_1, RankOfObject, 0 ), deduped_3_1, UnderlyingMatrix, morphism_attr_1_1 ) );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddInverseForMorphisms( cat,
        
########
function ( cat_1, alpha_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := UnderlyingCell( alpha_1 );
    deduped_2_1 := AmbientCategory( cat_1 );
    deduped_1_1 := Range( deduped_3_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, Range( alpha_1 ), Source( alpha_1 ), UnderlyingCell, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), deduped_2_1, deduped_1_1, Source( deduped_3_1 ), UnderlyingMatrix, RightDivide( HomalgIdentityMatrix( RankOfObject( deduped_1_1 ), UnderlyingRing( deduped_2_1 ) ), UnderlyingMatrix( deduped_3_1 ) ) ) );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddIsAutomorphism( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := UnderlyingCell( arg2_1 );
    deduped_2_1 := UnderlyingMatrix( deduped_3_1 );
    deduped_1_1 := RowRankOfMatrix( deduped_2_1 );
    return RankOfObject( Source( deduped_3_1 ) ) = RankOfObject( Range( deduped_3_1 ) ) and (NumberRows( deduped_2_1 ) - deduped_1_1 = 0 and NumberColumns( deduped_2_1 ) - deduped_1_1 = 0);
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddIsColiftableAlongEpimorphism( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return IsZero( DecideZeroColumns( UnderlyingMatrix( UnderlyingCell( arg3_1 ) ), UnderlyingMatrix( UnderlyingCell( arg2_1 ) ) ) );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddIsCongruentForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return UnderlyingMatrix( UnderlyingCell( arg3_1 ) ) = UnderlyingMatrix( UnderlyingCell( arg2_1 ) );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddIsEqualForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return UnderlyingMatrix( UnderlyingCell( arg3_1 ) ) = UnderlyingMatrix( UnderlyingCell( arg2_1 ) );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddIsEqualForObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := UnderlyingMorphism( arg3_1 );
    deduped_1_1 := UnderlyingMorphism( arg2_1 );
    return RankOfObject( Source( deduped_1_1 ) ) = RankOfObject( Source( deduped_2_1 ) ) and UnderlyingMatrix( deduped_1_1 ) = UnderlyingMatrix( deduped_2_1 );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddIsHomSetInhabited( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return IsZero( DecideZeroRows( UnderlyingMatrix( UnderlyingMorphism( arg2_1 ) ), UnderlyingMatrix( UnderlyingMorphism( arg3_1 ) ) ) );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddIsInitial( cat,
        
########
function ( cat_1, arg2_1 )
    return RankOfObject( Source( UnderlyingMorphism( arg2_1 ) ) ) = 0;
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddIsIsomorphism( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := UnderlyingMatrix( UnderlyingCell( arg2_1 ) );
    deduped_1_1 := RowRankOfMatrix( deduped_2_1 );
    return NumberRows( deduped_2_1 ) - deduped_1_1 = 0 and NumberColumns( deduped_2_1 ) - deduped_1_1 = 0;
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddIsLiftable( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return IsZero( DecideZeroRows( UnderlyingMatrix( UnderlyingCell( arg2_1 ) ), UnderlyingMatrix( UnderlyingCell( arg3_1 ) ) ) );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddIsLiftableAlongMonomorphism( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return IsZero( DecideZeroRows( UnderlyingMatrix( UnderlyingCell( arg3_1 ) ), UnderlyingMatrix( UnderlyingCell( arg2_1 ) ) ) );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddIsOne( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1;
    deduped_1_1 := UnderlyingCell( arg2_1 );
    return HomalgIdentityMatrix( RankOfObject( Source( deduped_1_1 ) ), UnderlyingRing( AmbientCategory( cat_1 ) ) ) = UnderlyingMatrix( deduped_1_1 );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddIsSplitEpimorphism( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1;
    deduped_1_1 := UnderlyingCell( arg2_1 );
    return IsZero( DecideZeroRows( HomalgIdentityMatrix( RankOfObject( Range( deduped_1_1 ) ), UnderlyingRing( AmbientCategory( cat_1 ) ) ), UnderlyingMatrix( deduped_1_1 ) ) );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddIsTerminal( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := UnderlyingMatrix( UnderlyingMorphism( arg2_1 ) );
    deduped_1_1 := RowRankOfMatrix( deduped_2_1 );
    return NumberRows( deduped_2_1 ) - deduped_1_1 = 0 and NumberColumns( deduped_2_1 ) - deduped_1_1 = 0;
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddIsWeakInitial( cat,
        
########
function ( cat_1, arg2_1 )
    return IsZero( UnderlyingMatrix( UnderlyingMorphism( arg2_1 ) ) );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddIsWeakTerminal( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1;
    deduped_1_1 := UnderlyingMorphism( arg2_1 );
    return IsZero( DecideZeroRows( HomalgIdentityMatrix( RankOfObject( Range( deduped_1_1 ) ), UnderlyingRing( AmbientCategory( cat_1 ) ) ), UnderlyingMatrix( deduped_1_1 ) ) );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddIsWellDefinedForMorphisms( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := UnderlyingCell( arg2_1 );
    deduped_2_1 := UnderlyingMorphism( Range( arg2_1 ) );
    deduped_1_1 := UnderlyingMorphism( Source( arg2_1 ) );
    return RankOfObject( Source( deduped_1_1 ) ) = RankOfObject( Source( deduped_3_1 ) ) and RankOfObject( Source( deduped_2_1 ) ) = RankOfObject( Range( deduped_3_1 ) ) and UnderlyingMatrix( deduped_1_1 ) = UnderlyingMatrix( deduped_3_1 ) * UnderlyingMatrix( deduped_2_1 );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddIsWellDefinedForObjects( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := AmbientCategory( cat_1 );
    deduped_4_1 := UnderlyingMorphism( arg2_1 );
    deduped_3_1 := UnderlyingMatrix( deduped_4_1 );
    deduped_2_1 := Source( deduped_4_1 );
    deduped_1_1 := Range( deduped_4_1 );
    return IS_IDENTICAL_OBJ( deduped_1_1, BaseObject( cat_1 ) ) and function (  )
              if not IS_IDENTICAL_OBJ( deduped_5_1, CapCategory( deduped_2_1 ) ) then
                  return false;
              elif not IS_IDENTICAL_OBJ( deduped_5_1, CapCategory( deduped_4_1 ) ) then
                  return false;
              elif not IS_IDENTICAL_OBJ( deduped_5_1, CapCategory( deduped_1_1 ) ) then
                  return false;
              elif NumberRows( deduped_3_1 ) <> RankOfObject( deduped_2_1 ) then
                  return false;
              elif NumberColumns( deduped_3_1 ) <> RankOfObject( deduped_1_1 ) then
                  return false;
              else
                  return true;
              fi;
              return;
          end(  );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddLift( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := UnderlyingCell( beta_1 );
    deduped_1_1 := UnderlyingCell( alpha_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, Source( alpha_1 ), Source( beta_1 ), UnderlyingCell, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), AmbientCategory( cat_1 ), Source( deduped_1_1 ), Source( deduped_2_1 ), UnderlyingMatrix, RightDivide( UnderlyingMatrix( deduped_1_1 ), UnderlyingMatrix( deduped_2_1 ) ) ) );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddLiftAlongMonomorphism( cat,
        
########
function ( cat_1, iota_1, tau_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := UnderlyingCell( iota_1 );
    deduped_1_1 := UnderlyingCell( tau_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, Source( tau_1 ), Source( iota_1 ), UnderlyingCell, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), AmbientCategory( cat_1 ), Source( deduped_1_1 ), Source( deduped_2_1 ), UnderlyingMatrix, RightDivide( UnderlyingMatrix( deduped_1_1 ), UnderlyingMatrix( deduped_2_1 ) ) ) );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddMorphismConstructor( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, arg2_1, arg4_1, UnderlyingCell, arg3_1 );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddMorphismDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return UnderlyingCell( arg2_1 );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddObjectConstructor( cat,
        
########
function ( cat_1, arg2_1 )
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), cat_1, UnderlyingMorphism, arg2_1 );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddObjectDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return UnderlyingMorphism( arg2_1 );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddPostCompose( cat,
        
########
function ( cat_1, beta_1, alpha_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := UnderlyingCell( beta_1 );
    deduped_1_1 := UnderlyingCell( alpha_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, Source( alpha_1 ), Range( beta_1 ), UnderlyingCell, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), AmbientCategory( cat_1 ), Source( deduped_1_1 ), Range( deduped_2_1 ), UnderlyingMatrix, UnderlyingMatrix( deduped_1_1 ) * UnderlyingMatrix( deduped_2_1 ) ) );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddPreCompose( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := UnderlyingCell( beta_1 );
    deduped_1_1 := UnderlyingCell( alpha_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, Source( alpha_1 ), Range( beta_1 ), UnderlyingCell, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), AmbientCategory( cat_1 ), Source( deduped_1_1 ), Range( deduped_2_1 ), UnderlyingMatrix, UnderlyingMatrix( deduped_1_1 ) * UnderlyingMatrix( deduped_2_1 ) ) );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddSubtractionForMorphisms( cat,
        
########
function ( cat_1, a_1, b_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := UnderlyingCell( b_1 );
    deduped_1_1 := UnderlyingCell( a_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, Source( a_1 ), Range( a_1 ), UnderlyingCell, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), AmbientCategory( cat_1 ), Source( deduped_1_1 ), Range( deduped_2_1 ), UnderlyingMatrix, UnderlyingMatrix( deduped_1_1 ) + (- UnderlyingMatrix( deduped_2_1 )) ) );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddTerminalObject( cat,
        
########
function ( cat_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := BaseObject( cat_1 );
    deduped_1_1 := AmbientCategory( cat_1 );
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), cat_1, UnderlyingMorphism, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), deduped_1_1, deduped_2_1, deduped_2_1, UnderlyingMatrix, HomalgIdentityMatrix( RankOfObject( deduped_2_1 ), UnderlyingRing( deduped_1_1 ) ) ) );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddUniversalMorphismFromInitialObjectWithGivenInitialObject( cat,
        
########
function ( cat_1, T_1, P_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := AmbientCategory( cat_1 );
    deduped_2_1 := Source( UnderlyingMorphism( T_1 ) );
    deduped_1_1 := Source( UnderlyingMorphism( P_1 ) );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, P_1, T_1, UnderlyingCell, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
             ), deduped_3_1, deduped_1_1, deduped_2_1, UnderlyingMatrix, HomalgZeroMatrix( RankOfObject( deduped_1_1 ), RankOfObject( deduped_2_1 ), UnderlyingRing( deduped_3_1 ) ) ) );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
    ##
    AddUniversalMorphismIntoTerminalObject( cat,
        
########
function ( cat_1, T_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := BaseObject( cat_1 );
    deduped_1_1 := AmbientCategory( cat_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, T_1, ObjectifyObjectForCAPWithAttributes( rec(
             ), cat_1, UnderlyingMorphism, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
               ), deduped_1_1, deduped_2_1, deduped_2_1, UnderlyingMatrix, HomalgIdentityMatrix( RankOfObject( deduped_2_1 ), UnderlyingRing( deduped_1_1 ) ) ) ), UnderlyingCell, UnderlyingMorphism( T_1 ) );
end
########
        
    , 100 : IsPrecompiledFunction := true );
    
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
