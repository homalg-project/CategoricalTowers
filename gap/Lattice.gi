#
# Locales: Lattices
#
# Implementations
#

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_MEET_SEMILATTICES,
  function( meet_semilattice )
    
    SetIsCartesianCategory( meet_semilattice, true );
    
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
    
    ##
    AddCartesianAssociatorRightToLeftWithGivenDirectProducts( meet_semilattice,
      function( s, a, b, c, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
    ##
    AddCartesianAssociatorLeftToRightWithGivenDirectProducts( meet_semilattice,
      function( s, a, b, c, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
    ##
    AddCartesianLeftUnitorWithGivenDirectProduct( meet_semilattice,
      function( M, TM )
        
        return UniqueMorphism( TM, M );
        
    end );
    
    ##
    AddCartesianLeftUnitorInverseWithGivenDirectProduct( meet_semilattice,
      function( M, TM )
        
        return UniqueMorphism( M, TM );
        
    end );
    
    ##
    AddCartesianRightUnitorWithGivenDirectProduct( meet_semilattice,
      function( M, MT )
        
        return UniqueMorphism( MT, M );
        
    end );
    
    ##
    AddCartesianRightUnitorInverseWithGivenDirectProduct( meet_semilattice,
      function( M, MT )
        
        return UniqueMorphism( M, MT );
        
    end );
    
    ##
    AddCartesianBraidingWithGivenDirectProducts( meet_semilattice,
      function( MN, M, N, NM )
        
        return UniqueMorphism( MN, NM );
        
    end );
    
    ##
    AddCartesianBraidingInverseWithGivenDirectProducts( meet_semilattice,
      function( NM, M, N, MN )
        
        return UniqueMorphism( NM, MN );
        
    end );
    
end );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_JOIN_SEMILATTICES,
  function( join_semilattice )
    
    SetIsCocartesianCategory( join_semilattice, true );
    
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
    
    ##
    AddCocartesianAssociatorRightToLeftWithGivenCoproducts( join_semilattice,
      function( s, a, b, c, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
    ##
    AddCocartesianAssociatorLeftToRightWithGivenCoproducts( join_semilattice,
      function( s, a, b, c, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
    ##
    AddCocartesianLeftUnitorWithGivenCoproduct( join_semilattice,
      function( M, TM )
        
        return UniqueMorphism( TM, M );
        
    end );
    
    ##
    AddCocartesianLeftUnitorInverseWithGivenCoproduct( join_semilattice,
      function( M, TM )
        
        return UniqueMorphism( M, TM );
        
    end );
    
    ##
    AddCocartesianRightUnitorWithGivenCoproduct( join_semilattice,
      function( M, MT )
        
        return UniqueMorphism( MT, M );
        
    end );
    
    ##
    AddCocartesianRightUnitorInverseWithGivenCoproduct( join_semilattice,
      function( M, MT )
        
        return UniqueMorphism( M, MT );
        
    end );
    
    ##
    AddCocartesianBraidingWithGivenCoproducts( join_semilattice,
      function( MN, M, N, NM )
        
        return UniqueMorphism( MN, NM );
        
    end );
    
    ##
    AddCocartesianBraidingInverseWithGivenCoproducts( join_semilattice,
      function( NM, M, N, MN )
        
        return UniqueMorphism( NM, MN );
        
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
    
end );
