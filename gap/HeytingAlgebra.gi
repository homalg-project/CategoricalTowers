# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

## thin

InstallTrueMethod( IsHeytingAlgebroid, IsBicartesianProset and IsCartesianClosedCategory );
InstallTrueMethod( IsBicartesianProset, IsHeytingAlgebroid );
InstallTrueMethod( IsCartesianClosedCategory, IsHeytingAlgebroid );

## thin & skeletal

InstallTrueMethod( IsHeytingAlgebra, IsHeytingAlgebroid and IsSkeletalCategory );
InstallTrueMethod( IsHeytingAlgebroid, IsHeytingAlgebra );
InstallTrueMethod( IsSkeletalCategory, IsHeytingAlgebra );

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
        
        return UniqueMorphism( cat, S, R );
        
    end );
    
    ##
    AddCartesianEvaluationMorphismWithGivenSource( heyting_algebra,
      function( cat, A, B, Exp_A_BxA )
        
        return UniqueMorphism( cat, Exp_A_BxA, B);
        
    end );
    
    ##
    AddCartesianCoevaluationMorphismWithGivenRange( heyting_algebra,
      function( cat, A, B, Exp_B_AxB )
        
        return UniqueMorphism( cat, A, Exp_B_AxB );
        
    end );
    
    ##
    if CanCompute( heyting_algebra, "ExponentialOnObjects" ) then
        
        AddDirectProductToExponentialAdjunctionMap( heyting_algebra,
          function( cat, A, B, f )
            local C;
            
            C := Range( f );
            
            return UniqueMorphism( cat, A, ExponentialOnObjects( cat, B, C ) );
            
        end );
        
    fi;
    
    ##
    AddExponentialToDirectProductAdjunctionMap( heyting_algebra,
      function( cat, B, C, g )
        local A;
        
        A := Source( g );
        
        return UniqueMorphism( cat, DirectProduct( cat, [ A, B ] ), C );
        
    end );
    
    ##
    AddCartesianPreComposeMorphismWithGivenObjects( heyting_algebra,
      function( cat, Exp_A_BxExp_B_C, A, B, C, Exp_A_C )
        
        return UniqueMorphism( cat, Exp_A_BxExp_B_C, Exp_A_C );
        
    end );
    
    ##
    AddCartesianPostComposeMorphismWithGivenObjects( heyting_algebra,
      function( cat, Exp_B_CxExp_A_B, A, B, C, Exp_A_C )
        
        return UniqueMorphism( cat, Exp_B_CxExp_A_B, Exp_A_C );
        
    end );
    
    ##
    AddDirectProductExponentialCompatibilityMorphismWithGivenObjects( heyting_algebra,
      function( cat, source, L, range )
        
        return UniqueMorphism( cat, source, range );
        
    end );
    
    ## The negation
    
    ##
    AddMorphismToDoubleNegationWithGivenDoubleNegation( heyting_algebra,
      function( cat, A, B )
        
        return UniqueMorphism( cat, A, B );
        
    end );
    
end );

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
