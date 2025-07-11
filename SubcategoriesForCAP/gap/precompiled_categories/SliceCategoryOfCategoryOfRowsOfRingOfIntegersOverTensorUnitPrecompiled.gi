# SPDX-License-Identifier: GPL-2.0-or-later
# SubcategoriesForCAP: Subcategory and other related constructors for CAP categories
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_SliceCategoryOfCategoryOfRowsOfRingOfIntegersOverTensorUnitPrecompiled", function ( cat )
    
    ##
    AddColiftAlongEpimorphism( cat,
        
########
function ( cat_1, epsilon_1, tau_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := UnderlyingCell( tau_1 );
    deduped_1_1 := UnderlyingCell( epsilon_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Range( epsilon_1 ), Range( tau_1 ), UnderlyingCell, CreateCapCategoryMorphismWithAttributes( AmbientCategory( cat_1 ), Range( deduped_1_1 ), Range( deduped_2_1 ), UnderlyingMatrix, UniqueLeftDivide( UnderlyingMatrix( deduped_1_1 ), UnderlyingMatrix( deduped_2_1 ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddCoproduct( cat,
        
########
function ( cat_1, objects_1 )
    local morphism_attr_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := BaseObject( cat_1 );
    deduped_2_1 := AmbientCategory( cat_1 );
    morphism_attr_1_1 := UnionOfRows( UnderlyingRing( deduped_2_1 ), RankOfObject( deduped_3_1 ), List( objects_1, function ( logic_new_func_x_2 )
              return UnderlyingMatrix( UnderlyingMorphism( logic_new_func_x_2 ) );
          end ) );
    return CreateCapCategoryObjectWithAttributes( cat_1, UnderlyingMorphism, CreateCapCategoryMorphismWithAttributes( deduped_2_1, CreateCapCategoryObjectWithAttributes( deduped_2_1, RankOfObject, NumberRows( morphism_attr_1_1 ) ), deduped_3_1, UnderlyingMatrix, morphism_attr_1_1 ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.Coproduct :=
        
########
function ( cat_1, objects_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := BaseObject( cat_1 );
    deduped_1_1 := AmbientCategory( cat_1 );
    return CreateCapCategoryObjectWithAttributes( cat_1, UnderlyingMorphism, CreateCapCategoryMorphismWithAttributes( deduped_1_1, CreateCapCategoryObjectWithAttributes( deduped_1_1, RankOfObject, Sum( List( objects_1, function ( logic_new_func_x_2 )
                    return RankOfObject( Source( UnderlyingMorphism( logic_new_func_x_2 ) ) );
                end ) ) ), deduped_2_1, UnderlyingMatrix, UnionOfRows( UnderlyingRing( deduped_1_1 ), RankOfObject( deduped_2_1 ), List( objects_1, function ( logic_new_func_x_2 )
                  return UnderlyingMatrix( UnderlyingMorphism( logic_new_func_x_2 ) );
              end ) ) ) );
end
########
        
    ;
    
    ##
    AddDirectProduct( cat,
        
########
function ( cat_1, objects_1 )
    local deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1;
    deduped_13_1 := Length( objects_1 );
    deduped_12_1 := AmbientCategory( cat_1 );
    deduped_11_1 := UnderlyingRing( deduped_12_1 );
    deduped_10_1 := List( objects_1, function ( logic_new_func_x_2 )
            return UnderlyingMatrix( UnderlyingMorphism( logic_new_func_x_2 ) );
        end );
    deduped_9_1 := List( objects_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( UnderlyingMorphism( logic_new_func_x_2 ) ) );
        end );
    deduped_8_1 := Sum( deduped_9_1 );
    deduped_7_1 := Sum( deduped_9_1{[ 1 .. 1 - 1 ]} );
    deduped_6_1 := List( [ 1 .. deduped_13_1 ], function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_9_1[i_2];
            return UnionOfRows( deduped_11_1, deduped_1_2, [ HomalgZeroMatrix( Sum( deduped_9_1{[ 1 .. (i_2 - 1) ]} ), deduped_1_2, deduped_11_1 ), HomalgIdentityMatrix( deduped_1_2, deduped_11_1 ), HomalgZeroMatrix( Sum( deduped_9_1{[ (i_2 + 1) .. deduped_13_1 ]} ), deduped_1_2, deduped_11_1 ) ] ) * deduped_10_1[i_2];
        end );
    deduped_5_1 := CertainColumns( SyzygiesOfRows( (UnionOfColumns( deduped_11_1, deduped_8_1, deduped_6_1{[ 1 .. deduped_13_1 - 1 ]} ) + (- UnionOfColumns( deduped_11_1, deduped_8_1, deduped_6_1{[ 2 .. deduped_13_1 ]} ))) ), [ (deduped_7_1 + 1) .. (deduped_7_1 + deduped_9_1[1]) ] ) * deduped_10_1[1];
    return CreateCapCategoryObjectWithAttributes( cat_1, UnderlyingMorphism, CreateCapCategoryMorphismWithAttributes( deduped_12_1, CreateCapCategoryObjectWithAttributes( deduped_12_1, RankOfObject, NumberRows( deduped_5_1 ) ), CAP_JIT_INCOMPLETE_LOGIC( Range( UnderlyingMorphism( CAP_JIT_INCOMPLETE_LOGIC( objects_1[1] ) ) ) ), UnderlyingMatrix, deduped_5_1 ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.DirectProduct :=
        
########
function ( cat_1, objects_1 )
    local deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1;
    deduped_13_1 := Length( objects_1 );
    deduped_12_1 := AmbientCategory( cat_1 );
    deduped_11_1 := UnderlyingRing( deduped_12_1 );
    deduped_10_1 := List( objects_1, function ( logic_new_func_x_2 )
            return UnderlyingMatrix( UnderlyingMorphism( logic_new_func_x_2 ) );
        end );
    deduped_9_1 := List( objects_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( UnderlyingMorphism( logic_new_func_x_2 ) ) );
        end );
    deduped_8_1 := Sum( deduped_9_1 );
    deduped_7_1 := Sum( deduped_9_1{[ 1 .. 1 - 1 ]} );
    deduped_6_1 := List( [ 1 .. deduped_13_1 ], function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_9_1[i_2];
            return UnionOfRows( deduped_11_1, deduped_1_2, [ HomalgZeroMatrix( Sum( deduped_9_1{[ 1 .. (i_2 - 1) ]} ), deduped_1_2, deduped_11_1 ), HomalgIdentityMatrix( deduped_1_2, deduped_11_1 ), HomalgZeroMatrix( Sum( deduped_9_1{[ (i_2 + 1) .. deduped_13_1 ]} ), deduped_1_2, deduped_11_1 ) ] ) * deduped_10_1[i_2];
        end );
    deduped_5_1 := UnionOfColumns( deduped_11_1, deduped_8_1, deduped_6_1{[ 1 .. deduped_13_1 - 1 ]} ) + (- UnionOfColumns( deduped_11_1, deduped_8_1, deduped_6_1{[ 2 .. deduped_13_1 ]} ));
    return CreateCapCategoryObjectWithAttributes( cat_1, UnderlyingMorphism, CreateCapCategoryMorphismWithAttributes( deduped_12_1, CreateCapCategoryObjectWithAttributes( deduped_12_1, RankOfObject, deduped_8_1 - RowRankOfMatrix( deduped_5_1 ) ), List( objects_1, function ( logic_new_func_x_2 )
                  return Range( UnderlyingMorphism( logic_new_func_x_2 ) );
              end )[1], UnderlyingMatrix, CertainColumns( SyzygiesOfRows( deduped_5_1 ), [ (deduped_7_1 + 1) .. (deduped_7_1 + deduped_9_1[1]) ] ) * deduped_10_1[1] ) );
end
########
        
    ;
    
    ##
    AddEmbeddingOfEqualizer( cat,
        
########
function ( cat_1, Y_1, morphisms_1 )
    local morphism_attr_1_1, morphism_attr_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1;
    deduped_10_1 := Length( morphisms_1 );
    deduped_9_1 := UnderlyingMorphism( Y_1 );
    deduped_8_1 := AmbientCategory( cat_1 );
    deduped_7_1 := UnderlyingRing( deduped_8_1 );
    deduped_6_1 := Source( deduped_9_1 );
    deduped_5_1 := RankOfObject( deduped_6_1 );
    deduped_4_1 := List( morphisms_1, function ( logic_new_func_x_2 )
            return UnderlyingMatrix( UnderlyingCell( logic_new_func_x_2 ) );
        end );
    deduped_3_1 := SyzygiesOfRows( UnionOfColumns( deduped_7_1, deduped_5_1, deduped_4_1{[ 1 .. deduped_10_1 - 1 ]} ) + (- UnionOfColumns( deduped_7_1, deduped_5_1, deduped_4_1{[ 2 .. deduped_10_1 ]} )) );
    morphism_attr_2_1 := deduped_3_1;
    morphism_attr_1_1 := deduped_3_1 * UnderlyingMatrix( deduped_9_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, CreateCapCategoryObjectWithAttributes( cat_1, UnderlyingMorphism, CreateCapCategoryMorphismWithAttributes( deduped_8_1, CreateCapCategoryObjectWithAttributes( deduped_8_1, RankOfObject, NumberRows( morphism_attr_1_1 ) ), Range( deduped_9_1 ), UnderlyingMatrix, morphism_attr_1_1 ) ), Y_1, UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_8_1, CreateCapCategoryObjectWithAttributes( deduped_8_1, RankOfObject, NumberRows( morphism_attr_2_1 ) ), deduped_6_1, UnderlyingMatrix, morphism_attr_2_1 ) );
end
########
        
    , 2918 );
    
    ##
    cat!.cached_precompiled_functions.EmbeddingOfEqualizer :=
        
########
function ( cat_1, Y_1, morphisms_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1;
    deduped_10_1 := Length( morphisms_1 );
    deduped_9_1 := UnderlyingMorphism( Y_1 );
    deduped_8_1 := AmbientCategory( cat_1 );
    deduped_7_1 := UnderlyingRing( deduped_8_1 );
    deduped_6_1 := Source( deduped_9_1 );
    deduped_5_1 := RankOfObject( deduped_6_1 );
    deduped_4_1 := List( morphisms_1, function ( logic_new_func_x_2 )
            return UnderlyingMatrix( UnderlyingCell( logic_new_func_x_2 ) );
        end );
    deduped_3_1 := UnionOfColumns( deduped_7_1, deduped_5_1, deduped_4_1{[ 1 .. deduped_10_1 - 1 ]} ) + (- UnionOfColumns( deduped_7_1, deduped_5_1, deduped_4_1{[ 2 .. deduped_10_1 ]} ));
    deduped_2_1 := SyzygiesOfRows( deduped_3_1 );
    deduped_1_1 := CreateCapCategoryObjectWithAttributes( deduped_8_1, RankOfObject, deduped_5_1 - RowRankOfMatrix( deduped_3_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, CreateCapCategoryObjectWithAttributes( cat_1, UnderlyingMorphism, CreateCapCategoryMorphismWithAttributes( deduped_8_1, deduped_1_1, Range( deduped_9_1 ), UnderlyingMatrix, deduped_2_1 * UnderlyingMatrix( deduped_9_1 ) ) ), Y_1, UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_8_1, deduped_1_1, deduped_6_1, UnderlyingMatrix, deduped_2_1 ) );
end
########
        
    ;
    
    ##
    AddIdentityMorphism( cat,
        
########
function ( cat_1, a_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := AmbientCategory( cat_1 );
    deduped_1_1 := Source( UnderlyingMorphism( a_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_2_1, deduped_1_1, deduped_1_1, UnderlyingMatrix, HomalgIdentityMatrix( RankOfObject( deduped_1_1 ), UnderlyingRing( deduped_2_1 ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddImageEmbedding( cat,
        
########
function ( cat_1, alpha_1 )
    local morphism_attr_1_1, morphism_attr_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := UnderlyingCell( alpha_1 );
    deduped_6_1 := Target( alpha_1 );
    deduped_5_1 := AmbientCategory( cat_1 );
    deduped_4_1 := UnderlyingMorphism( deduped_6_1 );
    deduped_3_1 := SyzygiesOfRows( SyzygiesOfColumns( UnderlyingMatrix( deduped_7_1 ) ) );
    morphism_attr_2_1 := deduped_3_1;
    morphism_attr_1_1 := deduped_3_1 * UnderlyingMatrix( deduped_4_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, CreateCapCategoryObjectWithAttributes( cat_1, UnderlyingMorphism, CreateCapCategoryMorphismWithAttributes( deduped_5_1, CreateCapCategoryObjectWithAttributes( deduped_5_1, RankOfObject, NumberRows( morphism_attr_1_1 ) ), Range( deduped_4_1 ), UnderlyingMatrix, morphism_attr_1_1 ) ), deduped_6_1, UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_5_1, CreateCapCategoryObjectWithAttributes( deduped_5_1, RankOfObject, NumberRows( morphism_attr_2_1 ) ), Range( deduped_7_1 ), UnderlyingMatrix, morphism_attr_2_1 ) );
end
########
        
    , 702 );
    
    ##
    cat!.cached_precompiled_functions.ImageEmbedding :=
        
########
function ( cat_1, alpha_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1;
    deduped_8_1 := Target( alpha_1 );
    deduped_7_1 := UnderlyingCell( alpha_1 );
    deduped_6_1 := AmbientCategory( cat_1 );
    deduped_5_1 := UnderlyingMorphism( deduped_8_1 );
    deduped_4_1 := Range( deduped_7_1 );
    deduped_3_1 := SyzygiesOfColumns( UnderlyingMatrix( deduped_7_1 ) );
    deduped_2_1 := SyzygiesOfRows( deduped_3_1 );
    deduped_1_1 := CreateCapCategoryObjectWithAttributes( deduped_6_1, RankOfObject, RankOfObject( deduped_4_1 ) - RowRankOfMatrix( deduped_3_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, CreateCapCategoryObjectWithAttributes( cat_1, UnderlyingMorphism, CreateCapCategoryMorphismWithAttributes( deduped_6_1, deduped_1_1, Range( deduped_5_1 ), UnderlyingMatrix, deduped_2_1 * UnderlyingMatrix( deduped_5_1 ) ) ), deduped_8_1, UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_6_1, deduped_1_1, deduped_4_1, UnderlyingMatrix, deduped_2_1 ) );
end
########
        
    ;
    
    ##
    AddInitialObject( cat,
        
########
function ( cat_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := BaseObject( cat_1 );
    deduped_1_1 := AmbientCategory( cat_1 );
    return CreateCapCategoryObjectWithAttributes( cat_1, UnderlyingMorphism, CreateCapCategoryMorphismWithAttributes( deduped_1_1, CreateCapCategoryObjectWithAttributes( deduped_1_1, RankOfObject, 0 ), deduped_2_1, UnderlyingMatrix, HomalgZeroMatrix( 0, RankOfObject( deduped_2_1 ), UnderlyingRing( deduped_1_1 ) ) ) );
end
########
        
    , 303 );
    
    ##
    AddInjectionOfCofactorOfCoproductWithGivenCoproduct( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1;
    deduped_6_1 := AmbientCategory( cat_1 );
    deduped_5_1 := objects_1[k_1];
    deduped_4_1 := UnderlyingRing( deduped_6_1 );
    deduped_3_1 := List( objects_1, function ( Li_2 )
            return RankOfObject( Source( UnderlyingMorphism( Li_2 ) ) );
        end );
    deduped_2_1 := deduped_3_1[k_1];
    deduped_1_1 := UnionOfColumns( deduped_4_1, deduped_2_1, [ HomalgZeroMatrix( deduped_2_1, Sum( deduped_3_1{[ 1 .. k_1 - 1 ]} ), deduped_4_1 ), HomalgIdentityMatrix( deduped_2_1, deduped_4_1 ), HomalgZeroMatrix( deduped_2_1, Sum( deduped_3_1{[ k_1 + 1 .. Length( objects_1 ) ]} ), deduped_4_1 ) ] );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_5_1, P_1, UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_6_1, CAP_JIT_INCOMPLETE_LOGIC( Source( UnderlyingMorphism( CAP_JIT_INCOMPLETE_LOGIC( deduped_5_1 ) ) ) ), CreateCapCategoryObjectWithAttributes( deduped_6_1, RankOfObject, NumberColumns( deduped_1_1 ) ), UnderlyingMatrix, deduped_1_1 ) );
end
########
        
    , 505 );
    
    ##
    cat!.cached_precompiled_functions.InjectionOfCofactorOfCoproductWithGivenCoproduct :=
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1;
    deduped_4_1 := AmbientCategory( cat_1 );
    deduped_3_1 := UnderlyingRing( deduped_4_1 );
    deduped_2_1 := List( objects_1, function ( Li_2 )
            return RankOfObject( Source( UnderlyingMorphism( Li_2 ) ) );
        end );
    deduped_1_1 := deduped_2_1[k_1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, objects_1[k_1], P_1, UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_4_1, List( objects_1, function ( Li_2 )
                  return Source( UnderlyingMorphism( Li_2 ) );
              end )[k_1], CreateCapCategoryObjectWithAttributes( deduped_4_1, RankOfObject, Sum( deduped_2_1 ) ), UnderlyingMatrix, UnionOfColumns( deduped_3_1, deduped_1_1, [ HomalgZeroMatrix( deduped_1_1, Sum( deduped_2_1{[ 1 .. k_1 - 1 ]} ), deduped_3_1 ), HomalgIdentityMatrix( deduped_1_1, deduped_3_1 ), HomalgZeroMatrix( deduped_1_1, Sum( deduped_2_1{[ k_1 + 1 .. Length( objects_1 ) ]} ), deduped_3_1 ) ] ) ) );
end
########
        
    ;
    
    ##
    AddInverseForMorphisms( cat,
        
########
function ( cat_1, alpha_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := UnderlyingCell( alpha_1 );
    deduped_2_1 := AmbientCategory( cat_1 );
    deduped_1_1 := Range( deduped_3_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Range( alpha_1 ), Source( alpha_1 ), UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_2_1, deduped_1_1, Source( deduped_3_1 ), UnderlyingMatrix, UniqueRightDivide( HomalgIdentityMatrix( RankOfObject( deduped_1_1 ), UnderlyingRing( deduped_2_1 ) ), UnderlyingMatrix( deduped_3_1 ) ) ) );
end
########
        
    , 201 );
    
    ##
    AddIsAutomorphism( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := UnderlyingCell( arg2_1 );
    deduped_4_1 := UnderlyingMatrix( deduped_5_1 );
    deduped_3_1 := UnderlyingRing( AmbientCategory( cat_1 ) );
    deduped_2_1 := RankOfObject( Range( deduped_5_1 ) );
    deduped_1_1 := RankOfObject( Source( deduped_5_1 ) );
    return deduped_1_1 = deduped_2_1 and (IsZero( DecideZeroColumns( HomalgIdentityMatrix( deduped_1_1, deduped_3_1 ), deduped_4_1 ) ) and IsZero( DecideZeroRows( HomalgIdentityMatrix( deduped_2_1, deduped_3_1 ), deduped_4_1 ) ));
end
########
        
    , 505 );
    
    ##
    AddIsColiftableAlongEpimorphism( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return IsZero( DecideZeroColumns( UnderlyingMatrix( UnderlyingCell( arg3_1 ) ), UnderlyingMatrix( UnderlyingCell( arg2_1 ) ) ) );
end
########
        
    , 101 );
    
    ##
    AddIsCongruentForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return UnderlyingMatrix( UnderlyingCell( arg3_1 ) ) = UnderlyingMatrix( UnderlyingCell( arg2_1 ) );
end
########
        
    , 100 );
    
    ##
    AddIsEqualForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return UnderlyingMatrix( UnderlyingCell( arg3_1 ) ) = UnderlyingMatrix( UnderlyingCell( arg2_1 ) );
end
########
        
    , 100 );
    
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
        
    , 200 );
    
    ##
    AddIsHomSetInhabited( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return IsZero( DecideZeroRows( UnderlyingMatrix( UnderlyingMorphism( arg2_1 ) ), UnderlyingMatrix( UnderlyingMorphism( arg3_1 ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddIsInitial( cat,
        
########
function ( cat_1, arg2_1 )
    return RankOfObject( Source( UnderlyingMorphism( arg2_1 ) ) ) = 0;
end
########
        
    , 101 );
    
    ##
    AddIsIsomorphism( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := UnderlyingCell( arg2_1 );
    deduped_2_1 := UnderlyingMatrix( deduped_3_1 );
    deduped_1_1 := UnderlyingRing( AmbientCategory( cat_1 ) );
    return IsZero( DecideZeroColumns( HomalgIdentityMatrix( RankOfObject( Source( deduped_3_1 ) ), deduped_1_1 ), deduped_2_1 ) ) and IsZero( DecideZeroRows( HomalgIdentityMatrix( RankOfObject( Range( deduped_3_1 ) ), deduped_1_1 ), deduped_2_1 ) );
end
########
        
    , 403 );
    
    ##
    AddIsLiftable( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return IsZero( DecideZeroRows( UnderlyingMatrix( UnderlyingCell( arg2_1 ) ), UnderlyingMatrix( UnderlyingCell( arg3_1 ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddIsLiftableAlongMonomorphism( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return IsZero( DecideZeroRows( UnderlyingMatrix( UnderlyingCell( arg3_1 ) ), UnderlyingMatrix( UnderlyingCell( arg2_1 ) ) ) );
end
########
        
    , 101 );
    
    ##
    AddIsOne( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1;
    deduped_1_1 := UnderlyingCell( arg2_1 );
    return HomalgIdentityMatrix( RankOfObject( Source( deduped_1_1 ) ), UnderlyingRing( AmbientCategory( cat_1 ) ) ) = UnderlyingMatrix( deduped_1_1 );
end
########
        
    , 201 );
    
    ##
    AddIsSplitEpimorphism( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1;
    deduped_1_1 := UnderlyingCell( arg2_1 );
    return IsZero( DecideZeroRows( HomalgIdentityMatrix( RankOfObject( Range( deduped_1_1 ) ), UnderlyingRing( AmbientCategory( cat_1 ) ) ), UnderlyingMatrix( deduped_1_1 ) ) );
end
########
        
    , 201 );
    
    ##
    AddIsTerminal( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := UnderlyingMorphism( arg2_1 );
    deduped_2_1 := UnderlyingMatrix( deduped_3_1 );
    deduped_1_1 := UnderlyingRing( AmbientCategory( cat_1 ) );
    return IsZero( DecideZeroColumns( HomalgIdentityMatrix( RankOfObject( Source( deduped_3_1 ) ), deduped_1_1 ), deduped_2_1 ) ) and IsZero( DecideZeroRows( HomalgIdentityMatrix( RankOfObject( Range( deduped_3_1 ) ), deduped_1_1 ), deduped_2_1 ) );
end
########
        
    , 403 );
    
    ##
    AddIsWeakInitial( cat,
        
########
function ( cat_1, arg2_1 )
    return IsZero( UnderlyingMatrix( UnderlyingMorphism( arg2_1 ) ) );
end
########
        
    , 100 );
    
    ##
    AddIsWeakTerminal( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1;
    deduped_1_1 := UnderlyingMorphism( arg2_1 );
    return IsZero( DecideZeroRows( HomalgIdentityMatrix( RankOfObject( Range( deduped_1_1 ) ), UnderlyingRing( AmbientCategory( cat_1 ) ) ), UnderlyingMatrix( deduped_1_1 ) ) );
end
########
        
    , 100 );
    
    ##
    AddIsWellDefinedForMorphisms( cat,
        
########
function ( cat_1, alpha_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1;
    deduped_6_1 := UnderlyingCell( alpha_1 );
    deduped_5_1 := UnderlyingMatrix( deduped_6_1 );
    deduped_4_1 := UnderlyingMorphism( Target( alpha_1 ) );
    deduped_3_1 := UnderlyingMorphism( Source( alpha_1 ) );
    deduped_2_1 := RankOfObject( Target( deduped_6_1 ) );
    deduped_1_1 := RankOfObject( Source( deduped_6_1 ) );
    return RankOfObject( Source( deduped_3_1 ) ) = deduped_1_1 and RankOfObject( Source( deduped_4_1 ) ) = deduped_2_1 and CAP_JIT_EXPR_CASE_WRAPPER( function (  )
                  if not IsHomalgMatrix( deduped_5_1 ) then
                      return false;
                  elif not NumberRows( deduped_5_1 ) = deduped_1_1 then
                      return false;
                  elif not NumberColumns( deduped_5_1 ) = deduped_2_1 then
                      return false;
                  else
                      return true;
                  fi;
                  return;
              end )(  ) and UnderlyingMatrix( deduped_3_1 ) = deduped_5_1 * UnderlyingMatrix( deduped_4_1 );
end
########
        
    , 500 );
    
    ##
    AddIsWellDefinedForObjects( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := UnderlyingMorphism( arg2_1 );
    deduped_2_1 := UnderlyingMatrix( deduped_3_1 );
    deduped_1_1 := RankOfObject( Target( deduped_3_1 ) );
    return deduped_1_1 = RankOfObject( BaseObject( cat_1 ) ) and CAP_JIT_EXPR_CASE_WRAPPER( function (  )
                if not IsHomalgMatrix( deduped_2_1 ) then
                    return false;
                elif not NumberRows( deduped_2_1 ) = RankOfObject( Source( deduped_3_1 ) ) then
                    return false;
                elif not NumberColumns( deduped_2_1 ) = deduped_1_1 then
                    return false;
                else
                    return true;
                fi;
                return;
            end )(  );
end
########
        
    , 200 );
    
    ##
    AddLift( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := UnderlyingCell( beta_1 );
    deduped_1_1 := UnderlyingCell( alpha_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), Source( beta_1 ), UnderlyingCell, CreateCapCategoryMorphismWithAttributes( AmbientCategory( cat_1 ), Source( deduped_1_1 ), Source( deduped_2_1 ), UnderlyingMatrix, SafeRightDivide( UnderlyingMatrix( deduped_1_1 ), UnderlyingMatrix( deduped_2_1 ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddLiftAlongMonomorphism( cat,
        
########
function ( cat_1, iota_1, tau_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := UnderlyingCell( iota_1 );
    deduped_1_1 := UnderlyingCell( tau_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( tau_1 ), Source( iota_1 ), UnderlyingCell, CreateCapCategoryMorphismWithAttributes( AmbientCategory( cat_1 ), Source( deduped_1_1 ), Source( deduped_2_1 ), UnderlyingMatrix, UniqueRightDivide( UnderlyingMatrix( deduped_1_1 ), UnderlyingMatrix( deduped_2_1 ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismConstructor( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg4_1, UnderlyingCell, arg3_1 );
end
########
        
    , 100 );
    
    ##
    AddMorphismDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return UnderlyingCell( arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddObjectConstructor( cat,
        
########
function ( cat_1, arg2_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, UnderlyingMorphism, arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddObjectDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return UnderlyingMorphism( arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddPostCompose( cat,
        
########
function ( cat_1, beta_1, alpha_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := UnderlyingCell( beta_1 );
    deduped_1_1 := UnderlyingCell( alpha_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), Range( beta_1 ), UnderlyingCell, CreateCapCategoryMorphismWithAttributes( AmbientCategory( cat_1 ), Source( deduped_1_1 ), Range( deduped_2_1 ), UnderlyingMatrix, UnderlyingMatrix( deduped_1_1 ) * UnderlyingMatrix( deduped_2_1 ) ) );
end
########
        
    , 101 );
    
    ##
    AddPreCompose( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := UnderlyingCell( beta_1 );
    deduped_1_1 := UnderlyingCell( alpha_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), Range( beta_1 ), UnderlyingCell, CreateCapCategoryMorphismWithAttributes( AmbientCategory( cat_1 ), Source( deduped_1_1 ), Range( deduped_2_1 ), UnderlyingMatrix, UnderlyingMatrix( deduped_1_1 ) * UnderlyingMatrix( deduped_2_1 ) ) );
end
########
        
    , 100 );
    
    ##
    AddProjectionInFactorOfDirectProductWithGivenDirectProduct( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1;
    deduped_12_1 := Length( objects_1 );
    deduped_11_1 := AmbientCategory( cat_1 );
    deduped_10_1 := objects_1[k_1];
    deduped_9_1 := UnderlyingRing( deduped_11_1 );
    deduped_8_1 := List( objects_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( UnderlyingMorphism( logic_new_func_x_2 ) ) );
        end );
    deduped_7_1 := Sum( deduped_8_1 );
    deduped_6_1 := Sum( deduped_8_1{[ 1 .. k_1 - 1 ]} );
    deduped_5_1 := List( [ 1 .. deduped_12_1 ], function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_8_1[i_2];
            return UnionOfRows( deduped_9_1, deduped_1_2, [ HomalgZeroMatrix( Sum( deduped_8_1{[ 1 .. (i_2 - 1) ]} ), deduped_1_2, deduped_9_1 ), HomalgIdentityMatrix( deduped_1_2, deduped_9_1 ), HomalgZeroMatrix( Sum( deduped_8_1{[ (i_2 + 1) .. deduped_12_1 ]} ), deduped_1_2, deduped_9_1 ) ] ) * CAP_JIT_INCOMPLETE_LOGIC( UnderlyingMatrix( UnderlyingMorphism( CAP_JIT_INCOMPLETE_LOGIC( objects_1[i_2] ) ) ) );
        end );
    deduped_4_1 := CertainColumns( SyzygiesOfRows( UnionOfColumns( deduped_9_1, deduped_7_1, deduped_5_1{[ 1 .. deduped_12_1 - 1 ]} ) + (- UnionOfColumns( deduped_9_1, deduped_7_1, deduped_5_1{[ 2 .. deduped_12_1 ]} )) ), [ deduped_6_1 + 1 .. deduped_6_1 + deduped_8_1[k_1] ] );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, deduped_10_1, UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_11_1, CreateCapCategoryObjectWithAttributes( deduped_11_1, RankOfObject, NumberRows( deduped_4_1 ) ), CAP_JIT_INCOMPLETE_LOGIC( Source( UnderlyingMorphism( CAP_JIT_INCOMPLETE_LOGIC( deduped_10_1 ) ) ) ), UnderlyingMatrix, deduped_4_1 ) );
end
########
        
    , 9062 );
    
    ##
    cat!.cached_precompiled_functions.ProjectionInFactorOfDirectProductWithGivenDirectProduct :=
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1;
    deduped_12_1 := Length( objects_1 );
    deduped_11_1 := AmbientCategory( cat_1 );
    deduped_10_1 := UnderlyingRing( deduped_11_1 );
    deduped_9_1 := List( objects_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( UnderlyingMorphism( logic_new_func_x_2 ) ) );
        end );
    deduped_8_1 := Sum( deduped_9_1 );
    deduped_7_1 := Sum( deduped_9_1{[ 1 .. k_1 - 1 ]} );
    hoisted_4_1 := List( objects_1, function ( logic_new_func_x_2 )
            return UnderlyingMatrix( UnderlyingMorphism( logic_new_func_x_2 ) );
        end );
    deduped_6_1 := List( [ 1 .. deduped_12_1 ], function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_9_1[i_2];
            return UnionOfRows( deduped_10_1, deduped_1_2, [ HomalgZeroMatrix( Sum( deduped_9_1{[ 1 .. (i_2 - 1) ]} ), deduped_1_2, deduped_10_1 ), HomalgIdentityMatrix( deduped_1_2, deduped_10_1 ), HomalgZeroMatrix( Sum( deduped_9_1{[ (i_2 + 1) .. deduped_12_1 ]} ), deduped_1_2, deduped_10_1 ) ] ) * hoisted_4_1[i_2];
        end );
    deduped_5_1 := UnionOfColumns( deduped_10_1, deduped_8_1, deduped_6_1{[ 1 .. deduped_12_1 - 1 ]} ) + (- UnionOfColumns( deduped_10_1, deduped_8_1, deduped_6_1{[ 2 .. deduped_12_1 ]} ));
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, objects_1[k_1], UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_11_1, CreateCapCategoryObjectWithAttributes( deduped_11_1, RankOfObject, deduped_8_1 - RowRankOfMatrix( deduped_5_1 ) ), List( objects_1, function ( logic_new_func_x_2 )
                  return Source( UnderlyingMorphism( logic_new_func_x_2 ) );
              end )[k_1], UnderlyingMatrix, CertainColumns( SyzygiesOfRows( deduped_5_1 ), [ deduped_7_1 + 1 .. deduped_7_1 + deduped_9_1[k_1] ] ) ) );
end
########
        
    ;
    
    ##
    AddProjectionOntoCoequalizer( cat,
        
########
function ( cat_1, Y_1, morphisms_1 )
    local morphism_attr_1_1, morphism_attr_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1;
    deduped_10_1 := Length( morphisms_1 );
    deduped_9_1 := UnderlyingMorphism( Y_1 );
    deduped_8_1 := AmbientCategory( cat_1 );
    deduped_7_1 := UnderlyingRing( deduped_8_1 );
    deduped_6_1 := Source( deduped_9_1 );
    deduped_5_1 := RankOfObject( deduped_6_1 );
    deduped_4_1 := List( morphisms_1, function ( logic_new_func_x_2 )
            return UnderlyingMatrix( UnderlyingCell( logic_new_func_x_2 ) );
        end );
    deduped_3_1 := SyzygiesOfColumns( UnionOfRows( deduped_7_1, deduped_5_1, deduped_4_1{[ 1 .. deduped_10_1 - 1 ]} ) + (- UnionOfRows( deduped_7_1, deduped_5_1, deduped_4_1{[ 2 .. deduped_10_1 ]} )) );
    morphism_attr_2_1 := deduped_3_1;
    morphism_attr_1_1 := UniqueLeftDivide( deduped_3_1, UnderlyingMatrix( deduped_9_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Y_1, CreateCapCategoryObjectWithAttributes( cat_1, UnderlyingMorphism, CreateCapCategoryMorphismWithAttributes( deduped_8_1, CreateCapCategoryObjectWithAttributes( deduped_8_1, RankOfObject, NumberRows( morphism_attr_1_1 ) ), Range( deduped_9_1 ), UnderlyingMatrix, morphism_attr_1_1 ) ), UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_8_1, deduped_6_1, CreateCapCategoryObjectWithAttributes( deduped_8_1, RankOfObject, NumberColumns( morphism_attr_2_1 ) ), UnderlyingMatrix, morphism_attr_2_1 ) );
end
########
        
    , 2923 );
    
    ##
    cat!.cached_precompiled_functions.ProjectionOntoCoequalizer :=
        
########
function ( cat_1, Y_1, morphisms_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1;
    deduped_10_1 := Length( morphisms_1 );
    deduped_9_1 := UnderlyingMorphism( Y_1 );
    deduped_8_1 := AmbientCategory( cat_1 );
    deduped_7_1 := UnderlyingRing( deduped_8_1 );
    deduped_6_1 := Source( deduped_9_1 );
    deduped_5_1 := RankOfObject( deduped_6_1 );
    deduped_4_1 := List( morphisms_1, function ( logic_new_func_x_2 )
            return UnderlyingMatrix( UnderlyingCell( logic_new_func_x_2 ) );
        end );
    deduped_3_1 := UnionOfRows( deduped_7_1, deduped_5_1, deduped_4_1{[ 1 .. deduped_10_1 - 1 ]} ) + (- UnionOfRows( deduped_7_1, deduped_5_1, deduped_4_1{[ 2 .. deduped_10_1 ]} ));
    deduped_2_1 := SyzygiesOfColumns( deduped_3_1 );
    deduped_1_1 := CreateCapCategoryObjectWithAttributes( deduped_8_1, RankOfObject, deduped_5_1 - RowRankOfMatrix( deduped_3_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Y_1, CreateCapCategoryObjectWithAttributes( cat_1, UnderlyingMorphism, CreateCapCategoryMorphismWithAttributes( deduped_8_1, deduped_1_1, Range( deduped_9_1 ), UnderlyingMatrix, UniqueLeftDivide( deduped_2_1, UnderlyingMatrix( deduped_9_1 ) ) ) ), UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_8_1, deduped_6_1, deduped_1_1, UnderlyingMatrix, deduped_2_1 ) );
end
########
        
    ;
    
    ##
    AddTerminalObject( cat,
        
########
function ( cat_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := BaseObject( cat_1 );
    deduped_1_1 := AmbientCategory( cat_1 );
    return CreateCapCategoryObjectWithAttributes( cat_1, UnderlyingMorphism, CreateCapCategoryMorphismWithAttributes( deduped_1_1, deduped_2_1, deduped_2_1, UnderlyingMatrix, HomalgIdentityMatrix( RankOfObject( deduped_2_1 ), UnderlyingRing( deduped_1_1 ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( cat,
        
########
function ( cat_1, Y_1, morphisms_1, T_1, tau_1, P_1 )
    local morphism_attr_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := Length( morphisms_1 );
    deduped_6_1 := UnderlyingCell( tau_1 );
    deduped_5_1 := AmbientCategory( cat_1 );
    deduped_4_1 := UnderlyingRing( deduped_5_1 );
    deduped_3_1 := RankOfObject( Source( UnderlyingMorphism( Y_1 ) ) );
    deduped_2_1 := List( morphisms_1, function ( logic_new_func_x_2 )
            return UnderlyingMatrix( UnderlyingCell( logic_new_func_x_2 ) );
        end );
    morphism_attr_1_1 := UniqueLeftDivide( SyzygiesOfColumns( UnionOfRows( deduped_4_1, deduped_3_1, deduped_2_1{[ 1 .. deduped_7_1 - 1 ]} ) + (- UnionOfRows( deduped_4_1, deduped_3_1, deduped_2_1{[ 2 .. deduped_7_1 ]} )) ), UnderlyingMatrix( deduped_6_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_5_1, CreateCapCategoryObjectWithAttributes( deduped_5_1, RankOfObject, NumberRows( morphism_attr_1_1 ) ), Range( deduped_6_1 ), UnderlyingMatrix, morphism_attr_1_1 ) );
end
########
        
    , 2925 );
    
    ##
    cat!.cached_precompiled_functions.UniversalMorphismFromCoequalizerWithGivenCoequalizer :=
        
########
function ( cat_1, Y_1, morphisms_1, T_1, tau_1, P_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := UnderlyingCell( tau_1 );
    deduped_6_1 := Length( morphisms_1 );
    deduped_5_1 := AmbientCategory( cat_1 );
    deduped_4_1 := UnderlyingRing( deduped_5_1 );
    deduped_3_1 := RankOfObject( Source( UnderlyingMorphism( Y_1 ) ) );
    deduped_2_1 := List( morphisms_1, function ( logic_new_func_x_2 )
            return UnderlyingMatrix( UnderlyingCell( logic_new_func_x_2 ) );
        end );
    deduped_1_1 := UnionOfRows( deduped_4_1, deduped_3_1, deduped_2_1{[ 1 .. deduped_6_1 - 1 ]} ) + (- UnionOfRows( deduped_4_1, deduped_3_1, deduped_2_1{[ 2 .. deduped_6_1 ]} ));
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_5_1, CreateCapCategoryObjectWithAttributes( deduped_5_1, RankOfObject, deduped_3_1 - RowRankOfMatrix( deduped_1_1 ) ), Range( deduped_7_1 ), UnderlyingMatrix, UniqueLeftDivide( SyzygiesOfColumns( deduped_1_1 ), UnderlyingMatrix( deduped_7_1 ) ) ) );
end
########
        
    ;
    
    ##
    AddUniversalMorphismFromCoproductWithGivenCoproduct( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local morphism_attr_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := AmbientCategory( cat_1 );
    deduped_2_1 := Source( UnderlyingMorphism( T_1 ) );
    morphism_attr_1_1 := UnionOfRows( UnderlyingRing( deduped_3_1 ), RankOfObject( deduped_2_1 ), List( tau_1, function ( logic_new_func_x_2 )
              return UnderlyingMatrix( UnderlyingCell( logic_new_func_x_2 ) );
          end ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_3_1, CreateCapCategoryObjectWithAttributes( deduped_3_1, RankOfObject, NumberRows( morphism_attr_1_1 ) ), deduped_2_1, UnderlyingMatrix, morphism_attr_1_1 ) );
end
########
        
    , 505 );
    
    ##
    cat!.cached_precompiled_functions.UniversalMorphismFromCoproductWithGivenCoproduct :=
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := AmbientCategory( cat_1 );
    deduped_1_1 := Source( UnderlyingMorphism( T_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_2_1, CreateCapCategoryObjectWithAttributes( deduped_2_1, RankOfObject, Sum( List( objects_1, function ( Li_2 )
                    return RankOfObject( Source( UnderlyingMorphism( Li_2 ) ) );
                end ) ) ), deduped_1_1, UnderlyingMatrix, UnionOfRows( UnderlyingRing( deduped_2_1 ), RankOfObject( deduped_1_1 ), List( tau_1, function ( logic_new_func_x_2 )
                  return UnderlyingMatrix( UnderlyingCell( logic_new_func_x_2 ) );
              end ) ) ) );
end
########
        
    ;
    
    ##
    AddUniversalMorphismFromInitialObjectWithGivenInitialObject( cat,
        
########
function ( cat_1, T_1, P_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := AmbientCategory( cat_1 );
    deduped_2_1 := Source( UnderlyingMorphism( T_1 ) );
    deduped_1_1 := Source( UnderlyingMorphism( P_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_3_1, deduped_1_1, deduped_2_1, UnderlyingMatrix, HomalgZeroMatrix( RankOfObject( deduped_1_1 ), RankOfObject( deduped_2_1 ), UnderlyingRing( deduped_3_1 ) ) ) );
end
########
        
    , 101 );
    
    ##
    AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1;
    deduped_11_1 := Length( objects_1 );
    deduped_10_1 := AmbientCategory( cat_1 );
    deduped_9_1 := UnderlyingRing( deduped_10_1 );
    deduped_8_1 := Source( UnderlyingMorphism( T_1 ) );
    deduped_7_1 := List( objects_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( UnderlyingMorphism( logic_new_func_x_2 ) ) );
        end );
    deduped_6_1 := Sum( deduped_7_1 );
    deduped_5_1 := List( [ 1 .. deduped_11_1 ], function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_7_1[i_2];
            return UnionOfRows( deduped_9_1, deduped_1_2, [ HomalgZeroMatrix( Sum( deduped_7_1{[ 1 .. (i_2 - 1) ]} ), deduped_1_2, deduped_9_1 ), HomalgIdentityMatrix( deduped_1_2, deduped_9_1 ), HomalgZeroMatrix( Sum( deduped_7_1{[ (i_2 + 1) .. deduped_11_1 ]} ), deduped_1_2, deduped_9_1 ) ] ) * CAP_JIT_INCOMPLETE_LOGIC( UnderlyingMatrix( UnderlyingMorphism( CAP_JIT_INCOMPLETE_LOGIC( objects_1[i_2] ) ) ) );
        end );
    deduped_4_1 := UniqueRightDivide( UnionOfColumns( deduped_9_1, RankOfObject( deduped_8_1 ), List( tau_1, function ( logic_new_func_x_2 )
                return UnderlyingMatrix( UnderlyingCell( logic_new_func_x_2 ) );
            end ) ), SyzygiesOfRows( UnionOfColumns( deduped_9_1, deduped_6_1, deduped_5_1{[ 1 .. deduped_11_1 - 1 ]} ) + (- UnionOfColumns( deduped_9_1, deduped_6_1, deduped_5_1{[ 2 .. deduped_11_1 ]} )) ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_10_1, deduped_8_1, CreateCapCategoryObjectWithAttributes( deduped_10_1, RankOfObject, NumberColumns( deduped_4_1 ) ), UnderlyingMatrix, deduped_4_1 ) );
end
########
        
    , 9264 );
    
    ##
    cat!.cached_precompiled_functions.UniversalMorphismIntoDirectProductWithGivenDirectProduct :=
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1, deduped_12_1;
    deduped_12_1 := Length( objects_1 );
    deduped_11_1 := AmbientCategory( cat_1 );
    deduped_10_1 := UnderlyingRing( deduped_11_1 );
    deduped_9_1 := Source( UnderlyingMorphism( T_1 ) );
    deduped_8_1 := List( objects_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( UnderlyingMorphism( logic_new_func_x_2 ) ) );
        end );
    deduped_7_1 := Sum( deduped_8_1 );
    hoisted_4_1 := List( objects_1, function ( logic_new_func_x_2 )
            return UnderlyingMatrix( UnderlyingMorphism( logic_new_func_x_2 ) );
        end );
    deduped_6_1 := List( [ 1 .. deduped_12_1 ], function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := deduped_8_1[i_2];
            return UnionOfRows( deduped_10_1, deduped_1_2, [ HomalgZeroMatrix( Sum( deduped_8_1{[ 1 .. (i_2 - 1) ]} ), deduped_1_2, deduped_10_1 ), HomalgIdentityMatrix( deduped_1_2, deduped_10_1 ), HomalgZeroMatrix( Sum( deduped_8_1{[ (i_2 + 1) .. deduped_12_1 ]} ), deduped_1_2, deduped_10_1 ) ] ) * hoisted_4_1[i_2];
        end );
    deduped_5_1 := UnionOfColumns( deduped_10_1, deduped_7_1, deduped_6_1{[ 1 .. deduped_12_1 - 1 ]} ) + (- UnionOfColumns( deduped_10_1, deduped_7_1, deduped_6_1{[ 2 .. deduped_12_1 ]} ));
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_11_1, deduped_9_1, CreateCapCategoryObjectWithAttributes( deduped_11_1, RankOfObject, deduped_7_1 - RowRankOfMatrix( deduped_5_1 ) ), UnderlyingMatrix, UniqueRightDivide( UnionOfColumns( deduped_10_1, RankOfObject( deduped_9_1 ), List( tau_1, function ( logic_new_func_x_2 )
                    return UnderlyingMatrix( UnderlyingCell( logic_new_func_x_2 ) );
                end ) ), SyzygiesOfRows( deduped_5_1 ) ) ) );
end
########
        
    ;
    
    ##
    AddUniversalMorphismIntoEqualizerWithGivenEqualizer( cat,
        
########
function ( cat_1, Y_1, morphisms_1, T_1, tau_1, P_1 )
    local morphism_attr_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := Length( morphisms_1 );
    deduped_6_1 := UnderlyingCell( tau_1 );
    deduped_5_1 := AmbientCategory( cat_1 );
    deduped_4_1 := UnderlyingRing( deduped_5_1 );
    deduped_3_1 := RankOfObject( Source( UnderlyingMorphism( Y_1 ) ) );
    deduped_2_1 := List( morphisms_1, function ( logic_new_func_x_2 )
            return UnderlyingMatrix( UnderlyingCell( logic_new_func_x_2 ) );
        end );
    morphism_attr_1_1 := UniqueRightDivide( UnderlyingMatrix( deduped_6_1 ), SyzygiesOfRows( UnionOfColumns( deduped_4_1, deduped_3_1, deduped_2_1{[ 1 .. deduped_7_1 - 1 ]} ) + (- UnionOfColumns( deduped_4_1, deduped_3_1, deduped_2_1{[ 2 .. deduped_7_1 ]} )) ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_5_1, Source( deduped_6_1 ), CreateCapCategoryObjectWithAttributes( deduped_5_1, RankOfObject, NumberColumns( morphism_attr_1_1 ) ), UnderlyingMatrix, morphism_attr_1_1 ) );
end
########
        
    , 2920 );
    
    ##
    cat!.cached_precompiled_functions.UniversalMorphismIntoEqualizerWithGivenEqualizer :=
        
########
function ( cat_1, Y_1, morphisms_1, T_1, tau_1, P_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := Length( morphisms_1 );
    deduped_6_1 := UnderlyingCell( tau_1 );
    deduped_5_1 := AmbientCategory( cat_1 );
    deduped_4_1 := UnderlyingRing( deduped_5_1 );
    deduped_3_1 := RankOfObject( Source( UnderlyingMorphism( Y_1 ) ) );
    deduped_2_1 := List( morphisms_1, function ( logic_new_func_x_2 )
            return UnderlyingMatrix( UnderlyingCell( logic_new_func_x_2 ) );
        end );
    deduped_1_1 := UnionOfColumns( deduped_4_1, deduped_3_1, deduped_2_1{[ 1 .. deduped_7_1 - 1 ]} ) + (- UnionOfColumns( deduped_4_1, deduped_3_1, deduped_2_1{[ 2 .. deduped_7_1 ]} ));
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_5_1, Source( deduped_6_1 ), CreateCapCategoryObjectWithAttributes( deduped_5_1, RankOfObject, deduped_3_1 - RowRankOfMatrix( deduped_1_1 ) ), UnderlyingMatrix, UniqueRightDivide( UnderlyingMatrix( deduped_6_1 ), SyzygiesOfRows( deduped_1_1 ) ) ) );
end
########
        
    ;
    
    ##
    AddUniversalMorphismIntoTerminalObject( cat,
        
########
function ( cat_1, T_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := BaseObject( cat_1 );
    deduped_1_1 := AmbientCategory( cat_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, CreateCapCategoryObjectWithAttributes( cat_1, UnderlyingMorphism, CreateCapCategoryMorphismWithAttributes( deduped_1_1, deduped_2_1, deduped_2_1, UnderlyingMatrix, HomalgIdentityMatrix( RankOfObject( deduped_2_1 ), UnderlyingRing( deduped_1_1 ) ) ) ), UnderlyingCell, UnderlyingMorphism( T_1 ) );
end
########
        
    , 100 );
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
end );

BindGlobal( "SliceCategoryOfCategoryOfRowsOfRingOfIntegersOverTensorUnitPrecompiled", function ( ring )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function ( ring )
    return SliceCategory( TensorUnit( CategoryOfRows( ring : FinalizeCategory := true ) ) );
end;
        
        
    
    cat := category_constructor( ring : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_SliceCategoryOfCategoryOfRowsOfRingOfIntegersOverTensorUnitPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
