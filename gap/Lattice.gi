# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

InstallTrueMethod( IsMeetSemiLattice, IsPosetCategory and IsStrictCartesianCategory );
InstallTrueMethod( IsPosetCategory, IsMeetSemiLattice );
InstallTrueMethod( IsStrictCartesianCategory, IsMeetSemiLattice );

InstallTrueMethod( IsJoinSemiLattice, IsPosetCategory and IsStrictCocartesianCategory );
InstallTrueMethod( IsPosetCategory, IsJoinSemiLattice );
InstallTrueMethod( IsStrictCocartesianCategory, IsJoinSemiLattice );

InstallTrueMethod( IsLattice, IsMeetSemiLattice and IsJoinSemiLattice );
InstallTrueMethod( IsMeetSemiLattice, IsLattice );
InstallTrueMethod( IsJoinSemiLattice, IsLattice );

InstallTrueMethod( IsDistributiveLattice, IsLattice and IsDistributiveCartesianCategory and IsCodistributiveCocartesianCategory );
InstallTrueMethod( IsLattice, IsDistributiveLattice );
InstallTrueMethod( IsDistributiveCartesianCategory, IsDistributiveLattice );
InstallTrueMethod( IsCodistributiveCocartesianCategory, IsDistributiveLattice );

InstallTrueMethod( IsMonoidalLattice, IsLattice and IsStrictMonoidalCategory );
InstallTrueMethod( IsLattice, IsMonoidalLattice );
InstallTrueMethod( IsStrictMonoidalCategory, IsMonoidalLattice );

InstallTrueMethod( IsClosedMonoidalLattice, IsMonoidalLattice and IsClosedMonoidalCategory );
InstallTrueMethod( IsMonoidalLattice, IsClosedMonoidalLattice );
InstallTrueMethod( IsClosedMonoidalCategory, IsClosedMonoidalLattice );

InstallTrueMethod( IsCoclosedMonoidalLattice, IsMonoidalLattice and IsCoclosedMonoidalCategory );
InstallTrueMethod( IsMonoidalLattice, IsCoclosedMonoidalLattice );
InstallTrueMethod( IsCoclosedMonoidalCategory, IsCoclosedMonoidalLattice );

##
InstallMethod( Factors,
        "for an object in a thin category",
        [ IsObjectInThinCategory ],
        
  FactorsAttr );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_CARTESIAN_PREORDERED_SETS,
  function( cartesian_proset )
    
    SetIsCartesianCategory( cartesian_proset, true );
    
    ADD_COMMON_METHODS_FOR_PREORDERED_SETS( cartesian_proset );
    
    ##
    AddProjectionInFactorOfDirectProductWithGivenDirectProduct( cartesian_proset,
      function( cat, D, k, P )
        
        return UniqueMorphism( cat, P, D[k] );
        
    end );
    
    ##
    AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( cartesian_proset,
      function( cat, D, test_object, tau, P )
        
        return UniqueMorphism( cat, Source( tau[1] ), P );
        
    end );
    
    ##
    AddDirectProductFunctorialWithGivenDirectProducts( cartesian_proset,
      function( cat, s, source_diagram, L, range_diagram, r )
        
        return UniqueMorphism( cat, s, r );
        
    end );
    
    ##
    AddCartesianAssociatorRightToLeftWithGivenDirectProducts( cartesian_proset,
      function( cat, s, a, b, c, r )
        
        return UniqueMorphism( cat, s, r );
        
    end );
    
    ##
    AddCartesianAssociatorLeftToRightWithGivenDirectProducts( cartesian_proset,
      function( cat, s, a, b, c, r )
        
        return UniqueMorphism( cat, s, r );
        
    end );
    
    ##
    AddCartesianLeftUnitorWithGivenDirectProduct( cartesian_proset,
      function( cat, M, TM )
        
        return UniqueMorphism( cat, TM, M );
        
    end );
    
    ##
    AddCartesianLeftUnitorInverseWithGivenDirectProduct( cartesian_proset,
      function( cat, M, TM )
        
        return UniqueMorphism( cat, M, TM );
        
    end );
    
    ##
    AddCartesianRightUnitorWithGivenDirectProduct( cartesian_proset,
      function( cat, M, MT )
        
        return UniqueMorphism( cat, MT, M );
        
    end );
    
    ##
    AddCartesianRightUnitorInverseWithGivenDirectProduct( cartesian_proset,
      function( cat, M, MT )
        
        return UniqueMorphism( cat, M, MT );
        
    end );
    
    ##
    AddCartesianBraidingWithGivenDirectProducts( cartesian_proset,
      function( cat, MN, M, N, NM )
        
        return UniqueMorphism( cat, MN, NM );
        
    end );
    
    ##
    AddCartesianBraidingInverseWithGivenDirectProducts( cartesian_proset,
      function( cat, NM, M, N, MN )
        
        return UniqueMorphism( cat, NM, MN );
        
    end );
    
