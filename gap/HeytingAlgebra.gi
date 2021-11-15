# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

InstallValue( HEYTING_ALGEBRA_METHOD_NAME_RECORD,
        rec(
NegationOnObjects := rec(
  installation_name := "NegationOnObjects",
  filter_list := [ "category", "object" ],
  io_type := [ [ "a" ], [ "an" ] ],
  cache_name := "NegationOnObjects",
  return_type := "object" ),

NegationOnMorphismsWithGivenNegations := rec(
  installation_name := "NegationOnMorphismsWithGivenNegations",
  io_type := [ [ "s", "alpha", "r" ], [ "s", "r" ] ],
  filter_list := [ "category", "object", "morphism", "object" ],
  cache_name := "NegationOnMorphismsWithGivenNegations",
  return_type := "morphism" ),

MorphismToDoubleNegationWithGivenDoubleNegation := rec(
  installation_name := "MorphismToDoubleNegationWithGivenDoubleNegation",
  filter_list := [ "category", "object", "object" ],
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
    
    ADD_COMMON_METHODS_FOR_LATTICES( heyting_algebra );
    
    ## The cartesian monoidal structure
    
    ## The closedness of the cartesian monoidal structure
    
    ##
    AddExponentialOnMorphismsWithGivenExponentials( heyting_algebra,
      function( cat, S, alpha, beta, R )
        
        return UniqueMorphism( S, R );
        
    end );
    
    ##
    AddCartesianEvaluationMorphismWithGivenSource( heyting_algebra,
      function( cat, A, B, Exp_A_BxA )
        
        return UniqueMorphism( Exp_A_BxA, B);
        
    end );
    
    ##
    AddCartesianCoevaluationMorphismWithGivenRange( heyting_algebra,
      function( cat, A, B, Exp_B_AxB )
        
        return UniqueMorphism( A, Exp_B_AxB );
        
    end );
    
    ##
    AddDirectProductToExponentialAdjunctionMap( heyting_algebra,
      function( cat, A, B, f )
        local L;
        
        L := Range( f );
        
        return UniqueMorphism( A, ExponentialOnObjects( B, L ) );
        
    end );
    
    ##
    AddExponentialToDirectProductAdjunctionMap( heyting_algebra,
      function( cat, B, C, g )
        local A, AB;
        
        A := Source( g );
        
        AB := DirectProduct( A, B );
        
        return UniqueMorphism( AB, C );
        
    end );
    
    ##
    AddCartesianPreComposeMorphismWithGivenObjects( heyting_algebra,
      function( cat, Exp_A_BxExp_B_C, A, B, C, Exp_A_C );
        
        return UniqueMorphism( Exp_A_BxExp_B_C, Exp_A_C );
        
    end );
    
    ##
    AddCartesianPostComposeMorphismWithGivenObjects( heyting_algebra,
      function( cat, Exp_B_CxExp_A_B, A, B, C, Exp_A_C );
        
        return UniqueMorphism( Exp_B_CxExp_A_B, Exp_A_C );
        
    end );
    
    ##
    AddDirectProductExponentialCompatibilityMorphismWithGivenObjects( heyting_algebra,
      function( cat, source, L, range )
        
        return UniqueMorphism( source, range );
        
    end );
    
    ## The negation
    
    ##
    AddMorphismToDoubleNegationWithGivenDoubleNegation( heyting_algebra,
      function( cat, A, B )
        
        return UniqueMorphism( A, B );
        
    end );
    
end );

## IsTerminal( Exp( S, T ) ) <=(thin)=> TerminalObject ≤ Hom( S, T ) <=(cart. closed)=> ( TerminalObject ∧ S ) ≤ T <==> S ≤ T
AddDerivationToCAP( IsHomSetInhabited,
        [ [ IsTerminal, 1 ],
          [ ExponentialOnObjects, 1 ] ],
        
  function( cat, S, T )
    
    return IsTerminal( cat, ExponentialOnObjects( cat, S, T ) );
    
end : Description := "IsHomSetInhabited using IsTerminal and ExponentialOnObjects",
      CategoryFilter := IsThinCategory and IsCartesianClosedCategory );

##
AddDerivationToCAP( NegationOnObjects,
        [ [ ExponentialOnObjects, 1 ],
          [ InitialObject, 1 ] ],
        
  function( cat, A )
    
    return ExponentialOnObjects( cat, A, InitialObject( cat ) );
    
end : Description := "NegationOnObjects using ExponentialOnObjects and InitialObject",
      CategoryFilter := IsThinCategory and IsCartesianClosedCategory );

##
AddDerivationToCAP( NegationOnMorphismsWithGivenNegations,
        [ [ ExponentialOnMorphismsWithGivenExponentials, 1 ],
          [ IdentityMorphism, 1 ],
          [ InitialObject, 1 ] ],
        
  function( cat, B_, u, A_ )
    
    return ExponentialOnMorphismsWithGivenExponentials( cat, B_, u, IdentityMorphism( cat, InitialObject( cat ) ), A_ );
    
end : Description := "NegationOnMorphismsWithGivenNegations using ExponentialOnMorphismsWithGivenExponentials and IdentityMorphism and InitialObject",
      CategoryFilter := IsThinCategory and IsCartesianCategory and IsCocartesianCategory and IsCartesianClosedCategory );

##
InstallMethod( StableInternalHom,
        "for two objects in a thin category",
        [ IsObjectInThinCategory, IsObjectInThinCategory ],
    { J, I } -> StableInternalHom( CapCategory( J ), J, I )
   );

##
InstallOtherMethodForCompilerForCAP( StableInternalHom,
        [ IsCapCategory, IsObjectInThinCategory, IsObjectInThinCategory ],
  function( cat, J, I )
    
    return CapFixpoint(
        { x, y } -> AreIsomorphicForObjectsIfIsHomSetInhabited( cat, x, y ),
        x -> InternalHomOnObjects( cat, J, x ),
        I
    );
    
end );
