#
# Locales: Heyting algebras
#
# Implementations
#

InstallValue( HEYTING_ALGEBRA_METHOD_NAME_RECORD,
        rec(
NegationOnObjects := rec(
  installation_name := "NegationOnObjects",
  filter_list := [ "object" ],
  io_type := [ [ "a" ], [ "an" ] ],
  cache_name := "NegationOnObjects",
  return_type := "object" ),

NegationOnMorphismsWithGivenNegations := rec(
  installation_name := "NegationOnMorphismsWithGivenNegations",
  io_type := [ [ "s", "alpha", "r" ], [ "s", "r" ] ],
  filter_list := [ "object", "morphism", "object" ],
  cache_name := "NegationOnMorphismsWithGivenNegations",
  return_type := "morphism" ),

MorphismToDoubleNegationWithGivenDoubleNegation := rec(
  installation_name := "MorphismToDoubleNegationWithGivenDoubleNegation",
  filter_list := [ "object", "object" ],
  io_type := [ [ "a", "r" ], [ "a", "r" ] ],
  cache_name := "MorphismToDoubleNegationWithGivenDoubleNegation",
  return_type := "morphism" )

            ) );

CAP_INTERNAL_ENHANCE_NAME_RECORD( HEYTING_ALGEBRA_METHOD_NAME_RECORD );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( HEYTING_ALGEBRA_METHOD_NAME_RECORD );

InstallValue( CAP_INTERNAL_HEYTING_ALGEBRAS_BASIC_OPERATIONS, rec( ) );

##
CAP_INTERNAL_HEYTING_ALGEBRAS_BASIC_OPERATIONS.NegationOnMorphisms :=
  [ [ "NegationOnMorphismsWithGivenNegations", 1 ],
    [ "NegationOnObjects", 2 ] ];

##
InstallMethod( NegationOnMorphisms,
               [ IsCapCategoryMorphism ],
        
  function( morphism )
    
    return NegationOnMorphismsWithGivenNegations(
                   NegationOnObjects( Range( morphism ) ),
                   morphism,
                   NegationOnObjects( Source( morphism ) ) );
    
end );

CAP_INTERNAL_ADD_REPLACEMENTS_FOR_METHOD_RECORD( CAP_INTERNAL_HEYTING_ALGEBRAS_BASIC_OPERATIONS );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_HEYTING_ALGEBRAS,
  function( heyting_algebra )
    
    SetIsStrictCartesianCategory( heyting_algebra, true );
    
    SetIsStrictCocartesianCategory( heyting_algebra, true );
    
    SetIsCartesianClosedCategory( heyting_algebra, true );
    
    ADD_COMMON_METHODS_FOR_LATTICES( heyting_algebra );
    
    ##
    AddIsHomSetInhabited( heyting_algebra,
      function( S, T )
        
        return IsTerminal( ExponentialOnObjects( S, T ) );
        
    end );
    
    ## The cartesian monoidal structure
    
    ## The closedness of the cartesian monoidal structure
    
    ##
    AddExponentialOnMorphismsWithGivenExponentials( heyting_algebra,
      function( S, alpha, beta, R )
        
        return UniqueMorphism( S, R );
        
    end );
    
    ##
    AddCartesianEvaluationMorphismWithGivenSource( heyting_algebra,
      function( A, B, Exp_A_BxA )
        
        return UniqueMorphism( Exp_A_BxA, B);
        
    end );
    
    ##
    AddCartesianCoevaluationMorphismWithGivenRange( heyting_algebra,
      function( A, B, Exp_B_AxB )
        
        return UniqueMorphism( A, Exp_B_AxB );
        
    end );
    
    ##
    AddDirectProductToExponentialAdjunctionMap( heyting_algebra,
      function( A, B, f )
        local L;
        
        L := Range( f );
        
        return UniqueMorphism( A, ExponentialOnObjects( B, L ) );
        
    end );
    
    ##
    AddExponentialToDirectProductAdjunctionMap( heyting_algebra,
      function( B, C, g )
        local A, AB;
        
        A := Source( g );
        
        AB := DirectProduct( A, B );
        
        return UniqueMorphism( AB, C );
        
    end );
    
    ##
    AddCartesianPreComposeMorphismWithGivenObjects( heyting_algebra,
      function( Exp_A_BxExp_B_C, A, B, C, Exp_A_C );
        
        return UniqueMorphism( Exp_A_BxExp_B_C, Exp_A_C );
        
    end );
    
    ##
    AddCartesianPostComposeMorphismWithGivenObjects( heyting_algebra,
      function( Exp_B_CxExp_A_B, A, B, C, Exp_A_C );
        
        return UniqueMorphism( Exp_B_CxExp_A_B, Exp_A_C );
        
    end );
    
    ##
    AddDirectProductExponentialCompatibilityMorphismWithGivenObjects( heyting_algebra,
      function( A1, A2, B1, B2, L )
        
        return UniqueMorphism( L[1], L[2] );
        
    end );
    
    ## The negation
    
    ##
    AddNegationOnObjects( heyting_algebra,
      function( A )
        
        return ExponentialOnObjects( A, InitialObject( heyting_algebra ) );
        
    end );
    
    ##
    AddNegationOnMorphismsWithGivenNegations( heyting_algebra,
      function( B_, u, A_ )
        
        return ExponentialOnMorphismsWithGivenExponentials( B_, u, IdentityMorphism( InitialObject( heyting_algebra ) ), A_ );
        
    end );
    
    ##
    AddMorphismToDoubleNegationWithGivenDoubleNegation( heyting_algebra,
      function( A, B )
        
        return UniqueMorphism( A, B );
        
    end );
    
end );
