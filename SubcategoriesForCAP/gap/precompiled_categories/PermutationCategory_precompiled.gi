# SPDX-License-Identifier: GPL-2.0-or-later
# SubcategoriesForCAP: Subcategory and other related constructors for CAP categories
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_PermutationCategory_precompiled", function ( cat )
    
    ##
    AddCoproduct( cat,
        
########
function ( cat_1, objects_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, Sum( List( objects_1, Cardinality ) ) );
end
########
        
    , 100 );
    
    ##
    AddCoproductFunctorialWithGivenCoproducts( cat,
        
########
function ( cat_1, P_1, objects_1, L_1, objectsp_1, Pp_1 )
    local deduped_1_1;
    deduped_1_1 := List( objectsp_1, Cardinality );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Pp_1, UnderlyingPermutation, PermList( Concatenation( List( [ 1 .. Length( L_1 ) ], function ( i_2 )
                  local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2, deduped_5_2;
                  deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( L_1[i_2] );
                  deduped_4_2 := Sum( deduped_1_1{[ 1 .. i_2 - 1 ]} );
                  deduped_3_2 := Cardinality( Source( deduped_5_2 ) );
                  hoisted_2_2 := List( [ deduped_4_2 .. deduped_4_2 + deduped_1_1[i_2] - 1 ], function ( i_3 )
                          return 1 + i_3;
                      end );
                  hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( ListPerm( UnderlyingPermutation( deduped_5_2 ), deduped_3_2 ) );
                  return List( [ 1 .. CAP_JIT_INCOMPLETE_LOGIC( deduped_3_2 ) ], function ( i_3 )
                          return hoisted_2_2[hoisted_1_2[i_3]];
                      end );
              end ) ) ) );
end
########
        
    , 503 );
    
    ##
    cat!.cached_precompiled_functions.CoproductFunctorialWithGivenCoproducts :=
        
########
function ( cat_1, P_1, objects_1, L_1, objectsp_1, Pp_1 )
    local hoisted_1_1, deduped_2_1, hoisted_3_1;
    hoisted_3_1 := List( L_1, function ( x_2 )
            return ListPerm( UnderlyingPermutation( x_2 ), Cardinality( Source( x_2 ) ) );
        end );
    deduped_2_1 := List( objectsp_1, Cardinality );
    hoisted_1_1 := List( L_1, function ( x_2 )
            return Cardinality( Source( x_2 ) );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Pp_1, UnderlyingPermutation, PermList( Concatenation( List( [ 1 .. Length( L_1 ) ], function ( i_2 )
                  local hoisted_1_2, hoisted_2_2, deduped_3_2;
                  deduped_3_2 := Sum( deduped_2_1{[ 1 .. i_2 - 1 ]} );
                  hoisted_2_2 := List( [ deduped_3_2 .. deduped_3_2 + deduped_2_1[i_2] - 1 ], function ( i_3 )
                          return 1 + i_3;
                      end );
                  hoisted_1_2 := hoisted_3_1[i_2];
                  return List( [ 1 .. hoisted_1_1[i_2] ], function ( i_3 )
                          return hoisted_2_2[hoisted_1_2[i_3]];
                      end );
              end ) ) ) );
end
########
        
    ;
    
    ##
    AddIdentityMorphism( cat,
        
########
function ( cat_1, a_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, UnderlyingPermutation, PermList( [ 1 .. Cardinality( a_1 ) ] ) );
end
########
        
    , 100 );
    
    ##
    AddInverseForMorphisms( cat,
        
########
function ( cat_1, alpha_1 )
    local deduped_1_1;
    deduped_1_1 := Source( alpha_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_1_1, deduped_1_1, UnderlyingPermutation, InverseImmutable( UnderlyingPermutation( alpha_1 ) ) );
end
########
        
    , 100 );
    
    ##
    AddIsCongruentForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return ListPerm( UnderlyingPermutation( arg2_1 ), Cardinality( Source( arg2_1 ) ) ) = ListPerm( UnderlyingPermutation( arg3_1 ), Cardinality( Source( arg3_1 ) ) );
end
########
        
    , 101 );
    
    ##
    AddIsEqualForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return ListPerm( UnderlyingPermutation( arg2_1 ), Cardinality( Source( arg2_1 ) ) ) = ListPerm( UnderlyingPermutation( arg3_1 ), Cardinality( Source( arg3_1 ) ) );
end
########
        
    , 100 );
    
    ##
    AddIsEqualForObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return Cardinality( arg2_1 ) = Cardinality( arg3_1 );
end
########
        
    , 100 );
    
    ##
    AddIsWellDefinedForMorphisms( cat,
        
########
function ( cat_1, alpha_1 )
    local deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := Cardinality( Range( alpha_1 ) );
    deduped_4_1 := Cardinality( Source( alpha_1 ) );
    if not deduped_4_1 = deduped_5_1 then
        return false;
    else
        deduped_3_1 := ListPerm( UnderlyingPermutation( alpha_1 ), deduped_4_1 );
        deduped_2_1 := List( deduped_3_1, function ( i_2 )
                return -1 + i_2;
            end );
        return ForAll( deduped_2_1, function ( a_2 )
                    return IsBigInt( a_2 ) and a_2 >= 0;
                end ) and deduped_4_1 = Length( deduped_3_1 ) and ForAll( deduped_2_1, function ( a_2 )
                  return a_2 < deduped_5_1;
              end );
    fi;
    return;
end
########
        
    , 100 );
    
    ##
    AddIsWellDefinedForObjects( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1;
    deduped_1_1 := Cardinality( arg2_1 );
    return IsBigInt( deduped_1_1 ) and deduped_1_1 >= 0;
end
########
        
    , 100 );
    
    ##
    AddMorphismConstructor( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg4_1, UnderlyingPermutation, arg3_1 );
end
########
        
    , 100 );
    
    ##
    AddMorphismDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return UnderlyingPermutation( arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddObjectConstructor( cat,
        
########
function ( cat_1, arg2_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddObjectDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return Cardinality( arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddPreCompose( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), Target( beta_1 ), UnderlyingPermutation, UnderlyingPermutation( alpha_1 ) * UnderlyingPermutation( beta_1 ) );
end
########
        
    , 100 );
    
    ##
    AddTensorProductOnMorphismAndObjectWithGivenTensorProducts( cat,
        
########
function ( cat_1, s_1, alpha_1, b_1, r_1 )
    local hoisted_2_1, deduped_3_1;
    deduped_3_1 := Cardinality( b_1 );
    hoisted_2_1 := [ 1 .. deduped_3_1 ];
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, s_1, UnderlyingPermutation, PermList( Concatenation( List( ListPerm( UnderlyingPermutation( alpha_1 ), Cardinality( Source( alpha_1 ) ) ), function ( p_2 )
                  local hoisted_1_2;
                  hoisted_1_2 := (p_2 - 1) * deduped_3_1;
                  return List( hoisted_2_1, function ( i_3 )
                          return hoisted_1_2 + i_3;
                      end );
              end ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddTensorProductOnMorphismsWithGivenTensorProducts( cat,
        
########
function ( cat_1, s_1, alpha_1, beta_1, r_1 )
    local deduped_3_1, hoisted_4_1, hoisted_5_1;
    hoisted_5_1 := UnderlyingPermutation( beta_1 );
    hoisted_4_1 := UnderlyingPermutation( alpha_1 );
    deduped_3_1 := Cardinality( Source( beta_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, UnderlyingPermutation, PermList( List( [ 1 .. Cardinality( s_1 ) ], function ( k_2 )
                local deduped_1_2;
                deduped_1_2 := k_2 - 1;
                return (OnPoints( QUO_INT( deduped_1_2, deduped_3_1 ) + 1, hoisted_4_1 ) - 1) * deduped_3_1 + OnPoints( REM_INT( deduped_1_2, deduped_3_1 ) + 1, hoisted_5_1 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddTensorProductOnObjectAndMorphismWithGivenTensorProducts( cat,
        
########
function ( cat_1, s_1, a_1, beta_1, r_1 )
    local hoisted_2_1, deduped_3_1;
    deduped_3_1 := Cardinality( Source( beta_1 ) );
    hoisted_2_1 := ListPerm( UnderlyingPermutation( beta_1 ), deduped_3_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, s_1, UnderlyingPermutation, PermList( Concatenation( List( [ 0 .. Cardinality( a_1 ) - 1 ], function ( i_2 )
                  local hoisted_1_2;
                  hoisted_1_2 := i_2 * deduped_3_1;
                  return List( hoisted_2_1, function ( p_3 )
                          return p_3 + hoisted_1_2;
                      end );
              end ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddTensorProductOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, Cardinality( arg2_1 ) * Cardinality( arg3_1 ) );
end
########
        
    , 100 );
    
    ##
    AddTensorUnit( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, 1 );
end
########
        
    , 100 );
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
end );

BindGlobal( "PermutationCategory_precompiled", function (  )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function (  )
    return PermutationCategory(  : no_precompiled_code := true );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_PermutationCategory_precompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
