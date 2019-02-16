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
    
    SetIsStrictMonoidalCategory( coheyting_algebra, true );
    
    ADD_COMMON_METHODS_FOR_LATTICES( coheyting_algebra );
    
    ## The cocartesian monoidal structure
    
    ## The coclosedness of the cocartesian monoidal structure
    
    ##
    AddCoexponentialOnMorphismsWithGivenCoexponentials( coheyting_algebra,
      function( S, alpha, beta, T )
        
        return UniqueMorphism( S, T );
        
    end );
    
    ## The co-negation
    
    ##
    AddConegationOnObjects( coheyting_algebra,
      function( A )
        
        return CoexponentialOnObjects( TerminalObject( coheyting_algebra ), A );
        
    end );
    
    ##
    AddConegationOnMorphismsWithGivenConegations( coheyting_algebra,
      function( B_, u, A_ )
        
        return CoexponentialOnMorphismsWithGivenCoexponentials( B_, IdentityMorphism( TerminalObject( coheyting_algebra ) ), u, A_ );
        
    end );
    
    ##
    AddMorphismFromDoubleConegationWithGivenDoubleConegation( coheyting_algebra,
      function( A, B )
        
        return UniqueMorphism( A, B );
        
    end );
    
end );
