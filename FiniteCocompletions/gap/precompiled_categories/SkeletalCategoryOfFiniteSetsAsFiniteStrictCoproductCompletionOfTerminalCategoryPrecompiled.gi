# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_SkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategoryPrecompiled", function ( cat )
    
    ##
    AddCoproduct( cat,
        
########
function ( cat_1, objects_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, Sum( List( objects_1, Cardinality ) ) );
end
########
        
    , 100 );
    
    ##
    AddDirectProduct( cat,
        
########
function ( cat_1, objects_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, Product( List( objects_1, Cardinality ) ) );
end
########
        
    , 200 );
    
    ##
    AddDistinguishedObjectOfHomomorphismStructure( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, BigInt( 1 ) );
end
########
        
    , 100 );
    
    ##
    AddEmbeddingOfEqualizerWithGivenEqualizer( cat,
        
########
function ( cat_1, Y_1, morphisms_1, P_1 )
    local deduped_1_1, hoisted_2_1;
    hoisted_2_1 := [ 1 .. Length( morphisms_1 ) - 1 ];
    deduped_1_1 := List( morphisms_1, AsList );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Y_1, AsList, Filtered( [ 0 .. Cardinality( Y_1 ) - 1 ], function ( x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + x_2;
              return ForAll( hoisted_2_1, function ( j_3 )
                      return deduped_1_1[j_3][deduped_1_2] = deduped_1_1[j_3 + 1][deduped_1_2];
                  end );
          end ) );
end
########
        
    , 200 );
    
    ##
    AddEqualizer( cat,
        
########
function ( cat_1, Y_1, morphisms_1 )
    local deduped_1_1, hoisted_2_1;
    hoisted_2_1 := [ 1 .. Length( morphisms_1 ) - 1 ];
    deduped_1_1 := List( morphisms_1, AsList );
    return CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, Length( Filtered( [ 0 .. Cardinality( Y_1 ) - 1 ], function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + x_2;
                return ForAll( hoisted_2_1, function ( j_3 )
                        return deduped_1_1[j_3][deduped_1_2] = deduped_1_1[j_3 + 1][deduped_1_2];
                    end );
            end ) ) );