end );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_MEET_SEMILATTICES,
  function( meet_semilattice )
    
    SetIsSkeletalCategory( meet_semilattice, true );
    
    SetIsStrictCartesianCategory( meet_semilattice, true );
    
    ADD_COMMON_METHODS_FOR_CARTESIAN_PREORDERED_SETS( meet_semilattice );
    
    ADD_COMMON_METHODS_FOR_POSETS( meet_semilattice );
    
end );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_COCARTESIAN_PREORDERED_SETS,
  function( cocartesian_proset )
    
    SetIsCocartesianCategory( cocartesian_proset, true );
    
    ADD_COMMON_METHODS_FOR_PREORDERED_SETS( cocartesian_proset );
    
    ##
    AddInjectionOfCofactorOfCoproductWithGivenCoproduct( cocartesian_proset,
      function( cat, D, k, I )
        
        return UniqueMorphism( cat, D[k], I );
        
    end );
    
    ##
    AddUniversalMorphismFromCoproductWithGivenCoproduct( cocartesian_proset,
      function( cat, D, test_object, tau, I )
        
        return UniqueMorphism( cat, I, Range( tau[1] ) );
        
    end );
    
    ##
    AddCoproductFunctorialWithGivenCoproducts( cocartesian_proset,
      function( cat, s, source_diagram, L, range_diagram, r )
        
        return UniqueMorphism( cat, s, r );
        
    end );
    
    ##
    AddCocartesianAssociatorRightToLeftWithGivenCoproducts( cocartesian_proset,
      function( cat, s, a, b, c, r )
        
        return UniqueMorphism( cat, s, r );
        
    end );
    
    ##
    AddCocartesianAssociatorLeftToRightWithGivenCoproducts( cocartesian_proset,
      function( cat, s, a, b, c, r )
        
        return UniqueMorphism( cat, s, r );
        
    end );
    
    ##
    AddCocartesianLeftUnitorWithGivenCoproduct( cocartesian_proset,
      function( cat, M, TM )
        
        return UniqueMorphism( cat, TM, M );
        
    end );
    
    ##
    AddCocartesianLeftUnitorInverseWithGivenCoproduct( cocartesian_proset,
      function( cat, M, TM )
        
        return UniqueMorphism( cat, M, TM );
        
    end );
    
    ##
    AddCocartesianRightUnitorWithGivenCoproduct( cocartesian_proset,
      function( cat, M, MT )
        
        return UniqueMorphism( cat, MT, M );
        
    end );
    
    ##
    AddCocartesianRightUnitorInverseWithGivenCoproduct( cocartesian_proset,
      function( cat, M, MT )
        
        return UniqueMorphism( cat, M, MT );
        
    end );
    
    ##
    AddCocartesianBraidingWithGivenCoproducts( cocartesian_proset,
      function( cat, MN, M, N, NM )
        
        return UniqueMorphism( cat, MN, NM );
        
    end );
    
    ##
    AddCocartesianBraidingInverseWithGivenCoproducts( cocartesian_proset,
      function( cat, NM, M, N, MN )
        
        return UniqueMorphism( cat, NM, MN );
        
    end );
    
end );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_JOIN_SEMILATTICES,
  function( join_semilattice )
    
    SetIsSkeletalCategory( join_semilattice, true );
    
    SetIsStrictCocartesianCategory( join_semilattice, true );
    
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
    
    SetIsStrictCartesianCategory( lattice, true );
    
    SetIsStrictCocartesianCategory( lattice, true );
    
    ADD_COMMON_METHODS_FOR_MEET_SEMILATTICES( lattice );
    
    ADD_COMMON_METHODS_FOR_JOIN_SEMILATTICES( lattice );
    
end );
