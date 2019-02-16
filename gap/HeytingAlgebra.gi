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
    
    SetIsCartesianClosedCategory( heyting_algebra, true );
    
    SetIsStrictMonoidalCategory( heyting_algebra, true );
    
    ADD_COMMON_METHODS_FOR_LATTICES( heyting_algebra );
    
    ## The cartesian monoidal structure
    
    ## The closedness of the cartesian monoidal structure
    
    ##
    AddExponentialOnMorphismsWithGivenExponentials( heyting_algebra,
      function( S, alpha, beta, T )
        
        return UniqueMorphism( S, T );
        
    end );
    
    ##
    AddEvaluationMorphismWithGivenSource( heyting_algebra,
      function( M, N, HM_NxM )
        
        return UniqueMorphism( HM_NxM, N );
        
    end );
    
    ##
    AddCoevaluationMorphismWithGivenRange( heyting_algebra,
      function( M, N, HN_MxN )
        
        return UniqueMorphism( M, HN_MxN );
        
    end );
    
    ##
    AddDirectProductToExponentialAdjunctionMap( heyting_algebra,
      function( M, N, f )
        local L;
        
        L := Range( f );
        
        return UniqueMorphism( M, ExponentialOnObjects( N, L ) );
        
    end );
    
    ##
    AddExponentialToDirectProductAdjunctionMap( heyting_algebra,
      function( N, L, g )
        local M, MN;
        
        M := Source( g );
        
        MN := DirectProduct( M, N );
        
        return UniqueMorphism( MN, L );
        
    end );
    
    ##
    AddCartesianPreComposeMorphismWithGivenObjects( heyting_algebra,
      function( HM_NxH_N_L, M, N, L, HM_L );
        
        return UniqueMorphism( HM_NxH_N_L, HM_L );
        
    end );
    
    ##
    AddCartesianPostComposeMorphismWithGivenObjects( heyting_algebra,
      function( HM_NxH_N_L, M, N, L, HM_L );
        
        return UniqueMorphism( HM_NxH_N_L, HM_L );
        
    end );
    
    ##
    AddDirectProductExponentialCompatibilityMorphismWithGivenObjects( heyting_algebra,
      function( S1, T1, S2, T2, L )
        
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