end
########
        
    , 200 );
    
    ##
    AddHomomorphismStructureOnMorphismsWithGivenObjects( cat,
        
########
function ( cat_1, source_1, alpha_1, beta_1, range_1 )
    local deduped_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1;
    hoisted_6_1 := [ 0 .. Cardinality( Source( alpha_1 ) ) - 1 ];
    hoisted_5_1 := Cardinality( Range( beta_1 ) );
    hoisted_4_1 := AsList( beta_1 );
    hoisted_3_1 := AsList( alpha_1 );
    hoisted_2_1 := [ 0 .. Cardinality( Range( alpha_1 ) ) - 1 ];
    deduped_1_1 := Cardinality( Source( beta_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, AsList, List( [ 0 .. Cardinality( source_1 ) - 1 ], function ( gg_2 )
              local hoisted_1_2;
              hoisted_1_2 := List( hoisted_2_1, function ( i_3 )
                      return REM_INT( QUO_INT( gg_2, deduped_1_1 ^ i_3 ), deduped_1_1 );
                  end );
              return Sum( hoisted_6_1, function ( i_3 )
                      return CAP_JIT_INCOMPLETE_LOGIC( hoisted_4_1[1 + hoisted_1_2[1 + hoisted_3_1[1 + CAP_JIT_INCOMPLETE_LOGIC( i_3 )]]] ) * hoisted_5_1 ^ i_3;
                  end );
          end ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.HomomorphismStructureOnMorphismsWithGivenObjects :=
        
########
function ( cat_1, source_1, alpha_1, beta_1, range_1 )
    local deduped_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1, hoisted_6_1;
    hoisted_6_1 := Cardinality( Range( beta_1 ) );
    deduped_5_1 := [ 0 .. Cardinality( Source( alpha_1 ) ) - 1 ];
    hoisted_4_1 := AsList( beta_1 );
    hoisted_3_1 := AsList( alpha_1 );
    hoisted_2_1 := [ 0 .. Cardinality( Range( alpha_1 ) ) - 1 ];
    deduped_1_1 := Cardinality( Source( beta_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, AsList, List( [ 0 .. Cardinality( source_1 ) - 1 ], function ( gg_2 )
              local hoisted_1_2, hoisted_2_2;
              hoisted_1_2 := List( hoisted_2_1, function ( i_3 )
                      return REM_INT( QUO_INT( gg_2, deduped_1_1 ^ i_3 ), deduped_1_1 );
                  end );
              hoisted_2_2 := List( deduped_5_1, function ( j_3 )
                      return hoisted_4_1[1 + hoisted_1_2[1 + hoisted_3_1[1 + j_3]]];
                  end );
              return Sum( deduped_5_1, function ( i_3 )
                      return hoisted_2_2[1 + i_3] * hoisted_6_1 ^ i_3;
                  end );
          end ) );
end
########
        
    ;
    
    ##
    AddHomomorphismStructureOnObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, Cardinality( arg3_1 ) ^ Cardinality( arg2_1 ) );
end
########
        
    , 100 );
    
    ##
    AddIdentityMorphism( cat,
        
########
function ( cat_1, a_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, AsList, [ 0 .. Cardinality( a_1 ) - 1 ] );
end
########
        
    , 200 );
    
    ##
    AddInitialObject( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, BigInt( 0 ) );
end
########
        
    , 100 );
    
    ##
    AddInjectionOfCofactorOfCoproductWithGivenCoproduct( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := List( objects_1, Cardinality );
    deduped_1_1 := Sum( deduped_2_1{[ 1 .. k_1 - 1 ]} );
    return CreateCapCategoryMorphismWithAttributes( cat_1, objects_1[k_1], P_1, AsList, [ deduped_1_1 .. deduped_1_1 + deduped_2_1[k_1] - 1 ] );
end
########
        
    , 100 );
    
    ##
    AddInjectionOfCoproductComplement( cat,
        
########
function ( cat_1, iota_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := Range( iota_1 );
    deduped_1_1 := Cardinality( deduped_2_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, deduped_1_1 - Cardinality( Source( iota_1 ) ) ), deduped_2_1, AsList, Difference( [ 0 .. deduped_1_1 - 1 ], AsList( iota_1 ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects( cat,
        
########
function ( cat_1, source_1, alpha_1, range_1 )
    local hoisted_1_1, hoisted_2_1;
    hoisted_2_1 := Cardinality( Range( alpha_1 ) );
    hoisted_1_1 := AsList( alpha_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, AsList, ListWithIdenticalEntries( Cardinality( source_1 ), Sum( [ 0 .. Cardinality( Source( alpha_1 ) ) - 1 ], function ( i_2 )
                return hoisted_1_1[1 + i_2] * hoisted_2_1 ^ i_2;
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
        
########
function ( cat_1, source_1, range_1, alpha_1 )
    local deduped_1_1, hoisted_2_1;
    hoisted_2_1 := AsList( alpha_1 )[1];
    deduped_1_1 := Cardinality( range_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, source_1, range_1, AsList, List( [ 0 .. Cardinality( source_1 ) - 1 ], function ( i_2 )
              return REM_INT( QUO_INT( hoisted_2_1, deduped_1_1 ^ i_2 ), deduped_1_1 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddIsCongruentForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    if not AsList( arg2_1 ) = AsList( arg3_1 ) then
        return false;
    else
        return true;
    fi;
    return;
end
########
        
    , 100 );
    
    ##
    AddIsEqualForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    if not AsList( arg2_1 ) = AsList( arg3_1 ) then
        return false;
    else
        return true;
    fi;
    return;
end
########
        
    , 200 );
    
    ##
    AddIsEqualForObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    if not Cardinality( arg2_1 ) = Cardinality( arg3_1 ) then
        return false;
    else
        return true;
    fi;
    return;
end
########
        
    , 6 );
    
    ##
    AddIsInitial( cat,
        
########
function ( cat_1, arg2_1 )
    return Cardinality( arg2_1 ) = 0;
end
########
        
    , 100 );
    
    ##
    AddIsLiftable( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1;
    hoisted_2_1 := AsList( arg3_1 );
    hoisted_1_1 := AsList( arg2_1 );
    return ForAll( [ 0 .. Cardinality( Source( arg2_1 ) ) - 1 ], function ( b_2 )
            return hoisted_1_1[1 + b_2] in hoisted_2_1;
        end );
end
########
        
    , 100 );
    
    ##
    AddIsMonomorphism( cat,
        
########
function ( cat_1, arg2_1 )
    return SKELETAL_CATEGORY_OF_FINITE_SETS_IsMonomorphism( AsList( arg2_1 ), Cardinality( Range( arg2_1 ) ) );
end
########
        
    , 2 );
    
    ##
    AddIsTerminal( cat,
        
########
function ( cat_1, arg2_1 )
    return Cardinality( arg2_1 ) = BigInt( 1 );
end
########
        
    , 102 );
    
    ##
    AddIsWellDefinedForMorphisms( cat,
        
########
function ( cat_1, alpha_1 )
    local hoisted_2_1, deduped_3_1, deduped_4_1;
    deduped_4_1 := AsList( alpha_1 );
    deduped_3_1 := Cardinality( Source( alpha_1 ) );
    hoisted_2_1 := Cardinality( Range( alpha_1 ) );
    return deduped_3_1 = Length( deduped_4_1 ) and ForAll( [ 1 .. deduped_3_1 ], function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := deduped_4_1[i_2];
              return deduped_1_2 >= 0 and deduped_1_2 < hoisted_2_1;
          end );
end
########
        
    , 212 );
    
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
    AddLift( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1;
    deduped_3_1 := Source( alpha_1 );
    hoisted_2_1 := AsList( beta_1 );
    hoisted_1_1 := AsList( alpha_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_3_1, Source( beta_1 ), AsList, List( [ 0 .. Cardinality( deduped_3_1 ) - 1 ], function ( b_2 )
              return -1 + BigInt( SafePosition( hoisted_2_1, hoisted_1_1[1 + b_2] ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddMorphismConstructor( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg4_1, AsList, arg3_1 );
end
########
        
    , 100 );
    
    ##
    AddMorphismDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return AsList( arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := Cardinality( arg2_1 );
    deduped_4_1 := Cardinality( arg3_1 );
    hoisted_3_1 := [ 0 .. deduped_5_1 - 1 ];
    return Concatenation( List( [ 0 .. deduped_4_1 ^ deduped_5_1 - 1 ], function ( m_2 )
              local hoisted_1_2;
              hoisted_1_2 := CAP_JIT_INCOMPLETE_LOGIC( m_2 );
              return [ CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, AsList, CAP_JIT_INCOMPLETE_LOGIC( List( hoisted_3_1, function ( i_3 )
                              return DigitInPositionalNotation( hoisted_1_2, i_3, deduped_5_1, deduped_4_1 );
                          end ) ) ) ];
          end ) );
end
########
        
    , 100 );
    
    ##
    cat!.cached_precompiled_functions.MorphismsOfExternalHom :=
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_3_1, hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := Cardinality( arg2_1 );
    deduped_6_1 := Cardinality( arg3_1 );
    deduped_5_1 := [ 0 .. deduped_6_1 ^ deduped_7_1 - 1 ];
    hoisted_3_1 := [ 0 .. deduped_7_1 - 1 ];
    hoisted_4_1 := List( deduped_5_1, function ( m_2 )
            return List( hoisted_3_1, function ( i_3 )
                    return DigitInPositionalNotation( m_2, i_3, deduped_7_1, deduped_6_1 );
                end );
        end );
    return Concatenation( List( deduped_5_1, function ( m_2 )
              return [ CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, AsList, hoisted_4_1[1 + m_2] ) ];
          end ) );
end
########
        
    ;
    
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
    local hoisted_1_1, hoisted_2_1, deduped_3_1;
    deduped_3_1 := Source( alpha_1 );
    hoisted_2_1 := AsList( beta_1 );
    hoisted_1_1 := AsList( alpha_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_3_1, Range( beta_1 ), AsList, List( [ 0 .. Cardinality( deduped_3_1 ) - 1 ], function ( i_2 )
              return hoisted_2_1[1 + hoisted_1_1[1 + i_2]];
          end ) );
end
########
        
    , 200 );
    
    ##
    AddProjectionInFactorOfDirectProductWithGivenDirectProduct( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1;
    deduped_3_1 := List( objects_1, Cardinality );
    hoisted_2_1 := deduped_3_1[k_1];
    hoisted_1_1 := Product( deduped_3_1{[ 1 .. k_1 - 1 ]} );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, objects_1[k_1], AsList, List( [ 0 .. Cardinality( P_1 ) - 1 ], function ( i_2 )
              return REM_INT( QUO_INT( i_2, hoisted_1_1 ), hoisted_2_1 );
          end ) );
end
########
        
    , 200 );
    
    ##
    AddTerminalObject( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, BigInt( 1 ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromCoproductWithGivenCoproduct( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, AsList, Concatenation( List( tau_1, AsList ) ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromInitialObjectWithGivenInitialObject( cat,
        
########
function ( cat_1, T_1, P_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, AsList, CapJitTypedExpression( [  ], function (  )
              return rec(
                  filter := IsList,
                  element_type := rec(
                      filter := IsInt ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, deduped_5_1;
    deduped_5_1 := [ 0 .. Length( objects_1 ) - 1 ];
    hoisted_2_1 := List( objects_1, Cardinality );
    hoisted_3_1 := List( deduped_5_1, function ( j_2 )
            return Product( hoisted_2_1{[ 1 .. j_2 ]} );
        end );
    hoisted_1_1 := List( tau_1, AsList );
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, AsList, List( [ 0 .. Cardinality( T_1 ) - 1 ], function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := 1 + i_2;
              return Sum( deduped_5_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_1_1[deduped_1_3][hoisted_1_2] * hoisted_3_1[deduped_1_3];
                  end );
          end ) );
end
########
        
    , 200 );
    
    ##
    AddUniversalMorphismIntoEqualizerWithGivenEqualizer( cat,
        
########
function ( cat_1, Y_1, morphisms_1, T_1, tau_1, P_1 )
    local deduped_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1;
    hoisted_2_1 := [ 1 .. Length( morphisms_1 ) - 1 ];
    deduped_1_1 := List( morphisms_1, AsList );
    hoisted_4_1 := Filtered( [ 0 .. Cardinality( Y_1 ) - 1 ], function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + x_2;
            return ForAll( hoisted_2_1, function ( j_3 )
                    return deduped_1_1[j_3][deduped_1_2] = deduped_1_1[j_3 + 1][deduped_1_2];
                end );
        end );
    hoisted_3_1 := AsList( tau_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, AsList, List( [ 0 .. Cardinality( T_1 ) - 1 ], function ( x_2 )
              return -1 + BigInt( SafePosition( hoisted_4_1, hoisted_3_1[1 + x_2] ) );
          end ) );
end
########
        
    , 200 );
    
    ##
    AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( cat,
        
########
function ( cat_1, T_1, P_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, AsList, ListWithIdenticalEntries( Cardinality( T_1 ), BigInt( 0 ) ) );
end
########
        
    , 200 );
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
end );

BindGlobal( "SkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategoryPrecompiled", function (  )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function (  )
    return SkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategory(  );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_SkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategoryPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
