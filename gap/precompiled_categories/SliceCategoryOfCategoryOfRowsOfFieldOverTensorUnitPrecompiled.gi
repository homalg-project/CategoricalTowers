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
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( a_1 ), Range( a_1 ), UnderlyingCell, CreateCapCategoryMorphismWithAttributes( AmbientCategory( cat_1 ), Source( deduped_1_1 ), Range( deduped_2_1 ), UnderlyingMatrix, UnderlyingMatrix( deduped_1_1 ) + UnderlyingMatrix( deduped_2_1 ) ) );
end
########
        
    , 100 );
    
    ##
    AddAdditiveInverseForMorphisms( cat,
        
########
function ( cat_1, a_1 )
    local deduped_1_1;
    deduped_1_1 := UnderlyingCell( a_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( a_1 ), Range( a_1 ), UnderlyingCell, CreateCapCategoryMorphismWithAttributes( AmbientCategory( cat_1 ), Source( deduped_1_1 ), Range( deduped_1_1 ), UnderlyingMatrix, - UnderlyingMatrix( deduped_1_1 ) ) );
end
########
        
    , 100 );
    
    ##
    AddColiftAlongEpimorphism( cat,
        
########
function ( cat_1, epsilon_1, tau_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := UnderlyingCell( tau_1 );
    deduped_1_1 := UnderlyingCell( epsilon_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Range( epsilon_1 ), Range( tau_1 ), UnderlyingCell, CreateCapCategoryMorphismWithAttributes( AmbientCategory( cat_1 ), Range( deduped_1_1 ), Range( deduped_2_1 ), UnderlyingMatrix, LeftDivide( UnderlyingMatrix( deduped_1_1 ), UnderlyingMatrix( deduped_2_1 ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddCoproduct( cat,
        
########
function ( cat_1, arg2_1 )
    local morphism_attr_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := BaseObject( cat_1 );
    deduped_2_1 := AmbientCategory( cat_1 );
    morphism_attr_1_1 := UnionOfRows( UnderlyingRing( deduped_2_1 ), RankOfObject( deduped_3_1 ), List( arg2_1, function ( logic_new_func_x_2 )
              return UnderlyingMatrix( UnderlyingMorphism( logic_new_func_x_2 ) );
          end ) );
    return CreateCapCategoryObjectWithAttributes( cat_1, UnderlyingMorphism, CreateCapCategoryMorphismWithAttributes( deduped_2_1, CreateCapCategoryObjectWithAttributes( deduped_2_1, RankOfObject, NumberRows( morphism_attr_1_1 ) ), deduped_3_1, UnderlyingMatrix, morphism_attr_1_1 ) );
end
########
        
    , 100 );
    
    ##
    AddDirectProduct( cat,
        
########
function ( cat_1, arg2_1 )
    local morphism_attr_1_1, deduped_2_1;
    deduped_2_1 := AmbientCategory( cat_1 );
    morphism_attr_1_1 := Iterated( List( arg2_1, function ( logic_new_func_x_2 )
              return UnderlyingMatrix( UnderlyingMorphism( logic_new_func_x_2 ) );
          end ), function ( I_2, J_2 )
            return ReducedSyzygiesOfRows( I_2, J_2 ) * I_2;
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, UnderlyingMorphism, CreateCapCategoryMorphismWithAttributes( deduped_2_1, CreateCapCategoryObjectWithAttributes( deduped_2_1, RankOfObject, NumberRows( morphism_attr_1_1 ) ), CreateCapCategoryObjectWithAttributes( deduped_2_1, RankOfObject, NumberColumns( morphism_attr_1_1 ) ), UnderlyingMatrix, morphism_attr_1_1 ) );
end
########
        
    , 100 );
    
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
    AddInitialObject( cat,
        
########
function ( cat_1 )
    local morphism_attr_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := BaseObject( cat_1 );
    deduped_2_1 := AmbientCategory( cat_1 );
    morphism_attr_1_1 := HomalgZeroMatrix( 0, RankOfObject( deduped_3_1 ), UnderlyingRing( deduped_2_1 ) );
    return CreateCapCategoryObjectWithAttributes( cat_1, UnderlyingMorphism, CreateCapCategoryMorphismWithAttributes( deduped_2_1, CreateCapCategoryObjectWithAttributes( deduped_2_1, RankOfObject, 0 ), deduped_3_1, UnderlyingMatrix, morphism_attr_1_1 ) );
end
########
        
    , 100 );
    
    ##
    AddInjectionOfCofactorOfCoproductWithGivenCoproduct( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1;
    deduped_10_1 := AmbientCategory( cat_1 );
    deduped_9_1 := objects_1[k_1];
    deduped_8_1 := UnderlyingRing( deduped_10_1 );
    deduped_7_1 := List( objects_1, function ( logic_new_func_x_2 )
            return RankOfObject( Source( UnderlyingMorphism( logic_new_func_x_2 ) ) );
        end );
    deduped_6_1 := deduped_7_1[k_1];
    hoisted_4_1 := deduped_8_1;
    hoisted_3_1 := deduped_6_1;
    hoisted_2_1 := deduped_7_1;
    hoisted_1_1 := HomalgIdentityMatrix( deduped_6_1, deduped_8_1 );
    deduped_5_1 := UnionOfColumns( deduped_8_1, deduped_6_1, List( [ 1 .. Length( objects_1 ) ], function ( logic_new_func_x_2 )
                if (logic_new_func_x_2 = k_1) then
                    return hoisted_1_1;
                else
                    return HomalgZeroMatrix( hoisted_3_1, hoisted_2_1[logic_new_func_x_2], hoisted_4_1 );
                fi;
                return;
            end ) ) * HomalgIdentityMatrix( Sum( deduped_7_1 ), deduped_8_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_9_1, P_1, UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_10_1, Source( UnderlyingMorphism( CAP_JIT_INCOMPLETE_LOGIC( deduped_9_1 ) ) ), CreateCapCategoryObjectWithAttributes( deduped_10_1, RankOfObject, NumberColumns( deduped_5_1 ) ), UnderlyingMatrix, deduped_5_1 ) );
end
########
        
    , 100 );
    
    ##
    AddInverseForMorphisms( cat,
        
########
function ( cat_1, alpha_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := UnderlyingCell( alpha_1 );
    deduped_2_1 := AmbientCategory( cat_1 );
    deduped_1_1 := Range( deduped_3_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Range( alpha_1 ), Source( alpha_1 ), UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_2_1, deduped_1_1, Source( deduped_3_1 ), UnderlyingMatrix, RightDivide( HomalgIdentityMatrix( RankOfObject( deduped_1_1 ), UnderlyingRing( deduped_2_1 ) ), UnderlyingMatrix( deduped_3_1 ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddIsAutomorphism( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_3_1, deduped_4_1, deduped_5_1, deduped_6_1;
    deduped_6_1 := UnderlyingCell( arg2_1 );
    deduped_5_1 := RowRankOfMatrix( UnderlyingMatrix( deduped_6_1 ) );
    deduped_4_1 := RankOfObject( Range( deduped_6_1 ) );
    deduped_3_1 := RankOfObject( Source( deduped_6_1 ) );
    return deduped_3_1 = deduped_4_1 and (deduped_3_1 - deduped_5_1 = 0 and deduped_4_1 - deduped_5_1 = 0);
end
########
        
    , 100 );
    
    ##
    AddIsColiftableAlongEpimorphism( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return IsZero( DecideZeroColumns( UnderlyingMatrix( UnderlyingCell( arg3_1 ) ), UnderlyingMatrix( UnderlyingCell( arg2_1 ) ) ) );
end
########
        
    , 100 );
    
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
        
    , 100 );
    
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
        
    , 100 );
    
    ##
    AddIsIsomorphism( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_3_1, deduped_4_1;
    deduped_4_1 := UnderlyingCell( arg2_1 );
    deduped_3_1 := RowRankOfMatrix( UnderlyingMatrix( deduped_4_1 ) );
    return RankOfObject( Source( deduped_4_1 ) ) - deduped_3_1 = 0 and RankOfObject( Range( deduped_4_1 ) ) - deduped_3_1 = 0;
end
########
        
    , 100 );
    
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
        
    , 100 );
    
    ##
    AddIsOne( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_3_1;
    deduped_3_1 := UnderlyingCell( arg2_1 );
    return HomalgIdentityMatrix( RankOfObject( Source( deduped_3_1 ) ), UnderlyingRing( AmbientCategory( cat_1 ) ) ) = UnderlyingMatrix( deduped_3_1 );
end
########
        
    , 100 );
    
    ##
    AddIsSplitEpimorphism( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_3_1;
    deduped_3_1 := UnderlyingCell( arg2_1 );
    return IsZero( DecideZeroRows( HomalgIdentityMatrix( RankOfObject( Range( deduped_3_1 ) ), UnderlyingRing( AmbientCategory( cat_1 ) ) ), UnderlyingMatrix( deduped_3_1 ) ) );
end
########
        
    , 100 );
    
    ##
    AddIsTerminal( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := UnderlyingMorphism( arg2_1 );
    deduped_1_1 := RowRankOfMatrix( UnderlyingMatrix( deduped_2_1 ) );
    return RankOfObject( Source( deduped_2_1 ) ) - deduped_1_1 = 0 and RankOfObject( Range( deduped_2_1 ) ) - deduped_1_1 = 0;
end
########
        
    , 100 );
    
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
function ( cat_1, arg2_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := UnderlyingCell( arg2_1 );
    deduped_2_1 := UnderlyingMorphism( Range( arg2_1 ) );
    deduped_1_1 := UnderlyingMorphism( Source( arg2_1 ) );
    return RankOfObject( Source( deduped_1_1 ) ) = RankOfObject( Source( deduped_3_1 ) ) and RankOfObject( Source( deduped_2_1 ) ) = RankOfObject( Range( deduped_3_1 ) ) and UnderlyingMatrix( deduped_1_1 ) = UnderlyingMatrix( deduped_3_1 ) * UnderlyingMatrix( deduped_2_1 );
end
########
        
    , 100 );
    
    ##
    AddIsWellDefinedForObjects( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := UnderlyingMorphism( arg2_1 );
    deduped_2_1 := UnderlyingMatrix( deduped_3_1 );
    deduped_1_1 := RankOfObject( Range( deduped_3_1 ) );
    return deduped_1_1 = RankOfObject( BaseObject( cat_1 ) ) and function (  )
              if NumberRows( deduped_2_1 ) <> RankOfObject( Source( deduped_3_1 ) ) then
                  return false;
              elif NumberColumns( deduped_2_1 ) <> deduped_1_1 then
                  return false;
              else
                  return true;
              fi;
              return;
          end(  );
end
########
        
    , 100 );
    
    ##
    AddLift( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := UnderlyingCell( beta_1 );
    deduped_1_1 := UnderlyingCell( alpha_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), Source( beta_1 ), UnderlyingCell, CreateCapCategoryMorphismWithAttributes( AmbientCategory( cat_1 ), Source( deduped_1_1 ), Source( deduped_2_1 ), UnderlyingMatrix, RightDivide( UnderlyingMatrix( deduped_1_1 ), UnderlyingMatrix( deduped_2_1 ) ) ) );
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
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( tau_1 ), Source( iota_1 ), UnderlyingCell, CreateCapCategoryMorphismWithAttributes( AmbientCategory( cat_1 ), Source( deduped_1_1 ), Source( deduped_2_1 ), UnderlyingMatrix, RightDivide( UnderlyingMatrix( deduped_1_1 ), UnderlyingMatrix( deduped_2_1 ) ) ) );
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
        
    , 100 );
    
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
    AddSubtractionForMorphisms( cat,
        
########
function ( cat_1, a_1, b_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := UnderlyingCell( b_1 );
    deduped_1_1 := UnderlyingCell( a_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( a_1 ), Range( a_1 ), UnderlyingCell, CreateCapCategoryMorphismWithAttributes( AmbientCategory( cat_1 ), Source( deduped_1_1 ), Range( deduped_2_1 ), UnderlyingMatrix, UnderlyingMatrix( deduped_1_1 ) + (- UnderlyingMatrix( deduped_2_1 )) ) );
end
########
        
    , 100 );
    
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
    AddUniversalMorphismFromCoproductWithGivenCoproduct( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local morphism_attr_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := AmbientCategory( cat_1 );
    deduped_2_1 := Source( UnderlyingMorphism( T_1 ) );
    morphism_attr_1_1 := UnionOfRows( UnderlyingRing( deduped_3_1 ), RankOfObject( deduped_2_1 ), List( tau_1, function ( logic_new_func_x_2 )
              return UnderlyingMatrix( UnderlyingCell( logic_new_func_x_2 ) );
          end ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, UnderlyingCell, CreateCapCategoryMorphismWithAttributes( deduped_3_1, CreateCapCategoryObjectWithAttributes( deduped_3_1, RankOfObject, NumberRows( morphism_attr_1_1 ) ), deduped_2_1, UnderlyingMatrix, morphism_attr_1_1 ) );
end
########
        
    , 100 );
    
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
        
    , 100 );
    
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
