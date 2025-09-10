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
    local hoisted_1_1, hoisted_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1;
    deduped_12_1 := 1 * 1;
    deduped_11_1 := AmbientCategory( cat_1 );
    deduped_10_1 := AmbientCategory( deduped_11_1 );
    deduped_9_1 := UnderlyingMorphism( UnderlyingGapObject( UnderlyingGapObject( a_1 ) ) );
    deduped_8_1 := AmbientCategory( deduped_10_1 );
    deduped_7_1 := UnderlyingRing( deduped_8_1 );
    deduped_6_1 := HomalgIdentityMatrix( 1, deduped_7_1 );
    deduped_4_1 := CertainRows( HomalgIdentityMatrix( deduped_12_1, deduped_7_1 ), List( [ 1 .. deduped_12_1 ], function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := i_2 - 1;
              return REM_INT( deduped_1_2, 1 ) * 1 + QUO_INT( deduped_1_2, 1 ) + 1;
          end ) );
    hoisted_3_1 := ConvertMatrixToRow( deduped_6_1 ) * deduped_4_1 * DiagMat( deduped_7_1, ListWithIdenticalEntries( 1, deduped_4_1 ) ) * DiagMat( deduped_7_1, ListWithIdenticalEntries( 1, deduped_6_1 ) ) * TransposedMatrix( UnderlyingMatrix( deduped_9_1 ) );
    hoisted_1_1 := RankOfObject( Source( deduped_9_1 ) );
    deduped_5_1 := CapFixpoint( function ( x_2, y_2 )
            return IsZero( DecideZeroRows( y_2, x_2 ) );
        end, function ( x_2 )
            return ReducedSyzygiesOfRows( hoisted_3_1, DiagMat( deduped_7_1, ListWithIdenticalEntries( hoisted_1_1, x_2 ) ) );
        end, UnderlyingMatrix( UnderlyingMorphism( UnderlyingGapObject( UnderlyingGapObject( b_1 ) ) ) ) );
    return CreateCapCategoryObjectWithAttributes( cat_1, UnderlyingGapObject, CreateCapCategoryObjectWithAttributes( deduped_11_1, UnderlyingGapObject, CreateCapCategoryObjectWithAttributes( deduped_10_1, UnderlyingMorphism, CreateCapCategoryMorphismWithAttributes( deduped_8_1, CreateCapCategoryObjectWithAttributes( deduped_8_1, RankOfObject, NumberRows( deduped_5_1 ) ), CreateCapCategoryObjectWithAttributes( deduped_8_1, RankOfObject, NumberColumns( deduped_5_1 ) ), UnderlyingMatrix, deduped_5_1 ) ) ) );
end
########
        
    , 100 );
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
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
    return L;
end;
        
        
    
    cat := category_constructor( R : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_StablePosetOfCategoryOfPosetOfCategoryOfSliceCategoryOverTensorUnitOfCategoryOfRowsOfCommutativeRingPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
