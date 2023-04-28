# SPDX-License-Identifier: GPL-2.0-or-later
# Algebroids: Algebroids and bialgebroids as preadditive categories generated by enhanced quivers
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_CategoryFromNerveDataPrecompiled", function ( cat )
    
    ##
    AddDistinguishedObjectOfHomomorphismStructure( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, BigInt( 1 ) );
end
########
        
    , 100 );
    
    ##
    AddHomomorphismStructureOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_4_1, hoisted_6_1, hoisted_8_1, hoisted_10_1, hoisted_13_1, hoisted_16_1, deduped_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1;
    deduped_29_1 := MapOfObject( arg3_1 );
    deduped_28_1 := MapOfObject( arg2_1 );
    deduped_27_1 := NerveData( cat_1 )[2];
    deduped_26_1 := Length( Source( deduped_29_1 ) );
    deduped_25_1 := deduped_27_1[3];
    deduped_24_1 := Length( Source( deduped_28_1 ) );
    deduped_23_1 := deduped_27_1[2];
    deduped_22_1 := Length( Source( deduped_25_1 ) );
    deduped_21_1 := Length( Source( deduped_23_1 ) );
    hoisted_10_1 := AsList( deduped_29_1 );
    hoisted_8_1 := AsList( deduped_25_1 );
    deduped_20_1 := Filtered( [ 0 .. deduped_22_1 * deduped_26_1 - 1 ], function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return hoisted_8_1[1 + REM_INT( deduped_1_2, deduped_22_1 )] = hoisted_10_1[1 + REM_INT( QUO_INT( deduped_1_2, deduped_22_1 ), deduped_26_1 )];
        end );
    hoisted_6_1 := AsList( deduped_28_1 );
    hoisted_4_1 := AsList( deduped_23_1 );
    deduped_19_1 := Filtered( [ 0 .. deduped_21_1 * deduped_24_1 - 1 ], function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return hoisted_4_1[1 + REM_INT( deduped_1_2, deduped_21_1 )] = hoisted_6_1[1 + REM_INT( QUO_INT( deduped_1_2, deduped_21_1 ), deduped_24_1 )];
        end );
    deduped_18_1 := Length( deduped_20_1 );
    deduped_17_1 := Length( deduped_19_1 );
    hoisted_16_1 := List( [ 0 .. deduped_18_1 - 1 ], function ( i_2 )
            return REM_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_20_1[1 + i_2] ), deduped_22_1 );
        end );
    hoisted_13_1 := List( [ 0 .. deduped_17_1 - 1 ], function ( i_2 )
            return REM_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_19_1[1 + i_2] ), deduped_21_1 );
        end );
    return CreateCapCategoryObjectWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), Length, Length( Filtered( [ 0 .. deduped_17_1 * deduped_18_1 - 1 ], function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
                return hoisted_13_1[1 + REM_INT( deduped_1_2, deduped_17_1 )] = hoisted_16_1[1 + REM_INT( QUO_INT( deduped_1_2, deduped_17_1 ), deduped_18_1 )];
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddIdentityMorphism( cat,
        
########
function ( cat_1, a_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := MapOfObject( a_1 );
    deduped_4_1 := Source( deduped_5_1 );
    deduped_3_1 := NerveData( cat_1 )[2][1];
    hoisted_2_1 := AsList( deduped_3_1 );
    hoisted_1_1 := AsList( deduped_5_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), deduped_4_1, Range( deduped_3_1 ), AsList, List( [ 0 .. Length( deduped_4_1 ) - 1 ], function ( i_2 )
                return hoisted_2_1[1 + hoisted_1_1[(1 + i_2)]];
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( cat,
        
########
function ( cat_1, alpha_1 )
    local hoisted_2_1, hoisted_4_1, hoisted_6_1, hoisted_8_1, deduped_11_1, hoisted_14_1, hoisted_16_1, hoisted_17_1, deduped_18_1, deduped_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1;
    deduped_35_1 := MapOfMorphism( alpha_1 );
    deduped_34_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_33_1 := MapOfObject( Range( alpha_1 ) );
    deduped_32_1 := MapOfObject( Source( alpha_1 ) );
    deduped_31_1 := NerveData( cat_1 )[2];
    deduped_30_1 := Source( deduped_35_1 );
    deduped_29_1 := deduped_31_1[3];
    deduped_28_1 := deduped_31_1[2];
    deduped_27_1 := Length( Source( deduped_33_1 ) );
    deduped_26_1 := Length( Source( deduped_32_1 ) );
    deduped_25_1 := Length( Source( deduped_29_1 ) );
    deduped_24_1 := Length( Source( deduped_28_1 ) );
    hoisted_8_1 := AsList( deduped_33_1 );
    hoisted_6_1 := AsList( deduped_29_1 );
    deduped_23_1 := Filtered( [ 0 .. deduped_25_1 * deduped_27_1 - 1 ], function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return hoisted_6_1[1 + REM_INT( deduped_1_2, deduped_25_1 )] = hoisted_8_1[1 + REM_INT( QUO_INT( deduped_1_2, deduped_25_1 ), deduped_27_1 )];
        end );
    hoisted_4_1 := AsList( deduped_32_1 );
    hoisted_2_1 := AsList( deduped_28_1 );
    deduped_22_1 := Filtered( [ 0 .. deduped_24_1 * deduped_26_1 - 1 ], function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return hoisted_2_1[1 + REM_INT( deduped_1_2, deduped_24_1 )] = hoisted_4_1[1 + REM_INT( QUO_INT( deduped_1_2, deduped_24_1 ), deduped_26_1 )];
        end );
    deduped_21_1 := Length( deduped_23_1 );
    deduped_20_1 := Length( deduped_22_1 );
    hoisted_14_1 := List( [ 0 .. deduped_21_1 - 1 ], function ( i_2 )
            return REM_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_23_1[1 + i_2] ), deduped_25_1 );
        end );
    deduped_11_1 := List( [ 0 .. deduped_20_1 - 1 ], function ( i_2 )
            return REM_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_22_1[1 + i_2] ), deduped_24_1 );
        end );
    deduped_19_1 := Filtered( [ 0 .. deduped_20_1 * deduped_21_1 - 1 ], function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return deduped_11_1[1 + REM_INT( deduped_1_2, deduped_20_1 )] = hoisted_14_1[1 + REM_INT( QUO_INT( deduped_1_2, deduped_20_1 ), deduped_21_1 )];
        end );
    deduped_18_1 := Length( deduped_19_1 );
    hoisted_17_1 := List( [ 0 .. deduped_18_1 - 1 ], function ( logic_new_func_x_2 )
            return deduped_11_1[1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_19_1[(1 + logic_new_func_x_2)] ), deduped_20_1 )];
        end );
    hoisted_16_1 := AsList( deduped_35_1 );
    return CreateCapCategoryMorphismWithAttributes( deduped_34_1, deduped_30_1, CreateCapCategoryObjectWithAttributes( deduped_34_1, Length, deduped_18_1 ), AsList, List( [ 0 .. Length( deduped_30_1 ) - 1 ], function ( x_2 )
              return -1 + BigInt( SafePosition( hoisted_17_1, hoisted_16_1[(1 + x_2)] ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local hoisted_4_1, hoisted_6_1, hoisted_8_1, hoisted_10_1, deduped_13_1, hoisted_16_1, hoisted_18_1, hoisted_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1;
    deduped_35_1 := MapOfObject( range_1 );
    deduped_34_1 := MapOfObject( source_1 );
    deduped_33_1 := Source( alpha_1 );
    deduped_32_1 := NerveData( cat_1 )[2];
    deduped_31_1 := Length( Source( deduped_35_1 ) );
    deduped_30_1 := deduped_32_1[3];
    deduped_29_1 := Length( Source( deduped_34_1 ) );
    deduped_28_1 := deduped_32_1[2];
    deduped_27_1 := Source( deduped_28_1 );
    deduped_26_1 := Length( Source( deduped_30_1 ) );
    deduped_25_1 := Length( deduped_27_1 );
    hoisted_10_1 := AsList( deduped_35_1 );
    hoisted_8_1 := AsList( deduped_30_1 );
    deduped_24_1 := Filtered( [ 0 .. deduped_26_1 * deduped_31_1 - 1 ], function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return hoisted_8_1[1 + REM_INT( deduped_1_2, deduped_26_1 )] = hoisted_10_1[1 + REM_INT( QUO_INT( deduped_1_2, deduped_26_1 ), deduped_31_1 )];
        end );
    hoisted_6_1 := AsList( deduped_34_1 );
    hoisted_4_1 := AsList( deduped_28_1 );
    deduped_23_1 := Filtered( [ 0 .. deduped_25_1 * deduped_29_1 - 1 ], function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return hoisted_4_1[1 + REM_INT( deduped_1_2, deduped_25_1 )] = hoisted_6_1[1 + REM_INT( QUO_INT( deduped_1_2, deduped_25_1 ), deduped_29_1 )];
        end );
    deduped_22_1 := Length( deduped_24_1 );
    deduped_21_1 := Length( deduped_23_1 );
    hoisted_16_1 := List( [ 0 .. deduped_22_1 - 1 ], function ( i_2 )
            return REM_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_24_1[1 + i_2] ), deduped_26_1 );
        end );
    deduped_13_1 := List( [ 0 .. deduped_21_1 - 1 ], function ( i_2 )
            return REM_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_23_1[1 + i_2] ), deduped_25_1 );
        end );
    deduped_20_1 := Filtered( [ 0 .. deduped_21_1 * deduped_22_1 - 1 ], function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return deduped_13_1[1 + REM_INT( deduped_1_2, deduped_21_1 )] = hoisted_16_1[1 + REM_INT( QUO_INT( deduped_1_2, deduped_21_1 ), deduped_22_1 )];
        end );
    hoisted_19_1 := List( [ 0 .. Length( deduped_20_1 ) - 1 ], function ( logic_new_func_x_2 )
            return deduped_13_1[1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_20_1[(1 + logic_new_func_x_2)] ), deduped_21_1 )];
        end );
    hoisted_18_1 := AsList( alpha_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, MapOfMorphism, CreateCapCategoryMorphismWithAttributes( RangeCategoryOfHomomorphismStructure( cat_1 ), deduped_33_1, deduped_27_1, AsList, List( [ 0 .. Length( deduped_33_1 ) - 1 ], function ( i_2 )
                return hoisted_19_1[1 + hoisted_18_1[(1 + i_2)]];
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddIsCongruentForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return AsList( MapOfMorphism( arg2_1 ) ) = AsList( MapOfMorphism( arg3_1 ) );
end
########
        
    , 100 );
    
    ##
    AddIsEqualForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return AsList( MapOfMorphism( arg2_1 ) ) = AsList( MapOfMorphism( arg3_1 ) );
end
########
        
    , 100 );
    
    ##
    AddIsEqualForObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return AsList( MapOfObject( arg2_1 ) ) = AsList( MapOfObject( arg3_1 ) );
end
########
        
    , 100 );
    
    ##
    AddIsWellDefinedForMorphisms( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := MapOfMorphism( arg2_1 );
    deduped_4_1 := AsList( deduped_5_1 );
    deduped_3_1 := Length( Range( deduped_5_1 ) );
    deduped_2_1 := Length( Source( deduped_5_1 ) );
    return IdFunc( function (  )
                  if not ForAll( deduped_4_1, function ( a_3 )
                               return (IsBigInt( a_3 ) and a_3 >= 0);
                           end ) then
                      return false;
                  elif deduped_2_1 <> Length( deduped_4_1 ) then
                      return false;
                  elif not ForAll( deduped_4_1, function ( a_3 )
                               return a_3 < deduped_3_1;
                           end ) then
                      return false;
                  else
                      return true;
                  fi;
                  return;
              end )(  ) and deduped_2_1 = 1 and Length( NerveData( cat_1 )[1][2] ) = deduped_3_1;
end
########
        
    , 100 );
    
    ##
    AddIsWellDefinedForObjects( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_2_1, deduped_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := MapOfObject( arg2_1 );
    deduped_4_1 := AsList( deduped_5_1 );
    deduped_3_1 := Length( Range( deduped_5_1 ) );
    deduped_2_1 := Length( Source( deduped_5_1 ) );
    return IdFunc( function (  )
                  if not ForAll( deduped_4_1, function ( a_3 )
                               return (IsBigInt( a_3 ) and a_3 >= 0);
                           end ) then
                      return false;
                  elif deduped_2_1 <> Length( deduped_4_1 ) then
                      return false;
                  elif not ForAll( deduped_4_1, function ( a_3 )
                               return a_3 < deduped_3_1;
                           end ) then
                      return false;
                  else
                      return true;
                  fi;
                  return;
              end )(  ) and deduped_2_1 = 1 and Length( NerveData( cat_1 )[1][1] ) = deduped_3_1;
end
########
        
    , 100 );
    
    ##
    AddMorphismConstructor( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg4_1, MapOfMorphism, arg3_1 );
