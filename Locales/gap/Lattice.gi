# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

## thin

InstallTrueMethod( IsCartesianProset, IsThinCategory and IsCartesianCategory );
InstallTrueMethod( IsThinCategory, IsCartesianProset );
InstallTrueMethod( IsCartesianCategory, IsCartesianProset );
InstallTrueMethod( IsFiniteCompleteCategory, IsCartesianProset );

InstallTrueMethod( IsCocartesianProset, IsThinCategory and IsCocartesianCategory );
InstallTrueMethod( IsThinCategory, IsCocartesianProset );
InstallTrueMethod( IsCocartesianCategory, IsCocartesianProset );
InstallTrueMethod( IsFiniteCocompleteCategory, IsCocartesianProset );

InstallTrueMethod( IsBicartesianProset, IsCartesianProset and IsCocartesianProset );
InstallTrueMethod( IsCartesianProset, IsBicartesianProset );
InstallTrueMethod( IsCocartesianProset, IsBicartesianProset );

InstallTrueMethod( IsDistributiveBicartesianProset, IsBicartesianProset and IsDistributiveCategory );
InstallTrueMethod( IsDistributiveBicartesianProset, IsBicartesianProset and IsCodistributiveCategory );
InstallTrueMethod( IsBicartesianProset, IsDistributiveBicartesianProset );
InstallTrueMethod( IsDistributiveCategory, IsDistributiveBicartesianProset );
InstallTrueMethod( IsCodistributiveCategory, IsDistributiveBicartesianProset );

## thin & skeletal

InstallTrueMethod( IsStrictCartesianCategory, IsPosetCategory and IsCartesianCategory );
InstallTrueMethod( IsStrictCocartesianCategory, IsPosetCategory and IsCocartesianCategory );

InstallTrueMethod( IsMeetSemiLattice, IsCartesianProset and IsSkeletalCategory );
InstallTrueMethod( IsCartesianCategory, IsMeetSemiLattice );
InstallTrueMethod( IsSkeletalCategory, IsMeetSemiLattice );

InstallTrueMethod( IsJoinSemiLattice, IsCocartesianProset and IsSkeletalCategory );
InstallTrueMethod( IsCocartesianProset, IsJoinSemiLattice );
InstallTrueMethod( IsSkeletalCategory, IsJoinSemiLattice );

InstallTrueMethod( IsLattice, IsMeetSemiLattice and IsJoinSemiLattice );
InstallTrueMethod( IsMeetSemiLattice, IsLattice );
InstallTrueMethod( IsJoinSemiLattice, IsLattice );

InstallTrueMethod( IsDistributiveLattice, IsDistributiveBicartesianProset and IsSkeletalCategory );
InstallTrueMethod( IsDistributiveBicartesianProset, IsDistributiveLattice );
InstallTrueMethod( IsSkeletalCategory, IsDistributiveLattice );

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
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_CARTESIAN_PREORDERED_SETS,
  function( cartesian_proset )
    
    SetIsCartesianCategory( cartesian_proset, true );
    
    ADD_COMMON_METHODS_FOR_PREORDERED_SETS( cartesian_proset );
    
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
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_LATTICES,
  function( lattice )
    
    SetIsStrictCartesianCategory( lattice, true );
    
    SetIsStrictCocartesianCategory( lattice, true );
    
    ADD_COMMON_METHODS_FOR_MEET_SEMILATTICES( lattice );
    
    ADD_COMMON_METHODS_FOR_JOIN_SEMILATTICES( lattice );
    
end );

##
InstallMethod( Factors,
        "for an object in a thin category",
        [ IsObjectInThinCategory ],
        
  FactorsAttr );

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
