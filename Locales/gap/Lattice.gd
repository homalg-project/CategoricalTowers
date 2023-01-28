# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Declarations
#

#! @Chapter Lattices

#! Lattices are thin, finite cartesian (and hence finite complete), finite cocartesian (and hence finite cocomplete), skeletal categories.

#! @Section Properties

#! @Description
#!  The property of <A>C</A> being a cartesian proset.
#! @Arguments C
DeclareProperty( "IsCartesianProset",
        IsCapCategory );

AddCategoricalProperty( [ "IsCartesianProset", "IsCocartesianProset" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCartesianProset :=
  DuplicateFreeList( Concatenation(
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsThinCategory,
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCartesianCategory ) );

#! @Description
#!  The property of <A>C</A> being a meet semi-lattice.
#! @Arguments C
DeclareProperty( "IsMeetSemiLattice",
        IsCapCategory );

AddCategoricalProperty( [ "IsMeetSemiLattice", "IsJoinSemiLattice" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsMeetSemiLattice :=
  DuplicateFreeList( Concatenation(
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCartesianProset,
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsPosetCategory ) );

#! @Description
#!  The property of <A>C</A> being a finite cocomplete proset.
#! @Arguments C
DeclareProperty( "IsCocartesianProset",
        IsCapCategory );

AddCategoricalProperty( [ "IsCocartesianProset", "IsCartesianProset" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCocartesianProset :=
  DuplicateFreeList( Concatenation(
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsThinCategory,
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCocartesianCategory ) );

#! @Description
#!  The property of <A>C</A> being a join semi-lattice.
#! @Arguments C
DeclareProperty( "IsJoinSemiLattice",
        IsCapCategory );

AddCategoricalProperty( [ "IsJoinSemiLattice", "IsMeetSemiLattice" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsJoinSemiLattice :=
  DuplicateFreeList( Concatenation(
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCocartesianProset,
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsPosetCategory ) );

#! @Description
#!  The property of <A>C</A> being a finite complete and cocomplete proset.
#! @Arguments C
DeclareProperty( "IsBicartesianProset",
        IsCapCategory );

AddCategoricalProperty( [ "IsBicartesianProset", "IsBicartesianProset" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsBicartesianProset :=
  DuplicateFreeList( Concatenation(
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCartesianProset,
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCocartesianProset ) );

#! @Description
#!  The property of <A>C</A> being a lattice.
#! @Arguments C
DeclareProperty( "IsLattice",
        IsCapCategory );

AddCategoricalProperty( [ "IsLattice", "IsLattice" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsLattice :=
  DuplicateFreeList( Concatenation(
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsMeetSemiLattice,
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsJoinSemiLattice ) );

#! @Description
#!  The property of <A>C</A> being a distributive (and automatically codistributive) bicartesian proset.
#! @Arguments C
DeclareProperty( "IsDistributiveBicartesianProset",
        IsCapCategory );

AddCategoricalProperty( [ "IsDistributiveBicartesianProset", "IsDistributiveBicartesianProset" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsDistributiveBicartesianProset :=
  DuplicateFreeList( Concatenation(
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsBicartesianProset,
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsDistributiveCategory,
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCodistributiveCategory ) );

#! @Description
#!  The property of <A>C</A> being a distributive (and automatically codistributive) lattice.
#! @Arguments C
DeclareProperty( "IsDistributiveLattice",
        IsCapCategory );

AddCategoricalProperty( [ "IsDistributiveLattice", "IsDistributiveLattice" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsDistributiveLattice :=
  DuplicateFreeList( Concatenation(
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsLattice,
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsDistributiveCategory,
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCodistributiveCategory ) );

#! @Description
#!  The property of <A>C</A> being a monoidal lattice.
#! @Arguments C
DeclareProperty( "IsMonoidalLattice",
        IsCapCategory );

AddCategoricalProperty( [ "IsMonoidalLattice", "IsMonoidalLattice" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsMonoidalLattice :=
  DuplicateFreeList( Concatenation(
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsLattice,
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsMonoidalCategory ) );

#! @Description
#!  The property of <A>C</A> being a closed monoidal lattice.
#! @Arguments C
DeclareProperty( "IsClosedMonoidalLattice",
        IsCapCategory );

AddCategoricalProperty( [ "IsClosedMonoidalLattice", "IsCoclosedMonoidalLattice" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsClosedMonoidalLattice :=
  DuplicateFreeList( Concatenation(
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsMonoidalLattice,
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsClosedMonoidalCategory ) );

#! @Description
#!  The property of <A>C</A> being a coclosed monoidal lattice.
#! @Arguments C
DeclareProperty( "IsCoclosedMonoidalLattice",
        IsCapCategory );

AddCategoricalProperty( [ "IsCoclosedMonoidalLattice", "IsClosedMonoidalLattice" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCoclosedMonoidalLattice :=
  DuplicateFreeList( Concatenation(
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsMonoidalLattice,
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsCoclosedMonoidalCategory ) );

#! @Section Attributes

#! @Description
#!  Compute the <Q>factors</Q> of <A>A</A>.
#!  This is a list <A>C</A> with the minimum specification
#!  that <C>DirectProduct</C>(<C>L</C>)=<A>A</A>.
#! @Arguments A
#! @Returns a list
DeclareOperation( "Factors",
        [ IsObjectInThinCategory ] );

#!
DeclareAttribute( "FactorsAttr",
        IsObjectInThinCategory );

#! @Section Operations

#! @Description
#!  The meet <C>DirectProduct</C>(<A>A</A>, <A>B</A>) of <A>A</A> and <A>B</A>.
#! @Arguments A, B
#! @Returns an object in a meet semilattice
DeclareOperation( "\*",
        [ IsObjectInThinCategory, IsObjectInThinCategory ] );

#! @Description
#!  The join <C>Coproduct</C>(<A>A</A>, <A>B</A>) of <A>A</A> and <A>B</A>.
#! @Arguments A, B
#! @Returns an object in a join semilattice
DeclareOperation( "\+",
        [ IsObjectInThinCategory, IsObjectInThinCategory ] );

# @Section Tools

DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_CARTESIAN_PREORDERED_SETS" );
DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_COCARTESIAN_PREORDERED_SETS" );
DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_MEET_SEMILATTICES" );
DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_JOIN_SEMILATTICES" );
DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_LATTICES" );