end
########
        
    , 100 );
    
    ##
    AddMorphismDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return MapOfMorphism( arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddObjectConstructor( cat,
        
########
function ( cat_1, arg2_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, MapOfObject, arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddObjectDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return MapOfObject( arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddPreCompose( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local hoisted_4_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1, deduped_15_1, deduped_16_1, deduped_17_1, deduped_18_1, deduped_19_1;
    deduped_19_1 := NerveData( cat_1 );
    deduped_18_1 := BigInt( 1 );
    deduped_17_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_16_1 := deduped_19_1[2];
    deduped_15_1 := deduped_16_1[2];
    deduped_14_1 := deduped_16_1[3];
    deduped_13_1 := deduped_16_1[8];
    deduped_12_1 := Length( Source( deduped_15_1 ) );
    deduped_11_1 := Length( Source( deduped_14_1 ) );
    hoisted_6_1 := AsList( deduped_15_1 );
    hoisted_4_1 := AsList( deduped_14_1 );
    deduped_10_1 := Filtered( [ 0 .. deduped_11_1 * deduped_12_1 - 1 ], function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return hoisted_4_1[1 + REM_INT( deduped_1_2, deduped_11_1 )] = hoisted_6_1[1 + REM_INT( QUO_INT( deduped_1_2, deduped_11_1 ), deduped_12_1 )];
        end );
    hoisted_8_1 := AsList( deduped_16_1[7] );
    hoisted_7_1 := AsList( deduped_16_1[6] );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), Range( beta_1 ), MapOfMorphism, CreateCapCategoryMorphismWithAttributes( deduped_17_1, CreateCapCategoryObjectWithAttributes( deduped_17_1, Length, deduped_18_1 ), Range( deduped_13_1 ), AsList, [ AsList( deduped_13_1 )[1 + (-1 + BigInt( SafePosition( List( [ 0 .. (Length( deduped_19_1[1][3] ) - 1) ], function ( logic_new_func_x_2 )
                             local deduped_1_2;
                             deduped_1_2 := (1 + CAP_JIT_INCOMPLETE_LOGIC( logic_new_func_x_2 ));
                             return (-1 + BigInt( SafePosition( deduped_10_1, (hoisted_7_1[deduped_1_2] + hoisted_8_1[deduped_1_2] * deduped_11_1) ) ));
                         end ), CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. (Length( deduped_10_1 ) - 1) ][BigInt( SafePosition( deduped_10_1, (AsList( MapOfMorphism( alpha_1 ) )[deduped_18_1] + AsList( MapOfMorphism( beta_1 ) )[deduped_18_1] * deduped_11_1) ) )] ) ) ))] ] ) );
end
########
        
    , 100 );
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
end );

BindGlobal( "CategoryFromNerveDataPrecompiled", function ( quiver )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function ( quiver )
    local sFinSets;
    sFinSets := CategoryOfSkeletalFinSets(  : FinalizeCategory := true );
    return CategoryFromNerveData( FreeCategory( quiver : range_of_HomStructure := sFinSets,
          FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor( quiver : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_CategoryFromNerveDataPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );