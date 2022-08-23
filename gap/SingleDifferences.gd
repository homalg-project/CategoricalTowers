# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Declarations
#

#! @Chapter Meet-semilattice of differences

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of a meet-semilattice of single differences.
DeclareCategory( "IsMeetSemilatticeOfSingleDifferences",
        IsMeetSemilatticeOfDifferences );

#! @Description
#!  The &GAP; category of objects in a meet-semilattice of differences.
#! @Arguments object
DeclareCategory( "IsObjectInMeetSemilatticeOfSingleDifferences",
        IsObjectInMeetSemilatticeOfDifferences );

#! @Description
#!  The &GAP; category of morphisms in a meet-semilattice of differences.
#! @Arguments morphism
DeclareCategory( "IsMorphismInMeetSemilatticeOfSingleDifferences",
        IsMorphismInMeetSemilatticeOfDifferences );

#! @Section Attributes

DeclareAttribute( "PreDistinguishedSubtrahend",
        IsObjectInMeetSemilatticeOfSingleDifferences );

DeclareAttribute( "NormalizedDistinguishedSubtrahend",
        IsObjectInMeetSemilatticeOfSingleDifferences );

DeclareAttribute( "PrePairInUnderlyingLattice",
        IsObjectInMeetSemilatticeOfSingleDifferences, "mutable" );

CapJitAddTypeSignature( "PrePairInUnderlyingLattice", [ IsObjectInMeetSemilatticeOfSingleDifferences ], function ( input_types )
    
    Assert( 0, IsMeetSemilatticeOfSingleDifferences( input_types[1].category ) );
    
    return rec( filter := IsNTuple,
                element_types :=
                [ CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) ),
                  CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) ) ] );
    
end );

DeclareAttribute( "NormalizedPairInUnderlyingHeytingOrCoHeytingAlgebra",
        IsObjectInMeetSemilatticeOfSingleDifferences, "mutable" );

DeclareAttribute( "StandardPairInUnderlyingHeytingOrCoHeytingAlgebra",
        IsObjectInMeetSemilatticeOfSingleDifferences, "mutable" );

#! @Section Operations

#! @Description
#!  A morphism in the underlying lattice representing the formal single difference <A>A</A>.
#! @Arguments A
#! @Returns a pair of objects in a thin category
DeclareOperation( "PairInUnderlyingLattice",
        [ IsObjectInMeetSemilatticeOfSingleDifferences ] );

CapJitAddTypeSignature( "PairInUnderlyingLattice", [ IsObjectInMeetSemilatticeOfSingleDifferences ], function ( input_types )
    
    Assert( 0, IsMeetSemilatticeOfSingleDifferences( input_types[1].category ) );
    
    return rec( filter := IsList,
                element_type := CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( input_types[1].category ) ) );
    
end );

#! @Description
#!  The output <C>S</C> should satisfy <A>A</A>.I - <C>S</C> = <A>A</A>.
#!  The standard method returns <C>NormalizedDistinguishedSubtrahend</C>( <A>A</A> )
#!  if <C>HasNormalizedDistinguishedSubtrahend</C>( <A>A</A> ) = <C>true</C> or
#!  <C>PreDistinguishedSubtrahend</C>( <A>A</A> )
#!  if <C>HasPreDistinguishedSubtrahend</C>( <A>A</A> ) = <C>true</C>.
#!  The remaining behavior is unspecified.
#! @Arguments A
#! @Returns an object in a thin category
DeclareOperation( "DistinguishedSubtrahend",
        [ IsObjectInMeetSemilatticeOfSingleDifferences ] );

#! @Section Constructors

#! @Description
#!  Construct the meet-semilattice of differences from the lattice <A>L</A>.
#! @Arguments L
#! @Returns a &CAP; category
DeclareAttribute( "MeetSemilatticeOfDifferences",
        IsCapCategory );

#! @Description
#!  Form the formal single difference object <A>A</A> - <A>B</A>.
#!  The expression <A>A</A> - 0 := <A>A</A> - <C>InitialObject</C>( <C>CapCategory</C>( <A>A</A> ) ).
#!  The expression - <A>A</A> := <C>TerminalObject</C>( <C>CapCategory</C>( <A>A</A> ) ) - <A>A</A>.
#! @Group FormalDifference
#! @Arguments A, B
DeclareOperation( "\-",
        [ IsObjectInThinCategory, IsObjectInThinCategory ] );

DeclareOperation( "\-",
        [ IsObjectInThinCategory, IsInt ] );

DeclareOperation( "AdditiveInverseMutable",
        [ IsObjectInThinCategory ] );

#! @Description
#!  <C>FormalDifferenceOfNormalizedObjects</C> assumes that <A>A</A> and <A>B</A>
#!  are <Q>normalized</Q>
#! @Arguments u
#! @Group FormalDifference
DeclareOperation( "FormalDifferenceOfNormalizedObjects",
        [ IsObjectInThinCategory, IsObjectInThinCategory ] );
