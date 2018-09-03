#
# Locales: Lattices
#
# Implementations
#

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_MEET_SEMILATTICES,
  function( meet_semilattice )
    
    ADD_COMMON_METHODS_FOR_POSETS( meet_semilattice );
    
    ##
    AddIsHomSetInhabited( meet_semilattice,
      function( S, T )
        
        return IsEqualForObjects( DirectProduct( S, T ), S );
        
    end );
    
    ##
    AddProjectionInFactorOfDirectProductWithGivenDirectProduct( meet_semilattice,
      function( D, k, P )
        
        return UniqueMorphism( P, D[k] );
        
    end );
    
    ##
    AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( meet_semilattice,
      function( D, tau, P )
        
        return UniqueMorphism( Source( tau[1] ), P );
        
    end );
    
    ##
    AddDirectProductFunctorialWithGivenDirectProducts( meet_semilattice,
      function( s, L, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
end );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_JOIN_SEMILATTICES,
  function( join_semilattice )
    
    ADD_COMMON_METHODS_FOR_POSETS( join_semilattice );
    
    ##
    AddIsHomSetInhabited( join_semilattice,
      function( S, T )
        
        return IsEqualForObjects( Coproduct( S, T ), T );
        
    end );
    
    ##
    AddInjectionOfCofactorOfCoproductWithGivenCoproduct( join_semilattice,
      function( D, k, I )
        
        return UniqueMorphism( D[k], I );
        
    end );
    
    ##
    AddUniversalMorphismFromCoproductWithGivenCoproduct( join_semilattice,
      function( D, tau, I )
        
        return UniqueMorphism( I, Range( tau[1] ) );
        
    end );
    
    ##
    AddCoproductFunctorialWithGivenCoproducts( join_semilattice,
      function( s, L, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
end );

##
InstallMethod( \*,
        "for two objects in join-semilattice",
        [ IsObjectInThinCategory, IsObjectInThinCategory ],

  DirectProduct );

##
InstallMethod( \+,
        "for two objects in meet-semilattice",
        [ IsObjectInThinCategory, IsObjectInThinCategory ],

  Coproduct );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_LATTICES,
  function( lattice )
    
    ADD_COMMON_METHODS_FOR_MEET_SEMILATTICES( lattice );
    
    ADD_COMMON_METHODS_FOR_JOIN_SEMILATTICES( lattice );
    
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
