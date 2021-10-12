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
    local cap_jit_morphism_attribute_1_1, cap_jit_hoisted_expression_1_1, cap_jit_hoisted_expression_2_1, cap_jit_hoisted_expression_3_1;
    cap_jit_hoisted_expression_1_1 := HomalgIdentityMatrix( 1, UnderlyingRing( AmbientCategory( AmbientCategory( AmbientCategory( cat_1 ) ) ) ) );
    cap_jit_hoisted_expression_2_1 := TransposedMatrix( HomalgIdentityMatrix( RankOfObject( Source( UnderlyingMorphism( UnderlyingCell( UnderlyingCell( a_1 ) ) ) ) ), UnderlyingRing( AmbientCategory( AmbientCategory( AmbientCategory( cat_1 ) ) ) ) ) );
    cap_jit_hoisted_expression_3_1 := RightDivide( HomalgIdentityMatrix( NumberColumns( KroneckerMat( HomalgIdentityMatrix( 1 * 1, UnderlyingRing( AmbientCategory( AmbientCategory( AmbientCategory( cat_1 ) ) ) ) ), HomalgIdentityMatrix( 1, UnderlyingRing( AmbientCategory( AmbientCategory( AmbientCategory( cat_1 ) ) ) ) ) ) * KroneckerMat( HomalgMatrix( PermutationMat( PermList( List( [ 1 .. (1 * 1) ], function ( i_2 )
                                return (REM_INT( (i_2 - 1), 1 ) * 1 + QUO_INT( (i_2 - 1), 1 ) + 1);
                            end ) ), (1 * 1) ), (1 * 1), (1 * 1), UnderlyingRing( AmbientCategory( AmbientCategory( AmbientCategory( cat_1 ) ) ) ) ), HomalgIdentityMatrix( 1, UnderlyingRing( AmbientCategory( AmbientCategory( AmbientCategory( cat_1 ) ) ) ) ) ) * KroneckerMat( HomalgIdentityMatrix( 1, UnderlyingRing( AmbientCategory( AmbientCategory( AmbientCategory( cat_1 ) ) ) ) ), function (  )
                        if (1 = 0) then
                            return HomalgZeroMatrix( (1 * 1), 1, UnderlyingRing( AmbientCategory( AmbientCategory( AmbientCategory( cat_1 ) ) ) ) );
                        else
                            return UnionOfRows( List( [ 1 .. 1 ], function ( i_3 )
                                      return CertainColumns( cap_jit_hoisted_expression_1_1, [ i_3 ] );
                                  end ) );
                        fi;
                        return;
                    end(  ) ) ), UnderlyingRing( AmbientCategory( AmbientCategory( AmbientCategory( cat_1 ) ) ) ) ), KroneckerMat( HomalgIdentityMatrix( 1 * 1, UnderlyingRing( AmbientCategory( AmbientCategory( AmbientCategory( cat_1 ) ) ) ) ), HomalgIdentityMatrix( 1, UnderlyingRing( AmbientCategory( AmbientCategory( AmbientCategory( cat_1 ) ) ) ) ) ) * KroneckerMat( HomalgMatrix( PermutationMat( PermList( List( [ 1 .. (1 * 1) ], function ( i_2 )
                            return (REM_INT( (i_2 - 1), 1 ) * 1 + QUO_INT( (i_2 - 1), 1 ) + 1);
                        end ) ), (1 * 1) ), (1 * 1), (1 * 1), UnderlyingRing( AmbientCategory( AmbientCategory( AmbientCategory( cat_1 ) ) ) ) ), HomalgIdentityMatrix( 1, UnderlyingRing( AmbientCategory( AmbientCategory( AmbientCategory( cat_1 ) ) ) ) ) ) * KroneckerMat( HomalgIdentityMatrix( 1, UnderlyingRing( AmbientCategory( AmbientCategory( AmbientCategory( cat_1 ) ) ) ) ), function (  )
                    if (1 = 0) then
                        return HomalgZeroMatrix( (1 * 1), 1, UnderlyingRing( AmbientCategory( AmbientCategory( AmbientCategory( cat_1 ) ) ) ) );
                    else
                        return UnionOfRows( List( [ 1 .. 1 ], function ( i_3 )
                                  return CertainColumns( cap_jit_hoisted_expression_1_1, [ i_3 ] );
                              end ) );
                    fi;
                    return;
                end(  ) ) ) * KroneckerMat( TransposedMatrix( UnderlyingMatrix( UnderlyingMorphism( UnderlyingCell( UnderlyingCell( a_1 ) ) ) ) ), HomalgIdentityMatrix( 1, UnderlyingRing( AmbientCategory( AmbientCategory( AmbientCategory( cat_1 ) ) ) ) ) );
    cap_jit_morphism_attribute_1_1 := CapFixpoint( function ( x_2, y_2 )
            return IsZero( DecideZeroRows( y_2, x_2 ) );
        end, function ( x_2 )
            return ReducedSyzygiesOfRows( cap_jit_hoisted_expression_3_1, KroneckerMat( cap_jit_hoisted_expression_2_1, x_2 ) );
        end, UnderlyingMatrix( UnderlyingMorphism( UnderlyingCell( UnderlyingCell( b_1 ) ) ) ) );
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), cat_1, UnderlyingCell, ObjectifyObjectForCAPWithAttributes( rec(
             ), AmbientCategory( cat_1 ), UnderlyingCell, ObjectifyObjectForCAPWithAttributes( rec(
               ), AmbientCategory( AmbientCategory( cat_1 ) ), UnderlyingMorphism, ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
                 ), AmbientCategory( AmbientCategory( AmbientCategory( cat_1 ) ) ), ObjectifyObjectForCAPWithAttributes( rec(
                   ), AmbientCategory( AmbientCategory( AmbientCategory( cat_1 ) ) ), RankOfObject, NrRows( cap_jit_morphism_attribute_1_1 ) ), ObjectifyObjectForCAPWithAttributes( rec(
                   ), AmbientCategory( AmbientCategory( AmbientCategory( cat_1 ) ) ), RankOfObject, NrColumns( cap_jit_morphism_attribute_1_1 ) ), UnderlyingMatrix, cap_jit_morphism_attribute_1_1 ) ) ) );
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
    
    if ValueOption( "FinalizeCategory" ) = false then
        
        return cat;
        
    fi;
    
    Finalize( cat );
    
    return cat;
    
end );
