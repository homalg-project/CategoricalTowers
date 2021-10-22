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
    local cap_jit_morphism_attribute_1_1, cap_jit_hoisted_expression_1_1, cap_jit_hoisted_expression_2_1, cap_jit_deduplicated_expression_1_1, cap_jit_deduplicated_expression_2_1, cap_jit_deduplicated_expression_3_1, cap_jit_deduplicated_expression_4_1, cap_jit_deduplicated_expression_5_1, cap_jit_deduplicated_expression_6_1, cap_jit_deduplicated_expression_7_1, cap_jit_deduplicated_expression_9_1;
    cap_jit_deduplicated_expression_7_1 := AmbientCategory( cat_1 );
    cap_jit_deduplicated_expression_6_1 := AmbientCategory( cap_jit_deduplicated_expression_7_1 );
    cap_jit_deduplicated_expression_4_1 := AmbientCategory( cap_jit_deduplicated_expression_6_1 );
    cap_jit_deduplicated_expression_3_1 := UnderlyingRing( cap_jit_deduplicated_expression_4_1 );
    cap_jit_deduplicated_expression_2_1 := HomalgIdentityMatrix( 1, cap_jit_deduplicated_expression_3_1 );
    cap_jit_deduplicated_expression_9_1 := 1 * 1;
    cap_jit_deduplicated_expression_1_1 := KroneckerMat( HomalgIdentityMatrix( cap_jit_deduplicated_expression_9_1, cap_jit_deduplicated_expression_3_1 ), cap_jit_deduplicated_expression_2_1 ) * KroneckerMat( HomalgMatrix( PermutationMat( PermList( List( [ 1 .. cap_jit_deduplicated_expression_9_1 ], function ( i_2 )
                        local cap_jit_deduplicated_expression_8_2;
                        cap_jit_deduplicated_expression_8_2 := (i_2 - 1);
                        return (REM_INT( cap_jit_deduplicated_expression_8_2, 1 ) * 1 + QUO_INT( cap_jit_deduplicated_expression_8_2, 1 ) + 1);
                    end ) ), cap_jit_deduplicated_expression_9_1 ), cap_jit_deduplicated_expression_9_1, cap_jit_deduplicated_expression_9_1, cap_jit_deduplicated_expression_3_1 ), cap_jit_deduplicated_expression_2_1 ) * KroneckerMat( cap_jit_deduplicated_expression_2_1, function (  )
                if (1 = 0) then
                    return HomalgZeroMatrix( cap_jit_deduplicated_expression_9_1, 1, cap_jit_deduplicated_expression_3_1 );
                else
                    return ConvertMatrixToColumn( cap_jit_deduplicated_expression_2_1 );
                fi;
                return;
            end(  ) );
    cap_jit_deduplicated_expression_5_1 := UnderlyingMorphism( UnderlyingCell( UnderlyingCell( a_1 ) ) );
    cap_jit_hoisted_expression_1_1 := TransposedMatrix( HomalgIdentityMatrix( RankOfObject( Source( cap_jit_deduplicated_expression_5_1 ) ), cap_jit_deduplicated_expression_3_1 ) );
    cap_jit_hoisted_expression_2_1 := RightDivide( HomalgIdentityMatrix( NumberColumns( cap_jit_deduplicated_expression_1_1 ), cap_jit_deduplicated_expression_3_1 ), cap_jit_deduplicated_expression_1_1 ) * KroneckerMat( TransposedMatrix( UnderlyingMatrix( cap_jit_deduplicated_expression_5_1 ) ), cap_jit_deduplicated_expression_2_1 );
    cap_jit_morphism_attribute_1_1 := CapFixpoint( function ( x_2, y_2 )
            return IsZero( DecideZeroRows( y_2, x_2 ) );
        end, function ( x_2 )
            return ReducedSyzygiesOfRows( cap_jit_hoisted_expression_2_1, KroneckerMat( cap_jit_hoisted_expression_1_1, x_2 ) );
        end, UnderlyingMatrix( UnderlyingMorphism( UnderlyingCell( UnderlyingCell( b_1 ) ) ) ) );
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), cat_1, UnderlyingCell, ObjectifyObjectForCAPWithAttributes( rec(
             ), cap_jit_deduplicated_expression_7_1, UnderlyingCell, ObjectifyObjectForCAPWithAttributes( rec(
               ), cap_jit_deduplicated_expression_6_1, UnderlyingMorphism, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                 ), cap_jit_deduplicated_expression_4_1, ObjectifyObjectForCAPWithAttributes( rec(
                   ), cap_jit_deduplicated_expression_4_1, RankOfObject, NrRows( cap_jit_morphism_attribute_1_1 ) ), ObjectifyObjectForCAPWithAttributes( rec(
                   ), cap_jit_deduplicated_expression_4_1, RankOfObject, NrColumns( cap_jit_morphism_attribute_1_1 ) ), UnderlyingMatrix, cap_jit_morphism_attribute_1_1 ) ) ) );
end
########
        
    );
    
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
