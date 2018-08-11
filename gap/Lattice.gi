#
# Locales: Lattices
#
# Implementations
#

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_LATTICES,
  function( lattice )
    
    ADD_COMMON_METHODS_FOR_POSETS( lattice );
    
    ##
    AddProjectionInFactorOfDirectProductWithGivenDirectProduct( lattice,
      function( D, k, P )
        
        return UniqueMorphism( P, D[k] );
        
    end );
    
    ##
    AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( lattice,
      function( D, tau, P )
        
        return UniqueMorphism( Source( tau[1] ), P );
        
    end );
    
    ##
    AddDirectProductFunctorialWithGivenDirectProducts( lattice,
      function( s, L, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
    ##
    AddInjectionOfCofactorOfCoproductWithGivenCoproduct( lattice,
      function( D, k, I )
        
        return UniqueMorphism( D[k], I );
        
    end );
    
    ##
    AddUniversalMorphismFromCoproductWithGivenCoproduct( lattice,
      function( D, tau, I )
        
        return UniqueMorphism( I, Range( tau[1] ) );
        
    end );
    
    ##
    AddCoproductFunctorialWithGivenCoproducts( lattice,
      function( s, L, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
    ## a cartesian or cocartesian monoidal structure
    
    ##
    AddLeftUnitorWithGivenTensorProduct( lattice,
      function( M, TM )
        
        return UniqueMorphism( TM, M );
        
    end );
    
    ##
    AddLeftUnitorInverseWithGivenTensorProduct( lattice,
      function( M, TM )
        
        return UniqueMorphism( M, TM );
        
    end );
    
    ##
    AddRightUnitorWithGivenTensorProduct( lattice,
      function( M, MT )
        
        return UniqueMorphism( MT, M );
        
    end );
    
    ##
    AddRightUnitorInverseWithGivenTensorProduct( lattice,
      function( M, MT )
        
        return UniqueMorphism( M, MT );
        
    end );
    
    ##
    AddBraidingInverseWithGivenTensorProducts( lattice,
      function( MN, M, N, NM )
        
        return UniqueMorphism( MN, NM );
        
    end );
    
end );
