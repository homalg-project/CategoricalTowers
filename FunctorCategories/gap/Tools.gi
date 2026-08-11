# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

#= comment for Julia
##
InstallOtherMethod( QUO,
        [ IsMatrix, FilterIntersection( IsCapCategory, HasCommutativeSemiringOfLinearCategory ) ],
        
  function ( mat, A )
    
    return HomalgMatrix( mat, CommutativeSemiringOfLinearCategory( A ) ) / A;
    
end );
# =#

##
## Required for Julia: set conjunction-derived lattice/Heyting properties that GAP infers via InstallTrueMethod conjunctions but Julia cannot;
## call on the modeling category of the finite (co)completion before WrapperCategory.
BindGlobal( "ADD_CONJUNCTION_DERIVED_LATTICE_PROPERTIES",
  function ( cat )
    
    ## BicartesianCategories.gi: InstallTrueMethod( IsBicartesianClosedCategory, IsBicartesianCategory and IsCartesianClosedCategory );
    if HasIsBicartesianCategory( cat ) and IsBicartesianCategory( cat ) and
       HasIsCartesianClosedCategory( cat ) and IsCartesianClosedCategory( cat ) then
      #= comment for Julia
      Assert( 0, HasIsBicartesianClosedCategory( cat ), "Expected cat to have IsBicartesianClosedCategory property" );
      # =#
      SetIsBicartesianClosedCategory( cat, true );
    fi;
    
    ## BicartesianCategories.gi: InstallTrueMethod( IsBicartesianCoclosedCategory, IsBicartesianCategory and IsCocartesianCoclosedCategory );
    if HasIsBicartesianCategory( cat ) and IsBicartesianCategory( cat ) and
       HasIsCocartesianCoclosedCategory( cat ) and IsCocartesianCoclosedCategory( cat ) then
      #= comment for Julia
      Assert( 0, HasIsBicartesianCoclosedCategory( cat ), "Expected cat to have IsBicartesianCoclosedCategory property" );
      # =#
      SetIsBicartesianCoclosedCategory( cat, true );
    fi;
    
    ## Lattice.gi: InstallTrueMethod( IsStrictCartesianCategory, IsPosetCategory and IsCartesianCategory );
    if HasIsPosetCategory( cat ) and IsPosetCategory( cat ) and
       HasIsCartesianCategory( cat ) and IsCartesianCategory( cat ) then
      #= comment for Julia
      Assert( 0, HasIsStrictCartesianCategory( cat ), "Expected cat to have IsStrictCartesianCategory property" );
      # =#
      SetIsStrictCartesianCategory( cat, true );
    fi;
    
    ## Lattice.gi: InstallTrueMethod( IsStrictCocartesianCategory, IsPosetCategory and IsCocartesianCategory );
    if HasIsPosetCategory( cat ) and IsPosetCategory( cat ) and
       HasIsCocartesianCategory( cat ) and IsCocartesianCategory( cat ) then
      #= comment for Julia
      Assert( 0, HasIsStrictCocartesianCategory( cat ), "Expected cat to have IsStrictCocartesianCategory property" );
      # =#
      SetIsStrictCocartesianCategory( cat, true );
    fi;
    
    ## Lattice.gi: InstallTrueMethod( IsCartesianProset, IsThinCategory and IsCartesianCategory );
    if HasIsThinCategory( cat ) and IsThinCategory( cat ) and
       HasIsCartesianCategory( cat ) and IsCartesianCategory( cat ) then
      #= comment for Julia
      Assert( 0, HasIsCartesianProset( cat ), "Expected cat to have IsCartesianProset property" );
      # =#
      SetIsCartesianProset( cat, true );
    fi;
    
    ## Lattice.gi: InstallTrueMethod( IsCocartesianProset, IsThinCategory and IsCocartesianCategory );
    if HasIsThinCategory( cat ) and IsThinCategory( cat ) and
       HasIsCocartesianCategory( cat ) and IsCocartesianCategory( cat ) then
      #= comment for Julia
      Assert( 0, HasIsCocartesianProset( cat ), "Expected cat to have IsCocartesianProset property" );
      # =#
      SetIsCocartesianProset( cat, true );
    fi;
    
    ## Lattice.gi: InstallTrueMethod( IsBicartesianProset, IsCartesianProset and IsCocartesianProset );
    if HasIsCartesianProset( cat ) and IsCartesianProset( cat ) and
       HasIsCocartesianProset( cat ) and IsCocartesianProset( cat ) then
      #= comment for Julia
      Assert( 0, HasIsBicartesianProset( cat ), "Expected cat to have IsBicartesianProset property" );
      # =#
      SetIsBicartesianProset( cat, true );
    fi;
    
    ## Lattice.gi: InstallTrueMethod( IsMeetSemiLattice, IsCartesianProset and IsSkeletalCategory );
    if HasIsCartesianProset( cat ) and IsCartesianProset( cat ) and
       HasIsSkeletalCategory( cat ) and IsSkeletalCategory( cat ) then
      #= comment for Julia
      Assert( 0, HasIsMeetSemiLattice( cat ), "Expected cat to have IsMeetSemiLattice property" );
      # =#
      SetIsMeetSemiLattice( cat, true );
    fi;
    
    ## Lattice.gi: InstallTrueMethod( IsJoinSemiLattice, IsCocartesianProset and IsSkeletalCategory );
    if HasIsCocartesianProset( cat ) and IsCocartesianProset( cat ) and
       HasIsSkeletalCategory( cat ) and IsSkeletalCategory( cat ) then
      #= comment for Julia
      Assert( 0, HasIsJoinSemiLattice( cat ), "Expected cat to have IsJoinSemiLattice property" );
      # =#
      SetIsJoinSemiLattice( cat, true );
    fi;
    
    ## Lattice.gi: InstallTrueMethod( IsLattice, IsMeetSemiLattice and IsJoinSemiLattice );
    if HasIsMeetSemiLattice( cat ) and IsMeetSemiLattice( cat ) and
       HasIsJoinSemiLattice( cat ) and IsJoinSemiLattice( cat ) then
      #= comment for Julia
      Assert( 0, HasIsLattice( cat ), "Expected cat to have IsLattice property" );
      # =#
      SetIsLattice( cat, true );
    fi;
    
    ## Lattice.gi: InstallTrueMethod( IsDistributiveBicartesianProset, IsBicartesianProset and IsDistributiveCategory );
    if HasIsBicartesianProset( cat ) and IsBicartesianProset( cat ) and
       HasIsDistributiveCategory( cat ) and IsDistributiveCategory( cat ) then
      #= comment for Julia
      Assert( 0, HasIsDistributiveBicartesianProset( cat ), "Expected cat to have IsDistributiveBicartesianProset property" );
      # =#
      SetIsDistributiveBicartesianProset( cat, true );
    fi;
    
    ## Lattice.gi: InstallTrueMethod( IsDistributiveLattice, IsDistributiveBicartesianProset and IsSkeletalCategory );
    if HasIsDistributiveBicartesianProset( cat ) and IsDistributiveBicartesianProset( cat ) and
       HasIsSkeletalCategory( cat ) and IsSkeletalCategory( cat ) then
      #= comment for Julia
      Assert( 0, HasIsDistributiveLattice( cat ), "Expected cat to have IsDistributiveLattice property" );
      # =#
      SetIsDistributiveLattice( cat, true );
    fi;
    
    ## Lattice.gi: InstallTrueMethod( IsBiHeytingAlgebroid, IsDistributiveBicartesianProset and IsEquivalentToFiniteCategory );
    if HasIsDistributiveBicartesianProset( cat ) and IsDistributiveBicartesianProset( cat ) and
       HasIsEquivalentToFiniteCategory( cat ) and IsEquivalentToFiniteCategory( cat ) then
      #= comment for Julia
      Assert( 0, HasIsBiHeytingAlgebroid( cat ), "Expected cat to have IsBiHeytingAlgebroid property" );
      # =#
      SetIsBiHeytingAlgebroid( cat, true );
    fi;
    
    ## BooleanAlgebra.gi: InstallTrueMethod( IsBiHeytingAlgebra, IsBiHeytingAlgebroid and IsSkeletalCategory );
    if HasIsBiHeytingAlgebroid( cat ) and IsBiHeytingAlgebroid( cat ) and
       HasIsSkeletalCategory( cat ) and IsSkeletalCategory( cat ) then
      #= comment for Julia
      Assert( 0, HasIsBiHeytingAlgebra( cat ), "Expected cat to have IsBiHeytingAlgebra property" );
      # =#
      SetIsBiHeytingAlgebra( cat, true );
    fi;
    
    ## HeytingAlgebra.gi: InstallTrueMethod( IsHeytingAlgebra, IsHeytingAlgebroid and IsSkeletalCategory );
    if HasIsHeytingAlgebroid( cat ) and IsHeytingAlgebroid( cat ) and
       HasIsSkeletalCategory( cat ) and IsSkeletalCategory( cat ) then
      #= comment for Julia
      Assert( 0, HasIsHeytingAlgebra( cat ), "Expected cat to have IsHeytingAlgebra property" );
      # =#
      SetIsHeytingAlgebra( cat, true );
    fi;
    
    ## CoHeytingAlgebra.gi: InstallTrueMethod( IsCoHeytingAlgebra, IsCoHeytingAlgebroid and IsSkeletalCategory );
    if HasIsCoHeytingAlgebroid( cat ) and IsCoHeytingAlgebroid( cat ) and
       HasIsSkeletalCategory( cat ) and IsSkeletalCategory( cat ) then
      #= comment for Julia
      Assert( 0, HasIsCoHeytingAlgebra( cat ), "Expected cat to have IsCoHeytingAlgebra property" );
      # =#
      SetIsCoHeytingAlgebra( cat, true );
    fi;
    
    ## BicartesianCategories.gi: InstallTrueMethod( IsFiniteBicompleteCategory, IsFiniteCompleteCategory and IsFiniteCocompleteCategory );
    if HasIsFiniteCompleteCategory( cat ) and IsFiniteCompleteCategory( cat ) and
       HasIsFiniteCocompleteCategory( cat ) and IsFiniteCocompleteCategory( cat ) then
      #= comment for Julia
      Assert( 0, HasIsFiniteBicompleteCategory( cat ), "Expected cat to have IsFiniteBicompleteCategory property" );
      # =#
      SetIsFiniteBicompleteCategory( cat, true );
    fi;
    
end );
