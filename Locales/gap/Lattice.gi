# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

## thin

#= comment for Julia
InstallTrueMethod( IsCartesianProset, IsThinCategory and IsCartesianCategory );
# =#
InstallTrueMethod( IsThinCategory, IsCartesianProset );
InstallTrueMethod( IsCartesianCategory, IsCartesianProset );
InstallTrueMethod( IsFiniteCompleteCategory, IsCartesianProset );

#= comment for Julia
InstallTrueMethod( IsCocartesianProset, IsThinCategory and IsCocartesianCategory );
# =#
InstallTrueMethod( IsThinCategory, IsCocartesianProset );
InstallTrueMethod( IsCocartesianCategory, IsCocartesianProset );
InstallTrueMethod( IsFiniteCocompleteCategory, IsCocartesianProset );

#= comment for Julia
InstallTrueMethod( IsBicartesianProset, IsCartesianProset and IsCocartesianProset );
# =#
InstallTrueMethod( IsCartesianProset, IsBicartesianProset );
InstallTrueMethod( IsCocartesianProset, IsBicartesianProset );

#= comment for Julia
InstallTrueMethod( IsDistributiveBicartesianProset, IsBicartesianProset and IsDistributiveCategory );
InstallTrueMethod( IsDistributiveBicartesianProset, IsBicartesianProset and IsCodistributiveCategory );
# =#
InstallTrueMethod( IsBicartesianProset, IsDistributiveBicartesianProset );
InstallTrueMethod( IsDistributiveCategory, IsDistributiveBicartesianProset );
InstallTrueMethod( IsCodistributiveCategory, IsDistributiveBicartesianProset );
#= comment for Julia
InstallTrueMethod( IsBiHeytingAlgebroid, IsDistributiveBicartesianProset and IsEquivalentToFiniteCategory );
# =#

## thin & skeletal

#= comment for Julia
InstallTrueMethod( IsStrictCartesianCategory, IsPosetCategory and IsCartesianCategory );
InstallTrueMethod( IsStrictCocartesianCategory, IsPosetCategory and IsCocartesianCategory );
# =#

#= comment for Julia
InstallTrueMethod( IsMeetSemiLattice, IsCartesianProset and IsSkeletalCategory );
# =#
InstallTrueMethod( IsCartesianProset, IsMeetSemiLattice );
InstallTrueMethod( IsSkeletalCategory, IsMeetSemiLattice );

#= comment for Julia
InstallTrueMethod( IsJoinSemiLattice, IsCocartesianProset and IsSkeletalCategory );
# =#
InstallTrueMethod( IsCocartesianProset, IsJoinSemiLattice );
InstallTrueMethod( IsSkeletalCategory, IsJoinSemiLattice );

#= comment for Julia
InstallTrueMethod( IsLattice, IsMeetSemiLattice and IsJoinSemiLattice );
# =#
InstallTrueMethod( IsMeetSemiLattice, IsLattice );
InstallTrueMethod( IsJoinSemiLattice, IsLattice );

#= comment for Julia
InstallTrueMethod( IsDistributiveLattice, IsDistributiveBicartesianProset and IsSkeletalCategory );
# =#
InstallTrueMethod( IsDistributiveBicartesianProset, IsDistributiveLattice );
InstallTrueMethod( IsSkeletalCategory, IsDistributiveLattice );

#= comment for Julia
InstallTrueMethod( IsMonoidalLattice, IsLattice and IsStrictMonoidalCategory );
# =#
InstallTrueMethod( IsLattice, IsMonoidalLattice );
InstallTrueMethod( IsStrictMonoidalCategory, IsMonoidalLattice );

#= comment for Julia
InstallTrueMethod( IsClosedMonoidalLattice, IsMonoidalLattice and IsClosedMonoidalCategory );
# =#
InstallTrueMethod( IsMonoidalLattice, IsClosedMonoidalLattice );
InstallTrueMethod( IsClosedMonoidalCategory, IsClosedMonoidalLattice );

#= comment for Julia
InstallTrueMethod( IsCoclosedMonoidalLattice, IsMonoidalLattice and IsCoclosedMonoidalCategory );
# =#
InstallTrueMethod( IsMonoidalLattice, IsCoclosedMonoidalLattice );
InstallTrueMethod( IsCoclosedMonoidalCategory, IsCoclosedMonoidalLattice );

#= comment for Julia
InstallTrueMethod( IsSymmetricMonoidalLattice, IsLattice and IsStrictMonoidalCategory and IsSymmetricMonoidalCategory );
# =#
InstallTrueMethod( IsLattice, IsSymmetricMonoidalLattice );
InstallTrueMethod( IsStrictMonoidalCategory, IsSymmetricMonoidalLattice );
InstallTrueMethod( IsSymmetricMonoidalCategory, IsSymmetricMonoidalLattice );

#= comment for Julia
InstallTrueMethod( IsSymmetricClosedMonoidalLattice, IsSymmetricMonoidalLattice and IsSymmetricClosedMonoidalCategory );
# =#
InstallTrueMethod( IsSymmetricMonoidalLattice, IsSymmetricClosedMonoidalLattice );
InstallTrueMethod( IsSymmetricClosedMonoidalCategory, IsSymmetricClosedMonoidalLattice );

#= comment for Julia
InstallTrueMethod( IsSymmetricCoclosedMonoidalLattice, IsSymmetricMonoidalLattice and IsSymmetricCoclosedMonoidalCategory );
# =#
InstallTrueMethod( IsSymmetricMonoidalLattice, IsSymmetricCoclosedMonoidalLattice );
InstallTrueMethod( IsSymmetricCoclosedMonoidalCategory, IsSymmetricCoclosedMonoidalLattice );

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
