#
# Locales: Co-Heyting algebras
#
# Implementations
#

InstallValue( COHEYTING_ALGEBRA_METHOD_NAME_RECORD,
        rec(
ConegationOnObjects := rec(
  installation_name := "ConegationOnObjects",
  filter_list := [ "object" ],
  io_type := [ [ "a" ], [ "an" ] ],
  cache_name := "ConegationOnObjects",
  return_type := "object" ),

ConegationOnMorphismsWithGivenConegations := rec(
  installation_name := "ConegationOnMorphismsWithGivenConegations",
  io_type := [ [ "s", "alpha", "r" ], [ "s", "r" ] ],
  filter_list := [ "object", "morphism", "object" ],
  cache_name := "ConegationOnMorphismsWithGivenConegations",
  return_type := "morphism" ),

MorphismFromDoubleConegationWithGivenDoubleConegation := rec(
  installation_name := "MorphismFromDoubleConegationWithGivenDoubleConegation",
  filter_list := [ "object", "object" ],
  io_type := [ [ "a", "r" ], [ "a", "r" ] ],
  cache_name := "MorphismFromDoubleConegationWithGivenDoubleConegation",
  return_type := "morphism" )

            ) );

CAP_INTERNAL_ENHANCE_NAME_RECORD( COHEYTING_ALGEBRA_METHOD_NAME_RECORD );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( COHEYTING_ALGEBRA_METHOD_NAME_RECORD );

InstallValue( CAP_INTERNAL_COHEYTING_ALGEBRAS_BASIC_OPERATIONS, rec( ) );

##
CAP_INTERNAL_COHEYTING_ALGEBRAS_BASIC_OPERATIONS.ConegationOnMorphisms :=
  [ [ "ConegationOnMorphismsWithGivenConegations", 1 ],
    [ "ConegationOnObjects", 2 ] ];

##
InstallMethod( ConegationOnMorphisms,
               [ IsCapCategoryMorphism ],
        
  function( morphism )
    
    return ConegationOnMorphismsWithGivenConegations(
                   ConegationOnObjects( Range( morphism ) ),
                   morphism,
                   ConegationOnObjects( Source( morphism ) ) );
    
end );

CAP_INTERNAL_ADD_REPLACEMENTS_FOR_METHOD_RECORD( CAP_INTERNAL_COHEYTING_ALGEBRAS_BASIC_OPERATIONS );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_COHEYTING_ALGEBRAS,
  function( coheyting_algebra )
    
    SetIsCocartesianCoclosedCategory( coheyting_algebra, true );
    
    ADD_COMMON_METHODS_FOR_LATTICES( coheyting_algebra );
    
    ## The cocartesian monoidal structure
    
    ## The coclosedness of the cocartesian monoidal structure
    
    ##
    AddCoexponentialOnMorphismsWithGivenCoexponentials( coheyting_algebra,
      function( S, alpha, beta, R )
        
        return UniqueMorphism( S, R );
        
    end );
    
    ##
    AddCocartesianEvaluationMorphismWithGivenRange( coheyting_algebra,
      function( A, B, BxCoex_A_B )
        
        return UniqueMorphism( A, BxCoex_A_B );
        
    end );
    
    ##
    AddCocartesianCoevaluationMorphismWithGivenSource( coheyting_algebra,
      function( A, B, Coex_AxB_A)
        
        return UniqueMorphism( Coex_AxB_A, B );
        
    end );
    
    ##
    AddCoproductToCoexponentialAdjunctionMap( coheyting_algebra,
      function( B, C, g )
        local A;
        
        A := Source( g );
        
        return UniqueMorphism( CoexponentialOnObjects( A, B ), C );
        
    end );
    
    ##
    AddCoexponentialToCoproductAdjunctionMap( coheyting_algebra,
      function( A, B, f )
        local C, BC;
        
        C := Range( f );
        
        BC := Coproduct( B, C );
        
        return UniqueMorphism( A, BC);
        
    end );
    
    ##
    AddCocartesianPreCoComposeMorphismWithGivenObjects( coheyting_algebra,
      function( Coex_A_C, A, B, C, Coex_A_BxCoex_B_C);
        
        return UniqueMorphism( Coex_A_C, Coex_A_BxCoex_B_C );
        
    end );
    
    ##
    AddCocartesianPostCoComposeMorphismWithGivenObjects( coheyting_algebra,
      function( Coex_A_C, A, B, C, Coex_B_CxCoex_A_B );
        
        return UniqueMorphism( Coex_A_C, Coex_B_CxCoex_A_B );
        
    end );
    
    ##
    AddCoexponentialCoproductCompatibilityMorphismWithGivenObjects( coheyting_algebra,
      function( A1, A2, B1, B2, L )
        
        return UniqueMorphism( L[1], L[2] );
        
    end );
    
    ## The co-negation
    
    ##
    AddMorphismFromDoubleConegationWithGivenDoubleConegation( coheyting_algebra,
      function( A, B )
        
        return UniqueMorphism( A, B );
        
    end );
    
end );

##
AddDerivationToCAP( IsHomSetInhabited,
        [ [ IsInitial, 1 ],
          [ CoexponentialOnObjects, 1 ] ],
        
  function( S, T )
    
    return IsInitial( CoexponentialOnObjects( S, T ) );
    
end : Description := "IsHomSetInhabited using IsInitial and CoexponentialOnObjects",
      CategoryFilter := IsThinCategory and IsCartesianCategory and IsCocartesianCategory and IsCocartesianCoclosedCategory );

##
AddDerivationToCAP( ConegationOnObjects,
        [ [ CoexponentialOnObjects, 1 ],
          [ TerminalObject, 1 ] ],
        
  function( A )
    
    return CoexponentialOnObjects( TerminalObject( CapCategory( A ) ), A );
    
end : Description := "ConegationOnObjects using CoexponentialOnObjects and TerminalObject",
      CategoryFilter := IsThinCategory and IsCartesianCategory and IsCocartesianCategory and IsCocartesianCoclosedCategory );

##
AddDerivationToCAP( ConegationOnMorphismsWithGivenConegations,
        [ [ CoexponentialOnMorphismsWithGivenCoexponentials, 1 ],
          [ IdentityMorphism, 1 ],
          [ TerminalObject, 1 ] ],
        
  function( B_, u, A_ )
    
    return CoexponentialOnMorphismsWithGivenCoexponentials( B_, IdentityMorphism( TerminalObject( CapCategory( u ) ) ), u, A_ );
    
end : Description := "ConegationOnMorphismsWithGivenConegations using CoexponentialOnMorphismsWithGivenCoexponentials and IdentityMorphism and TerminalObject",
      CategoryFilter := IsThinCategory and IsCartesianCategory and IsCocartesianCategory and IsCocartesianCoclosedCategory );
