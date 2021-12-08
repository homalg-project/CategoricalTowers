# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_StablePosetOfCategoryOfPosetOfCategoryOfSliceCategoryOverTensorUnitOfCategoryOfRowsOfCommutativeRingPrecompiled", function ( cat )
    
    ##
    AddExponentialOnObjects( cat,
        
########
function ( cat_1, a_1, b_1 )
    local morphism_attr_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1;
    deduped_12_1 := 1 * 1;
    deduped_11_1 := AmbientCategory( cat_1 );
    deduped_10_1 := AmbientCategory( deduped_11_1 );
    deduped_9_1 := UnderlyingMorphism( UnderlyingCell( UnderlyingCell( a_1 ) ) );
    deduped_8_1 := AmbientCategory( deduped_10_1 );
    deduped_7_1 := UnderlyingRing( deduped_8_1 );
    deduped_6_1 := HomalgIdentityMatrix( 1, deduped_7_1 );
    deduped_5_1 := DiagMat( deduped_7_1, ListWithIdenticalEntries( deduped_12_1, deduped_6_1 ) ) * HomalgMatrix( PermutationMat( PermList( List( [ 1 .. deduped_12_1 ], function ( i_2 )
                      local deduped_1_2;
                      deduped_1_2 := (i_2 - 1);
                      return (REM_INT( deduped_1_2, 1 ) * 1 + QUO_INT( deduped_1_2, 1 ) + 1);
                  end ) ), deduped_12_1 ), deduped_12_1, deduped_12_1, deduped_7_1 ) * DiagMat( deduped_7_1, ListWithIdenticalEntries( 1, function (  )
                  if (1 = 0) then
                      return HomalgZeroMatrix( deduped_12_1, 1, deduped_7_1 );
                  else
                      return ConvertMatrixToColumn( deduped_6_1 );
                  fi;
                  return;
              end(  ) ) );
    hoisted_4_1 := RightDivide( HomalgIdentityMatrix( NumberColumns( deduped_5_1 ), deduped_7_1 ), deduped_5_1 ) * TransposedMatrix( UnderlyingMatrix( deduped_9_1 ) );
    hoisted_3_1 := deduped_7_1;
    hoisted_2_1 := RankOfObject( Source( deduped_9_1 ) );
    morphism_attr_1_1 := CapFixpoint( function ( x_2, y_2 )
            return IsZero( DecideZeroRows( y_2, x_2 ) );
        end, function ( x_2 )
            return ReducedSyzygiesOfRows( hoisted_4_1, DiagMat( hoisted_3_1, ListWithIdenticalEntries( hoisted_2_1, x_2 ) ) );
        end, UnderlyingMatrix( UnderlyingMorphism( UnderlyingCell( UnderlyingCell( b_1 ) ) ) ) );
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), cat_1, UnderlyingCell, ObjectifyObjectForCAPWithAttributes( rec(
             ), deduped_11_1, UnderlyingCell, ObjectifyObjectForCAPWithAttributes( rec(
               ), deduped_10_1, UnderlyingMorphism, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                 ), deduped_8_1, ObjectifyObjectForCAPWithAttributes( rec(
                   ), deduped_8_1, RankOfObject, NrRows( morphism_attr_1_1 ) ), ObjectifyObjectForCAPWithAttributes( rec(
                   ), deduped_8_1, RankOfObject, NrColumns( morphism_attr_1_1 ) ), UnderlyingMatrix, morphism_attr_1_1 ) ) ) );
end
########
        
    , 100 );
    
end );

BindGlobal( "StablePosetOfCategoryOfPosetOfCategoryOfSliceCategoryOverTensorUnitOfCategoryOfRowsOfCommutativeRingPrecompiled", function ( R )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function ( R )
    local F, S, P, L;
    F := CategoryOfRows( R : FinalizeCategory := true );
    S := SliceCategoryOverTensorUnit( F : FinalizeCategory := true );
    P := PosetOfCategory( S : FinalizeCategory := true );
    L := StablePosetOfCategory( P );
    SetIsCocartesianCoclosedCategory( L, true );
    return L;
end;
        
        
    
    cat := category_constructor( R : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_StablePosetOfCategoryOfPosetOfCategoryOfSliceCategoryOverTensorUnitOfCategoryOfRowsOfCommutativeRingPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
