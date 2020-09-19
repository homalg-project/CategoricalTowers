#
# Locales: Lattices
#
# Implementations
#

##
InstallMethod( Factors,
        "for an object in a thin category",
        [ IsObjectInThinCategory ],
        
  FactorsAttr );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_CARTESIAN_PREORDERED_SETS,
  function( cartesian_proset )
    
    ADD_COMMON_METHODS_FOR_PREORDERED_SETS( cartesian_proset );
    
    SetIsCartesianCategory( cartesian_proset, true );
    
    ##
    AddProjectionInFactorOfDirectProductWithGivenDirectProduct( cartesian_proset,
      function( D, k, P )
        
        return UniqueMorphism( P, D[k] );
        
    end );
    
    ##
    AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( cartesian_proset,
      function( D, tau, P )
        
        return UniqueMorphism( Source( tau[1] ), P );
        
    end );
    
    ##
    AddDirectProductFunctorialWithGivenDirectProducts( cartesian_proset,
      function( s, L, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
    ##
    AddCartesianAssociatorRightToLeftWithGivenDirectProducts( cartesian_proset,
      function( s, a, b, c, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
    ##
    AddCartesianAssociatorLeftToRightWithGivenDirectProducts( cartesian_proset,
      function( s, a, b, c, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
    ##
    AddCartesianLeftUnitorWithGivenDirectProduct( cartesian_proset,
      function( M, TM )
        
        return UniqueMorphism( TM, M );
        
    end );
    
    ##
    AddCartesianLeftUnitorInverseWithGivenDirectProduct( cartesian_proset,
      function( M, TM )
        
        return UniqueMorphism( M, TM );
        
    end );
    
    ##
    AddCartesianRightUnitorWithGivenDirectProduct( cartesian_proset,
      function( M, MT )
        
        return UniqueMorphism( MT, M );
        
    end );
    
    ##
    AddCartesianRightUnitorInverseWithGivenDirectProduct( cartesian_proset,
      function( M, MT )
        
        return UniqueMorphism( M, MT );
        
    end );
    
    ##
    AddCartesianBraidingWithGivenDirectProducts( cartesian_proset,
      function( MN, M, N, NM )
        
        return UniqueMorphism( MN, NM );
        
    end );
    
    ##
    AddCartesianBraidingInverseWithGivenDirectProducts( cartesian_proset,
      function( NM, M, N, MN )
        
        return UniqueMorphism( NM, MN );
        
    end );
    
end );

##
AddDerivationToCAP( IsHomSetInhabited,
        [ [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ],
          [ DirectProduct, 1 ] ],
        
  function( S, T )
    
    return AreIsomorphicForObjectsIfIsHomSetInhabited( DirectProduct( S, T ), S );
    
end : Description := "IsHomSetInhabited using AreIsomorphicForObjectsIfIsHomSetInhabited and DirectProduct",
      CategoryFilter := IsThinCategory and IsCartesianCategory );

##
AddDerivationToCAP( IsTerminal,
        [ [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ],
          [ TerminalObject, 1 ] ],
        
  function( A )
    
    return AreIsomorphicForObjectsIfIsHomSetInhabited( A, TerminalObject( A ) );
    
end : Description := "IsTerminal using AreIsomorphicForObjectsIfIsHomSetInhabited and TerminalObject",
      CategoryFilter := IsThinCategory and IsCartesianCategory );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_MEET_SEMILATTICES,
  function( meet_semilattice )
    
    ADD_COMMON_METHODS_FOR_CARTESIAN_PREORDERED_SETS( meet_semilattice );
    
    ADD_COMMON_METHODS_FOR_POSETS( meet_semilattice );
    
end );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_COCARTESIAN_PREORDERED_SETS,
  function( cocartesian_proset )
    
    ADD_COMMON_METHODS_FOR_PREORDERED_SETS( cocartesian_proset );
    
    SetIsCocartesianCategory( cocartesian_proset, true );
    
    ##
    AddInjectionOfCofactorOfCoproductWithGivenCoproduct( cocartesian_proset,
      function( D, k, I )
        
        return UniqueMorphism( D[k], I );
        
    end );
    
    ##
    AddUniversalMorphismFromCoproductWithGivenCoproduct( cocartesian_proset,
      function( D, tau, I )
        
        return UniqueMorphism( I, Range( tau[1] ) );
        
    end );
    
    ##
    AddCoproductFunctorialWithGivenCoproducts( cocartesian_proset,
      function( s, L, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
    ##
    AddCocartesianAssociatorRightToLeftWithGivenCoproducts( cocartesian_proset,
      function( s, a, b, c, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
    ##
    AddCocartesianAssociatorLeftToRightWithGivenCoproducts( cocartesian_proset,
      function( s, a, b, c, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
    ##
    AddCocartesianLeftUnitorWithGivenCoproduct( cocartesian_proset,
      function( M, TM )
        
        return UniqueMorphism( TM, M );
        
    end );
    
    ##
    AddCocartesianLeftUnitorInverseWithGivenCoproduct( cocartesian_proset,
      function( M, TM )
        
        return UniqueMorphism( M, TM );
        
    end );
    
    ##
    AddCocartesianRightUnitorWithGivenCoproduct( cocartesian_proset,
      function( M, MT )
        
        return UniqueMorphism( MT, M );
        
    end );
    
    ##
    AddCocartesianRightUnitorInverseWithGivenCoproduct( cocartesian_proset,
      function( M, MT )
        
        return UniqueMorphism( M, MT );
        
    end );
    
    ##
    AddCocartesianBraidingWithGivenCoproducts( cocartesian_proset,
      function( MN, M, N, NM )
        
        return UniqueMorphism( MN, NM );
        
    end );
    
    ##
    AddCocartesianBraidingInverseWithGivenCoproducts( cocartesian_proset,
      function( NM, M, N, MN )
        
        return UniqueMorphism( NM, MN );
        
    end );
    
end );

##
AddDerivationToCAP( IsHomSetInhabited,
        [ [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ],
          [ Coproduct, 1 ], ],
        
  function( S, T )
    
    return AreIsomorphicForObjectsIfIsHomSetInhabited( T, Coproduct( S, T ) );
    
end : Description := "IsHomSetInhabited using AreIsomorphicForObjectsIfIsHomSetInhabited and Coproduct",
      CategoryFilter := IsThinCategory and IsCocartesianCategory );

##
AddDerivationToCAP( IsInitial,
        [ [ AreIsomorphicForObjectsIfIsHomSetInhabited, 1 ],
          [ InitialObject, 1 ] ],
        
  function( A )
    
    return AreIsomorphicForObjectsIfIsHomSetInhabited( InitialObject( A ), A );
    
end : Description := "IsInitial using AreIsomorphicForObjectsIfIsHomSetInhabited and InitialObject",
      CategoryFilter := IsThinCategory and IsCocartesianCategory );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_JOIN_SEMILATTICES,
  function( join_semilattice )
    
    ADD_COMMON_METHODS_FOR_COCARTESIAN_PREORDERED_SETS( join_semilattice );
    
    ADD_COMMON_METHODS_FOR_POSETS( join_semilattice );
    
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
InstallMethod( \=,
        "for an object in a thin category and the integer one",
        [ IsObjectInThinCategory, IsPosInt ],
        
  function( A, T )
    
    if not T = 1 then
        TryNextMethod( );
    fi;
    
    return IsTerminal( A );
    
end );

##
InstallMethod( \=,
        "for the integer one and an object in a thin category",
        [ IsPosInt, IsObjectInThinCategory ],
        
  function( T, A )
    
    return A = T;
    
end );

##
InstallMethod( \=,
        "for an object in a thin category and the zero integer",
        [ IsObjectInThinCategory, IsInt and IsZero ],
        
  function( A, I )
    
    return IsInitial( A );
    
end );

##
InstallMethod( \=,
        "for the zero integer and an object in a thin category",
        [ IsInt and IsZero, IsObjectInThinCategory ],
        
  function( I, A )
    
    return A = I;
    
end );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_LATTICES,
  function( lattice )
    
    ADD_COMMON_METHODS_FOR_MEET_SEMILATTICES( lattice );
    
    ADD_COMMON_METHODS_FOR_JOIN_SEMILATTICES( lattice );
    
end );
